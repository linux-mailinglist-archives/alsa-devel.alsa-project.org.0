Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1E775C7B0
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Jul 2023 15:23:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CBE584E;
	Fri, 21 Jul 2023 15:22:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CBE584E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689945802;
	bh=SsV0/z8iBS9UE7Sb7mT7lGxy8l8r4ZvMQ0kriX4Vl9M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=N+zENBWdhplWw9rNgNhS1tOjWjneaAtL21qiEYidgd9pj87JmXL5dyqHmVZZ/shq1
	 9M20ZrsuAks/ceJ8+D6hhnpzbwLLPaBR1GW7KBq+u+NCVJF5h+gt6Q6GVgdkyHSGMd
	 mK2Rp6nrJJTGJW71fjwQuw651fsy5sY66sVMEfsM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0E6F9F80552; Fri, 21 Jul 2023 15:21:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F2B5BF8055B;
	Fri, 21 Jul 2023 15:21:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 07595F80551; Fri, 21 Jul 2023 15:21:38 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 56CC7F8007E
	for <alsa-devel@alsa-project.org>; Fri, 21 Jul 2023 15:21:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56CC7F8007E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=hLTsQSaH
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 36L7lwWl024208;
	Fri, 21 Jul 2023 08:21:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=29De29CfgxtaslEDXEZsN6HJ5nTQb8h4NcfQQ6+My7w=; b=
	hLTsQSaHDqEoLwbNFZD23xejc04aA/0kflqR1pV0+Zv/ON8o+7h0OmGJw+yVWwzP
	SaDF7k3TWC7AYyoOFQQy/0jLj13c7Ka7UvzaLSLC060E7LAK504OjAwld6tKCVtw
	nag9Bu7IwyREnu6RmP8pX8tv9pAlt3fXku60oBcf8o3X04DHy+dDff8U9ZKLeZtb
	EZq6AD9ypvxqM9qdE3wjPsAoCARSVh2oDhUbu03bVMssLqgVcTEge2uE27dF/5HA
	grPMOJaGQbJbBjc5OO+lKtLfxduayrELlderNDqlQfjQTjRw58X2PnpJtGvCdkE1
	R0lrz9rdkG2OQ9khKTiacQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3rus6gyj2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Jul 2023 08:21:25 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.30; Fri, 21 Jul
 2023 14:21:24 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.30 via Frontend Transport; Fri, 21 Jul 2023 14:21:24 +0100
Received: from work-debian.ad.cirrus.com (unknown [198.61.64.172])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id F176346B;
	Fri, 21 Jul 2023 13:21:23 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <perex@perex.cz>, <alsa-devel@alsa-project.org>,
        <linux-kernel@vger.kernel.org>, <patches@opensource.cirrus.com>,
        Simon
 Trimmer <simont@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>
Subject: [PATCH v5 02/11] ASoC: cs35l56: Make cs35l56_system_reset() code more
 generic
Date: Fri, 21 Jul 2023 14:21:11 +0100
Message-ID: <20230721132120.5523-3-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230721132120.5523-1-rf@opensource.cirrus.com>
References: <20230721132120.5523-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: abVUIvMO1chmM1eHGKjqZGXK-Y_dSGZL
X-Proofpoint-GUID: abVUIvMO1chmM1eHGKjqZGXK-Y_dSGZL
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: I7JNWJOOREIZTOMM2RG7SSKQLFGLUQKW
X-Message-ID-Hash: I7JNWJOOREIZTOMM2RG7SSKQLFGLUQKW
X-MailFrom: prvs=25664d1566=rf@opensource.cirrus.com
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
Archived-At: <>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

The function can be more easily reused in HDA if the tracking of whether
a soft reset is being performed and whether the device is connected to a
SoundWire bus is moved out of the function.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Acked-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l56.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index 4eb8e5b09bfd..7a83e388e869 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -802,10 +802,8 @@ static const struct reg_sequence cs35l56_system_reset_seq[] = {
 	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_SYSTEM_RESET),
 };
 
-static void cs35l56_system_reset(struct cs35l56_private *cs35l56)
+static void cs35l56_system_reset(struct cs35l56_private *cs35l56, bool is_soundwire)
 {
-	cs35l56->soft_resetting = true;
-
 	/*
 	 * Must enter cache-only first so there can't be any more register
 	 * accesses other than the controlled system reset sequence below.
@@ -816,7 +814,7 @@ static void cs35l56_system_reset(struct cs35l56_private *cs35l56)
 					ARRAY_SIZE(cs35l56_system_reset_seq));
 
 	/* On SoundWire the registers won't be accessible until it re-enumerates. */
-	if (cs35l56->sdw_peripheral)
+	if (is_soundwire)
 		return;
 
 	usleep_range(CS35L56_CONTROL_PORT_READY_US, CS35L56_CONTROL_PORT_READY_US + 400);
@@ -883,7 +881,8 @@ static void cs35l56_patch(struct cs35l56_private *cs35l56)
 
 	init_completion(&cs35l56->init_completion);
 
-	cs35l56_system_reset(cs35l56);
+	cs35l56->soft_resetting = true;
+	cs35l56_system_reset(cs35l56, !!cs35l56->sdw_peripheral);
 
 	if (cs35l56->sdw_peripheral) {
 		/*
@@ -1547,7 +1546,8 @@ int cs35l56_init(struct cs35l56_private *cs35l56)
 
 	if (!cs35l56->base.reset_gpio) {
 		dev_dbg(cs35l56->base.dev, "No reset gpio: using soft reset\n");
-		cs35l56_system_reset(cs35l56);
+		cs35l56->soft_resetting = true;
+		cs35l56_system_reset(cs35l56, !!cs35l56->sdw_peripheral);
 		if (cs35l56->sdw_peripheral) {
 			/* Keep alive while we wait for re-enumeration */
 			pm_runtime_get_noresume(cs35l56->base.dev);
-- 
2.30.2

