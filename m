Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382EA68EB56
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 10:27:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 67A71826;
	Wed,  8 Feb 2023 10:26:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 67A71826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675848461;
	bh=2kYl9g9ROHxNSsnzI7oaZbzHlfwzs2ibF81WSX3uL3o=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S+OlnWkLbm8/47IOnNvoLx57++KebVd/+MG2QcJ9C7JgKLVdKqAX6Ni1fU3yYMXNU
	 7FVlTD9mZyyIkLFUOlbfqLhB3toF3LDpJJV+B4zhBdfQghPCyu+hkRMf49WCWK95X/
	 WJb7W8TkSD1BudakZog9yNAyhLhhiypj8YGM+e+s=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EC4DEF800AF;
	Wed,  8 Feb 2023 10:26:15 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 25343F80224; Wed,  8 Feb 2023 10:26:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20610.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::610])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6298CF80152
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 10:25:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6298CF80152
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m68x3LzrzW2KE6bDChIhJ5WYBBK6gpPbLFxhsKxub5w8Aqwyvs4wUTV+B4MZe+9PvyZRyttPLfA0LBzxvyK2vTIQAiyvyDGjOhn20bjMFBOtkMODsct9YOwmjcp2bjsddjC7e+AHBtzIPLA+JRs5iMQIUCImKHOm62nDiGcpWmt8WErDBspJhQzU9TtbPwlsKxq2qrZRB6I2E4e9c/vcXGmM7pRs7+awC6wbBg0wWMwe9b5/6BUs1Ed+x4bq+CkeeCzUt8j7fdMyDEP7i4X+HxDtrDme9oo0Qlsunj/tv7ROGMC8v4l137wVU2YKnptfVHI3RzNB74eMfJ99WbnG8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MBl3p+Z0Jswhi3S9IDZ7JVvO1vKf67Tscac/t8QYSM8=;
 b=U+4nHs7ie8nTV5ZFLNFPIeFszDcE+z1frNB1drkIx7axNuRoyyef/kyLGT24eYMQ8gbCTvA4o13aTLZ46OkwncyFrRGGkNW/6huHiSFmG1crJvdUhmX6TvTDSbTdt/pE8Bmey48hUd427pWQJo1NN6+fokfsHPdYmkTnMXPB2BrmnepPhqmtER7DznduFfOZ26VY0Ca8TDZzL+Zgr74fozcqyYFpO3ASI+zuoStQUX5ASas+I74Bs7p8h2ov/ijr8IbblYMqkGyzTlTip33DpxJ+gKUD6xhQjkZNJlx9+joms2JCX/sxFKtHWnOeLHDerg8GbtCdjHKdVPHio8+xhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=irondevice.com; dmarc=pass action=none
 header.from=irondevice.com; dkim=pass header.d=irondevice.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=irondevice.com;
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM (2603:1096:100:7::23) by
 PS2P216MB0228.KORP216.PROD.OUTLOOK.COM (2603:1096:300:21::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.17; Wed, 8 Feb 2023 09:24:59 +0000
Received: from SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727]) by SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 ([fe80::3d9:7f82:fa73:e727%7]) with mapi id 15.20.6064.035; Wed, 8 Feb 2023
 09:24:59 +0000
From: Kiseok Jo <kiseok.jo@irondevice.com>
To: Rob Herring <robh+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Subject: [PATCH v2 3/4] ASoC: SMA1303: Modify the sysclk setting
Date: Wed,  8 Feb 2023 09:24:19 +0000
Message-Id: <20230208092420.5037-7-kiseok.jo@irondevice.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230208092420.5037-5-kiseok.jo@irondevice.com>
References: <20230208092420.5037-5-kiseok.jo@irondevice.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2PR03CA0020.apcprd03.prod.outlook.com
 (2603:1096:100:55::32) To SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
 (2603:1096:100:7::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB0077:EE_|PS2P216MB0228:EE_
X-MS-Office365-Filtering-Correlation-Id: 245a51fd-4b7b-44fa-7cb0-08db09b65981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6nc+U1efA08OcV8GeP37sHTfGIhSPZjZNaIJPUCcQVe06Y/TwCP5A/9X2HaGJQtdt5uIqg0mCJ8W+bVhfiGI7iJDs6GWGlNGsnEMoAb58Sk2HcgL9LpJK0lmI0ruGHdO7xH9eV3b7wJ5BYVlI5AUituapGWCIi90JxIeGolgaaI/oQL8X9zuHeXhGKeczag8xsgQzNyf/sBA5QnP45IQkObeAtKZJE4Rb84Bu8SiRx8KveJg4Jqa1kyTh07Hrj7wuE4CTbDkwE22MkwXJwdUWgAIjoEhuZosVz66JDgxHoeNpQ4c6nbysiDZA39QqWDj7TBRZVhjPbXweozK2tWovvId92uTg8jVpDGLxS8qcNfeyzsmW8mXQPXayZB7IZLtWE9nQodO4Z8Sd66qfIxdg2Jve0qtzVkaT+G3k4+4NFt5kFSxjwM2BLL762fHBChCKUdB0mTs3VoCJW7TOsOycZ8OqEry6q9CiO4aJ+mNwnwhIRddpn1RwQ7fHHoqGMmo3qNtSgsTAD0wEtAW5hTGWr7zO5466BaubMhWUS/p5xQxc+afDwr8UnBVgm831mhl8FFGQgUpVVsalWuMMeas3I0VtbkjYtypx7fobmEAsvughwde04kMQk3/gjPVp06MgHgxK3Czhg1CKAaANTvXrs9rop2o+iyPCs+NEIwuZZkpHX2FFuE0HwQxQJdRnQZ3C0yMzzL1m6a5gOar3kRrFA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB0077.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230025)(396003)(346002)(376002)(366004)(136003)(39840400004)(451199018)(2906002)(52116002)(8936002)(36756003)(44832011)(110136005)(5660300002)(6486002)(478600001)(316002)(2616005)(38100700002)(38350700002)(6506007)(4326008)(8676002)(66556008)(66476007)(66946007)(1076003)(107886003)(186003)(26005)(86362001)(6512007)(83380400001)(6666004)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8nlyBE3m7glyLt+10KQUXJZYlfPgxCjB71uuKFa2id8JafmvtokSOJ4D62Nc?=
 =?us-ascii?Q?hKYrU3g/PWX8W0qe07Dxt7/gLLMFEuASZT/G6/6+PjHLbyzpqQA2Xiw35HTp?=
 =?us-ascii?Q?ULwCRoQVmo+EXYZilrQjE84j9moPozueieXQkfbpknw2okiYvoAw2+Kf8hyc?=
 =?us-ascii?Q?v02vudHk603QmfP2G36/qwFrOc2Ih/1RcdYDGF5DGNdto3uKtWmvqCZSSzoC?=
 =?us-ascii?Q?xTz/yYKwpUvIPfjTVdKSelND/xbeNqq5Ykdcfpa8fgEdc6ioUZIh0fx8hvnT?=
 =?us-ascii?Q?SmSlPTc4jgQKVOjKSa7xDIzZlLTS5Yz+55NLDeyNPp94J9LBEYGJXdrm5jf5?=
 =?us-ascii?Q?ZIWAJIw+Z0I+u4QqkItDU0a0blG/wAV7k0qBGXBu0/WamcFr8i+QO3fKE3XB?=
 =?us-ascii?Q?XHyDYAWZaT9ctCnzcunWDi38OZeT0aVraDidiKsd3ncPamHYVq+9Y1/qPxFf?=
 =?us-ascii?Q?bphyELe7t6+94I8gIoxjFn06OwgIAJsA8rpo8SnOEFMRQCt/8DaCdcgvX/5M?=
 =?us-ascii?Q?FrC3bweTra0Oe9pOUEpZu2umrSdsBeoXpD2xwRU632a+scDdpul6/wkQXgzB?=
 =?us-ascii?Q?p+kjcTVCE37nvdbxYQA8vmitdEsB8UlNK2/kDi6KiTxpQh3/x8Be776VqXlS?=
 =?us-ascii?Q?R5RK8m+nG5ef2+hjZ/YhC1SxCKJHDHnzYRQIIds/xRdQalNMg8P8nTP/3P3F?=
 =?us-ascii?Q?rZnB9Of/UMjsxHQPXCHjdQQ1+TrDaiFmog/etsS9UhgUuH+rc7XTMumHYc2Y?=
 =?us-ascii?Q?5wssJNFQUGYyTiCM11hQdgA6fkBS+V4CA+Hd4FFWvjpYZPl2BF5Q1zcw4KB1?=
 =?us-ascii?Q?p6grZaSNkn+dQvyvECl4MwI6NT1EHY40ATQ84vkgtie9H1LcCSYlU8rcgS6F?=
 =?us-ascii?Q?NGndaOZlMXjNY2phtln2o214RYOgmmOBToBRfFY6MhOscufDgVonh878/Kz7?=
 =?us-ascii?Q?5XbChDd/uVPF3dSm1iWKPh9FE1u87zkBe7xbuUeVzFVYoL1zuV8Q1e6B9Oh3?=
 =?us-ascii?Q?9bK7lHhI7oyWEpCKrVxUKmxchF6yLkU196fp4arf9EfEfBXSt52u38mjThRi?=
 =?us-ascii?Q?2ZIkh1EBN9f+HrkCxhWdForSBi/Irxv54GLNW6mMvLvfbJpxiD+xITN0K39V?=
 =?us-ascii?Q?lK2gg2FYevf1cN38K+W8Em/4LFTUup11pVNkXvVoHe82wCVtIbNjbM4IRPm0?=
 =?us-ascii?Q?TARV2j+POStZV6IXOZRxOodxbgeYAMuLjFKBrkI06VFpgD1IoyPLhRa72LI2?=
 =?us-ascii?Q?8FVlziAVfrP3emObTwMUpCLyflR/A3MEyPJAnEu47aSFcQrImlNVF5S0XRyz?=
 =?us-ascii?Q?z5DVaS964Lb2z7vgT3uiMuZkVBk60/UN8UIINtLZEcINrJAPZ10ziLZKDzJj?=
 =?us-ascii?Q?Fws6EeDz6awI0lUOQbBBOZfCCY17NNb/OyqI/0fXTQXZUIv+G2UdG9F1wxDJ?=
 =?us-ascii?Q?evaugybXndrZqNOl5snIx3KYRzWzMWLkLQMWwff0VlUHZhxsGcAabhSsl9BW?=
 =?us-ascii?Q?q698DYQtmL4wL61FkCjHusLfOjjtFFaUXziRgvvuSd2Yp9OhUKQCLJOydtOD?=
 =?us-ascii?Q?G0KKh+fn5zPrFJM9ZIMvCJekFbT7hRPWD66MOpvtk1G0ZhHXT0Fl0BJ+VlpX?=
 =?us-ascii?Q?tQ=3D=3D?=
X-OriginatorOrg: irondevice.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 245a51fd-4b7b-44fa-7cb0-08db09b65981
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB0077.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 09:24:59.4975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b4849faa-3337-494e-a76a-cb25a3b3d7d1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iP0PH9Lk5Ld7GwXZDOM3+nKDy2QfL2C3TpAPj+WreHE+CrFi9V4k82bFgyGb746DI+xlrBRbYaCJ35oJjYsgXPDEJiVJ9usF1Df29PJmDsU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2P216MB0228
Message-ID-Hash: KV3KKXNRO42H3BMIYJWKKC5S3X2FRJPG
X-Message-ID-Hash: KV3KKXNRO42H3BMIYJWKKC5S3X2FRJPG
X-MailFrom: kiseok.jo@irondevice.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 Kiseok Jo <kiseok.jo@irondevice.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KV3KKXNRO42H3BMIYJWKKC5S3X2FRJPG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Previously, sysclk was configured using devicetree and sysclk-id.
Change the method to obtain and use clock information using clk_get.

Signed-off-by: Kiseok Jo <kiseok.jo@irondevice.com>
---
 sound/soc/codecs/sma1303.c | 124 ++++++++++++++++++-------------------
 sound/soc/codecs/sma1303.h |   5 --
 2 files changed, 59 insertions(+), 70 deletions(-)

diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 9ae4e3cba3ae..a21cde126906 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -7,6 +7,7 @@
 // Auther: Gyuhwa Park <gyuhwa.park@irondevice.com>
 //         Kiseok Jo <kiseok.jo@irondevice.com>
 
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -59,6 +60,7 @@ struct sma1303_pll_match {
 struct sma1303_priv {
 	enum sma1303_type devtype;
 	struct attribute_group *attr_grp;
+	struct clk *mclk;
 	struct delayed_work check_fault_work;
 	struct device *dev;
 	struct kobject *kobj;
@@ -936,27 +938,23 @@ static int sma1303_setup_pll(struct snd_soc_component *component,
 	dev_dbg(component->dev, "%s : BCLK = %dHz\n",
 		__func__, bclk);
 
-	if (sma1303->sys_clk_id == SMA1303_PLL_CLKIN_MCLK) {
-		dev_dbg(component->dev, "%s : MCLK is not supported\n",
-		__func__);
-	} else if (sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK) {
-		for (i = 0; i < sma1303->num_of_pll_matches; i++) {
-			if (sma1303->pll_matches[i].input_clk == bclk)
-				break;
-		}
-		if (i == sma1303->num_of_pll_matches) {
-			dev_dbg(component->dev, "%s : No matching value between pll table and SCK\n",
+	for (i = 0; i < sma1303->num_of_pll_matches; i++) {
+		if (sma1303->pll_matches[i].input_clk == bclk)
+			break;
+	}
+	if (i == sma1303->num_of_pll_matches) {
+		dev_dbg(component->dev,
+			"%s : No matching value between pll table and SCK\n",
 					__func__);
-			return -EINVAL;
-		}
-
-		ret += sma1303_regmap_update_bits(sma1303,
-				SMA1303_A2_TOP_MAN1,
-				SMA1303_PLL_PD_MASK|SMA1303_PLL_REF_CLK_MASK,
-				SMA1303_PLL_OPERATION|SMA1303_PLL_SCK,
-				NULL);
+		return -EINVAL;
 	}
 
+	ret += sma1303_regmap_update_bits(sma1303,
+			SMA1303_A2_TOP_MAN1,
+			SMA1303_PLL_PD_MASK|SMA1303_PLL_REF_CLK_MASK,
+			SMA1303_PLL_OPERATION|SMA1303_PLL_SCK,
+			NULL);
+
 	ret += sma1303_regmap_write(sma1303,
 			SMA1303_8B_PLL_POST_N,
 			sma1303->pll_matches[i].post_n);
@@ -999,13 +997,14 @@ static int sma1303_dai_hw_params_amp(struct snd_pcm_substream *substream,
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 
-		if (sma1303->sys_clk_id == SMA1303_PLL_CLKIN_MCLK
-			|| sma1303->sys_clk_id == SMA1303_PLL_CLKIN_BCLK) {
-
+		if (IS_ERR(sma1303->mclk)) {
 			if (sma1303->last_bclk != bclk) {
 				sma1303_setup_pll(component, bclk);
 				sma1303->last_bclk = bclk;
 			}
+		} else {
+			dev_dbg(component->dev,
+				"%s : MCLK is not supported\n", __func__);
 		}
 
 		switch (params_rate(params)) {
@@ -1175,19 +1174,6 @@ static int sma1303_dai_set_sysclk_amp(struct snd_soc_dai *dai,
 	struct snd_soc_component *component = dai->component;
 	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 
-	switch (clk_id) {
-	case SMA1303_EXTERNAL_CLOCK_19_2:
-		break;
-	case SMA1303_EXTERNAL_CLOCK_24_576:
-		break;
-	case SMA1303_PLL_CLKIN_MCLK:
-		break;
-	case SMA1303_PLL_CLKIN_BCLK:
-		break;
-	default:
-		dev_err(component->dev, "Invalid clk id: %d\n", clk_id);
-		return -EINVAL;
-	}
 	sma1303->sys_clk_id = clk_id;
 	return 0;
 }
@@ -1570,8 +1556,12 @@ static int sma1303_probe(struct snd_soc_component *component)
 {
 	struct snd_soc_dapm_context *dapm =
 		snd_soc_component_get_dapm(component);
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
 
 	snd_soc_dapm_sync(dapm);
+	sma1303->mclk = devm_clk_get(sma1303->dev, "mclk");
+	if (PTR_ERR(sma1303->mclk) == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
 
 	return 0;
 }
@@ -1583,9 +1573,44 @@ static void sma1303_remove(struct snd_soc_component *component)
 	cancel_delayed_work_sync(&sma1303->check_fault_work);
 }
 
+static int sma1303_set_bias_level(struct snd_soc_component *component,
+				enum snd_soc_bias_level level)
+{
+	struct sma1303_priv *sma1303 = snd_soc_component_get_drvdata(component);
+	int ret;
+
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		dev_dbg(sma1303->dev, "%s : SND_SOC_BIAS_ON\n", __func__);
+		break;
+	case SND_SOC_BIAS_STANDBY:
+		dev_dbg(sma1303->dev, "%s : SND_SOC_BIAS_STANDBY\n", __func__);
+		break;
+	case SND_SOC_BIAS_PREPARE:
+		dev_dbg(sma1303->dev, "%s : SND_SOC_BIAS_PREPARE\n", __func__);
+		if (IS_ERR(sma1303->mclk))
+			break;
+		if (snd_soc_component_get_bias_level(component)
+					== SND_SOC_BIAS_ON) {
+			clk_disable_unprepare(sma1303->mclk);
+		} else {
+			ret = clk_prepare_enable(sma1303->mclk);
+			if (ret)
+				return ret;
+		}
+		break;
+	case SND_SOC_BIAS_OFF:
+		dev_dbg(sma1303->dev, "%s : SND_SOC_BIAS_OFF\n", __func__);
+		sma1303_shutdown(component);
+		break;
+	}
+	return 0;
+}
+
 static const struct snd_soc_component_driver sma1303_component = {
 	.probe = sma1303_probe,
 	.remove = sma1303_remove,
+	.set_bias_level = sma1303_set_bias_level,
 	.controls = sma1303_snd_controls,
 	.num_controls = ARRAY_SIZE(sma1303_snd_controls),
 	.dapm_widgets = sma1303_dapm_widgets,
@@ -1680,9 +1705,7 @@ static struct attribute_group sma1303_attr_group = {
 static int sma1303_i2c_probe(struct i2c_client *client)
 {
 	struct sma1303_priv *sma1303;
-	struct device_node *np = client->dev.of_node;
 	int ret, i = 0;
-	u32 value = 0;
 	unsigned int device_info, status, otp_stat;
 
 	sma1303 = devm_kzalloc(&client->dev,
@@ -1700,35 +1723,6 @@ static int sma1303_i2c_probe(struct i2c_client *client)
 		return ret;
 	}
 
-	if (np) {
-		if (!of_property_read_u32(np, "sys-clk-id", &value)) {
-			switch (value) {
-			case SMA1303_EXTERNAL_CLOCK_19_2:
-			case SMA1303_EXTERNAL_CLOCK_24_576:
-			case SMA1303_PLL_CLKIN_MCLK:
-				dev_dbg(&client->dev, "MCLK is not supported\n");
-				break;
-			case SMA1303_PLL_CLKIN_BCLK:
-				dev_dbg(&client->dev,
-				"Take an BCLK(SCK) and covert it to an internal PLL for use\n");
-				break;
-			default:
-				dev_err(&client->dev,
-					"Invalid sys-clk-id: %u\n", value);
-				return -EINVAL;
-			}
-			sma1303->sys_clk_id = value;
-		} else {
-			dev_dbg(&client->dev, "Use the internal PLL clock by default\n");
-			sma1303->sys_clk_id = SMA1303_PLL_CLKIN_BCLK;
-		}
-	} else {
-		dev_err(&client->dev,
-			"device node initialization error\n");
-		devm_kfree(&client->dev, sma1303);
-		return -ENODEV;
-	}
-
 	ret = sma1303_regmap_read(sma1303,
 			SMA1303_FF_DEVICE_INDEX, &device_info);
 
diff --git a/sound/soc/codecs/sma1303.h b/sound/soc/codecs/sma1303.h
index ae70f207adde..29e6d19035c6 100644
--- a/sound/soc/codecs/sma1303.h
+++ b/sound/soc/codecs/sma1303.h
@@ -16,11 +16,6 @@
 #define  SMA1303_I2C_ADDR_10		0x5e
 #define  SMA1303_I2C_ADDR_11		0x7e
 
-#define  SMA1303_EXTERNAL_CLOCK_19_2	0x00
-#define  SMA1303_EXTERNAL_CLOCK_24_576	0x01
-#define  SMA1303_PLL_CLKIN_MCLK		0x02
-#define  SMA1303_PLL_CLKIN_BCLK		0x03
-
 #define  SMA1303_MONO			0x00
 #define  SMA1303_STEREO			0x01
 
-- 
2.20.1

