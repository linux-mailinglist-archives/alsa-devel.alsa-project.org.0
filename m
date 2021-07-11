Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B82E3C3E69
	for <lists+alsa-devel@lfdr.de>; Sun, 11 Jul 2021 19:38:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 030811674;
	Sun, 11 Jul 2021 19:37:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 030811674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626025127;
	bh=odpj4cV2js5WphAn8KtTes+6tJbkeplB3tHG+8qLrvY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=goEozJhR0G1TfAbZlLHHN2RYlNaktf8SFqnTO2HREd+DTEWLuJ8howr8PGmwTaK9q
	 FaDYpxKCdqiKegfkcXkAL/qWY0MROCVzYBhzYxo6Y94dISpgcueELTNTkhy94Xizl/
	 Yc02iF2t63kKWr+u6JVDcvhNL6BpFXQ9cnyTBFEY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82A0DF802E0;
	Sun, 11 Jul 2021 19:37:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A654F802E0; Sun, 11 Jul 2021 19:37:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 9685BF8013D
 for <alsa-devel@alsa-project.org>; Sun, 11 Jul 2021 19:37:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9685BF8013D
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - edited <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1626025066156984091-webhooks-bot@alsa-project.org>
References: <1626025066156984091-webhooks-bot@alsa-project.org>
Subject: Realtek analog audio output limited to 48 kHz,
 chips support up to 192kHz
Message-Id: <20210711173751.1A654F802E0@alsa1.perex.cz>
Date: Sun, 11 Jul 2021 19:37:51 +0200 (CEST)
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

alsa-project/alsa-lib issue #163 was edited from markojurkovic:

There seems to be an issue with ALSA and some onboard Realtek laptop audio chips, in my case Realtek ALC233 (but I've seen some reports online of people with other Realtek chips facing this issue). Namely, I've noticed that I cannot make use of all the sampling rates that the chip supports in GNU/Linux using ALSA. The chip supports up to 24-bit/192kHz analog stereo output, but in the three Linux distributions I've tried (Ubuntu, Fedora, Manjaro) I can only get either 44.1 or 48 kHz. The problem manifests itself by throwing the following error when attempting to play, for example, a 96kHz file in Audacious:

"ALSA error: snd_pcm_hw_params_set_rate failed: Invalid argument."

If I attempt to play such a file using PulseAudio, I am able to play the file, but it gets resampled to 48kHz (which I've verified by running "cat /proc/asound/card0/pcm0p/sub0/hw_params")

In Windows, I can get up to 192kHz without problems using both WASAPI Exclusive and ASIO modes, meaning modes that directly communicate with hardware, just like ALSA.

Following is the output of running "cat /proc/asound/card0/codec#0". This output indicates that the only supported sample rates for the sound card are 44100 and 48000 (for the analog outputs), whereas this Realtek chip supports also 96000 and 192000.

Node 0x02 [Audio Output] wcaps 0x41d: Stereo Amp-Out
  Control: name="Speaker Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
  Amp-Out vals:  [0x44 0x44]
  Converter: stream=1, channel=0
  PCM:
    rates [0x60]: 44100 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0
Node 0x03 [Audio Output] wcaps 0x41d: Stereo Amp-Out
  Control: name="Headphone Playback Volume", index=0, device=0
    ControlAmp: chs=3, dir=Out, idx=0, ofs=0
  Device: name="ALC233 Analog", type="Audio", device=0
  Amp-Out caps: ofs=0x57, nsteps=0x57, stepsize=0x02, mute=0
  Amp-Out vals:  [0x00 0x00]
  Converter: stream=1, channel=0
  PCM:
    rates [0x60]: 44100 48000
    bits [0xe]: 16 20 24
    formats [0x1]: PCM
  Power states:  D0 D1 D2 D3 EPSS
  Power: setting=D0, actual=D0

Attached to this post is also the output of the alsa-info script.
[alsa-debug.txt](https://github.com/alsa-project/alsa-lib/files/6797358/alsa-debug.txt)

I tried different kernel versions, both generic and custom, on distros ranging from Ubuntu 19.04, Ubuntu 21.04, Pop OS 20.04 and 21.04, Fedora 32...

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/163
Repository URL: https://github.com/alsa-project/alsa-lib
