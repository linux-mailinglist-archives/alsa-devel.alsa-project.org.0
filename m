Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 370715B86D0
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Sep 2022 12:55:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C61CF18BC;
	Wed, 14 Sep 2022 12:55:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C61CF18BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1663152956;
	bh=vmOV1UZ/E/jX5vU8FUsXTZ3pru3DqVnzfvc5/CU6s/M=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n090MfLIZgfGUisSPrCXg99DiCNI65lCknWQGpFsBiholwglkE0SXvbHSM6l9fUrz
	 AZIZaYoiAAobzl/I7C2WizPj4faJ8mO5EZL+DiGU2rPBPFhNnxx1fvPYCgSHafGFC9
	 2tn1hnS3Ju+dtVYVU9EEGuuI0cZuXftEuAlYrXeI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DD346F8008E;
	Wed, 14 Sep 2022 12:53:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 05411F80571; Wed, 14 Sep 2022 12:53:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60087.outbound.protection.outlook.com [40.107.6.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BCA9EF8055C
 for <alsa-devel@alsa-project.org>; Wed, 14 Sep 2022 12:53:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BCA9EF8055C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com
 header.b="D38spTBD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbP2TnQP0iXsWtBXyLEGwfQ1IjXGT1gy8clyd/p7chMMEHHuVgHK1N2m5NldOe/tOPs8eo1dPRA+orUWi61v26PFuy2SLUxNywW1Rpl9bPKAqTqsk8L+9iwVSpDgA0MZh7GrV2FTBbhDSFkpeOWfQlfFBZ3WKGzxZ87XNktt8EuccKWHzaxJtQ1SXhoBRAvwDIq08Lsrydpo9lCzshUhrVEpT0xPtZcC+Yy8tmSdi49dVFzc2G0ta4H462WO0H7WwE6QGQ/xkwjJPPWNwaBWkzkTeq4tTqrIdB6URi4YStH/c2HBYjc/60RJRKETJJ/JtTMXwT3U0xUF0eB0ae6zqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxTQ7IVzde13UUXchPar1dvJ+XllS83LF43FxapAL3E=;
 b=fuZnNzNalix4Ij4FSEWgnThxQt8DKwtEP0RCJZj59cM0RCRnISA6kF1WLn7P2VINxB6lTzTDsG6e/Bn5GHElna8bfQdwoOcFPZVEvzqip/3x7xTr0tQnoOO/+Sz4+yf1fWaYr4D5DFolZ/OoiFO/BJ4vOfQv4qFneXfAFg2ctddMFID8qQ/Iiq3Ia/R+fiN8NnzW5ZjXjUQfD4Qvp1vvhr/P050jIFEcqrwF0Jd9hZRcuIQOB/zvqQcwA0hIXJFpIb/9zcIaeFSHft2KqKkVjkgBoV74vMNZYVj+tiavo3catumxz1tMNfuuirZ35ErRAX8POZn/UouW1tiPUDE69w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxTQ7IVzde13UUXchPar1dvJ+XllS83LF43FxapAL3E=;
 b=D38spTBDRR796QMIzkyiS4w9EQsB4j/uYAPhz0UFbAiaCtU44I/uhMhsqvJq7loH7fZoy/BtTBi3sJEFIYP+g0Z96DCkDtHy9r6e6zF4kiKZDHYFBqV2su+EONZitBvOSTFy9k3QSYRl+jdnpRHTUIgRR3WDdXAMlBLNjsi+Y3c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 10:53:11 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:53:11 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, devicetree@vger.kernel.org,
 krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@gmail.com,
 shengjiu.wang@nxp.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 7/7] ASoC: imx-rpmsg: Assign platform driver used by
 machine driver to link with
Date: Wed, 14 Sep 2022 18:51:45 +0800
Message-Id: <20220914105145.2543646-8-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914105145.2543646-1-chancel.liu@nxp.com>
References: <20220914105145.2543646-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|PA4PR04MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: 91ac7b32-99c2-4332-f937-08da963f50de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tJtzV7k7ktrr69yrqu9xHZ2hqNq28+hO/D21roToFEcA/NpsTi3l4HKM4TROk6IoTF/Fg7/enFre3/49VazrzkgxXvn9eibcb6NFwklBCga8g4vqUUPXQTWS2YNoMMUbtz1LCQMj86UUq7zbur4LdAPrpHZQKX3ou113juqpfCaHuVjJH11DryfaDHMKY3xzxW1lCC37OERLIVzY4n7Zc+rNKvJ/Ebpntx2CBAZNdm5qpoqvnSOcVseFOeLxetiYqd8mbKcObZ4ljNKkte3tPlnFJubEsO9VUkTn2G8/oLGqsAOrx4YTw8M8JQv/eVYFznDsHHBvdQeHANhoq4c0JmaNbE1yQSL+ojSaiVtLAo5JtKOhmqUpZqS0W1n5pvh3D4Axr1DIMH0/B1aj9aWIuCzc6t/7+CUFlUOJtJ1VYoSL02eMhFDiHhSPfB0rma6TEQ+/AZA1emlsODAKEeCigb2lvwku1SfEDxrAZ6iK3Tpa4U0MGQuwdLR9DlvqC7g7zibe26iFDe0h4IvRy4N1dVFxvRI2VbjREXvJ4K9zNhTQH0yXXzV7ea1BfvEPEt0aE5Sket+jzkPpq1vom7Jx1VmGT8532c292VFmfnpYlTr5RJ+tDD3ES8OVLOaguR9iR0sGcqtAse6rbb5ndvvtNIGnITEkU0gPCuw1HqmT/6kuUFGC4IvM0/KgiRy0QM9/LrDm9vWmj4f9Ts0Hf826vh1K8guzVg7S+biPFGMTqPCEQYcGIQFv1xA3fosLg3iswpeM4BRQOJrq8IAOTANbFIY+UUKJSWkz9sluasO+FyA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB4222.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(36756003)(66946007)(921005)(316002)(2616005)(6666004)(1076003)(8676002)(2906002)(186003)(52116002)(26005)(478600001)(83380400001)(86362001)(38350700002)(41300700001)(38100700002)(6512007)(7416002)(6506007)(44832011)(66556008)(66476007)(6486002)(5660300002)(4326008)(8936002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0H//9kjscboxctIrq6Ln6iD7iFBf9yo6VhK0VyEw3ua6ByvTDbRCJ3bnBlbU?=
 =?us-ascii?Q?OnBJl5yLm69zMdJbuLYFud9oJay77xFDYXSQyA31fB5gfqtoQfZt+vm5TjDv?=
 =?us-ascii?Q?CHUWPMB23mMCDV5xY18tC598lCr0sLszQNbV/Nyg9aoSUznXk3CMxFONkt5O?=
 =?us-ascii?Q?zHfhtvqV0vl81RGiD0EtsovEdqIwzBL87l6mklGIbJLOtzSJG9MDh5exppXY?=
 =?us-ascii?Q?Y8ngtXr1omEMmKIgwk5RqQ590Qiufihte84uFd3YEHTgMP1luhK0GYd1cnTG?=
 =?us-ascii?Q?my4XVZA66G/twgDxX3fdDbaZygrpCWknIiRaTdcUVw1T2fNVwdSZwJ+wrWnI?=
 =?us-ascii?Q?LugSBjQgpfyxqikaYw5W3x4Cp0JneOIh6WlTgoxfohvdisStia7ZN7hAMBro?=
 =?us-ascii?Q?UyJy06ejfMOaRwr3IRqchnbG3iAO+8nF+4HRyJN149MscFBHGtWAo+NLkpmz?=
 =?us-ascii?Q?hJFYQcuxDoGD5VlEoIAiGBP5fkj/EnJkpCX8Uuzvq6jaNYTCALKPuZ35A5Og?=
 =?us-ascii?Q?UTTsKsdAPxJVaONhzx1aXNKc2QlmELCDzmNS2VtgECqc6Ah3URnPnyH5J8zV?=
 =?us-ascii?Q?6vc1oxsU1+8LXGamAFENFOz1ZBAdA0mIBMW9HR3thHVKaYmc/ILVCbb23/iz?=
 =?us-ascii?Q?cHegmT++zxWwbdVCUP4470axZ5XRByyNEzxOO2dC+LkUP8pMos+8sZdEO5Fa?=
 =?us-ascii?Q?HqXcm3B/0kmiqtMui2r19tpTTFlpMxs+bUSS7e6Ofl/f2B7ZATGwhv/IJbDn?=
 =?us-ascii?Q?nlep2tEggSyFmpElB1SzQDgk+6CEaO2OpodiTmO2PANhJhxK47cpkGh5HzMi?=
 =?us-ascii?Q?i0kU2jJ2/nzQaPM0IYeYqCyNPucvMrcTjgEZBGNj9c95ae9RsI3HSxfOUAmW?=
 =?us-ascii?Q?+ElDPhd+Rszq4NwUjymrJVWHtJDXWceGGEnbjYOSmqb9DbKukdyTUuJqbpRD?=
 =?us-ascii?Q?89LFJUUmp58efn4o5MeYPwC9fzG2YufZZ9DNKz5Gtr1N1/ibVM22p5CtN3Om?=
 =?us-ascii?Q?Uzt+atqaxDy4xLOVId+be/vPLaqKeyfE6R87+w4iTkTdHMT7f8Py53blbkjA?=
 =?us-ascii?Q?b7ayvV6uY78BZPD9n1tg3g+8t4oW4j/OIPG0qvL5QOk8aUmEtILYofDFaeLL?=
 =?us-ascii?Q?Rssw1OaM0DFmjZhDsj810zJ6JN4k+t9dJMOwRI4wEi0WmW3diGvFoaVmBOb2?=
 =?us-ascii?Q?dc8xe476zg4o70u/Dp4vLDdYdbzzDRLd8NWJKF6Gd5F6p7w6g86Qo2hc0j8H?=
 =?us-ascii?Q?H+kEoT6UHkuO3MErxMWRzXuaIleXOT683VhuOAXtPBk84eoUCqPb7nLWsGY1?=
 =?us-ascii?Q?2irbXBnVWKA1rMDdcOEaHpV/25+unjKnD6EokGGQMLcHhCvBVrzd2GEAKkGv?=
 =?us-ascii?Q?aR0MdaubcgkHlPFgBt1WcVsqX5QehBhRFAcTiQ3KadynzLq01PAVqREvdSfG?=
 =?us-ascii?Q?TWlYDr+aJBszIl0/Qjsk+2xMKr5t9zPd3np+m4Iphvbpyx/p2Qga343dBsiq?=
 =?us-ascii?Q?RwBsAM3JscK1HvTYpDom10zHMbGkSLB84/aUyFugvJC+AkvpdI9CGlqGk/pK?=
 =?us-ascii?Q?NpBBO0JKN4ECZH4zbJfUxZpZFDI61ZzhoQKFq9xg?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91ac7b32-99c2-4332-f937-08da963f50de
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 10:53:11.3679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Di8Mif1hC/yZVl0kpWRqUvV7CKCkQ63HHhOFQVKt1CBdncXaivyWfduWY2iaAjSyn7CHn+4YUyxB3qMZSSziYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773
Cc: Chancel Liu <chancel.liu@nxp.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Each ASoC platform driver is named by rpmsg channel. ASoC machine
driver can parse "fsl,rpmsg-channel-name" property to figure out which
ASoC platform driver it should link with.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 2e117311e582..57684064c9da 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -36,6 +36,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	struct platform_device *rpmsg_pdev = to_platform_device(dev);
 	struct device_node *np = rpmsg_pdev->dev.of_node;
 	struct of_phandle_args args;
+	const char *platform_name;
 	struct imx_rpmsg *data;
 	int ret = 0;
 
@@ -81,7 +82,10 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	}
 
 	data->dai.cpus->dai_name = dev_name(&rpmsg_pdev->dev);
-	data->dai.platforms->name = IMX_PCM_DRV_NAME;
+	if (!of_property_read_string(np, "fsl,rpmsg-channel-name", &platform_name))
+		data->dai.platforms->name = platform_name;
+	else
+		data->dai.platforms->name = "rpmsg-audio-channel";
 	data->dai.playback_only = true;
 	data->dai.capture_only = true;
 	data->card.num_links = 1;
-- 
2.25.1

