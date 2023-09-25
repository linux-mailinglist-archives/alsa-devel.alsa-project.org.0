Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 538D87ADB29
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Sep 2023 17:16:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9223ABC0;
	Mon, 25 Sep 2023 17:15:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9223ABC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695654963;
	bh=T78uu9U2Ehd1HrNobgc8IUUbn9wsjXLHPFaC0Gkz8MU=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=lnh+nzMRYzGgsIdxMql0+nIrALbLWbzE4zWK198IsfeqJRvc9AMrSGHevjTF54jp3
	 Funns/alPL7BaiZQBN9dtqcksGwdGvjjSNLQQye3IqucXPpHEmZNVhHbpX7bC2JQyj
	 I+TGIE70hReXJQSenjvXqsCcCdYw4wDj8vU4qjtk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B150F8047D; Mon, 25 Sep 2023 17:15:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC4A3F80166;
	Mon, 25 Sep 2023 17:15:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0A73EF8016A; Mon, 25 Sep 2023 17:14:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A4E6F800AA
	for <alsa-devel@alsa-project.org>; Mon, 25 Sep 2023 17:14:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A4E6F800AA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=ZG3777JS
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38PBieUO025114;
	Mon, 25 Sep 2023 10:14:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=W
	HXl4xdBH7oIae2xk+WqYNuDkHaLd41yOcEJ0WuOa9g=; b=ZG3777JSKZJLMXkkc
	yYwRlwAcHfJdGJGlTTl/QO9fkyuE+vILgTaAM+6s7WRy4HCneupT2XWWMpU5o6ry
	FBkwVtqv1tWjUCtiLO2R/bst+px811E4wmagbC/4ah05h55/ckoQPHBgJPIqIVV7
	2CGOkJS94nG716VWUariaZP7XQbF54X7p+7Ysrto1IEy6FL4DAuJI5J9Wy3mcBwf
	jKMOWevfU52O8BYDI00hwCczi8kre4RLfvz0/ohuHmqzI15xUeXw7cFu1JjAdrke
	2yjH9G4VzRhZeCw8t+YXPhNDGZlvlfOItMynjwBVfcxE0datGr21ihS2Qf8EXa2k
	NnhWQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t9veja69h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Sep 2023 10:14:49 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Mon, 25 Sep
 2023 16:14:48 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Mon, 25 Sep 2023 16:14:48 +0100
Received: from EDIN4L06LR3.ad.cirrus.com (EDIN4L06LR3.ad.cirrus.com
 [198.90.238.160])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id CEA8C11CD;
	Mon, 25 Sep 2023 15:14:45 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <stable@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
        <patches@opensource.cirrus.com>,
        Richard Fitzgerald
	<rf@opensource.cirrus.com>,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH 6.4, 6.5] ASoC: cs35l56: Disable low-power hibernation mode
Date: Mon, 25 Sep 2023 16:14:43 +0100
Message-ID: <20230925151443.28956-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: -OFlxHOuJDNx62BothL6OVSGO-mCrdT7
X-Proofpoint-ORIG-GUID: -OFlxHOuJDNx62BothL6OVSGO-mCrdT7
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: M3XTFRW42SDKEACZXGEBFHJXU4GUB3AR
X-Message-ID-Hash: M3XTFRW42SDKEACZXGEBFHJXU4GUB3AR
X-MailFrom: prvs=463205a1dc=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M3XTFRW42SDKEACZXGEBFHJXU4GUB3AR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

commit 18789be8e0d9fbb78b2290dcf93f500726ed19f0 upstream.
Please apply to 6.4 and 6.5.

Do not allow the CS35L56 to be put into its lowest power
"hibernation" mode. This only affects I2C because "hibernation"
is already disabled on SPI and SoundWire.

Recent firmwares need a different wake-up sequence. Until
that sequence has been specified, the chip "hibernation" mode
must be disabled otherwise it can intermittently fail to wake.

Backport note: This is the same change as upstream commit, to delete
one line, but the upstream commit would not apply cleanly on older
branches because of minor differences to the surrounding code.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Link: https://lore.kernel.org/r/20230912133841.3480466-1-rf@opensource.cirrus.com
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/codecs/cs35l56-i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index c613a2554fa3..494adabd4f43 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -27,7 +27,6 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	cs35l56->dev = dev;
-	cs35l56->can_hibernate = true;
 
 	i2c_set_clientdata(client, cs35l56);
 	cs35l56->regmap = devm_regmap_init_i2c(client, regmap_config);
-- 
2.30.2

