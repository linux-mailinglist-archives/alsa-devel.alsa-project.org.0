Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A17DF75CB83
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 17:21:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E4FCE200;
	Fri, 21 Jul 2023 17:20:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E4FCE200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689952908;
	bh=De+MieM1Jel576IPtwvHpSppU5zDx/qASpqAqj5an4g=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pBR5zTaMdJqtQulBjjJAXSfH7Ch5SL4h7KaE1iPJMtJ3uKMdx6BXtqaNaVAOGkSyU
	 ERJRpfsYh1Ol+wJmFgwvUkY+0KEFDpF368M5ORDH2gOY6jfAYobgDHsMmmq4Ubz1pf
	 L9XS6pTp+qKjdM8CRDAMSH5JH0cS4b6p53RSFKp0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6A0EF805D5; Fri, 21 Jul 2023 17:19:08 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3DF1F805C7;
	Fri, 21 Jul 2023 17:19:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6A03F80588; Fri, 21 Jul 2023 17:18:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DE60DF80544
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 17:18:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE60DF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ZRguIcvB
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36LDppwk011284;
	Fri, 21 Jul 2023 10:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=Ud/QBJHaAFqyPCB/So8Atv4/aEQFcV6W/YWOD6HpSgY=; b=
	ZRguIcvBnOWIuhghAX1DT6vcM2zTOl8Va8kArwcYWBGxOGRDc8WQ8NWuy3hXLbny
	qJcHV7JL4sKilN2BUDaHn23p5olDvX6RWxuLJLwEw97gvCN+4YYcrD6lDfKogu3H
	PnV3YzdyzJzXkJfEE7dw3x3RnoADvvD0L/9CGtEWdNgspxY1B9tpbZIDXgUy2DQG
	iPKU1EwoXHCbu0vCj7/kCxCZHBYKidAZltxwfEmbTl6nP/djq8b363eQ8EVm4OXY
	0pINBF+ItSp0B/E92lMa1NpR1VCf9tSpaZN41VVPJ13DooVc/Kd2dwi6VJJB2xNL
	fIsspvnMm3qY7EP0XVMKxw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3rus62y8g5-5
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 10:18:31 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 16:18:26 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Fri, 21 Jul 2023 16:18:26 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.219])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6A46546B;
	Fri, 21 Jul 2023 15:18:26 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi
 Iwai <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Stefan Binding
	<sbinding@opensource.cirrus.com>
Subject: [PATCH v2 04/11] ALSA: hda: cs35l41: Ensure we correctly re-sync
 regmap before system suspending.
Date: Fri, 21 Jul 2023 16:18:09 +0100
Message-ID: <20230721151816.2080453-5-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
References: <20230721151816.2080453-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 4ihcEmaY_rh1Ruq8QkJeaMDKBf9c53_S
X-Proofpoint-ORIG-GUID: 4ihcEmaY_rh1Ruq8QkJeaMDKBf9c53_S
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: H343PJYARBWBEZOCYWWJGLS7354CFZF4
X-Message-ID-Hash: H343PJYARBWBEZOCYWWJGLS7354CFZF4
X-MailFrom: prvs=2566513517=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/H343PJYARBWBEZOCYWWJGLS7354CFZF4/>
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

