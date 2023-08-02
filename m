Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A505C76C1AF
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:55:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3EA26C0;
	Wed,  2 Aug 2023 02:54:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3EA26C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937706;
	bh=9F4W/SL/4I5oEq0CCbU4nS3YFcWTk0qMUKR5V4lf6c4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a4rjbVO+76sKhD+w6xIk3JgEx/CXEEBAToak/Gnv4dp0q+7yyaaS7+IuzaMki7oLQ
	 QNmPdM9uOdLlYJy+9U3E69wsccyz8EzynTGkZNsQMPeDMZzEKiE8v9UkXmSy8JBDG4
	 HerTW+LekzRb/PIWjxjAqML8jg54IF4CEANFDGfM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2D9D1F805AE; Wed,  2 Aug 2023 02:53:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EDA50F80580;
	Wed,  2 Aug 2023 02:53:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 383A4F805AA; Wed,  2 Aug 2023 02:53:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20721.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::721])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B302F80425
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:53:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B302F80425
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=pyAleh3n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6k1l/es2wRYCesEWiHP8WZmia2hSarcMjgUjr+wkahEblFjpUtIi9KYojT5PiDfkQh3na1HPAIz3/p7GCqIKnRCjhDIQXwLwsLAwTkTmUzwylNcvFKkqyxaNN0UwT2P6MYHMhxoQWrvIgZ7GuVGLaZW8iBl737pnd/WaDXhRHR6wkavQxURgWm9T9y5gcgFhgCfyQ/SINkZmEhuFstgISnkvp8GQLu+6hl9guLwgiFgdlpnZMh04WaC8fxy9AXs+4/bo3KpbWd+L1zeasqLCXPF39iPFQ0OPi0Me49grtdwSe7giBGjzF1Vz/+9mx765u5I422bV0IeIT2FEklRxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RYvrdhC8Clysi7YdhqkgnXxH0cMI3M8UPaYT8GTS3fg=;
 b=b0h9sWnu9402XF/mH8P4ag6LZicYBUq25TA3i5rc6XQXUVqieYk3xS2eX7WPK+54W71E+HsKbbmUXvhpyIEfqIK1AcjJnDlhOzGh3ulVYTlb6od5CHJ8K9FuMXIpx5t8cyuonaI72cxp7HlA0aP0GHAOShIk9vWVvVvcxVbGyDKpZuFiaUUrUghJZP/EXDAWw36Xd/PiSEdeXBN2b/Zbqf5ULG4PWasyoqEArO0TgiSnGcTcH57j2pQjPUslRouzZ5qUK6CJhllsgx9v1+DyvfR6eu7WRK00oW06SeHYsh3JwUeqNbrt3UCpiBp61X38KOF00c5lYWMhK3E0CASD/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RYvrdhC8Clysi7YdhqkgnXxH0cMI3M8UPaYT8GTS3fg=;
 b=pyAleh3n8+CVsSHV2QkzKQWA244zI4xjftxcxFMHwlxlc6Idogz3MgZqEWcz4i1Xqgc52VK42MGSw4LWKu3m+XeCPZMj8IDXEglq3UQm1UypH2OqTVtpuuuNMZ5/x9kGljusOGVkRwyYIxnonjIpWQqG6XLC4+hgi8uA5cgYIs0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB12016.jpnprd01.prod.outlook.com (2603:1096:400:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:52:59 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:52:59 +0000
Message-ID: <871qgmuuxh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Maxim Kochetkov <fido_max@inbox.ru>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/38] ASoC: dwc: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:52:58 +0000
X-ClientProxiedBy: TYWPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB12016:EE_
X-MS-Office365-Filtering-Correlation-Id: c22f3d2d-07a2-4f4e-2dbd-08db92f2d0dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	vZNLd7NQFKGr22oPIcwu4Y1Bf2JI1ojomA+93O/h5h0HDqZhdVTY1xsH42SbSu27J83RWktDbtR7voqXDenGZ1G4cEkTlpD7K0/oMxZ/ORmv2mYNJcG0FTgGIQ5OWx9v4c29KwBmvnjydugdWyHuFtOT6WzPKPrDWbOdFJsm53xLGWTbr/05IKuxZxwYi9gxeGOpy8KqqOjRXaR5LwDwXl56tE+X8xLW68mu75MiESxy5HvAgFkuAxHJyP3KkGPCgtzpo0bKpr76i8DKpyN+QtI9DwrwGx9JKknbGF7mZ1N/is6u9AvmPGX+HfIfj/SRUeLIErKQ0/bGtJQwXvrnoF1a5YFS4Y20JLO2pfnRp2UmZTDbGxNYU/GyMQh66GRRAtbVtLAjnLyCyOoA+sUVgjn5ha4MUxBigg5FUvSeudHDjAZUmsraqhr8CG4fQVoqbwpSNbxOaAoqkz6Ed6KfQFYd/hrBdBJOYtW4fJXY1HLnfbndaXT9V6Qm+0C/oqcx9TR2sj1Ay5tEvUzbrXIdEYVGlcjWCtPKZW4XKqvvXabkYJAjK9MssCat8mR+QBb90mRaQr2p0g/W9m7/+YXHCntYRCJV0XpF3+yylTVmDaQ4UTATJAV7aILZAxTDJlJl
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(186003)(8936002)(83380400001)(8676002)(26005)(41300700001)(2906002)(5660300002)(2616005)(86362001)(478600001)(110136005)(38350700002)(38100700002)(316002)(6506007)(6486002)(52116002)(66946007)(66476007)(66556008)(4326008)(6512007)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ac+MqV+/rMFm8wYLLtqlApSX1hel3eGFl1kgciFJrcEgS+SmlkL54P1BaVj/?=
 =?us-ascii?Q?8gjV46WU0KESNz7IT9uH3A9Up7zBVqFwFok69iathfzd336y0G4eigAS7oNO?=
 =?us-ascii?Q?uXHHncmseEpJIjjQniDPfreT6asQaBbHN1x3sIPoOxrXhmr6Vil2h8uaD7WN?=
 =?us-ascii?Q?u2PgH17jlFfK06xAgHzWe4jnP1NG5o3X8ysQ4Ad51IIYliFt/Jl9EYWFP3IY?=
 =?us-ascii?Q?kbYTJVJnlaTPBMTTz7Wwl5cs5W9oGHJPapQN41A2zccEgXFuiWGVfV5h2oLm?=
 =?us-ascii?Q?JMH8TeLOlLuT+K2FnjPNwGEaJjyS0Bvb7qss8KkoQRAxJk+8UV0/R9ooQ3xc?=
 =?us-ascii?Q?8QWILpQ/imJTtmyT8KxqePDDj/oXUQvgWmoeAm6YJViRq7rbZWMw9WJ/08E7?=
 =?us-ascii?Q?ohkLazGkCvTHGHOBVhVmaFiXG6jhpXTTm+aWQO8yXfGKpQ4sLlSO4h/S1543?=
 =?us-ascii?Q?IKfRPtXD4xUTFPKMra5Ne7lExV7JwQcHGq2ZtSuo6FgttSpJvmE0RCnJ6Yy+?=
 =?us-ascii?Q?al2uwDUhHGzzUetLA2kkPPtFb/HY0cL9l90QQKeYc+wjq7jTLyXGY5OaEfcX?=
 =?us-ascii?Q?++hXjmmiu+2/Rdf6Ajy3E7En1+pM5AhdRhNJlBh98+3CxhHMd4tDlOVb/87G?=
 =?us-ascii?Q?LGnx1q3KaKoCb44wA3omcPTvYmYt/7yUR2Le4WaFKiScbc9OzpArm/q2PI4Q?=
 =?us-ascii?Q?OSHfvKH3MrV43kgXUAfnL9DKthpaOz39Uutk1iOOk8hEp2VGUmXFGL2bfJQS?=
 =?us-ascii?Q?Csll1SQKGxo6FgjNZzLVkLvyrNnqPbGoexbDod+e/Ofzq32c3Alzzhd4DEHP?=
 =?us-ascii?Q?jkAD3VxAEAoN45GeZXTPQcV6QA4zE1xgFObr8nKGK8uucK5xjby/vRV6SnP9?=
 =?us-ascii?Q?Tk6UKOP1AGxLcN4EeH/aYSNinJxrQWMqYTofTvU6PGNArEx/GJDE1909bx8f?=
 =?us-ascii?Q?VYDhP8bOGCHOmuddwvpKQx4PeMj9NmigeDov4TDOKAoUj1Eb2CbLw/bHXldr?=
 =?us-ascii?Q?kA+tE7EP2rJfcvWqhhfWdNlJCHnmomwVBcQ245rYEOhN5VfGeRh89ZgYTcts?=
 =?us-ascii?Q?D0SRuYpJLyKXEm4Ruwc3++Wy5A2jZisgKUN9m2t7oyBaEBf6fgThVunNQpFF?=
 =?us-ascii?Q?3jx6AJ1p4savZxinE+Ksgp4bXuoH+DCr77ajKX8bI3qc6Qa3sdVgwWunIJbm?=
 =?us-ascii?Q?5t3wr0JOpOqB8DvlJ2782uNGcKBfuaBF5g+rC2QP2E5hBByFSFKP+FGVtguO?=
 =?us-ascii?Q?o7FHYYALXzAJ53CeNFURROH0y2nZJHJTjzSMk+zDeVVPgB9t9BGUgseu+8y9?=
 =?us-ascii?Q?85AIVMVrDNRjDSfizJy6WlVgk0i1JZUPwH2akofv2K2N6gpWbi3KPn5TX3gU?=
 =?us-ascii?Q?+WvNFqC1PYmrVYGxuAmflVCq745oklHq7ThMBZLQbQB9JmNyTAgIP0WHydha?=
 =?us-ascii?Q?mjQLLDcx/ktMBeMs/6ubpP+R5Ah0DDjAZPkc15oH1UNSxtUQj+FLlam0GenA?=
 =?us-ascii?Q?wadsmRuxWr9vrqyy1X0YudwUtX0/HTGrBXjWyXI20OdJ+fKvqXbPjkayY3tp?=
 =?us-ascii?Q?SuQRLOhwYLHd67PsrwKpRrWrTfwgCk5JpkfDejo9PTqW0clVWa0D0u0SXy30?=
 =?us-ascii?Q?NX9xNfB3snQFJNLVIn1KbAE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c22f3d2d-07a2-4f4e-2dbd-08db92f2d0dc
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:52:58.8912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mMeTOR5WBYFIr/6ZVHiYvdGiH/mpeMP78s3C6SOrvmicJ/zTmAJtyyo6ax8m0OqSwIb1++1FlUoJ1D+A6uK6kG8EgJdxjs4TFIjJRnChS1w1b1+PL/m/7jgvXQVQRRYZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12016
Message-ID-Hash: LVKR4DWE2VXWZLBFMXZT2427FM73LQCV
X-Message-ID-Hash: LVKR4DWE2VXWZLBFMXZT2427FM73LQCV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LVKR4DWE2VXWZLBFMXZT2427FM73LQCV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/dwc/dwc-i2s.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index 1f1ee14b04e6..0a4698008d64 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -443,7 +443,16 @@ static int dw_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,	unsigned int tx_mask
 	return 0;
 }
 
+static int dw_i2s_dai_probe(struct snd_soc_dai *dai)
+{
+	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	snd_soc_dai_init_dma_data(dai, &dev->play_dma_data, &dev->capture_dma_data);
+	return 0;
+}
+
 static const struct snd_soc_dai_ops dw_i2s_dai_ops = {
+	.probe		= dw_i2s_dai_probe,
 	.hw_params	= dw_i2s_hw_params,
 	.prepare	= dw_i2s_prepare,
 	.trigger	= dw_i2s_trigger,
@@ -680,14 +689,6 @@ static int dw_configure_dai_by_dt(struct dw_i2s_dev *dev,
 
 }
 
-static int dw_i2s_dai_probe(struct snd_soc_dai *dai)
-{
-	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
-
-	snd_soc_dai_init_dma_data(dai, &dev->play_dma_data, &dev->capture_dma_data);
-	return 0;
-}
-
 static int dw_i2s_probe(struct platform_device *pdev)
 {
 	const struct i2s_platform_data *pdata = pdev->dev.platform_data;
@@ -706,7 +707,6 @@ static int dw_i2s_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	dw_i2s_dai->ops = &dw_i2s_dai_ops;
-	dw_i2s_dai->probe = dw_i2s_dai_probe;
 
 	dev->i2s_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(dev->i2s_base))
-- 
2.25.1

