Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6874A8352
	for <lists+alsa-devel@lfdr.de>; Thu,  3 Feb 2022 12:51:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E75A4173B;
	Thu,  3 Feb 2022 12:50:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E75A4173B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643889105;
	bh=j9nBHSUzy+JSJjqwxay0EhWzGzHCn8K3kCGpsrEEnB4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NqZfGYB28Br6If+MqzGyz1scqywzh+F77yk+FKK6JlXonhJPM1ERrRsVgn3ylBmSi
	 lQNiiRJdGIA8mI8BL8BxzfVeCUgGU1YZUZXSZZVV14Bb1L4oW6PE5ct/aLqRoJIqfU
	 szrk3WCF5NPUkkMYjM/eSvkL2cE4ql1Dit8gyFU4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 66188F80163;
	Thu,  3 Feb 2022 12:50:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86515F80163; Thu,  3 Feb 2022 12:50:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D6D5F80163
 for <alsa-devel@alsa-project.org>; Thu,  3 Feb 2022 12:50:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D6D5F80163
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Ehv4iePB"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 2138u7Pw029786;
 Thu, 3 Feb 2022 05:50:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-type;
 s=PODMain02222019; bh=2WKnBx3l5NYHipKSQsQgIE+n/fkoHA8NCe7bJwQurMY=;
 b=Ehv4iePBfABlT5xmZvJxh6pftST7iCbfHOlh+34VtO07waUIFHU77Valu6m3+++sp/iy
 0nxd0xeAIM29fPecUK/22GhnJTg7ijrihOfRxpZlRWY9Y+w0+YWDiN1eG3SbGvysL0QA
 BLfrJCX7iPBfZItMEGmTP7IEBVYkNFl5HJwZQCd7KjQvWCnCb0g9HlgsEEpM5xn4w6SB
 FziexPDjTV+W30r1LStucVUCy0kKh4fDGEyWD/hD4I/J1sYNRL+TT/9sTQWzi7O3l10S
 LOUka5nDcOBKiNmVGfecm83TexL05kWT1xuhkuEmvETXuBoQ6YxJcNQmnOF3PiN7j0wo jA== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3dyw8cgw58-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 03 Feb 2022 05:50:27 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 3 Feb
 2022 11:50:25 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Thu, 3 Feb 2022 11:50:25 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 9E2667C;
 Thu,  3 Feb 2022 11:50:25 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH] ASoC: madera: Add dependencies on MFD
Date: Thu, 3 Feb 2022 11:50:25 +0000
Message-ID: <20220203115025.16464-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-GUID: 05U-rPTcXf_KC9dvNt5IztTiOsUWv08W
X-Proofpoint-ORIG-GUID: 05U-rPTcXf_KC9dvNt5IztTiOsUWv08W
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com
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

The Madera CODECs use regmap_irq functions but nothing ensures that
regmap_irq is built into the kernel. Add dependencies on the ASoC
symbols for the relevant MFD component. There is no point in building
the ASoC driver if the MFD doesn't support it and the MFD part contains
the necessary dependencies to ensure everything is built into the
kernel.

Reported-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index d6b8f5cb6ef8b..68ad04ab3349c 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -733,6 +733,7 @@ config SND_SOC_CS4349
 
 config SND_SOC_CS47L15
 	tristate
+	depends on MFD_CS47L15
 
 config SND_SOC_CS47L24
 	tristate
@@ -740,15 +741,19 @@ config SND_SOC_CS47L24
 
 config SND_SOC_CS47L35
 	tristate
+	depends on MFD_CS47L35
 
 config SND_SOC_CS47L85
 	tristate
+	depends on MFD_CS47L85
 
 config SND_SOC_CS47L90
 	tristate
+	depends on MFD_CS47L90
 
 config SND_SOC_CS47L92
 	tristate
+	depends on MFD_CS47L92
 
 # Cirrus Logic Quad-Channel ADC
 config SND_SOC_CS53L30
-- 
2.11.0

