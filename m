Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D386B17D248
	for <lists+alsa-devel@lfdr.de>; Sun,  8 Mar 2020 08:48:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2E1CE1660;
	Sun,  8 Mar 2020 08:47:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2E1CE1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583653682;
	bh=WrpjTLp+CfFFOJ8EaFgUVhzHdZx4vB7UccnoHfYwAG4=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Reply-To:From;
	b=BMso43wnAIffTUQMQzRj32MHx7H3OuMDiAKQLPFO1pwhPluYfCeriIAfMTvj3ekDn
	 pfToonzC40XOSVSGHcmEQBzUxO2Kb+w7QhmM0Rv/g1TKbmneeLB4/+GlZNq0avepXR
	 KBKFZbUW4oHARBVo37PeLbD/1oWg/EX6AfJn9fwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5198F80217;
	Sun,  8 Mar 2020 08:46:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B9929F8025F; Sat,  7 Mar 2020 14:00:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=KHOP_HELO_FCRDNS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp.smtpout.orange.fr (smtp08.smtpout.orange.fr
 [80.12.242.130])
 (using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63997F8012D
 for <alsa-devel@alsa-project.org>; Sat,  7 Mar 2020 14:00:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63997F8012D
Received: from debian.localnet ([86.250.114.202]) by mwinf5d31 with ME
 id BR0T220014N4hLN03R0TQZ; Sat, 07 Mar 2020 14:00:28 +0100
X-ME-Helo: debian.localnet
X-ME-Date: Sat, 07 Mar 2020 14:00:28 +0100
X-ME-IP: 86.250.114.202
From: laurent Trinques <scorpio@qelectrotech.org>
To: alsa-devel@alsa-project.org
Subject: TRX40 Realtek ALC1220-VB USB Audio
Date: Sat, 07 Mar 2020 14:00:26 +0100
Message-ID: <14399276.b7z6KR4yDS@debian>
Organization: qelectrotech.org
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart8381802.gLf61FMqDs"
Content-Transfer-Encoding: 7Bit
X-Mailman-Approved-At: Sun, 08 Mar 2020 08:46:09 +0100
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
Reply-To: scorpio@qelectrotech.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

This is a multi-part message in MIME format.

--nextPart8381802.gLf61FMqDs
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hello,

sudo dmesg -lerr -lcrit
 
[    0.386478] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CA.WT1A], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386484] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386488] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CA.MT1A], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386490] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386493] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CA.WT2A], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386495] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386497] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CA.MT2A], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386499] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386501] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CA.WT3A], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386504] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386506] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CA.MT3A], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386508] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386510] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CA.WT4A], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386513] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386516] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CA.MT4A], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386518] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386520] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CA.MT5A], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386523] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386526] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CB.WT1B], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386529] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386531] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CB.MT1B], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386534] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386536] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CB.WT2B], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386538] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386541] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CB.MT2B], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386543] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386546] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CB.WT3B], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386548] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386550] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CB.MT3B], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386553] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386555] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CB.WT4B], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386557] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386560] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CB.MT4B], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386562] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386565] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CB.MT5B], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386567] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386571] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CC.WT1C], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386573] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386575] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CC.MT1C], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386578] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386580] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CC.WT2C], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386583] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386585] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CC.MT2C], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386587] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386590] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CC.WT3C], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386592] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386595] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CC.MT3C], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386597] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386599] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CC.WT4C], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386602] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386604] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CC.MT4C], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386606] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386609] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CC.MT5C], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386611] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386615] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CD.WT1D], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386617] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386620] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CD.MT1D], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386622] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386624] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CD.WT2D], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386627] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386629] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CD.MT2D], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386632] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386634] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CD.WT3D], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386636] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386639] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CD.MT3D], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386641] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386644] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CD.WT4D], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386646] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386648] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CD.MT4D], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386651] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    0.386653] ACPI BIOS Error (bug): Failure creating named object 
[\_SB.I2CD.MT5D], AE_ALREADY_EXISTS (20191018/dswload2-323)
[    0.386656] ACPI Error: AE_ALREADY_EXISTS, During name lookup/catalog 
(20191018/psobject-220)
[    2.527434] sp5100-tco sp5100-tco: Watchdog hardware is disabled
[    2.545332] Error: Driver 'pcspkr' is already registered, aborting...
[    2.572542] snd_hda_intel 0000:23:00.4: no codecs found!
[    8.169209] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    8.169214] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[    8.430796] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    8.430800] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[    8.431164] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    8.483290] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    8.483294] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[    8.483662] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    8.628066] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    8.628071] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[    8.628557] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    8.849035] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    8.849039] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[    8.849405] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    9.040530] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    9.040534] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[    9.040903] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    9.233150] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    9.233154] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[    9.233522] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    9.425023] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    9.425027] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[    9.425389] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    9.617141] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    9.617145] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[    9.617636] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    9.809016] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[    9.809020] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[    9.809385] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   10.000383] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   10.000387] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   10.000754] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   10.417141] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   10.417146] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   10.417641] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   10.467123] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   10.467127] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   10.467870] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   14.148540] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   14.148545] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   14.149030] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   14.211031] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   14.211035] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   14.211402] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   14.289284] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   14.289289] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   14.289654] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   14.480906] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   14.480911] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   14.481275] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   14.673023] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   14.673028] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   14.673392] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   14.864772] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   14.864777] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   14.865138] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   15.057144] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   15.057149] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   15.057639] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   15.248638] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   15.248643] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   15.249010] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   15.440883] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   15.440887] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   15.441251] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   15.633004] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   15.633009] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   15.633373] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   16.016995] usb 7-5: cannot get ctl value: req = 0x83, wValue = 0xc00, 
wIndex = 0x1300, type = 4
[   16.017000] usb 7-5: 19:0: cannot get min/max values for control 12 (id 19)
[   16.017491] usb 7-5: cannot get ctl value: req = 0x81, wValue = 0xc00, 
wIndex = 0x1300, type = 4


Best regards,
Laurent
--nextPart8381802.gLf61FMqDs
Content-Disposition: attachment; filename="alsa-info.txt.uNkCrfIW3p"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="alsa-info.txt.uNkCrfIW3p"

upload=true&script=true&cardinfo=
!!################################
!!ALSA Information Script v 0.4.64
!!################################

!!Script ran on: Sat Mar  7 12:58:59 UTC 2020


!!Linux Distribution
!!------------------

Debian GNU/Linux bullseye/sid \n \l PRETTY_NAME="Debian GNU/Linux bullseye/sid" NAME="Debian GNU/Linux" ID=debian HOME_URL="https://www.debian.org/" SUPPORT_URL="https://www.debian.org/support" BUG_REPORT_URL="https://bugs.debian.org/"


!!DMI Information
!!---------------

Manufacturer:      Micro-Star International Co., Ltd.
Product Name:      MS-7C60
Product Version:   1.0
Firmware Version:  1.40
Board Vendor:      Micro-Star International Co., Ltd.
Board Name:        TRX40 PRO 10G (MS-7C60)


!!ACPI Device Status Information
!!---------------

/sys/bus/acpi/devices/AMDI0010:00/status 	 15
/sys/bus/acpi/devices/AMDI0030:00/status 	 15
/sys/bus/acpi/devices/PNP0103:00/status 	 15
/sys/bus/acpi/devices/PNP0A08:00/status 	 15
/sys/bus/acpi/devices/PNP0A08:01/status 	 15
/sys/bus/acpi/devices/PNP0A08:02/status 	 15
/sys/bus/acpi/devices/PNP0A08:03/status 	 15
/sys/bus/acpi/devices/PNP0C01:00/status 	 15
/sys/bus/acpi/devices/PNP0C02:01/status 	 15
/sys/bus/acpi/devices/PNP0C02:03/status 	 15
/sys/bus/acpi/devices/PNP0C0C:00/status 	 11
/sys/bus/acpi/devices/PNP0C0F:00/status 	 11
/sys/bus/acpi/devices/PNP0C0F:01/status 	 11
/sys/bus/acpi/devices/PNP0C0F:02/status 	 11
/sys/bus/acpi/devices/PNP0C0F:03/status 	 11
/sys/bus/acpi/devices/PNP0C0F:04/status 	 11
/sys/bus/acpi/devices/PNP0C0F:05/status 	 11
/sys/bus/acpi/devices/PNP0C0F:06/status 	 11
/sys/bus/acpi/devices/PNP0C0F:07/status 	 11


!!Kernel Information
!!------------------

Kernel release:    5.5.8-vanilla
Operating System:  GNU/Linux
Architecture:      x86_64
Processor:         unknown
SMP Enabled:       Yes


!!ALSA Version
!!------------

Driver version:     k5.5.8-vanilla
Library version:    1.2.2
Utilities version:  1.2.2


!!Loaded ALSA modules
!!-------------------

snd_hda_intel
snd_usb_audio


!!Sound Servers on this system
!!----------------------------

Pulseaudio:
      Installed - Yes (/usr/bin/pulseaudio)
      Running - Yes


!!Soundcards recognised by ALSA
!!-----------------------------

 0 [HDMI           ]: HDA-Intel - HDA ATI HDMI
                      HDA ATI HDMI at 0xc0360000 irq 167
 2 [Audio          ]: USB-Audio - USB Audio
                      Generic USB Audio at usb-0000:46:00.1-5, high speed


!!PCI Soundcards installed in the system
!!--------------------------------------

21:00.1 Audio device [0403]: Advanced Micro Devices, Inc. [AMD/ATI] Baffin HDMI/DP Audio [Radeon RX 550 640SP / RX 560/560X] [1002:aae0]
	Subsystem: Sapphire Technology Limited Baffin HDMI/DP Audio [Radeon RX 550 640SP / RX 560/560X] [1da2:aae0]
23:00.4 Audio device [0403]: Advanced Micro Devices, Inc. [AMD] Starship/Matisse HD Audio Controller [1022:1487]
	Subsystem: Micro-Star International Co., Ltd. [MSI] Starship/Matisse HD Audio Controller [1462:cb60]


!!Modprobe options (Sound related)
!!--------------------------------

snd_pcsp: index=-2
snd_usb_audio: index=-2
snd_atiixp_modem: index=-2
snd_intel8x0m: index=-2
snd_via82xx_modem: index=-2


!!Loaded sound module options
!!---------------------------

!!Module: snd_hda_intel
	align_buffer_size : -1
	bdl_pos_adj : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	beep_mode : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	dmic_detect : Y
	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	enable_msi : -1
	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	index : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	jackpoll_ms : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	model : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	patch : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	pm_blacklist : Y
	position_fix : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	power_save : 0
	power_save_controller : Y
	probe_mask : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	probe_only : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	single_cmd : -1
	snoop : -1

!!Module: snd_usb_audio
	autoclock : Y
	device_setup : 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	enable : Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y,Y
	id : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	ignore_ctl_error : N
	index : -2,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	pid : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1
	quirk_alias : (null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null),(null)
	skip_validation : N
	use_vmalloc : Y
	vid : -1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1


!!HDA-Intel Codec information
!!---------------------------
--startcollapse--

Codec: ATI R6xx HDMI
Address: 0
AFG Function Id: 0x1 (unsol 0)
Vendor Id: 0x1002aa01
Subsystem Id: 0x00aa0100
Revision Id: 0x100700
No Modem Function Group found
Default PCM:
    rates [0x70]: 32000 44100 48000
    bits [0x2]: 16
    formats [0x1]: PCM
Default Amp-In caps: N/A
Default Amp-Out caps: N/A
State of AFG node 0x01:
  Power states:  D0 D3 CLKSTOP EPSS
  Power: setting=D0, actual=D0, Clock-stop-OK
GPIO: io=0, o=0, i=0, unsolicited=0, wake=0
Node 0x02 [Audio Output] wcaps 0x221: Stereo Digital Stripe
  Converter: stream=0, channel=0
  Digital: Enabled
  Digital category: 0x0
  IEC Coding Type: 0x0
Node 0x03 [Pin Complex] wcaps 0x400381: Stereo Digital
  Control: name="IEC958 Playback Con Mask", index=0, device=0
  Control: name="IEC958 Playback Pro Mask", index=0, device=0
  Control: name="IEC958 Playback Default", index=0, device=0
  Control: name="IEC958 Playback Switch", index=0, device=0
  Pincap 0x00000094: OUT Detect HDMI
  Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0xf, Sequence = 0x0
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Connection: 1
     0x02
Node 0x04 [Audio Output] wcaps 0x221: Stereo Digital Stripe
  Converter: stream=0, channel=0
  Digital: Enabled
  Digital category: 0x0
  IEC Coding Type: 0x0
Node 0x05 [Pin Complex] wcaps 0x400381: Stereo Digital
  Control: name="IEC958 Playback Con Mask", index=1, device=0
  Control: name="IEC958 Playback Pro Mask", index=1, device=0
  Control: name="IEC958 Playback Default", index=1, device=0
  Control: name="IEC958 Playback Switch", index=1, device=0
  Pincap 0x00000094: OUT Detect HDMI
  Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0xf, Sequence = 0x0
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Connection: 1
     0x04
Node 0x06 [Audio Output] wcaps 0x221: Stereo Digital Stripe
  Converter: stream=0, channel=0
  Digital: Enabled
  Digital category: 0x0
  IEC Coding Type: 0x0
Node 0x07 [Pin Complex] wcaps 0x400381: Stereo Digital
  Control: name="IEC958 Playback Con Mask", index=2, device=0
  Control: name="IEC958 Playback Pro Mask", index=2, device=0
  Control: name="IEC958 Playback Default", index=2, device=0
  Control: name="IEC958 Playback Switch", index=2, device=0
  Pincap 0x00000094: OUT Detect HDMI
  Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0xf, Sequence = 0x0
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Connection: 1
     0x06
Node 0x08 [Audio Output] wcaps 0x221: Stereo Digital Stripe
  Converter: stream=0, channel=0
  Digital: Enabled GenLevel
  Digital category: 0x2
  IEC Coding Type: 0x0
Node 0x09 [Pin Complex] wcaps 0x400381: Stereo Digital
  Control: name="IEC958 Playback Con Mask", index=3, device=0
  Control: name="IEC958 Playback Pro Mask", index=3, device=0
  Control: name="IEC958 Playback Default", index=3, device=0
  Control: name="IEC958 Playback Switch", index=3, device=0
  Pincap 0x00000094: OUT Detect HDMI
  Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0xf, Sequence = 0x0
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Connection: 1
     0x08
Node 0x0a [Audio Output] wcaps 0x221: Stereo Digital Stripe
  Converter: stream=0, channel=0
  Digital: Enabled
  Digital category: 0x0
  IEC Coding Type: 0x0
Node 0x0b [Pin Complex] wcaps 0x400381: Stereo Digital
  Control: name="IEC958 Playback Con Mask", index=4, device=0
  Control: name="IEC958 Playback Pro Mask", index=4, device=0
  Control: name="IEC958 Playback Default", index=4, device=0
  Control: name="IEC958 Playback Switch", index=4, device=0
  Pincap 0x00000094: OUT Detect HDMI
  Pin Default 0x185600f0: [Jack] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0xf, Sequence = 0x0
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Connection: 1
     0x0a
Node 0x0c [Audio Output] wcaps 0x221: Stereo Digital Stripe
  Converter: stream=0, channel=0
  Digital:
  Digital category: 0x0
  IEC Coding Type: 0x0
Node 0x0d [Pin Complex] wcaps 0x400381: Stereo Digital
  Pincap 0x00000094: OUT Detect HDMI
  Pin Default 0x585600f0: [N/A] Digital Out at Int HDMI
    Conn = Digital, Color = Unknown
    DefAssociation = 0xf, Sequence = 0x0
  Pin-ctls: 0x40: OUT
  Unsolicited: tag=00, enabled=0
  Connection: 1
     0x0c
--endcollapse--


!!USB Mixer information
!!---------------------
--startcollapse--

USB Mixer: usb_id=0x0db0543d, ctrlif=0, ctlerr=0
Card: Generic USB Audio at usb-0000:46:00.1-5, high speed
  Unit: 1
    Control: name="Clock Source 1 Validity", index=0
    Info: id=1, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 2
    Control: name="Clock Source 2 Validity", index=0
    Info: id=2, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 3
    Control: name="Clock Source 3 Validity", index=0
    Info: id=3, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 4
    Control: name="Clock Source 4 Validity", index=0
    Info: id=4, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 5
    Control: name="Clock Source 5 Validity", index=0
    Info: id=5, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 6
    Control: name="Clock Source 6 Validity", index=0
    Info: id=6, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 7
    Control: name="Line-In - Input Jack", index=0
    Info: id=7, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 8
    Control: name="Rear Mic-In - Input Jack", index=0
    Info: id=8, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 9
    Control: name="Front Mic-In - Input Jack", index=0
    Info: id=9, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 10
    Control: name="Headphone - Input Jack", index=0
    Info: id=10, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 11
    Control: name="Headphone - Input Jack", index=1
    Info: id=11, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 12
    Control: name="Headphone - Input Jack", index=2
    Info: id=12, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 13
    Control: name="PCM - Output Jack", index=0
    Info: id=13, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 14
    Control: name="PCM - Output Jack", index=1
    Info: id=14, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 15
    Control: name="PCM - Output Jack", index=2
    Info: id=15, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 16
    Control: name="Speaker - Output Jack", index=0
    Info: id=16, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 17
    Control: name="Headphone - Output Jack", index=0
    Info: id=17, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 18
    Control: name="IEC958 In - Output Jack", index=0
    Info: id=18, control=2, cmask=0x0, channels=1, type="BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 19
    Control: name="Input Gain Pad Control", index=0
    Info: id=19, control=12, cmask=0x0, channels=1, type="S16"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 19
    Control: name="Line-In Capture Volume", index=0
    Info: id=19, control=2, cmask=0x3, channels=2, type="S16"
    Volume: min=-4512, max=3072, dBmin=-1762, dBmax=1200
  Unit: 19
    Control: name="Line-In Capture Switch", index=0
    Info: id=19, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 20
    Control: name="Rear Mic-In Capture Volume", index=0
    Info: id=20, control=2, cmask=0x3, channels=2, type="S16"
    Volume: min=-4512, max=3072, dBmin=-1762, dBmax=1200
  Unit: 20
    Control: name="Rear Mic-In Capture Switch", index=0
    Info: id=20, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 21
    Control: name="Front Mic-In Capture Volume", index=0
    Info: id=21, control=2, cmask=0x3, channels=2, type="S16"
    Volume: min=-4512, max=3072, dBmin=-1762, dBmax=1200
  Unit: 21
    Control: name="Front Mic-In Capture Switch", index=0
    Info: id=21, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 22
    Control: name="Headphone Playback Volume", index=0
    Info: id=22, control=2, cmask=0xff, channels=8, type="S16"
    Volume: min=-16800, max=0, dBmin=-6562, dBmax=0
  Unit: 22
    Control: name="Headphone Playback Switch", index=0
    Info: id=22, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 23
    Control: name="Headphone Playback Volume", index=1
    Info: id=23, control=2, cmask=0x3, channels=2, type="S16"
    Volume: min=-16800, max=0, dBmin=-6562, dBmax=0
  Unit: 23
    Control: name="Headphone Playback Switch", index=1
    Info: id=23, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
  Unit: 24
    Control: name="Headphone Playback Switch", index=2
    Info: id=24, control=1, cmask=0x0, channels=1, type="INV_BOOLEAN"
    Volume: min=0, max=1, dBmin=0, dBmax=0
--endcollapse--


!!ALSA Device nodes
!!-----------------

crw-rw----+ 1 root audio 116,  8 Mar  7 11:30 /dev/snd/controlC0
crw-rw----+ 1 root audio 116, 16 Mar  7 11:30 /dev/snd/controlC2
crw-rw----+ 1 root audio 116,  7 Mar  7 11:30 /dev/snd/hwC0D0
crw-rw----+ 1 root audio 116,  6 Mar  7 11:30 /dev/snd/pcmC0D10p
crw-rw----+ 1 root audio 116,  2 Mar  7 11:30 /dev/snd/pcmC0D3p
crw-rw----+ 1 root audio 116,  3 Mar  7 11:30 /dev/snd/pcmC0D7p
crw-rw----+ 1 root audio 116,  4 Mar  7 12:51 /dev/snd/pcmC0D8p
crw-rw----+ 1 root audio 116,  5 Mar  7 11:30 /dev/snd/pcmC0D9p
crw-rw----+ 1 root audio 116, 10 Mar  7 11:30 /dev/snd/pcmC2D0c
crw-rw----+ 1 root audio 116,  9 Mar  7 13:48 /dev/snd/pcmC2D0p
crw-rw----+ 1 root audio 116, 12 Mar  7 11:30 /dev/snd/pcmC2D1c
crw-rw----+ 1 root audio 116, 11 Mar  7 11:30 /dev/snd/pcmC2D1p
crw-rw----+ 1 root audio 116, 14 Mar  7 11:30 /dev/snd/pcmC2D2c
crw-rw----+ 1 root audio 116, 13 Mar  7 11:30 /dev/snd/pcmC2D2p
crw-rw----+ 1 root audio 116, 15 Mar  7 11:30 /dev/snd/pcmC2D3p
crw-rw----+ 1 root audio 116,  1 Mar  7 11:30 /dev/snd/seq
crw-rw----+ 1 root audio 116, 33 Mar  7 11:30 /dev/snd/timer

/dev/snd/by-id:
total 0
drwxr-xr-x 2 root root  60 Mar  7 11:30 .
drwxr-xr-x 4 root root 420 Mar  7 11:30 ..
lrwxrwxrwx 1 root root  12 Mar  7 11:30 usb-Generic_USB_Audio-00 -> ../controlC2

/dev/snd/by-path:
total 0
drwxr-xr-x 2 root root  80 Mar  7 11:30 .
drwxr-xr-x 4 root root 420 Mar  7 11:30 ..
lrwxrwxrwx 1 root root  12 Mar  7 11:30 pci-0000:21:00.1 -> ../controlC0
lrwxrwxrwx 1 root root  12 Mar  7 11:30 pci-0000:46:00.1-usb-0:5:1.0 -> ../controlC2


!!Aplay/Arecord output
!!--------------------

APLAY

**** List of PLAYBACK Hardware Devices ****
card 0: HDMI [HDA ATI HDMI], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: HDMI [HDA ATI HDMI], device 7: HDMI 1 [HDMI 1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: HDMI [HDA ATI HDMI], device 8: HDMI 2 [HDMI 2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: HDMI [HDA ATI HDMI], device 9: HDMI 3 [HDMI 3]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 0: HDMI [HDA ATI HDMI], device 10: HDMI 4 [HDMI 4]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: Audio [USB Audio], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: Audio [USB Audio], device 1: USB Audio [USB Audio #1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: Audio [USB Audio], device 2: USB Audio [USB Audio #2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: Audio [USB Audio], device 3: USB Audio [USB Audio #3]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

ARECORD

**** List of CAPTURE Hardware Devices ****
card 2: Audio [USB Audio], device 0: USB Audio [USB Audio]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: Audio [USB Audio], device 1: USB Audio [USB Audio #1]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 2: Audio [USB Audio], device 2: USB Audio [USB Audio #2]
  Subdevices: 1/1
  Subdevice #0: subdevice #0

!!Amixer output
!!-------------

!!-------Mixer controls for card HDMI

Card hw:0 'HDMI'/'HDA ATI HDMI at 0xc0360000 irq 167'
  Mixer name	: 'ATI R6xx HDMI'
  Components	: 'HDA:1002aa01,00aa0100,00100700'
  Controls      : 35
  Simple ctrls  : 5
Simple mixer control 'IEC958',0
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958',1
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958',2
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958',3
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]
Simple mixer control 'IEC958',4
  Capabilities: pswitch pswitch-joined
  Playback channels: Mono
  Mono: Playback [on]

!!-------Mixer controls for card Audio

amixer: Mixer load hw:2 error: Broken pipe
Card hw:2 'Audio'/'Generic USB Audio at usb-0000:46:00.1-5, high speed'
  Mixer name	: 'USB Mixer'
  Components	: 'USB0db0:543d'
  Controls      : 38
amixer: Mixer hw:2 load error: Broken pipe


!!Alsactl output
!!--------------

--startcollapse--
--endcollapse--


!!All Loaded Modules
!!------------------

acpi_cpufreq
aesni_intel
ahci
amdgpu
ansi_cprng
autofs4
binfmt_misc
bluetooth
bnep
button
ccp
cpufreq_conservative
cpufreq_powersave
cpufreq_userspace
crc16
crc32_pclmul
crc32c_generic
crc32c_intel
crct10dif_pclmul
cryptd
crypto_simd
dca
drbg
drm
drm_kms_helper
ecc
ecdh_generic
edac_mce_amd
efi_pstore
efivarfs
efivars
evdev
ext4
fat
fuse
ghash_clmulni_intel
glue_helper
gpu_sched
hid
hid_generic
hid_logitech_dj
hid_logitech_hidpp
hwmon_vid
i2c_algo_bit
i2c_designware_core
i2c_designware_platform
i2c_piix4
igb
ip_tables
irqbypass
jbd2
joydev
kvm
kvm_amd
libahci
libata
lp
mbcache
mc
mfd_core
mxm_wmi
nct6775
nf_tables
nfc
nfnetlink
nls_ascii
nls_cp437
nvme
nvme_core
parport
parport_pc
pcspkr
ppdev
rfkill
rng_core
scsi_mod
sd_mod
sg
snd
snd_hda_codec
snd_hda_codec_hdmi
snd_hda_core
snd_hda_intel
snd_hwdep
snd_intel_dspcfg
snd_pcm
snd_rawmidi
snd_seq_device
snd_timer
snd_usb_audio
snd_usbmidi_lib
soundcore
sp5100_tco
ttm
uas
usb_storage
usbcore
usbhid
vboxdrv
vboxnetadp
vboxnetflt
vfat
vmmon
vmnet
vmw_vmci
vmw_vsock_vmci_transport
vmwgfx
vsock
wmi
wmi_bmof
x_tables
xhci_hcd
xhci_pci
zenpower


!!Sysfs Files
!!-----------

/sys/class/sound/hwC0D0/init_pin_configs:
0x03 0x185600f0
0x05 0x185600f0
0x07 0x185600f0
0x09 0x185600f0
0x0b 0x185600f0
0x0d 0x585600f0

/sys/class/sound/hwC0D0/driver_pin_configs:

/sys/class/sound/hwC0D0/user_pin_configs:

/sys/class/sound/hwC0D0/init_verbs:

/sys/class/sound/hwC0D0/hints:


!!ALSA/HDA dmesg
!!--------------




--nextPart8381802.gLf61FMqDs--



