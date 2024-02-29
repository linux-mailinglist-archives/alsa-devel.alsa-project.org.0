Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E293086C869
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Feb 2024 12:48:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 23117868;
	Thu, 29 Feb 2024 12:47:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 23117868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709207289;
	bh=2jyXrHzbfxd/JOAxh3e1PhKSiapQT6RGkklw9UG1uqg=;
	h=From:To:CC:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uIegwj9h+dMXU6tjl511NcfydRUat05KE9HWe7ayx733efiPN6SpKwaDhLGwPyJiJ
	 7Fd214hVOOjznx8G4f+F+EAyTcm01rjTInJkByIP3sd7sGIYqa8vH9IjVgPAp09YcV
	 84DgAlV12PCxOt0qqrPnVqp/sDCYyVNzPiyZAjEk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8C101F80580; Thu, 29 Feb 2024 12:47:32 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B2FA4F800F0;
	Thu, 29 Feb 2024 12:47:31 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19E29F801C0; Thu, 29 Feb 2024 12:47:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7C43F800F0
	for <alsa-devel@alsa-project.org>; Thu, 29 Feb 2024 12:47:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7C43F800F0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256
 header.s=PODMain02222019 header.b=Ay6XhMyn
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id
 41T5sRaU030026;
	Thu, 29 Feb 2024 05:47:15 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PODMain02222019; bh=h
	xS3YkR9HRJrUiZKDHT46QHfH+IijXAkgWyrqayzils=; b=Ay6XhMyno590K89u6
	rXlxQEL6wXAJfJmPjnvhCc0VvlWa0dMqpYPL8zSIpJ23Aa51QWDlyv9UsrynKwvG
	JuXYLSARBsYS3cCLAngdzMExBBaheXjXu/K4HRlDFlFsFlCb+VC+K837eOHfHMDH
	FejaZWhSklWpjkHct4toCylxJSq5W8NDOAF82tafHgFlIoA2hXqKRx1z9o0fOn6v
	U90DE7/735mQhZ7ViYxcPJ/UfsO7X63gxslrKQ3e+TZrs2EKSI5Igf/04hG8kAgF
	j7djasx8U22tADkxYsdiIfz7msR0OXOwptWiQwdaMD42WNOvPRkAda4Uu48Zjhyc
	/dWdA==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3wfer2x6qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 29 Feb 2024 05:47:14 -0600 (CST)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 29 Feb
 2024 11:47:12 +0000
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40 via Frontend Transport; Thu, 29 Feb 2024 11:47:12 +0000
Received: from ediswws08.ad.cirrus.com (ediswws08.ad.cirrus.com
 [198.90.208.13])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 64B5C820242;
	Thu, 29 Feb 2024 11:47:12 +0000 (UTC)
From: Stuart Henderson <stuarth@opensource.cirrus.com>
To: <broonie@kernel.org>, <tiwai@suse.com>
CC: <linux-sound@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <patches@opensource.cirrus.com>, <alsa-devel@alsa-project.org>,
        "Stuart
 Henderson" <stuarth@opensource.cirrus.com>
Subject: [PATCH] ASoC: madera: Fix typo in madera_set_fll_clks shift value
Date: Thu, 29 Feb 2024 11:46:37 +0000
Message-ID: <20240229114637.352098-1-stuarth@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: emryE5ZiCVPcVZrPiWURg68VaAPx2LKi
X-Proofpoint-ORIG-GUID: emryE5ZiCVPcVZrPiWURg68VaAPx2LKi
X-Proofpoint-Spam-Reason: safe
Message-ID-Hash: 4LEQAKQFAH6I4ZWMXN57SX5XZ3ONOS7R
X-Message-ID-Hash: 4LEQAKQFAH6I4ZWMXN57SX5XZ3ONOS7R
X-MailFrom: prvs=0789165d85=stuarth@opensource.cirrus.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4LEQAKQFAH6I4ZWMXN57SX5XZ3ONOS7R/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Fix a typo in the shift value used in madera_set_fll_clks.

Fixes: 3863857dd5ca3 ("ASoC: madera: Enable clocks for input pins when used for the FLL")
Signed-off-by: Stuart Henderson <stuarth@opensource.cirrus.com>
---
 sound/soc/codecs/madera.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index b9f19fbd2911..b24d6472ad5f 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -3884,7 +3884,7 @@ static inline int madera_set_fll_clks(struct madera_fll *fll, int base, bool ena
 	return madera_set_fll_clks_reg(fll, ena,
 				       base + MADERA_FLL_CONTROL_6_OFFS,
 				       MADERA_FLL1_REFCLK_SRC_MASK,
-				       MADERA_FLL1_REFCLK_DIV_SHIFT);
+				       MADERA_FLL1_REFCLK_SRC_SHIFT);
 }
 
 static inline int madera_set_fllao_clks(struct madera_fll *fll, int base, bool ena)
-- 
2.30.2

