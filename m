Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B34637A37
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Nov 2022 14:47:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46AAC16FE;
	Thu, 24 Nov 2022 14:46:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46AAC16FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669297648;
	bh=GMUmNKcAxWiR8eI2+77hTiTHimW//4p17ncqUVlKUyk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pucCkvxqB2T8R2yFMjZCq44PjVErQhavQW08TXKECsH3Y6LDLGZGQ+zaJT/a2xRAX
	 JS4q5Yy3sazAcj4pj+Jn2/BG2MOmh4KmnQw7Hoou49OBjAU/VFM6KeK7TOW8k3naCK
	 no8Y1FskfOa0WV0j8HsqFGl9GCVb7R9Gec0GB6Zg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DC76AF8014E;
	Thu, 24 Nov 2022 14:46:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4B506F80448; Thu, 24 Nov 2022 14:46:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1A4BFF80115
 for <alsa-devel@alsa-project.org>; Thu, 24 Nov 2022 14:45:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A4BFF80115
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="TCS6JvQT"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2AO7cYHg023037; Thu, 24 Nov 2022 07:45:58 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=PCU4Pz6VEwUh1O9LfRadkp/i9tn0sdXIUuT+Z2opB2c=;
 b=TCS6JvQTrDcEytg2JdkM+K8wrrs1vyJah4eYGmPpWNjMfPXcn4MgkBL3JraChi3Ts9xt
 0IIVVBVso3A99ffzUyI0Uqmq9a69whZPaAj5tP6Wa0H9h4XN0c+TuwWKalaQMISf20Op
 qScH7g5PsvPsswRhu1UmrBDCzSpE3CuAoX1E9b5YzrmWoAg16MfDRuQTx9ml4/9ntR+M
 y/+XF3Fj9XJVsoGVDCHKJgb/hAwkMbaoIg3uH7HlY7pSN+17h/WHDv2EEkqOoJi+B1pS
 /7GH+ajwSTkk2TcZEXvlLzpI3FGXRBfTJMZe1RRRU1O6NRAMVTC1iWqSUAmBrVPJUnn0 /w== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3kxvet664v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Nov 2022 07:45:58 -0600
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.20; Thu, 24 Nov
 2022 07:45:56 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.20 via
 Frontend Transport; Thu, 24 Nov 2022 07:45:56 -0600
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.111])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7B0DCB10;
 Thu, 24 Nov 2022 13:45:56 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
Subject: [PATCH 1/2] firmware: cs_dsp: Rename KConfig symbol CS_DSP ->
 FW_CS_DSP
Date: Thu, 24 Nov 2022 13:45:55 +0000
Message-ID: <20221124134556.3343784-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221124134556.3343784-1-rf@opensource.cirrus.com>
References: <20221124134556.3343784-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: vOPWZzwnsAehjm0bqyk6nRgU7uk7Uc57
X-Proofpoint-GUID: vOPWZzwnsAehjm0bqyk6nRgU7uk7Uc57
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

Qualify the KConfig symbol for cs_dsp by adding a FW_ prefix so that
it is more explicit what is being referred to. This is preparation for
using the symbol to namespace the exports.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 drivers/firmware/cirrus/Kconfig  | 2 +-
 drivers/firmware/cirrus/Makefile | 2 +-
 sound/pci/hda/Kconfig            | 2 +-
 sound/soc/codecs/Kconfig         | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/cirrus/Kconfig b/drivers/firmware/cirrus/Kconfig
index f9503cb481d2..3ccbe14e4b0c 100644
--- a/drivers/firmware/cirrus/Kconfig
+++ b/drivers/firmware/cirrus/Kconfig
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
-config CS_DSP
+config FW_CS_DSP
 	tristate
 	default n
diff --git a/drivers/firmware/cirrus/Makefile b/drivers/firmware/cirrus/Makefile
index f074e2638c9c..b91318ca0ff4 100644
--- a/drivers/firmware/cirrus/Makefile
+++ b/drivers/firmware/cirrus/Makefile
@@ -1,3 +1,3 @@
 # SPDX-License-Identifier: GPL-2.0
 #
-obj-$(CONFIG_CS_DSP)		+= cs_dsp.o
+obj-$(CONFIG_FW_CS_DSP)		+= cs_dsp.o
diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index a8e8cf98befa..06d304db4183 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -98,7 +98,7 @@ config SND_HDA_SCODEC_CS35L41
 
 config SND_HDA_CS_DSP_CONTROLS
 	tristate
-	select CS_DSP
+	select FW_CS_DSP
 
 config SND_HDA_SCODEC_CS35L41_I2C
 	tristate "Build CS35L41 HD-audio side codec support for I2C Bus"
diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 6b3726a1ff45..0f9d71490075 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -349,7 +349,7 @@ config SND_SOC_WM_HUBS
 
 config SND_SOC_WM_ADSP
 	tristate
-	select CS_DSP
+	select FW_CS_DSP
 	select SND_SOC_COMPRESS
 	default y if SND_SOC_MADERA=y
 	default y if SND_SOC_CS47L24=y
-- 
2.30.2

