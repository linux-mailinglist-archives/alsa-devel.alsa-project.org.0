Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA257A08B5
	for <lists+alsa-devel@lfdr.de>; Thu, 14 Sep 2023 17:11:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E22DDAE8;
	Thu, 14 Sep 2023 17:10:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E22DDAE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694704273;
	bh=r1gxdMk3moB8dZZdtJqZrh302rnCoVQAGeYO6cqNfZM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cMhYpbPYg6SaOH6JUunmWRWQmurKg3AQgcox1eKihIeN0aj8GP1HeX7JjZ0u4VGjx
	 yadUuV28xeL+kMkS8OpP5fqSo/Rcncub4jr7qcbAyI6Um+NDDpocCuBIoqln7gPvjD
	 s4RtdPrZk97Eq2o6kp0tPRPndQiXyWNb+XONJQEU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF2FCF8057A; Thu, 14 Sep 2023 17:09:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41BA6F80571;
	Thu, 14 Sep 2023 17:09:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F29BEF80425; Thu, 14 Sep 2023 17:09:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CC61CF80246
	for <alsa-devel@alsa-project.org>; Thu, 14 Sep 2023 17:09:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CC61CF80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=emzWWtAO
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38ECunMK020490;
	Thu, 14 Sep 2023 10:09:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=9/Xe635LD6iDoA7xW4TH+xL5WC3QyAf+GAeZOp4sAUk=; b=
	emzWWtAOakqSAJyaWRSZd69Koh67MWyLOxzsSBqGBb0y0XSJM7GyHA0Zjw8ljqDQ
	A5mTx3tbnEZkn7YoCLT7o3cPdQD9S3YA19wIvdxV6lJKglVBi9xGkCWcIMvcgV0Y
	7A5nEEE2Ei2q7Axso7h+PYyLlfUQEk1zO1WqQlvmATL4j0qfzkiHhgCmDfQl9HeO
	SBg2553sWt6N/n7MbpwbsKhKqUZiT3MWCL/eY1vudsA8btOVpnv/vHbBib5RLiUm
	GgPMM2hJ9TmckOkOBYzCZ9+EsRR7j11ljLDJaosQkeUtrmWK71i1iiHsOEyGwBmv
	uoA1SZiW3AYRsYOn9OmiTw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7sj90x-4
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 10:09:23 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Thu, 14 Sep
 2023 16:09:21 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Thu, 14 Sep 2023 16:09:21 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.61.65.215])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D72A7357D;
	Thu, 14 Sep 2023 15:09:20 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 3/3] ASoC: cs35l56: Omit cs35l56_pm_ops_i2c_spi if I2C/SPI not
 enabled
Date: Thu, 14 Sep 2023 16:09:18 +0100
Message-ID: <20230914150918.14505-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230914150918.14505-1-rf@opensource.cirrus.com>
References: <20230914150918.14505-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 1pbGrrcizE69K0dpA49EEzUOomu1jFEx
X-Proofpoint-ORIG-GUID: 1pbGrrcizE69K0dpA49EEzUOomu1jFEx
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: X2JKU36E5XZSIZ6B2C6CK67RDN2MH44L
X-Message-ID-Hash: X2JKU36E5XZSIZ6B2C6CK67RDN2MH44L
X-MailFrom: prvs=46218c6399=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X2JKU36E5XZSIZ6B2C6CK67RDN2MH44L/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The cs35l56_pm_ops_i2c_spi struct is only needed if either the
I2C or SPI modules are selected for building. Otherwise it would
be unused bytes, so in that case omit it.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
index b7d3f768635b..232af4e8faa4 100644
--- a/sound/soc/codecs/cs35l56.c
+++ b/sound/soc/codecs/cs35l56.c
@@ -1229,12 +1229,14 @@ void cs35l56_remove(struct cs35l56_private *cs35l56)
 }
 EXPORT_SYMBOL_NS_GPL(cs35l56_remove, SND_SOC_CS35L56_CORE);
 
+#if IS_ENABLED(CONFIG_SND_SOC_CS35L56_I2C) || IS_ENABLED(CONFIG_SND_SOC_CS35L56_SPI)
 EXPORT_NS_GPL_DEV_PM_OPS(cs35l56_pm_ops_i2c_spi, SND_SOC_CS35L56_CORE) = {
 	SET_RUNTIME_PM_OPS(cs35l56_runtime_suspend_i2c_spi, cs35l56_runtime_resume_i2c_spi, NULL)
 	SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend, cs35l56_system_resume)
 	LATE_SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend_late, cs35l56_system_resume_early)
 	NOIRQ_SYSTEM_SLEEP_PM_OPS(cs35l56_system_suspend_no_irq, cs35l56_system_resume_no_irq)
 };
+#endif
 
 MODULE_DESCRIPTION("ASoC CS35L56 driver");
 MODULE_IMPORT_NS(SND_SOC_CS35L56_SHARED);
-- 
2.30.2

