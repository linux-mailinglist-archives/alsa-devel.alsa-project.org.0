Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F29C73616D
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 04:16:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 538B182B;
	Tue, 20 Jun 2023 04:15:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 538B182B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687227383;
	bh=2kpoU4/I8pyK+lknAm1k6eIZCMusikn8izPEo+u/KwU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Box3kr7XLGchHifFlmRom5zOflvQOqjxgrGcWYdBjCcXDnPg3SYnp25+b2ODYGztM
	 3gIvRUdcHGEDNWu/xKbxhG9/vz2hnEOVCGc7rc2zjQPUyO2p9E/l9c30QXmBHvyiYn
	 qL/hoQ8Q8lnG/3xlUA7v8DbJaVH2TcoIeDUZL7tI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B565BF80579; Tue, 20 Jun 2023 04:14:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CC2C5F80564;
	Tue, 20 Jun 2023 04:14:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3B706F80130; Tue, 20 Jun 2023 04:14:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4BE76F80130
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 04:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4BE76F80130
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=lzGFbuNA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkUtCcSKZ1NuhqqXcMtcyvbSsKYPajU9l3s9SSGrSJ0ICECQVaIpZDh/ML/ilWkh63p9SXTN0eDNhYFDNNhMGPwZvx28pkHgzg18INUuzRZmjiCBjuS2nmaN/Zyi12ZebAdegedS4MlsB9QnWnu3cTtTchG8XHTbgbbPaAcyYYINLu6/msQLyKfrAuOsgEIAYXDbIcWLldwXoyhzMGPqZkXab3sITIXJGstfBdvtQ0T/uBuODRJwOSfqYE0kc/JLlG0+cFhj3ldJmHn4CnyLfHLBod0asi/eOaZbAIkC3ZLXC2D1uLKA45PGDMAnjTDCGCksu94mBO5LYzNHhFFBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QoKuww/FI12vUeevXzjstCGoNGuZ6j8MvO42Bd9aZNQ=;
 b=aQHUU3k/c/lbd3kydBIHrgbKfMJynI2D8y1CdMqYzru84i38kfyfIWM3eImONsUdCLF9Q4vQlC8P8X7JNNsSTaQ+WPyjM1SDwXZpWMx7aku1QQG3bF1RVR/CcBTO2aD5OGyYJBSlYrDy9yfOZwAejY1WaSl9MXUUOb5YUNmpbPq3l1Gh+3x2uIFCInkK4M1mnlfZ+eX8mtgxoNZWe/LdBNkUDqZ268tnq8AUlHrssVuylx1cHdJBY2rCpxZmq9AbFDypRjcjXPH628KFFOTnwsm/cg2igyls4UtwekU7Jia+zjYBWQduRNY2ffJSx1xB7Xig4IpeA5tOZVPfvlFHxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QoKuww/FI12vUeevXzjstCGoNGuZ6j8MvO42Bd9aZNQ=;
 b=lzGFbuNAG5jr0gLeLQ45rqWVJmh1x8ixB0E9kMCKTu7lLwq6/wZUl+AtNFueftrpzDyFfhoGFNYGFsBM0SkZD6JJhARyyGucd1QLMgpPW84pUV4qFGN9w/iWssJwrEedea99l6nFvzPb9EeXsKqe8TAHo9n2yFvmzvp0pCDrXv8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5665.jpnprd01.prod.outlook.com (2603:1096:604:b3::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 02:14:12 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 02:14:12 +0000
Message-ID: <87pm5qdgng.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>, Takashi Iwai <tiwai@suse.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Yingkun Meng <mengyingkun@loongson.cn>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
Subject: [PATCH v3 2/9] ASoC: soc-core.c: add index on
 snd_soc_of_get_dai_name()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfamdgo1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 02:14:11 +0000
X-ClientProxiedBy: TYCPR01CA0093.jpnprd01.prod.outlook.com
 (2603:1096:405:3::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: eda5efbe-84b9-41e5-d3c8-08db713409fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	37E8DtO+fLfmZUH6ucU7HSPk00dwFNZxn3kaUIxB4jHKMSCzdxMT2VE5nwgDbVHr6B8v+i+fkbsEWINJXVK/nig57Ri3epsT14UOpid+JGJsRPHp0inTrSLvPgoL+Xn1i8AKZFdow8bfkxsNAfmeYaWubhQrfn8zgTCJRIhEhFkHyv2WG69jTIjgpCcoqDnjpopZ2kos6E9s1OMMUvqUs3WuzRBen/uHcAOn/9Rzjenn1QnQYQa3/xWTmuURWZWJc4uLdo9fux9qB9wIWi+fh9J76Xd4oanD+fr/DfyiXYQdG/9BNo0U26gsp63OpW1fbYDyH5JvPo9/Mv0v0HRL5gAFkPMsRYj5nAnNj99IB583z1/CjqAmTtDrIkoFUEpJqeinCYxi36rlbNvV9hLlxshAG2i0hSmTDWv8dbXpt5aUf43+FzWVxu6EAhji4Ucravs/dP1fCrLdoKNqO3zNaVtlfKam5Aj99xoRndLGtWldwcQne1S3bbOb9LAKlg4u6zyu0xeei7NYlyyG4SVH64GrTwvqu8i4LNK9EWIfgKnD2kjMNIa8nkR/1ZQtT4dsLFrZ7ww9JG9ukXms+WHwxXR788wDtikDy5RDauI+AIg6KPLOe1EIyo3Y6LQ+r0pcbTyWGHjYiKkyLR8/hUf11Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(376002)(346002)(366004)(396003)(451199021)(2906002)(7416002)(5660300002)(8936002)(8676002)(36756003)(41300700001)(86362001)(478600001)(26005)(6506007)(6512007)(186003)(110136005)(54906003)(52116002)(6486002)(66946007)(66556008)(66476007)(921005)(4326008)(316002)(38100700002)(38350700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DLe04YSASZJ6Kc+uXu62Kh1b3Q3Hi3diU8wQYmZD1GCdLuJLjl71rJ4eXeT6?=
 =?us-ascii?Q?8naGS3pqlvDs7ZNkzTqz/AAkZOz+XmyZhddrr2/vDFfP3JYLh1nCKpZT5Zlm?=
 =?us-ascii?Q?+50/e+lOvaL5UiyYMQ4NXxSWVdg7MGQwAd/4HDaLk8DPoN1zXuZxpZ/5pxb/?=
 =?us-ascii?Q?iQ8WMqi/M1wVDW8OMkXygL8d4iwzSDysw/yfqI3jtoLzS7dGCe7QG+Dg0p6p?=
 =?us-ascii?Q?QISSJqmVAhb3U4Q4vdroN/sUvtHfHAyG2qnaPGsbJYC4G4RZN8cVBuGFrqKS?=
 =?us-ascii?Q?mLNEEEMBCJG2ixwqzUd/yxjK7poCFmnDEQ1FQ89f50aow1qQKT2nf/rgRapd?=
 =?us-ascii?Q?/7A3+q+AzFYN6QDmODWCM5nBgDALgrcm6xvN7eWIgfAman1XkkZ2tJw9i7z2?=
 =?us-ascii?Q?5gNmiHNhh77Oufov1j80gMxqn40M1toL8FN/tzZx1TTKjfrF82U2Jj/QUDAG?=
 =?us-ascii?Q?xqZO7fFH6iBGe3HyqdcVmmAKGXsHi3mLoLfg6AMm/NZP/afFklNn19XhLYfl?=
 =?us-ascii?Q?eJlq6P4IYSP9FKNsLMxUvvNCpmd1rhLDjmik29d739LR5grgi8vQ2UEJl4rf?=
 =?us-ascii?Q?LLQAdzapw8vu6h91F6KX6h3Fr81rbyHjv2W8cTQuKzULXVFwaYgcjX90Bl8n?=
 =?us-ascii?Q?gU4Y4qLSBSfIo3z0sO+nTyRY4mhIY+oTILvXbqa/zlLykGgbB/H0YCiTCByt?=
 =?us-ascii?Q?zqdHSMcoyQSiHUUwmS5sK5YfcGPMySwtdBiSZPoypu68oaHwmzeWSnAepKvr?=
 =?us-ascii?Q?TcRJXM2aZwpmDAuWfn6NtXsHQZtrpM3OSVxoRyVHzzi4wT/G/KmuRpId5xVv?=
 =?us-ascii?Q?2JmJUGOUQJ/Rebh1tdFUc2cROV3MLEG8aOa9Us76kx2fjDdfGM8i7G2wiseE?=
 =?us-ascii?Q?sXm32+J7gym6ngN8LAp4eB0eoCG7+cWpN1cjLSsWbFE2gmFHGqdlOwTKNgdH?=
 =?us-ascii?Q?/7gGsY0SZFOn/rksz/S3qt0zNtttT7uXjAc81gSmQk3Vj5AP/DZYuDlSEa/6?=
 =?us-ascii?Q?+VXgumQp30YtQZHDW/N1M/zLEyhHCp1O48hrzQxLheLfXyWNYebe0/EV6nrv?=
 =?us-ascii?Q?2ZkYyabpxYHnSxkBH+2pQSDeBpdYnm7g+R0e0UeECnfzFsbWPS8K3XXOSlZF?=
 =?us-ascii?Q?VVl8pabu6Gbc2Rz04Db/kGZDNvI2zKXdCliaPU/Bka2cTAYQMww+Ow8h2iuG?=
 =?us-ascii?Q?NB5+Ac2J7AS/Rz3Cu4W7WQpVvS2Sd5AvAiVYI2Ge/b5aFaAlyuvokibF0ZLN?=
 =?us-ascii?Q?X1amD90E6GuQFMZH2Sd5t373KgBPI3LML/zyG6PPArVBnMZdxcpOkcJ84HPI?=
 =?us-ascii?Q?2kIvOIM9qrdTYO14zU8oqfxfkiHwpJxGB7Lzn3pxEKESR5jbUgtpFblu+aOo?=
 =?us-ascii?Q?/ND0Zq5+kukCLQYlocBftMIq9whbNmTgCJQqN0UtbxWaT+Od6efzDbhO9664?=
 =?us-ascii?Q?ETeW9KrAa4NJX2MZuUFESJRBMEWCi/kgMLYzWJUywtYdAopv03Sinm8+bczM?=
 =?us-ascii?Q?huvbyYKQeufBNOeiL14ZZK/BbvChDsKbFFS28bJUe9Ja8q0NYbV6tBXqRlDn?=
 =?us-ascii?Q?h19FOU88OF4qgZC0NqqVkM7JuUq7YMZg0GSEKKJbG+mtVppRjfQchL8VuApD?=
 =?us-ascii?Q?UCrn0CvGnG7HYDf9tAAlucY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 eda5efbe-84b9-41e5-d3c8-08db713409fa
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 02:14:12.8775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mcDTR3uBH2Rp/N9QDQXiAXftz10kYPTUi9kKUFjGiktq2Ez/wvezdH5jT99IvHGEcbzP2Nw0RXEgl4j4/4GQWvOGTlwsv5JneB68A+tekIEDPzM7OFYpE9Ma5Vnw+as7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5665
Message-ID-Hash: P3OKFKDTN2GXJAB3KFJGYUZ6E5XTQ35B
X-Message-ID-Hash: P3OKFKDTN2GXJAB3KFJGYUZ6E5XTQ35B
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3OKFKDTN2GXJAB3KFJGYUZ6E5XTQ35B/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
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
 sound/soc/loongson/loongson_card.c        | 4 ++--
 sound/soc/mediatek/mt8173/mt8173-rt5650.c | 2 +-
 sound/soc/qcom/common.c                   | 2 +-
 sound/soc/soc-core.c                      | 4 ++--
 7 files changed, 9 insertions(+), 9 deletions(-)

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
index 5a5e4ecd0f61..5b59198a0384 100644
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
 
diff --git a/sound/soc/loongson/loongson_card.c b/sound/soc/loongson/loongson_card.c
index 08df05cb4328..94f02b787c98 100644
--- a/sound/soc/loongson/loongson_card.c
+++ b/sound/soc/loongson/loongson_card.c
@@ -151,8 +151,8 @@ static int loongson_card_parse_of(struct loongson_card_data *data)
 	for (i = 0; i < card->num_links; i++)
 		loongson_dai_links[i].codecs->of_node = args.np;
 
-	snd_soc_of_get_dai_name(cpu, &cpu_dai_name);
-	snd_soc_of_get_dai_name(codec, &codec_dai_name);
+	snd_soc_of_get_dai_name(cpu, &cpu_dai_name, 0);
+	snd_soc_of_get_dai_name(codec, &codec_dai_name, 0);
 	for (i = 0; i < card->num_links; i++) {
 		loongson_dai_links[i].cpus->dai_name = cpu_dai_name;
 		loongson_dai_links[i].codecs->dai_name = codec_dai_name;
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

