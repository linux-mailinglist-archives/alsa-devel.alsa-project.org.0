Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C065E6FBB9D
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:52:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4DCDA1198;
	Tue,  9 May 2023 01:51:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4DCDA1198
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683589963;
	bh=OI4Eo6bdd0W7FF54rrbfPVGQl0riK+lYu76rfvJhPdw=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=myc1nEFXWMVqgOcgsX6HB4FJkdxK0esiupcRS/1aiZRJszrD2sO1MHdxz2dFWt773
	 tZTaUrt4R6sKcar9GpE44n7mKHqpNZXKnRE3X3F1a21Q99CmlaNzMVajpHcnAE/bF8
	 UtO2LTFXiuRetCWY0D2u7GuXIVWmWLTBOI/yEfnc=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF395F80534;
	Tue,  9 May 2023 01:51:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 856F0F80548; Tue,  9 May 2023 01:51:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_HI,
	SPF_HELO_PASS,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D2A6F804B1
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:51:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D2A6F804B1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=T2v3Njpk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kH0uazJFrpb9btaPfSMKpQmcnC1DPx2I/Wrv5ZFph75FtvA8A34PzIXhkBIy9PbPnkVzmvfUT6DtWsU9ys7yTW3Hyh+Y0LAPfRxtgX0xFvexQVC1ezmNEA5IGfQ0+3OpYXxF1UzIAqI2eXUMNunvuRIkHyq4ntkWCra9l3Yvs4qFUADH5OMOEYUYhxRIYO7GwMj7NxdeQ4LyRBMvaCVdWkfIhdxsZxRASSAKCxX3/nKLHXFf1SG+YxbplSm+eUNYGTpUu/57RSUzdrWJeWmtypfsdJ52pi9h41yLl4k1SujcdP20rqTfdSD7aTox8cY+4sxEBOa2aODLEDk0knyIdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mFEzoj5ylnZBAK153WCPR5FsZ1MSB/ZXoMC5zaEaTVY=;
 b=JS803SJueSFeoA3OMd0G9xQAxT5Fs0a86m6EeGC3dSyblpYgjkvbj2njKxbwUpYR3LFa0d7QS/x1fRUMTm+N7zyFzZYC75rAEgHOUKTKuEXXO7OjJK3H8b8vw2cMrV999GUOn3KXwXdsJ+URegjO0djTxGssvIu1Rlfai83t42ydz3iSQNrlSjB8S/GundyInFoNcQWIvAIw8fGVS6stMvYAl3y9r9Uktnvzw1RMWruHNOqVUE4mpAmeKDrrCnxyho2rHF/BCvf/3JyTNi00ft9uNg1wAfesm0v50M0Srm+JHkdYTV6qxBrHeYKv28A3pDhTjCLjO8YWtafxCtXCFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mFEzoj5ylnZBAK153WCPR5FsZ1MSB/ZXoMC5zaEaTVY=;
 b=T2v3NjpkxJ6bBP/J8ePId4giMP3gB4JPqTNZ4lSmSDxl4nM2wUB9X4RTPLsrVnLhd+HxNm/Gt/CBiUfTZUHUPIZWEimIPE0WUJgaE3bQcRmA+L32aS5uEBl+LUFelggpQTxctCnl2UARFRoNAaVfWl2zfdy7ZVMlelGmwgGeS7Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8249.jpnprd01.prod.outlook.com (2603:1096:400:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:51:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:51:34 +0000
Message-ID: <87a5yel6uy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH v2 04/13] ASoC: amd: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:51:34 +0000
X-ClientProxiedBy: TYCPR01CA0125.jpnprd01.prod.outlook.com
 (2603:1096:400:26d::7) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: db3c72dd-6db4-4d5d-9f54-08db501f27b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Fjsy0oBCDksF2gPVVTcGJ/geb2M/PY4jYbi17yy26Ho4J/giLATetKSQ4y+bnwS/GeEpmAy6u3HspNIswpkxuJAcnNI26u9Xsb/VNEJeuXXDRVESvf6nIN2Bzmt39XkYsSL33aCkNBTCVcT6pu92u5ZMJta69tIGMwq4OmWR90Zv7lF9mxXOuJKj3qWXtG32J5kAlnQ/D9Q9zhQlV6kFBz5ympu073WWUIG7mpp5Cj7QCx4/TKNl2Npi5dWgdG+OSUDmCE5jpMPMa6QJsKQwv6ar/uOVgJsWGlPrdA3m+WLwDy1Z9caGBwYYO7Gl8wcIfhV+YnGAfOR/sjLKyglYMM7vDU86cpEmUgXvpeC33Iq4sbQXAGBsE7go+MPtBqF8MhpamGSCD66c75tyxxRb2rGF2ekq/7tVeYzqHWTZOvbwXEeaLcZOqnLi+YloenL/O+BhKdq+jLlvoSkE/GFkuKPC2V2D1bxVqyaM27QgcDAw588xHe0RATUzdT7daiQr1uHNfCS7sEKzMHc58s2H4YC5q1U1AqznQYXlYfRi0zBmOPb8Ix54DeyVeASnVOj9vXFG52PkDLJ7IufTzLu9MQmFVjTVb5eeAiGd1ngICC72cMlyDY7SUiwkG3zZBnRZ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(4326008)(110136005)(52116002)(86362001)(316002)(66556008)(66476007)(41300700001)(6486002)(66946007)(8936002)(8676002)(5660300002)(478600001)(36756003)(6512007)(26005)(6506007)(38350700002)(2906002)(186003)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Q0sy4EK0oogfhzRqiWyeqPT0iNWv4Fgz5bgzZh7p4Lr/jLa3HgSmob3XoI3V?=
 =?us-ascii?Q?HDpvW0+Ygmo2pHUHBdUkM3OoJslSL1N4nuDMQomtCGJl6i46pPmnucicUGVp?=
 =?us-ascii?Q?L61pfE1dNm5K9hOhs0Q2pCoon+W9AZZCpX2XABQ1EolIKMZoDqCsI3H6ZLoU?=
 =?us-ascii?Q?acVwvd6bauYBuRXrfq4YeyR9hnfg7lEN5UYpTkt2zmnuUY70TVUMf1wzAyu6?=
 =?us-ascii?Q?IWGSc+I/bf+55nxkQ7wt10iD0a61OXzaE8qZme0aQqGxV/Z/v64t6bAdVojf?=
 =?us-ascii?Q?tlYPVzqSxXHFPFrNFVR1JLt5aK3Xb44oc3B3gvR2UBTxNZmLbD6DibvvjgGt?=
 =?us-ascii?Q?VvQ2e/od3cXMSww6iPpDBbubatMMaNU9m/pARl0AojFLA5uOIdJuAsF7rRwL?=
 =?us-ascii?Q?gxP5HGDO1/o1WIDoAgkoMhCcNGWrJxt4ptj/h4ZCGA63QM2qILTZnuiJrl8k?=
 =?us-ascii?Q?IywqG+h5TEr9MsfuwwV8xvN9nMoNcZqNU0SnoP0L4A4j44CPXbHjolhHmbuj?=
 =?us-ascii?Q?B8MzvPdMTEXZMO18zuNzCF/NdRYYb+hvVam7Eya5d9X5qhebQ09dVBrmDABS?=
 =?us-ascii?Q?/cy3CvfUNump2AyjqdHcXPHo9WOxvZMm5S1MvOEYQQi5yckaZg6gmfnHAD0e?=
 =?us-ascii?Q?BOlNf35/XTzGaYHFzaGbIkd9/Sb4qeq4pbDw/8VvANQYTMq+WSmNkoAg+JrW?=
 =?us-ascii?Q?A5Axgtt0zkm5xpLaA89rUJU030gWKMTuhcazO1XaVU31D0T4YkL3HoxbJ5TR?=
 =?us-ascii?Q?q4y+ZIAQTThlVrFleNXxo3mPg/X8ykvlP1+3vIxzVsX2pUjqcaYPYZsu/Goa?=
 =?us-ascii?Q?FEUW8cUT8t3EHZgjX00sHOVz8ukkLJYb4Pq964FLdy7dp9YVA3xdzzU9gJOW?=
 =?us-ascii?Q?g8mXopZMCuan+D3KVNspCh2KG3MNB/oQ/iRTfrvBYjSBme+GqUw6MVEbnqOF?=
 =?us-ascii?Q?PTmXaDJjw6DvFmWjYlX/Lj5hH1krhIv3YIKYZovrzqilustAdBYeltevtCbt?=
 =?us-ascii?Q?Hhf28uaQleTCUXDKqpFF9K5TQieUoYRTuSSya7OOFyOxcM+Gr6v136Xreo/I?=
 =?us-ascii?Q?Uwwfu2pNXwJAU0h95A+9HM+wiKuBRescCLlkWg/Op3uBebPNHWKUm1yX/lTT?=
 =?us-ascii?Q?Wx3fbFuH1DGVCVoirCagkOXbL2B9ibVMRI6gCFLDDfoZo+5W5CAhv1pKI6U5?=
 =?us-ascii?Q?K+dq0korn5KRoQKzsehulHZlKL+aQE76yYBXrzFc4oV7GcDOrfl3NGVzMCnS?=
 =?us-ascii?Q?MIWPfSIfe8xB9J+TwDJez8Dr1uVVDlcl64nTMu27NeIl+FFpIhdjYg8IJOh3?=
 =?us-ascii?Q?Z/XmN3yzg3wH3k0t9A/IkzMsGiIqTArXO8Cz2VEfYVnnL2CUOLADDyeXM0zr?=
 =?us-ascii?Q?XPZ9Hwf4WgZhpC4fjzCfnprS6hOChUzDXpvj6uDUzdvkifygMgz+PlAoTTeP?=
 =?us-ascii?Q?S8EiF5tT2BYHCivcDPr58MUTVlldMmW+f9cvl1orXWwpEcJHi3GflBOt2Oa2?=
 =?us-ascii?Q?o11+tWENYagiaHfeunGhF8j1K9SCtN48NfuHZBr7jv4Bv/GvbdlqI5cvdnR3?=
 =?us-ascii?Q?jjncXkMJLF0JdmPRGZ29iwswMjUbJ2bJVBUczYKhaZdMjW05Uxf5l32XGFLM?=
 =?us-ascii?Q?sPO+KeyPEw39qMX4d/SVsL4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 db3c72dd-6db4-4d5d-9f54-08db501f27b3
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:51:34.4368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NHHSnoFI1btW8mjNnaMojnxh2t7oXoYLYrj6y6F1ua477aupyVCw83JcHcw+iFaw3T55hiR8CibF898Z1zkpPgaHaYkBveFdGcQtFc+2LVghq3T8XSrGj1p4n3IaAVHo
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8249
Message-ID-Hash: 3RGDFWSBAZQVDPHNPTSDEJQQZ6WTGAUK
X-Message-ID-Hash: 3RGDFWSBAZQVDPHNPTSDEJQQZ6WTGAUK
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3RGDFWSBAZQVDPHNPTSDEJQQZ6WTGAUK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/amd/acp/acp-mach-common.c | 43 ++++++++++++-----------------
 1 file changed, 18 insertions(+), 25 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index b4dcce4fbae9..6da17140beea 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -795,13 +795,6 @@ SND_SOC_DAILINK_DEF(dmic_codec,
 		DAILINK_COMP_ARRAY(COMP_CODEC("dmic-codec", "dmic-hifi")));
 
 /* Declare ACP CPU components */
-static struct snd_soc_dai_link_component dummy_codec[] = {
-	{
-		.name = "snd-soc-dummy",
-		.dai_name = "snd-soc-dummy-dai",
-	}
-};
-
 static struct snd_soc_dai_link_component platform_component[] = {
 	{
 		 .name = "acp_asoc_renoir.0",
@@ -912,8 +905,8 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == RT5682) {
 			links[i].codecs = rt5682;
@@ -943,8 +936,8 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == NAU8825) {
 			links[i].codecs = nau8825;
@@ -973,8 +966,8 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == RT1019) {
 			links[i].codecs = rt1019;
@@ -1005,8 +998,8 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == MAX98360A) {
 			links[i].codecs = max98360a;
@@ -1076,8 +1069,8 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == RT5682) {
 			links[i].codecs = rt5682;
@@ -1110,8 +1103,8 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == NAU8825) {
 			links[i].codecs = nau8825;
@@ -1138,8 +1131,8 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_playback = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == RT1019) {
 			links[i].codecs = rt1019;
@@ -1173,8 +1166,8 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_playback = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == MAX98360A) {
 			links[i].codecs = max98360a;
@@ -1201,8 +1194,8 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].num_codecs = ARRAY_SIZE(dmic_codec);
 		} else {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = dummy_codec;
-			links[i].num_codecs = ARRAY_SIZE(dummy_codec);
+			links[i].codecs = &asoc_dummy_dlc;
+			links[i].num_codecs = 1;
 		}
 		links[i].cpus = pdm_dmic;
 		links[i].num_cpus = ARRAY_SIZE(pdm_dmic);
-- 
2.25.1

