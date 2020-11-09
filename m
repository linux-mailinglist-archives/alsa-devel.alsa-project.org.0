Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DA432AC690
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Nov 2020 22:06:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 973E11698;
	Mon,  9 Nov 2020 22:05:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 973E11698
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604955967;
	bh=oU7vgh79j+piVXXid8AjgFLC2MPq6/v7D9P58wOB8dY=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KGTYhtJyOk1VlbUmsPVp59161ku7Yp3yCJWS1WztZuHIAgQ5gbT9IJfM2W3znXkM6
	 WRzDpUEY+ThI89t3DjI7wvCvURtKduxZ2ap6/BXya5PENr1RrnM6jWCqK2FUSe7t/3
	 pHSzy3umHKpvuhn3OkftUhRrxVj61DSTGE731Dvs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01D8BF8022B;
	Mon,  9 Nov 2020 22:04:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56F21F8020C; Mon,  9 Nov 2020 22:04:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_FAIL,SPF_HELO_NONE autolearn=disabled version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id B0A12F800EA
 for <alsa-devel@alsa-project.org>; Mon,  9 Nov 2020 22:04:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0A12F800EA
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1604955865638446093-webhooks-bot@alsa-project.org>
References: <1604955865638446093-webhooks-bot@alsa-project.org>
Subject: USB Audio device: Shure MV7 not recognized
Message-Id: <20201109210433.56F21F8020C@alsa1.perex.cz>
Date: Mon,  9 Nov 2020 22:04:33 +0100 (CET)
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

alsa-project/alsa-lib issue #98 was opened from vchuravy:

Hello! i hope this is the right venue for reporting not working audio devices.

```
> alsa-capabilities
9: `USB Audio' Digital USB Audio Class audio output on device Shure MV7
    -hardware address:               hw:3,0  (or hw:MV7,0)
    -device label:                   Shure MV7
    -formats:                        (n/a)
    -usb audio class:                UAC2 (isochronous asynchronous)
    -streamfile:                     /proc/asound/card3/stream0
    -character device:               /dev/snd/pcmC3D0p
    -monitor file:                   /proc/asound/card3/pcm0p/sub0/hw_params
```

`alsa-info.sh`: http://alsa-project.org/db/?f=1fb51d03454930fce4d6164323cfb7b3c7c88dda
`pulseaudio -vvv` https://gist.github.com/vchuravy/f5f8ee972d5e2179387c8c53423379f6

During the pulseaudio session I plugged the device in and then unplugged it. I am happy to dig in, but I would need some guidance on where to start. As a side-note the microphone seems to work on Android so I am wondering if they are using a different driver.

Issue URL     : https://github.com/alsa-project/alsa-lib/issues/98
Repository URL: https://github.com/alsa-project/alsa-lib
