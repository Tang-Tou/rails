import { library, dom } from '@fortawesome/fontawesome-svg-core'
import { 
  faUserAstronaut, 
  faStore 
} from '@fortawesome/free-solid-svg-icons'



// 把套件 import 進來

library.add(
  faUserAstronaut, 
  faStore
  )  // 把套件加進 library

dom.watch()  // 掃描整個畫面，有用到 library 的都渲染

// 注意 icon 的大小寫