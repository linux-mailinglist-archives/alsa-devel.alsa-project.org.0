Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C00AE84748A
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 17:18:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B60C85D;
	Fri,  2 Feb 2024 17:18:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B60C85D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706890708;
	bh=AE0SEUj7Y/tfMu8o/0l1ilY4/oHuzQA8xZ6TeYOyFJU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=elgP7LVqM9e8hCNvVzYx8Vsjoq4GGZFStp3p4ixZwn1O93M67oLa+yMYl8RHMUFrX
	 2ECqXUS9cCxmhJ6OKrimtmz1hLQvmzx9svL1C5H7xpLpOEMo8KdqEWPu8gJkLN5w5m
	 kCtyM11JK1sDEXj68RYgHKo5jH8uGmwNtoM0DO9M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AB66F805AD; Fri,  2 Feb 2024 17:17:56 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E8ADF80571;
	Fri,  2 Feb 2024 17:17:56 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 49380F8055B; Fri,  2 Feb 2024 17:17:46 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 68ADAF80548
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 17:17:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 68ADAF80548
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=U2D7rWPe
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 412G7T7N005383;
	Fri, 2 Feb 2024 10:17:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=d
	ztUlVgM3uruxT9g6eLIIFQ6JObOYYRKqDfkXdE9Lv4=; b=U2D7rWPeo0Kwqh2Mq
	qIqYSkGA2P9FvQOg8UODMnxUo/37N075UlLDm0Q6zn3erVVzSq+Zpr9FxfndCH1J
	FUYa0pl8gfSxTVyZNEnpwZ57YPhv0kopDBurQ+7yJNFYBKTJqtEsdpjQKc++eYzl
	V3fsUilNanUxqiDi+VU2KRZ1n6C7rd5ZDDjiGGPkBdb725t8dLKElgE91CQmGBcS
	HPUvhfoXi8E3maV3zNejSyt/YwPvKkyM7r7+MZ5nxVqsakM25a6d7w40sMLh6K7z
	oXGOePxSS441yRrlHFuV+BLu0OezMDfKyK/DEy06aMyfKcUsMByvqfB5vV0teZsG
	sdsbA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3w0puwgqxn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 10:17:35 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 16:17:33 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Fri, 2 Feb 2024 16:17:33 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.64.191])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id C43FD820246;
	Fri,  2 Feb 2024 16:17:32 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v1] ALSA: hda/realtek: Remove two HP Laptops using CS35L41
Date: Fri, 2 Feb 2024 16:17:27 +0000
Message-ID: <20240202161727.321373-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Lh3Nk5urHu-PSPEdo_zb_V356sj0i91C
X-Proofpoint-GUID: Lh3Nk5urHu-PSPEdo_zb_V356sj0i91C
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LAASFNPYT3UVXEMUFQH7YSVYIQGOMNIU
X-Message-ID-Hash: LAASFNPYT3UVXEMUFQH7YSVYIQGOMNIU
X-MailFrom: prvs=97625aa8a4=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LAASFNPYT3UVXEMUFQH7YSVYIQGOMNIU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

These two HP laptops are changing configurations.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_realtek.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 348505edf063..3d7e7b32fcf4 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -9855,8 +9855,6 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x103c, 0x8cdd, "HP Spectre", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8cde, "HP Spectre", ALC287_FIXUP_CS35L41_I2C_2),
 	SND_PCI_QUIRK(0x103c, 0x8cf5, "HP ZBook Studio 16", ALC245_FIXUP_CS35L41_SPI_4_HP_GPIO_LED),
-	SND_PCI_QUIRK(0x103c, 0x8d01, "HP EliteBook G12", ALC287_FIXUP_CS35L41_I2C_4),
-	SND_PCI_QUIRK(0x103c, 0x8d08, "HP EliteBook 1045 G12", ALC287_FIXUP_CS35L41_I2C_4),
 	SND_PCI_QUIRK(0x1043, 0x103e, "ASUS X540SA", ALC256_FIXUP_ASUS_MIC),
 	SND_PCI_QUIRK(0x1043, 0x103f, "ASUS TX300", ALC282_FIXUP_ASUS_TX300),
 	SND_PCI_QUIRK(0x1043, 0x106d, "Asus K53BE", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
-- 
2.34.1

