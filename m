Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7EA7E9425
	for <lists+alsa-devel@lfdr.de>; Mon, 13 Nov 2023 02:37:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 17F6A850;
	Mon, 13 Nov 2023 02:36:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 17F6A850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1699839429;
	bh=/0f7m6PIcpr8XOnO4Wd876+kKDiNkuQ1f8lyidbS5Do=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PJpJBM5+zs1u82/UKtBPvh2JeJHsJVXz2cFD5eiLowsR5lJcXQjU4whYS9mH9PO4d
	 eJ9w6SwKjaJdM0xX7mAMT6dAQtNpsOqW3x1acgd6RaImybEaNDOMtTvNMTnvltz2iY
	 q3v0dsZwtmE3XoHI7cpAQzKkCSYW+yFP9Er4Ct/s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DA5BBF80567; Mon, 13 Nov 2023 02:35:42 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E6C32F8022B;
	Mon, 13 Nov 2023 02:35:41 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A58D1F8022B; Mon, 13 Nov 2023 02:28:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 46EC5F80093
	for <alsa-devel@alsa-project.org>; Mon, 13 Nov 2023 02:28:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 46EC5F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=KPpbdZgV
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=etQ2GglWWVbN8VD/asA2fSHh6+HOZwjty4Gliqpf15TTsuQDJzIA5RkACkenU6I32uN93UHIwn0PF+D0BZIH0qgSR8Wd22Y5l9sZr0n+gVyeFR8ozAIqyf5M9M6VW05rh/+JQ1o2vAQBsaKVw6ldIC5g1MOGgbYXl8UIVGUpRZWIbelaUhLE7w9jzEfhmLBKoV6ojd6E8XgZ997hUKn2k1lgPevECVMGhULx+AKfltJvajecnqYjw4XQiR1eA1pIezBvZx5Ln4IJn7f1VBurFh53wwg996RrzhFPc6Kob4dUp+iy8sukppqxHIzH9EEWdIKwhv/lDYisQ/ubWOKjfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ScQQmUvxZsGFl2qHlhe4ForwpU8X7VsxFBnnDeKTmns=;
 b=emr05Pi/SCLOFDNl76GG0wQL7XNRGJcqgg2bjo6z8yKLsndKrw51hnCcbHhWbdnvNGJw8rx4OIUtomJAgeMnyKYpGEVCb3OSNwauGp2Y38LhAPmcbDQDhHnHXDkpE8gvrFeNluno0sEr2g1ia4u02MlVoyUPILU/sOnmD9IK/r4ngOpz7NaTbnMLnuV9bbsPqx/QKdcLRI4Y65+mU4GhXwEC/kDCBncXykSMNbWvR6Z9Ml2/Tfn3wlyyCyeR1HRCPXESxXboCnrOB5inuiJHo84Ct8zGOZApI577yROZkOiDBVvzknUjy729MfzDDMgyASurpySeP2LqF9Kq4KGXxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ScQQmUvxZsGFl2qHlhe4ForwpU8X7VsxFBnnDeKTmns=;
 b=KPpbdZgVhzTKs0pviyszqfG0CRD6xMl/P32bxPDqYC1D65BV4uHo2m+zCYuFfKoDo8khlFE9CgpbBjU6yEby6tN/ApxSQ8LuHiI4OEJ2K+6w8FGY8ylV4ODhb/9odmOqsQgignXh6H16To5wOcWDcs6JQ1ntcWCk91TxnFH82uo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com (2603:1096:603:1a::14)
 by TYCPR01MB10494.jpnprd01.prod.outlook.com (2603:1096:400:306::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.29; Mon, 13 Nov
 2023 01:28:28 +0000
Received: from OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d]) by OSAPR01MB2178.jpnprd01.prod.outlook.com
 ([fe80::173f:d892:3d66:397d%4]) with mapi id 15.20.6977.029; Mon, 13 Nov 2023
 01:28:28 +0000
Message-ID: <87ttpq4f2c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v7 1/5] ASoC: makes CPU/Codec channel connection map more
 generic
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	bard.liao@intel.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jerome Brunet <jbrunet@baylibre.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
In-Reply-To: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
References: <87v8a64f3d.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 13 Nov 2023 01:28:27 +0000
X-ClientProxiedBy: TYCP286CA0170.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c6::11) To OSAPR01MB2178.jpnprd01.prod.outlook.com
 (2603:1096:603:1a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSAPR01MB2178:EE_|TYCPR01MB10494:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b72b41c-adde-4b42-7ea2-08dbe3e7d6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	W5H2Yt0Hoi9Bjsu2IGUzXxP6JWKr7qPtlcWuU7e/JD/77fTiFPoTycMhJMnstxpOloU8hJy1JTnTBN2eQCK8TFyMb0/rSiRUcDTnmaA+EDKTRoAgxYpTaXNYi8QSOQwFXZ9aussh29VjhzYy/cWyF+jTJ6XoWqPredTzeMgoP8oEDpK9qrDnFLo5nRsvh8GqXgdeIR0cEPcmY2KD+KfadyGJ3ZOTFsGOQVdq9hI9TZ66f/XEwD6/DO7SVIQTpdhQH3HpZGnpDR5wXamfZXg9FQ0MDjg8QO4Ij9X+iyduypCpmKLRE03Nac1J8NCTkRNkeWsM20yVxkoEo9gYpIQMMEp1l235fiZHWdtJ01NLcEM9b/aRcLjyRXjf9zdvz9n0SU42Hl2xLeS9DzULcwjBKC2IUkwNQy7QP+QkYfLOm4aCwIewHjV/5y4l3wOWI1FrxDtxFiQ9sRVPJ5J3fPXibQTMghoRlqebwTE/yk7uH7KDc3fthbw8iY3NyY1haTjz+z3Iwx8ewIQp9sXkx5zVVC0ErKIQYZLFbeHhV1OdeIq0eWS1yBwB7uU7G4VdTfEQ4ArEWyqaUb2KFHWdhKuYaq1UxXfSlvl3FYC/IdgX/Yh23q7h+H7x/6uHYnAjnlkd9jer1BsueVdQC/WUU20YHMHDCAxSI1Zw/SGssa9Rr4Q=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2178.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(346002)(39860400002)(376002)(366004)(230922051799003)(64100799003)(1800799009)(186009)(451199024)(2906002)(30864003)(6506007)(52116002)(478600001)(86362001)(26005)(2616005)(6512007)(316002)(66556008)(66476007)(66946007)(6486002)(966005)(38100700002)(83380400001)(5660300002)(7416002)(38350700005)(8936002)(36756003)(8676002)(4326008)(110136005)(41300700001)(41533002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qDATrpJrCeeJD74C01uGPE9LQdlEgNFS4cNSlI+BmaB4n1CQ6Cs7XglNnOWK?=
 =?us-ascii?Q?6Evn1wrkojTtoipFsvwo8uytrdSMy1hxWGgzQuwVWUKMThH19y5p4qDP5S/B?=
 =?us-ascii?Q?CGq5jgxcT1SyWmubvLrokXKsLu5F0wlKYMco9fNKK1ZVara6nYARx88I/mXH?=
 =?us-ascii?Q?+0DfjlJtWMMqTML+4AQPs5luQf5gosKvaio06AOc1GvRFkOpePLlOoaIMY/d?=
 =?us-ascii?Q?kd3GMoSRVlebcr9nGbG5xC3SiB5KkHl1jQlwXvTINveTBqDHqLWszlDrHRvv?=
 =?us-ascii?Q?h/E5uu+J0EyJHPGIaY7EwifeGw1pXmnKuJlYyc34aeTmyK+H3gNewfkGvr9u?=
 =?us-ascii?Q?4l7Bu7wsWjqjSliu5zvkvX7svjiPnHQ7pTIYQFXovwpJZ4Pz6Qbgr1via2Lq?=
 =?us-ascii?Q?W8IvGSm0ATbU8mV5pFEE29nA8DXD1JA5cKvMtrnj5RTdYFXfpBnimlu2HFaT?=
 =?us-ascii?Q?y/IJPRR9pdDFpQFijchQQsk0rnin+4ppcm5JKxbe6SNukXJv7vgiP60geWxS?=
 =?us-ascii?Q?DylFD6wx43f57x/KT6teyk/BK/u4KA4c2o2OpW+Q+S3IJGyO5LkNp0oRH/Kf?=
 =?us-ascii?Q?NLePXRnDebgCgNYC1+ZOC6yFwwiycBarpRx/6NPzP7Qrwmeh3EN5jgfj58T1?=
 =?us-ascii?Q?Uh4U8gLSv0xkClQugBST2JUA747wFooscHztiVXXhOtOM7504+tdrQk2b7aB?=
 =?us-ascii?Q?pYJ+0LEdMa48tA81tWZSJeTCPvlF8BOSct+thzvEyEo4XrbS/383z0FM/WSW?=
 =?us-ascii?Q?tBxmLAIkVLmJqPQXFt2S5Tybxy5aHsF5/J1UFCKjHrTCm0HwGwCSWJkWKJpQ?=
 =?us-ascii?Q?xGIy3S0nefYE/1Vh4muCzSjHzAuWKFTWLIxZNbbVyjW+obFmBSh/37hDWl+R?=
 =?us-ascii?Q?ZGwkzwb/t+MAqNJiV8/nAxodHZWr1M60bWXdyE0DJruX6ICqKAHbTN3kIxfp?=
 =?us-ascii?Q?OcUaviv7riCx0J3LRBAHtgaWSJq0KR3JBvazTtgD0PWLQGQ3wDNk2d/F+xVO?=
 =?us-ascii?Q?pzd4UzBT+8aOx447D4wRf3REjvwjLPkcI2vZCyLQRpTUWS5snH4scyx10lWq?=
 =?us-ascii?Q?t3z3/8zJx+WkHu3ZD9m7XGJlML06zm/zv2i3+0lCk1sxgB4VvxXBYJyFhWNy?=
 =?us-ascii?Q?PUysiIehELcBYBPy/grd/AnkpR9x1ln9JDxJSCNxNbq1YZOF/jFpBvCUh9Ae?=
 =?us-ascii?Q?rz9dCFzxkHZ4ZAONzjyNSgmNyuZvFdc7/WgvCg4Dw850BiJmI2qlZPyMqL9L?=
 =?us-ascii?Q?Yhf+/TmqCEJY1GWm+9Wc7OmeErk/KPqv9YuuP7vPQAo/kdg8ii4QZ3BKoou4?=
 =?us-ascii?Q?Yw8vrA/9yLt3lY+RRmHtTQrLZn0b1sfUJvYfYLNv7mS2e4IGC8va78kxyfut?=
 =?us-ascii?Q?b6ejdNV48uV0YrhB3o/rXC4Z6i/arj854vM5lMOW8mRR1h/4HoMDJL4DGd9b?=
 =?us-ascii?Q?cOyZ5ybhufMX/v1PPchWg9jUYo0AOZjQ/L1lRUWM7Gq0hB2llxvpbFQIJSjy?=
 =?us-ascii?Q?XjsZfgzIMOZcmcY08EfaPtakUqygoa2QeQBj5Hi6Od2EBaQmf7aFzDsTg8fl?=
 =?us-ascii?Q?/uYorbxfyLYQs4rRuwKuphAGHp0k7Ujzv14AgVnR1MneLfmaBfhMwTF6Kktv?=
 =?us-ascii?Q?aQh0B3WK1d31A9BvGRmfARk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8b72b41c-adde-4b42-7ea2-08dbe3e7d6c0
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2178.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2023 01:28:28.6678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 T6grB6upF3510rXGdnYY3KwXFOLTiPuZJkuSNAMv8pgNURoTmVcRa5HJ/wVb1C73EIsrlpu52EKjuNGl1dS9LAEwGzklnkxSyDSR+nrtlD0Ht/wdHwmS/at0WtO1jLzw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10494
Message-ID-Hash: IYSP2LQXJ2XTMRMQGD6HD2363PJS4VIE
X-Message-ID-Hash: IYSP2LQXJ2XTMRMQGD6HD2363PJS4VIE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IYSP2LQXJ2XTMRMQGD6HD2363PJS4VIE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Current ASoC CPU:Codec = N:M connection is using connection mapping idea,
but it is used for N < M case only. We want to use it for any case.

By this patch, not only N:M connection, but all existing connection
(1:1, 1:N, N:N) will use same connection mapping. Then, because it will
use default mapping, no conversion patch is needed to exising drivers.

More over, CPU:Codec = N:M (N > M) also supported in the same time.

ch_maps array will has CPU/Codec index by this patch.

Image
	CPU0 <---> Codec0
	CPU1 <-+-> Codec1
	CPU2 <-/

ch_map
	ch_map[0].cpu = 0	ch_map[0].codec = 0
	ch_map[1].cpu = 1	ch_map[1].codec = 1
	ch_map[2].cpu = 2	ch_map[2].codec = 1

Link: https://lore.kernel.org/r/87fs6wuszr.wl-kuninori.morimoto.gx@renesas.com
Link: https://lore.kernel.org/r/878r7yqeo4.wl-kuninori.morimoto.gx@renesas.com
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by:  Bard Liao <yung-chuan.liao@linux.intel.com>
Tested-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Tested-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/sound/soc.h              | 56 ++++++++++++++++++-
 sound/soc/intel/boards/sof_sdw.c | 28 ++++------
 sound/soc/soc-core.c             | 95 +++++++++++++++++++++++++++++++-
 sound/soc/soc-dapm.c             | 45 ++++-----------
 sound/soc/soc-pcm.c              | 44 +++++----------
 5 files changed, 185 insertions(+), 83 deletions(-)

diff --git a/include/sound/soc.h b/include/sound/soc.h
index 7792c393e238..f3803c2dc349 100644
--- a/include/sound/soc.h
+++ b/include/sound/soc.h
@@ -655,8 +655,45 @@ struct snd_soc_dai_link_component {
 	struct of_phandle_args *dai_args;
 };
 
-struct snd_soc_dai_link_codec_ch_map {
-	unsigned int connected_cpu_id;
+/*
+ * [dai_link->ch_maps Image sample]
+ *
+ *-------------------------
+ * CPU0 <---> Codec0
+ *
+ * ch-map[0].cpu = 0	ch-map[0].codec = 0
+ *
+ *-------------------------
+ * CPU0 <---> Codec0
+ * CPU1 <---> Codec1
+ * CPU2 <---> Codec2
+ *
+ * ch-map[0].cpu = 0	ch-map[0].codec = 0
+ * ch-map[1].cpu = 1	ch-map[1].codec = 1
+ * ch-map[2].cpu = 2	ch-map[2].codec = 2
+ *
+ *-------------------------
+ * CPU0 <---> Codec0
+ * CPU1 <-+-> Codec1
+ * CPU2 <-/
+ *
+ * ch-map[0].cpu = 0	ch-map[0].codec = 0
+ * ch-map[1].cpu = 1	ch-map[1].codec = 1
+ * ch-map[2].cpu = 2	ch-map[2].codec = 1
+ *
+ *-------------------------
+ * CPU0 <---> Codec0
+ * CPU1 <-+-> Codec1
+ *	  \-> Codec2
+ *
+ * ch-map[0].cpu = 0	ch-map[0].codec = 0
+ * ch-map[1].cpu = 1	ch-map[1].codec = 1
+ * ch-map[2].cpu = 1	ch-map[2].codec = 2
+ *
+ */
+struct snd_soc_dai_link_ch_map {
+	unsigned int cpu;
+	unsigned int codec;
 	unsigned int ch_mask;
 };
 
@@ -688,7 +725,9 @@ struct snd_soc_dai_link {
 	struct snd_soc_dai_link_component *codecs;
 	unsigned int num_codecs;
 
-	struct snd_soc_dai_link_codec_ch_map *codec_ch_maps;
+	/* num_ch_maps = max(num_cpu, num_codecs) */
+	struct snd_soc_dai_link_ch_map *ch_maps;
+
 	/*
 	 * You MAY specify the link's platform/PCM/DMA driver, either by
 	 * device name, or by DT/OF node, but not both. Some forms of link
@@ -775,6 +814,10 @@ struct snd_soc_dai_link {
 #endif
 };
 
+static inline int snd_soc_link_num_ch_map(struct snd_soc_dai_link *link) {
+	return max(link->num_cpus, link->num_codecs);
+}
+
 static inline struct snd_soc_dai_link_component*
 snd_soc_link_to_cpu(struct snd_soc_dai_link *link, int n) {
 	return &(link)->cpus[n];
@@ -808,6 +851,12 @@ snd_soc_link_to_platform(struct snd_soc_dai_link *link, int n) {
 		     ((cpu) = snd_soc_link_to_cpu(link, i));		\
 	     (i)++)
 
+#define for_each_link_ch_maps(link, i, ch_map)			\
+	for ((i) = 0;						\
+	     ((i) < snd_soc_link_num_ch_map(link) &&		\
+		      ((ch_map) = link->ch_maps + i));		\
+	     (i)++)
+
 /*
  * Sample 1 : Single CPU/Codec/Platform
  *
@@ -1163,6 +1212,7 @@ struct snd_soc_pcm_runtime {
 	     ((i) < (rtd)->dai_link->num_cpus + (rtd)->dai_link->num_codecs) &&	\
 		     ((dai) = (rtd)->dais[i]);				\
 	     (i)++)
+#define for_each_rtd_ch_maps(rtd, i, ch_maps) for_each_link_ch_maps(rtd->dai_link, i, ch_maps)
 
 void snd_soc_close_delayed_work(struct snd_soc_pcm_runtime *rtd);
 
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 3312ad8a563b..2faf7372bad0 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -570,16 +570,14 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 		  struct snd_pcm_hw_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai_link_ch_map *ch_maps;
 	int ch = params_channels(params);
-	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai;
 	unsigned int ch_mask;
 	int num_codecs;
 	int step;
 	int i;
-	int j;
 
-	if (!rtd->dai_link->codec_ch_maps)
+	if (!rtd->dai_link->ch_maps)
 		return 0;
 
 	/* Identical data will be sent to all codecs in playback */
@@ -605,13 +603,9 @@ int sdw_hw_params(struct snd_pcm_substream *substream,
 	 * link has more than one codec DAIs. Set codec channel mask and
 	 * ASoC will set the corresponding channel numbers for each cpu dai.
 	 */
-	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
-		for_each_rtd_codec_dais(rtd, j, codec_dai) {
-			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id != i)
-				continue;
-			rtd->dai_link->codec_ch_maps[j].ch_mask = ch_mask << (j * step);
-		}
-	}
+	for_each_link_ch_maps(rtd->dai_link, i, ch_maps)
+		ch_maps->ch_mask = ch_mask << (i * step);
+
 	return 0;
 }
 
@@ -1350,15 +1344,17 @@ static int get_slave_info(const struct snd_soc_acpi_link_adr *adr_link,
 	return 0;
 }
 
-static void set_dailink_map(struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps,
+static void set_dailink_map(struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps,
 			    int codec_num, int cpu_num)
 {
 	int step;
 	int i;
 
 	step = codec_num / cpu_num;
-	for (i = 0; i < codec_num; i++)
-		sdw_codec_ch_maps[i].connected_cpu_id = i / step;
+	for (i = 0; i < codec_num; i++) {
+		sdw_codec_ch_maps[i].cpu	= i / step;
+		sdw_codec_ch_maps[i].codec	= i;
+	}
 }
 
 static const char * const type_strings[] = {"SimpleJack", "SmartAmp", "SmartMic"};
@@ -1453,7 +1449,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		*ignore_pch_dmic = true;
 
 	for_each_pcm_streams(stream) {
-		struct snd_soc_dai_link_codec_ch_map *sdw_codec_ch_maps;
+		struct snd_soc_dai_link_ch_map *sdw_codec_ch_maps;
 		char *name, *cpu_name;
 		int playback, capture;
 		static const char * const sdw_stream_name[] = {
@@ -1530,7 +1526,7 @@ static int create_sdw_dailink(struct snd_soc_card *card, int *link_index,
 		dai_links[*link_index].nonatomic = true;
 
 		set_dailink_map(sdw_codec_ch_maps, codec_num, cpu_dai_num);
-		dai_links[*link_index].codec_ch_maps = sdw_codec_ch_maps;
+		dai_links[*link_index].ch_maps = sdw_codec_ch_maps;
 		ret = set_codec_init_func(card, adr_link, dai_links + (*link_index)++,
 					  playback, group_id, adr_index, dai_index);
 		if (ret < 0) {
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index b2bd45e87bc3..4ca3319a8e19 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1015,6 +1015,94 @@ static int soc_dai_link_sanity_check(struct snd_soc_card *card,
 	return -EINVAL;
 }
 
+#define MAX_DEFAULT_CH_MAP_SIZE 7
+static struct snd_soc_dai_link_ch_map default_ch_map_sync[MAX_DEFAULT_CH_MAP_SIZE] = {
+	{ .cpu = 0, .codec = 0 },
+	{ .cpu = 1, .codec = 1 },
+	{ .cpu = 2, .codec = 2 },
+	{ .cpu = 3, .codec = 3 },
+	{ .cpu = 4, .codec = 4 },
+	{ .cpu = 5, .codec = 5 },
+	{ .cpu = 6, .codec = 6 },
+};
+static struct snd_soc_dai_link_ch_map default_ch_map_1cpu[MAX_DEFAULT_CH_MAP_SIZE] = {
+	{ .cpu = 0, .codec = 0 },
+	{ .cpu = 0, .codec = 1 },
+	{ .cpu = 0, .codec = 2 },
+	{ .cpu = 0, .codec = 3 },
+	{ .cpu = 0, .codec = 4 },
+	{ .cpu = 0, .codec = 5 },
+	{ .cpu = 0, .codec = 6 },
+};
+static struct snd_soc_dai_link_ch_map default_ch_map_1codec[MAX_DEFAULT_CH_MAP_SIZE] = {
+	{ .cpu = 0, .codec = 0 },
+	{ .cpu = 1, .codec = 0 },
+	{ .cpu = 2, .codec = 0 },
+	{ .cpu = 3, .codec = 0 },
+	{ .cpu = 4, .codec = 0 },
+	{ .cpu = 5, .codec = 0 },
+	{ .cpu = 6, .codec = 0 },
+};
+static int snd_soc_compensate_channel_connection_map(struct snd_soc_card *card,
+						     struct snd_soc_dai_link *dai_link)
+{
+	struct snd_soc_dai_link_ch_map *ch_maps;
+	int i;
+
+	/*
+	 * dai_link->ch_maps indicates how CPU/Codec are connected.
+	 * It will be a map seen from a larger number of DAI.
+	 * see
+	 *	soc.h :: [dai_link->ch_maps Image sample]
+	 */
+
+	/* it should have ch_maps if connection was N:M */
+	if (dai_link->num_cpus > 1 && dai_link->num_codecs > 1 &&
+	    dai_link->num_cpus != dai_link->num_codecs && !dai_link->ch_maps) {
+		dev_err(card->dev, "need to have ch_maps when N:M connction (%s)",
+			dai_link->name);
+		return -EINVAL;
+	}
+
+	/* do nothing if it has own maps */
+	if (dai_link->ch_maps)
+		goto sanity_check;
+
+	/* check default map size */
+	if (dai_link->num_cpus   > MAX_DEFAULT_CH_MAP_SIZE ||
+	    dai_link->num_codecs > MAX_DEFAULT_CH_MAP_SIZE) {
+		dev_err(card->dev, "soc-core.c needs update default_connection_maps");
+		return -EINVAL;
+	}
+
+	/* Compensate missing map for ... */
+	if (dai_link->num_cpus == dai_link->num_codecs)
+		dai_link->ch_maps = default_ch_map_sync;	/* for 1:1 or N:N */
+	else if (dai_link->num_cpus <  dai_link->num_codecs)
+		dai_link->ch_maps = default_ch_map_1cpu;	/* for 1:N */
+	else
+		dai_link->ch_maps = default_ch_map_1codec;	/* for N:1 */
+
+sanity_check:
+	dev_dbg(card->dev, "dai_link %s\n", dai_link->stream_name);
+	for_each_link_ch_maps(dai_link, i, ch_maps) {
+		if ((ch_maps->cpu   >= dai_link->num_cpus) ||
+		    (ch_maps->codec >= dai_link->num_codecs)) {
+			dev_err(card->dev,
+				"unexpected dai_link->ch_maps[%d] index (cpu(%d/%d) codec(%d/%d))",
+				i,
+				ch_maps->cpu,	dai_link->num_cpus,
+				ch_maps->codec,	dai_link->num_codecs);
+			return -EINVAL;
+		}
+
+		dev_dbg(card->dev, "  [%d] cpu%d <-> codec%d\n",
+			i, ch_maps->cpu, ch_maps->codec);
+	}
+
+	return 0;
+}
+
 /**
  * snd_soc_remove_pcm_runtime - Remove a pcm_runtime from card
  * @card: The ASoC card to which the pcm_runtime has
@@ -1121,8 +1209,13 @@ int snd_soc_add_pcm_runtimes(struct snd_soc_card *card,
 			     int num_dai_link)
 {
 	for (int i = 0; i < num_dai_link; i++) {
-		int ret = snd_soc_add_pcm_runtime(card, dai_link + i);
+		int ret;
+
+		ret = snd_soc_compensate_channel_connection_map(card, dai_link + i);
+		if (ret < 0)
+			return ret;
 
+		ret = snd_soc_add_pcm_runtime(card, dai_link + i);
 		if (ret < 0)
 			return ret;
 	}
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 3844f777c87b..3d72084b6a34 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -4438,11 +4438,14 @@ static void soc_dapm_dai_stream_event(struct snd_soc_dai *dai, int stream,
 void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 {
 	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_dai *cpu_dai;
 	struct snd_soc_dai *codec_dai;
-	int i;
 
 	/* for each BE DAI link... */
 	for_each_card_rtds(card, rtd)  {
+		struct snd_soc_dai_link_ch_map *ch_maps;
+		int i;
+
 		/*
 		 * dynamic FE links have no fixed DAI mapping.
 		 * CODEC<->CODEC links have no direct connection.
@@ -4450,39 +4453,15 @@ void snd_soc_dapm_connect_dai_link_widgets(struct snd_soc_card *card)
 		if (rtd->dai_link->dynamic)
 			continue;
 
-		if (rtd->dai_link->num_cpus == 1) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, 0));
-		} else if (rtd->dai_link->num_codecs == rtd->dai_link->num_cpus) {
-			for_each_rtd_codec_dais(rtd, i, codec_dai)
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, i));
-		} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
-			int cpu_id;
-
-			if (!rtd->dai_link->codec_ch_maps) {
-				dev_err(card->dev, "%s: no codec channel mapping table provided\n",
-					__func__);
-				continue;
-			}
+		/*
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 */
+		for_each_rtd_ch_maps(rtd, i, ch_maps) {
+			cpu_dai   = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
-			for_each_rtd_codec_dais(rtd, i, codec_dai) {
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				if (cpu_id >= rtd->dai_link->num_cpus) {
-					dev_err(card->dev,
-						"%s: dai_link %s cpu_id %d too large, num_cpus is %d\n",
-						__func__, rtd->dai_link->name, cpu_id,
-						rtd->dai_link->num_cpus);
-					continue;
-				}
-				dapm_connect_dai_pair(card, rtd, codec_dai,
-						      snd_soc_rtd_to_cpu(rtd, cpu_id));
-			}
-		} else {
-			dev_err(card->dev,
-				"%s: codec number %d < cpu number %d is not supported\n",
-				__func__, rtd->dai_link->num_codecs, rtd->dai_link->num_cpus);
+			dapm_connect_dai_pair(card, rtd, codec_dai, cpu_dai);
 		}
 	}
 }
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 323e4d7b6adf..c20573aeb756 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -1050,6 +1050,7 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 	}
 
 	for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
+		struct snd_soc_dai_link_ch_map *ch_maps;
 		unsigned int ch_mask = 0;
 		int j;
 
@@ -1063,22 +1064,20 @@ static int __soc_pcm_hw_params(struct snd_soc_pcm_runtime *rtd,
 		/* copy params for each cpu */
 		tmp_params = *params;
 
-		if (!rtd->dai_link->codec_ch_maps)
-			goto hw_params;
 		/*
 		 * construct cpu channel mask by combining ch_mask of each
 		 * codec which maps to the cpu.
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
 		 */
-		for_each_rtd_codec_dais(rtd, j, codec_dai) {
-			if (rtd->dai_link->codec_ch_maps[j].connected_cpu_id == i)
-				ch_mask |= rtd->dai_link->codec_ch_maps[j].ch_mask;
-		}
+		for_each_rtd_ch_maps(rtd, j, ch_maps)
+			if (ch_maps->cpu == i)
+				ch_mask |= ch_maps->ch_mask;
 
 		/* fixup cpu channel number */
 		if (ch_mask)
 			soc_pcm_codec_params_fixup(&tmp_params, ch_mask);
 
-hw_params:
 		ret = snd_soc_dai_hw_params(cpu_dai, substream, &tmp_params);
 		if (ret < 0)
 			goto out;
@@ -2826,35 +2825,20 @@ static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 			}
 		}
 	} else {
+		struct snd_soc_dai_link_ch_map *ch_maps;
 		struct snd_soc_dai *codec_dai;
 
 		/* Adapt stream for codec2codec links */
 		int cpu_capture  = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_CAPTURE);
 		int cpu_playback = snd_soc_get_stream_cpu(dai_link, SNDRV_PCM_STREAM_PLAYBACK);
 
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (dai_link->num_cpus == 1) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
-			} else if (dai_link->num_cpus == dai_link->num_codecs) {
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, i);
-			} else if (rtd->dai_link->num_codecs > rtd->dai_link->num_cpus) {
-				int cpu_id;
-
-				if (!rtd->dai_link->codec_ch_maps) {
-					dev_err(rtd->card->dev, "%s: no codec channel mapping table provided\n",
-						__func__);
-					return -EINVAL;
-				}
-
-				cpu_id = rtd->dai_link->codec_ch_maps[i].connected_cpu_id;
-				cpu_dai = snd_soc_rtd_to_cpu(rtd, cpu_id);
-			} else {
-				dev_err(rtd->card->dev,
-					"%s codec number %d < cpu number %d is not supported\n",
-					__func__, rtd->dai_link->num_codecs,
-					rtd->dai_link->num_cpus);
-				return -EINVAL;
-			}
+		/*
+		 * see
+		 *	soc.h :: [dai_link->ch_maps Image sample]
+		 */
+		for_each_rtd_ch_maps(rtd, i, ch_maps) {
+			cpu_dai	  = snd_soc_rtd_to_cpu(rtd,   ch_maps->cpu);
+			codec_dai = snd_soc_rtd_to_codec(rtd, ch_maps->codec);
 
 			if (snd_soc_dai_stream_valid(codec_dai, SNDRV_PCM_STREAM_PLAYBACK) &&
 			    snd_soc_dai_stream_valid(cpu_dai,   cpu_playback))
-- 
2.25.1

