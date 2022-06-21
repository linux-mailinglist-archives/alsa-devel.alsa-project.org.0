Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7031B553DE8
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jun 2022 23:40:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E9F92070;
	Tue, 21 Jun 2022 23:39:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E9F92070
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1655847646;
	bh=ZHe3WzHKLG1yz7u1v8gHNJSxOQImrKgIYukZojDBmok=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bDyaJn7J59B3XsimpujfKpJCKfo+y9PJlRLK8n76uuIQ9HwucJMVeuMGQud9pg382
	 BS+CZQbwL0R5i93XWtsOuXBy2BJ6FA+zWPJFPSJPk4s5W5OG/+aH9iKrl7ylzW5Ikm
	 Q3za3h80hhuEdvIT2msG2jSCHXJgiUSZjZI9iV0o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF173F80557;
	Tue, 21 Jun 2022 23:38:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB2A6F80548; Tue, 21 Jun 2022 23:38:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B0D6F8030F
 for <alsa-devel@alsa-project.org>; Tue, 21 Jun 2022 23:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B0D6F8030F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com
 header.b="Ascl+/HS"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LBQrlL010673;
 Tue, 21 Jun 2022 16:38:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=22fxRs36mOwLx01C6ew27/L9/hScJO9HrYMwPcvStzY=;
 b=Ascl+/HS4hQSBUcfjilvnyBrvzlaszZT8iFTOlHlsMsY4wdxsr0oIAheappp90DxwiEq
 kmPSngJDf26W8G6CZa320YqPMt1OvGoK44LwUnoXfNEM2ApGIEhGT1wN0Ob1v+6pdJUn
 weEMEAijkclEVXZlCEPoYJybX1b17OHzHVax0t/x/+16jIQQtyuoDOKQV09PoD58hOuI
 /IOEjmgRDeP0c9VblGLBo0/5EIF+9wl922VwJUU+la365S164UUL1e7GfXNrUmmsWKzU
 y1CGyFQ0NGmA7aHTHXcRu7/5SEJ2BFlwgxCodtP4Rj/CR6suY6cxtcNRC5TLYNjOlNPf QQ== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gsc41c7yj-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Tue, 21 Jun 2022 16:38:06 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Tue, 21 Jun
 2022 22:38:04 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Tue, 21 Jun 2022 22:38:04 +0100
Received: from vitaly-Legion-7-16ACHg6.ad.cirrus.com (unknown [198.90.238.175])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CBF9A475;
 Tue, 21 Jun 2022 21:38:03 +0000 (UTC)
From: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Mark
 Brown <broonie@kernel.org>
Subject: [PATCH v6 06/14] ALSA: hda: cs35l41: Support reading subsystem id
 from ACPI
Date: Tue, 21 Jun 2022 22:37:53 +0100
Message-ID: <20220621213801.2021097-7-vitalyr@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220621213801.2021097-1-vitalyr@opensource.cirrus.com>
References: <20220621213801.2021097-1-vitalyr@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: EhAP18Rg7ulkxEBppA6JlKL7YYEMns6y
X-Proofpoint-ORIG-GUID: EhAP18Rg7ulkxEBppA6JlKL7YYEMns6y
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

On some laptop models, the ACPI contains the unique
Subsystem ID, and this value should be preferred
over the value from the HDA driver.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
Signed-off-by: Vitaly Rodionov <vitalyr@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 7f0132694774..5f89a0462eb6 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -545,6 +545,36 @@ static int cs35l41_hda_apply_properties(struct cs35l41_hda *cs35l41)
 	return cs35l41_hda_channel_map(cs35l41->dev, 0, NULL, 1, &hw_cfg->spk_pos);
 }
 
+static int cs35l41_get_acpi_sub_string(struct device *dev, struct acpi_device *adev,
+				       const char **subsysid)
+{
+	struct acpi_buffer buffer = { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
+	acpi_status status;
+	int ret = 0;
+
+	status = acpi_evaluate_object(adev->handle, "_SUB", NULL, &buffer);
+	if (ACPI_SUCCESS(status)) {
+		obj = buffer.pointer;
+		if (obj->type == ACPI_TYPE_STRING) {
+			*subsysid = devm_kstrdup(dev, obj->string.pointer, GFP_KERNEL);
+			if (*subsysid == NULL) {
+				dev_err(dev, "Cannot allocate Subsystem ID");
+				ret = -ENOMEM;
+			}
+		} else {
+			dev_warn(dev, "Warning ACPI _SUB did not return a string\n");
+			ret = -ENODEV;
+		}
+		acpi_os_free(buffer.pointer);
+	} else {
+		dev_dbg(dev, "Warning ACPI _SUB failed: %#x\n", status);
+		ret = -ENODEV;
+	}
+
+	return ret;
+}
+
 static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, int id)
 {
 	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
@@ -564,6 +594,12 @@ static int cs35l41_hda_read_acpi(struct cs35l41_hda *cs35l41, const char *hid, i
 	physdev = get_device(acpi_get_first_physical_node(adev));
 	acpi_dev_put(adev);
 
+	ret = cs35l41_get_acpi_sub_string(cs35l41->dev, adev, &cs35l41->acpi_subsystem_id);
+	if (ret)
+		dev_info(cs35l41->dev, "No Subsystem ID found in ACPI: %d", ret);
+	else
+		dev_dbg(cs35l41->dev, "Subsystem ID %s found", cs35l41->acpi_subsystem_id);
+
 	property = "cirrus,dev-index";
 	ret = device_property_count_u32(physdev, property);
 	if (ret <= 0)
-- 
2.34.1

