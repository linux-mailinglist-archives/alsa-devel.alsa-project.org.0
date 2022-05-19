Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D54B152DBDC
	for <lists+alsa-devel@lfdr.de>; Thu, 19 May 2022 19:51:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73CB017CF;
	Thu, 19 May 2022 19:50:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73CB017CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652982670;
	bh=DzfoxEx6B/Df2Rcc4CzDUdEgHPWaVIvZnRgqYkmrcvc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vZT6EHunaHAVWbkApM/u/M9nBBBJjspCXquwGgoRJQ3TDJ3cOOorBdgTgPXOBAfe/
	 hvDTh3Gb99yazWlA6ppqOLClHnNXi9bLKH1Z1XzfcdtGUllTVZHTk+F3Erw9qsMFB6
	 qNlKVO2yruO/JbWhrrRpC3TCnMdGevTONUMtd/Lw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 11F95F8055A;
	Thu, 19 May 2022 19:48:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6F72CF80537; Thu, 19 May 2022 19:48:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E169F804A9
 for <alsa-devel@alsa-project.org>; Thu, 19 May 2022 19:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E169F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Mij9nwrO"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24J5MiMr023727;
 Thu, 19 May 2022 12:47:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=07+bKshMN2pjy5EaaFU01+r/kDzygXVIRxpW/EeZQew=;
 b=Mij9nwrOem4k/tea26fTA1hxlddlnPnwpn3l8i+bgk/7z8E5CK+KX9J9nIXj3wAkG4mH
 I5eI+7x8FTGdOE5nJZ7ViWnEClLo8jHAm8TPYgg3BW+JTivzkGxbMyOEhCLjTCfhGScO
 EF0rW4fFjQMQPrbnTVSQZEUTRuKRbuKlZPcpiyAumPXW25P+j6WPBeb0hopRmIGZLfQ7
 KhceJxoNsF1voRHcAJlxHutnJAeA3K0qj+9F1CTRXbRWraJ1255OIGA7sB2lusNWAWJU
 EnPJQ69rZPFLBOQCXpmlvrGM0MtB1Y52FRhHPksFFu26yZGTjV3bft5Gn9pVhP6YkJIi 5g== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3g29u37tee-3
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 19 May 2022 12:47:53 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 19 May
 2022 18:47:51 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.24 via
 Frontend Transport; Thu, 19 May 2022 18:47:51 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.59])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 680AC476;
 Thu, 19 May 2022 17:47:51 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v3 05/17] ALSA: hda: cs35l41: Save Subsystem ID inside CS35L41
 Driver
Date: Thu, 19 May 2022 18:47:37 +0100
Message-ID: <20220519174749.15459-6-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519174749.15459-1-vitalyr@opensource.cirrus.com>
References: <20220519174749.15459-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 5vTZPxJuW46DRyu6jD-TbryyME5WnkqK
X-Proofpoint-ORIG-GUID: 5vTZPxJuW46DRyu6jD-TbryyME5WnkqK
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

Changes since v2:
 - No change

 sound/pci/hda/cs35l41_hda.c   | 3 +++
 sound/pci/hda/cs35l41_hda.h   | 1 +
 sound/pci/hda/hda_component.h | 1 +
 sound/pci/hda/patch_realtek.c | 1 +
 4 files changed, 6 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index fe2ba03e602b..c235b899aa04 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -346,6 +346,9 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 		return -EBUSY;
 
 	comps->dev = dev;
+	if (!cs35l41->acpi_subsystem_id)
+		cs35l41->acpi_subsystem_id = devm_kasprintf(dev, GFP_KERNEL,
+							    "%.8x", comps->subsystem_id);
 	cs35l41->codec = comps->codec;
 	strscpy(comps->name, dev_name(dev), sizeof(comps->name));
 	comps->playback_hook = cs35l41_hda_playback_hook;
diff --git a/sound/pci/hda/cs35l41_hda.h b/sound/pci/hda/cs35l41_hda.h
index 03c5f14631dd..b8352088a5cb 100644
--- a/sound/pci/hda/cs35l41_hda.h
+++ b/sound/pci/hda/cs35l41_hda.h
@@ -42,6 +42,7 @@ struct cs35l41_hda {
 	int channel_index;
 	unsigned volatile long irq_errors;
 	const char *amp_name;
+	const char *acpi_subsystem_id;
 	struct regmap_irq_chip_data *irq_data;
 	bool firmware_running;
 	bool halo_initialized;
diff --git a/sound/pci/hda/hda_component.h b/sound/pci/hda/hda_component.h
index 534e845b9cd1..fa6df52e7855 100644
--- a/sound/pci/hda/hda_component.h
+++ b/sound/pci/hda/hda_component.h
@@ -14,6 +14,7 @@
 struct hda_component {
 	struct device *dev;
 	char name[HDA_MAX_NAME_SIZE];
+	int subsystem_id;
 	struct hda_codec *codec;
 	void (*playback_hook)(struct device *dev, int action);
 };
diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
index 261b6ca6e85d..ef716f0b0052 100644
--- a/sound/pci/hda/patch_realtek.c
+++ b/sound/pci/hda/patch_realtek.c
@@ -6629,6 +6629,7 @@ static void cs35l41_generic_fixup(struct hda_codec *cdc, int action, const char
 			if (!name)
 				return;
 			spec->comps[i].codec = cdc;
+			spec->comps[i].subsystem_id = cdc->core.subsystem_id;
 			component_match_add(dev, &spec->match, component_compare_dev_name, name);
 		}
 		ret = component_master_add_with_match(dev, &comp_master_ops, spec->match);
-- 
2.34.1

