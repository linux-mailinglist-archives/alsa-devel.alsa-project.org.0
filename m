Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10BE075B028
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 15:35:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EF33EA4D;
	Thu, 20 Jul 2023 15:34:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EF33EA4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689860131;
	bh=/g+tEANKRBGu9UzvRhyA5PsvjFsaBBmyfijxJKe5sSo=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SMhvt6SX0cfvAPNCG6YhSkfetVqmxUgdQN3Mwm4MaK1I0AmP4jUJ0uVyNao52hBOv
	 7mvmDzq/uuclg7w60hB5LXLTEFC5HQofH1HZ8IdDKA/aeKOtzZQktLapShprjm5/A7
	 70zCdDr6+g3EPyas3ZyGZhXq3JaBU4V1LFHSlkhk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C2E6F805DF; Thu, 20 Jul 2023 15:32:44 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9080DF805D6;
	Thu, 20 Jul 2023 15:32:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 783DAF805B6; Thu, 20 Jul 2023 15:32:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 493E5F8053B
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 15:32:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 493E5F8053B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=OiCa1YM4
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36KAupUq002185;
	Thu, 20 Jul 2023 08:32:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=+qN9Ba/zcDYNDAt+9zFzeFPD1ff0RraaH+W+sIKImwQ=; b=
	OiCa1YM4D1wcJwMtkZ4b28ksnu7xzCsgbN/Pc8On7U6GGqYdMRF1PoZr+JJDPYvV
	3tP5SbB/utXUkGXgmjHGsH3JNdwaGx4Y8w3G1/QaByxWaVAFmhgQbj4U9gzkM593
	ux+iKVrgY0RJxQ1NMNcR7y7MiZfJYq4Ne+6lAMsionfEPy0AfNFV2fC0OEDxFuU6
	KgNdStqbjSsx9fxvk1v0DajrQQMXVqGJIaQOFnjlBaLYncmqGlw+WMUxfEPJrO92
	dpTzemr15wsKsCdQ806DHByxIB2M3f9TjX4lJhu6wwIPK6je8x1SeepuM/Uzg844
	ugzNuOka4MYETm3mVMuC/A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gx5mq-7
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 08:32:14 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 20 Jul
 2023 14:32:11 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Thu, 20 Jul 2023 14:32:11 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id B07C2458;
	Thu, 20 Jul 2023 13:32:11 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1 10/11] ALSA: hda: cs35l41: Add device_link between HDA and
 cs35l41_hda
Date: Thu, 20 Jul 2023 14:31:46 +0100
Message-ID: <20230720133147.1294337-11-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
References: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: lOqeNVT_YXhfrgC4jjgXJ393fQACn_3F
X-Proofpoint-GUID: lOqeNVT_YXhfrgC4jjgXJ393fQACn_3F
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4ER2ZDPHLMXRJAT5V3QXGF7PRBGMB4PC
X-Message-ID-Hash: 4ER2ZDPHLMXRJAT5V3QXGF7PRBGMB4PC
X-MailFrom: prvs=25651755c6=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4ER2ZDPHLMXRJAT5V3QXGF7PRBGMB4PC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

To ensure consistency between the HDA core and the CS35L41 HDA
driver, add a device_link between them. This ensures that the
HDA core will suspend first, and resume second, meaning the
amp driver will not miss any events from the playback hook from
the HDA core during system suspend and resume.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 70aa819cfbd64..175378cdf9dfa 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -1063,6 +1063,7 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	struct hda_component *comps = master_data;
+	unsigned int sleep_flags;
 	int ret = 0;
 
 	if (!comps || cs35l41->index < 0 || cs35l41->index >= HDA_MAX_COMPONENTS)
@@ -1102,6 +1103,11 @@ static int cs35l41_hda_bind(struct device *dev, struct device *master, void *mas
 
 	mutex_unlock(&cs35l41->fw_mutex);
 
+	sleep_flags = lock_system_sleep();
+	if (!device_link_add(&comps->codec->core.dev, cs35l41->dev, DL_FLAG_STATELESS))
+		dev_warn(dev, "Unable to create device link\n");
+	unlock_system_sleep(sleep_flags);
+
 	pm_runtime_mark_last_busy(dev);
 	pm_runtime_put_autosuspend(dev);
 
@@ -1112,9 +1118,14 @@ static void cs35l41_hda_unbind(struct device *dev, struct device *master, void *
 {
 	struct cs35l41_hda *cs35l41 = dev_get_drvdata(dev);
 	struct hda_component *comps = master_data;
+	unsigned int sleep_flags;
 
-	if (comps[cs35l41->index].dev == dev)
+	if (comps[cs35l41->index].dev == dev) {
 		memset(&comps[cs35l41->index], 0, sizeof(*comps));
+		sleep_flags = lock_system_sleep();
+		device_link_remove(&comps->codec->core.dev, cs35l41->dev);
+		unlock_system_sleep(sleep_flags);
+	}
 }
 
 static const struct component_ops cs35l41_hda_comp_ops = {
-- 
2.34.1

