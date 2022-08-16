Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 888C9595EDF
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Aug 2022 17:20:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC8BB164D;
	Tue, 16 Aug 2022 17:19:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC8BB164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660663217;
	bh=H3aRlDHiXxx1sHqOfvTfoAuFyBTXprX+Ef+C8VPg9BI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RTXRO907lAQelT6b1s/zXw4/+UZb9oTeJ97U29zvE0A9Q/zqAqHDp3zVUI5Z7OhSh
	 l5/rs7l419W77tUYTkmTa/w9KcIE6zPCgcx2xt8m0I9TOUkkNA3G9R3CM9XF5NwKaq
	 ZIsBJNgkqjyZYdEc7Xydm8O6EnrIQbtI/qmMrWLA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 21F36F80424;
	Tue, 16 Aug 2022 17:19:19 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDE84F8032D; Tue, 16 Aug 2022 17:19:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F506F80095
 for <alsa-devel@alsa-project.org>; Tue, 16 Aug 2022 17:19:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F506F80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Yv5L2cys"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27GFJ7Gx027348;
 Tue, 16 Aug 2022 10:19:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=/FlnA0558NaZfbm9FoiqFaUgWEfiIaaYVvyyxrIy03A=;
 b=Yv5L2cysOVr69PD0OHQsmenSGqLGLpc/ufD/pAcfg+aT307I+Ojnc7KE2a5jZJ204vcy
 zVMSlFrWrs3Pk2ueFcJf2Iiisty7CMG7sGSBROucBfuk9jQBNeBG/F/wQyh1r8vAyUvH
 n4X7fpjJbwNzrQYx9kN2pfqhad5gMQvVvg7JJmtfapQ8lz29rOTfYxc9a/laXNhFudCm
 9B4SWQM34F+GCqS0anxhPdpxoTQYN/6hQqnGrxTI7kDvtGYW1NQpVT1a8RlwnofHY9Nk
 cX/yAHl79OT3HGBh452cxUO+L7Pg8qdUYRZqeUpDwIyjian4BIXUkj1EtkvIqka9239b ig== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3hx9c1unsa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Aug 2022 10:19:07 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Tue, 16 Aug
 2022 10:19:05 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Tue, 16 Aug 2022 10:19:05 -0500
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.202.160])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 68596477;
 Tue, 16 Aug 2022 15:19:04 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v1] ALSA: hda/cs8409: Support new Dolphin Variants
Date: Tue, 16 Aug 2022 16:19:01 +0100
Message-ID: <20220816151901.1398007-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: s1W5W0ZmA9_HVRK76i4LeKdVBm3JS0A9
X-Proofpoint-GUID: s1W5W0ZmA9_HVRK76i4LeKdVBm3JS0A9
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Stefan Binding <sbinding@opensource.cirrus.com>
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

Add 4 new Dolphin Systems, same configuration as older systems.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409-tables.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index e0d3a8be2e38..b288874e401e 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -546,6 +546,10 @@ const struct snd_pci_quirk cs8409_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0BD6, "Dolphin", CS8409_DOLPHIN),
 	SND_PCI_QUIRK(0x1028, 0x0BD7, "Dolphin", CS8409_DOLPHIN),
 	SND_PCI_QUIRK(0x1028, 0x0BD8, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C43, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C50, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C51, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0C52, "Dolphin", CS8409_DOLPHIN),
 	{} /* terminator */
 };
 
-- 
2.34.1

