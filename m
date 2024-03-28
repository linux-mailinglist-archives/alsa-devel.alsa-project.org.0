Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 419DD87301E
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Mar 2024 08:59:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B981884A;
	Wed,  6 Mar 2024 08:58:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B981884A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1709711944;
	bh=ABObIBVV0pm33eBjssCezbbuagIOtvDFTS+Is3Z2YtU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A8O2tiw8m1+Po9MDaDBeDaKFJ11spTlhw3WXL+L+3nVDNdQAkTyMMwyBQNvjhGaYl
	 RfJDJZHUqtsHdWyrHClZbyce9S3dhKehrW1zSHGxSdBC7lnJP3r4SleM/q70xF6CbY
	 ViefH+yN9W8zMQA7I/DWDYo6WpFPOfVu/nRIjdkw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 38511F80630; Wed,  6 Mar 2024 08:58:09 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DE30FF80609;
	Wed,  6 Mar 2024 08:58:08 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 630E8F80093; Wed,  6 Mar 2024 08:56:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2608::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9219FF80093
	for <alsa-devel@alsa-project.org>; Wed,  6 Mar 2024 08:56:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9219FF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=jrlqsufg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFsB3PFDdsmdL9t0ycUI6Bye5dGEQqS6uE5J1qvqZ6dkC5otnhvjq6RyJsNFgqpLEFNqpkaCB1eItIGVoUnyAOyexJApFnFlm2VUDgYR+UocxY93u2wx+cuBgoZB/U3Nnxh+vy7aJ6znANcxuPhU9JwZ0hb5JOh+PVT0UklJVBvr7M3v8danLV4EdqTW+RfIPP83XdEMs3pPGlX9JJPWg2g574RjtObxM5eVEZOsXTrrCnysh8y8CRcWEccVTaiGTsSFP+/KC/sOlQUMS38R8OK68DuWv16U5IZh6OR9+49hw4kJOytAXVyP/kF9AZQcmJkcEUEayeZe37c7wExEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0HxxwqbTUQyhMeXXnXFbjpyx5CV83NN+sqlk2mdOZE=;
 b=aFXZkr+jWyb2pUQ3vJlExtSCWpw+KdkcsX+YKjGo9uiGV25By8j656pqsQR4klRiozrxg8phhVoIxBOI3v3keyXpDJ1P+9gyKcGBODgKGwL75SQ8x4lTHVdMO/rie86uq09PlJ5za/g3xpgogxMRg5cX8joZaPiBuT5Ltm83XcYmHI2I1BGkhiJWDQcSrCxUrUsCzZ61awgFxlSKnRtiZdv6topEPrN4XxK2fy0d2B6P5N2VM5zj5Wtt2JqDgPsDA3MoAYlgjMqmEPoygXsPbp3IVhWAdflWXw7lI6Ayr3ot1s0KVJQiBpotkb+KS+Jos0V1hU3FJcF3i18xsncqvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0HxxwqbTUQyhMeXXnXFbjpyx5CV83NN+sqlk2mdOZE=;
 b=jrlqsufgwvu/8fdl8vaf4zS8Gvnkj8Qq7/oUAUSSw6hZusgoWGyc8FfhBejuZxhkQ1wj1GvfpypU8J57lfWZ+XHn/mKQqeCf5mgCZxnm5YsGM0rA0uRkynDxpKZiohIpFH1GvFmSB1StPYIELsNb98mLGi565b4OjKW+smQXAeY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB9147.eurprd04.prod.outlook.com (2603:10a6:10:2f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 07:56:32 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 07:56:32 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH 4/4] ASoC: fsl: imx-rpmsg: Update to correct DT node
Date: Wed,  6 Mar 2024 16:55:10 +0900
Message-ID: <20240306075510.535963-5-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240306075510.535963-1-chancel.liu@nxp.com>
References: <20240306075510.535963-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DU2PR04MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: e9083713-b647-4051-b35a-08dc3db2f00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mR/vwwmLdF94JRO6Y25cSjgqB+z/A+HSbLizGtzA7nieaDtfkQihwS7fjNJe2WvKzTgVE0b9jZNQrvPLXnpwepe+88rvs7gZFkwx6uDv4PcnAzxXdcI+93iP/wk22WbSoIqsj7IuhcUgbup8L18X7Z5S41R0nZMRHFS9AvMaenOjk3aX/MyobPMuZJtnGxG0aRFTbAXjPLlQnozeBLIgFrjJ0QB3EE5if2/X1zQhzwt9c7wxfaodkgPflAqdaan8KwjCgQfB3RRm7gjzv92eG+bdicu49x+IghhAa6+5qfkvrnez9G+MWhhIQsTh4naxMvwgZipMutJEopfyysD0mqzbQ24Jb48l6yZDOQqXMGCSXLFTPFXEeX45M042iAfrlBBnIscJIDlY2ZbrbQxNamHk3oTU/COb+6p+aGk2CDKtw/5LAIVAqUvSoRu2S/HK2tDMDCtmsY0JhKZiickjPRgu6twRWFa+QDLy/7L34eelGHMwQfkGaSUD1zY1rAKie9xksF2ELgeTsGg9CCJ91RHEbj9Hsh2jtD19GqDsF4hwTF8wb8f4wJa8OH/xFzqwv8w+4mNtfANvHKp39fdz8wM91uCHTZVOnThNMjriyO6kOmdyhhWrFWu8uqdvRgHqBJd7bDhMXCPvkkNjcJQIe+2VVmkZtZF/1mHK/lSgCqhh6JnWrjMY8RcI328/4j3CgnI34Rkg2b0SXShwjxOJz++A0SAPJxuIX58sghU/m/8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MzZMjqGo7y/wrOG7nx1SHROhWjPx2Gjcx0EHzRvoss/AToOAzoX9JDQWZZK6?=
 =?us-ascii?Q?RpZBbW9rEaJLnpC05ZlvQ/2Zo+K++uwqK8LEyt3Ya5UdLnDQATBATn2knkiD?=
 =?us-ascii?Q?awZlp4Q/1jjr6xAldDHStTVLcyjEEHw9Whksnf9lMKp0mdrSXr5h5AtQvk46?=
 =?us-ascii?Q?uFXj4Qd7SbmoyRLm30ifoLH7tQzBHRKPwaLI+ihjf2PF/HKuOopbsyT3FimE?=
 =?us-ascii?Q?bwQJApGY/uM/sGL3fcPWuVxbcqFokxcuhYxl0+L9uhTQm1hYUgrZjW7kJmuF?=
 =?us-ascii?Q?PqixWkX9KdRpk7pBv9U1Nljr+M5KCKdDxAPWVZw52qrmAlxddJ2elMP6PXWH?=
 =?us-ascii?Q?olB3iVNXoBTIJnjIBIw7CHP40McYe0bSY5BS1BHcoT+5H+1XXy9MgH+w1DB1?=
 =?us-ascii?Q?9APumKBBmq4YpAjSwyl8s1sJ2RB19k60f5ZIBTASfsc4vOxlTgVhyFdXJJ/3?=
 =?us-ascii?Q?k8px/FXwjtPL9dZF8uQXK1/zwzmzuYtCLg0/wKmmJoo5JB3AZ4pxnVKjyE7Y?=
 =?us-ascii?Q?oPhRgHvlZ51SrLiGx/ni/udjMN2mDRYuG9lY+niePHkK50mCwGhbgOyVnf/C?=
 =?us-ascii?Q?obv2KcImIQE8us9PYuHCjL2FpxdID0RiQW2Jd8cN4R4AECOig0IV/7gqd47L?=
 =?us-ascii?Q?QEMgYXdFcAkXD27tTCHCvDUvo5y9DFHLzoaWI3AbC00HqOamuLc5mDCxh0Ve?=
 =?us-ascii?Q?LBL2WYYpGGFI+XHUlBMgLZYqRjxAeFyXNZCbSKw1YFIGfJ5yiNfxEQbHImfI?=
 =?us-ascii?Q?6HMLmnf3pYWNRsj+v+dTrzWTqowPu/QQcsiXSoLPGPUePIparZP3QAD2U0ju?=
 =?us-ascii?Q?3ivesqWlEE7HFsmTpJwhH91VbboTPPltxzTOPEFnrZUKOFQCpUaPj2BLzEyZ?=
 =?us-ascii?Q?PSYO+CrWRjx1l0aRDww/6WuCwc3MlmbV1wEOsFy3D4wNb8eWzmPUqa4iCwmr?=
 =?us-ascii?Q?jkaW1qZkL2aAOhHq1mFKofR0lXyih9xVsqc510a0GhQpSgIPRRtyCGUADey1?=
 =?us-ascii?Q?1ZedAW7MCT5Vu+aEUVLSo2+t323kMclLnAQve+ImUBXPUb6hAO4bjSF0rpHF?=
 =?us-ascii?Q?DlwsZiB7ebmrbsc5PeOyAV4V2+l3xyhHlT4yhZtay+/+BmfQv0rLTQj+xPlq?=
 =?us-ascii?Q?ID4t5Zu2eBIHQAq5hKtSz/maufE498Qy59VsTMOCpt0LuLTSS6fDi2U0RseT?=
 =?us-ascii?Q?ECFBTDT8FeLX7TtQjI+1FRjc2i0EMB0BREO8S28bUbcd9It2/bhjnSZv6HJ/?=
 =?us-ascii?Q?PXEp7jXVZx3pzIsY3HgoeZ+4MD1dpKvaEDGiEeVjBYZyVPYxRiHYHHEeJ4nZ?=
 =?us-ascii?Q?8LQYS9Grr6x5WxzxnDYseHWtoSvCj67QUOyIcvC7nB1Yl6K63BVUVkRxZU8/?=
 =?us-ascii?Q?QItZcpLct81T69fjt3xLMChAAqcKNHZsMVKmgwaYIyUXWFrJTaksx7p0VjSi?=
 =?us-ascii?Q?s4qZMKIdq+M7c0R2D8r4KI4enBCbkPCu4Ya6YyaQuS2B+sQRMb9dr5JXlwyC?=
 =?us-ascii?Q?/88ptwHythwSbbA2F1My1Bw/FnqRc86MWRCrhkXpEYQB7jThQnQWKHnueb80?=
 =?us-ascii?Q?s3tli/C892Inaddg5ej3yWlvv5Vrsx8V90a7QSwD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e9083713-b647-4051-b35a-08dc3db2f00a
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 07:56:32.2170
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uqYAVVvBbScxeiDNv3L7qd/sOT0zFSiGgy9g66x3u2HreaY/0nkrzY8fNJJRx0QKRFaFeMM7blWBaySLEdDkCQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9147
Message-ID-Hash: WMOVLAV7GKKABAGYOGEBZMV562OYNTSB
X-Message-ID-Hash: WMOVLAV7GKKABAGYOGEBZMV562OYNTSB
X-MailFrom: chancel.liu@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WMOVLAV7GKKABAGYOGEBZMV562OYNTSB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Platform device for card to probe is registered in imx-audio-rpmsg.
According to this change DT node of ASoC CPU DAI device is updated.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index e5bd63dab10c..2686125b3043 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -108,10 +108,9 @@ static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 static int imx_rpmsg_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link_component *dlc;
-	struct device *dev = pdev->dev.parent;
 	/* rpmsg_pdev is the platform device for the rpmsg node that probed us */
-	struct platform_device *rpmsg_pdev = to_platform_device(dev);
-	struct device_node *np = rpmsg_pdev->dev.of_node;
+	struct platform_device *rpmsg_pdev = NULL;
+	struct device_node *np = NULL;
 	struct of_phandle_args args;
 	const char *platform_name;
 	struct imx_rpmsg *data;
@@ -127,6 +126,22 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
+	if (!strcmp(pdev->dev.platform_data, "rpmsg-micfil-channel"))
+		np = of_find_node_by_name(NULL, "rpmsg_micfil");
+	else
+		np = of_find_node_by_name(NULL, "rpmsg_audio");
+	if (!np) {
+		dev_err(&pdev->dev, "failed to parse node\n");
+		ret = -EINVAL;
+		goto fail;
+	}
+	rpmsg_pdev = of_find_device_by_node(np);
+	if (!rpmsg_pdev) {
+		dev_err(&pdev->dev, "failed to parse platform device\n");
+		ret = -EINVAL;
+		goto fail;
+	}
+
 	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
 	if (ret)
 		dev_warn(&pdev->dev, "no reserved DMA memory\n");
-- 
2.43.0

