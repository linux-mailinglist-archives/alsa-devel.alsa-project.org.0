Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A08BC6BA835
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Mar 2023 07:44:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B65481311;
	Wed, 15 Mar 2023 07:44:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B65481311
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678862693;
	bh=idTrcn4OGfzlT+s77KriOWz9niFiORzyCfBXf/05SLI=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OqEJ5UgRJzZN6vbDr9RhwtVtR4GY79/hXTJStt4675sFx3o8sTnek0zj2iiAEoWXg
	 hDZKsWmW+uTNpsTkl/AHUu0swFsmNk9y/pyL5O2V3V6wwXZcpi8TeNfBkO6MHOa0rn
	 eS/UBsf8C2u79BKuG44atmOSFfsNBx8YSsoLXXEk=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E068DF8051B;
	Wed, 15 Mar 2023 07:43:12 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29026F80423; Wed, 15 Mar 2023 07:41:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::712])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A53FCF80093
	for <alsa-devel@alsa-project.org>; Wed, 15 Mar 2023 07:41:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A53FCF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Cj8OVuyM
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eT+RA2cqnCfa1I2FOjB08Trxg28IQs2cdkc8MyQc3siEY+oRVERn+dVTJLQPkYAaH8ssKVBEACeQwJHYLzn/7vtE6gvdYMxMqfgvIR4/sdJHwiHDpvk9F/AwBSC12eUm2Bzu+APmuFTEe8nWnrIYGCzMhCpE/2IN+/lBcB7D0MkK7H9ArkijeKLRJDuzPrgaKsayfpNTZCOJ4KNu/gJTQ1QW5vzLLTKcl5dHiCSGb/FvUQQcojETGZMlVRIOfBKujy2huneUO5FSg11uRl5veuthD0gx7/lso1/Y4Ikf26r0aXrN5Wl0fKQOmr8qrkC2cToOriHNaMo7bwdG2COzJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zhbqETopQXzX3UUGFWKTENpfTXjd/Y++dYj7uNAvK/I=;
 b=MOH4IsBQVgonNPcYSmIdaPNvVaC7YXcficHEp7I+nytlVvG6qPzVIOJKm2wHRpaH4Uo7ql78AODyRyuUWVucgdHoGImXfbz59O0rrKzd0W8LeWYiMpg7su0hmojAP0M6IexQ2h6MK6FknJyH/nbFgGu7wPyaQLcQWu8WeX9Nvf4RePNkpKHs6XUxHwMQbpI2Scg9Q+xCok5Bkweva5+o5SuvQqkBNWHW7fxdGEVzwixiHGrEENMX0/X7lF7R6D3S31q5FUAiws69v5m/eCh+06imXUKGJ3f2R+j7EdmYT8yXDFIdOUPsEB3PWX1vD8mYcj2qVpc3GcXOiK56qvaZ0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zhbqETopQXzX3UUGFWKTENpfTXjd/Y++dYj7uNAvK/I=;
 b=Cj8OVuyMPa8NZRW8DsNIHfn5i6scSf2sJBfFi8ywRCzriKlRfruSUL8opHehiWvDvqOq4V+DIAmS3xa7hNWSuD6mKirBHe6Ld9cBXxz3iyp8NHlmjRAJnWWqTEvJXfTMZjONZolNlU9q0iZIhkT/XE+vYR+/quuJa/V24ONnmk0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYAPR01MB5755.jpnprd01.prod.outlook.com (2603:1096:404:8054::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Wed, 15 Mar
 2023 06:41:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e03e:1938:695b:f472%7]) with mapi id 15.20.6178.027; Wed, 15 Mar 2023
 06:41:34 +0000
Message-ID: <877cvijz3b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/6] ASoC: fsl: remove unnecessary dai_link->platform
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
References: <878rfyjz4p.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 15 Mar 2023 06:41:32 +0000
X-ClientProxiedBy: SG2PR02CA0124.apcprd02.prod.outlook.com
 (2603:1096:4:188::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYAPR01MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 866fbf9a-4486-4b45-b8c6-08db252051a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	PQqDPWytAKH2k0m1d6UTvj4ybyY82/lfJXa18AwKoA8HlB0S9ihc8Qe7YbEa0ehz5E+tqPR5Iz249GZ8rSOk3vHq4kVnEpHEI/cqULvMVyE2ACMf1cGvh9VF/mJudAcxnQFP13bhru5i/0hSZdoEj8mDrdUZWcluG30TLjm5mpPLsyjC/YAYqvzTyoLyqxdI0i7KWYktt6BNp/YuykzP5a+68WJWOsjCHFKbKO67JXcGBvBmzDoMlisrkBhxBOxwS4cSq1KuBOpkjhP1YBEOpWJ80ZfgKIzIaumGtjU1IBwKEpaffihVms9iAg0+D++PbeIjIDYmHLhojaL99vKwUgY4fJEKvmWfPhWLzJbb0Cj+QCLPVrl93/Qn7LzGLjemNhpgLCaaLtH3V6NzAA0V3RsA8RHi+2p3Yrorf/UGyvfB3QXdgnRnGT8/FVpyXRB5i3O74t2BNzrHHsoKhCpQ4Grk9qOWYCmH0MCwcGjECNPKNWw2MW45iwnDD68tCPUJn1e+o4L4hzRZXRRG2eXkbq2OvvlwWQC96Ew9R6b3HxGfZ/yWbAYkEjOCKGiTEGi/uBzBI93/9OzewbMh89CLs2ypPWDz8IFop2eJm9WffX+NDmkSf9k1fM5Iwph7KeGK1pogPqRKME9aeiA5CB8yhUs82sSyZt4u2iEvLWpy72aWzkiRB99qeLQumo5s49QgFNbG4OmsKIMWj5siQFtRag==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199018)(7416002)(36756003)(5660300002)(83380400001)(66946007)(478600001)(52116002)(66556008)(6512007)(6506007)(6486002)(2616005)(186003)(26005)(8676002)(316002)(4326008)(6916009)(8936002)(66476007)(41300700001)(54906003)(86362001)(38350700002)(38100700002)(2906002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Hs6g/PpRKVq2rTq0o/Pa/GwNGcOot6A7XmdyT1Mt2kX9h4+/RBfKNCiSEhxH?=
 =?us-ascii?Q?FtbLZE69JtkBpWMb5PPwaBqPYKO+XIcY3axnzgvbmNAnH/P6iHzKZlSB1e2g?=
 =?us-ascii?Q?a462nJ37EfVHWuPoPuoaWUV9u8YzXuNRKIn3c0QS8/nq1gPM90q81KOsq/TX?=
 =?us-ascii?Q?EAncnjZrGZQTnTXwziGX59Oh/2oL5Rr8xDX5VpRSRGPJzlC2uCYQgV9zMQHg?=
 =?us-ascii?Q?OT2azaxSdwCecg6WTtSn7BvNYpQ8lK07iM0jH8+wBvCrENmHP0OGktoh3hW4?=
 =?us-ascii?Q?lyf8dDNAeT3al+B2SsGsbUBWJpbJhrxkhshOpHZGS32+kA47uDdZxf/mIlI0?=
 =?us-ascii?Q?NJRcSg7iEkwtm4eyRhd9yXe0m/9z2haVl5IrLFNe2vuV2YRQ+2yUlqrFA9/7?=
 =?us-ascii?Q?BpLIvn/3aVg52mfWw22utTpAQUN45fM0S5cDeEo+E/8i95FcZGsgL0dVE09z?=
 =?us-ascii?Q?Z5Uy0JdKYgpib0AzSMCBbmNum6xK0/Yl7h7fpFAgUILsQIjq+1O47xdk/ADY?=
 =?us-ascii?Q?TWRWGVWZqOgTEF0kj+OoZjVAsJuX1MGCcB4E0jEmOBv0Hbp8pOeFZ2DxhxQc?=
 =?us-ascii?Q?kVwTSq6zvuSDTIrhJabyyiWarlfcyuXKlrAcqYsSsVM6nJwJSL6xHBCLaVFY?=
 =?us-ascii?Q?Zg/PK/B4oV+UAVNfOcuIm4aRh43VOMfZ+btmHb6RmLaO4fPmh6XQNf6X9bKK?=
 =?us-ascii?Q?5BIgXDesZYsC/bLuKFQJMteEQ8+Fj7TtzOhP53dgJWUGVZmY0nUkilemQSh2?=
 =?us-ascii?Q?4ZJUrIB5aVRdPkMQIy6dl8uUKptta6mm3vCnZM5lZOsVSJvDFYlOdF1Wdlxg?=
 =?us-ascii?Q?IkR48Huwd5lYWLu4hHBWHqA1L1LaXzQOMeK7acwt8QmrYKly5HduI/Sxwpcq?=
 =?us-ascii?Q?lcFEOWmco/R7/DJ9o0JA0N/2CIa/4vjxkqbGrjY/2EOn251fKOkSurNLODwF?=
 =?us-ascii?Q?QyXmvR5t7vnquy6+VRqs5otxlE8Am+nSSomrqQWIPefWnVXe/LN8UKi5uw07?=
 =?us-ascii?Q?gqdXbiUWB/PnHue2GGNr+nbVQbkLpZte2s9uPe/IFC/q4Sj/eEMrbhHTV3Hw?=
 =?us-ascii?Q?0YmFQ3Ew6VdOEhdGlwvkhBCLUV41pGQYzyBoem5zJJr+NRw+w+Y2eXEobUOD?=
 =?us-ascii?Q?Zmy3BnbWhjl/9h8VdGBujcA+InfiuLbTJc3lX5VX3OUmT+3TXaRoKZTTNlZ6?=
 =?us-ascii?Q?JKL7SVUkQ3SZMuPT/bqhkAyZjClph9aMnYQ4v3AEOYJUlSjiz6wjBeSf5OD2?=
 =?us-ascii?Q?CKER6T0XrrRtpDu0CTQeM+0F9uTwl4oJ40ar2S0OO4XuWUu3fazdgfzzAFoj?=
 =?us-ascii?Q?HKIivB0getj96r/5a4Kn9b3DOuon/yVZLiae72CHPX2mduNckRQxxANMvqOH?=
 =?us-ascii?Q?4nMNKHEVeg7H3Q6qF6AU9ZohMnaBn18z7IHQ4rm09lLWzP7oskVPXs6V3EXD?=
 =?us-ascii?Q?bpZBALLUcEsYvlRov1oNj9LYHDxYz2DXusoyl6BBy/zWbF/FUTqOL2xP0DZR?=
 =?us-ascii?Q?4uVb9q3UT7nhuLy8iqhtYRmgk615GAsSD3ztRXtHj0TnMrGchOlBgOtd0Y4J?=
 =?us-ascii?Q?h5lkk9YMwyfPhiE3y192d1+VhbDGXiXaJDmfMVnJE9dYmaOeKfBJa8ocOk9x?=
 =?us-ascii?Q?oMXioEAszgx27jtNZqHPQQs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 866fbf9a-4486-4b45-b8c6-08db252051a0
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 06:41:34.3444
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Yi40Y+Q1YY3teM8D9W1kEwLZhpk2sjJi2kcITo5aF1la42thzM/Qe+NzW0vkYorff1BEzmMPJWU/czOMdrBZDQ7cFybT2iiP28eOyiP5uP8p4dJXFCXS3ectEc4n/bNE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5755
Message-ID-Hash: WY3ZDFRBAQ37V3BH7INCHHOPW5P35Q7P
X-Message-ID-Hash: WY3ZDFRBAQ37V3BH7INCHHOPW5P35Q7P
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WY3ZDFRBAQ37V3BH7INCHHOPW5P35Q7P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dai_link->platform is no longer needed if CPU and Platform are
same Component. This patch removes unnecessary dai_link->platform.
Dummy Platform is also not necessary.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/imx-audmix.c | 14 ++++----------
 sound/soc/fsl/imx-spdif.c  |  5 +----
 2 files changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 1292a845c424..2c57fe9d2d08 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -207,8 +207,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 	for (i = 0; i < num_dai; i++) {
 		struct snd_soc_dai_link_component *dlc;
 
-		/* for CPU/Codec/Platform x 2 */
-		dlc = devm_kcalloc(&pdev->dev, 6, sizeof(*dlc), GFP_KERNEL);
+		/* for CPU/Codec x 2 */
+		dlc = devm_kcalloc(&pdev->dev, 4, sizeof(*dlc), GFP_KERNEL);
 		if (!dlc)
 			return -ENOMEM;
 
@@ -240,11 +240,9 @@ static int imx_audmix_probe(struct platform_device *pdev)
 
 		priv->dai[i].cpus = &dlc[0];
 		priv->dai[i].codecs = &dlc[1];
-		priv->dai[i].platforms = &dlc[2];
 
 		priv->dai[i].num_cpus = 1;
 		priv->dai[i].num_codecs = 1;
-		priv->dai[i].num_platforms = 1;
 
 		priv->dai[i].name = dai_name;
 		priv->dai[i].stream_name = "HiFi-AUDMIX-FE";
@@ -252,7 +250,6 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].codecs->name = "snd-soc-dummy";
 		priv->dai[i].cpus->of_node = args.np;
 		priv->dai[i].cpus->dai_name = dev_name(&cpu_pdev->dev);
-		priv->dai[i].platforms->of_node = args.np;
 		priv->dai[i].dynamic = 1;
 		priv->dai[i].dpcm_playback = 1;
 		priv->dai[i].dpcm_capture = (i == 0 ? 1 : 0);
@@ -267,20 +264,17 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		be_cp = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 				       "AUDMIX-Capture-%d", i);
 
-		priv->dai[num_dai + i].cpus = &dlc[3];
-		priv->dai[num_dai + i].codecs = &dlc[4];
-		priv->dai[num_dai + i].platforms = &dlc[5];
+		priv->dai[num_dai + i].cpus = &dlc[2];
+		priv->dai[num_dai + i].codecs = &dlc[3];
 
 		priv->dai[num_dai + i].num_cpus = 1;
 		priv->dai[num_dai + i].num_codecs = 1;
-		priv->dai[num_dai + i].num_platforms = 1;
 
 		priv->dai[num_dai + i].name = be_name;
 		priv->dai[num_dai + i].codecs->dai_name = "snd-soc-dummy-dai";
 		priv->dai[num_dai + i].codecs->name = "snd-soc-dummy";
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
-		priv->dai[num_dai + i].platforms->name = "snd-soc-dummy";
 		priv->dai[num_dai + i].no_pcm = 1;
 		priv->dai[num_dai + i].dpcm_playback = 1;
 		priv->dai[num_dai + i].dpcm_capture  = 1;
diff --git a/sound/soc/fsl/imx-spdif.c b/sound/soc/fsl/imx-spdif.c
index 4446fba755b9..114b49660193 100644
--- a/sound/soc/fsl/imx-spdif.c
+++ b/sound/soc/fsl/imx-spdif.c
@@ -26,7 +26,7 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 	}
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	comp = devm_kzalloc(&pdev->dev, 3 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(&pdev->dev, 2 * sizeof(*comp), GFP_KERNEL);
 	if (!data || !comp) {
 		ret = -ENOMEM;
 		goto end;
@@ -34,18 +34,15 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 
 	data->dai.cpus		= &comp[0];
 	data->dai.codecs	= &comp[1];
-	data->dai.platforms	= &comp[2];
 
 	data->dai.num_cpus	= 1;
 	data->dai.num_codecs	= 1;
-	data->dai.num_platforms	= 1;
 
 	data->dai.name = "S/PDIF PCM";
 	data->dai.stream_name = "S/PDIF PCM";
 	data->dai.codecs->dai_name = "snd-soc-dummy-dai";
 	data->dai.codecs->name = "snd-soc-dummy";
 	data->dai.cpus->of_node = spdif_np;
-	data->dai.platforms->of_node = spdif_np;
 	data->dai.playback_only = true;
 	data->dai.capture_only = true;
 
-- 
2.25.1

