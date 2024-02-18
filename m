Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3952A8596E2
	for <lists+alsa-devel@lfdr.de>; Sun, 18 Feb 2024 13:33:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53A02B6A;
	Sun, 18 Feb 2024 13:33:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53A02B6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708259620;
	bh=eYtZPEx+07UJa3cQ56bmqdmhg0yCVbIb+3F6bgoeDo0=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=liqXgho71kYrBrj42/lRo+7ICtbUFM1siDxHG8JE0kLT1LdvMdnI/XqykVDUB4nC8
	 7bzwNpI4u5MP3Qx9VWPqyYXYchyPG8KbigMqlDwCysxzl9zdbfKH2WDZIOBEVvhEA6
	 CnR8JPwL4iPofo25ssUrvaFaO1ih/qyTTvYV8w90=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C8EDDF805B0; Sun, 18 Feb 2024 13:33:02 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A446F805A0;
	Sun, 18 Feb 2024 13:33:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59247F80496; Sun, 18 Feb 2024 13:32:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 12357F8019B
	for <alsa-devel@alsa-project.org>; Sun, 18 Feb 2024 13:32:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12357F8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=G1SfwHPs
Received: by m.b4.vu (Postfix, from userid 1000)
	id 59DB5604B6AC; Sun, 18 Feb 2024 23:01:57 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 59DB5604B6AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1708259517; bh=03NkfLGbymydbLJWR1DaTvuFB7M+E8jeSeaMKnEzYPM=;
	h=Date:From:To:Cc:Subject:From;
	b=G1SfwHPsDKDGG91IIk2+eNHoIJ6nDTEnmSw8B+kNKaINqOHkda9HWGBRcdcpO/I6U
	 cDCMNg9hSZaKo1fbSLZNFHvt+GTNWzyVvRzPqXS6RomBE+/aLLDnq3+Ln14e4YVQjm
	 G/KnuMtmfqebGIdCvw1OmBz8wl444E6x/lXoSq1FnJPtIt6wd+9IyCXLbnXH6znwVN
	 ofXk9mo06Y1M79WA8ARdw3mjxtlF0Tz7ADCDWfLHqlNDwzIPq9p/JOUfnBoC0q2bjP
	 WEGYcGVuosbBDPBdZBiARLf8Daiqy2fBGYk62dmzTwVSz0pjURjF6TXUoK62v2akA5
	 HoiNpA7bUeHjg==
Date: Sun, 18 Feb 2024 23:01:57 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org
Subject: [PATCH] conf: USB-Audio: Add more Scarlett devices to the IEC958
 blacklist
Message-ID: <ZdH4vcOpKeqmmdHN@m.b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: LS27MRVT7KYUK4YGWMYP5G4KWXCX7BXH
X-Message-ID-Hash: LS27MRVT7KYUK4YGWMYP5G4KWXCX7BXH
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LS27MRVT7KYUK4YGWMYP5G4KWXCX7BXH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Scarlett Solo and 2i2 don't have S/PDIF outputs.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 src/conf/cards/USB-Audio.conf | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/src/conf/cards/USB-Audio.conf b/src/conf/cards/USB-Audio.conf
index 80631b2e..05384a32 100644
--- a/src/conf/cards/USB-Audio.conf
+++ b/src/conf/cards/USB-Audio.conf
@@ -66,8 +66,11 @@ USB-Audio.pcm.iec958_device {
 	"Plantronics USB Headset" 999
 	"Plantronics Wireless Audio" 999
 	"SB WoW Headset" 999
+	"Scarlett 2i2 4th Gen" 999
 	"Scarlett 2i2 USB" 999
 	"Scarlett 2i4 USB" 999
+	"Scarlett Solo 4th Gen" 999
+	"Scarlett Solo USB" 999
 	"Sennheiser USB headset" 999
 	"SWTOR Gaming Headset by Razer" 999
 	"ThinkStation P620 Main" 999
-- 
2.43.0

