Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6C675B01D
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 15:34:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F14931F3;
	Thu, 20 Jul 2023 15:33:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F14931F3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689860067;
	bh=De+MieM1Jel576IPtwvHpSppU5zDx/qASpqAqj5an4g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=E1Qn8B5k2XkCVXbJ27OXklTTrwrdIJsbsMBAu8RCWtNJOMxjN2RPyvjWwtfIp5UUG
	 xGKVme3PJgwDrpAzFSTHVzI09y9yiD+rRneVoZyYtVtMv/zbF2kQ09ImSHo6FDkA3i
	 4DPW1UjWKvOUXjPKKuWfcpgpyeRNOUzX0mZLf3ZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 41437F805AB; Thu, 20 Jul 2023 15:32:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63E51F80527;
	Thu, 20 Jul 2023 15:32:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B6BEF80571; Thu, 20 Jul 2023 15:32:27 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id CC53EF8047D
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 15:32:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC53EF8047D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=I1wqhfTK
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36K6Acqb016432;
	Thu, 20 Jul 2023 08:32:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=Ud/QBJHaAFqyPCB/So8Atv4/aEQFcV6W/YWOD6HpSgY=; b=
	I1wqhfTKKUOwzKpVHLzgGt2KiYujmtkvGCZze+QY2PjtNPLeCiTSqZbnlTMHzeJI
	W9Tisain17c3wcf9QoShKPy+fQdYc4RNeCZnIsxicNE5sEy9n3jDzrwD1HrwagN/
	U4BGqnvmSq7LHHarGCG6vgXVwKPk+euhneaEhHjPHXT8t3cCqhZrJwjmO4e23gke
	jnBJ6J6EywWmqdP5Iv2HTyvdw7amYOgLXDw4ls6Nej94bdEfSaD4zxo78aK8hi64
	CqGgfa5zRzT21IZW/9+zOpOFQiXssXn1y0CHqanwbi1DNAeur7tf3ofgaBJBHwuo
	xFStDMU/t6wP0lrq9Um+xw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gx5mr-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 08:32:12 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Thu, 20 Jul
 2023 14:32:09 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Thu, 20 Jul 2023 14:32:09 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id BA1E315B6;
	Thu, 20 Jul 2023 13:32:09 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v1 03/11] ALSA: hda: cs35l41: Ensure we correctly re-sync
 regmap before system suspending.
Date: Thu, 20 Jul 2023 14:31:39 +0100
Message-ID: <20230720133147.1294337-4-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
References: <20230720133147.1294337-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: xVu4ZQprtLwieDlWeBcu45sp_o6nxplp
X-Proofpoint-GUID: xVu4ZQprtLwieDlWeBcu45sp_o6nxplp
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WANNZPA65IXUUXLWYMLYNGUVGEJPSN2I
X-Message-ID-Hash: WANNZPA65IXUUXLWYMLYNGUVGEJPSN2I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WANNZPA65IXUUXLWYMLYNGUVGEJPSN2I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

In order to properly system suspend, it is necessary to unload the firmware
and ensure the chip is ready for shutdown (if necessary). If the system
is currently in runtime suspend, it is necessary to wake up the device,
and then make it ready. Currently, the wake does not correctly resync
the device, which may mean it cannot suspend correctly. Fix this by
performaing a resync.

Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/pci/hda/cs35l41_hda.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/sound/pci/hda/cs35l41_hda.c b/sound/pci/hda/cs35l41_hda.c
index 29f1dce45f1dc..f42457147ce47 100644
--- a/sound/pci/hda/cs35l41_hda.c
+++ b/sound/pci/hda/cs35l41_hda.c
@@ -574,21 +574,43 @@ static int cs35l41_hda_channel_map(struct device *dev, unsigned int tx_num, unsi
 				    rx_slot);
 }
 
-static void cs35l41_ready_for_reset(struct cs35l41_hda *cs35l41)
+static int cs35l41_ready_for_reset(struct cs35l41_hda *cs35l41)
 {
+	int ret = 0;
+
 	mutex_lock(&cs35l41->fw_mutex);
 	if (cs35l41->firmware_running) {
 
 		regcache_cache_only(cs35l41->regmap, false);
 
-		cs35l41_exit_hibernate(cs35l41->dev, cs35l41->regmap);
+		ret = cs35l41_exit_hibernate(cs35l41->dev, cs35l41->regmap);
+		if (ret) {
+			dev_warn(cs35l41->dev, "Unable to exit Hibernate.");
+			goto err;
+		}
+
+		/* Test key needs to be unlocked to allow the OTP settings to re-apply */
+		cs35l41_test_key_unlock(cs35l41->dev, cs35l41->regmap);
+		ret = regcache_sync(cs35l41->regmap);
+		cs35l41_test_key_lock(cs35l41->dev, cs35l41->regmap);
+		if (ret) {
+			dev_err(cs35l41->dev, "Failed to restore register cache: %d\n", ret);
+			goto err;
+		}
+
+		if (cs35l41->hw_cfg.bst_type == CS35L41_EXT_BOOST)
+			cs35l41_init_boost(cs35l41->dev, cs35l41->regmap, &cs35l41->hw_cfg);
+
 		cs35l41_shutdown_dsp(cs35l41);
 		cs35l41_safe_reset(cs35l41->regmap, cs35l41->hw_cfg.bst_type);
-
-		regcache_cache_only(cs35l41->regmap, true);
-		regcache_mark_dirty(cs35l41->regmap);
 	}
+err:
+	regcache_cache_only(cs35l41->regmap, true);
+	regcache_mark_dirty(cs35l41->regmap);
+
 	mutex_unlock(&cs35l41->fw_mutex);
+
+	return ret;
 }
 
 static int cs35l41_system_suspend(struct device *dev)
-- 
2.34.1

