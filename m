Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2059C599C3E
	for <lists+alsa-devel@lfdr.de>; Fri, 19 Aug 2022 14:54:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6DDA1635;
	Fri, 19 Aug 2022 14:53:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6DDA1635
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1660913648;
	bh=dlneTxSjVzNWORAX9I/FBXwZW3hYSFXTPRiLs/gRXWw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VDSpD7c4J5HHbpSDP7uQ79VHXkQtKlJ2mlM49aVM9Jb0Kjq584Hl/M6n5BxCstirT
	 +v+Qj81qRzjyil+kllxBysa96CdiWvTcDigLXSStiiQIiOihhont1uSCziqELVcUS1
	 C46BU6MM+G+GimeiDO1ggKqZJ84LfOTpOvLX5NlE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F41D2F80527;
	Fri, 19 Aug 2022 14:52:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B97FAF80527; Fri, 19 Aug 2022 14:52:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B5905F8016C
 for <alsa-devel@alsa-project.org>; Fri, 19 Aug 2022 14:52:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5905F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WRMPe6Is"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27JBix0P020060;
 Fri, 19 Aug 2022 07:52:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=fRxAdbE57d0qiTBUvDtalLSnCO5ib5KMTH5zZplYHSE=;
 b=WRMPe6IsGN6KjPBo/mSLOJD1f7lSd/FBuQ/iTtxmLeOVy6AS+Xp/lR5M5Fz5C0QACVea
 KxbezR8Bb+YY6rhU4bUx0zh1THNvisXfW+4v54NpA8KcsmrAfKD/vdsOzE0oZxwj0fEh
 W7xzszTWUOK6TefZvb8ma1iyCQ3WqpMFnmXkgvosXy+FpCWwOeSUimnjbUG8lMcoYIE0
 695a7sMW+omoGswvosSZloaVhyWz7lwzehMg6UXYNpJ/STq4rXQwwdqKTbYZ5byaRjJz
 ybuLBLcGPSly0OnV+3ChzZ9Nb/LVVP0YN3WjKMtxrLx5o679/Z/DjiZKsgSpExV/746+ SQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3hx8cpfuvn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Aug 2022 07:52:36 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.9; Fri, 19 Aug
 2022 07:52:34 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.9 via Frontend
 Transport; Fri, 19 Aug 2022 07:52:34 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.95])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 40B07B16;
 Fri, 19 Aug 2022 12:52:32 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 01/12] ASoC: cs42l42: Add SOFT_RESET_REBOOT register
Date: Fri, 19 Aug 2022 13:52:19 +0100
Message-ID: <20220819125230.42731-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220819125230.42731-1-rf@opensource.cirrus.com>
References: <20220819125230.42731-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xs4AYtngnCc7SOo6tZI9rnjN33jkVlp4
X-Proofpoint-GUID: xs4AYtngnCc7SOo6tZI9rnjN33jkVlp4
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
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

The SOFT_RESET_REBOOT register is needed to recover CS42L42 state after
a Soundwire bus reset.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 include/sound/cs42l42.h    | 5 +++++
 sound/soc/codecs/cs42l42.c | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/include/sound/cs42l42.h b/include/sound/cs42l42.h
index a55d522f1772..9cf4baabea52 100644
--- a/include/sound/cs42l42.h
+++ b/include/sound/cs42l42.h
@@ -34,6 +34,7 @@
 #define CS42L42_PAGE_24		0x2400
 #define CS42L42_PAGE_25		0x2500
 #define CS42L42_PAGE_26		0x2600
+#define CS42L42_PAGE_27		0x2700
 #define CS42L42_PAGE_28		0x2800
 #define CS42L42_PAGE_29		0x2900
 #define CS42L42_PAGE_2A		0x2A00
@@ -719,6 +720,10 @@
 
 #define CS42L42_SRC_SDOUT_FS		(CS42L42_PAGE_26 + 0x09)
 
+/* Page 0x27 DMA */
+#define CS42L42_SOFT_RESET_REBOOT	(CS42L42_PAGE_27 + 0x01)
+#define CS42L42_SFT_RST_REBOOT_MASK	BIT(1)
+
 /* Page 0x28 S/PDIF Registers */
 #define CS42L42_SPDIF_CTL1		(CS42L42_PAGE_28 + 0x01)
 #define CS42L42_SPDIF_CTL2		(CS42L42_PAGE_28 + 0x02)
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 42cdb051e0fb..440d414efe0a 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -294,6 +294,7 @@ static bool cs42l42_readable_register(struct device *dev, unsigned int reg)
 	case CS42L42_SPDIF_SW_CTL1:
 	case CS42L42_SRC_SDIN_FS:
 	case CS42L42_SRC_SDOUT_FS:
+	case CS42L42_SOFT_RESET_REBOOT:
 	case CS42L42_SPDIF_CTL1:
 	case CS42L42_SPDIF_CTL2:
 	case CS42L42_SPDIF_CTL3:
@@ -358,6 +359,7 @@ static bool cs42l42_volatile_register(struct device *dev, unsigned int reg)
 	case CS42L42_LOAD_DET_DONE:
 	case CS42L42_DET_STATUS1:
 	case CS42L42_DET_STATUS2:
+	case CS42L42_SOFT_RESET_REBOOT:
 		return true;
 	default:
 		return false;
-- 
2.30.2

