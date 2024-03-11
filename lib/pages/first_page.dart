import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:srsp4/constants/text_style.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
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
                    return null;
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
        ],
      ),
    );
  }
}
