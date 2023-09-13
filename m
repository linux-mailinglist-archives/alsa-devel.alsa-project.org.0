Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD31779EBEA
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Sep 2023 17:01:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFAD0A4E;
	Wed, 13 Sep 2023 17:00:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFAD0A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694617297;
	bh=xXYKBXYPDdvaUKvMy2WO8Yj7n+AOFyjl6Bq83aaDQ8I=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=jdph46UtvWfiwyGT4YHVZjuVfIofDcltP7ND5/XZ0xkmmTQf7m5rDOPuVyJUejWZ+
	 d4WymozFCluMC6SDLFp59r29bXvepiQKBE7uTAoTBF2eFx/6dL5lMUK2OrQcYC+Qg9
	 yU1R9YqCjwPaCaOBElCpqZWZHHtlMnfxwYNo1vAc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CB6DF80425; Wed, 13 Sep 2023 17:00:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99778F80558;
	Wed, 13 Sep 2023 17:00:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A6AE0F80563; Wed, 13 Sep 2023 17:00:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 84403F80425
	for <alsa-devel@alsa-project.org>; Wed, 13 Sep 2023 17:00:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 84403F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=qvciHAJn
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38CMxBYs012824;
	Wed, 13 Sep 2023 10:00:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=Dh+rm8/z+C93/OT9V7lVmPaM5s4LmDAFqoJT9hkB4GU=; b=
	qvciHAJn7z2vKVWeICmAqeZ/0vJ4Tu44gm11e1i5y2Iy3QN9L3Aa0/dSTinHheUw
	ns7jln0/ET8PAgrT6rGUj9ROC4NPQ6HTWVn24N6YqnNuplaKFw+TdToWlUbG9J6z
	4PdDiNBtZXWixvbIBQ0jTQPjoE9SRlF6kCF9XpaUQn9XB6E6NqTCWioojDJurgGL
	vuCqbkX9g9MDH7TpsOZsHrBJmcyxN6X2Xppz5CBun23CFjsDitOlu7nWuWDT4eQB
	hAF/XxYm5szXcdfHhgRRt1W4tU66DBAShSlQdiMaKOK3VxZW+j1NFYqwKMQXfKdu
	ND45i4zVjCZ9bSh/mvnL8A==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t2y7u125n-2
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
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 21DCB11AA;
	Wed, 13 Sep 2023 15:00:20 +0000 (UTC)
From: Stefan Binding <sbinding@opensource.cirrus.com>
To: Mark Brown <broonie@kernel.org>, Uday M Bhat <uday.m.bhat@intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Stefan Binding <sbinding@opensource.cirrus.com>
Subject: [PATCH v1 1/3] ASoC: cs42l42: Ensure a reset pulse meets minimum
 pulse width.
Date: Wed, 13 Sep 2023 16:00:10 +0100
Message-ID: <20230913150012.604775-2-sbinding@opensource.cirrus.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913150012.604775-1-sbinding@opensource.cirrus.com>
References: <20230913150012.604775-1-sbinding@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: oQb8ia575QRFzeNOv0q-cj2ulpxtpl8e
X-Proofpoint-ORIG-GUID: oQb8ia575QRFzeNOv0q-cj2ulpxtpl8e
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: LUAMPTA7AY5DT7GWB6KDC3SVNXQNVBM5
X-Message-ID-Hash: LUAMPTA7AY5DT7GWB6KDC3SVNXQNVBM5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LUAMPTA7AY5DT7GWB6KDC3SVNXQNVBM5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Fitzgerald <rf@opensource.cirrus.com>

The CS42L42 can accept very short reset pulses of a few microseconds
but there's no reason to force a very short pulse.
Allow a wide range for the usleep_range() so it can be relaxed about
the choice of timing source.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l42.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index a0de0329406a..56d2857a4f01 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -2320,6 +2320,10 @@ int cs42l42_common_probe(struct cs42l42_private *cs42l42,
 
 	if (cs42l42->reset_gpio) {
 		dev_dbg(cs42l42->dev, "Found reset GPIO\n");
+
+		/* Ensure minimum reset pulse width */
+		usleep_range(10, 500);
+
 		gpiod_set_value_cansleep(cs42l42->reset_gpio, 1);
 	}
 	usleep_range(CS42L42_BOOT_TIME_US, CS42L42_BOOT_TIME_US * 2);
-- 
2.34.1

