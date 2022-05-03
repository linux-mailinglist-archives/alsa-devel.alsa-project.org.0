Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1B4518ED1
	for <lists+alsa-devel@lfdr.de>; Tue,  3 May 2022 22:30:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30EB11F0;
	Tue,  3 May 2022 22:29:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30EB11F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651609836;
	bh=vWzGAOYGDkprpmK5bHByNIBdBK2MEJVkayTYkMqbGt4=;
	h=From:To:In-Reply-To:References:Subject:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pC8vVcRiTu0iOfi8yhoZjxoa8sZ2dHdYHiu/LOe96Z719qg9E2Wtes6MH9aYU/hVH
	 LJz0yd6i/tD+nsdCo95FpkrqfqYdDXGe9om+QVvbYBEePwjRa89gfXfXmD9JVG+hKI
	 5FTygxdhTrDvyXFPqV/iRZOasv5SzRx4tevdN6bE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9758AF800D2;
	Tue,  3 May 2022 22:29:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34247F80236; Tue,  3 May 2022 22:29:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=MISSING_DATE,MISSING_MID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from webhooks-bot.alsa-project.org (gate.perex.cz [77.48.224.242])
 by alsa1.perex.cz (Postfix) with ESMTP id 48477F80129
 for <alsa-devel@alsa-project.org>; Tue,  3 May 2022 22:29:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48477F80129
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
From: GitHub issues - opened <github@alsa-project.org>
To: alsa-devel@alsa-project.org
In-Reply-To: <1651609767364916086-webhooks-bot@alsa-project.org>
References: <1651609767364916086-webhooks-bot@alsa-project.org>
Subject: Arch Linux Alsa Driver mic misconfigured 0000:00:1f.3
Message-Id: <20220503202935.34247F80236@alsa1.perex.cz>
Date: Tue,  3 May 2022 22:29:35 +0200 (CEST)
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

alsa-project/alsa-firmware issue #6 was opened from WalterSmuts:

Hi,

I have a `Xiaomi Mi Laptop Pro X 15` running arch linux and the `pulseaudio-alsa` package seems to make sound work out of the box. Unfortunately it doesn't configure the mic properly. Attempting on a ubuntu live-usb I found the mic working. I ran the info script for both OS's (see below). My interpretation of the info dumped by the script is that ubuntu loads the `sof-audio-pci` drivers and arch linux seems to load some other intel drivers. Looking through the [arch wiki](https://wiki.archlinux.org/title/Advanced_Linux_Sound_Architecture#ALSA_firmware) I see reference to some newer laptops requiring the sof drivers:

> [sof-firmware](https://archlinux.org/packages/?name=sof-firmware) and/or [alsa-ucm-conf](https://archlinux.org/packages/?name=alsa-ucm-conf) are required for some newer laptop models (mainly since 2019) because they implement their drivers with firmware provided by the [Sound Open Firmware](https://www.sofproject.org/) project.

So installing the `sof-firmware` package and restarting the laptop unfortunately still does not fix my issue. Looks to me like the old drivers are still taking preference.

Can someone guide me in the right direction here?

* [Working Ubuntu Info](http://alsa-project.org/db/?f=e66f34b60915348fa835bdde9e849119e1031651)
* [Non-working Arch Info](http://alsa-project.org/db/?f=1a4c03f9abd116c5a0b149e51e436f004fa20228)

Issue URL     : https://github.com/alsa-project/alsa-firmware/issues/6
Repository URL: https://github.com/alsa-project/alsa-firmware
