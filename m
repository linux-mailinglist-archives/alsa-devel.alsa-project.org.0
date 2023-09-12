Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8236D79D281
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 15:39:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 64905AE9;
	Tue, 12 Sep 2023 15:38:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 64905AE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694525983;
	bh=mKtXZpKnHELJAO0HZdN1NKQdVYqCWHSaCHV61s4/wXg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oCo4dW0eCy+UXRgoAysPFBsm7uX6f3RKbkWkmMw2YGv8prbkRDjOEzgwacOcrDaFC
	 ePkKfnCPHfkEJTBetehQCP8NIRcUAtiBJBfp5aw1aYAwLEObKN6fPIQ6cD5NQKOLZ6
	 /2QaygVR1QsIEIa+egWSpyxJ7AxU7U6bX/Oe0e/w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2A83F80549; Tue, 12 Sep 2023 15:38:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D503F80246;
	Tue, 12 Sep 2023 15:38:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 959CEF80425; Tue, 12 Sep 2023 15:38:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 52ECDF8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 15:38:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 52ECDF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=NcMixOk5
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38CDUBmf032495;
	Tue, 12 Sep 2023 08:38:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=i
	qMo1WYDhsCRU6fDQRu1ohzwNK+mWlIu0GTmbZzTtUg=; b=NcMixOk5ZGVECb6yV
	g1EWRRON131fgiJtEBiDLbLkhTwW1pcOOChkHg1p6pvsYhqGbW2AN6+yaq2IDcvL
	8PUnoCnORCnWlo0tZpHJR0rs+YGquye3qvXXW8CCV4yhvjsprMxskRiUkMENgQBm
	xbjWOkll4nhhLyBIsJ2GuID1WWJaYY/cQQOkpbJTdSfCvNa4340C8K3EWt0mg1gv
	gg/kz+pOVc//FMFtPwBZ2hq5LSjek7psWXkkH9qudIWTRzMGZcqkcV/EkXciQjW9
	KR10Qyio5x2xap98LIkvR3KhMJE9sJbguQCsaw7orPMvnlVd/e5oo0MGR+lifprW
	CFPbQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3t0n4jb2wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 08:38:42 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 12 Sep
 2023 14:38:41 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 12 Sep 2023 14:38:41 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.125])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 213352A1;
	Tue, 12 Sep 2023 13:38:41 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs35l56: Disable low-power hibernation mode
Date: Tue, 12 Sep 2023 14:38:41 +0100
Message-ID: <20230912133841.3480466-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: _FpdWHdHakP3SNHYzSaj8a5hrimfKbEI
X-Proofpoint-GUID: _FpdWHdHakP3SNHYzSaj8a5hrimfKbEI
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: RY4WNAKQ6GBVDH6GKD4NOV3UBYNXUA53
X-Message-ID-Hash: RY4WNAKQ6GBVDH6GKD4NOV3UBYNXUA53
X-MailFrom: prvs=4619193f72=rf@opensource.cirrus.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RY4WNAKQ6GBVDH6GKD4NOV3UBYNXUA53/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Do not allow the CS35L56 to be put into its lowest power
"hibernation" mode. This only affects I2C because "hibernation"
is already disabled on SPI and SoundWire.

Recent firmwares need a different wake-up sequence. Until
that sequence has been specified, the chip "hibernation" mode
must be disabled otherwise it can intermittently fail to wake.

THIS WILL NOT APPLY CLEANLY TO 6.5 AND EARLIER:
We will send a separate backport patch to stable.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 9f4f2f4f23f5..d10e0e2380e8 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -27,7 +27,6 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	cs35l56->base.dev = dev;
-	cs35l56->base.can_hibernate = true;
 
 	i2c_set_clientdata(client, cs35l56);
 	cs35l56->base.regmap = devm_regmap_init_i2c(client, regmap_config);
-- 
2.30.2

