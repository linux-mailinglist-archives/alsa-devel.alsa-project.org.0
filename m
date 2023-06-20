Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCB4736065
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jun 2023 02:05:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C22B950;
	Tue, 20 Jun 2023 02:05:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C22B950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1687219553;
	bh=GcBHaS25lGEJfkAavE7htpIoNLv94JyV+AORIOtE0tc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UQbArSA1PTicOZQum57kxKcuUfvao3kbe86l8PXBwG4BwjL1/jpS4X2Q+9xJOcRex
	 /e/UfiqqtxJX44obyqkcKCSDgZHG9xjMrKw8w+inCN2csofqz7vIjhv1/5B7KyUiDn
	 SNlTSr9bBFYNMXD4VTfkyNzxGEZSy6cedcV5cZw4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FD00F80580; Tue, 20 Jun 2023 02:04:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 444DFF8057C;
	Tue, 20 Jun 2023 02:04:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9BD7DF8057D; Tue, 20 Jun 2023 02:04:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20702.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::702])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF0A4F80124
	for <alsa-devel@alsa-project.org>; Tue, 20 Jun 2023 02:04:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF0A4F80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=khKTBZRN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E6h3s2lB+qU03mEAiRC5vXn1MD3szZ9QJ2wURkd8RYrHUPaSYpDLncogVN77norQr74vDVB7SkwIEC2QD+p0mnE/jLnIXR9WFFCGXp3l9r0qWX7On2BItzmiLIwBmEPKsSfR9Xw4+s/lZGt4BAi2WNDqEQhslVV4CsHldBs/7kObhnrCIFi2J/Q1bNWZG3pyrrhVkxqDxlY9+OxBJCZt2si+X2UqYQtmxTP5+NbqTF1VMx4262TaMfo8Al9akwS9n+n8m7oph2lpQMwsAtNoAJXhAiTG5oB0wSDub6nhDnsryh8EUHgXFHbJUEcI0Hznfc5dM4aB1iklLktXz0yWww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P1coBhtUtGNyDCCRinhxlR6QNCLtYO0UYbRExXSwh+w=;
 b=LFHk1HpykbUtzNifphTj3oE0rzDNVfuszWJOVoeHSinsgvPlgu8FuHs2WS9H4H/a6MG8VDALN6TAAkwInDP2mgCU91z4iiblrDFsrpiaZ0256uW58TSR8Hpz3EQxliLF2QLWAf5XjDbsuHyKaqmPO3e6Cql0PsBV3QKg8WQf/Pq5GzXiKDz9E1yP/Iktp0A1R6VdbNtaLIHXeTXUgkXoGLANG0XZF4kCcnMFVDQ+Dzu0GaIz8pUhMbJSr6JkqPg/zpRjvs40CPiCNyF/1/9ZOAs/LzX+4YT8hVSgg8cruTXpZJZGuB8vsP8HTuOzZfqMPnrlV/JbOSIFGk4zcBDMeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P1coBhtUtGNyDCCRinhxlR6QNCLtYO0UYbRExXSwh+w=;
 b=khKTBZRNeAS13rdakedvEKuiSz7Tv+kmC1TcHgmdoGE94Azcg4dCdPZRttXHTlZheel3KOYKP7mBM07tZsaGG7HbdfoJxuUWVih4SO36+XwRep9N+V0H8zCOJ7WkLGZjzF15sRwdZgo7UTNtyedUr/yx9DHLTxE0WYw0fS56vcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10425.jpnprd01.prod.outlook.com (2603:1096:400:24d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 00:04:33 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3ac7:b366:51f:3e26%6]) with mapi id 15.20.6500.029; Tue, 20 Jun 2023
 00:04:33 +0000
Message-ID: <878rcfdmnj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, alsa-devel@alsa-project.org
Subject: [PATCH v2 3/9] ASoC: fsl: use snd_soc_{of_}get_dlc()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz1rdmp0.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 20 Jun 2023 00:04:32 +0000
X-ClientProxiedBy: TY2PR0101CA0018.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::30) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10425:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fe5c413-0887-4efc-c2ee-08db7121ed2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	nq0KBICqRwUwqQhIBGLxwSan2GWvVQnnvDWRioGhwvxtxZCDvFgdWSlJngHrHHeiVHLSPDI6X7K/RMRxuBRcjm0C1cDujJs79SWYojvVys8OtV12xsLkRI0oi2asayO9tNKWrPUh2Le6MTNoCFHMYmmVt9oVjVEXbaLUF3KvlFo42iAJSrC755IjRoyeXsenepvvfP9dfoL0J/TKvD2OKVcEFrTcPun5blD6s6u6t8tQWpAFtejGCou3y4VGrdxly+oqNkSzkqwoXzwW4bGreo0v7mfsnccAv5lAsdPhpmhemVfBC4l4dan2auMga7MRlVstCG1rmr7AwwDVr4EOId76pWlSXePUbRIx7TV/54Q3lx7ZwrpZonpI23xufHFqTtzPUF/vHy9psSwj6y8u5qC+sR/DX8Q61BjxwdtxgcO8o2vacShRVg+MOdbd9e0+QSxRxaPcG+PRVsiWu8VqQbjeTPFgPM1qJ9gdR8h6P+oY3U49IjXTRPrsyqtzedAw7C9k1taWD2mVJ+U6b001ssrgFj/GB8FMpsUMdM2CUq4+4W1IuEIWcLH6OkVAaT5cQ8rt8j8cSe/zDKAMsG8aoDhpWGuUCbhK6IERUbTry0rzXWtr5QfCU+0OGwPbuvwU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(8676002)(8936002)(38350700002)(38100700002)(5660300002)(26005)(6506007)(6512007)(186003)(6486002)(52116002)(86362001)(2616005)(83380400001)(478600001)(54906003)(110136005)(316002)(41300700001)(36756003)(4326008)(66476007)(66556008)(66946007)(2906002)(7416002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y/DhKFXl2NEFUXZ7ohJmdef4hMRM7hX0Wt1vZSlKDdwFS+qwIVcwqL0u6Mf9?=
 =?us-ascii?Q?EgKI/JuttSMziqKtQnXcDVoIDR34TgiH0xa9/Yw3fGLmNRK7lMSvTjzObjgq?=
 =?us-ascii?Q?rD8g9ouH78WDttZWiMXTRv6DXvffYdRz9j2LS0gylcCRrmAuecpLwxvcyq4b?=
 =?us-ascii?Q?LsLnoxgrPdH0vqmHAB2YJobvbZEujjCCiIDn+wzzuDvtB7IW1HvPBKbSJOsw?=
 =?us-ascii?Q?LYFuNpunIXo9I3p1XNGYuoIO16P6tVCdLK7oKNLzFiRZa7fsjEvRCSmdH0ZZ?=
 =?us-ascii?Q?3NaHAUZ/bCrUcNTMTDB9i8xNyDr8iW6M32rjpo5x/JDdUO6oxPSaTlZY5p+H?=
 =?us-ascii?Q?2OIRN8UX2cbPom0zY5DAeY1q2IKv6TFxcH0twZS1TUI+MMCZnxtg0YOf1lgj?=
 =?us-ascii?Q?egTgCKD+RrNEG9gH3lpyqJk4EhBKWCprrr3vK8ee6x+LRHLlHijDCfW2gJfJ?=
 =?us-ascii?Q?2N/BIoEhue1v5zRpeB6ZCvIzTctjLVvr1jKBbuOdcs1i3dXEp53aXo18jgaY?=
 =?us-ascii?Q?i9DOyLLzxp2ryojmxcovEywG7fTM1F1sE+WKXEEIgeUPiaHB4jMLzqQjBWw6?=
 =?us-ascii?Q?OCCV/YjxtMHyqD5UFWjT+2G+WD6W3mkJPuHn7PokMwb1k2ITaMFB0+vI77P7?=
 =?us-ascii?Q?tbF48AyZpZVC/A12BJgE3cbleHI1Ta3622mTGFeSgqk3ongP6TwjVNXy79Sp?=
 =?us-ascii?Q?XRyMSacoILUomnyjryNtMqyVRt9zzv3x9yeyQyJUDN0ldbiioTogGyq3eNIh?=
 =?us-ascii?Q?G3eaNg/n8lsjD9qANu/DRxziONowlkBpvpkmKx83w1aZzP1vtWBK4tLA0V4Y?=
 =?us-ascii?Q?yO+HtzCK8+kdpYmo0KsxpUw6U0rMXSrS+lfVkCpYZkqsOfLXl3MzJMjdhSGR?=
 =?us-ascii?Q?h5DLrlwexUqE1CilcvtmvSC27upr1E2gCbAW+YfRlsKJ/D3V43HMbiTWCr4p?=
 =?us-ascii?Q?O+Ux/OpNG9ITBpEyUiAd+95+qsPKicsGZIeOqts/VS/l8o611SsHuUS+YF+c?=
 =?us-ascii?Q?Usld1HrytJgpnElU5Rm55FTCa63cgOfG3G1YOy0b/d7en+gTw+HUZQ1Xdblc?=
 =?us-ascii?Q?J+fGUOj4jh3fwGPrk/ums0uyvfmqr9IFewWdDFMq0slp88Fl6hzSAkc69r9c?=
 =?us-ascii?Q?0zOFFGGWAbvBKG/Z3MITPRsASU+JHPrthspQmRHx7UXbh0izdq54GFwzbwxM?=
 =?us-ascii?Q?pUYhfRtwUFFBGv1QXRIiqV8ae/q91KqP+o+LeyTn9pWe7n5DPwaoO9k5A+9f?=
 =?us-ascii?Q?2rl7GL6r9rGa2c4PS+R3ERlzL/MV0h3DIBjzGjF8NYt9PSNRMlzxVaLLSLvo?=
 =?us-ascii?Q?rDWxukIr8uXbMOezHuUIL9ZySF3Aa+cUZw1LVkacyjjrZ24Ombhe7rO1M3eq?=
 =?us-ascii?Q?4auyRWIN6Ug5P0oVrxQgmU1349BEezwyVVM/w0uRjLPnzUuxGdaMSWfKNcFW?=
 =?us-ascii?Q?nr9VYQxVJwKX7mDFuTTrMyBWTSgheeDyJUPaSs724uC5sXlajJV9PlV4Wr1A?=
 =?us-ascii?Q?KssUllM7zL/J6sI8fCd3e7vlEXj+KW3wAjRv/PNLh8+SMD4ISmvQpYhlyzoj?=
 =?us-ascii?Q?y64Ry/tBAEFuRQdJ6xPmgxICl54V28N2NsHWy65dcd9je1W60lrgG3pjSUTT?=
 =?us-ascii?Q?kqTrdrceU9BX2CpvVhvbdqU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 2fe5c413-0887-4efc-c2ee-08db7121ed2c
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 00:04:33.7900
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ZkFN0b/SZjbTsb89qr+XOE6vziXNZfWWauqjiQXujc8xcmAurj0GBLR8p2emx+xEqBEB7VvSD/zwhIUyB6vVEO7cFNpibo4xX1egxYYFtNzgjA1dAgb0iuJ5z7DJPNjT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10425
Message-ID-Hash: HHV3QJ5742FVP3NKKFDZEGGRT37BSLNL
X-Message-ID-Hash: HHV3QJ5742FVP3NKKFDZEGGRT37BSLNL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HHV3QJ5742FVP3NKKFDZEGGRT37BSLNL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC has snd_soc_{of_}get_dai_name() to get DAI name
for dlc (snd_soc_dai_link_component).
But we now can use snd_soc_{of_}get_dlc() for it. Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/imx-card.c  | 14 +++-----------
 sound/soc/fsl/imx-rpmsg.c |  3 +--
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 6f3b1428a5ba..356a0bc3b126 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -551,10 +551,10 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			goto err;
 		}
 
-		ret = of_parse_phandle_with_args(cpu, "sound-dai",
-						 "#sound-dai-cells", 0, &args);
+		ret = snd_soc_of_get_dlc(cpu, &args, link->cpus, 0);
 		if (ret) {
-			dev_err(card->dev, "%s: error getting cpu phandle\n", link->name);
+			dev_err_probe(card->dev, ret,
+				      "%s: error getting cpu dai info\n", link->name);
 			goto err;
 		}
 
@@ -582,17 +582,9 @@ static int imx_card_parse_of(struct imx_card_data *data)
 			}
 		}
 
-		link->cpus->of_node = args.np;
 		link->platforms->of_node = link->cpus->of_node;
 		link->id = args.args[0];
 
-		ret = snd_soc_of_get_dai_name(cpu, &link->cpus->dai_name, 0);
-		if (ret) {
-			dev_err_probe(card->dev, ret,
-				      "%s: error getting cpu dai name\n", link->name);
-			goto err;
-		}
-
 		codec = of_get_child_by_name(np, "codec");
 		if (codec) {
 			ret = snd_soc_of_get_dai_link_codecs(dev, codec, link);
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 93fc976e98dc..3c7b95db2eac 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -96,8 +96,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	} else {
 		struct clk *clk;
 
-		data->dai.codecs->of_node = args.np;
-		ret = snd_soc_get_dai_name(&args, &data->dai.codecs->dai_name);
+		ret = snd_soc_get_dlc(&args, data->dai.codecs);
 		if (ret) {
 			dev_err(&pdev->dev, "Unable to get codec_dai_name\n");
 			goto fail;
-- 
2.25.1

