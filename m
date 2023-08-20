Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7483B781D29
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 11:25:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 677CE20C;
	Sun, 20 Aug 2023 11:24:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 677CE20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692523535;
	bh=rpAgn+B2DT0Eg7urlgq4RDgsa2JgveuXh9FGufazzKE=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=HLLreH0Hiubjj+Zw1xHSkSamfB8+lVq1nJBe4s7RhonlPvQGk6heJLuUlP0KLs1L0
	 H0U2X26DEPfSzyqwk67FG8NvtdWzw/PGNzcH1lXit863AmdcyyV8ca8/1zURtEf/5k
	 +CM5hzzNjeQR1h393v8MtcBhjeiivm5tPYNwSZy0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E8422F80199; Sun, 20 Aug 2023 11:24:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9181DF8016C;
	Sun, 20 Aug 2023 11:24:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 556DDF80199; Sun, 20 Aug 2023 11:24:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 31AEEF80027
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 11:24:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 31AEEF80027
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1692523475803876162-webhooks-bot@alsa-project.org>
References: <1692523475803876162-webhooks-bot@alsa-project.org>
Subject: A potential Integer Overflow bug found in aplay/aplay.c
Message-Id: <20230820092440.556DDF80199@alsa1.perex.cz>
Date: Sun, 20 Aug 2023 11:24:40 +0200 (CEST)
Message-ID-Hash: BGZF7SPMLAZWXY77JNF7THBAMXSGAFXQ
X-Message-ID-Hash: BGZF7SPMLAZWXY77JNF7THBAMXSGAFXQ
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BGZF7SPMLAZWXY77JNF7THBAMXSGAFXQ/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-utils issue #231 was opened from cascades-sjtu:

Hi, I'm currently trying to use the static analysis tool [Infer](https://fbinfer.com) to find uncatched API-misuse bugs in OpenWrt packages, and I find a potential Integer Overflow  in your project, version 1.2.9.

The bug located in aplay/aplay.c. Firstly, the program tries to write the remains bytes in `audiobuf` with the length of `loaded` in line 2865, and `loaded` is later used as the parameter for `safe_read` in the loop, then `loaded` is used as the 2nd argument of `pct_write()` and finally after a multiply operation, it is used as the size of Malloc in `remap_data()`, as shown in the following code:

```cpp
static void playback_go(int fd, size_t loaded, off_t count, int rtype, char *name)
{
int l, r;
off_t written = 0;
off_t c;

header(rtype, name);
set_params();

while (loaded > chunk_bytes && written < count && !in_aborting) {
	if (pcm_write(audiobuf + written, chunk_size) <= 0)
		return;
	written += chunk_bytes;
	loaded -= chunk_bytes;
}
if (written > 0 && loaded > 0)
	memmove(audiobuf, audiobuf + written, loaded);

l = loaded;
while (written < count && !in_aborting) {
	do {
		c = count - written;
		if (c > chunk_bytes)
			c = chunk_bytes;

		/* c < l, there is more data loaded
			* then we actually need to write
			*/
		if (c < l)
			l = c;

		c -= l;

		if (c == 0)
			break;
		r = safe_read(fd, audiobuf + l, c);
		if (r < 0) {
			perror(name);
			prg_exit(EXIT_FAILURE);
		}
		fdcount += r;
		if (r == 0)
			break;
		l += r;
	} while ((size_t)l < chunk_bytes);
	l = l * 8 / bits_per_frame;
	r = pcm_write(audiobuf, l);
	if (r != l)
		break;
	r = r * bits_per_frame / 8;
	written += r;
	l = 0;
}
if (!in_aborting) {
	snd_pcm_nonblock(handle, 0);
	snd_pcm_drain(handle);
	snd_pcm_nonblock(handle, nonblock);
}
}

# in remap_data()
chunk_bytes = count * bits_per_frame / 8;
if (tmp_size < chunk_bytes) {
	free(tmp);
	tmp = malloc(chunk_bytes);
	if (!tmp) {
		error(_("not enough memory"));
		exit(1);
	}
	tmp_size = count;
}
```

The parameter passed to Malloc may be overflowed so that the actual allocated memory is small. 

I also attached the analysis trace given by Infer FYI:

```json
        "trace": [
          {
            "file": "aplay/aplay.c",
            "line": 940,
            "col": 14,
            "feature": [ "Input", "read" ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 940,
            "col": 14,
            "feature": [ "Input", "read" ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2865,
            "col": 21,
            "feature": [
              "Prune",
              [
                "UnOp",
                "!",
                [
                  "BinOp",
                  ">",
                  [ "Var" ],
                  [ "Cast", [ "Unsupported" ], [ "Const", [ "Cint", 0 ] ] ]
                ]
              ]
            ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2868,
            "col": 2,
            "feature": [ "Store", [ "Var" ], [ "Var" ] ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2878,
            "col": 8,
            "feature": [
              "Prune",
              [ "UnOp", "!", [ "BinOp", "<", [ "Var" ], [ "Var" ] ] ]
            ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2871,
            "col": 4,
            "feature": [
              "Store",
              [ "Var" ],
              [ "BinOp", "-", [ "Var" ], [ "Var" ] ]
            ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2872,
            "col": 8,
            "feature": [
              "Prune",
              [
                "UnOp",
                "!",
                [
                  "BinOp",
                  ">",
                  [ "Cast", [ "Unsupported" ], [ "Var" ] ],
                  [ "Var" ]
                ]
              ]
            ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2878,
            "col": 8,
            "feature": [ "Prune", [ "BinOp", "<", [ "Var" ], [ "Var" ] ] ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2879,
            "col": 5,
            "feature": [ "Store", [ "Var" ], [ "Var" ] ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2899,
            "col": 3,
            "feature": [
              "Store",
              [ "Var" ],
              [
                "BinOp",
                "/",
                [
                  "BinOp",
                  "*",
                  [ "Cast", [ "Unsupported" ], [ "Var" ] ],
                  [ "Var" ]
                ],
                [ "Cast", [ "Unsupported" ], [ "Const", [ "Cint", 8 ] ] ]
              ]
            ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2900,
            "col": 3,
            "feature": [
              "Store",
              [ "Var" ],
              [ "BinOp", "+", [ "Var" ], [ "Var" ] ]
            ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2871,
            "col": 4,
            "feature": [
              "Store",
              [ "Var" ],
              [ "BinOp", "-", [ "Var" ], [ "Var" ] ]
            ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2872,
            "col": 8,
            "feature": [
              "Prune",
              [
                "UnOp",
                "!",
                [
                  "BinOp",
                  ">",
                  [ "Cast", [ "Unsupported" ], [ "Var" ] ],
                  [ "Var" ]
                ]
              ]
            ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2878,
            "col": 8,
            "feature": [ "Prune", [ "BinOp", "<", [ "Var" ], [ "Var" ] ] ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2879,
            "col": 5,
            "feature": [ "Store", [ "Var" ], [ "Var" ] ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2895,
            "col": 3,
            "feature": [
              "Store",
              [ "Var" ],
              [
                "BinOp",
                "/",
                [
                  "Cast",
                  [ "Unsupported" ],
                  [ "BinOp", "*", [ "Var" ], [ "Const", [ "Cint", 8 ] ] ]
                ],
                [ "Var" ]
              ]
            ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2896,
            "col": 7,
            "feature": [ "Call", "pcm_write" ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2126,
            "col": 6,
            "feature": [
              "Prune",
              [ "UnOp", "!", [ "BinOp", "<", [ "Var" ], [ "Var" ] ] ]
            ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2130,
            "col": 9,
            "feature": [ "Call", "remap_data" ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2069,
            "col": 2,
            "feature": [
              "Store",
              [ "Var" ],
              [
                "BinOp",
                "/",
                [ "BinOp", "*", [ "Var" ], [ "Var" ] ],
                [ "Cast", [ "Unsupported" ], [ "Const", [ "Cint", 8 ] ] ]
              ]
            ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2070,
            "col": 6,
            "feature": [ "Prune", [ "BinOp", "<", [ "Var" ], [ "Var" ] ] ]
          },
          {
            "file": "aplay/aplay.c",
            "line": 2072,
            "col": 9,
            "feature": [ "IntOverflow", "malloc", [ "Var" ] ]
          }
        ],
```

Issue URL     : https://github.com/alsa-project/alsa-utils/issues/231
Repository URL: https://github.com/alsa-project/alsa-utils
