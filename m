Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E6D8A774ED4
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:00:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E89B8DF5;
	Wed,  9 Aug 2023 00:59:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E89B8DF5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535624;
	bh=a5/u2O0aVtAek9pzw9n3uhzXgqcEekm6He4sPZluX90=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UgC1eAwgxqJSD4uMsIMWqFP4l3fV4/f4xIFlMvwZdTd2EccqpGeMNrBJBIKG9+W0c
	 6vsrWHixzB/mhnDFfovb5/ezXavpCWqvSl7pI+GaliRPEESCn3N3IsGVs4c0EP6eqg
	 DwHeS3saQpFy2QDVImIasPlBZ4bqFqO3IN6YYW9c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 61CD7F80571; Wed,  9 Aug 2023 00:56:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE042F80570;
	Wed,  9 Aug 2023 00:56:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C2415F805AE; Wed,  9 Aug 2023 00:56:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20719.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::719])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC15EF8060F
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:56:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC15EF8060F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QY/ea8t7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FNp6sn3FmrNQkLzYdi/WsC+YiQrFN5gaIlmU0rgQdI+TzwN4eGYoSuNMemTP9tALrsL3gVp6X/JjQ84P3tzSuLOhSv/isDNVZ6zwA2gj44ZBipjdZXqkXiMSwUeoni0D74CXeDWolukRUzFSzXkXneOx98gppXBAua0qcEeRXJb5zjDuXEToS3UfDvcUHjQlKM9g5AFh571aFGDf3pSJdnSz5wYzgWRx5wwffqJCKqST56bFKtm1XljN6ocqi65NPotrdHOtzmMRvsdRwvqLuXwXcgVeZ2hEKuSvx2EzEHg37voXwtgWcBKpnLUdFg7hdikbofRk87pzOoGe6Xe4Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=96rUUBKRpdf5pASUEXrT8TTbqCcFIbs0SqCZB1dd5pI=;
 b=dB8JpwhVqcKq1quXrlyuyNPGlc7diruAYzWaC8eV5yc4VErT/lty0oje9DSRSunehng07lnFjD1aKlUS3PUceVEcwhz5OIPIevLXLyT/k5PtLb3oH6uoWbgWCB5o6pWZdS8TlJDjddtxYfxQQ/IppBTaofkAF6gEBhofsNyjS1zkVW24xIbaHuDMCg3tmyYUd/bKQpcjOcmPCM5SdNoGkJ1nPlow2PiO6gSAa4ECDOSaqNDYaiAqDkjK43RySocF6gpUEDeBRsosondstbzLt7/YNbqC+7bQiURbolJ/G/PwczB0qkRG61stdL0NzB4h8mEwBjJyU56MAtjR20Wg7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96rUUBKRpdf5pASUEXrT8TTbqCcFIbs0SqCZB1dd5pI=;
 b=QY/ea8t7oY8w5i2ocTrcWSK9lWz0B8p/LxMeuA+vAKrt07DBgZ637Ci+6SWmXWJp7ZoNfPusDzgAsUc/lnWDOd1LZtIbWDay3sSnWMz8iFjFdPhgXUEK+0oVXMzVnDoxs9o/J7MTeq+o19Ic+y9ek1qrY6JCKlD6cpzdxO8g1sY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:56:35 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:56:35 +0000
Message-ID: <87a5v1b0ta.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 16/39] ASoC: qcom: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:56:34 +0000
X-ClientProxiedBy: TYAPR01CA0003.jpnprd01.prod.outlook.com (2603:1096:404::15)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: fafdb83a-5821-45bf-5de2-08db9862b6e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZhP5RfRgbd8BLaF7w/1YqkVPzIi5w43lK6Gi4RHI2yEnh9YfQCaMOStdG5aXTo2AGXjabGrMxBH/+YINqePmWdmG0PlL+A+HOKotou91uOzGh+ZOiCjRhxh49+Le1eRastWCx3/VZR7qSTu5Rst1rmu9UmHqvIiGTCuZxRP79XA77HDpC5lUz9ex1keDLzbKT5hcJFzg6e+ViADGL1RB0dgbFEYzOOQ/rxxldeVFwG9Dn3kdx5pzFlcbzJCWX4PE83rqUkB88TrtoO1RCTOvSD5vuGUl9CTTOq/gW5oD03C19SPUnDpjdXAkTJ1FbujpqGNuEnN1as7XWOIzE9n1n+LJqbzdHlsGXYuZezANnAP8Xjvxw5kSqCTRdeyoWbtyy+YQ84TqgqsJ8M5BeCMFVGYt1Czp8PO/E9hAm8D8Ar8AyaF6Xk0v2VZE9vW5yNiSiqStCKE+LJmWNH5TzdlsfmSREilq1gYFNxV/VH11ObvKjYW1kr6T46A1DylqrSNkX49hJjPIZL6B4Rg9pWiRKnnnSZFpN1IedBVZaB9atRz/Ij0O3achsECNAlOlI8lIZYDkUH6OdqOmg149WZGhOPtYw8pg9B92xcO8lra5ADfv8gZtbM0DLdEMyqHPvrU0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(30864003)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Y4zNhjiIZUtnpLiIsmRuuumMQ7d9T2GKAT4Q6thPXi/7Tl5CT19Fm5JTrOY6?=
 =?us-ascii?Q?w73/pWmg+oAdEvBwdWqLudK+0ONLB3UuGytrlYXmYOJFSOqidRtcrjWWPxI0?=
 =?us-ascii?Q?xE4GG1pzoK8wpyXNHVTQx4qIOJZ+ZxXgp0m+ps7A6RLlNwKVBchVyCO3PRdm?=
 =?us-ascii?Q?nKt14FFsOfEiizjikM7BZM6ZTzz3m6CmHpcgQFr+EahV5tm7JswZO+QDFvBJ?=
 =?us-ascii?Q?L7anQOEiOUIil1sAZFGAdjzRNwpdqzoKlYn39h6XJM/tbcWpn9nl+NXvzny2?=
 =?us-ascii?Q?/tTEfBbXC8MgOPCRhxwzi5ltk/alsolY7MOOIpPAzFp+94ryAKD1A2l+MRSr?=
 =?us-ascii?Q?ZGRqszQXHBBMJLWM6Zg4hkrdjm7YEZByemJ7Pzlr7ZwiO60FlxhSI+XZnBgi?=
 =?us-ascii?Q?VRKLR/yKrryj0UFCFPKwPgWeuWuP7ZMtcVhAP3xeq5G2yUlZJ1Jvc3kR7BUI?=
 =?us-ascii?Q?cVjCXWcNJC4TDZs/f3jJE+d3KhiGlu0wM0FPw4QC4BZu5i58lTbSd0jAa6FC?=
 =?us-ascii?Q?Nz/6Z1JMvyeayeVC+5jsIkKEiJf4FV8O9ulZBFMGRRLDpPldRe1he9xN4i7s?=
 =?us-ascii?Q?LvZqK+wb5pV7Wkgx6uBFq4G9Uz3vsymDkCw8igXVymxJdmektZh0USXES9Qo?=
 =?us-ascii?Q?PnuqVqwEJrJTP9OuQHIteNBqO+LROLT0W3yF3vitI9OK0x8f7FDOuTSv+KI8?=
 =?us-ascii?Q?8PNfkBi8mthNNt+8v/uqU8pEwr3ARa/udbtYZlKBbCp/2bIArDggpXlYDxqF?=
 =?us-ascii?Q?YMFrHmkSvZeqmXTf80MpjYMB95ABrAFzWzjVf4ufhO3/5l0yoe0q/QtRGSSu?=
 =?us-ascii?Q?/kmqCU4kCdBwt0405pgUMlNidJP0yIoXQtOW2vp4RkeLkIwRbOB4pAHzn0So?=
 =?us-ascii?Q?BB1/28Hg5OFdD4W7h5Z8xbcpMV57og6Rr3xtsJ2y+Xr5yTe4Tw3IP7BEUtBz?=
 =?us-ascii?Q?fSCFL1fBO4i57eIlw4Ec90Uwv7jy1YSpaJMI+LWGaH93eANpfsw2VbgGQyYh?=
 =?us-ascii?Q?55iSEsd0w67+KZoYAmxcpne/ZCS4iDBxQCzJoNT8ijIZzCv/cX5DAPRmStaV?=
 =?us-ascii?Q?VRqSO956sHvQwBxSTFSqbajVhs3NkFTT0V7kWSwgEyCtNjHI7jdh/dgVYEx2?=
 =?us-ascii?Q?a6OrqCmJefRJsrN4UMtFc1n1u2q2beYK5VZHkOxCahL1fCAM6MQfXOajeCdu?=
 =?us-ascii?Q?mt8C9Y5ANxpLOk8XrUYOLwIKL3QqSC4uwblL6cfeEwFJWSS7u0QPcHQQlHy5?=
 =?us-ascii?Q?TrectOxgVhoFqdDW/cEafWWwF2SHU5B1FOMdWUOUATkVRD+6A87DEXM60zfe?=
 =?us-ascii?Q?pE1gdHdlm+xjast0/84k74mcy3Oeervl224avRotGJZIRLo+US13KnAg9swl?=
 =?us-ascii?Q?aP9+hVLlBj+uoso2Y7qCDBbaIp01nKknjMtQOGbwDTRYZX0NsFb+uKuz3Jcu?=
 =?us-ascii?Q?Bws9uvxXAposUqsUr59Z8SIRejHiSfuM75RbLOoztdoflg90hTzAjI1s2RBs?=
 =?us-ascii?Q?wwxN50HTRH87f7zGX4XEEUrDKDwM3mU0KZPmod87kCIsD/nrR5SjEh0fTy67?=
 =?us-ascii?Q?n0hced3oigcddfQcR8H7Rth8ez4t/MVhWHP/YimoKEoYvPaJcrRQc8bJOsP+?=
 =?us-ascii?Q?/Gg4wVrxDddAwNfnj6vCP04=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 fafdb83a-5821-45bf-5de2-08db9862b6e9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:56:35.4376
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UlYNY4KO3EioijcnG/BtQDiTQALedMA5knCJhs+v4Uz6Dy/42ddDRsrj87uuhtuVK6SCvAldMV66t0TUpP6TdDKZ+AIcfc2k1+lYr53DinRdl2YdrPmM46E8LXMh7y10
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: 5S7YJ43IIZKROJE765WTJHQBXVZO56PT
X-Message-ID-Hash: 5S7YJ43IIZKROJE765WTJHQBXVZO56PT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5S7YJ43IIZKROJE765WTJHQBXVZO56PT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/qcom/lpass-apq8016.c           |  4 --
 sound/soc/qcom/lpass-cpu.c               | 40 +++++++----
 sound/soc/qcom/lpass-ipq806x.c           |  1 -
 sound/soc/qcom/lpass-sc7180.c            |  5 +-
 sound/soc/qcom/lpass-sc7280.c            |  2 -
 sound/soc/qcom/lpass.h                   |  4 +-
 sound/soc/qcom/qdsp6/q6afe-dai.c         | 88 +++++++++++++-----------
 sound/soc/qcom/qdsp6/q6asm-dai.c         |  6 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c |  3 -
 9 files changed, 80 insertions(+), 73 deletions(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index abaf694ee9a3..f919d46e18ca 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -41,7 +41,6 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
 			.channels_min	= 1,
 			.channels_max	= 8,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	},
 	[MI2S_SECONDARY] =  {
@@ -62,7 +61,6 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
 			.channels_min	= 1,
 			.channels_max	= 8,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	},
 	[MI2S_TERTIARY] =  {
@@ -83,7 +81,6 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
 			.channels_min	= 1,
 			.channels_max	= 8,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	},
 	[MI2S_QUATERNARY] =  {
@@ -119,7 +116,6 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
 			.channels_min	= 1,
 			.channels_max	= 8,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	},
 };
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index dbdaaa85ce48..39571fed4001 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -404,18 +404,7 @@ static int lpass_cpu_daiops_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
-	.set_sysclk	= lpass_cpu_daiops_set_sysclk,
-	.startup	= lpass_cpu_daiops_startup,
-	.shutdown	= lpass_cpu_daiops_shutdown,
-	.hw_params	= lpass_cpu_daiops_hw_params,
-	.trigger	= lpass_cpu_daiops_trigger,
-	.prepare	= lpass_cpu_daiops_prepare,
-};
-EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
-
-int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
-				struct snd_soc_dai *dai)
+static int lpass_cpu_daiops_pcm_new(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	int ret;
 	struct snd_soc_dai_driver *drv = dai->driver;
@@ -431,9 +420,8 @@ int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(lpass_cpu_pcm_new);
 
-int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
+static int lpass_cpu_daiops_probe(struct snd_soc_dai *dai)
 {
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
 	int ret;
@@ -446,7 +434,29 @@ int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai)
 
 	return ret;
 }
-EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_probe);
+
+const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops = {
+	.probe		= lpass_cpu_daiops_probe,
+	.set_sysclk	= lpass_cpu_daiops_set_sysclk,
+	.startup	= lpass_cpu_daiops_startup,
+	.shutdown	= lpass_cpu_daiops_shutdown,
+	.hw_params	= lpass_cpu_daiops_hw_params,
+	.trigger	= lpass_cpu_daiops_trigger,
+	.prepare	= lpass_cpu_daiops_prepare,
+};
+EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops);
+
+const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops2 = {
+	.pcm_new	= lpass_cpu_daiops_pcm_new,
+	.probe		= lpass_cpu_daiops_probe,
+	.set_sysclk	= lpass_cpu_daiops_set_sysclk,
+	.startup	= lpass_cpu_daiops_startup,
+	.shutdown	= lpass_cpu_daiops_shutdown,
+	.hw_params	= lpass_cpu_daiops_hw_params,
+	.trigger	= lpass_cpu_daiops_trigger,
+	.prepare	= lpass_cpu_daiops_prepare,
+};
+EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops2);
 
 static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
 				   const struct of_phandle_args *args,
diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
index ef8a7984f232..2c97f295e394 100644
--- a/sound/soc/qcom/lpass-ipq806x.c
+++ b/sound/soc/qcom/lpass-ipq806x.c
@@ -51,7 +51,6 @@ static struct snd_soc_dai_driver ipq806x_lpass_cpu_dai_driver = {
 		.channels_min	= 1,
 		.channels_max	= 8,
 	},
-	.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 	.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 };
 
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 56db852f4eab..d16c0d83aaad 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -43,7 +43,6 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
 			.channels_min	= 2,
 			.channels_max	= 2,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	}, {
 		.id = MI2S_SECONDARY,
@@ -57,9 +56,7 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
 			.channels_min	= 2,
 			.channels_max	= 2,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
-		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
-		.pcm_new = lpass_cpu_pcm_new,
+		.ops    = &asoc_qcom_lpass_cpu_dai_ops2,
 	}, {
 		.id = LPASS_DP_RX,
 		.name = "Hdmi",
diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index bcf18fe8e14d..6b2eb25ed939 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -38,7 +38,6 @@ static struct snd_soc_dai_driver sc7280_lpass_cpu_dai_driver[] = {
 			.channels_min	= 2,
 			.channels_max	= 2,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops    = &asoc_qcom_lpass_cpu_dai_ops,
 	}, {
 		.id = MI2S_SECONDARY,
@@ -52,7 +51,6 @@ static struct snd_soc_dai_driver sc7280_lpass_cpu_dai_driver[] = {
 			.channels_min	= 2,
 			.channels_max	= 2,
 		},
-		.probe	= &asoc_qcom_lpass_cpu_dai_probe,
 		.ops	= &asoc_qcom_lpass_cpu_dai_ops,
 	}, {
 		.id = LPASS_DP_RX,
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index dd78600fc7b0..bdfe66ec3314 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -402,10 +402,8 @@ int asoc_qcom_lpass_platform_register(struct platform_device *);
 int asoc_qcom_lpass_cpu_platform_remove(struct platform_device *pdev);
 void asoc_qcom_lpass_cpu_platform_shutdown(struct platform_device *pdev);
 int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev);
-int asoc_qcom_lpass_cpu_dai_probe(struct snd_soc_dai *dai);
 extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops;
-int lpass_cpu_pcm_new(struct snd_soc_pcm_runtime *rtd,
-				struct snd_soc_dai *dai);
+extern const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops2;
 extern const struct snd_soc_dai_ops asoc_qcom_lpass_cdc_dma_dai_ops;
 
 #endif /* __LPASS_H__ */
diff --git a/sound/soc/qcom/qdsp6/q6afe-dai.c b/sound/soc/qcom/qdsp6/q6afe-dai.c
index dbff55a97162..3faa7e0eb0dd 100644
--- a/sound/soc/qcom/qdsp6/q6afe-dai.c
+++ b/sound/soc/qcom/qdsp6/q6afe-dai.c
@@ -619,44 +619,6 @@ static const struct snd_soc_dapm_route q6afe_dapm_routes[] = {
 	{"RX_CODEC_DMA_RX_7 Playback", NULL, "RX_CODEC_DMA_RX_7"},
 };
 
-static const struct snd_soc_dai_ops q6hdmi_ops = {
-	.prepare	= q6afe_dai_prepare,
-	.hw_params	= q6hdmi_hw_params,
-	.shutdown	= q6afe_dai_shutdown,
-};
-
-static const struct snd_soc_dai_ops q6i2s_ops = {
-	.prepare	= q6afe_dai_prepare,
-	.hw_params	= q6i2s_hw_params,
-	.set_fmt	= q6i2s_set_fmt,
-	.shutdown	= q6afe_dai_shutdown,
-	.set_sysclk	= q6afe_mi2s_set_sysclk,
-};
-
-static const struct snd_soc_dai_ops q6slim_ops = {
-	.prepare	= q6afe_dai_prepare,
-	.hw_params	= q6slim_hw_params,
-	.shutdown	= q6afe_dai_shutdown,
-	.set_channel_map = q6slim_set_channel_map,
-};
-
-static const struct snd_soc_dai_ops q6tdm_ops = {
-	.prepare	= q6afe_dai_prepare,
-	.shutdown	= q6afe_dai_shutdown,
-	.set_sysclk	= q6afe_mi2s_set_sysclk,
-	.set_tdm_slot     = q6tdm_set_tdm_slot,
-	.set_channel_map  = q6tdm_set_channel_map,
-	.hw_params        = q6tdm_hw_params,
-};
-
-static const struct snd_soc_dai_ops q6dma_ops = {
-	.prepare	= q6afe_dai_prepare,
-	.shutdown	= q6afe_dai_shutdown,
-	.set_sysclk	= q6afe_mi2s_set_sysclk,
-	.set_channel_map  = q6dma_set_channel_map,
-	.hw_params        = q6dma_hw_params,
-};
-
 static int msm_dai_q6_dai_probe(struct snd_soc_dai *dai)
 {
 	struct q6afe_dai_data *dai_data = dev_get_drvdata(dai->dev);
@@ -682,6 +644,54 @@ static int msm_dai_q6_dai_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops q6hdmi_ops = {
+	.probe			= msm_dai_q6_dai_probe,
+	.remove			= msm_dai_q6_dai_remove,
+	.prepare		= q6afe_dai_prepare,
+	.hw_params		= q6hdmi_hw_params,
+	.shutdown		= q6afe_dai_shutdown,
+};
+
+static const struct snd_soc_dai_ops q6i2s_ops = {
+	.probe			= msm_dai_q6_dai_probe,
+	.remove			= msm_dai_q6_dai_remove,
+	.prepare		= q6afe_dai_prepare,
+	.hw_params		= q6i2s_hw_params,
+	.set_fmt		= q6i2s_set_fmt,
+	.shutdown		= q6afe_dai_shutdown,
+	.set_sysclk		= q6afe_mi2s_set_sysclk,
+};
+
+static const struct snd_soc_dai_ops q6slim_ops = {
+	.probe			= msm_dai_q6_dai_probe,
+	.remove			= msm_dai_q6_dai_remove,
+	.prepare		= q6afe_dai_prepare,
+	.hw_params		= q6slim_hw_params,
+	.shutdown		= q6afe_dai_shutdown,
+	.set_channel_map	= q6slim_set_channel_map,
+};
+
+static const struct snd_soc_dai_ops q6tdm_ops = {
+	.probe			= msm_dai_q6_dai_probe,
+	.remove			= msm_dai_q6_dai_remove,
+	.prepare		= q6afe_dai_prepare,
+	.shutdown		= q6afe_dai_shutdown,
+	.set_sysclk		= q6afe_mi2s_set_sysclk,
+	.set_tdm_slot		= q6tdm_set_tdm_slot,
+	.set_channel_map	= q6tdm_set_channel_map,
+	.hw_params		= q6tdm_hw_params,
+};
+
+static const struct snd_soc_dai_ops q6dma_ops = {
+	.probe			= msm_dai_q6_dai_probe,
+	.remove			= msm_dai_q6_dai_remove,
+	.prepare		= q6afe_dai_prepare,
+	.shutdown		= q6afe_dai_shutdown,
+	.set_sysclk		= q6afe_mi2s_set_sysclk,
+	.set_channel_map	= q6dma_set_channel_map,
+	.hw_params		= q6dma_hw_params,
+};
+
 static const struct snd_soc_dapm_widget q6afe_dai_widgets[] = {
 	SND_SOC_DAPM_AIF_IN("HDMI_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
 	SND_SOC_DAPM_AIF_IN("SLIMBUS_0_RX", NULL, 0, SND_SOC_NOPM, 0, 0),
@@ -1041,8 +1051,6 @@ static int q6afe_dai_dev_probe(struct platform_device *pdev)
 	dev_set_drvdata(dev, dai_data);
 	of_q6afe_parse_dai_data(dev, dai_data);
 
-	cfg.probe = msm_dai_q6_dai_probe;
-	cfg.remove = msm_dai_q6_dai_remove;
 	cfg.q6hdmi_ops = &q6hdmi_ops;
 	cfg.q6slim_ops = &q6slim_ops;
 	cfg.q6i2s_ops = &q6i2s_ops;
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 5fc8088e63c8..fe0666e9fd23 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -1230,6 +1230,10 @@ static struct snd_soc_dai_driver q6asm_fe_dais_template[] = {
 	Q6ASM_FEDAI_DRIVER(8),
 };
 
+static const struct snd_soc_dai_ops q6asm_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static int of_q6asm_parse_dai_data(struct device *dev,
 				    struct q6asm_dai_data *pdata)
 {
@@ -1272,7 +1276,7 @@ static int of_q6asm_parse_dai_data(struct device *dev,
 			dai_drv->playback = empty_stream;
 
 		if (of_property_read_bool(node, "is-compress-dai"))
-			dai_drv->compress_new = snd_soc_new_compress;
+			dai_drv->ops = &q6asm_dai_ops;
 	}
 
 	return 0;
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
index ac937a6bf909..4919001de08b 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-ports.c
@@ -603,9 +603,6 @@ struct snd_soc_dai_driver *q6dsp_audio_ports_set_config(struct device *dev,
 	int i;
 
 	for (i = 0; i  < ARRAY_SIZE(q6dsp_audio_fe_dais); i++) {
-		q6dsp_audio_fe_dais[i].probe = cfg->probe;
-		q6dsp_audio_fe_dais[i].remove = cfg->remove;
-
 		switch (q6dsp_audio_fe_dais[i].id) {
 		case HDMI_RX:
 		case DISPLAY_PORT_RX:
-- 
2.25.1

