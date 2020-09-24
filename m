Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FB42765EA
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 03:37:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5944E17A0;
	Thu, 24 Sep 2020 03:36:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5944E17A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600911443;
	bh=hQVrC/yKY8jU/TpOJOrqo8zVkMArNlfFc22TFCiybb0=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FMDrdpUJIkClYgj1VFtxfQC6AFvwD8jYVHwjFWgbyYZJ/htMZC4kaRHJYZYJZOhAM
	 FJmK/OdR8SKT2/zvCB8I6nTByuxP2juLWjwkp4j5IiuYzphK6BkEOTtE6lgtnBhq1G
	 nlKJhxkU8TsFoPoJs5ZdwcIu/qR3qQXr7Gs2P0L8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69E3BF800DA;
	Thu, 24 Sep 2020 03:35:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4063F80232; Thu, 24 Sep 2020 03:35:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 757D8F800DA
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 03:35:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 757D8F800DA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1600911332298629999-webhooks-bot@alsa-project.org>
References: <1600911332298629999-webhooks-bot@alsa-project.org>
Subject: support the Roland UA-4FX2 card
Message-Id: <20200924013539.B4063F80232@alsa1.perex.cz>
Date: Thu, 24 Sep 2020 03:35:39 +0200 (CEST)
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

alsa-project/alsa-lib issue #81 was opened from kalashnikov2:

hi

i'm trying to use this audio card with a Raspberry pi and y get this from the command dmesg on linux console

```
usb 3-2: new high-speed USB device number 6 using xhci_hcd
usb 3-2: New USB device found, idVendor=0582, idProduct=01e2, bcdDevice= 0.2b
usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=0
usb 3-2: Product: UA-4FX2
usb 3-2: Manufacturer: ROLAND
mc: Linux media interface: v0.10
usbcore: registered new interface driver snd-usb-audio
usb 3-2: Unable to change format on ep #8e: already in use
usb 3-2: Unable to change format on ep #8e: already in use
:
:
```

and when i try to select the device on a program get this

```
ALSA lib pcm.c:2642:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.rear
ALSA lib pcm.c:2642:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.center_lfe
ALSA lib pcm.c:2642:(snd_pcm_open_noupdate) Unknown PCM cards.pcm.side
ALSA lib pcm_route.c:869:(find_matching_chmap) Found no matching channel map
ALSA lib pcm_oss.c:377:(_snd_pcm_oss_open) Unknown field port
ALSA lib pcm_oss.c:377:(_snd_pcm_oss_open) Unknown field port
ALSA lib pcm_usb_stream.c:486:(_snd_pcm_usb_stream_open) Invalid type for card
ALSA lib pcm_usb_stream.c:486:(_snd_pcm_usb_stream_open) Invalid type for card
```
it seems that the card is not supported by ALSA lib.
How is the procedure to add new cards to the driver?

How can I help to do this?

Thank you

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/81
Repository URL: https://github.com/alsa-project/alsa-lib
