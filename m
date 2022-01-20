Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC68494C52
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jan 2022 11:57:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0BE32F89;
	Thu, 20 Jan 2022 11:56:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0BE32F89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642676257;
	bh=jp9qnG8Mjlr0zsMgm9bQXF4AHLv4P9YToCXfVR3QR4c=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HaJUw0c8uBFUb7rWEaAnv7PaTtLJUo1NxnFuCYslvRMfden3B7RwaW9KolBa8+tBU
	 qZ+nlgO136v5t+qetki4vOo/2UFSBW0yuIAAoq/8qRsZQEHqHM1ndVR5QUANMkMP9o
	 tp6hBzk0ml7N6LT90pQiFhAWufabPNk23po7R2vI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C98BF80134;
	Thu, 20 Jan 2022 11:56:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8A036F800F2; Thu, 20 Jan 2022 11:56:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6AC26F800F2
 for <alsa-devel@alsa-project.org>; Thu, 20 Jan 2022 11:56:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6AC26F800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="j2znbKDN"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20K4mpaE024668;
 Thu, 20 Jan 2022 04:56:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=euN68nd5YAlW/BA+lmkUTwFBJNJ7HjWDXKMiti0Rxx8=;
 b=j2znbKDN76IjBz6yq+D/KpT5bFOxq8fL2wOR6BQlY0S+MHHB9Pd9+4b2W2x7ohYkKUzx
 FIPMv44D1CnX4JT3rsM696qJp9LXd17Vwz1Kn8gY+H/v8OveYm1rezpfQjKedgSBfL+x
 L5b7vs9MwLekBCplPONGeTs4T0vV0dndDorHLwEyUW4LGfy4zaJPXyb6rvb26BsVC8Qs
 Yp/SfV8RLvAEZH2JzXrG4kbSYqCLSHcqPoEhoOkv6/vVZKeDySN9vdAdmeyfTZ3vqVMB
 qOKfrV3WSQcjYofJwsvC3AS6Wx9/a4pbebmVT1DJ9FNlJzNQOX94ZWQ1feAiaRDYsG9L rA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dpk9mh39e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 20 Jan 2022 04:56:21 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 20 Jan
 2022 10:56:19 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 20 Jan 2022 10:56:19 +0000
Received: from vitaly-Inspiron-5415.ad.cirrus.com (unknown [198.90.238.196])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D099546D;
 Thu, 20 Jan 2022 10:56:18 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Stefan
 Binding <sbinding@opensource.cirrus.com>, Vitaly Rodionov
 <vitalyr@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda/cs8409: Add new Warlock SKUs to patch_cs8409
Date: Thu, 20 Jan 2022 10:56:18 +0000
Message-ID: <20220120105618.249144-1-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: UnC3zu0dMcrNO6GV0JL1xls1YwvMcDeG
X-Proofpoint-GUID: UnC3zu0dMcrNO6GV0JL1xls1YwvMcDeG
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409-tables.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index df0b4522babf..2d1fa706327b 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -490,6 +490,8 @@ const struct snd_pci_quirk cs8409_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0ADC, "Warlock", CS8409_WARLOCK),
 	SND_PCI_QUIRK(0x1028, 0x0AF4, "Warlock", CS8409_WARLOCK),
 	SND_PCI_QUIRK(0x1028, 0x0AF5, "Warlock", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0BB5, "Warlock N3 15 TGL-U Nuvoton EC", CS8409_WARLOCK),
+	SND_PCI_QUIRK(0x1028, 0x0BB6, "Warlock V3 15 TGL-U Nuvoton EC", CS8409_WARLOCK),
 	SND_PCI_QUIRK(0x1028, 0x0A77, "Cyborg", CS8409_CYBORG),
 	SND_PCI_QUIRK(0x1028, 0x0A78, "Cyborg", CS8409_CYBORG),
 	SND_PCI_QUIRK(0x1028, 0x0A79, "Cyborg", CS8409_CYBORG),
-- 
2.25.1

