Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57EEF7277CD
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 08:50:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00214843;
	Thu,  8 Jun 2023 08:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00214843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686207021;
	bh=2gkP1bzT4xJ2rTf7JzXA1Y91a/JG2KiC91KqxD2wmD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rn2aOFKuaBpQ3XBLyjcBFzMqDFv6fLCpAjOADDjnaomyQSF+e4lXHmjHnSeTRuO3N
	 L5GPK/TQGpm4J1mOdkrWBjpe4uMPtN6eWZnzFNMGtswlPSJQHi2YF3BMUZySzwEGQc
	 70xfgjQMdJttLyXd+8lF/Uuui0GrmEQr+ofri2QA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 906C0F8055B; Thu,  8 Jun 2023 08:49:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4325EF8055C;
	Thu,  8 Jun 2023 08:49:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75B2CF80571; Thu,  8 Jun 2023 08:49:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 15005F8055C
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 08:48:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15005F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=NnIrxed0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbHl3zJ0MzIUoGXyqGunjtCF36G5ndGFseOvF1GPxJ6/4J1uA7stTw+n+3hmSTl0IawAIcy1zkwX/YsSsdyw8xCPrT3ktFJPGe3IyK19PKwyBH7DE6XRfBlHXhS+dPY/c0zlOc57sfd/KtdTnWUqndNuRK+3DpMiVekoEesCwDNQMZjbfy1+Gb5tqzHgfGWeF7Vk/TztvkxBGKHMUyDCV7XptEa+9xErKmIPlOaq37m4Co0v+SjH5vNo66huRUWX20lyvZbs8c685rg/0ZWZkMK5WQl7ofjt2OX3R5tjr/S0dwDe6JwIGv5IgV+/QnT6Y2eo7/Y5haVTol2Aja2zOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSMB4Ecq9DAlKwApwYjZ37teSY3Ze/sy8W3Y3UTaGBM=;
 b=lhp37EFNDwQKY4bk2Trq+zju/jjvcJhd0P98jY/Flr78d58UDYCBrln72UIqYK8Hc3X9QY3fjDc7YmdTU4cpxlLG0Wz2zsYgcY0Wv5j2WI7VIZx2gL1W9jL233W+3Q+CrQJ0rZTTR/Haa3Fxu8S0R0ktqqdAFL2etAZ/2yuWc+m0qpoMY/CGffIRJir2BHleuf2Mwcl316XVT469rhk+WuBljCI3iL23+NFgMGp1hzfMfCSzber+coDZkDtgHYDVWMHnsXa/meAVNOGVE5kILZjqx9+aNt38ppZNxI3YhbEa9yhiWgNGEd+qVCOmq0JULu4CwVD7WrxncI+Hzyf/jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSMB4Ecq9DAlKwApwYjZ37teSY3Ze/sy8W3Y3UTaGBM=;
 b=NnIrxed0CCnl8vDYqf4xZxv33rMCoAoNQ7c+qS1rcXjoIRbIGSLfWOpYvDxtfeTNntAHpswIRftAHyHSjc6zuKyHEdzD9jfSJczv4QCoc9omSvzEaW52hD41SR6G0SVoF+o8uxtC4hgo2oxlUl+xc3BrCzToZnNp3ja1Cz6b0nk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9300.jpnprd01.prod.outlook.com (2603:1096:604:1cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Thu, 8 Jun
 2023 06:48:50 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Thu, 8 Jun 2023
 06:48:51 +0000
Message-ID: <87pm66fnzi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 2/5] ASoC: amd: use use new trigger ordering method
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
References: <87sfb2fo0d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 8 Jun 2023 06:48:51 +0000
X-ClientProxiedBy: TYCP286CA0218.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::17) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9300:EE_
X-MS-Office365-Filtering-Correlation-Id: dff642ed-7b92-4f2e-f248-08db67ec6b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W1M+IsK/t0bb6B6/lw2QGUI9Gfq6YQnniwLZY15YMAFfDZ59IqUwo8S8RdanEnCdjYbQgpQjvGYW3U1SiVQffWls2Y3Vph8XyIcVNHtFf1MVAWLw2SMbFx2+zjDim9hNpnHjtbMrBktPKVX9c6sAwNxV2twIFvSw+6wroU/dLShHw6qKCwPs1vxLogg8uszmzT9xEA7rLe/0m9xqxqz01XK7/aJA4un6hf0uhgABx2RD0Uv8RoTRjoLZba6o5x/9QuGPG3HhXNOAD60ZzL3FzJ4lRP4H5P4iuBTvEBVeUOudLsGsQxclBPOO6fErczSMD1kLW2vOuxO4hxGC39madjzPCcJS5XJga62fQ8HmbxoEfDps74+9zaNQXlMuNmLpkJIPMaSQk6HQYlQTLDC8L0RKoJms2N1tPUUSPM+AjUboY2GZjaQVgELZy72A4h1JZpG11EFjSj7Y6SAKJlVuQo8Hf7HH1l3PUX/wVz6rl4a59nCXUl4Za0ZJ/nrV/3RYvhpF/K3HoFVuCo7nPIuUFwytO01T+KwyX2gNeoXXSuGcR14z3Cm5sPArYWMt0dOTY8zLz6qwwXBHBkFqME2ByT/OpUaPIRclCDhErt6tPJ3bHOuHidDBRbxI0NQmdBVa
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199021)(41300700001)(8676002)(4326008)(66556008)(66476007)(8936002)(66946007)(110136005)(5660300002)(316002)(2906002)(478600001)(38100700002)(6512007)(6506007)(86362001)(26005)(38350700002)(186003)(36756003)(52116002)(6486002)(83380400001)(2616005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?h30uB7k2jox6tZ9xrMr1DTX0mQ33NkWHCm656bu/8v/UdGEbE2g0OC2bQIFh?=
 =?us-ascii?Q?DQr61VCLwEOixW+kXjNlbiaG2+QHhBgbObj1SAiGX9eOVd7TmyaTEiUygIil?=
 =?us-ascii?Q?MZzQdJ21klh6za7MrNaZgFDmrOsm9FVfUWh+dqwwoHh04D4VzNG94u4ThkDk?=
 =?us-ascii?Q?rEjuEZb+gNFHVZLeKryDCMpgafDmeOwhGh7dWMvgYmJXcgNRZOK35HhcBdhf?=
 =?us-ascii?Q?fHAMGPgnd96QRgSWmPSev18QzYhKjKfYPOVpGWvro9PlKwKWQyXdrR8x5D5+?=
 =?us-ascii?Q?h7eLhrhTqbTJTr4AoL0BDfIMk+a90SDkSOVYEd1B6ptb2nQmD+Uns/1oL89+?=
 =?us-ascii?Q?N3ex0AMpvjqEs0Qutus9ABx5EjXebK/Vmsu5PwEY9dGZQNJ5wtdEaYQ8Tbfu?=
 =?us-ascii?Q?yt9X/WFKwNs6V60NMJJsk6Qc2N9+503A2YaYIJyTH94QI7dnaPsFRd3V6S+j?=
 =?us-ascii?Q?nVyIBeCwv934MYkRnLTV/gX+DhJUmwSoyoo/3llrPrMgvb9YM4DsDw73WUNZ?=
 =?us-ascii?Q?eNGv4Li1Y4eGjYBtoreKr0d96px1x8Bi2ppLVY0zvg8pOtVlJZqO0fvNo0D9?=
 =?us-ascii?Q?4pXpE36H26y/tAIpAgYIIwaAATJ5b2HmdEYl+RriXYtEtfZ6qE5qra7gpdCy?=
 =?us-ascii?Q?yc2Vw0ksBCSfeotwDI+pvfKkvwKvigsD/IO2jPkUXSYWOHiFT2y/gx4rFHUb?=
 =?us-ascii?Q?KcwQjsGT25QZ3TWQ6chIFjc38n/CdV74qkmxntTgxf5cLrfUmmGXqmgs5Y9U?=
 =?us-ascii?Q?1omRvjigr13fBBO1Tk6KwVcnnrWRZoAWThXhNAOtBvYJVvjHuFhuzUsrWixn?=
 =?us-ascii?Q?19OPlAML179/dTU12q0jVuSL6b3sf6P5a1dlgle5t95RqNl4FJ+/xcv69bgW?=
 =?us-ascii?Q?IPQrq8nfTeuICxJ5Vnmhe7ikhYnhX4B51jyB7omo5r4uwZL4EuHG4Gf55J16?=
 =?us-ascii?Q?nALwfZ4cYrHw27H0A5ioKfq7jMcBgNMa/aviBpwiOFkyeTR+Nln3BK+FAAk6?=
 =?us-ascii?Q?spqLpC5TGwVdSDw3pC8x0zHg2Ta50mNF+xSkZesQMJSC8cIcDaa1xf+v0kBe?=
 =?us-ascii?Q?dJ3HvdduMqLGKl+czKVwu/pGZ4Yy2CKiwVGdZmsA3f33TCbt6N6FfMUAfz11?=
 =?us-ascii?Q?FGTTsRQ4qGIqly4Nehb185VtHJpb1I6jwOV9Q9hbkT2/jt9k1N3vxCLOLc76?=
 =?us-ascii?Q?PxDXv1Y5AT5fpFQ5UgjBaryo0+z03cdbUVD7jk7niG4DWxq4HqMcfxqy5T65?=
 =?us-ascii?Q?kEUAz5IOGeiM6Es0SBczOg+JOMFuTxzBEB3dGVRqyJANtLpMNG0YD03iTCma?=
 =?us-ascii?Q?NhQuvUfz359YEpsoLlXLqAJJmifTKTE8p/wxt7brPij7cZl/Lx3EeD3fGkgu?=
 =?us-ascii?Q?y2HYMaPRAj/ojAP0viq6DinY6X7WJNkaF5+GQo55x3XQDN2dvt7wjDx31oHW?=
 =?us-ascii?Q?Mm8haCZs5bcCXhyrgVcoegMZ8PmWXX7IHvlqOvihqmHNbzlQhXdI3ymPrzXl?=
 =?us-ascii?Q?TAY0GSBO5jzmfwqNrWgt+7XmcSzcyCKWQohkcGMk0XtBZrZpfuWc1lR4eJZJ?=
 =?us-ascii?Q?nIHeysSOoJ9ejHTvz3Ei06hb6IIO54vNLEY0EiKfGG9jbNgx2lU2VZ30B/2a?=
 =?us-ascii?Q?MLkiAbJMiwN6Tr+jao474Uc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dff642ed-7b92-4f2e-f248-08db67ec6b81
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2023 06:48:51.7523
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ver20Fg5a0bFvR8EK7yk2x7VMdjPePRUjdcBopQugTgfEiwgD4B8jNGarXLzwdaPXr+m0xMVEHKcqJHLIInLJUAEdz4G3syTcdgtXxL/Asjg1bnm+h35AKKp3H/8oSho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9300
Message-ID-Hash: UZR45B4PFTCZ7B2VRZQWNHH6YUXNUGSP
X-Message-ID-Hash: UZR45B4PFTCZ7B2VRZQWNHH6YUXNUGSP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZR45B4PFTCZ7B2VRZQWNHH6YUXNUGSP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now supporting generic trigger ordering method.
This patch switch to use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp-da7219-max98357a.c | 20 ++++++++++----------
 sound/soc/amd/acp-es8336.c           |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 375417bd7d6e..7464ca2b596c 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -524,7 +524,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_da7219_init,
 		.dpcm_playback = 1,
-		.stop_dma_first = 1,
+		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_play_ops,
 		SND_SOC_DAILINK_REG(designware1, dlgs, platform),
 	},
@@ -534,7 +534,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_capture = 1,
-		.stop_dma_first = 1,
+		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_da7219_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, dlgs, platform),
 	},
@@ -544,7 +544,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_playback = 1,
-		.stop_dma_first = 1,
+		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
 	},
@@ -555,7 +555,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_capture = 1,
-		.stop_dma_first = 1,
+		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
 	},
@@ -566,7 +566,7 @@ static struct snd_soc_dai_link cz_dai_7219_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_capture = 1,
-		.stop_dma_first = 1,
+		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
 	},
@@ -580,7 +580,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.init = cz_rt5682_init,
 		.dpcm_playback = 1,
-		.stop_dma_first = 1,
+		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_play_ops,
 		SND_SOC_DAILINK_REG(designware1, rt5682, platform),
 	},
@@ -590,7 +590,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_capture = 1,
-		.stop_dma_first = 1,
+		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, rt5682, platform),
 	},
@@ -600,7 +600,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_playback = 1,
-		.stop_dma_first = 1,
+		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_max_play_ops,
 		SND_SOC_DAILINK_REG(designware3, mx, platform),
 	},
@@ -611,7 +611,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_capture = 1,
-		.stop_dma_first = 1,
+		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic0_cap_ops,
 		SND_SOC_DAILINK_REG(designware3, adau, platform),
 	},
@@ -622,7 +622,7 @@ static struct snd_soc_dai_link cz_dai_5682_98357[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
 		.dpcm_capture = 1,
-		.stop_dma_first = 1,
+		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.ops = &cz_rt5682_dmic1_cap_ops,
 		SND_SOC_DAILINK_REG(designware2, adau, platform),
 	},
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 89499542c803..5e56d3a53be7 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -149,7 +149,7 @@ static struct snd_soc_dai_link st_dai_es8336[] = {
 		.stream_name = "ES8336 HiFi Play",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBP_CFP,
-		.stop_dma_first = 1,
+		.trigger_stop = SND_SOC_TRIGGER_ORDER_LDC,
 		.dpcm_capture = 1,
 		.dpcm_playback = 1,
 		.init = st_es8336_init,
-- 
2.25.1

