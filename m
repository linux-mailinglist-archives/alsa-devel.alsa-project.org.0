Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6794E47D2
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 21:54:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BBA417BC;
	Tue, 22 Mar 2022 21:53:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BBA417BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647982472;
	bh=WTIcYRdNeW1tsFiUDaqYMQvB1/mMWIVu54R+mJNv5c4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s6pUpUGwwFRogUeTl+eQLyd4Yt8FFkAdmM7RT/XyIihRO7nWXsw2E1qa6UWO0L4PN
	 FSZiJkV1kB9npq8g4Czy5eiTUaEnXZ821iellICFYVHB0xyzq7trSVlUPkN4x7BRTz
	 JUUdjU4r/FNU9Box0inZndfqg2ELSzPtWKCJT17s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BC85F80518;
	Tue, 22 Mar 2022 21:53:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 54F9AF80517; Tue, 22 Mar 2022 21:53:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 2D2EDF80515
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 21:53:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D2EDF80515
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1647982401656882048-webhooks-bot@alsa-project.org>
References: <1647982401656882048-webhooks-bot@alsa-project.org>
Subject: Line-in is abnormally loud for snd-intel-hda
Message-Id: <20220322205328.54F9AF80517@alsa1.perex.cz>
Date: Tue, 22 Mar 2022 21:53:28 +0100 (CET)
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

alsa-project/alsa-lib issue #219 was opened from mpeter50:

When I'm on Windows, I sometimes use the line-in Jack to connect my phone to it, so I can either listen to it's sounds along with my PCs sounds or use it as a microphone.

I've tried to set this functionality up on my Linux installation, but it seems something is not right.
The most basic example is with `arecord`: after setting line-in as the default input device with `alsamixer` I've ran `arecord -vv -fdat foo.wav` so I can check what the ALSA drivers actually "hear" without possible interference of any audio servers. While the command was running, I changed the volume of line-in using he appropriate slider of pavucontrol.
When playing the recording, it is clear that while line-in is at 100%, the sound is so loud that it is distorted, and the normal volume is around 12-15% of the actual volume.

I don't experience this on Windows, so this is probably not a hardware issue.
If I plug a headphone directly into my phone and listen to it, the volume is normal, so this is probably not an issue on the signal producer side either.
Checking with `alsamixer`, all capture controls are at 0 volume. But, the controls there might not tell the full truth for multiple reasons:
- after reducing the Capture control's volume I can still hear the sound coming from line-in
- the Capture control's volume is not in sync with what I see in pavucontrol and other places like KDE's volume menu
- the controls Master and PCM in the Playback category does not seem to have any effect. As such, none of the controls control the actual output to my headphone
- the "default" card has a single slider, it is named Master and this actually controls the master volume, at least for my headphone

Screenshot relevant to the 1st and 2nd points:

![image](https://user-images.githubusercontent.com/83356418/159570560-879f2508-d48c-4718-bf7e-34ee80a4c2e6.png)

Additional information:
- output of the alsa-info script: [alsa-info.txt](https://github.com/alsa-project/alsa-lib/files/8327703/alsa-info.txt)
- Content of `/proc/asound/card*/codec#*` files:
  - [/proc/asound/card0/codec#0](https://github.com/alsa-project/alsa-lib/files/8327730/card0_codec0.txt)
  - [/proc/asound/card1/codec#0](https://github.com/alsa-project/alsa-lib/files/8327735/card1_codec0.txt) 
  - note: card0 is the HDMI section of my graphics card. I never use it for audio, only jack and bluetooth, so it can probably be ignored
- output of `lspci -vvnn`: [lspci.txt](https://github.com/alsa-project/alsa-lib/files/8327777/lspci.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/219
Repository URL: https://github.com/alsa-project/alsa-lib
