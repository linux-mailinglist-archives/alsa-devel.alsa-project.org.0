Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C313A4E42D6
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Mar 2022 16:21:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AECF16F9;
	Tue, 22 Mar 2022 16:21:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AECF16F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1647962517;
	bh=jiX+/NAdjZekLD/b+pYslgbzb9NvPsMhR80p/cU40eo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CweEgi8pnNmxkNgAELZ6TDrAxorXUEgQorL3dCs4P+mhSUq377ryDnfA6/Q5VRott
	 PJGdDcEK/kGMy+V2teVJu31InjpzvcTN9KD+X1y+jOVIafK/pE6jjhB+FAeait94ZH
	 XDj7o0NEQSo7XNsQ2mRnARXB+l0n5LIFs7osQlGA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4055FF8053D;
	Tue, 22 Mar 2022 16:19:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05DBBF8052E; Tue, 22 Mar 2022 16:18:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BD86CF800F5
 for <alsa-devel@alsa-project.org>; Tue, 22 Mar 2022 16:18:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BD86CF800F5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TbUGImzM"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 22MCnUfA013136;
 Tue, 22 Mar 2022 10:18:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=0CFqoZxdKyNJco3f8odaQL1z1+afH8ZrsmpzaVKSkkk=;
 b=TbUGImzMQScN+qGQt/JmPyL5NJ7xcyyqQJ7wkFQ6RSWeqjjvP1PyYHe35R+mCJR8Fss0
 ZLYRQq6yP1bAYiaSSh7Xj3LkdoXNnngjuJi8PrHmdoiCiqz4F5UwHG4SEVxiT3AJmEm7
 kp3o+wbwvgbZU1uF/SZN4Nx5fX+/2bZIh1pFb7FiIohDPa/Ppo5013BmZV4rpQYj4qX2
 8xk1PTmMxcpeFQ1oHA9VcLh0D1f51sAmSuqODc0UpiSVKbzoAB8nLcbMQL1Ybaf4GqrP
 IccorA8fkzPNxjCpqd4tFyz6jdJY1/LSFCMMzmGpeBzEnsSRrut2eyMTrW+IZpAWBEu6 Mg== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3ewbknc0jc-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 22 Mar 2022 10:18:37 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Tue, 22 Mar
 2022 15:18:32 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.18 via
 Frontend Transport; Tue, 22 Mar 2022 15:18:32 +0000
Received: from aryzen.ad.cirrus.com (unknown [198.61.65.125])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 2474A477;
 Tue, 22 Mar 2022 15:18:32 +0000 (UTC)
From: Lucas Tanure <tanureal@opensource.cirrus.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v5 04/16] ALSA: hda: cs35l41: Fix I2S params comments
Date: Tue, 22 Mar 2022 15:18:07 +0000
Message-ID: <20220322151819.4299-5-tanureal@opensource.cirrus.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322151819.4299-1-tanureal@opensource.cirrus.com>
References: <20220322151819.4299-1-tanureal@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: yEChaPBpx6uFjRr2aM-LQN_WduenKueB
X-Proofpoint-GUID: yEChaPBpx6uFjRr2aM-LQN_WduenKueB
X-Proofpoint-Spam-Reason: safe
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 devicetree@vger.kernel.org
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

Fix clock and slot size comments

Signed-off-by: Lucas Tanure <tanureal@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index e00ceaca79c0..d2addae8c085 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -17,11 +17,11 @@
 #include "cs35l41_hda.h"
 
 static const struct reg_sequence cs35l41_hda_config[] = {
-	{ CS35L41_PLL_CLK_CTRL,		0x00000430 }, // 3200000Hz, BCLK Input, PLL_REFCLK_EN = 1
+	{ CS35L41_PLL_CLK_CTRL,		0x00000430 }, // 3072000Hz, BCLK Input, PLL_REFCLK_EN = 1
 	{ CS35L41_GLOBAL_CLK_CTRL,	0x00000003 }, // GLOBAL_FS = 48 kHz
 	{ CS35L41_SP_ENABLES,		0x00010000 }, // ASP_RX1_EN = 1
 	{ CS35L41_SP_RATE_CTRL,		0x00000021 }, // ASP_BCLK_FREQ = 3.072 MHz
-	{ CS35L41_SP_FORMAT,		0x20200200 }, // 24 bits, I2S, BCLK Slave, FSYNC Slave
+	{ CS35L41_SP_FORMAT,		0x20200200 }, // 32 bits RX/TX slots, I2S, clk consumer
 	{ CS35L41_DAC_PCM1_SRC,		0x00000008 }, // DACPCM1_SRC = ASPRX1
 	{ CS35L41_AMP_DIG_VOL_CTRL,	0x00000000 }, // AMP_VOL_PCM  0.0 dB
 	{ CS35L41_AMP_GAIN_CTRL,	0x00000084 }, // AMP_GAIN_PCM 4.5 dB
-- 
2.35.1

