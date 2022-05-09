Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AB0520739
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 23:55:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1AE2118AB;
	Mon,  9 May 2022 23:54:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1AE2118AB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652133342;
	bh=Vo/pzIcHE1+rMUO5hxWBfoiy5LfJhQroggSdPazb6w4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dHGBUki1FnqXpAI1n6WtxIc/x/vZOGj+g0MCwM4q2BjN+aK0k8zXFwm0BhiLzGRel
	 rlmbaQiP+umzL/m4iOagoTGHE6hgtjR+KIYLytth3p06uX9IKJnyfO4xYGM14bmfgx
	 PMXzcR9u34iNdSNgrMzOGjWKIocPTQLt1kCQbYo0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E029F80533;
	Mon,  9 May 2022 23:47:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2A910F805D5; Mon,  9 May 2022 23:47:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08DD3F80539
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 23:47:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08DD3F80539
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="WgoWhogx"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 249Bt3ZI026043;
 Mon, 9 May 2022 16:47:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=pgkInMNM5lIa62Ktk5wuKfnn1hSjdv2G0txAHRzh1uw=;
 b=WgoWhogxzjdN8ooFcZF2UK6U7qiEupaj99PBeC1SlpPctk4Mej6uCYTPlrOz8pdByRGQ
 ttCkHjEnbzgnhYZpkei8lt5D/9jAdL0MaNa4GYgonOYJSW7JBjg5AjSBn01NmAvhb40m
 kLPMt5fyy7LgGMWkaCcJ3jpO9qc1nSo4yUpreQiMBorDDOB6cQOPxG7rYNDameqfxOSH
 5F/Z/VBI2ZuhTJUGV+jJHoc0P+WgnKCFNTvDbj+ADzCpiaQVVxC5TjjpcBidouKC6eHZ
 T+wNIurSBkYjYpjqteauZDi/YFByMnZHd0F+/oL+h6U4w4cYkbn4We7V2AoTT6TrZ0gB GQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3fwp613jeu-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Mon, 09 May 2022 16:47:18 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Mon, 9 May
 2022 22:47:14 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Mon, 9 May 2022 22:47:14 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.55])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6890EB10;
 Mon,  9 May 2022 21:47:14 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v2 26/26] ALSA: hda: cs35l41: Add kernel config to disable
 firmware autoload
Date: Mon, 9 May 2022 22:47:03 +0100
Message-ID: <20220509214703.4482-27-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
References: <20220509214703.4482-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: MBfTHE0xNtPHE-E8JrjwFUa-26pgXtx8
X-Proofpoint-ORIG-GUID: MBfTHE0xNtPHE-E8JrjwFUa-26pgXtx8
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

From: Stefan Binding <sbinding@opensource.cirrus.com>

By default, the driver will automatically load DSP firmware
for the amps, if available. Adding this option allows the
autoload to be optional, which allows for different configurations.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/Kconfig       |  7 +++++++
 sound/pci/hda/cs35l41_hda.c | 12 +++++++-----
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
index 1c378cca5dac..c4282dec4dd4 100644
--- a/sound/pci/hda/Kconfig
+++ b/sound/pci/hda/Kconfig
@@ -94,6 +94,13 @@ config SND_HDA_PATCH_LOADER
 config SND_HDA_SCODEC_CS35L41
 	tristate
 
+config SND_HDA_SCODEC_CS35L41_DISABLE_FIRMWARE_AUTOSTART
+	bool "Prevent CS35L41 from starting firmware on boot"
+	depends on SND_HDA_SCODEC_CS35L41
+	help
+	  Say Y here to prevent the CS35L41 HDA driver from loading DSP
+	  Firmware at boot
+
 config SND_HDA_CS_DSP_CONTROLS
 	tristate
 	depends on CS_DSP
diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 70e5354e3950..8b9e966145b5 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -773,11 +773,13 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	cs35l41->firmware_type = HDA_CS_DSP_FW_SPK_PROT;
 
-	cs35l41->request_fw_load = true;
-	mutex_lock(&cs35l41->fw_mutex);
-	if (cs35l41_smart_amp(cs35l41) < 0)
-		dev_warn(cs35l41->dev, "Cannot Run Firmware, reverting to dsp bypass...\n");
-	mutex_unlock(&cs35l41->fw_mutex);
+	if (!IS_ENABLED(CONFIG_SND_HDA_SCODEC_CS35L41_DISABLE_FIRMWARE_AUTOSTART)) {
+		cs35l41->request_fw_load = true;
+		mutex_lock(&cs35l41->fw_mutex);
+		if (cs35l41_smart_amp(cs35l41) < 0)
+			dev_warn(cs35l41->dev, "Cannot Run Firmware, reverting to dsp bypass...\n");
+		mutex_unlock(&cs35l41->fw_mutex);
+	}
 
 	cs35l41_create_controls(cs35l41);
 
-- 
2.34.1

