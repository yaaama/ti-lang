import Graphics.Gloss
import Data.List
import Debug.Trace
import System.IO
import System.Environment (getArgs)

type Cell = (Int,Int)

minViewPortSize = 100
maxViewPortSize = 750
defaultCellSize = 10

windowDisplay :: Int -> Display
windowDisplay viewPortSize = InWindow "Tile Viewer" (viewPortSize,viewPortSize) (20,20)

background :: Color
background = white

-- Assumes a tile is a square
drawTile :: Int -> [String] -> Picture
drawTile _ [] = Blank
drawTile viewPortSize tile = pictures $ map (\cell -> squareAt cellSize cell) cells
   where cellSize = fromIntegral(viewPortSize) / fromIntegral ((length tile))
         cells =  tile2cells tile
         -- Drawing code for an individual square of the appropriate size at the given col/row
         squareAt :: Float -> Cell ->  Picture
         squareAt cellSize (x,y) = polygon [ p1,p2,p3,p4 ]
            where p1 = cell2Point cellSize (x,y)
                  p2 = ( fst p1 + cellSize , snd p1 )
                  p3 = ( fst p2 , snd p2 - cellSize )
                  p4 = ( fst p1 , snd p3 )  
         -- Converts col/row coordinates to window coordinates offset from top-left
         cell2Point :: Float -> Cell -> Point 
         cell2Point cellSize (x,y) = (xP,yP)
            where xP = fst topLeft + (fromIntegral x) * cellSize
                  yP = snd topLeft - (fromIntegral y) * cellSize
         --origin (0,0) is centre of the window
         --this is the top-left corner
         topLeft :: Point 
         topLeft = (negate half, half)
            where half = (fromIntegral viewPortSize) / 2

--Finds the indexes at which the Tile value contains '1'
tile2cells :: [String] -> [Cell]
tile2cells tile = makeCells 0 idxss 
   where idxss = map (findIndices (\c -> c=='1')) tile 
         makeCells row [] = []
         makeCells row (idxs : idxss) = (map (\col -> (col,row)) idxs) ++ (makeCells (row+1) idxss)

-- Checks that input string only contains 0s and 1s
checkInput :: Char -> Bool
checkInput '0' = True
checkInput '1' = True
checkInput   _ = error "Unrecognised characted in input file"

main :: IO ()
main = do (fileName : _ ) <- getArgs
          tileString <- readFile fileName
          let tile = lines tileString
          let _ = map (map checkInput) tile
          let vPSize = max minViewPortSize ( min maxViewPortSize ( defaultCellSize * (length tile)))
          display (windowDisplay vPSize) background (drawTile vPSize tile)