Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA10727346
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Jun 2023 01:45:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0CB2A844;
	Thu,  8 Jun 2023 01:44:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0CB2A844
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686181543;
	bh=2gkP1bzT4xJ2rTf7JzXA1Y91a/JG2KiC91KqxD2wmD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H2DFHJtPTsyNAMqk5y2Gjbz93IHhM5LHg0Bi70FB1n/cAlvV8ipSDJmr0Lzy/UcN+
	 9f0p2B2XcziQuaIeCZxINfqjhN6efRtUoBzoi7ihDsgZSC+inE4Dg9q/WUL9CewtAp
	 If+n8JkIsDrVUxHPSpVE2d9cZarQE2jMUreJe1oM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9CF95F80563; Thu,  8 Jun 2023 01:44:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 05D75F8055C;
	Thu,  8 Jun 2023 01:44:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A18DF80564; Thu,  8 Jun 2023 01:44:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20726.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::726])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 937AEF80552
	for <alsa-devel@alsa-project.org>; Thu,  8 Jun 2023 01:44:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 937AEF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VTiVaUth
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKZKNccnyaHnKMiGj05Mhp99J2xcxY7Ud41q5Mia+/tVj00R8m2e+O+utsy8/7fWpul/Nf26StG9vtO6vOdkii03tX8GtCN9t+JT/RHt6FeqiQlWn+Gv5i4EwpDxbk7KKp9rvZtoiA/7nsKFKH2yDhCxZIlzmRI89ovIgrTptV9YYCBnSWYw/bRZBV0SWUcGuhrs2EqF/L70voso0Pz5jWLPzqnL4lgeLd4ykCi0QNWI1a/WMjkBQjr0q6Iub3BHIoAionqyMxSjEhz/Jy0xkU+YQPoK5D5fQsTEZ8YaTbFkqoqBLfxEK4cToHQS8Xae7ZQXBh0rxEkoo8ejvdHxBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uSMB4Ecq9DAlKwApwYjZ37teSY3Ze/sy8W3Y3UTaGBM=;
 b=mzP7TFkbUCf9cvcj/Jb6+l8IRjfROWPN0iN8NWqpUKHg/Q2zDcQGRs5ZS4OdIG6SJxIQVHFshzc9f5NtvyQxEBbKjlJHA3UJH+66RF8aEYBzimUOOqFNMNIl27dkE4/Ezn5Ny7yTtMwGXa3n+p2OJ3M8+byFI6mtwbmEKJeXfiQs6hLd6ORhXoBqBQ2/C5XjZNe+pLRhCWiM/vOYGAp2rQJuRp5QYTMOoVvSB7bZhue4hFfqpMGZKEqDaiEDAm9vJTCX8q1fTdS3FpaFkyJzHIzqd6ecjRg0li7BP4z24PPzncOlK0kRGGQbypopbtLTBKOFyM/1tFpaHb1LS2M+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uSMB4Ecq9DAlKwApwYjZ37teSY3Ze/sy8W3Y3UTaGBM=;
 b=VTiVaUthqpnPAxy3O5EZTuAeoJbfmQ2ahZjXqDt3DxixxNajES2WOtEJUek75P95GBHrEKHNVQsaS9UiaexcaGU2XuTiNtw4LcCJvyM8ub3zcp2XPTkk371XFN2hUGjdVSWfvxkVPHzyI2EUqLKOUT7xJDfaQv3uB2MuD4CppN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11782.jpnprd01.prod.outlook.com (2603:1096:400:3fc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 23:44:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 23:44:00 +0000
Message-ID: <871qimhm83.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 2/4] ASoC: amd: use use new trigger ordering method
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <874jnihm8y.wl-kuninori.morimoto.gx@renesas.com>
References: <874jnihm8y.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 7 Jun 2023 23:44:00 +0000
X-ClientProxiedBy: TYCP286CA0324.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11782:EE_
X-MS-Office365-Filtering-Correlation-Id: 629b14e1-5580-4f41-3eaf-08db67b11180
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	fZ6gdCmmoSpZ3uxJxb14qfOhJWay6QcPqYBUSU/Eo6YpuweBfYJFmnB8mLqNcV9g9iF6Tg/i3UFB8Gd1I5yWZgZjUlOSqhuKKOR/M6mXb/9L3WG3GR8KGUVC3wrLUEhdCczuEUBLizsYP2w9pivr/TWUo3cdq3yBzPgxj+bsovySm7g36dBEqil/zvvsAix+Exvt39MZjj1PPEIWu1CepysFBAcT2R8liLVNOQYVzoT3oLxGDaT1u6qSP6VvqtwCpaMY/2zOzzsjoS3576pwFJEv3Yp6okrHDvoyRMq7ayZSjCGRcxEKcNspfUxmwqqh0IQAIj72ckKgE2YO5rqLxZYxuoqDZng1/5FinCczHb9/RTjcA490JX1S1Sn06jrzF2lOcRNx4/3KzIk9eGrRp717kSoHP2Pw7IfDMr3kQmYPQY/167xIcxOmShlOGXB9E9XA+x9y17LCNOZK6FzZFbzvd0z6H1k4fviAt0M46H3ec/AyjYTLg8CKxa6e3ghnog9wwHFYGZM47Jp4Z5odjSIGpBUvEQjlpUKHXZmlnz13dwW3MeLsR3zQBJKFmxWEOUoZRPWj/6/QKRVT0rInkicVcGIchQ958Y6OlWa55ARrI+2+i6/fTWTs6v67yVe1
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(136003)(376002)(396003)(366004)(39860400002)(451199021)(8676002)(8936002)(4326008)(66556008)(66476007)(5660300002)(66946007)(316002)(41300700001)(110136005)(2906002)(478600001)(186003)(38100700002)(6512007)(26005)(6506007)(86362001)(38350700002)(52116002)(36756003)(6486002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?KAOMfTy8PLFTHtWgSthd6ITDI3Wk4Yd3zZ5+/qxCf0o7ntvEMTDKJGHYnRry?=
 =?us-ascii?Q?n5RiyJIDPmkSDsd5bORNtZZtwzeXYsSpOfD3cFof0HR0uVxSNxiOaPDUrNWA?=
 =?us-ascii?Q?BIPhfm7bXCaOgBYCzCtDVnaKyNIsqMXfIf5DvrOtCadxP1uCPukF1T5AO6GW?=
 =?us-ascii?Q?svney2pIgvFTy0/Le0hEp/zCb3NbszXR+KBH0+zhPzw8Go94+Qh4a73j/iAc?=
 =?us-ascii?Q?iFEkU2oWL1ZjSLLOeYa6fOL4PwVRsaH++srNrxV3pLoPTkp8PGOwbeV4ji2l?=
 =?us-ascii?Q?8rIcedYKvIFIDB8wZx3EosBEen8V5qQE5POlDmV7Wwwa432WeXuVyK4R5FKS?=
 =?us-ascii?Q?tYUpTTtaXNbh7Bqqz+j9m/rf0WoalJxtbEfYJL33OkasKz/aw1d1BEmsTiRS?=
 =?us-ascii?Q?37neLFinGPjMnby7HUp68vyMsv8p4FtnU1Nv7RA33Jn8f5+waPrh/lPhXDte?=
 =?us-ascii?Q?TOhALkFs/FXsrdd2btYXH6y0V3onkSutvkSe2eNdaivf7o2Tz5Pb5j3QYSvA?=
 =?us-ascii?Q?TlADmkS1zSIeABhMNV58Qzq5CgXSMIhtz0xetUHnxEC24V+X6qMogTlKGPw+?=
 =?us-ascii?Q?uPxHJMypporSUJ3f6We9Vfxf6keVvJjCd0JLLvAfdC5nNdFLPMtLycb1shS5?=
 =?us-ascii?Q?TezcT6YQnx0HYN2l646MeIvhz5PK+lARJgsinXLy53epD8AUHSJT5ltkK5i1?=
 =?us-ascii?Q?nUGM7ORuupacppvoI8O4rwKADqdmXiP+3Dighw7CXha/J1Hey5vf7c2ZffBp?=
 =?us-ascii?Q?1tueQ8AhaBp3lnVltNbfYa36mOgXURp1WvSBIRbyv2kblTPdkJ2MyHVhKci+?=
 =?us-ascii?Q?Ykn/nF/8o1/Qfuh9O/mac6Kx5xM/DdIvUWfggXLgslvndymQ4xUhMMfySXZj?=
 =?us-ascii?Q?cKwwzAdqf8ipnWi6tKKVv6wHjT6cgjH0zXRwJtdUzxVEPSHkQbQ3dgWJgWxb?=
 =?us-ascii?Q?7O4ybMImjhA+vtW5dPmkkuki7sIpyKWdS3TRNy8t7e92LWeASUntuelchIan?=
 =?us-ascii?Q?i5DYgnk9GnUwYjdG16D/lDs8S1dgUcFbkzERyboddiFZaPdd4hgk9B6xKKGe?=
 =?us-ascii?Q?UQzomNaFnbXqePhwMQzPQoWcSMJM/Y2bMmf5yRBwJqJyn24aa0GlObo37wuI?=
 =?us-ascii?Q?dG9nNtYN5ISfQbMh5sHQtizU1noOQA4qTluZJS94o4m7w4GrKkW4wQuxdglH?=
 =?us-ascii?Q?W9Df2nIFGndUrflHO8vR/s1mZ75H1rxUqQcie49lhFyJ/CBf93/iHbeqm9+8?=
 =?us-ascii?Q?F4pT3EsfR7v1FN+vZXjd1wx6gp6okEyzz0K1RtUhHMSwESzL6g9zg+lgC2p/?=
 =?us-ascii?Q?utqx2RPxnYEonRhc+ZISLIy27pTagoe23CAQdjRG7EAVlOHdjfflw90dLSxB?=
 =?us-ascii?Q?3P8crVgdx9BBxfWby7d5SP4NzEa2RZ9/wkxCLiOmzcJCC28urCROzDEniWnt?=
 =?us-ascii?Q?z+4EC+zX6eH6b+B8DhUhgMDhq80PS9qdyEv0L30X5FGbQLSHHITzOIHobjPN?=
 =?us-ascii?Q?qq7NTne9KTZIndACL4e6eMLOfe4DCDdkhQZmpQFacRDil3HLsQVNm0y/ommb?=
 =?us-ascii?Q?os9MKHAu67hx+uheIm+MWM2519Wjcg/+m2R1iyjJTmOfr3VZIul7EpxmRhHm?=
 =?us-ascii?Q?YVXhTC3f6jTwu7mSBatUGks=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 629b14e1-5580-4f41-3eaf-08db67b11180
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 23:44:00.4421
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 gxZS3gcvNcW4E7UK8G0RxErtxT2MWFX0vkCpd+2u7Q5gML6b/SX8PqVOdKkpVuMpKhxRzzf3Bdd++HQdoA/L/zR0a4eqT0+2nHSUYVradwR3zaWu8TEUKiK+WLHAo9mR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11782
Message-ID-Hash: YPAJACVCRUAII4CUKILQK3FWGONQ3Z3W
X-Message-ID-Hash: YPAJACVCRUAII4CUKILQK3FWGONQ3Z3W
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YPAJACVCRUAII4CUKILQK3FWGONQ3Z3W/>
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

