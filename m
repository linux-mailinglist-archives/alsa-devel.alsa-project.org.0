Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AD87C596C50
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Aug 2022 11:51:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 491051616;
	Wed, 17 Aug 2022 11:50:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 491051616
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660729899;
	bh=74eRf57L4lNc73tFdu4bOQlW6M4I9k1UiBKDM+k7wSo=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lQD+Yaa0ugsz9p7RIkRvdFdLFaAEf7E1liYohWNPNpyreynO0t2pf6onyowoyLeSh
	 c/L9VB6jM4fXpJ3ExlInxGnBJpJ5++CijvmkZlnm8GE4bElvl2Wb9A2vkOoq/62UdO
	 +Q8mvruFGjV2GfHUzmFqMCUzaw4zxiC/djBsI04I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C2146F80237;
	Wed, 17 Aug 2022 11:50:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ABE41F8025C; Wed, 17 Aug 2022 11:50:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id A9C23F800DA
 for <alsa-devel@alsa-project.org>; Wed, 17 Aug 2022 11:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A9C23F800DA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1660729834871670961-webhooks-bot@alsa-project.org>
References: <1660729834871670961-webhooks-bot@alsa-project.org>
Subject: Channel mapping randomly change on usb soundcard and sucpicious dmesg
 log
Message-Id: <20220817095038.ABE41F8025C@alsa1.perex.cz>
Date: Wed, 17 Aug 2022 11:50:38 +0200 (CEST)
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

alsa-project/alsa-lib issue #261 was opened from sprudent:

Hello erveryone,

I am getting random channel swap when using speaker test to output sequencially a pink noise on every channel of the soundcard.
I tested two distinct usb soundcard getting the same issue.
I could identify a suspicious log showing at the same time the channels swapped.
Tested and reproduced on a recent archlinux image (see system information).

```
[Aug16 18:26] xhci_hcd 0000:00:14.0: ERROR Transfer event TRB DMA ptr not part of current TD ep_index 11 comp_code 1
[  +0.000134] xhci_hcd 0000:00:14.0: Looking for event-dma 0000000014ed98e0 trb-start 0000000014ed98f0 trb-end 0000000014ed98f0 seg-start 0000000014ed9000 seg-end 0000000014ed9ff0
```

### system information
```
uname -r

5.18.7-arch1-1
```
```
aplay -l

**** List of PLAYBACK Hardware Devices ****
card 0: Audio [Intel HDMI/DP LPE Audio], device 0: HdmiLpeAudio [Intel HDMI/DP LPE Audi]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Audio [Intel HDMI/DP LPE Audio], device 1: HdmiLpeAudio [Intel HDMI/DP LPE Audi]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: Audio [Intel HDMI/DP LPE Audio], device 2: HdmiLpeAudio [Intel HDMI/DP LPE Audi]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: ICUSBAUDIO7D [ICUSBAUDIO7D], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: bytchtes8316 [bytcht-es8316], device 0: Audio (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: bytchtes8316 [bytcht-es8316], device 1: Deep-Buffer Audio (*) []
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```
[alsa-info.txt](https://github.com/alsa-project/alsa-lib/files/9358483/alsa-info.txt)
### Test with dmix
#### Description
First test was made with alsa dmix plugin. Multiple processes running in parrallel and outputing to dmix pcm device.

#### Alsa configuration
```
pcm.play_8
{
	@args [ CARD ]
	@args.CARD 
	{
		type string
	}

    type dmix
    
    ipc_key 5678
    
    slave
    {
		pcm $CARD
        channels 8
        period_time 0
        period_size 1024
        buffer_size 4096
        rate 44100
	}
    
	bindings {
		0 0
		1 1
		2 2
		3 3
		4 4
		5 5
		6 6
		7 7
	} 
}
```
#### Step to reproduce
Run this script to simulate multiple processes writing to dmix device at the same time
```
for i in $(seq 20)
do
		speaker-test -r44100 -D"play_8:\"hw:1\"" -c8 -t pink &
done
```
Then on another tty, start a speaker-test command outputing a sine wave in order to identify channel mapping by correlating speaker test output with audio output.
`speaker-test -r44100 -D"play_8:\"hw:1\"" -c8 -t sine`
```
 0 - Front Left
 4 - Front Center
 1 - Front Right
 3 - Side Right
 7 - Side Right
 2 - Side Left
 6 - Side Left
 5 - LFE
Time per period = 21.998519
...
```

#### Expected result
Audio output to the same channels during all the test
#### Actual result
Random audio channel swap correlated with dmesg log mentioned above.

### Second test with direct output
#### Alsa configuration
No specific configuration required
#### Step to reproduce
Run speaker-following test command and wait for channel swap
`speaker-test -r44100 -Dsurround71:ICUSBAUDIO7D -c8`
#### Expected result
Audio output to the same channels during all the test
#### Actual result
Random audio channel swap correlated with dmesg log mentioned above. The chanel swap happen far less often than with dmix.

### Interpretation
The DMA transfer ring buffer get messed up after a while (see dmesg log) and interleaved audio frames get shifted in soundcard buffer. If I unplug/replug usb soundcard  and try again, channel mapping goes back to the correct order.

My alsa, kernel and usb driver knowledge is limited, so I come to you for a little help. Tell me if you need more information to reproduce.

Thank's,
Sylvain

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/261
Repository URL: https://github.com/alsa-project/alsa-lib
