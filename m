Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A00458467
	for <lists+alsa-devel@lfdr.de>; Sun, 21 Nov 2021 16:17:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBDA916FB;
	Sun, 21 Nov 2021 16:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBDA916FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637507831;
	bh=9yAMfqBK0QIMSRYqTaeDmwTOzfEhBTHoMoKlVbspYIc=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jSM7CIeVBHQ1FAyszYK96UOCc1EQTZjNNEH19qXY6yRDNJOoKsK3XResfbNQHL4Ti
	 pMaXOhfdQoZ2cRaNxktGt1z+Ku19xexgAywpzjEy8BB5X4Y8WuaFN5xtTuo3ZjMErt
	 UYptaGneUk8z3mBkoQa5ldnuNGh7dYxZqVCau1Ks=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3924CF80154;
	Sun, 21 Nov 2021 16:15:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC79AF80115; Sun, 21 Nov 2021 16:15:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id C3549F80115
 for <alsa-devel@alsa-project.org>; Sun, 21 Nov 2021 16:15:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C3549F80115
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1637507742433547974-webhooks-bot@alsa-project.org>
References: <1637507742433547974-webhooks-bot@alsa-project.org>
Subject: Xonar U7 MKII Analog Multichannel and SPDIF
Message-Id: <20211121151550.AC79AF80115@alsa1.perex.cz>
Date: Sun, 21 Nov 2021 16:15:50 +0100 (CET)
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

alsa-project/alsa-lib issue #194 was opened from Gebbx:

Hi,
Usb sound card Xonar U7 MKII plays multichannel content without issue, but only through aplay
`aplay -D hw:2,0 test.wav #6 channels file`
in other cases only two channels work (downmixed)
I have tried different combinations of settings.
Editing asound.conf gives no results too.

The digital output also does not work in any combination of settings, but works (only two channels) in the following case:
`pcm_slave.u7spdif { pcm "hw:2,1" } pcm.u7spplug { type plug slave u7spdif hint { show on } }`
If I understand correctly, in this case it output the decoded signal and it will always be two-channel.
I found a topic: https://forum.kodi.tv/showthread.php?tid=253179
So, i have to edit USB-Audio.conf, 
```
USB-Audio.pcm.iec958_device {
# "NoiseBlaster 3000" 42
"USB Sound Blaster HD" 1
"Xonar U7" 1
"MKII" 1 # my card
}
```
but this is not recommended.
How can this be done in another way?
Example given in the USB-Audio.conf file forces system to reboot.
`cards.USB-Audio.pcm.iec958_device."MKII" 1`

Thanks!

My system: RPI4, LibreELEC 10

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/194
Repository URL: https://github.com/alsa-project/alsa-lib
