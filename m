Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 812C5785AF5
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 16:41:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D096F832;
	Wed, 23 Aug 2023 16:40:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D096F832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692801689;
	bh=NEwDhcJOZJu8OgSPFzNvzQJwX/4PPmUjrgBIZ+TY7N4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=e1DdMDvwAa+/xRAkLBWcc6xNRh+5bipd2+g+KfWlJFeDrEympRO5FMFECleoyQd/E
	 BpIwBEaaN5t6h0A+H6GkHyyQL7bPm9OqxIqcNkMxHy0bFWBGtYUOt+XqXsz2jIeDXa
	 xUeE+Z12GVCkgBkn18P841jmNTC8DPnb2in6nSRw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 662D9F80537; Wed, 23 Aug 2023 16:40:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1E986F800F5;
	Wed, 23 Aug 2023 16:40:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6989F80158; Wed, 23 Aug 2023 16:40:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 69AACF800BF
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 16:40:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 69AACF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ggqUYTbv
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 37NBg6hW026375;
	Wed, 23 Aug 2023 09:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=E
	9S2a5IURUQeJLes+Z+GHmqCHiuKD3McZpXYa0JuDgE=; b=ggqUYTbvrySzyEBvA
	R084nja8c0b8NmgxGRUvcuXPic/e7wGkrlQopfcerWzlIT+OIqZdUsLVVUI2Yume
	/T8o4fM9++apC+J3E2I4CN6mZi/L0/1V9i+t4cr5MylnAw7HSb7ZV9WMb26nU8l3
	5xosC550E0rhITqzSvg8gt2BbAJ502CsPTbLvkQYFgnaO+RpjisNXzgDlsQuL2C7
	cmfZ5OjESeToQugjGV3R+SmtGzrVUWFJfD01yTTpO3FDUvrQ0BY0VPBmhBrFTM/w
	RNHh0R8hfOMv12mSXw01tMT2NHlt6Srm10xvqUIUE5p//r4n74x5DcYHAfRxxnxs
	/ebOQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3sn21s14ef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Aug 2023 09:40:05 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Wed, 23 Aug
 2023 15:40:03 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Wed, 23 Aug 2023 15:40:03 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (LONN493L163.ad.cirrus.com
 [198.90.238.81])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 36EEC11CD;
	Wed, 23 Aug 2023 14:40:03 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1] ALSA: hda: cs35l41: Override the _DSD for HP Zbook Fury 17
 G9 to correct boost type
Date: Wed, 23 Aug 2023 15:39:56 +0100
Message-ID: <20230823143956.755758-1-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: toETTWHLQ7Y02sdAOs62yhJ2OrDQIUiC
X-Proofpoint-ORIG-GUID: toETTWHLQ7Y02sdAOs62yhJ2OrDQIUiC
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 3XWGLNONJ37VY5JZJ4JL7NH7EEFQBW4L
X-Message-ID-Hash: 3XWGLNONJ37VY5JZJ4JL7NH7EEFQBW4L
X-MailFrom: prvs=3599cecbfe=sbinding@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3XWGLNONJ37VY5JZJ4JL7NH7EEFQBW4L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

CS35L41 HDA driver requires ACPI to contain correct _DSD properties to
correctly configure the device. Whilst the HP Zbook Fury 17 G9 contains
valid _DSD properties, the boost type has been configured incorrectly
in the _DSD for this laptop. We can override these properties to fix
the boost type.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda_property.c | 32 ++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/sound/pci/hda/cs35l41_hda_property.c b/sound/pci/hda/cs35l41_hda_property.c
index 9b5a1d61575e..b62a4e6968e2 100644
--- a/sound/pci/hda/cs35l41_hda_property.c
+++ b/sound/pci/hda/cs35l41_hda_property.c
@@ -43,6 +43,37 @@ static int lenovo_legion_no_acpi(struct cs35l41_hda *cs35l41, struct device *phy
 	return 0;
 }
 
+/*
+ * Device 103C89C6 does have _DSD, however it is setup to use the wrong boost type.
+ * We can override the _DSD to correct the boost type here.
+ * Since this laptop has valid ACPI, we do not need to handle cs-gpios, since that already exists
+ * in the ACPI.
+ */
+static int hp_vision_acpi_fix(struct cs35l41_hda *cs35l41, struct device *physdev, int id,
+			      const char *hid)
+{
+	struct cs35l41_hw_cfg *hw_cfg = &cs35l41->hw_cfg;
+
+	dev_info(cs35l41->dev, "Adding DSD properties for %s\n", cs35l41->acpi_subsystem_id);
+
+	cs35l41->index = id;
+	cs35l41->channel_index = 0;
+	cs35l41->reset_gpio = gpiod_get_index(physdev, NULL, 1, GPIOD_OUT_HIGH);
+	cs35l41->speaker_id = -ENOENT;
+	hw_cfg->spk_pos = cs35l41->index ? 1 : 0; // right:left
+	hw_cfg->gpio1.func = CS35L41_NOT_USED;
+	hw_cfg->gpio1.valid = true;
+	hw_cfg->gpio2.func = CS35L41_INTERRUPT;
+	hw_cfg->gpio2.valid = true;
+	hw_cfg->bst_type = CS35L41_INT_BOOST;
+	hw_cfg->bst_ind = 1000;
+	hw_cfg->bst_ipk = 4500;
+	hw_cfg->bst_cap = 24;
+	hw_cfg->valid = true;
+
+	return 0;
+}
+
 struct cs35l41_prop_model {
 	const char *hid;
 	const char *ssid;
@@ -53,6 +84,7 @@ struct cs35l41_prop_model {
 static const struct cs35l41_prop_model cs35l41_prop_model_table[] = {
 	{ "CLSA0100", NULL, lenovo_legion_no_acpi },
 	{ "CLSA0101", NULL, lenovo_legion_no_acpi },
+	{ "CSC3551", "103C89C6", hp_vision_acpi_fix },
 	{}
 };
 
-- 
2.34.1

