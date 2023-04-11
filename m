Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A66A6DDFA4
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 17:27:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4128F14;
	Tue, 11 Apr 2023 17:26:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4128F14
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681226867;
	bh=Mqw8ivp0XKOZsZETtkKr4zcTpabQvV/v/6kvdtrM03w=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=i3Bvi/D5aW3ipZVKpSRrgeN8AzTsbrudQCQwBUHRAnQFQT8vsWeAhhFljdfgFuiLF
	 1qDEqUi4lvc+rhnsVmw7DI0FoQvPhYDzHFrAy2u+BQa8+ho9+/UXTpB8mxRNpk24F6
	 Rvylg7dx3WFZDOT2nbRogLMUa/ib/2dRwtt2LCGI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3205F80542;
	Tue, 11 Apr 2023 17:25:49 +0200 (CEST)
To: <broonie@kernel.org>
Subject: [PATCH 4/6] ASoC: cs35l56: Always wait for firmware boot in
 runtime-resume
Date: Tue, 11 Apr 2023 16:25:26 +0100
In-Reply-To: <20230411152528.329803-1-rf@opensource.cirrus.com>
References: <20230411152528.329803-1-rf@opensource.cirrus.com>
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKXYQNOUWNR3TIZKTAF6QEOMMONOL4UH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: <168122674948.26.205996534753979275@mailman-core.alsa-project.org>
From: Richard Fitzgerald via Alsa-devel <alsa-devel@alsa-project.org>
Reply-To: Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30C9AF8052D; Tue, 11 Apr 2023 17:25:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9CE5AF8049C
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 17:25:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9CE5AF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=FAC8VIMw
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33B5cuXI012801;
	Tue, 11 Apr 2023 10:25:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=PODMain02222019;
 bh=LrRfZkDP7c5Q0T8mpcxjLVK8Kk/fn8B2e2G5jGnrSms=;
 b=FAC8VIMw8WLB4UpbaUmwAgZ6Vz85scE/msDnQt1qjNZwq+PtYUo0DJTpPj1r0cvU6DG7
 aLH7rRx1xl6jHMLgqg6p+rTHO2OHJ0bKQ5KkDxTfnPqDGZmJjCD4616231zjuwH4IuFa
 M84vnKWm8b9vGgzCqXKJhgaYDHPTIslFgUTkJzsT5+X/EuNwAkE6Vdf80nDhRkSMk9+G
 AljJLfD5TUPAcn/nML/jDGkyFyt2LJYfe4hW0IyN+JR4v8e9Wlowzi0p6XuroCB85PLx
 Hk0gTHx2Rk3nWCUqpsZGGOdYSG0Mco4WOBAt3HsIPuXIpkWPEJe1gpiTdKxuQfJnX/Lt ZQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3pu4pq54a3-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Apr 2023 10:25:31 -0500
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.26; Tue, 11 Apr
 2023 10:25:28 -0500
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.26 via Frontend
 Transport; Tue, 11 Apr 2023 10:25:28 -0500
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.127])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 7CBD915B7;
	Tue, 11 Apr 2023 15:25:28 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 4/6] ASoC: cs35l56: Always wait for firmware boot in
 runtime-resume
Date: Tue, 11 Apr 2023 16:25:26 +0100
Message-ID: <20230411152528.329803-5-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230411152528.329803-1-rf@opensource.cirrus.com>
References: <20230411152528.329803-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: eR_esh3LH5b4_I_l2nwUg98T3TvKC-vT
X-Proofpoint-ORIG-GUID: eR_esh3LH5b4_I_l2nwUg98T3TvKC-vT
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: WKXYQNOUWNR3TIZKTAF6QEOMMONOL4UH
X-Message-ID-Hash: WKXYQNOUWNR3TIZKTAF6QEOMMONOL4UH
X-MailFrom: prvs=9465f6ee37=rf@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com, Richard Fitzgerald <rf@opensource.cirrus.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WKXYQNOUWNR3TIZKTAF6QEOMMONOL4UH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

When we are resuming from a system suspend the CS35L56 has probably
been hard reset (usually a power-on reset). So we must wait for the
firmware to boot. On SoundWire we also need it to re-initialize before
we can read the registers to check the CS35L56 state.

The simplest way to handle this is for runtime-resume to always wait
for firmware boot. If the firmware is already booted the overhead is
only one register read.

The system-resume will have to runtime-resume the driver anyway before
attempting any register access. So this will automatically include the
wait for initialization on SoundWire.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 62c44276c121..74abcf1c604a 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1102,10 +1102,8 @@ int cs35l56_runtime_resume_common(struct cs35l56_private *cs35l56)
 	unsigned int val;
 	int ret;
 
-	if (!cs35l56->can_hibernate) {
-		regcache_cache_only(cs35l56->regmap, false);
+	if (!cs35l56->can_hibernate)
 		goto out_sync;
-	}
 
 	if (!cs35l56->sdw_peripheral) {
 		/*
@@ -1120,19 +1118,19 @@ int cs35l56_runtime_resume_common(struct cs35l56_private *cs35l56)
 			     CS35L56_CONTROL_PORT_READY_US + 400);
 	}
 
-	regcache_cache_only(cs35l56->regmap, false);
-
-	ret = cs35l56_wait_for_firmware_boot(cs35l56);
-	if (ret) {
-		dev_err(cs35l56->dev, "Hibernate wake failed: %d\n", ret);
-		goto err;
-	}
-
-	ret = cs35l56_mbox_send(cs35l56, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
-	if (ret)
-		goto err;
-
 out_sync:
+	regcache_cache_only(cs35l56->regmap, false);
+
+	ret = cs35l56_wait_for_firmware_boot(cs35l56);
+	if (ret) {
+		dev_err(cs35l56->dev, "Hibernate wake failed: %d\n", ret);
+		goto err;
+	}
+
+	ret = cs35l56_mbox_send(cs35l56, CS35L56_MBOX_CMD_PREVENT_AUTO_HIBERNATE);
+	if (ret)
+		goto err;
+
 	/* BOOT_DONE will be 1 if the amp reset */
 	regmap_read(cs35l56->regmap, CS35L56_IRQ1_EINT_4, &val);
 	if (val & CS35L56_OTP_BOOT_DONE_MASK) {
-- 
2.30.2

