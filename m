Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA22A8475C7
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Feb 2024 18:09:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 41AFDA4A;
	Fri,  2 Feb 2024 18:09:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 41AFDA4A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706893774;
	bh=n7dJMVI068abkx41i1owQt7AFxVmgCir8E9N+Q7lsug=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=rglabZuBxAXz4flXAoRKFItxQ08gWtS7ebAUsgd0hRvg57QAlrfYxV1+3anU+9SjH
	 T8Vep72BdsK5VmeJTI7kT1bONUzGcJrINT5OW29hFc6nzyMUw4ORnfpa+hmz9c1ovn
	 wnEFUjbENq0IjdRp1eIeTXoU5qoK8j8D1+iIqp/0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2A9BF80588; Fri,  2 Feb 2024 18:09:00 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B9320F8055B;
	Fri,  2 Feb 2024 18:08:59 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7DE2FF8055C; Fri,  2 Feb 2024 18:08:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D8F30F800E3
	for <alsa-devel@alsa-project.org>; Fri,  2 Feb 2024 18:08:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8F30F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=YNpPnRm0
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 412G7M2j013161;
	Fri, 2 Feb 2024 11:08:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=o
	Y+0TBrmVbqVRe9GsKH89Cjn0lEAjYQJNhHXZcdhOnQ=; b=YNpPnRm0NwDchvvwK
	moKgLtwKB0r9shYJ+IUhVgMaKFQN3swErYgqrviPoa/MPnG3tx8e2t7cLqw8bJNs
	Ro9CG/O/T0p4OKt+DEIaf7xz6XPRHF6cx7XagMqNnEbIFBGrXbSTRqnQQmiZV2F6
	ChYl6EsdBWv7ijqCoiwJz2JRDjkFw2VxvYt5UOQ4kGI4DCjN7+lGOLSo99o0NhWP
	SP8IOXOB0IB9xoQy4uyK3WiAA6C0CoZpkzsZlC91Ze1UH1cg26k5DdZjeVgjQe91
	WIl64wikmAWL8wuutkZT3BSXshKglu5Ce4UwHkvBlAAlag57m/HQqrNQMTnnmXZH
	QPNOA==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3w0pwx0sd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 02 Feb 2024 11:08:46 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 2 Feb
 2024 17:08:44 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Fri, 2 Feb 2024 17:08:44 +0000
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.61.64.191])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 64B59820246;
	Fri,  2 Feb 2024 17:08:44 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        "Stefan
 Binding" <sbinding@opensource.cirrus.com>
Subject: [PATCH v2] ALSA: hda/realtek: Remove two HP Laptops using CS35L41
Date: Fri, 2 Feb 2024 17:08:42 +0000
Message-ID: <20240202170842.321818-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: nh77Ipbv6KCK5tgXpCvkIzzUfG8HapK2
X-Proofpoint-ORIG-GUID: nh77Ipbv6KCK5tgXpCvkIzzUfG8HapK2
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: QYGKD3F7YHIXFS3M4I76PDQZNIQJNPTO
X-Message-ID-Hash: QYGKD3F7YHIXFS3M4I76PDQZNIQJNPTO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QYGKD3F7YHIXFS3M4I76PDQZNIQJNPTO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The SKUs, and associated SSIDs, are no longer going to include the
CS35L41. They may come back, but will need a different quirk.

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

