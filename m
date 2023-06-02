Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEBB71F924
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jun 2023 06:12:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2BF4C827;
	Fri,  2 Jun 2023 06:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2BF4C827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685679139;
	bh=U4Uovn0Yu4Un4bgVe+SSj5DK95lAwhixeE76YeMd1mM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=rQ1ULRT1+N/dI5pxlWKKxFIQfNw2H16kisx5aT6GPqwdeDsQXoZYtZgdRS479qbMS
	 90PjvTpGEC8N2ZiwDeIHXAgwMazFPcfrgIkiZ9kno2HzahlENFM0oasH1pfjonOipv
	 FwmBUZCadDWcGdzbr/WWqL0c4UEIY8MlPUsEplqM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 86BF2F80552; Fri,  2 Jun 2023 06:10:38 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 42410F80548;
	Fri,  2 Jun 2023 06:10:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0C49F80199; Fri,  2 Jun 2023 06:10:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on20617.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2C419F80132
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 06:09:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2C419F80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nuvoton.com header.i=@nuvoton.com header.a=rsa-sha256
 header.s=selector1 header.b=CTIG5mZR
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgmI1AsC7aQjX1oL+8AKLJyLQIdOU20WF3oEblr6neIckp8qdefkv17lk6cv7riikxAoahsr34AHPgTaNuG+iMVFkXHilhSXZu+bBvgTWpwaA8AxdA5Rc8HKnAb2+Ugs+974H7bgKu/9NV8TbDUtSkaQZj2WKvX/9SRYvTIZQMyZ5GMZYfMj1uGBPFv81CgUVdHr87beFrenVzUciKfEQswCjr9me8s7DeQqXhrTmLMqHWdQrGNI67r9r8FGuvxLFAVK8q5vu4xTh5H5WTfRmDyF+joG0mYXGs/cjnzn7iaStje6UEypw3bexEDdTXyPlzRATKBiq7de0p26JwdABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rhht8zuMi5kGXVTf4/e7iN3inIGOZMgvVnME9QEXcmY=;
 b=GL8RsUm2YDDP53sGQrTAEZ5gFmr9/UDpK9dtuI8puZyBXO0LZ1aL7OIC4O0x/wNJOI00Bom3IRfpaLDQW5wzkNehJdwJ0K63tioNRnWGdwaI3JOYCyXK7TTUTizL5Vy/4oTdRVAjB9e2FHKoZbw95Z4z+Vy35BKWokaW8JeE51P+ZKW9SsoM4CEt2XbPutgDBKimrN3TTu+NJC0SAMirrA059r95DsIW+Q5yLXg4cq/33YsNjNN/RUfzdQrPmW98TTbraHCIUdJsqkwE4D9vbcAHK8gKWZtiM6zzdpVwQ++1rULXubGd/zX4oDGSPpC5R1s+EFs0v/nJ4byC+GonVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 175.98.123.7) smtp.rcpttodomain=kernel.org smtp.mailfrom=nuvoton.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nuvoton.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nuvoton.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rhht8zuMi5kGXVTf4/e7iN3inIGOZMgvVnME9QEXcmY=;
 b=CTIG5mZRK8mEYbIkO39ROKm3GszoXMvOWezUbBnjxqRUvUdnIaG/ASPmS/AFl7XwVx/ezVIo/SiAbmKlE8JmMj0ZhmWWU+YnqgNBXivWm4RVuBsaf/cXV/f5PRyJdzCZkfKxRIlx1aMD5XTuke1VNH7M1A+JeHMbvRwCnj9teEM=
Received: from SG2PR06CA0183.apcprd06.prod.outlook.com (2603:1096:4:1::15) by
 SEZPR03MB7680.apcprd03.prod.outlook.com (2603:1096:101:127::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.23; Fri, 2 Jun 2023 04:09:41 +0000
Received: from SG2APC01FT0060.eop-APC01.prod.protection.outlook.com
 (2603:1096:4:1:cafe::38) by SG2PR06CA0183.outlook.office365.com
 (2603:1096:4:1::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.24 via Frontend
 Transport; Fri, 2 Jun 2023 04:09:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 175.98.123.7)
 smtp.mailfrom=nuvoton.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nuvoton.com;
Received-SPF: Pass (protection.outlook.com: domain of nuvoton.com designates
 175.98.123.7 as permitted sender) receiver=protection.outlook.com;
 client-ip=175.98.123.7; helo=NTHCCAS04.nuvoton.com; pr=C
Received: from NTHCCAS04.nuvoton.com (175.98.123.7) by
 SG2APC01FT0060.mail.protection.outlook.com (10.13.36.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.6455.13 via Frontend Transport; Fri, 2 Jun 2023 04:09:41 +0000
Received: from NTHCCAS04.nuvoton.com (10.1.8.29) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 2 Jun
 2023 12:09:34 +0800
Received: from localhost.localdomain (10.11.36.27) by NTHCCAS04.nuvoton.com
 (10.1.8.29) with Microsoft SMTP Server id 15.1.2176.2 via Frontend Transport;
 Fri, 2 Jun 2023 12:09:34 +0800
From: David Lin <CTLIN0@nuvoton.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <alsa-devel@alsa-project.org>,
	<YHCHuang@nuvoton.com>, <KCHSU0@nuvoton.com>, <WTLI@nuvoton.com>,
	<SJLIN0@nuvoton.com>, <ctlin0.linux@gmail.com>, David Lin
	<CTLIN0@nuvoton.com>
Subject: [PATCH 2/3] ASoC: nau8825: Update the calculation of FLL for NAU8825C
Date: Fri, 2 Jun 2023 12:09:23 +0800
Message-ID: <20230602040924.188913-3-CTLIN0@nuvoton.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230602040924.188913-1-CTLIN0@nuvoton.com>
References: <20230602040924.188913-1-CTLIN0@nuvoton.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NotSetDelaration: True
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2APC01FT0060:EE_|SEZPR03MB7680:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b469f0-9cd9-4ab0-1e26-08db631f30d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gHJqjWQ4Y2rPvm+hmtQrhgKwcxJdVFbzotP+HKmzV/IizKm2h7V/dpK9jzFRZFVkPfhrS5YaXNZJfD8rKZBph3yN3afkzqBfRjZRHzzJrk6bbVQDxdl9ckxqguYyQ8QGcTjDpKq42y1u9Od/1vmLavHjV4mbGqqY4Yv1hJ4Pq8kpEuoWdMwzUmQBfmkl+H0q+23ki2KEtczgANHu0hycQAIuUTUIASq7ngexaH+la6zdh4lD+efXWkwaFCEPApMze3ZrFBogmRkSN0v0VQIVa/xDe5BjjmNvFMz/bPabtwGD7dH46akbnZwi7CTcIHQ+JbuSaQOZhZQpISvRcBkpKJHJ0P7toPBOpBlb+McXbctjyKAqvpOsLx6ogPhaO6wUkuLpYu4U/7b204271VA1TJJE+W/UQjVRhCwh4ga1qlVYkj3HdsfiBzx/LxoMhrUJwRa10YupH3kV2Wpf6B6ORN9qNz38nixxFfGAxequOwV9ibkgreFS4PVs4HSenta54NLTUq3Gf+g3sAlj8i+GyofaPJmsyjQvKExqyzGxvfE1CzwiCDLQBmRt8WqiqsxbC3JLiofF3IpaEpy5qiawEmKu6iJXaShLEEZYbvwVC5DKxxC0OZtGa4EGl75WoRvbR/sBv0b/Vkb4IvY8WY494JdEJn9kfV+ni2IYBMn0lNf7QZzLsnLP2oXgZ+I/oH4vO05831n0w7C4iCAkGbfdM8cNbsgq/1mO5mL5E4KrlUkUgKQaPeLU+FhvSKzB1Wwm
X-Forefront-Antispam-Report: 
	CIP:175.98.123.7;CTRY:TW;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:NTHCCAS04.nuvoton.com;PTR:175-98-123-7.static.tfn.net.tw;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199021)(36840700001)(46966006)(40470700004)(83380400001)(316002)(81166007)(4326008)(6916009)(36860700001)(47076005)(54906003)(2616005)(336012)(426003)(40460700003)(82740400003)(70586007)(70206006)(40480700001)(356005)(2906002)(5660300002)(6666004)(15650500001)(478600001)(1076003)(26005)(186003)(107886003)(82310400005)(41300700001)(8676002)(86362001)(36756003)(33656002)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: nuvoton.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 04:09:41.6307
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d3b469f0-9cd9-4ab0-1e26-08db631f30d4
X-MS-Exchange-CrossTenant-Id: a3f24931-d403-4b4a-94f1-7d83ac638e07
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=a3f24931-d403-4b4a-94f1-7d83ac638e07;Ip=[175.98.123.7];Helo=[NTHCCAS04.nuvoton.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SG2APC01FT0060.eop-APC01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB7680
Message-ID-Hash: QMXGCQZQ276OEWVRWGLYYN5ZR4MVRZMJ
X-Message-ID-Hash: QMXGCQZQ276OEWVRWGLYYN5ZR4MVRZMJ
X-MailFrom: CTLIN0@nuvoton.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QMXGCQZQ276OEWVRWGLYYN5ZR4MVRZMJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The FLL is updated to 24 bit with lower power consumption.

Signed-off-by: David Lin <CTLIN0@nuvoton.com>
---
 sound/soc/codecs/nau8825.c | 27 ++++++++++++++++++++++-----
 1 file changed, 22 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index 91eb05899a88..e62f3d615b40 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -53,6 +53,7 @@ struct nau8825_fll {
 	int mclk_src;
 	int ratio;
 	int fll_frac;
+	int fll_frac_num;
 	int fll_int;
 	int clk_ref_div;
 };
@@ -2360,9 +2361,12 @@ static int nau8825_calc_fll_param(unsigned int fll_in, unsigned int fs,
 	/* Calculate the FLL 10-bit integer input and the FLL 16-bit fractional
 	 * input based on FDCO, FREF and FLL ratio.
 	 */
-	fvco = div_u64(fvco_max << 16, fref * fll_param->ratio);
-	fll_param->fll_int = (fvco >> 16) & 0x3FF;
-	fll_param->fll_frac = fvco & 0xFFFF;
+	fvco = div_u64(fvco_max << fll_param->fll_frac_num, fref * fll_param->ratio);
+	fll_param->fll_int = (fvco >> fll_param->fll_frac_num) & 0x3FF;
+	if (fll_param->fll_frac_num == 16)
+		fll_param->fll_frac = fvco & 0xFFFF;
+	else
+		fll_param->fll_frac = fvco & 0xFFFFFF;
 	return 0;
 }
 
@@ -2376,8 +2380,16 @@ static void nau8825_fll_apply(struct nau8825 *nau8825,
 	regmap_update_bits(nau8825->regmap, NAU8825_REG_FLL1,
 		NAU8825_FLL_RATIO_MASK | NAU8825_ICTRL_LATCH_MASK,
 		fll_param->ratio | (0x6 << NAU8825_ICTRL_LATCH_SFT));
-	/* FLL 16-bit fractional input */
-	regmap_write(nau8825->regmap, NAU8825_REG_FLL2, fll_param->fll_frac);
+	/* FLL 16/24 bit fractional input */
+	if (fll_param->fll_frac_num == 16)
+		regmap_write(nau8825->regmap, NAU8825_REG_FLL2,
+			     fll_param->fll_frac);
+	else {
+		regmap_write(nau8825->regmap, NAU8825_REG_FLL2_LOWER,
+			     fll_param->fll_frac & 0xffff);
+		regmap_write(nau8825->regmap, NAU8825_REG_FLL2_UPPER,
+			     (fll_param->fll_frac >> 16) & 0xff);
+	}
 	/* FLL 10-bit integer input */
 	regmap_update_bits(nau8825->regmap, NAU8825_REG_FLL3,
 			NAU8825_FLL_INTEGER_MASK, fll_param->fll_int);
@@ -2419,6 +2431,11 @@ static int nau8825_set_pll(struct snd_soc_component *component, int pll_id, int
 	struct nau8825_fll fll_param;
 	int ret, fs;
 
+	if (nau8825->sw_id == NAU8825_SOFTWARE_ID_NAU8825)
+		fll_param.fll_frac_num = 16;
+	else
+		fll_param.fll_frac_num = 24;
+
 	fs = freq_out / 256;
 	ret = nau8825_calc_fll_param(freq_in, fs, &fll_param);
 	if (ret < 0) {
-- 
2.25.1

