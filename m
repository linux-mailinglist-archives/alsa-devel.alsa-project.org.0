Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6D137F6DA
	for <lists+alsa-devel@lfdr.de>; Thu, 13 May 2021 13:36:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5943A17D6;
	Thu, 13 May 2021 13:35:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5943A17D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620905768;
	bh=NNG/Gdzbqz9SM2wZ+jHLalZoBimf19T1qzZYZFwYNsk=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qUUzVaOR9TrUTPLbwtkZbwYTvYbOUnJ2eeTuomOKXW5ObKMXYyWvCYdGCrnFj8CHB
	 MAKwqG9+dBjc+3Jw6ma4zlLZ8K7bjbzMGZCkiKsbYkktlrkpJgml/561E1djJQbNab
	 BsSBPjbuQINAhCMjbON+OtgGgaR7eeP5fRjMykgE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADFECF800E3;
	Thu, 13 May 2021 13:34:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7BB6AF80163; Thu, 13 May 2021 13:34:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 22350F8012E
 for <alsa-devel@alsa-project.org>; Thu, 13 May 2021 13:34:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 22350F8012E
IronPort-SDR: 8p0vRVoJNOXCoIxA2ZVSvMouAiWTLQsZRsdWckFYf6ZOwxVAWMvGdGbqbSq/6HocJ2a/Db7YJk
 p1RfEN4qL5bQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9982"; a="180190681"
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="180190681"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 04:34:29 -0700
IronPort-SDR: ysLa90Eu5BvUz99WvZ5fjFQAYN79IwK60qAKXhLpkXdVT15SgiHA8BWJAZ0phu+QFMRlBl5rCk
 lYpNOLLe6NCw==
X-IronPort-AV: E=Sophos;i="5.82,296,1613462400"; d="scan'208";a="623592775"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.237.180.115])
 ([10.237.180.115])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2021 04:34:28 -0700
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
Subject: no_period_wakeup, axfer and --sched-model=timer
To: Takashi Iwai <tiwai@suse.de>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Sakamoto <o-takashi@sakamocchi.jp>
Message-ID: <687f9871-7484-1370-04d1-9c968e86f72b@linux.intel.com>
Date: Thu, 13 May 2021 13:34:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
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

Hi,

I was checking some stuff relater to NO_PERIOD_WAKEUP and noticed that 
axfer has support for using either --sched-model=irq or 
--sched-model=timer. However from few quick tests it seems like it 
doesn't work?

$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: PCH [HDA Intel PCH], device 0: ALC283 Analog [ALC283 Analog]
   Subdevices: 1/1
   Subdevice #0: subdevice #0


When using  --sched-model=irq  it transfers data until I press Ctrl+C

$ axfer transfer playback --sched-model=irq -D hw:0,0 -r 48000 -c2 -f 
S16_LE /dev/urandom
PLAYBACK: Format 'Signed 16 bit Little Endian', Rate 48000 Hz, Channels 
'Stereo'
^CPLAYBACK: Expected 4611686018427387903frames, Actual 163960frames
Aborted by signal: Interrupt


However with  --sched-model=timer  it time outs by itself:

$ axfer transfer playback --sched-model=timer -D hw:0,0 -r 48000 -c2 -f 
S16_LE /dev/urandom
PLAYBACK: Format 'Signed 16 bit Little Endian', Rate 48000 Hz, Channels 
'Stereo'
Fail to process frames: Connection timed out
PLAYBACK: Expected 4611686018427387903frames, Actual 16304frames


How well is NO_PERIOD_WAKEUP tested/supported? Is it a bug in axfer or 
perhaps some issue in kernel code?

 From some debugging I did, I have my suspicions that it gets stuck on 
poll in:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/sound/core/pcm_native.c?id=c06a2ba62fc401b7aaefd23f5d0bc06d2457ccc1#n3489
waiting for runtime->sleep to wake it, but seems like it never happens.

What do you think?

Amadeusz
