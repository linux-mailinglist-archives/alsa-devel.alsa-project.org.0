Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A517BB60D
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 13:12:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A5C711EB;
	Fri,  6 Oct 2023 13:11:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A5C711EB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696590760;
	bh=bqOSyfytZTZ/0+klzRV33sy5WWdaXYikD4gJtQvmbhY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vG9nG5NGD8TFvNhnpcrIBmAAdHBGiuBpXCFE6VDNPV5DOHNlaAJf2U5pVKTGLZRCb
	 hVLFPxMpLrMZ4AsEFNyYIxr9hkddw1rzFfGLhNEaFA9csOJSlKzzzkQ5/Mb40o5kba
	 k7aXSxktaseBW93lIQTpmLjfKffc27pf1n+JlVWA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3E89F80571; Fri,  6 Oct 2023 13:11:02 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5170EF8055A;
	Fri,  6 Oct 2023 13:11:02 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1C66F80552; Fri,  6 Oct 2023 13:10:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com
 [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B19FEF80310
	for <alsa-devel@alsa-project.org>; Fri,  6 Oct 2023 13:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B19FEF80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=XcLCzlUy
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id
 396An4mE006823;
	Fri, 6 Oct 2023 06:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=g8oiQTo8bruK3bLc2ltLGw1QTSsNOM4NkrryXMd4wTo=; b=
	XcLCzlUyVPBMMkJDA2uTe6duhysQotdFctsjKRKwrCv/5/YHRZanSHTZp3DlT39F
	ySEzu6ZihTVgjr7U26jiYGpLsHOzWt0cEH8inqp94Os4xVGjtNh9H33U05+j7Ruw
	HusqwGuJifvxWfy0wm73k3H6ozLwVdw5pFYLyvIW6oyxHGeHfjigvcKAl83bFmz9
	0t+k6hejFgcMovblAPrZxBUjws4TkO4M8y3t6S6hFrL3hab8RcDGwyqq5Vrw0jDH
	1I3JmAajQcC+yuzrW8yHtYblGEs5uIW4dfhSIzWmtWDtFVpO5f2slTfO+iOvnaMX
	cyj0LPwDZDp2N85WA71d2Q==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3teg3k812p-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 06:10:44 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Fri, 6 Oct
 2023 12:10:43 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Fri, 6 Oct 2023 12:10:43 +0100
Received: from work-debian.ad.cirrus.com (unknown [198.61.64.45])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 058C43575;
	Fri,  6 Oct 2023 11:10:42 +0000 (UTC)
From: Richard Fitzgerald <rf@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>,
        Simon Trimmer
	<simont@opensource.cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: [PATCH 3/4] ASoC: cs35l56: Enable low-power hibernation mode on i2c
Date: Fri, 6 Oct 2023 12:10:38 +0100
Message-ID: <20231006111039.101914-4-rf@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231006111039.101914-1-rf@opensource.cirrus.com>
References: <20231006111039.101914-1-rf@opensource.cirrus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: kcUkljDucTnCyy5E_GLIs-2oIMLT0mAc
X-Proofpoint-ORIG-GUID: kcUkljDucTnCyy5E_GLIs-2oIMLT0mAc
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: G52F3XFONQKBIHTQB7FCS67QAQ6VIPHV
X-Message-ID-Hash: G52F3XFONQKBIHTQB7FCS67QAQ6VIPHV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G52F3XFONQKBIHTQB7FCS67QAQ6VIPHV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Simon Trimmer <simont@opensource.cirrus.com>

This can now be re-enabled as the sequence to reliably wake the device
has been implemented in the shared code.

Signed-off-by: Simon Trimmer <simont@opensource.cirrus.com>
Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
---
 sound/soc/codecs/cs35l56-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/cs35l56-i2c.c b/sound/soc/codecs/cs35l56-i2c.c
index 9e5670b09af6..7063c400e896 100644
--- a/sound/soc/codecs/cs35l56-i2c.c
+++ b/sound/soc/codecs/cs35l56-i2c.c
@@ -27,6 +27,7 @@ static int cs35l56_i2c_probe(struct i2c_client *client)
 		return -ENOMEM;
 
 	cs35l56->base.dev = dev;
+	cs35l56->base.can_hibernate = true;
 
 	i2c_set_clientdata(client, cs35l56);
 	cs35l56->base.regmap = devm_regmap_init_i2c(client, regmap_config);
-- 
2.30.2

