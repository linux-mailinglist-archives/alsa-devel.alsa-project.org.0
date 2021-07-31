Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FF43DC60C
	for <lists+alsa-devel@lfdr.de>; Sat, 31 Jul 2021 15:02:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A985B1F80;
	Sat, 31 Jul 2021 15:01:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A985B1F80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627736533;
	bh=nfHDEnh3O7fNnUixP3gA0NY6Nsw1KeOroOIvckTrRGY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cB4pYMrh8d7ivF8yzTZunbEiCqXzosX5engC3Uyz+Qus4CalH64PFNyKQG+vWaMVV
	 DhwnD0eJf0rU6LpTEPli2lRYz6Z5q1a2NUYOZhRMe734TckY5CIUpYPLS/oQEh1Bel
	 UQbqMEi83JGbx/eNWBZUwmFF9pqofvzSG18cEYgg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CFA8AF802DF;
	Sat, 31 Jul 2021 15:00:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7F655F80276; Sat, 31 Jul 2021 15:00:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 7A0D5F80258
 for <alsa-devel@alsa-project.org>; Sat, 31 Jul 2021 15:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A0D5F80258
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1627736422891485929-webhooks-bot@alsa-project.org>
References: <1627736422891485929-webhooks-bot@alsa-project.org>
Subject: Incorrect device setting for M-Audio Audiophile USB sound card
Message-Id: <20210731130029.7F655F80276@alsa1.perex.cz>
Date: Sat, 31 Jul 2021 15:00:29 +0200 (CEST)
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

alsa-project/alsa-lib issue #166 was opened from michele-perrone:

### M-Audio Audiophile USB - fix needed
There is a problem with the ALSA configuration of the "M-Audio Audiophile USB" sound card. From the linux kernel documentation (https://www.kernel.org/doc/html/latest/sound/cards/audiophile-usb.html) you can see that this card has four audio interfaces:
* Analog 2-channel Input (Ai)
* Analog 2-channel Output (Ao)
* Digital 2-channel Input (Di)
* Digital 2-channel Output (Do)    

These interfaces are distributed over three devices of the same card:
* hw:USBtm,0 is Ao in playback and Di in capture
* hw:USBtm,1 is Do in playback and Ai in capture
* hw:USBtm,2 is Do in AC3/DTS passthrough mode

Now, this is where ALSA makes a bit of a mess.   
If you look at the output of `aplay - L` (see attachment aplay_out.txt), you can see that the analog audio output is associated to CARD=USBtm,DEV=0 (which is correct), **but** you can also see that two digital outputs are assigned, one to CARD=USBtm,DEV=0 (**wrong!**) and another one to CARD=USBtm,DEV=1 (correct).   
Speaking now of `arecord - L` (see attachment arecord_out.txt), there is only one input assigned to CARD=USBtm,DEV=0, and it is marked as "Front output / input" instead of SPDIF digital input. And most importantly, the analog input configuration, which should correspond to CARD=USBtm,DEV=1, is completely absent.   
The result of this is that audio applications relying on ALSA don't know where to pick the correct inputs and outputs. If want both Ao and Ai to work in Jack, I have to select hw:USBtm,1 for the input and hw:USBtm,0 for the output. Alternatively, I have to create an `.asoundrc` file with the `asym` module (see attachment) and then run Jack with the name of my virtual device. However, this is just a workaround.   
I'm not familiar with the alsa source but I know my way around C code. If you tell me where to look, I may be able to help fixing this.   
Cheers!   
Michele

Attachments:
[aplay_out.txt](https://github.com/alsa-project/alsa-lib/files/6911115/aplay_out.txt)
[arecord_out.txt](https://github.com/alsa-project/alsa-lib/files/6911116/arecord_out.txt)
[asoundrc.txt](https://github.com/alsa-project/alsa-lib/files/6911119/asoundrc.txt)

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/166
Repository URL: https://github.com/alsa-project/alsa-lib
