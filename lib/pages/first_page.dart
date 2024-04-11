import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:srsp4/constants/text_style.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isConnected = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 30,
                color: Colors.white,
              ),
              Text(
                'Account_123',
                style: Textaccount.account,
              )
            ],
          ),
          Image.asset("assets/images/myphoto.jpg"),
          Row(
            children: [
              LikeButton(
                size: 30,
                animationDuration: const Duration(milliseconds: 900),
                likeBuilder: (isLiked) {
                  if (isLiked) {
                    return const Icon(
                      Icons.thumb_up_alt_rounded,
                      size: 30,
                      color: Colors.red,
                    );
                  }
                  if (!isLiked) {
                    return const Icon(
                      Icons.thumb_up_off_alt_outlined,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  return null;
                },
              ),
              const Spacer(),
              LikeButton(
                size: 30,
                animationDuration: const Duration(milliseconds: 900),
                likeBuilder: (isLiked) {
                  if (isLiked) {
                    return const Icon(
                      Icons.bookmark,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  if (!isLiked) {
                    return const Icon(
                      Icons.bookmark_outline,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          const Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 30,
                color: Colors.white,
              ),
              Text(
                'Account_124',
                style: Textaccount.account,
              )
            ],
          ),
          Image.network(
            "https://d2zp5xs5cp8zlg.cloudfront.net/image-83814-800.jpg",
            fit: BoxFit.cover,
            loadingBuilder: (context, child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                );
              }
            },
          ),
          Row(
            children: [
              LikeButton(
                size: 30,
                animationDuration: const Duration(milliseconds: 900),
                likeBuilder: (isLiked) {
                  if (isLiked) {
                    return const Icon(
                      Icons.thumb_up_alt_rounded,
                      size: 30,
                      color: Colors.red,
                    );
                  }
                  if (!isLiked) {
                    return const Icon(
                      Icons.thumb_up_off_alt_outlined,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  return null;
                },
              ),
              const Spacer(),
              LikeButton(
                size: 30,
                animationDuration: const Duration(milliseconds: 900),
                likeBuilder: (isLiked) {
                  if (isLiked) {
                    return const Icon(
                      Icons.bookmark,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  if (!isLiked) {
                    return const Icon(
                      Icons.bookmark_outline,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 30,
                color: Colors.white,
              ),
              Text(
                'Account_125',
                style: Textaccount.account,
              )
            ],
          ),
          Image.network(
            "https://uploads-ssl.webflow.com/5f3c19f18169b62a0d0bf387/60d33be8cf4ba7565123c8bc_YPD3ulQQAGQpOcnqIm3QzSTRgzmr1SexpW9ZjMpJ1mAnUxx4iF05XOTu44sk0qQG-8XgBcYmGZGAD-5SAZvJl3TjtmhgWnn-w0C2XKwhBscV78RVvhwZfyp0v_Pa6sNj5zxpOvRW.png",
            fit: BoxFit.cover,
            loadingBuilder: (context, child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                );
              }
            },
          ),
          Row(
            children: [
              LikeButton(
                size: 30,
                animationDuration: const Duration(milliseconds: 900),
                likeBuilder: (isLiked) {
                  if (isLiked) {
                    return const Icon(
                      Icons.thumb_up_alt_rounded,
                      size: 30,
                      color: Colors.red,
                    );
                  }
                  if (!isLiked) {
                    return const Icon(
                      Icons.thumb_up_off_alt_outlined,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  return null;
                },
              ),
              const Spacer(),
              LikeButton(
                size: 30,
                animationDuration: const Duration(milliseconds: 900),
                likeBuilder: (isLiked) {
                  if (isLiked) {
                    return const Icon(
                      Icons.bookmark,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  if (!isLiked) {
                    return const Icon(
                      Icons.bookmark_outline,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Row(children: [
            Icon(
              Icons.account_circle,
              size: 30,
              color: Colors.white,
            ),
            Text(
              'Account_126',
              style: Textaccount.account,
            )
          ]),
          Image.network(
            "https://uploads-ssl.webflow.com/5f3c19f18169b62a0d0bf387/60d33be9ea3ab2738bf56e0d_rO0ikUo-hnDwgg9SOQOCEGZGVmnMAzwWIdeUhraC6yoIUcPu6rOs3p9MojWC-BrpT2rqCTxRNg8WKl8cJYlgpScy91C25V0qV-DOnjRsv_FzYGY_6MrLFzNtCjXcTtN7x6-b4T1b.png",
            fit: BoxFit.cover,
            loadingBuilder: (context, child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                );
              }
            },
          ),
          Row(
            children: [
              LikeButton(
                size: 30,
                animationDuration: const Duration(milliseconds: 900),
                likeBuilder: (isLiked) {
                  if (isLiked) {
                    return const Icon(
                      Icons.thumb_up_alt_rounded,
                      size: 30,
                      color: Colors.red,
                    );
                  }
                  if (!isLiked) {
                    return const Icon(
                      Icons.thumb_up_off_alt_outlined,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  return null;
                },
              ),
              const Spacer(),
              LikeButton(
                size: 30,
                animationDuration: const Duration(milliseconds: 900),
                likeBuilder: (isLiked) {
                  if (isLiked) {
                    return const Icon(
                      Icons.bookmark,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  if (!isLiked) {
                    return const Icon(
                      Icons.bookmark_outline,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Row(
            children: [
              Icon(
                Icons.account_circle,
                size: 30,
                color: Colors.white,
              ),
              Text(
                'Account_127',
                style: Textaccount.account,
              )
            ],
          ),
          Image.network(
            "https://uploads-ssl.webflow.com/5f3c19f18169b62a0d0bf387/60d33bec95b39b4f2f1664eb_uFzJ2V9SG3VetDRh4tXkrtS1KqrppSecA7Quaw5sNKAxgCUXoaLUIMvKf6bcoXrpnwt43ugG5onRDKL7FnUPbCBaGDM1nuatJk3JvOtsL6PbTJpv6TzD9C2MERYd7hOWfkJjQSme.png",
            fit: BoxFit.cover,
            loadingBuilder: (context, child, ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                    valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                );
              }
            },
          ),
          Row(
            children: [
              LikeButton(
                size: 30,
                animationDuration: const Duration(milliseconds: 900),
                likeBuilder: (isLiked) {
                  if (isLiked) {
                    return const Icon(
                      Icons.thumb_up_alt_rounded,
                      size: 30,
                      color: Colors.red,
                    );
                  }
                  if (!isLiked) {
                    return const Icon(
                      Icons.thumb_up_off_alt_outlined,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  return null;
                },
              ),
              const Spacer(),
              LikeButton(
                size: 30,
                animationDuration: const Duration(milliseconds: 900),
                likeBuilder: (isLiked) {
                  if (isLiked) {
                    return const Icon(
                      Icons.bookmark,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  if (!isLiked) {
                    return const Icon(
                      Icons.bookmark_outline,
                      size: 30,
                      color: Colors.white,
                    );
                  }
                  return null;
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
