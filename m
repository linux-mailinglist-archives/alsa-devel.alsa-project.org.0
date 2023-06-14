Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2B772F0E2
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Jun 2023 02:20:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5168283A;
	Wed, 14 Jun 2023 02:19:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5168283A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686702002;
	bh=9rFdktD7E5X5O0S67o9jUTIn4+JsIcI6ClcRCRrTpcw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mm6J8tdlg/bZqFp9qGvEHSPgjFz928HL85QBYT8YZAixC+TPQQc7UplEl98RS0NPP
	 jKTb2HUmkFGcI45eAK08HgXLbfUMshLNhRJlCJh6RqQVFEKB2oV1rI+aVC/ATSXCHs
	 qFhylQKPwJYj5u+LNvbuGIHISSAOwKnFeQeb1kg0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8596F80553; Wed, 14 Jun 2023 02:19:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4411CF80301;
	Wed, 14 Jun 2023 02:19:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1207AF8052E; Wed, 14 Jun 2023 02:19:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C2FC6F80246
	for <alsa-devel@alsa-project.org>; Wed, 14 Jun 2023 02:19:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2FC6F80246
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Q9kHSOHU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FyL1Y5QkTsDsN5vXfBmKeAo1kqTezq9Rzgm0PdPPHz3kQOMvpP/0D6G6QNTDCkq12xlNE2IsOav0tJ2zr6MXwfRhbqZP/d8BVxjVnuxH+xipDzFUgmeVew78N7bFCYoB78TfnlRuUaiQuKIGf0W0I6RRODbzoEypveOXYi0ZThlPaMSxUeuj/RBWxFDeV6Dgh/Q7I6U1HYpQTaowaLOjkgmnbF14UtcLj6YE1nvcsRCO2l3aqD2pou/9D0dhyRnS08Ltf8uwdPR3mDMNMXxLRelP+sapnn3AbrDPOT3bf2EzfpVMNnEL3Zm4V2vG0HaGVhjEaG3elzSMPafxtCexwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZrVk32mh+HwdhB8jEL9qBnzfVfQZwjPpRuXQUA1srz4=;
 b=PlHew39wsWt5L1IkLJdd7bhgXie3F2Zhv2mZoKyD9UsgVOVpVbzAm3L0sO3evztCkv/F7Y3xyLSbh5rquU6w5Bw+icbqi7kcmNUNQcln3S9mHjR3b/JihehWk8P+Vd3TvuThWBD8uZdYZ6nKCUts3kwFPt/wJex7ksT3mlobHmmplQfH4ak0n94rP/Y+e1Ykeg7jHGz4r7ifhSHHrlgDa8L+CKyYk4CF38xdGHCyt9CrNJ+amkpenVCQfsI8kdI8jd89zgsvz52EXm4oOOCRT4m3m+fDJnFCv2G7r4Dmj0a0Ujz6+GS0gve9EXSopXnToLOo06YOjr4dRfm0HnfvZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZrVk32mh+HwdhB8jEL9qBnzfVfQZwjPpRuXQUA1srz4=;
 b=Q9kHSOHUwjp3McOqT8l2jKw7F/5iybs/NVsvE2rK/KHfkuc9E7c4/3SpMbX7Iul+QNSz5pCA23yQ1hQNioTcpO0sJzxe2FBAcNxWtfJK2TtvShxLj1PitqgZ57A7VMddzjI/1usaBFg8u6bto2nW4bedBeO7NXQZHlhdfdU0hL8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by OS3PR01MB6276.jpnprd01.prod.outlook.com (2603:1096:604:f5::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Wed, 14 Jun
 2023 00:18:56 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6477.028; Wed, 14 Jun 2023
 00:18:56 +0000
Message-ID: <87jzw6hp5c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
Subject: [PATCH 2/8] ASoC: soc-core.c: add index on snd_soc_of_get_dai_name()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
References: <87mt12hp75.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 14 Jun 2023 00:18:55 +0000
X-ClientProxiedBy: TYCP286CA0201.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::15) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|OS3PR01MB6276:EE_
X-MS-Office365-Filtering-Correlation-Id: 700a05c4-fb5a-4fed-0f05-08db6c6cf12d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	z7wznyY1x+ATXGAsOik0Z9jgI6D14AnZpw4DJzm2QMcJCSQRWXwx5aNB07N5Q+r0GifnVyJ/xc8dG7gAyPXnjYceqa4e0eSQxmW/6XOk9Fcm5E31v1kaI44Bt/IAxncwD8YAH3QTWuPmh/qGbyyGEeLDq50lR77NqUO8/ihXPoAH/sOPPOkd4vNJOg6XPT7zXfH5viR7AfXMoWgMr1uZ2fYwnS8F3xWykYQt5pC/EQIsiatT6NEfgXdmYJahslN1I+oY7cNkdk3x7T0fs7pd0dcrGKgUNRAMociFdfN1RKyIm5t9yPLJWmyEtF7zS3urZJcs6u5aAGAAHAEZZxOR2VtsVCYoGq57Cn3RkP2Kcv6rexkVGyDmES+CGZlGhXo24VMg7nDwjomtLgmSWJakOOTz2Ay4UOkJVvTUAXSXJCuNZAA5oeLESWujA3LuQDThbTTBi6XiTRGTwpH4l4pbyaR/Wyj5OANbT8MMdKGssn0CEA2F7gQ4pvC4/Ug93fKP6egwiOUpLuUwtwYum34xUDQR4C9B7ozt9FQTkGUlY+xKCK+5tOZIg3lkKhnSKzgLJ0t4WqlGeze4PmMici/x0Htz80EK3JLpuD2CUVnliNwCnaqps4utidluGavQgID7oT0woccC0MwJ1s1vJlNvcQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(39860400002)(346002)(396003)(376002)(366004)(451199021)(83380400001)(66476007)(921005)(4326008)(36756003)(66946007)(66556008)(38350700002)(38100700002)(316002)(41300700001)(6512007)(26005)(6486002)(6506007)(52116002)(478600001)(86362001)(5660300002)(8936002)(2906002)(8676002)(2616005)(54906003)(186003)(7416002)(110136005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0CO28TG+3oxGae8VYcFSAQHd8/245IpO1dbUzDWmdpdE+HV6B220sH/3U3se?=
 =?us-ascii?Q?C83KAuDiPU6pBk3N/ouZzu0kgChcfV0JTSdQ18pg8gP9L1EFXcXSiByxSwnv?=
 =?us-ascii?Q?cWjP3+9zYmypf7Uu7AcRCToPRtr4sKq7Rsuvox8kRODzqxbEN36u8rZEOf51?=
 =?us-ascii?Q?cymSNLKGaXMSeSQ/qlxxWDPsxZi84tr6/5kk2WLqOpsQMByPzHaImWZnIphj?=
 =?us-ascii?Q?EXCHGefJ5PsqSBGire+RpvwKepI/km/GeSu0Bk6rzQs5ourJ1INg/3+qTldZ?=
 =?us-ascii?Q?yyCcZvsyb3p9ANyG7B+7GTS97sHkWlsL1f9Am3BztEUIwIavqMnVmOSpqyH2?=
 =?us-ascii?Q?pvI9xd0zT3eNx9sDDGba7v16urOLonmkWucPs1djb7Q02TT8e7BEkruGHuGn?=
 =?us-ascii?Q?4LHNFCg/+fnqvW0jalFXpK6A/JXhXk0h9dc61TlBenBWCOBvNpsilHljmdP0?=
 =?us-ascii?Q?+HMi3mub0AvKnvY100cOaDPQ58uuOG2OcgqFvYn85zVTFi0cOO/sbJ0Q3Fol?=
 =?us-ascii?Q?0pB+xDMdA3+rwM2XYiLqygO+rEDvy1iwslBYBdXFHE2ZTpbNUyrmX3QirYAz?=
 =?us-ascii?Q?XOgIuclqy61IoPrCHEqprQjt5hYDAVRaZImN2lZG3fVd2QiGPD9Xpd9U5gTT?=
 =?us-ascii?Q?O1iY9a56n12LhU3nfogI8U0+KgqO6D5yK+11Q031aC94jFfLH8j3y7+YSfjJ?=
 =?us-ascii?Q?fixszKntKujEWzH/ZPfASkK2MkbJHHSqXpnMJFIxK0n2gTODC4EzvkcCVO/P?=
 =?us-ascii?Q?LNBerXSo88ZtrLvGulsp3uVRjnm1+tC/pZnhWvs3CPXr7KwFC+vjDkcnE55U?=
 =?us-ascii?Q?UYl6BA1YxZQghON47W/j3c2dqyj6uF1vzBYSigSYckByAS+ek+yd8Hceoknt?=
 =?us-ascii?Q?+7lQTC4/9kUzBXI1OZ4Fs9omsmbEsDY3LLYYHWGKGH7I1OjTOggX42lLvR2l?=
 =?us-ascii?Q?nTf1tNoeq5dyOIlxbCajuwekDFx0vwNTc9v+3QfE8IYDEHt0THREC84CD1Ji?=
 =?us-ascii?Q?I2i2pcLHtXO71QedeWwG3qadePOUjMMRPWMaB1ikSjs1PpWErHIHNhu3dCNL?=
 =?us-ascii?Q?rtRfh8kpMybichT7JmoVbUYiXvmSWModR97glKTnSf7L8uY/wuRHIK8YH4K8?=
 =?us-ascii?Q?zprE8+56rYVjcgWfiGjiBwOsKBHtmtgxhrgRuBAVYnILiNTaMVj2Rf9CWfgE?=
 =?us-ascii?Q?12XZ03Xlrpff58GhCUZ8GpZ1CO0+XVJupGNwZXo9EGMsBbWeRFp6+GdrSwK5?=
 =?us-ascii?Q?IjwFq7bkvsxlht3M5P91Z6TFi7SDm+5mwo0uXPrmiac8PIr94deH5CDthAY0?=
 =?us-ascii?Q?l1UXe8FYp8v/EPsFC6naDbVIaqxmLT5O0mX/QUY7wcaByGWXk4ibhw3ej7YQ?=
 =?us-ascii?Q?2aL04HBbX1gTnmLmYsRdcbh/gho+Sb0oKOvXVWcroQbDcKGNlbE76G1fhorW?=
 =?us-ascii?Q?PFU8wc3gHXDkAzNvqNGI1Rq03c8d51HCOrwQTJ6qT9bg2q2M7tKozQd0MOHp?=
 =?us-ascii?Q?MJDUKTDKtDxWvX09qXDLgHREsuYPq9OJBG3C3DHv3xEydw28p4XkDzQOiQ0i?=
 =?us-ascii?Q?SKDxSvdFaBJiKuF6yJhALJiMwmAp+lb171shXmRW5iwHyrq4rZQ9sJZdRJZ1?=
 =?us-ascii?Q?GYXtPmSECYS3QWWYWD8+nbg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 700a05c4-fb5a-4fed-0f05-08db6c6cf12d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 00:18:56.2712
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 X7aRpa8QcIEo5JHqbnz781yYoV/Y2erHaVOyT45prc6myn6DWBz6/gztL0AuIxJOG/2rMJUIZGlyS0N9CWrE82n1AGGFs8p9oKmRNWymxZaIttRDqnOq1WuO6FX1qJ0M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6276
Message-ID-Hash: 747O3NH75M4UDOUCKJJIG3HX75T3S5IL
X-Message-ID-Hash: 747O3NH75M4UDOUCKJJIG3HX75T3S5IL
X-MailFrom: kuninori.morimoto.gx@renesas.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/747O3NH75M4UDOUCKJJIG3HX75T3S5IL/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current snd_soc_of_get_dai_name() doesn't accept index
for #sound-dai-cells. It is not useful for user.
This patch adds it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc.h                       | 2 +-
 sound/soc/fsl/imx-card.c                  | 2 +-
 sound/soc/generic/simple-card.c           | 2 +-
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 2 +-
 sound/soc/qcom/common.c                   | 2 +-
 sound/soc/soc-core.c                      | 4 ++--
 6 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 943f0a1b2d27..b27f84580c5b 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -1319,7 +1319,7 @@ int snd_soc_get_dai_id(struct device_node *ep);
 int snd_soc_get_dai_name(const struct of_phandle_args *args,
 			 const char **dai_name);
 int snd_soc_of_get_dai_name(struct device_node *of_node,
-			    const char **dai_name);
+			    const char **dai_name, int index);
 int snd_soc_of_get_dai_link_codecs(struct device *dev,
 				   struct device_node *of_node,
 				   struct snd_soc_dai_link *dai_link);
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 78e2e3932ba5..6f3b1428a5ba 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -586,7 +586,7 @@ static int imx_card_parse_of(struct imx_card_data *data)
 		link->platforms->of_node = link->cpus->of_node;
 		link->id = args.args[0];
 
-		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
+		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name, 0);
 		if (ret) {
 			dev_err_probe(card->dev, ret,
 				      "%s: error getting cpu dai name\n", link->name);
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 6f044cc8357e..9e1047b46b68 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -89,7 +89,7 @@ static int asoc_simple_parse_dai(struct device_node *node,
 	 * 2) user need to rebind Sound Card everytime
 	 *    if he unbinded CPU or Codec.
 	 */
-	ret = snd_soc_of_get_dai_name(node, &dlc->dai_name);
+	ret = snd_soc_of_get_dai_name(node, &dlc->dai_name, 0);
 	if (ret < 0)
 		return ret;
 
diff --git a/sound/soc/mediatek/mt8173/mt8173-rt5650.c b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
index e05f2b0231fe..3ece4b5eaca2 100644
--- a/sound/soc/mediatek/mt8173/mt8173-rt5650.c
+++ b/sound/soc/mediatek/mt8173/mt8173-rt5650.c
@@ -288,7 +288,7 @@ static int mt8173_rt5650_dev_probe(struct platform_device *pdev)
 
 	np = of_get_child_by_name(pdev->dev.of_node, "codec-capture");
 	if (np) {
-		ret = snd_soc_of_get_dai_name(np, &codec_capture_dai);
+		ret = snd_soc_of_get_dai_name(np, &codec_capture_dai, 0);
 		of_node_put(np);
 		if (ret < 0) {
 			dev_err(&pdev->dev,
diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cab5a7937a57..d9ebb883b999 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -105,7 +105,7 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 		link->cpus->of_node = args.np;
 		link->id = args.args[0];
 
-		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name);
+		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name, 0);
 		if (ret) {
 			dev_err_probe(card->dev, ret,
 				      "%s: error getting cpu dai name\n", link->name);
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 8dba5bb26ffe..7b13b1b232ef 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3355,10 +3355,10 @@ int snd_soc_get_dai_name(const struct of_phandle_args *args,
 EXPORT_SYMBOL_GPL(snd_soc_get_dai_name);
 
 int snd_soc_of_get_dai_name(struct device_node *of_node,
-			    const char **dai_name)
+			    const char **dai_name, int index)
 {
 	struct snd_soc_dai_link_component dlc;
-	int ret = snd_soc_of_get_dlc(of_node, NULL, &dlc, 0);
+	int ret = snd_soc_of_get_dlc(of_node, NULL, &dlc, index);
 
 	if (ret == 0)
 		*dai_name = dlc.dai_name;
-- 
2.25.1

