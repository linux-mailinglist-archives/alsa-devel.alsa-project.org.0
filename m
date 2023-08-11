Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A3A71778F96
	for <lists+alsa-devel@lfdr.de>; Fri, 11 Aug 2023 14:32:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6CAC823;
	Fri, 11 Aug 2023 14:31:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6CAC823
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691757148;
	bh=07B3Cz1R+7cH5DxgT053H7gWY6KQ30QjFw1bxMSXQUQ=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=V9BlGXXIJur5uN99WdKcYtZMzDneh6yjLNrv3KoyFJuYl5PYPGXdnzYIhX96Kpcxc
	 /PVVaCAO9vHiwDPcoVnUtbK7d7GLRRzn5EItNdq9NQxy5O4jySzv7a4u0IfYB+ZykB
	 sg3njCJNOMIo3vx5zGxqgAezgEDHkIZqhBCm1f3k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6634CF80134; Fri, 11 Aug 2023 14:31:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E7D88F80134;
	Fri, 11 Aug 2023 14:31:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 696A6F80166; Fri, 11 Aug 2023 14:31:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 91372F800EE
	for <alsa-devel@alsa-project.org>; Fri, 11 Aug 2023 14:30:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 91372F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=aBtWh4Mg
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37B4jYg9002344;
	Fri, 11 Aug 2023 07:30:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=h
	hhduN4oB/vVqd8ZUMEo5uHM1hgY/8p7OgZNP/Xb9Z0=; b=aBtWh4MgvOD5UGsE1
	vNVci/LnZkbAY8g0jHZNa2vRVWR1H1V6MjjV7HaN/YPpY3AVmB979D8udOyAkNdf
	Jzz2+9DVUj9w76kznQL1ya4zy2v1V8BZgSd3j/WqDYC9DxzTKtxfv0keEtquwzA9
	sMmrZa2/QyAY//gZ42K869ATKGhBa96DZcZvQAoYCfEb0hqUCM0xlK1korpdv6DL
	Z8c5Q2/erSZCZCqWPB/sGMI8d9J+ND1Ek+JvIQmjiF2KQDTT7Yz8Sb8QEcoCFsLu
	McXg+M50nHBFtClD3Lh3p5I2lPZ0/km9Ew6CcqLYbwO4ilJ5G9pGDQOwWOfAco7w
	Mi9eQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sd8yy0sf9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Aug 2023 07:30:53 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 11 Aug
 2023 13:30:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Fri, 11 Aug 2023 13:30:51 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.32])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 515CD3560;
	Fri, 11 Aug 2023 12:30:51 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1] ALSA: hda/cs8409: Support new Dell Dolphin Variants
Date: Fri, 11 Aug 2023 13:30:44 +0100
Message-ID: <20230811123044.1045651-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NzWRs9djwr4QD0ynpANCRUPlDBLkG1zS
X-Proofpoint-GUID: NzWRs9djwr4QD0ynpANCRUPlDBLkG1zS
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: JPIGHCPURUANO6OVTEKHCTASSDYMHHT6
X-Message-ID-Hash: JPIGHCPURUANO6OVTEKHCTASSDYMHHT6
X-MailFrom: prvs=35876c8166=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JPIGHCPURUANO6OVTEKHCTASSDYMHHT6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add 4 new Dell Dolphin Systems, same configuration as older systems.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409-tables.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index b288874e401e..36b411d1a960 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -550,6 +550,10 @@ const struct snd_pci_quirk cs8409_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0C50, "Dolphin", CS8409_DOLPHIN),
 	SND_PCI_QUIRK(0x1028, 0x0C51, "Dolphin", CS8409_DOLPHIN),
 	SND_PCI_QUIRK(0x1028, 0x0C52, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C73, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C75, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C7D, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C7F, "Dolphin", CS8409_DOLPHIN),
 	{} /* terminator */
 };
 
-- 
2.34.1

