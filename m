Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACC774F1E2
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:22:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B6E13E95;
	Tue, 11 Jul 2023 16:21:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B6E13E95
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689085339;
	bh=jnza72F8PtcgB2Ut4Kjad6rRLEvFzQT/qjoBkpd06L8=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=IjoRecXjKQYUb78jtnQm6tqLu/iAFkAQcCcZM9aN5Sy+xR462cwJZLggDuKJvQTTf
	 l9wDxG7Uya/1jPF3ydNg0AHBBMjNsqSmlwrpVi1MHseNMmNB7LUfY5zWi7nqhJmpPz
	 x78CLDUMl85V5eGPvEXHkmusSAlwYy4ZKw/+VDR0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A226CF80535; Tue, 11 Jul 2023 16:21:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 0BE0FF80236;
	Tue, 11 Jul 2023 16:21:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1C46FF8047D; Tue, 11 Jul 2023 05:49:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-SG2-obe.outbound.protection.outlook.com
 (mail-sgaapc01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feab::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60341F80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 05:49:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60341F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256
 header.s=selector2 header.b=g7CrR/vN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TKwB1bHCLrhEGe4oqInfAQdB2kJzZhBUOqpQP5Ta6LXTFLIuSbI+8Cc6AFbd2hEQjLrvMEd05jlt2nrDqW1U0H0QoTgFzGCNnYj8A4swT5lvUoHDQPiUPhTpeK60q7f5HYqh63DTdWtPrVKZEUoJSD4bFwgJx5Blsdi4QgPrG3nrNv729BiAaHEqGopIo7iStF6iqyg6BbTJesXqPHwF3WQu5AZWqGqtYNYC/N9N9TccAMr3ZTlTbM1t0JwHTp402ojZxClhQ9X+VMftMD1H1aGJAneAJLiSlGf024YtlIeGtF2uzvtjzWap17YkWPpKz2TUC/+tEgATX21JT5gMog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qcx2CLMip+TskW0MjLXMBtoDwtSTCuRX+IeqqilVuiQ=;
 b=nEjBWnzXpx7zAwvv2RrVMy82p+oaaQX8VFXZ/Y0nne/Xo6cZNFTM4FyQKaPgrG1XSsQnd4GzEIofkhkdAS7eT4ehWjPb+ee2mwVWosXWLkkTsPT4z8RCLRLXLF7ec3Cg/SaDEES4NG0Hv5R+wREF45qR1qaz52o0zE3G4kE2hkE0+gSdzJcekIzGhAvacxLPQK5ma8yDV9OQ4g3nFsikcPxoRvuyn5Q3uyD+ErPrpsrylYh3uO7wzPZ0MMnG+nIZMHLjaf2/OFjuVXn+chRzZ1rfuBoGjvx39xpHXuj1KtOr0U9K9Tmg1lVNcWbtW8u80ytDm1OGz5GwRV7ZjAD1pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qcx2CLMip+TskW0MjLXMBtoDwtSTCuRX+IeqqilVuiQ=;
 b=g7CrR/vNoP21Lt5U+oEQBmJOlkR3my0XjF72E37opYkOJtvhY0PMhHg76sn2Mt0yfonrhGW4V4nxq3n6WtWLab2oNizkhN5aPbZpAkEmP8Yl+J+v4RJKcB1WviYEK/CRP5FSDx0WvHy1IkIfI7Q4r3U/9n6unqUsZoaJivt/G5pFUA85+BbWqjYVgSedNA3CvN6521h7g9VPsjqFKDUgVB+vluSbUnANN4y2m4SSMwNUtXryKUBzvyYiR0MiBLyo6aaUrxfAaBpahdP6RHPSiC3ke/5YzW+YMTw/P4XwPaWg/AknQHL5lijNMB6loXqsEtnyiwtDvT+5j+lf7ufztw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4385.apcprd06.prod.outlook.com (2603:1096:820:71::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Tue, 11 Jul
 2023 03:48:58 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Tue, 11 Jul 2023
 03:48:57 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Yangtao Li <frank.li@vivo.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/5] ASoC: bcm: bcm63xx-i2s-whistler: Convert to
 devm_platform_ioremap_resource()
Date: Tue, 11 Jul 2023 11:48:41 +0800
Message-Id: <20230711034846.69437-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0038.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4385:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e802745-1da3-411b-8c4d-08db81c1c0fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	2qIsBUf5Xa61Y7E1dssbO6hURt0wxJwpaSer5PZzZTEzTpmD5Y4Tsp1Yh6H7n8v/NCG941+8GouoATIeqFoohLZbmDMwdBUoaBHIv2hnNXtuvhqmCJmAibjBbJFQNr2PQVfkjZNLEFfcIxmr3CyYt5XTp+NJUzJbODrUaL/noiTRqKOzTSTVh/XjNGTwQJowwZn3QNBxJ6AwiVN51hJadYOBrwqMgw5oglu+qcTNYTUi/1h9iNVNr5nlBBdDx0MylcnwqfAGmsXfng873ie8aYT5TXBdH/F0PblDG6hSDoTmXsblqab337DgNDDYv544liYrFImi7rEYc1fWOqAPF+gTQ3WayHrGTcRdbpF6oHX3zSEeIrRCAvZl36rkz5YfUTB/oRjYLX5oFmREhz3rlm42BkrjMhuAtxN2pdft8NCQVDg1yZCAsYnGmEhgPMGRNgvjQ9QoBDXa8MgUeD/njyxCpzubquLQ4bx00mkixKdrR8XbokTFMw26MgDOBmutvDSboRGcgjLvhtj1TcASIE2/j+0BHziPhrpwT8b+5GsrajHBn474bkolucOUyiZukfCnhjuPsIL37MYGE3kyO1aFwOn0Utv7S7CJEs2wXITZly2WUtRPTsgmOR8NCv9h
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5269.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(39860400002)(136003)(346002)(366004)(451199021)(478600001)(4326008)(52116002)(6486002)(66476007)(6666004)(36756003)(66556008)(41300700001)(110136005)(316002)(66946007)(86362001)(6506007)(83380400001)(26005)(1076003)(2616005)(186003)(38350700002)(6512007)(38100700002)(2906002)(8676002)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ELrz9EZb6pVJjlyLrEc8YcDM4vA1l9XyvHEHsKlbqtRTnY4WXbolOumUdhaI?=
 =?us-ascii?Q?5ycguVmeA8fJEIMsAFw0fRSzd9znDfZZLB+Do8dPjxk2zWtp6FT0Nk2KH+CU?=
 =?us-ascii?Q?njECyfHDt4568hUmD4tfsgr1hH10lYDoDujFpYFmdB/CcAAvd9KGI7qvR5yi?=
 =?us-ascii?Q?BQqPj/5VgfDlb6IFxZ1n8sW+WYpuFg7o0j8G4iO041Tbag0RZnmIFbbO2FBN?=
 =?us-ascii?Q?U1dbR3DBPxSz4c//ulf3Mays7FfsSGfogjE9fpIp4Jc8CrXh1+sLzNmQMrik?=
 =?us-ascii?Q?L57PyVwcSD6De8AXLYSargn/8ryRoDi9FfF5IqLmco5wG1RY4nRadvC6WURl?=
 =?us-ascii?Q?O/0c2LG8SNpucDpnG1iANaZYwJT61E/qvwEUnJ0FifAQa/ujHc2H/+/YiGaL?=
 =?us-ascii?Q?lPOr3le/vVqroToo5a8fO8Z7LXGGKUXdXWAp1ObIs5keYLDHcrXDryEqcZAm?=
 =?us-ascii?Q?/GdRi8UzokhILzL7nqHXshKcV60vL65KlJFB/powo8gCYmZHRafWbUVtRxm6?=
 =?us-ascii?Q?Q/zhvyUB0EEmQTn6vwcLzEJvImMbjpMt926Nubp9aOzMFZMwzhfLJeVwj5xT?=
 =?us-ascii?Q?C+V6dKevMfsFPLe3pCTzbwzk8R/iz1oEStHSsU/jx484exAtWb9IQiqqn0MS?=
 =?us-ascii?Q?eAsWgmzYCcYtTdN6H6Wk7lvPFxteCW5F6+WNqmPju1TuGCSf8WAKBR5pdKaP?=
 =?us-ascii?Q?Edo3ua1MopVK7mgdZOSa+JXwxyJYsjKi0c6+HhshgLzlPk6WCR9v/MTEzTVJ?=
 =?us-ascii?Q?JYOX78F/BSRXL+0zpadLI2a7yVaKN9dVAT+8tU9cAIIj0bO7d9dEyk5A/njV?=
 =?us-ascii?Q?HENfPCYFj2VN9+fu979V2yKlQkLtsdiBRKGqH1tUChT4JaCDr8vGnVQ6ep55?=
 =?us-ascii?Q?zZylP5SX4yWxwznPBGPA3JmMQhTPZhKVNAsUSTo+ooRkKXyCW7gBrYGn6gFn?=
 =?us-ascii?Q?Qav8pcj7UE6pNH/kgBDKe9RjuaC+8678kesU7OtfF9wOQV9Z/cV8YVrGzYYs?=
 =?us-ascii?Q?ur7LbmdUZq9FSe2UVhFYDgG2nNA/JjF9hNBE+072vz/33oYLQ0YXeVBON+ub?=
 =?us-ascii?Q?+wNxcmz+eZ9GZhL3YFJZiSQbQN9ESAKJJZzB6PtecrN7k1cnKTDupA6IF+5h?=
 =?us-ascii?Q?WKwMxN7O1hPdU+FLMEuxSQrUp+kCDUnW4uAUDVccuSNAeF7V/oxW2eVbN1L6?=
 =?us-ascii?Q?XzkgwJ9bOOaaDbHatztbaFX/stYNsFRkhJk2R/pxqsYsSR+CmiqeeRUiAbrj?=
 =?us-ascii?Q?MrDRJGHbDPc4nB0jPDOepA2wkqBdWcMk5S4KRjZebfrm9zegzN6FDfZwrcG0?=
 =?us-ascii?Q?2pOzw0NJWCT05Jcq1FJyI1XGY6k/WU49V+jwtSiBEvjFUHqux6bvjIeshNCF?=
 =?us-ascii?Q?LMtVf2SA2OwqmtrYA3ikPwoJjS7C1+UBtd6dfYpDRVKK4qUdkBnh/sbo4nZW?=
 =?us-ascii?Q?UWhQ7veKibyUG84AVFpmWPQA6oiQ/oktSv4gdpzehVNgf1jJh2qIGaanVU4M?=
 =?us-ascii?Q?Ne0WU8GukbJJVEJIXLmkOL/+t6eShenlkZZZ9IHTIpmWZ0IQzxtvRIcRBUWs?=
 =?us-ascii?Q?Hnnw1gHfI8cI5wecaDQ81PGWmmjz1ybOUQvC4MqH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2e802745-1da3-411b-8c4d-08db81c1c0fc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2023 03:48:57.2114
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IjX0iRPltM6uKiGWp5O6JhgYzOu++rRP41CxJO1+Yl62ZmCPSb55lfsV8kB8FOYHvcBzSXp8Vv82YAfBDV9s/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4385
X-MailFrom: frank.li@vivo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: XEKXQQMK2JEKI7SMBAN3XYRG6ZHUZ3O3
X-Message-ID-Hash: XEKXQQMK2JEKI7SMBAN3XYRG6ZHUZ3O3
X-Mailman-Approved-At: Tue, 11 Jul 2023 14:21:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XEKXQQMK2JEKI7SMBAN3XYRG6ZHUZ3O3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 sound/soc/bcm/bcm63xx-i2s-whistler.c | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/sound/soc/bcm/bcm63xx-i2s-whistler.c b/sound/soc/bcm/bcm63xx-i2s-whistler.c
index 18c51dbbc8dc..c64609718738 100644
--- a/sound/soc/bcm/bcm63xx-i2s-whistler.c
+++ b/sound/soc/bcm/bcm63xx-i2s-whistler.c
@@ -225,7 +225,6 @@ static int bcm63xx_i2s_dev_probe(struct platform_device *pdev)
 {
 	int ret = 0;
 	void __iomem *regs;
-	struct resource *r_mem, *region;
 	struct bcm_i2s_priv *i2s_priv;
 	struct regmap *regmap_i2s;
 	struct clk *i2s_clk;
@@ -241,20 +240,7 @@ static int bcm63xx_i2s_dev_probe(struct platform_device *pdev)
 		return PTR_ERR(i2s_clk);
 	}
 
-	r_mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!r_mem) {
-		dev_err(&pdev->dev, "Unable to get register resource.\n");
-		return -ENODEV;
-	}
-
-	region = devm_request_mem_region(&pdev->dev, r_mem->start,
-					resource_size(r_mem), DRV_NAME);
-	if (!region) {
-		dev_err(&pdev->dev, "Memory region already claimed\n");
-		return -EBUSY;
-	}
-
-	regs = devm_ioremap_resource(&pdev->dev, r_mem);
+	regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(regs)) {
 		ret = PTR_ERR(regs);
 		return ret;
-- 
2.39.0

