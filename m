Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF300560E09
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 02:28:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5CB6916E0;
	Thu, 30 Jun 2022 02:27:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5CB6916E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656548897;
	bh=37ZPllBb0DfH5TILIVHO9BALxVFWy0G74ymq32HeJvg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UnFOYWrVRTm7iaHNoc1cVGsZK25aUwwzWXBF/H3tUYW/FfLPL7PMx+h11QAOu0OvJ
	 /dX8Va2LiY0zSQKDHz5v0C4jzA2h4GY7u4Nzbr0hN5DH/w8H3nABpAYZSaNwkHt6nE
	 OkBbxtE3Hh0M2ip9r2ZXd2QfsVYcaG1qc27R1+Nw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D97AF805B2;
	Thu, 30 Jun 2022 02:24:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D946FF8053E; Thu, 30 Jun 2022 02:24:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 801AEF8053E
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 02:23:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 801AEF8053E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="MvYlCNp2"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25T7p0Oq020678;
 Wed, 29 Jun 2022 19:23:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=E+71Eh9SYDg5MyImEahaXx0zOcZBLdutmRTkhxlinfk=;
 b=MvYlCNp2HawwTFvItl/JaAwf5+sVepYd7pXfwyvCW7jcW0PivFU5FkF184KdHd+Krohs
 +bpYSlv8ri5MCPiGZ7+o5zIC/Zb9ro9Kx0buQFyiQabsV1Ps+YOEqDWVy42WEm0KmezB
 XcOgkGVuaOb1IqBQSCiPQ5S4dy2buMjO0uEcEbejz4n/YLrjBtBG6e9x6+uJuf0PL/YN
 alENaPs4qZT1sTcDqi9/JSJnzeaD/uSWG2hrve+CFiLGilmo2sQ7+wCcWsDH2uqSIOz8
 ea+HjNSMDBPcMTw0ngx/611qNQWnDeKRhlUZPQbnX3X+8FiUhO6sH1ZpE/t5qA0AcKVd RA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gwys2p9gm-8
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Jun 2022 19:23:52 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 30 Jun
 2022 01:23:48 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 30 Jun 2022 01:23:48 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.125])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 557A92D4;
 Thu, 30 Jun 2022 00:23:48 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v8 14/14] ALSA: hda: cs35l41: Add module parameter to control
 firmware load
Date: Thu, 30 Jun 2022 01:23:35 +0100
Message-ID: <20220630002335.366545-15-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220630002335.366545-1-vitalyr@opensource.cirrus.com>
References: <20220630002335.366545-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: i8-od-14hHWXXRzqEL-6MdUzhRX38s5u
X-Proofpoint-GUID: i8-od-14hHWXXRzqEL-6MdUzhRX38s5u
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
 sound/pci/hda/cs35l41_hda.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 5ae0b439d7e9..aa3d8fb3b2a2 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -8,6 +8,7 @@
 
 #include <linux/acpi.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <sound/hda_codec.h>
 #include <sound/soc.h>
 #include <linux/pm_runtime.h>
@@ -32,6 +33,11 @@
 #define CAL_DSP_CTL_TYPE		5
 #define CAL_DSP_CTL_ALG			205
 
+static bool firmware_autostart = 1;
+module_param(firmware_autostart, bool, 0444);
+MODULE_PARM_DESC(firmware_autostart, "Allow automatic firmware download on boot"
+			     "(0=Disable, 1=Enable) (default=1); ");
+
 static const struct reg_sequence cs35l41_hda_config[] = {
 	{ CS35L41_PLL_CLK_CTRL,		0x00000430 }, // 3072000Hz, BCLK Input, PLL_REFCLK_EN = 1
 	{ CS35L41_DSP_CLK_CTRL,		0x00000003 }, // DSP CLK EN
@@ -843,11 +849,16 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	cs35l41->firmware_type = HDA_CS_DSP_FW_SPK_PROT;
 
-	cs35l41->request_fw_load = true;
-	mutex_lock(&cs35l41->fw_mutex);
-	if (cs35l41_smart_amp(cs35l41) < 0)
-		dev_warn(cs35l41->dev, "Cannot Run Firmware, reverting to dsp bypass...\n");
-	mutex_unlock(&cs35l41->fw_mutex);
+	if (firmware_autostart) {
+		dev_dbg(cs35l41->dev, "Firmware Autostart.\n");
+		cs35l41->request_fw_load = true;
+		mutex_lock(&cs35l41->fw_mutex);
+		if (cs35l41_smart_amp(cs35l41) < 0)
+			dev_warn(cs35l41->dev, "Cannot Run Firmware, reverting to dsp bypass...\n");
+		mutex_unlock(&cs35l41->fw_mutex);
+	} else {
+		dev_dbg(cs35l41->dev, "Firmware Autostart is disabled.\n");
+	}
 
 	ret = cs35l41_create_controls(cs35l41);
 
-- 
2.34.1

