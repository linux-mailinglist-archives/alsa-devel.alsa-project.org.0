Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82579934746
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2024 06:51:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA4DBDF9;
	Thu, 18 Jul 2024 06:51:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA4DBDF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721278295;
	bh=snkwxh91XN8cT8Ox34MX+66GuL1gsE6SYT8nuWc/eXo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=QsFruK19myeCGDns2KFFKhVkdXNiTJoBkNxITIIyFPk3a7L6YlyOgzXCjPcfumPsp
	 gwAc8ensa/Lqnv1ZgoL6IJscntm6DYe3+pkUWRecnUdXZ8uETf6aVOyHf7N35fFNHc
	 orlgqY3HARlfNdX/cS4x1gaB41M+NaqU9oy/LBCo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F582F800FA; Thu, 18 Jul 2024 06:51:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7572BF800FA;
	Thu, 18 Jul 2024 06:51:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45835F8026D; Thu, 18 Jul 2024 06:48:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from webhooks-bot.alsa-project.org (vmi242170.contaboserver.net
 [207.180.221.201])
	by alsa1.perex.cz (Postfix) with ESMTP id 5B051F8007E
	for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2024 06:45:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5B051F8007E
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1721277918697913408-webhooks-bot@alsa-project.org>
References: <1721277918697913408-webhooks-bot@alsa-project.org>
Subject: Inconsistent order of channels on C-Media 7.1 channel device
Message-Id: <20240718044802.45835F8026D@alsa1.perex.cz>
Date: Thu, 18 Jul 2024 06:48:02 +0200 (CEST)
Message-ID-Hash: TRGB5ZXDYZCMAYUZEN6JWS3JK4GTPDE4
X-Message-ID-Hash: TRGB5ZXDYZCMAYUZEN6JWS3JK4GTPDE4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TRGB5ZXDYZCMAYUZEN6JWS3JK4GTPDE4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

alsa-project/alsa-lib issue #402 was opened from victorallume:

I have a USB sound device (Startech ICUSBAUDIO7D, which comes up as `ID 0d8c:0102 C-Media Electronics, Inc. CM106 Like Sound Device` through lsusb) which I'm trying to program the output of for 8 channels. The python code (outputs a 50Hz sine wave) I'm using is below (each channel gets a different amplitude so I can identify them with an oscilloscope).

The sound card has 4 stereo jacks, to which I have a scope connected.

The problem is that on different runs of the program, the output mappings are not consistent - each run of the program might have the order of the channels different to the previous. So running it one time might have amplitudes (0, 0.125) on the first jack, but the next run it might have those (0.75, 0.25) on the first jack (it doesn't appear to be 'paired' per jack)

I initially discovered this when using portaudio, and decided to try using alsa-only and the issue persists. 

Is this likely to be a problem with the driver, alsa-lib, or is there something else going on here?

```
import numpy as np
import alsaaudio

def sine_wave(amplitude=1, freq=50, sample_rate=48000):
    wave_len = sample_rate/freq
    samples = (amplitude * 32767 * np.sin(2 * np.pi * np.arange(wave_len) * freq / sample_rate)).astype(np.int16)
    return samples

def eightchan(freq=50, sample_rate=48000):
    wave_len = sample_rate//freq
    frames = np.zeros((wave_len, 8), dtype=np.int16)
    samples = sine_wave()
    for c in range(8):
        frames[:wave_len,c] = samples[:wave_len]*(c/8)
    return frames.tobytes()

if __name__ == '__main__':
    pcm = alsaaudio.PCM(device='surround71:CARD=ICUSBAUDIO7D,DEV=0', format=alsaaudio.PCM_FORMAT_S16_LE, channels=8, rate=48000, type=alsaaudio.PCM_PLAYBACK, periodsize=960, periods=1)
    frames = eightchan()
    while True:
        pcm.write(frames)
```

alsa-info output is attached
[alsa-info.txt](https://github.com/user-attachments/files/16277691/alsa-info.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/402
Repository URL: https://github.com/alsa-project/alsa-lib
