Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B109779D215
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 15:29:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0059074C;
	Tue, 12 Sep 2023 15:28:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0059074C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694525356;
	bh=KioXVN+ocHFfSXNGCpGkkRbazKMRGOswYo7EQxS4iz4=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=X8JIOIpY9LkJpSHn/lhxPecj1kGWhP7bI8c4eyx9xgrRVAGzd6X/eH1ANmHHo9ukx
	 f4F9MJ7Sz2gFlF7kTkGOG+ybY8FpReq5r0D/QypEGqmMhiEfktZiGmi256kkGq1dhg
	 WvhM2Sb16ndjGhP4a+mAE53HyX1e/OTym7xZE9n0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8BD0DF80537; Tue, 12 Sep 2023 15:28:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E3B0CF80246;
	Tue, 12 Sep 2023 15:28:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10131F80425; Tue, 12 Sep 2023 15:27:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ADF7AF8007C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 15:27:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADF7AF8007C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=E4VZDDHN
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 38CARhwA022397;
	Tue, 12 Sep 2023 08:27:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=p
	/qu/HO+QWXMZClGw2V6UqRARF88uGiEQkPRhZezuIw=; b=E4VZDDHNOq9yFT0BQ
	IKSGrO6SseUkOvvIZZJkGdrPcNvw79Y7DcMlOueJ0dWq85a2Xp41scQjLW+RqelQ
	zDmwZOGQGdwRXfW3SCh4zpBT3OAaQmbmUwPl3mXhy5hW3vxLX2wlEhpr6JF5ST1r
	WkGgyh+Cncjfr731MbVOCcNkqd9uOCneZ2234m34fJe+j5FwrnYnBNySFx68nUto
	7ma/vzYbEw5JnQk5+0cOiZbFuM8R/+HqC5NWESp1BceVmrt/vD6A8iXq8P+dHtnB
	Wj8zFcn/UJRZc74l5ArGqZv32YcIEJFULknhRV9qWD6ogn30uqx/jlWGSMNxV7Da
	wpSrQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3t0p3xkm7r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 08:27:41 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 12 Sep
 2023 14:27:39 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.37 via Frontend Transport; Tue, 12 Sep 2023 14:27:39 +0100
Received: from edi-sw-dsktp-006.ad.cirrus.com (edi-sw-dsktp-006.ad.cirrus.com
 [198.90.251.125])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 1EE6C2A1;
	Tue, 12 Sep 2023 13:27:39 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <tiwai@suse.com>
CC: <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>,
        <linux-kernel@vger.kernel.org>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH] ALSA: hda: cs35l56: Disable low-power hibernation mode
Date: Tue, 12 Sep 2023 14:27:39 +0100
Message-ID: <20230912132739.3478441-1-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ibH2zfBop7k4z-d0i_r4D_ZFe2-7TJA2
X-Proofpoint-GUID: ibH2zfBop7k4z-d0i_r4D_ZFe2-7TJA2
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 7G6TNLFHKL6PDTJHDUXFHKUG25HHAD7C
X-Message-ID-Hash: 7G6TNLFHKL6PDTJHDUXFHKUG25HHAD7C
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7G6TNLFHKL6PDTJHDUXFHKUG25HHAD7C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Do not allow the CS35L56 to be put into its lowest power
"hibernation" mode. This only affects I2C because "hibernation"
is already disabled on SPI.

Recent firmwares need a different wake-up sequence. Until
that sequence has been specified, the chip "hibernation" mode
must be disabled otherwise it can intermittently fail to wake.

Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/pci/hda/cs35l56_hda_i2c.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/pci/hda/cs35l56_hda_i2c.c b/sound/pci/hda/cs35l56_hda_i2c.c
index 83e4acdd89ac..757a4d193e0f 100644
--- a/sound/pci/hda/cs35l56_hda_i2c.c
+++ b/sound/pci/hda/cs35l56_hda_i2c.c
@@ -21,7 +21,6 @@ static int cs35l56_hda_i2c_probe(struct i2c_client *clt)
 		return -ENOMEM;
 
 	cs35l56->base.dev = &clt->dev;
-	cs35l56->base.can_hibernate = true;
 	cs35l56->base.regmap = devm_regmap_init_i2c(clt, &cs35l56_regmap_i2c);
 	if (IS_ERR(cs35l56->base.regmap)) {
 		ret = PTR_ERR(cs35l56->base.regmap);
-- 
2.30.2

