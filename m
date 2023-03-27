Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4DB6C98F0
	for <lists+alsa-devel@lfdr.de>; Mon, 27 Mar 2023 02:12:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18AA0E12;
	Mon, 27 Mar 2023 02:11:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18AA0E12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679875942;
	bh=wUoAd9hEYtCCHjoXBa+rpbbaqf7zK2g622k+xlukn8I=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oO42VkZMyYF8jlVC+zSslYlCozOb/mpbxbSVpIpMrRpMkXdeMjFqUuPeJik/pW1X0
	 T/mrHJKVOA01F9Z9PiAhMVNNZRcQFoR4adpGyiqgtjtkj1wjVZ37VcMWdxmrx4FJcN
	 lLzrC0alrQcLG7C81oLCd1YHUE2RJXcqUsxkAgXo=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EBA13F8055A;
	Mon, 27 Mar 2023 02:10:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E360FF80549; Mon, 27 Mar 2023 02:10:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1C16CF80423
	for <alsa-devel@alsa-project.org>; Mon, 27 Mar 2023 02:10:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C16CF80423
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Au95Et7Q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XAmmaRo20d+Ndbvj57CHEkINpKmYsWQeTZXZAMTpskEe1LAImjVf+jN9UKuds97C4cVGlzo9I2a170y4U+q+a5CeUK/U0AVoMpEK+J/7AJK6pWfeGf7bYDdUeVCTFoSLK2cXK8SPFwQW0j47jTWMcqVeUoSnqP4Z0+JFkCmC+ArBbHkiT4V/QwL18LwoeIKPGpw4hF7xYgeUdN1bBqLLmYwbeGdIWu8X49zKrcDwpxfjIi8Lrbh3csWphLfDBg+0r2KgPM8pxRNImZEFmC1C9sxYBOJFyGmcGquStS0Tnv5rQSz4xm8xEzekEVllMpQSFSBF9yvU1rqPT5PGddZaPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=51JGaRFzod/4roMBI/XziUQp2Ibk5bMNSzubOQdKKwQ=;
 b=czNo9SsusHmitgCibLWJfwxbges/NCTm7xBhIjK801oqTdbZoz1ZpwsUFQcr8/haROsJiZhSYbMB/188olL4P87fLcABxAtXm24loostdX5C78DQuYGWo5o/dZfdhs/qsQ+trnfAFMsRlupzdwFVTazuwUsYhr7wMZHhIz70H1q6PRolzbAoCXosH2Fxixya8hn9HDnb+vOBJW9fHy58UQvWdj9PMBW1acihIxQ5NoyIM29SyiRJf1CRc0MUh5/FMOZyOFd1cx4T9ZL475hUAi+Vzmwv8ior2eFh0A6MSquO1zuBQcn4aUXODZdm5MV1SCFdKvaDH2ylF/HE4w1LWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=51JGaRFzod/4roMBI/XziUQp2Ibk5bMNSzubOQdKKwQ=;
 b=Au95Et7Qo+GGyjD+dxXDelEa3p60IONd/Hamamq+jzL5EtI+79J/X2nI5txi50UnSJ+M7dCtrr17vtdLJfLqJrjP0LwXTTwodEFMlOA2MgyTKoH+vnr+HXKB0mSpElXByOXn2/D6eD//bnBLN2OlbGM8yGkCzf6FdQt6fucVz1I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11465.jpnprd01.prod.outlook.com (2603:1096:400:402::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.29; Mon, 27 Mar
 2023 00:10:16 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6222.030; Mon, 27 Mar 2023
 00:10:16 +0000
Message-ID: <87lejj6om1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 4/5] ASoC: samsung: switch to use c2c_params instead of params
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0tb6ond.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 27 Mar 2023 00:10:15 +0000
X-ClientProxiedBy: TYCP286CA0261.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11465:EE_
X-MS-Office365-Filtering-Correlation-Id: 595261f1-190c-4eac-da4a-08db2e57a406
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	thmozFis7Qmio29pgjgHRhohJjq2Z9dI5wswu6hM90jgVIk7KLqh+wbe5eCgbTLI0fnKNpDo41k1IA1aDlqLZv7bkNLDynmmxBl0rSMWFpj6WU7ojwQQ7hQLzjM3T9+eyNY2xrotXDvdy35k61XbcCSvjVfMEaaCm+1uZpj+Gjyjj9pRF2JqAJ8EoAPO5kW8O2L4l/+PXfKgroWwshclZI/tvoGr9AB27FbW2tddtOUFwUZUzJTa3vDZD10VS6ZL5I9fryZdC97U8HzDalVY+73eaS2I8n8sR+DsgKO04oQHPH2XcRDt0u6r9NJnU7ymCGLuDur3QP0C0G/qJcZVJY5J2oYR/YhTJ28FjrclPzzmaSmfN6/otJOCA2ZOMvUMMAWsNkZ0KqKM2OyGyQOOaO0zksDZkSK0sLlIcjhQP32yiqVp42AEaXcUcg0W8Bh4e60UcDV7kXgxdRDuWkkRDIWCRDnQmPNDM32G4cuTs+8FfGjJ0YkzpzyjxTcDfzEIjdG7nnqtx+gfTRpLEhDp8U1VwRKhJyqkI7pxE+ojpTJlYSyfdXkF5n3dwjiONsAFJI5EbtpsPxxfE0+5C0AiWnRhOO9iigLdXgAi7SSbhV1yq3CWyLVgPPHt4gWk+Miv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199021)(83380400001)(2616005)(4326008)(66476007)(66946007)(66556008)(6916009)(8676002)(6486002)(478600001)(52116002)(6512007)(26005)(186003)(6506007)(316002)(2906002)(36756003)(86362001)(41300700001)(38100700002)(38350700002)(5660300002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XBP/if0rFakoFTmpREUYXb661DrTTAvfovm1rBFOUrfTGATo1UBJf13IRdr/?=
 =?us-ascii?Q?gDOCk1NdoRtrpgRBiQ7GNfVCW24vr0qj90vdhAvQbFn2yESaHxuMlYxVqZZY?=
 =?us-ascii?Q?ME8SpDWw5YjlrgKKA/cH519cqr9Wk1atn0dUyoGK0ed2vqv8MH8y6G5yqe6n?=
 =?us-ascii?Q?AGIKhRPKB3lAm3q/HkGr7ODGZeUUlvThSwdG023do2pFtIRmNzouGm8hYRe2?=
 =?us-ascii?Q?OhiszSYbV0mnPveMKsPxNW3gTRcH/UxOFeMgMgfPPBGle4ip4nG2OZnaD+Li?=
 =?us-ascii?Q?TbBAiO9Xw4i7/kpIr8E1VHp9jmrmM+68i7560CEesgdn2XK9RgIFiAT4kk7y?=
 =?us-ascii?Q?pSVWwGpZ2RloxPN22u4+1VACh6bZW9HB8ll7I+2T0s6YbvATeDNDD/ZjhS25?=
 =?us-ascii?Q?IJthI0qDjh1qG7DhCTRPSvohJwAqJRNdp43VdCueoMx8XgxruFoqQE0lPTXy?=
 =?us-ascii?Q?WHdNa6E5XZzEyrGFHGn13hr24rUn3pfCG9xO+6MFbTPwY9egwJoqaozRvE7+?=
 =?us-ascii?Q?emzs+omB9HA6OXKJfSgqA2zeGu9o2L9l3IQZ+SWjs/qRx0ZmS1kPc71jvGk0?=
 =?us-ascii?Q?MumLRNkj7OIwQrPc/dl8budwSwnlEJXVmtPZh+hRNfREYpEHwf+JJ2tGDEiK?=
 =?us-ascii?Q?ZSth8mmMcO27IopFcnqOQ9gW/P3tmnS7azTcBYl+DdEczEr3uqKk96CAwPJ0?=
 =?us-ascii?Q?OGZ70qG7naDzNtLhA3+TTehJxOCtpNLvWBuJXhFUWyms0+Bgc26CbEx/ezuq?=
 =?us-ascii?Q?DiQAtzTSNv3CyGvF6DP7aqrWmh2VKP9Ebr8CkhjIbrB6PXN9c5lK7/P3TrjO?=
 =?us-ascii?Q?amMbu1t9dLDwIuiXUkXnOx5FSvtS7sF/q4vdbY/8bi7WQapjZqYLc31omzeM?=
 =?us-ascii?Q?7gqWL6TgNaf9nB9fcNCmcMclqqCbCYlhFCvRKjIdrivzOmvyDaSr03xy04LX?=
 =?us-ascii?Q?jjXPvK/K39NYNNhBZnsYIkIlXgAdOl2+bA7LPrt1S9riaHyD/B0VCMJcy92V?=
 =?us-ascii?Q?d80QMjoUWMEXXTYdQ4f8Ol6RbHpf8XjffCC7r7vmbhgwueHQgMo9FHKqwVjK?=
 =?us-ascii?Q?ayl8MCtlHz/7znKzA/ydgPRJDGDrTl6TCWFFNuZLgH8VbiedV/+rUQSVbwRF?=
 =?us-ascii?Q?lFaTIowTxczQtDObpE1f/S3taB7uwR1EUpx1IJ3s5PKMTrEXyDz0POhfkrUH?=
 =?us-ascii?Q?zgcUYMGcvw0N7dWCcm+fxZ/C1vMgFec+A3LXkDpPFd3NOes6K6mJ1k17pvAX?=
 =?us-ascii?Q?foqbCcni/g27ATFpkWKRBV8Twc84FNwBMCXZ15egCvpHEgQdrpw1VJKlGmQw?=
 =?us-ascii?Q?P0zGt6obQ3YLKZ0YNRZlcIkRkTMR9uQIxLu2NXPuHQsvWC2gAYG7H+LYXSfr?=
 =?us-ascii?Q?IHQiQzVBWHZ7p89ITjvOB7YAdnTqsNJGhZwZCR4V5nLlbx0MVVnnuiYtToom?=
 =?us-ascii?Q?VRH/1RPZtgK85oq2l1vj+o6PIBFTxqjKaDy6uOc/cKo+oNB8XWocxJrik7Wa?=
 =?us-ascii?Q?3SUTk3T2u6PGH3VQ44zjJvLIaaS4nENEBpdY5LDJf8kAnAeewC0jYFTUonn4?=
 =?us-ascii?Q?foIjW11ZvrQyc8vRngH/zg7bwRwumKJ8vky7YMjy/RSRTN3yEr7G5h8TesxQ?=
 =?us-ascii?Q?zJqCtJXEgMRvVA7JOLgrc4A=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 595261f1-190c-4eac-da4a-08db2e57a406
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2023 00:10:16.0144
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 fZPgTfOKr50TdFN7UEq9F3n3fMU9kdadB1shZBG72R0bZ+Z9/ihI3oQQvzfV6T9dDUJzMCK7CGWa7ejmFBUWBnwRCILlxzz1aySqWf3GkCjqLPYUxlsm2XJGVujAJdEp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11465
Message-ID-Hash: M2QY6ETJXU6JEMVO32XU6SRYLDVYPSMO
X-Message-ID-Hash: M2QY6ETJXU6JEMVO32XU6SRYLDVYPSMO
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2QY6ETJXU6JEMVO32XU6SRYLDVYPSMO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now using c2c_params instead of params. This patch replace it.
num_c2c_params (was num_params) was not mandatory before,
but let's set it by this patch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/samsung/aries_wm8994.c |  6 ++++--
 sound/soc/samsung/bells.c        | 21 ++++++++++++++-------
 sound/soc/samsung/littlemill.c   |  3 ++-
 sound/soc/samsung/lowland.c      |  3 ++-
 sound/soc/samsung/speyside.c     |  3 ++-
 5 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index 0fbbf3b02c09..7492bb41456c 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -483,14 +483,16 @@ static struct snd_soc_dai_link aries_dai[] = {
 		.name = "WM8994 AIF2",
 		.stream_name = "Baseband",
 		.init = &aries_baseband_init,
-		.params = &baseband_params,
+		.c2c_params = &baseband_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(baseband),
 	},
 	{
 		.name = "WM8994 AIF3",
 		.stream_name = "Bluetooth",
-		.params = &bluetooth_params,
+		.c2c_params = &bluetooth_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(bluetooth),
 	},
diff --git a/sound/soc/samsung/bells.c b/sound/soc/samsung/bells.c
index 76998a4a4cad..70b63d4faa99 100644
--- a/sound/soc/samsung/bells.c
+++ b/sound/soc/samsung/bells.c
@@ -264,7 +264,8 @@ static struct snd_soc_dai_link bells_dai_wm2200[] = {
 		.stream_name = "DSP-CODEC",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(wm2200_dsp_codec),
 	},
@@ -300,7 +301,8 @@ static struct snd_soc_dai_link bells_dai_wm5102[] = {
 		.stream_name = "DSP-CODEC",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(wm5102_dsp_codec),
 	},
@@ -310,7 +312,8 @@ static struct snd_soc_dai_link bells_dai_wm5102[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
-		.params = &baseband_params,
+		.c2c_params = &baseband_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(wm5102_baseband),
 	},
 	{
@@ -319,7 +322,8 @@ static struct snd_soc_dai_link bells_dai_wm5102[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_suspend = 1,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(wm5102_sub),
 	},
 };
@@ -355,7 +359,8 @@ static struct snd_soc_dai_link bells_dai_wm5110[] = {
 		.stream_name = "DSP-CODEC",
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(wm5110_dsp_codec),
 	},
@@ -365,7 +370,8 @@ static struct snd_soc_dai_link bells_dai_wm5110[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
-		.params = &baseband_params,
+		.c2c_params = &baseband_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(wm5110_baseband),
 	},
 	{
@@ -374,7 +380,8 @@ static struct snd_soc_dai_link bells_dai_wm5110[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBS_CFS,
 		.ignore_suspend = 1,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(wm5110_sub),
 	},
 };
diff --git a/sound/soc/samsung/littlemill.c b/sound/soc/samsung/littlemill.c
index 411e25cec591..5d8118e69359 100644
--- a/sound/soc/samsung/littlemill.c
+++ b/sound/soc/samsung/littlemill.c
@@ -167,7 +167,8 @@ static struct snd_soc_dai_link littlemill_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
-		.params = &baseband_params,
+		.c2c_params = &baseband_params,
+		.num_c2c_params = 1,
 		SND_SOC_DAILINK_REG(baseband),
 	},
 };
diff --git a/sound/soc/samsung/lowland.c b/sound/soc/samsung/lowland.c
index b44f5e92224f..106770be6fc5 100644
--- a/sound/soc/samsung/lowland.c
+++ b/sound/soc/samsung/lowland.c
@@ -119,7 +119,8 @@ static struct snd_soc_dai_link lowland_dai[] = {
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBM_CFM,
 		.ignore_suspend = 1,
-		.params = &sub_params,
+		.c2c_params = &sub_params,
+		.num_c2c_params = 1,
 		.init = lowland_wm9081_init,
 		SND_SOC_DAILINK_REG(speaker),
 	},
diff --git a/sound/soc/samsung/speyside.c b/sound/soc/samsung/speyside.c
index 69d7b0115b38..22e2ad63d64d 100644
--- a/sound/soc/samsung/speyside.c
+++ b/sound/soc/samsung/speyside.c
@@ -219,7 +219,8 @@ static struct snd_soc_dai_link speyside_dai[] = {
 		.init = speyside_wm8996_init,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
 				| SND_SOC_DAIFMT_CBM_CFM,
-		.params = &dsp_codec_params,
+		.c2c_params = &dsp_codec_params,
+		.num_c2c_params = 1,
 		.ignore_suspend = 1,
 		SND_SOC_DAILINK_REG(dsp_codec),
 	},
-- 
2.25.1

