Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA8317BB605
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 13:11:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2DC761DD;
	Fri,  6 Oct 2023 13:11:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2DC761DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696590712;
	bh=+okZeCy4YEMvfRqP0z4i0l5cjxr9KbrkVDAGvXbHtRw=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=FggMsuUR3m+tZIzyzY3jeVhkCRwtG9JqDlctR7hbVU3BC2bzP3DmuHH5pPXH8IFlI
	 vRM/St/nCzabv9PUX8tALmJZiWVfUqG9CXTAUSH0GJnweIEdhxacOW0iah+noOG2dO
	 D+ENKxkAr1JH0ds7ovi9ZbTOpaBOtBgh0tr6PGEo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82CB2F8055B; Fri,  6 Oct 2023 13:11:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D041EF80310;
	Fri,  6 Oct 2023 13:11:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 810DEF80553; Fri,  6 Oct 2023 13:10:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 880F8F80166
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 13:10:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 880F8F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=DpTv58/r
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 396An4mD006823;
	Fri, 6 Oct 2023 06:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=0zBqGPEQTQ7H/6c/RrnU9opyRaEYN9jVzR4spOSXdYI=; b=
	DpTv58/rHiV2u/LVDUIFqqlkCsb/+hcY0tyZznH4kN3eEALncTzco2Tg8GHr4WKL
	RXDycWbUaNA4d35Mz8xofJ4CZDVOMEO1eRRfCgENbBASFK8zgU9LgeQaYaZV2lXj
	aTKKhxkPgjB5GU3EnvXIlOFa3/FneiD8IKOBKy20fGDHjFDLSGG6kg3/Kb4kraV5
	ryMk381rqeipdr6DUMhfe/eXG7EtrFBfVQDSvmw0sa1sS/lMqLfM/Ic4iZn1XmtP
	EIVl5LoA0Hj0l1h4BG7H4jLnj9BHdXKuvBWjL3K9MxcE5OniFHFTtzOy5MbLf1iE
	+fUVEWrkW/WqM0gA8Cve2g==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3teg3k812p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 06:10:44 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 6 Oct
 2023 12:10:42 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Fri, 6 Oct 2023 12:10:42 +0100
Received: from work-debian.ad.cirrus.com (unknown [198.61.64.45])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4B69A15B9;
	Fri,  6 Oct 2023 11:10:42 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 1/4] ASoC: cs35l56: Change hibernate sequence to use allow
 auto hibernate
Date: Fri, 6 Oct 2023 12:10:36 +0100
Message-ID: <20231006111039.101914-2-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231006111039.101914-1-rf@opensource.cirrus.com>
References: <20231006111039.101914-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: vuHgu9vlpzucuUgr3uO0ndyVgfLXYYqA
X-Proofpoint-ORIG-GUID: vuHgu9vlpzucuUgr3uO0ndyVgfLXYYqA
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: TWYJWR4HTGQWGZKHF6ENIM5K6HGSRO47
X-Message-ID-Hash: TWYJWR4HTGQWGZKHF6ENIM5K6HGSRO47
X-MailFrom: prvs=5643372036=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TWYJWR4HTGQWGZKHF6ENIM5K6HGSRO47/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

If the hardware uses SPI_MOSI, I2C_SCL or I2C_SDA as the wake source
the bus activity of sending HIBERNATE_NOW will wake up the amps that
were already put into hibernate.

ALLOW_AUTO_HIBERNATE tells the firmware to hibernate itself after a
timeout of a few seconds, giving the driver instances time to send this
before any amps have gone into hibernate.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-shared.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cs35l56-shared.c b/sound/soc/codecs/cs35l56-shared.c
index 01b6fa97b36b..68dc93b82789 100644
--- a/sound/soc/codecs/cs35l56-shared.c
+++ b/sound/soc/codecs/cs35l56-shared.c
@@ -439,7 +439,7 @@ EXPORT_SYMBOL_NS_GPL(cs35l56_is_fw_reload_needed, SND_SOC_CS35L56_SHARED);
 
 static const struct reg_sequence cs35l56_hibernate_seq[] = {
 	/* This must be the last register access */
-	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_HIBERNATE_NOW),
+	REG_SEQ0(CS35L56_DSP_VIRTUAL1_MBOX_1, CS35L56_MBOX_CMD_ALLOW_AUTO_HIBERNATE),
 };
 
 static const struct reg_sequence cs35l56_hibernate_wake_seq[] = {
@@ -473,12 +473,6 @@ int cs35l56_runtime_suspend_common(struct cs35l56_base *cs35l56_base)
 		return 0;
 	}
 
-	/*
-	 * Enable auto-hibernate. If it is woken by some other wake source
-	 * it will automatically return to hibernate.
-	 */
-	cs35l56_mbox_send(cs35l56_base, CS35L56_MBOX_CMD_ALLOW_AUTO_HIBERNATE);
-
 	/*
 	 * Must enter cache-only first so there can't be any more register
 	 * accesses other than the controlled hibernate sequence below.
@@ -545,11 +539,12 @@ int cs35l56_runtime_resume_common(struct cs35l56_base *cs35l56_base, bool is_sou
 	return 0;
 
 err:
-	regmap_write(cs35l56_base->regmap, CS35L56_DSP_VIRTUAL1_MBOX_1,
-		     CS35L56_MBOX_CMD_HIBERNATE_NOW);
-
 	regcache_cache_only(cs35l56_base->regmap, true);
 
+	regmap_multi_reg_write_bypassed(cs35l56_base->regmap,
+					cs35l56_hibernate_seq,
+					ARRAY_SIZE(cs35l56_hibernate_seq));
+
 	return ret;
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_runtime_resume_common, SND_SOC_CS35L56_SHARED);
-- 
2.30.2

