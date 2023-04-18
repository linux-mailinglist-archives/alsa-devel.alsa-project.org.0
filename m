Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DE66E55C7
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Apr 2023 02:25:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C62F6DF6;
	Tue, 18 Apr 2023 02:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C62F6DF6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681777538;
	bh=0b6CUewAj9LG/fmyQbM7zY3aNXo+nDD0QUQAQzEQ8Vk=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EA0kKWkcS3GbLUiqWOb330tFN5b1U0JSNRFLl5DJKZYzPMjqXXI4EqFUejBb+0VfQ
	 JNJJ5PnyYe829+3A+avis+XcDDw9hwxbBA3H9z8HHmRYtPEryuAS7hDf7X0ap0qBtc
	 QaDiIY2MqOBn9Pr3YM1ybytZ299miOd2VSwtxHdM=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7541EF80212;
	Tue, 18 Apr 2023 02:24:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 36AAEF80155; Tue, 18 Apr 2023 02:24:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6B01BF800D0
	for <alsa-devel@alsa-project.org>; Tue, 18 Apr 2023 02:24:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B01BF800D0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=BXFv3je2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lWvBS9BSawDiXueb7b9mdSwE2WAG5iInoZ5zcJecHEgbHaypMnzPhPo0Ckfyr5AAcXrm6v75r893qlo5CJpASTvp+2UKjTxzPBmP/DszR5Hp1EgLQfjev/veY0nLT8LndxC4lWcFozaLNDV7Q3z43TzoKipe/WgoZs4y2tgyDagjN5jJSdWRRadh4T1L5ChNY0KEJ7dEliocaiNeh4R4KjSCWl0uEbr4V95FekTzHHwZZatJ2xilHTOvYvl5THCiptDiaYoQ4ZveSfqiwugxdYdsrp1FngiY0LNFofCrv3s+pt0/SBgci1v3tyU/fIEgS/1OTqKWi1/DisgA6STYiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7T8mCwmGzA7AsQ5pc9Mxi8wfsvjLsAWDSfYHUpyYH7Q=;
 b=b1rZPj0RTblQTxkL7G477fG1TagovLxQf6/VmxVX4GXOkbfvG2DYynlSs0IUwuxrFrk1wIcDi0nOfgVDDjq86B3Y+pJJF2onr6M4cAo7SFT4MM66hDBJSZWMoxC++LIWIfHUFYtRvoXRwSlWr/LRI2vepNnrTcMYM60mUFWpluVFFqRB8TPH+ycbfFInTyC7cS84RvdferCbcE7cg+iQgoOfWe7dT//2fqFHl0MiaZUGjroMVphANy9XoE4NyX4exTMeLdyw/F9fwgizX/cA6IeuHd4slBgmoB2bmE7HgIm1IqWkZMF7Iqx5/vDPKyWub61Ls1getLD6EKftFUyFIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7T8mCwmGzA7AsQ5pc9Mxi8wfsvjLsAWDSfYHUpyYH7Q=;
 b=BXFv3je28ic7RYikYU0t6uSLFo+lqaQP4jpq4pZpFDehncbWPYAGzR92E5MfRPPif0C/z/CdOufn95ZTjIcdtmsawWMEdRa2EiLe1c47Pox0U6RU5ykdthYeLVfmc/LmBsS51KToGRwiji7jl09YTtLCeHvG8XKu/ERLA1ML4dw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8855.jpnprd01.prod.outlook.com (2603:1096:400:17c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 00:24:37 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%3]) with mapi id 15.20.6298.045; Tue, 18 Apr 2023
 00:24:37 +0000
Message-ID: <87v8hu2g1n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
References: <874jpe3uqh.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/11] ASoC: fsl: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 18 Apr 2023 00:24:37 +0000
X-ClientProxiedBy: TYCP286CA0086.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8855:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c6b6275-c0e3-4fb5-bde5-08db3fa34b00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/JPQIKyJWyQd/tcO4BBZ4a2WRxwxnvkNfOtnKpk3xyjuGJgXCcwGw0bZVfoNLQUN0CwoTOcCpnKW5TGAdMyTmugIGdsqW1tSeHS3FuBKHYkdFaEYdC0oBc7mCKXkiTcCt1z+uJv7LiMLAi0klfLFaK5eZy0z46EEVCgo+/C90o3GI2bNyR07FskRAv52xqwr+byuyu0qnCAh7DFcjidHq1cjHSf8jKUjRiMTZH9TiiR8RGzYAGLkpevOGeWj5Jn9+JwuuxSLhsLLW8yKL243vsznR38SYESrZk4VxG1IHBaBHn2yL0+3TJrMZGi8HnpSW1b0wg8ulcMLuitxVkT8B/WF1veJ7RY4Mx2LO8TMRAydNzjA6iLCBQ3gjI99Gk4jL5zxmWdocVPLZibkONCIo1UjTNfpP2pT3J8heRfnX6ZPC1w3RUKtw27ZjkiwyhrADYLIjAEJiJop2w2ewp7feVZL2EkLB+zR2kXidEZ+NAf+YPpdMfARUqBkxkQFX2TD8opNGES+vRW8x7KQE7ljaYDaFmi8HDW9CprBU+nTt9iQKRdHJT40SGCfxJMaeMDI0ExW4ZkwXSNpZyUB2CBugrP6jVEFA3j9+Vs18PEPC3KEAtJge8t8lJrBIgGy2Utc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(6486002)(478600001)(86362001)(2616005)(36756003)(26005)(83380400001)(6512007)(6506007)(186003)(38100700002)(38350700002)(52116002)(66556008)(66946007)(66476007)(316002)(2906002)(4326008)(6916009)(8936002)(5660300002)(8676002)(7416002)(41300700001)(54906003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3rdLZyY6M1kuVZAFkmR6ud458CsEIXCGuRBPQSzJacedayAZSqIdl3vtKzdm?=
 =?us-ascii?Q?x2GbtxVDwUvGhUgsevSjcD2AYYnVPci5eXmHKw/NJgMFLTnlrfCSr/SMOrZi?=
 =?us-ascii?Q?kZX+M5zali3YDZ3ku0Wc04PTh1YI2zHW4niGBJeiaJK3houRJYNpoWsRe1zf?=
 =?us-ascii?Q?w4ijR+WZU1vvmJJ4xIYog4AZ/fAbp2yhcvmxnIsQc/MDih4ppuzbeotYtAbk?=
 =?us-ascii?Q?LiXXchKwzz3idcFNGgyydJSb3AtBFnWIfrki+svjRgBCtZINsg+KFxnW5/QU?=
 =?us-ascii?Q?vYavIX7bzL41qHf3XS2jh6AXFFZx8+uf5B+LX9KJfwkTpq/4egnc8E5MWx3s?=
 =?us-ascii?Q?Ipd4FjU2qu1yVbe1Kv8mKtikXssPZBdelbZ678EcwD9apmXtcRTQMJWat9e4?=
 =?us-ascii?Q?/2FaB72lcspZngMtpE5xALoLIC/9AWfzCQGp9twSR1DM9I6MiNFiQ4yFkYHZ?=
 =?us-ascii?Q?JoVXGWtMlb5dtM3sRIngzEXPokiobhJ6TqAj+VUhYsTmPC5jQ3FQWB5ih/pm?=
 =?us-ascii?Q?kzUBf879fF8b70U29C3yAIhOMIRuJiFa2ppZOoP0f8aROS5JVFlrgeGJiUt6?=
 =?us-ascii?Q?/axUjEeU6pkQ+qnuL9y/BnsUGsw8jR6orUsiBmFV9/CpWI6ppqV6HidFoMvQ?=
 =?us-ascii?Q?IsLiFLShwU0zTe09B/vC4vSGP+i9YEeDvK8fsBV8QoRDEraqZwkKrcaiNEMp?=
 =?us-ascii?Q?3zTn/jBdhWk/DWqW65rMsLxPFFR4iRcxeiLD85Hs3ocilc8ccmXoawfEzqNm?=
 =?us-ascii?Q?nYW5hUOO9mTkqjNmEJQ65hWEzQPrV9GdVPTI1tuIbEz/RKvQeFLrudWR9zsb?=
 =?us-ascii?Q?xG7JxnCsYrlXzoIyGe/51a9nbWpfYX6PoBiLYWJYYWq0Fxfmmaz94C79M7TI?=
 =?us-ascii?Q?O1BuOcg7r2EF1Dc58Xs9zAT+EImayl4/as5v/SfclGciDz/u5L6Uqrees+zr?=
 =?us-ascii?Q?koqqef5s++07uqYQJq9mC0kqPFMqnGyy6IAcJ5cRxL3OpmZ5VOpvSvG62yeY?=
 =?us-ascii?Q?eZkP/jlykfTaRp/iFUUjwUCaHmQM++tz6yk7Hkz/tnNn1iW0WiKrYtm0Wnay?=
 =?us-ascii?Q?kUawqxrUYTJFLTlZTGwOeAF6ndklzunnDpnXXdgDJUbkahFFLUtCJqh3ZtYW?=
 =?us-ascii?Q?TLL47zUkgXzdITXq8sha86gW6/IlweoyXwhAxa+M7IPb5ken/10Zkvg0bYT2?=
 =?us-ascii?Q?6UScH1bVP+fnpIcSXYcckEJGiqo2FPkdpmka4Q+5Y0Jp0eouMDBAG/v+Sg+4?=
 =?us-ascii?Q?utxULqDpwN3wLNsquT4R+oB7P0PfQxhRho1f7ZVy+ywMCEfLUix0xxZ0uUz6?=
 =?us-ascii?Q?XvUEbW0ku780/L9yHkJx5JjO6Z0hIFqFwvTqUZhok000+h55FQxKAMyctaHF?=
 =?us-ascii?Q?RsrEnxd01TPOtnfCXXD+nI9d4Pg2LARyi/VXC2L8AczvRGlTd+C7YmodY4Cm?=
 =?us-ascii?Q?cJPgvwHJ6gBYVG+zSVq8R3hPdW+ItmHb9JiUzRaXOP/UjscDmkwj5dQMDtYy?=
 =?us-ascii?Q?XJ5Q1a9kXMqVgWB5izAXUtW8MF1z8ZpiRhHsvA9JG4ulbyCuq4+P71FVH2k9?=
 =?us-ascii?Q?MKZ9rgJ42XCs1ytaFYIUXGlThMlK4+xJjRwVpCmwrxm1sYpAWgNALiqEej+7?=
 =?us-ascii?Q?P/3GCYHoV1YJdQEFkVXQuC8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 0c6b6275-c0e3-4fb5-bde5-08db3fa34b00
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 00:24:37.4358
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Q5kOVKsXT8FzB4H77RoJHHFAtv4c7Pxqj3796XxU+xlieebz2Vw7k7E8X7M78e/iBPcaFgjfkOS4AX4sE9ADmAeeVHGhLmwmKr8pla2ogtZtBfWaX2ETRmXED6ZUgGFJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8855
Message-ID-Hash: VO6FUPD3IZ2FRAF3GZE4WKYI4NCNNYV7
X-Message-ID-Hash: VO6FUPD3IZ2FRAF3GZE4WKYI4NCNNYV7
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 NXP Linux Team <linux-imx@nxp.com>, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VO6FUPD3IZ2FRAF3GZE4WKYI4NCNNYV7/>
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
 sound/soc/fsl/imx-audmix.c | 14 +++++---------
 sound/soc/fsl/imx-card.c   | 11 +----------
 sound/soc/fsl/imx-rpmsg.c  |  3 +--
 sound/soc/fsl/imx-spdif.c  |  6 ++----
 4 files changed, 9 insertions(+), 25 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 2c57fe9d2d08..8287b366eea1 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -207,8 +207,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 	for (i = 0; i < num_dai; i++) {
 		struct snd_soc_dai_link_component *dlc;
 
-		/* for CPU/Codec x 2 */
-		dlc = devm_kcalloc(&pdev->dev, 4, sizeof(*dlc), GFP_KERNEL);
+		/* for CPU x 2 */
+		dlc = devm_kcalloc(&pdev->dev, 2, sizeof(*dlc), GFP_KERNEL);
 		if (!dlc)
 			return -ENOMEM;
 
@@ -239,15 +239,13 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		}
 
 		priv->dai[i].cpus = &dlc[0];
-		priv->dai[i].codecs = &dlc[1];
+		priv->dai[i].codecs = &asoc_dummy_dlc;
 
 		priv->dai[i].num_cpus = 1;
 		priv->dai[i].num_codecs = 1;
 
 		priv->dai[i].name = dai_name;
 		priv->dai[i].stream_name = "HiFi-AUDMIX-FE";
-		priv->dai[i].codecs->dai_name = "snd-soc-dummy-dai";
-		priv->dai[i].codecs->name = "snd-soc-dummy";
 		priv->dai[i].cpus->of_node = args.np;
 		priv->dai[i].cpus->dai_name = dev_name(&cpu_pdev->dev);
 		priv->dai[i].dynamic = 1;
@@ -264,15 +262,13 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		be_cp = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 				       "AUDMIX-Capture-%d", i);
 
-		priv->dai[num_dai + i].cpus = &dlc[2];
-		priv->dai[num_dai + i].codecs = &dlc[3];
+		priv->dai[num_dai + i].cpus = &dlc[1];
+		priv->dai[num_dai + i].codecs = &asoc_dummy_dlc;
 
 		priv->dai[num_dai + i].num_cpus = 1;
 		priv->dai[num_dai + i].num_codecs = 1;
 
 		priv->dai[num_dai + i].name = be_name;
-		priv->dai[num_dai + i].codecs->dai_name = "snd-soc-dummy-dai";
-		priv->dai[num_dai + i].codecs->name = "snd-soc-dummy";
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
 		priv->dai[num_dai + i].no_pcm = 1;
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 64a4d7e9db60..78e2e3932ba5 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -615,17 +615,8 @@ static int imx_card_parse_of(struct imx_card_data *data)
 				plat_data->type = CODEC_AK5552;
 
 		} else {
-			dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
-			if (!dlc) {
-				ret = -ENOMEM;
-				goto err;
-			}
-
-			link->codecs	 = dlc;
+			link->codecs	 = &asoc_dummy_dlc;
 			link->num_codecs = 1;
-
-			link->codecs->dai_name = "snd-soc-dummy-dai";
-			link->codecs->name = "snd-soc-dummy";
 		}
 
 		if (!strncmp(link->name, "HiFi-ASRC-FE", 12)) {
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 89178106fe2c..93fc976e98dc 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -92,8 +92,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	/* Optional codec node */
 	ret = of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0, &args);
 	if (ret) {
-		data->dai.codecs->dai_name = "snd-soc-dummy-dai";
-		data->dai.codecs->name = "snd-soc-dummy";
+		*data->dai.codecs = asoc_dummy_dlc;
 	} else {
 		struct clk *clk;
 
diff --git a/sound/soc/fsl/imx-spdif.c b/sound/soc/fsl/imx-spdif.c
index 114b49660193..547be9438333 100644
--- a/sound/soc/fsl/imx-spdif.c
+++ b/sound/soc/fsl/imx-spdif.c
@@ -26,22 +26,20 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 	}
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	comp = devm_kzalloc(&pdev->dev, 2 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(&pdev->dev, sizeof(*comp), GFP_KERNEL);
 	if (!data || !comp) {
 		ret = -ENOMEM;
 		goto end;
 	}
 
 	data->dai.cpus		= &comp[0];
-	data->dai.codecs	= &comp[1];
+	data->dai.codecs	= &asoc_dummy_dlc;
 
 	data->dai.num_cpus	= 1;
 	data->dai.num_codecs	= 1;
 
 	data->dai.name = "S/PDIF PCM";
 	data->dai.stream_name = "S/PDIF PCM";
-	data->dai.codecs->dai_name = "snd-soc-dummy-dai";
-	data->dai.codecs->name = "snd-soc-dummy";
 	data->dai.cpus->of_node = spdif_np;
 	data->dai.playback_only = true;
 	data->dai.capture_only = true;
-- 
2.25.1

