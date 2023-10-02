Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A786D7B5C56
	for <lists+alsa-devel@lfdr.de>; Mon,  2 Oct 2023 23:06:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00B53850;
	Mon,  2 Oct 2023 23:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00B53850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696280762;
	bh=/gWTOW3g0NLPgaTHzMWkRkbCut//M2q1hL1RWHVU0sc=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=XLjdHCOfuW3mTxFWly79K3X8Liwqlb7q+FYfwzE70txmxhKjdgDrvQXXqkg2S6iV4
	 vfh4iYRiytno1yIfEaSCdyCWSqePPicHaPlAY+fbbLAtHSqEwboyPVPjw9Y/TzbA8O
	 UIMu7dWzWbDB68+Iwrr3Cl1Oe9HUEw9RBdberLIE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D288F80552; Mon,  2 Oct 2023 23:05:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A077F801EB;
	Mon,  2 Oct 2023 23:05:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49A57F80310; Mon,  2 Oct 2023 23:05:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail.meier-coaching.de (mail.epic-bytes.net
 [IPv6:2a03:4000:46:fa::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B363DF800C1
	for <alsa-devel@alsa-project.org>; Mon,  2 Oct 2023 23:05:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B363DF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=epic-bytes.net header.i=@epic-bytes.net
 header.a=rsa-sha256 header.s=2020 header.b=d8Fg+gyE
From: Markus Meier <kerneldev@epic-bytes.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epic-bytes.net;
	s=2020; t=1696280699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K4HJNyIu6e6N4yhR6yUM98AsV8LDkW5jTpFNsXvCTgw=;
	b=d8Fg+gyEIFJ0we9cBdXPNLs74dykbsw1/8quoc/mjYyh0xQIUjHxhiZvvGfzHDcoL7tqmT
	9JGubuqCqzopPFCmcUVfS2uV40dLOH60KTc377BQTHEcmfzFqIv/4QYuWwdchQ6XvJWVxq
	icE/hx+PbFNU2zdxYbJV+eJ7OBKzoCr4BAUpWoKmNBQgUSUPIYJNHoFxXp3EBt1tLBi7yr
	iKTC3HRuIsQgXi+Jyz3V6Ri/KOrpGd6ZZm8bUSJiJ3O7RULkGMrG4odzjelbbBwUO0vH4z
	2V9diWKWFuD2Qet4k7bTixDHjgalGmf89m2JCxPNs/7iDGY9eoZUOO/mfiKzfg==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=markus smtp.mailfrom=kerneldev@epic-bytes.net
To: alsa-devel@alsa-project.org
Subject: 
 [PATCH] ASoC: amd: yc: Fix non-functional mic on Lenovo Yoga Slim 7 Pro
 14ARH7 82UU
Date: Mon, 02 Oct 2023 23:04:57 +0200
Message-ID: <10347605.nUPlyArG6x@kali>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2242268.iZASKD2KPV"
Content-Transfer-Encoding: 7Bit
Message-ID-Hash: HPBLMIEE443XZ3K5SZZFIJVJPKINUF3U
X-Message-ID-Hash: HPBLMIEE443XZ3K5SZZFIJVJPKINUF3U
X-MailFrom: kerneldev@epic-bytes.net
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HPBLMIEE443XZ3K5SZZFIJVJPKINUF3U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This is a multi-part message in MIME format.

--nextPart2242268.iZASKD2KPV
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

I own a  Lenovo Yoga Slim 7 Pro 14ARH7 where the microphone is not showing up.
I added the system to the quirk table and the mic is working correctly (but 
with very low volume) now.

Here's an except from dmidecode:
System Information
        Manufacturer: LENOVO
        Product Name: 82UU
        Version: Yoga Slim 7 Pro 14ARH7
        SKU Number: LENOVO_MT_82UU_BU_idea_FM_Yoga Slim 7 Pro 14ARH7
        Family: Yoga Slim 7 Pro 14ARH7

Please add this patch to the kernel and add it to the stable kernels too. I 
guess the microphone should have worked before. Seems to be a regression 
introduced by c008323fe361bd62a43d9fb29737dacd5c067fb7

Thank you very much
Markus
--nextPart2242268.iZASKD2KPV
Content-Disposition: attachment;
 filename="yoga-slim-7-pro-82UU-microphone.patch"
Content-Transfer-Encoding: 7Bit
Content-Type: text/x-patch; charset="utf-8";
 name="yoga-slim-7-pro-82UU-microphone.patch"

--- a/sound/soc/amd/yc/acp6x-mach.c	2023-09-29 19:31:03.753786095 +0200
+++ b/sound/soc/amd/yc/acp6x-mach.c	2023-09-29 19:32:06.414276453 +0200
@@ -217,6 +217,13 @@
 		.driver_data = &acp6x_card,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "82UU"),
+		}
+	},
+	{
+		.driver_data = &acp6x_card,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_VENDOR, "LENOVO"),
 			DMI_MATCH(DMI_PRODUCT_NAME, "82V2"),
 		}
 	},

--nextPart2242268.iZASKD2KPV--



