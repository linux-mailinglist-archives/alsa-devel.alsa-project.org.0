Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1FA560DF0
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jun 2022 02:26:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 14B7A169E;
	Thu, 30 Jun 2022 02:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 14B7A169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656548783;
	bh=feZkdsluaObOL93VYFyb08SF8GEqblIXb8FS4d3dah4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vmiliY9bjc8aF6bIVt8wd878tnUVUBiLkJbTS5kFoxyN/gvwATbc2gNJ6fya62ifX
	 toczO9j+1hacGUsJm7JLy/f0ZgmzZyOdXJVDnFHEoZq5I49EEgRKs4WkEW2oNrgZur
	 u7/gRiSVq7SML330aQUl0ABp+OL03Ih38Y8vnQVw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 53799F80536;
	Thu, 30 Jun 2022 02:24:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 36C1BF804D9; Thu, 30 Jun 2022 02:24:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8101F804D9
 for <alsa-devel@alsa-project.org>; Thu, 30 Jun 2022 02:23:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8101F804D9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="oDiKg+Ho"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25T7p0Ol020678;
 Wed, 29 Jun 2022 19:23:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=QmDjaLKfAOYiEPQn9A1taGzywJymWFuV9U7VCcxq5Uk=;
 b=oDiKg+Ho8IkiVJP7w9byDj31tCpX04rxQt6jdoArGoHB0H34Jf3TPiCG9d83Hwz24R6Q
 Y0dBWnBhRefivw/A/mjTypyikoKF/PE9CzIW78KJCHLCiKSGsdQ34gq2iUaIbQmUs3Wn
 2m76ZJhGO5M+NfONdvHTUL7oHflNTGuCleggjOgvoLXW7svMTyeWHc/m1OVrHY9/27Kw
 KDNs9OKsX6Bp0y/5gl1gC+F1moPy8nQK7KZ1V6ERT9UU8czUDXhI6cdTQeUeksKOKfhL
 EK/JfJP/YogALotbSz42XRY+sYZDYYv2ZyInldersd8WZ+CCaExkmwaYMgBQhamBTE6o fQ== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gwys2p9gm-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Wed, 29 Jun 2022 19:23:48 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 30 Jun
 2022 01:23:45 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 30 Jun 2022 01:23:45 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.125])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7AD787C;
 Thu, 30 Jun 2022 00:23:45 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v8 05/14] ALSA: hda: cs35l41: Save Subsystem ID inside CS35L41
 Driver
Date: Thu, 30 Jun 2022 01:23:26 +0100
Message-ID: <20220630002335.366545-6-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220630002335.366545-1-vitalyr@opensource.cirrus.com>
References: <20220630002335.366545-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kvEv9EaAUrd-rPf5qGz_uSRC99dwagr8
X-Proofpoint-GUID: kvEv9EaAUrd-rPf5qGz_uSRC99dwagr8
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

The Subsystem ID is read from the HDA driver, and will
be used by the CS35L41 driver to be able to uniquely
identify the laptop, which is required to be able to
define firmware to be used by specific models.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 3 +++
 sound/pci/hda/cs35l41_hda.h | 1 +
 2 files changed, 4 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index e0d236eae93e..b6e94e7b482a 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -355,6 +355,9 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 		return -EBUSY;
 
 	comps->dev = dev;
+	if (!cs35l41->acpi_subsystem_id)
+		cs35l41->acpi_subsystem_id = devm_kasprintf(dev, GFP_KERNEL, "%.8x",
+							    comps->codec->core.subsystem_id);
 	cs35l41->codec = comps->codec;
 	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
 	comps->playback_hook = cs35l41_hda_playback_hook;
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index 5814af050944..b57f59a1ba49 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -42,6 +42,7 @@ struct cs35l41_hda {
 	int channel_index;
 	unsigned volatile long irq_errors;
 	const char *amp_name;
+	const char *acpi_subsystem_id;
 	struct mutex fw_mutex;
 	struct regmap_irq_chip_data *irq_data;
 	bool firmware_running;
-- 
2.34.1

