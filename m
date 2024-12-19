Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 144169F79AF
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Dec 2024 11:37:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6821360287;
	Thu, 19 Dec 2024 11:37:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6821360287
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1734604646;
	bh=+QKKAB2k0eefKpMZun9ga8X5W+D1ohHVYSRn5KO5uXo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=avJfkL6zm2C5bxkGNUZ0h+mhVBRLymquPKjp3Kmzc/wa6sdMpLPMTh3Z1/aCWrUJ+
	 HqH11atwpJ1mPkHqBEFWKc9W6GhZUsYaXDkra3O0BdQDsAzRoJyoP8e9THDQQA+jsI
	 W44nIDjpRUvZGQzrdHzg8L0XfxBJ+f+a/2YSqw6g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EFA49F805BF; Thu, 19 Dec 2024 11:36:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E046FF805BE;
	Thu, 19 Dec 2024 11:36:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CAA4F8020D; Thu, 19 Dec 2024 11:36:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,MISSING_DATE,
	MISSING_MID,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,SPF_HELO_NONE,SPF_PASS shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi2259423.contaboserver.net
 [45.14.194.44])
	by alsa1.perex.cz (Postfix) with ESMTP id 01F50F800D2
	for <alsa-devel@alsa-project.org>; Thu, 19 Dec 2024 11:36:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 01F50F800D2
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1734604602969381809-webhooks-bot@alsa-project.org>
References: <1734604602969381809-webhooks-bot@alsa-project.org>
Subject: snd_pcm_writei() takes to much time to write data
Message-Id: <20241219103644.9CAA4F8020D@alsa1.perex.cz>
Date: Thu, 19 Dec 2024 11:36:44 +0100 (CET)
Message-ID-Hash: SX6TXSRA3KCMCMMCOHDLMXMO2MEPBOMY
X-Message-ID-Hash: SX6TXSRA3KCMCMMCOHDLMXMO2MEPBOMY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SX6TXSRA3KCMCMMCOHDLMXMO2MEPBOMY/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #428 was edited from nnamera:

I am using the ALSA open-source library to read and write audio data for my project. To write audio data, I am calling the snd_pcm_writei function. Initially, it works as expected, but after writing 2-3 frames, the function starts taking significantly more time (around 1 second) to complete.

Normally, snd_pcm_writei should execute within 1-3 ms, but this delay is affecting my application's overall performance, causing audio chopping issues.

Here are the details of my setup:

Frame size: ~8000 bytes (writing 8000 bytes per call)

Plug PCM: Route conversion PCM (sformat=S16_LE)
  Transformation table:
    0 <- 0
    1 <- 0
Its setup is:
  stream       : PLAYBACK
  access       : RW_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 1
  rate         : 8000
  exact rate   : 8000 (8000/1)
  msbits       : 16
  buffer_size  : 4000
  period_size  : 1000
  period_time  : 125000
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 1000
  period_event : 0
  start_threshold  : 4000
  stop_threshold   : 4000
  silence_threshold: 0
  silence_size : 0
  boundary     : 9007199254740992000
Slave: Soft volume PCM
Control: amba-playback
min_dB: -20
max_dB: 20
resolution: 256
Its setup is:
  stream       : PLAYBACK
  access       : MMAP_INTERLEAVED
  format       : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 8000
  exact rate   : 8000 (8000/1)
  msbits       : 16
  buffer_size  : 4000
  period_size  : 1000
  period_time  : 125000
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 1000
  period_event : 0
  start_threshold  : 4000
  stop_threshold   : 4000
  silence_threshold: 0
  silence_size : 0
  boundary     : 9007199254740992000
Slave: Hardware PCM card 0 'es8389' device 0 subdevice 0
Its setup is:
  stream       : PLAYBACK
  access       : MMAP_INTERLEAV[   22.206911] ambarella-i2c e400a000.i2c: No ACK from address 0x6c, 0:0!
ED
  format    [   22.214533] os04c10: probe of 2-0001 failed with error -5
   : S16_LE
  subformat    : STD
  channels     : 2
  rate         : 8000
  exact rate   : 8000 (8000/1)
  msbits       : 16
  buffer_size  : 4000
  period_size  : 1000
  period_time  : 125000
  tstamp_mode  : NONE
  tstamp_type  : MONOTONIC
  period_step  : 1
  avail_min    : 1000
  period_event : 0
  start_threshold  : 4000
  stop_threshold   : 4000
  silence_threshold: 0
  silence_size : 0
  boundary     : 9007199254740992000
  appl_ptr     : 0
  hw_ptr       : 0

I would appreciate any guidance or suggestions on why this delay is happening and how I can resolve it. Let me know if you need any additional details or logs.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/428
Repository URL: https://github.com/alsa-project/alsa-lib
