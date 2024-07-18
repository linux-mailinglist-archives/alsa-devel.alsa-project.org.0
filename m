Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE8B93474A
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Jul 2024 06:55:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC035E72;
	Thu, 18 Jul 2024 06:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC035E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721278542;
	bh=bIukJ+kgusr4eFJzCUy8XUr5vqNM6T7KWsQyAJWtl44=;
	h=Subject:From:To:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=iE8kkUTPhANbvw30OtI9e9p3/v620v2IaOw2T2fuYZ9JBjPyh26u+MD72qYe4EJom
	 0dXK0+5qK5udm0i0l7lXgaWx/I/P/a0jzrG3LnVcX3whAkgeIzGf3WdBrn2e/5RV4l
	 lEFgv4HSHIjmNUaSyLimrygCqDcn4XcdG+0qgLUw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 880B0F80587; Thu, 18 Jul 2024 06:55:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C057AF805A0;
	Thu, 18 Jul 2024 06:55:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16608F80508; Thu, 18 Jul 2024 06:52:36 +0200 (CEST)
Received: from mailman-web.alsa-project.org (mailman-web.alsa-project.org
 [10.254.200.11])
	by alsa1.perex.cz (Postfix) with ESMTP id 0AB21F8007E
	for <alsa-devel@alsa-project.org>; Thu, 18 Jul 2024 06:52:36 +0200 (CEST)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Inconsistent order of channels on C-Media 7.1 channel device
From: victor@allumeenergy.com.au
To: alsa-devel@alsa-project.org
Date: Thu, 18 Jul 2024 04:52:36 -0000
Message-ID: 
 <172127835604.6185.4671370925729472425@mailman-web.alsa-project.org>
User-Agent: HyperKitty on https://mailman.alsa-project.org/
Message-ID-Hash: UFSZOETYKLOBOOYNKXVVUTY46BTLSF63
X-Message-ID-Hash: UFSZOETYKLOBOOYNKXVVUTY46BTLSF63
X-MailFrom: victor@allumeenergy.com.au
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QY4IQMJ6WQAFIUR4M3S6CNKMHHJREONZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

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
