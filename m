Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B7F04DDD6C
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Mar 2022 16:58:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A49C917FD;
	Fri, 18 Mar 2022 16:57:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A49C917FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647619118;
	bh=31GKH30zyYGN58FGJXKooqQKlRJEka8mjXVvb21SXW4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=s6OxSbMr0x7IOY12X+Vzmu/QMZ4zOyvGE9txtGUKJu7/WKYjKOfQJ+EO4yLzTp8yR
	 sY9DbEjFqKEI3fW6sk8G8Uxdp8g5LLWgDY1zuxMU2w2MDH15WLuTv1A2Tb+qFnlUOA
	 JGQn5b59bdXD70+MHgOPIpSW2rtiB3TOWtyyhzaA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 418AFF80528;
	Fri, 18 Mar 2022 16:56:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2B018F80519; Fri, 18 Mar 2022 16:56:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A81EF8026D
 for <alsa-devel@alsa-project.org>; Fri, 18 Mar 2022 16:55:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A81EF8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="knSf6+xN"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22I7cSuG022149;
 Fri, 18 Mar 2022 10:55:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=TptiYHTwv6HKaE9kd08BF3y6+Op1c3qEBAVojTRE+oc=;
 b=knSf6+xN3c4x8cRS0d6EgdQ/rl+S0CHToo0adyXZDkKAun6ltjVrqzPZ5Yi4HP7ZsE0B
 kCmSwAWpnr8e9h4bruz9qha74UYQ0QRs/WyCJQ4MaqPRVtoPNQd9ww6WDzwI+7MIlSFS
 nY3JfyLJXJCr8m7Q7kRMWsM1HXXhXMp2OTrhxclhMHiaLZhygdvYBn1HtAj8sqwpUIBB
 O9nRgClPsIXTLzbSL3kaEUl00SBcoyAnSXI2WBnlbV2Fnxe64t4JIoiebmQB0ZzvVsnv
 k0qz48NUtT1pkTY8nV6AoeedW4Xsg5sxiHEhApx6EM38UR0WehEPWMQwsbslnhrbFri4 bA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3et642ee6v-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Mar 2022 10:55:58 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Fri, 18 Mar
 2022 15:55:55 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Fri, 18 Mar 2022 15:55:55 +0000
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.229])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 5DAD0B16;
 Fri, 18 Mar 2022 15:55:55 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 6/6] ALSA: hda/cs8409: Add new Dolphin HW variants
Date: Fri, 18 Mar 2022 15:55:52 +0000
Message-ID: <20220318155552.24751-7-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318155552.24751-1-vitalyr@opensource.cirrus.com>
References: <20220318155552.24751-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: gyAm4K5hAWkT3w0XHXO1qqoB-RMgszXN
X-Proofpoint-ORIG-GUID: gyAm4K5hAWkT3w0XHXO1qqoB-RMgszXN
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

Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/patch_cs8409-tables.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/pci/hda/patch_cs8409-tables.c b/sound/pci/hda/patch_cs8409-tables.c
index 8d20d7fb3d68..74c50ec040d9 100644
--- a/sound/pci/hda/patch_cs8409-tables.c
+++ b/sound/pci/hda/patch_cs8409-tables.c
@@ -532,6 +532,11 @@ const struct snd_pci_quirk cs8409_fixup_tbl[] = {
 	SND_PCI_QUIRK(0x1028, 0x0BBB, "Warlock MLK Dual Mic", CS8409_WARLOCK_MLK_DUAL_MIC),
 	SND_PCI_QUIRK(0x1028, 0x0BBC, "Warlock MLK", CS8409_WARLOCK_MLK),
 	SND_PCI_QUIRK(0x1028, 0x0BBD, "Warlock MLK Dual Mic", CS8409_WARLOCK_MLK_DUAL_MIC),
+	SND_PCI_QUIRK(0x1028, 0x0BD4, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0BD5, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0BD6, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0BD7, "Dolphin", CS8409_DOLPHIN),
+	SND_PCI_QUIRK(0x1028, 0x0BD8, "Dolphin", CS8409_DOLPHIN),
 	{} /* terminator */
 };
 
-- 
2.25.1

