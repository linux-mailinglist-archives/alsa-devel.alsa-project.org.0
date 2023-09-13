Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFC579EBF7
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 17:03:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 224A9A4E;
	Wed, 13 Sep 2023 17:02:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 224A9A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694617407;
	bh=GRpMO30E92zwarLbyCP64eutvKgo8RQKyTQV6G2CBT4=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AuL6pzoN89pGod2lf/N2/M+g9chrT476i15FaD3jCOgcFBnXROcy/k9lAkLeVsh/S
	 l6oqWGhtNuWP5BsIoFkJnHvysJpia5nCBb9EmDzpPF+QfebsJLEbeDJLfWc3K9rxz6
	 lU6wh5cLD03m5n/GFCfOKCmzvUFjRtjwOke2NQN0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CA57FF80549; Wed, 13 Sep 2023 17:02:36 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F421F801F5;
	Wed, 13 Sep 2023 17:02:36 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 061E9F8047D; Wed, 13 Sep 2023 17:02:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 893F0F80551
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 17:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 893F0F80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ZVX2QHyE
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38CMxBYu012824;
	Wed, 13 Sep 2023 10:00:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=PVaReH5xb95hJSWXKB1ZU+tI/szUdn6DXOR932aBpIg=; b=
	ZVX2QHyELoWnF6ZoDjt2cH8BufZ2Dq6Issq3cu3yfcHwBgxgmSPXaPMNAU26Iqjg
	oWq7YHopmwhz01H6B3+OKSbC2yyXrbC4CK4a32u/g+chTsdfbgdJBdv9aCi80sLu
	7zajfAr+fdu/YeJyIwhUYL7/i0kHIetATNUujdUA2PGZv5MpxNTkg8aqQfZm0Wvm
	cm/yRu5zv0bviXs0bgYoIY4wNrAFGOM/wM9hGKMrACERIB8tFUBZH0Q0apudQjs8
	Idst/X2UQm9PH3LLH/aXRp6NHa7cQFOH8t5KXGFInwL6pspOnXxl7nvSV8rA5AxB
	OcG23m7O4rS9NEuSfrjHVQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7u125n-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 10:00:23 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 13 Sep
 2023 16:00:20 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Wed, 13 Sep 2023 16:00:20 +0100
Received: from sbinding-cirrus-dsktp2.ad.cirrus.com (unknown [198.90.238.120])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6982F15B9;
	Wed, 13 Sep 2023 15:00:20 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Uday M Bhat <uday.m.bhat@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 2/3] ASoC: cs42l42: Don't rely on GPIOD_OUT_LOW to set
 RESET initially low
Date: Wed, 13 Sep 2023 16:00:11 +0100
Message-ID: <20230913150012.604775-3-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913150012.604775-1-sbinding@opensource.cirrus.com>
References: <20230913150012.604775-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lca0U4S-IG95BKgtvo7CRGe-1JouNJCD
X-Proofpoint-ORIG-GUID: lca0U4S-IG95BKgtvo7CRGe-1JouNJCD
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: D6KKK3RS3SKOICDVWZY774NOVCRJJXG5
X-Message-ID-Hash: D6KKK3RS3SKOICDVWZY774NOVCRJJXG5
X-MailFrom: prvs=4620b17109=sbinding@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/D6KKK3RS3SKOICDVWZY774NOVCRJJXG5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

The ACPI setting for a GPIO default state has higher priority than the
flag passed to devm_gpiod_get_optional() so ACPI can override the
GPIOD_OUT_LOW. Explicitly set the GPIO low when hard resetting.

Although GPIOD_OUT_LOW can't be relied on this doesn't seem like a
reason to stop passing it to devm_gpiod_get_optional(). So we still pass
it to state our intent, but can deal with it having no effect.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 56d2857a4f01..dc93861ddfb0 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -2321,6 +2321,12 @@ int cs42l42_common_probe(struct cs42l42_private *cs42l42,
 	if (cs42l42->reset_gpio) {
 		dev_dbg(cs42l42->dev, "Found reset GPIO\n");
 
+		/*
+		 * ACPI can override the default GPIO state we requested
+		 * so ensure that we start with RESET low.
+		 */
+		gpiod_set_value_cansleep(cs42l42->reset_gpio, 0);
+
 		/* Ensure minimum reset pulse width */
 		usleep_range(10, 500);
 
-- 
2.34.1

