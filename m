Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ED5464D1E
	for <lists+alsa-devel@lfdr.de>; Wed,  1 Dec 2021 12:37:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 117D92515;
	Wed,  1 Dec 2021 12:36:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 117D92515
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638358659;
	bh=PyxTOygh1dyGj5i8hppLeD0g6SWtsu9MEMTPg2lCiB4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SkULe5DI9a6o1jA09D1hv0282vYWWzOAQjJV4X1izuRxOuUt0faMVNC/FyOIpoRxE
	 djIXP6qsFc4oLbXhhQUEiQKVsHwO6h0PIVFtRdMyu3d/4FgzbzIapV8ZByIUy9ioi+
	 L6kbkQm6gwk6zlzgTOFw7J0lFptsV9KoiB9QAE9U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66B98F80249;
	Wed,  1 Dec 2021 12:36:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3B4B5F80246; Wed,  1 Dec 2021 12:36:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 1FC69F80217
 for <alsa-devel@alsa-project.org>; Wed,  1 Dec 2021 12:36:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1FC69F80217
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1638358571215815067-webhooks-bot@alsa-project.org>
References: <1638358571215815067-webhooks-bot@alsa-project.org>
Subject: ALC1220 Broken Front Panel
Message-Id: <20211201113619.3B4B5F80246@alsa1.perex.cz>
Date: Wed,  1 Dec 2021 12:36:19 +0100 (CET)
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

alsa-project/alsa-ucm-conf issue #123 was opened from vs49688:

Since upgrading from v1.2.4 -> v1.2.5.1, I can no longer get any input/output from my front-panel.

I've bisected the issue to 5947daef124c84fae511233248196576dfbfab7c. Reverting fixes it, but this may break other cards.

The hardware is an "AX370-Gaming K7", with a ALC1220 chip.

##### alsa-info Before revert
[alsainfo_before.txt](https://github.com/alsa-project/alsa-ucm-conf/files/7633415/alsainfo_before.txt)

##### alsa-info After revert
[alsainfo_after.txt](https://github.com/alsa-project/alsa-ucm-conf/files/7633416/alsainfo_after.txt)

##### Relevant dmesg output:
```
[   11.455796] snd_hda_intel 0000:0b:00.3: enabling device (0000 -> 0002)
[   11.532977] snd_hda_codec_realtek hdaudioC1D0: autoconfig for ALC1220: line_outs=3 (0x14/0x15/0x16/0x0/0x0) type:line
[   11.532980] snd_hda_codec_realtek hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   11.532981] snd_hda_codec_realtek hdaudioC1D0:    hp_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   11.532982] snd_hda_codec_realtek hdaudioC1D0:    mono: mono_out=0x0
[   11.532983] snd_hda_codec_realtek hdaudioC1D0:    dig-out=0x1e/0x0
[   11.532984] snd_hda_codec_realtek hdaudioC1D0:    inputs:
[   11.532985] snd_hda_codec_realtek hdaudioC1D0:      Rear Mic=0x18
[   11.532986] snd_hda_codec_realtek hdaudioC1D0:      Line=0x1a
[   11.543432] snd_hda_codec_realtek hdaudioC1D1: autoconfig for ALC1220: line_outs=1 (0x14/0x0/0x0/0x0/0x0) type:hp
[   11.543434] snd_hda_codec_realtek hdaudioC1D1:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   11.543435] snd_hda_codec_realtek hdaudioC1D1:    hp_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   11.543436] snd_hda_codec_realtek hdaudioC1D1:    mono: mono_out=0x0
[   11.543436] snd_hda_codec_realtek hdaudioC1D1:    inputs:
[   11.543437] snd_hda_codec_realtek hdaudioC1D1:      Front Mic=0x1a
[   11.548516] input: HD-Audio Generic Rear Mic as /devices/pci0000:00/0000:00:08.1/0000:0b:00.3/sound/card1/input19
[   11.548554] input: HD-Audio Generic Line as /devices/pci0000:00/0000:00:08.1/0000:0b:00.3/sound/card1/input20
[   11.548583] input: HD-Audio Generic Line Out Front as /devices/pci0000:00/0000:00:08.1/0000:0b:00.3/sound/card1/input21
[   11.548613] input: HD-Audio Generic Line Out Surround as /devices/pci0000:00/0000:00:08.1/0000:0b:00.3/sound/card1/input22
[   11.548641] input: HD-Audio Generic Line Out CLFE as /devices/pci0000:00/0000:00:08.1/0000:0b:00.3/sound/card1/input23
[   11.548669] input: HD-Audio Generic Front Mic as /devices/pci0000:00/0000:00:08.1/0000:0b:00.3/sound/card1/input24
[   11.548695] input: HD-Audio Generic Front Headphone as /devices/pci0000:00/0000:00:08.1/0000:0b:00.3/sound/card1/input25

```

##### pavucontrol Before revert (doesn't work):
![ssbad](https://user-images.githubusercontent.com/4423262/144226384-0d338bef-9cda-439c-9bba-cc0cb63551eb.png)

##### pavucontrol After revert (works):

Appears the same as it did on v1.2.4:
![ssgood](https://user-images.githubusercontent.com/4423262/144226410-14e3cd07-b179-4ce3-a224-17e7a35ae1dd.png)

Issue URL     : https://github.com/alsa-project/alsa-ucm-conf/issues/123
Repository URL: https://github.com/alsa-project/alsa-ucm-conf
