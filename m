Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63625877686
	for <lists+alsa-devel@lfdr.de>; Sun, 10 Mar 2024 13:03:59 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 607E9A4A;
	Sun, 10 Mar 2024 13:03:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 607E9A4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710072238;
	bh=h9rBU1Cr2nCR8lgfMhBiRtYuiC8jJ5Y94RcY1+VVvW0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=U2maRICBhRePXUquhD1u3Rj3bQwnrcFGAer43eJkNU84kh+s3FA18Zq8wekm5Mgz7
	 qgZPc58lXNH1oIzWn61h+E2iNufaDxP7OVcwn6zlL1GSl2siFTq8waUdmQC66TjpYV
	 hLReJluNfMlhsXkfiVZMInTTugb1MUnbsPX1Txv4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 862E9F80093; Sun, 10 Mar 2024 13:03:37 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F899F805A1;
	Sun, 10 Mar 2024 13:03:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 13A0EF8028D; Sun, 10 Mar 2024 13:00:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 602FFF80093
	for <alsa-devel@alsa-project.org>; Sun, 10 Mar 2024 13:00:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 602FFF80093
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1710072000713679790-webhooks-bot@alsa-project.org>
References: <1710072000713679790-webhooks-bot@alsa-project.org>
Subject: alsa-plugins-1.2.7.1 fails to compile against latest ffmpeg git
Message-Id: <20240310120009.13A0EF8028D@alsa1.perex.cz>
Date: Sun, 10 Mar 2024 13:00:09 +0100 (CET)
Message-ID-Hash: MJK6YNCHEWU6XOM4DWN32EX7OPTFFB6B
X-Message-ID-Hash: MJK6YNCHEWU6XOM4DWN32EX7OPTFFB6B
X-MailFrom: github@alsa-project.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MJK6YNCHEWU6XOM4DWN32EX7OPTFFB6B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-plugins issue #57 was opened from jospezial:

```
libtool: compile:  x86_64-pc-linux-gnu-gcc -m32 -mfpmath=sse -DHAVE_CONFIG_H -I. -I/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52 -I.. -DNDEBUG -Wall -g -march=native -mtune=native -O2 -pipe -c /var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c  -fPIC -DPIC -o .libs/pcm_a52.o
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c: In function 'a52_free':
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:631:17: warning: 'avcodec_close' is deprecated [-Wdeprecated-declarations]
  631 |                 avcodec_close(rec->avctx);
      |                 ^~~~~~~~~~~~~
In file included from /var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:28:
/usr/include/libavcodec/avcodec.h:2374:5: note: declared here
 2374 | int avcodec_close(AVCodecContext *avctx);
      |     ^~~~~~~~~~~~~
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c: In function 'set_channel_layout':
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:672:29: error: 'AVCodecContext' has no member named 'channel_layout'; did you mean 'ch_layout'?
  672 |                 rec->avctx->channel_layout = AV_CH_LAYOUT_STEREO;
      |                             ^~~~~~~~~~~~~~
      |                             ch_layout
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:675:29: error: 'AVCodecContext' has no member named 'channel_layout'; did you mean 'ch_layout'?
  675 |                 rec->avctx->channel_layout = AV_CH_LAYOUT_QUAD;
      |                             ^~~~~~~~~~~~~~
      |                             ch_layout
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:678:29: error: 'AVCodecContext' has no member named 'channel_layout'; did you mean 'ch_layout'?
  678 |                 rec->avctx->channel_layout = AV_CH_LAYOUT_5POINT1;
      |                             ^~~~~~~~~~~~~~
      |                             ch_layout
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c: In function 'alloc_input_buffer':
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:698:19: error: 'AVFrame' has no member named 'channels'
  698 |         rec->frame->channels = rec->avctx->channels;
      |                   ^~
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:698:42: error: 'AVCodecContext' has no member named 'channels'
  698 |         rec->frame->channels = rec->avctx->channels;
      |                                          ^~
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:699:21: error: 'AVFrame' has no member named 'channel_layout'; did you mean 'ch_layout'?
  699 |         rec->frame->channel_layout = rec->avctx->channel_layout;
      |                     ^~~~~~~~~~~~~~
      |                     ch_layout
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:699:50: error: 'AVCodecContext' has no member named 'channel_layout'; did you mean 'ch_layout'?
  699 |         rec->frame->channel_layout = rec->avctx->channel_layout;
      |                                                  ^~~~~~~~~~~~~~
      |                                                  ch_layout
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c: In function 'a52_prepare':
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:734:19: error: 'AVCodecContext' has no member named 'channels'
  734 |         rec->avctx->channels = io->channels;
      |                   ^~
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c: In function '_snd_pcm_a52_open':
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:1124:28: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
 1124 |                 rec->codec = avcodec_find_encoder_by_name(avcodec);
      |                            ^
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:1126:28: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
 1126 |                 rec->codec = avcodec_find_encoder_by_name("ac3_fixed");
      |                            ^
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:1128:36: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
 1128 |                         rec->codec = avcodec_find_encoder_by_name("ac3");
      |                                    ^
/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1/a52/pcm_a52.c:1131:28: warning: assignment discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
 1131 |                 rec->codec = avcodec_find_encoder(AV_CODEC_ID_AC3);
      |                            ^
make[2]: *** [Makefile:469: pcm_a52.lo] Error 1
make[2]: Leaving directory '/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1-abi_x86_32.x86/a52'
make[1]: *** [Makefile:445: all-recursive] Error 1
make[1]: Leaving directory '/var/tmp/portage/media-plugins/alsa-plugins-1.2.7.1-r1/work/alsa-plugins-1.2.7.1-abi_x86_32.x86'
make: *** [Makefile:377: all] Error 2
 * ERROR: media-plugins/alsa-plugins-1.2.7.1-r1::gentoo failed (compile phase):
 *   emake failed
```

Issue URL     : https://github.com/alsa-project/alsa-plugins/issues/57
Repository URL: https://github.com/alsa-project/alsa-plugins
