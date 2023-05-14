Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 225A6701CD2
	for <lists+alsa-devel@lfdr.de>; Sun, 14 May 2023 12:08:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 503B6A4E;
	Sun, 14 May 2023 12:08:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 503B6A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684058936;
	bh=jUdi+bjLpXX0sXZCZ4VSWUt2zrpDMrCECVJmXd0pMS4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=SQJ29scZhcQGs6tpdupi0iATV/SYo1Ib99Lyn41W2Ly1PeDWSC1V09SuNkfLNLzi0
	 iVxzHcAfXQRaeKEQs87EbM18B9h/AnrpqM+3IZFlH442l65xxWTG7QZx3aZXU5iu2m
	 DAY+xt/SiIRovEKHg7Emjc60HozB+mgFAE+Fa0U4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 707CCF80544; Sun, 14 May 2023 12:08:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DAADF8025A;
	Sun, 14 May 2023 12:08:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 267D3F80272; Sun, 14 May 2023 12:08:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A5D8F80087
	for <alsa-devel@alsa-project.org>; Sun, 14 May 2023 12:07:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A5D8F80087
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1684058875952578545-webhooks-bot@alsa-project.org>
References: <1684058875952578545-webhooks-bot@alsa-project.org>
Subject: 16-bit rate conversion broken with non-interleaved output
Message-Id: <20230514100801.267D3F80272@alsa1.perex.cz>
Date: Sun, 14 May 2023 12:08:01 +0200 (CEST)
Message-ID-Hash: BNV7CZO4TTOBC3LWHXXFS2SOBAP7CC7W
X-Message-ID-Hash: BNV7CZO4TTOBC3LWHXXFS2SOBAP7CC7W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BNV7CZO4TTOBC3LWHXXFS2SOBAP7CC7W/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #320 was opened from ossilator:

this setup:
```
Plug PCM: Rate conversion PCM (44100, sformat=S16_LE)
Converter: libspeex (external)
Protocol version: 10003
Its setup is:
  stream       : PLAYBACK
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 48000
  exact rate   : 48000 (48000/1)
  msbits       : 16
  buffer_size  : 17832
  period_size  : 4458
  period_time  : 92879
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 4458
  period_event : 0
  start_threshold  : 17832
  stop_threshold   : 17832
  silence_threshold: 0
  silence_size : 0
  boundary     : 5019261784704417792
Slave: Hardware PCM card 0 'E-MU 0404b PCI [MAEM8852]' device 3 subdevice 0
Its setup is:
  stream       : PLAYBACK
  access       : MMAP_NONINTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 44100
  exact rate   : 44100 (44100/1)
  msbits       : 16
  buffer_size  : 16384
  period_size  : 4096
  period_time  : 92879
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 4096
  period_event : 0
  start_threshold  : 16384
  stop_threshold   : 16384
  silence_threshold: 0
  silence_size : 0
  boundary     : 4611686018427387904
  appl_ptr     : 0
  hw_ptr       : 0
```
garbles the output rather impressively, though it's still recognizable as the input, more or less.

it happens both when up-sampling and down-sampling. it doesn't happen when not re-sampling.

it doesn't happen when the hardware takes 32-bit samples, so i guess it's somewhere in the optimized s16 paths.

it doesn't happen with mono.

this is not reproducible with the upstream emu10k1 driver, as the multichannel device demands 16 channels, which causes the route conversion plugin to be inserted, which sidesteps the issue. and the regular pcm device accepts any rate.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/320
Repository URL: https://github.com/alsa-project/alsa-lib
