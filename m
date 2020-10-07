Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 833BB2862F7
	for <lists+alsa-devel@lfdr.de>; Wed,  7 Oct 2020 18:01:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1718C16CA;
	Wed,  7 Oct 2020 18:00:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1718C16CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602086489;
	bh=INX8BVWpvonybkvQRHRxNfZ3TvXEEd/6JoVg+v2yxQo=;
	h=From:To:Subject:Date:In-Reply-To:Cc:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From;
	b=Wv90heZeMJYvAncpp8JPSauMXvjC/W29mXiWkAJBECNp7qY/+4bV+2SmbcdyVVoW/
	 nseu/o/qGDhu9GpiZjCqK+hmwXflCJavqbut3cE2q+hSro00VejT3NQDWYDgP5/XOZ
	 FJWVzXzwERnGWNeuWovGrykYgLbeRlXBuvOnVuD8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90A55F802FD;
	Wed,  7 Oct 2020 17:55:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 70F2DF80090; Wed,  7 Oct 2020 15:35:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=RDNS_NONE,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from bootes.sytes.net (unknown
 [IPv6:2a02:2698:182a:c64:96de:80ff:fe6b:1e50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E8599F80090;
 Wed,  7 Oct 2020 15:35:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E8599F80090
Received: from localhost.lan ([127.0.0.1] helo=bootes.localnet)
 by bootes.sytes.net with esmtp (Exim 4.92)
 (envelope-from <alex@bootes.sytes.net>)
 id 1kQ9ba-0001TH-Pu; Wed, 07 Oct 2020 18:35:42 +0500
From: Alex Volkov <alex@bootes.sytes.net>
To: tom.ty89@gmail.com
Subject: Re: [PATCH] ALSA: usb-audio: ignore broken processing/extension unit
Date: Wed, 07 Oct 2020 18:35:42 +0500
Message-ID: <7104424.S74eq5PtAd@bootes>
In-Reply-To: <5f3abc52.1c69fb81.9cf2.fe91@mx.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Mailman-Approved-At: Wed, 07 Oct 2020 17:54:46 +0200
Cc: alsa-devel@alsa-project.org, patch@alsa-project.org
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

This patch breaks the creation of the "Clock rate Selector" mixer unit in E-MU 
Tracker Pre USB audio interface. If the 'snd-usb-audio' module still has not 
been loaded when the device gets switched on, the module autoloads and 
everything works:

$ cat /proc/asound/USB/usbmixer 
USB Mixer: usb_id=0x041e3f0a, ctrlif=0, ctlerr=0
Card: E-MU Systems, Inc. E-MU Tracker Pre | USB at usb-0000:00:14.0-13, high 
speed
  Unit: 4
    Control: name="PCM Playback Volume", index=0
    Info: id=4, control=2, cmask=0x3, channels=2, type="S16"
    Volume: min=-25600, max=0, dBmin=-10000, dBmax=0
  Unit: 4
    Control: name="PCM Playback Switch", index=0
    Info: id=4, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 12
    Control: name="Clock rate Selector", index=0
    Info: id=12, control=3, cmask=0x0, channels=1, type="U8"
    Volume: min=0, max=5, dBmin=0, dBmax=0

BUT! If the device gets switched off and back on when the module is still 
loaded, the control never gets created:

(after I power cycled the device)

$ cat /proc/asound/USB/usbmixer 
USB Mixer: usb_id=0x041e3f0a, ctrlif=0, ctlerr=0
Card: E-MU Systems, Inc. E-MU Tracker Pre | USB at usb-0000:00:14.0-13, high 
speed
  Unit: 4
    Control: name="PCM Playback Volume", index=0
    Info: id=4, control=2, cmask=0x3, channels=2, type="S16"
    Volume: min=-25600, max=0, dBmin=-10000, dBmax=0
  Unit: 4
    Control: name="PCM Playback Switch", index=0
    Info: id=4, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0

Accordingly, the device stays at the default Clock rate with no way to change 
it. Probably, there's some timing issue in the initialization of the device / 
the loading of the module, but I honestly couldn't care less as long as this 
patch breaks my setup.



