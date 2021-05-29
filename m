Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E83B7394D9B
	for <lists+alsa-devel@lfdr.de>; Sat, 29 May 2021 20:01:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E05316C6;
	Sat, 29 May 2021 20:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E05316C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622311289;
	bh=1M0J+qNRQ4LlsU6p1wBvm5hAuqUgdMMMuEn3IiI4iHU=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lb6b1FRUlRxjL9W7KKN5FWRguqSeshvtNsxr++9uo8Wg+FVa6Rs8NzAKWcLFkF/L0
	 AAiMVcBpKQKZTissUM6OApGvANPam9iA/PegWhamXj+DhPFA55SlJfW7k25NNm++Cq
	 EclTEIfT30rnMnwSl6GyvvZDL8UZN0KfhjwQj8D0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4BCFFF804B3;
	Sat, 29 May 2021 20:00:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42347F80302; Sat, 29 May 2021 20:00:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 5964CF80302
 for <alsa-devel@alsa-project.org>; Sat, 29 May 2021 20:00:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5964CF80302
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1622311205186237097-webhooks-bot@alsa-project.org>
References: <1622311205186237097-webhooks-bot@alsa-project.org>
Subject: snd_pcm_avail() returned a value that is exceptionally large "ALC293"
Message-Id: <20210529180008.42347F80302@alsa1.perex.cz>
Date: Sat, 29 May 2021 20:00:08 +0200 (CEST)
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

alsa-project/alsa-lib issue #141 was edited from Jeronimo17:

HDA Intel PCH
Realtek ALC293



It is rare that it occurs, it has only happened to me playing, after this the internal keyboard stops responding and I have to put one for USB, and the shutdown of the laptop is impossible without removing power forced 

```
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: snd_pcm_avail() returned a value that is exceptionally large: 440960 bytes (2499 ms).
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: Most likely this is a bug in the ALSA driver 'snd_hda_intel'. Please report this issue to the ALSA developers.
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: snd_pcm_dump():
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: Soft volume PCM
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: Control: PCM Playback Volume
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: min_dB: -51
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: max_dB: 0
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: resolution: 256
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: Its setup is:
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   stream       : PLAYBACK
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   access       : MMAP_INTERLEAVED
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   format       : S16_LE
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   subformat    : STD
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   channels     : 2
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   rate         : 44100
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   exact rate   : 44100 (44100/1)
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   msbits       : 16
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   buffer_size  : 4408
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_size  : 1102
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_time  : 24988
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   tstamp_mode  : ENABLE
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   tstamp_type  : MONOTONIC
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_step  : 1
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   avail_min    : 1102
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_event : 1
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   start_threshold  : -1
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   stop_threshold   : 4962966789362286592
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   silence_threshold: 0
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   silence_size : 0
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   boundary     : 4962966789362286592
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: Slave: Hardware PCM card 0 'HDA Intel PCH' device 0 subdevice 0
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: Its setup is:
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   stream       : PLAYBACK
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   access       : MMAP_INTERLEAVED
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   format       : S16_LE
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   subformat    : STD
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   channels     : 2
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   rate         : 44100
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   exact rate   : 44100 (44100/1)
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   msbits       : 16
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   buffer_size  : 4408
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_size  : 1102
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_time  : 24988
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   tstamp_mode  : ENABLE
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   tstamp_type  : MONOTONIC
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_step  : 1
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   avail_min    : 1102
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_event : 1
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   start_threshold  : -1
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   stop_threshold   : 4962966789362286592
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   silence_threshold: 0
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   silence_size : 0
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   boundary     : 4962966789362286592
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   appl_ptr     : 47704880
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   hw_ptr       : 47810712
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: snd_pcm_delay() returned a value that is exceptionally large: -247148 bytes (-1401 ms).
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: Most likely this is a bug in the ALSA driver 'snd_hda_intel'. Please report this issue to the ALSA developers.
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: snd_pcm_dump():
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: Soft volume PCM
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: Control: PCM Playback Volume
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: min_dB: -51
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: max_dB: 0
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: resolution: 256
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: Its setup is:
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   stream       : PLAYBACK
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   access       : MMAP_INTERLEAVED
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   format       : S16_LE
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   subformat    : STD
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   channels     : 2
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   rate         : 44100
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   exact rate   : 44100 (44100/1)
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   msbits       : 16
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   buffer_size  : 4408
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_size  : 1102
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_time  : 24988
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   tstamp_mode  : ENABLE
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   tstamp_type  : MONOTONIC
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_step  : 1
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   avail_min    : 1102
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_event : 1
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   start_threshold  : -1
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   stop_threshold   : 4962966789362286592
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   silence_threshold: 0
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   silence_size : 0
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   boundary     : 4962966789362286592
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: Slave: Hardware PCM card 0 'HDA Intel PCH' device 0 subdevice 0
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]: Its setup is:
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   stream       : PLAYBACK
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   access       : MMAP_INTERLEAVED
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   format       : S16_LE
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   subformat    : STD
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   channels     : 2
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   rate         : 44100
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   exact rate   : 44100 (44100/1)
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   msbits       : 16
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   buffer_size  : 4408
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_size  : 1102
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_time  : 24988
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   tstamp_mode  : ENABLE
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   tstamp_type  : MONOTONIC
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_step  : 1
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   avail_min    : 1102
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   period_event : 1
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   start_threshold  : -1
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   stop_threshold   : 4962966789362286592
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   silence_threshold: 0
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   silence_size : 0
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   boundary     : 4962966789362286592
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   appl_ptr     : 47748960
may 29 18:44:35 jeronimo17-GIGABYTE-AORUS-7-KB pulseaudio[1370]:   hw_ptr       : 47810784

```

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/141
Repository URL: https://github.com/alsa-project/alsa-lib
