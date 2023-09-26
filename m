Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A7E7AE5CE
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:26:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86A44E94;
	Tue, 26 Sep 2023 08:25:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86A44E94
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709575;
	bh=2oRfMZShRxLnbqXrlWwnKtqtGSMODPMH9g8KEejwTIc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MVLQCZYxqcvuDSsh+fuDiT3v+ZT+byNMSjSKJQ7RzVRv7hl5w0RTNPRU6r/9E0lC6
	 NcdZVQ3RrJ3suK64tLN3zetM7h4vW8C6Axst2XhIlF0M8mSOGKnS9JnOGkfMO2X50U
	 yb5Ev0nnukQp3rQTLNl9mn83pfYOzV+mA8PzMEpo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A2793F80571; Tue, 26 Sep 2023 08:23:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2A43AF8057A;
	Tue, 26 Sep 2023 08:23:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EA547F80589; Tue, 26 Sep 2023 08:22:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A16D7F80571
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:22:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A16D7F80571
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dEdhCpFw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H0N/45vZLYHhsRETZa1V9w3r8nacWjW4oXctu2IGPREOxdGvJU+TBoUwj/mUIpWx7cqh7D50ChF+ImNtUkqbXhsCXJeT+B/IKbTHkwKCTLSXsbl78815NatCtIAxw1/4HRunyOIwBgwqx65Dq17suy0q86WZ/PFLO9lC28dQj/e5FoZKD5ztVuF7n7459vgwowlSvLFBxZ87yHG3MVa/+ey5uwQiuKdTMEd5frcOs5gg1l8zLYeFus88xo+vpqjl/M/FHtAILvSlrUNhtFRghbEL0lNTM9Zyenq0uwHU+4/M7x1u5WBRYJC6C3UdPyubBDrKW+yu2t2Lh0dvAgi5hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HDQho029f7y6giBzxtvW8tzHPEefUCPxOQD7km8cckE=;
 b=MleSHt7QxKHhA8TdUPTMSr2Y/WYo9wzIZIa0eMAK9hXOlTvAqoroN8I2ATOh7jBEPx56iBToyc28Obsu4ZTjLumOKQv4j/3Rk9egYzYF161r/1hBktUmpJz1NHaIghj+F4n5Ui+/A+KeKVGO9pAPi3I+X1Lyn387AWGqpUpxKAf5OGaJQI7vvgy2RC2Fz1tf8z1FV2UGPrwpGJVRybQJSbkWe1aNcp1itL4p5Yo2yldFGjuWKvCeK32Q3d/t8a/PCVdL2mmUwhufDr0FXwQhxxxdsxa8tPk8s86zWv8FWZWQntpucPKKEZUZelApgI7VRpdAlRI3V0Irv/SiSTyO4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HDQho029f7y6giBzxtvW8tzHPEefUCPxOQD7km8cckE=;
 b=dEdhCpFwlpAKXHh4oGTyKhoBY3bhQWf8U04yXLIYQnjPspFYrxKWISSLRz1t3/BQqwUam85n7LtvXTGYPqhC14j6ydtLvcksNiQA13JOCHMRPvvuIGwvupkhALgKvyZOnSwRHIzZcI0q9KZOdDrAXHn33CiKSyWJjLsQi5O6d0o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10364.jpnprd01.prod.outlook.com (2603:1096:400:240::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:22:31 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:22:31 +0000
Message-ID: <87lecth2s8.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 20/54] ASoC: sunxi: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:22:31 +0000
X-ClientProxiedBy: TYCPR01CA0059.jpnprd01.prod.outlook.com
 (2603:1096:405:2::23) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: 78dd7948-807b-42a4-07e7-08dbbe58f72a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YnYudt8YoEOUYZK3aOmnnwf4Vj9/A20pJCNVTW4R0J3gtIpwmJn5jIHSXTF0ssXYM6gYGKfFkIaK9D6oz6xYDMp+u98YHsUjkGc+pgPp918siKWMBrZ6jBHU5+ywQDf6R0uAu0Rt7YAPCsPssMsj+Ygs8lZY/ITPnTtvYf/erlPQDj6YeAk4wuuMOem86+qQXFGrwT56+818Yiy3LQ9LplS863dl8CsxuScNqwqaHPUqT7tGXq59w9sR01dmeqiVTk5ndZee2sWjMgb1qwww2uDmk5RGC06yjcQJ4YIhlZk11EqfIkLitHJRj/khNokP+DF6VoDWlksPTz+sj+syeTdnuWRulhpLkiD/9oCdbdNByu+EwBNzjTCdZ1tvJKjLvdTNLAwiP1mEqUODdO2ECCceqaupnzY8VJ1o9vjL6kBgw6Z+sQGvV8+t3PLJQnydsyZPp+C+P6FU3zl5s7FY9d1ghhVdzyfOAzBiwLgW2WN6eFfa0DBx/lZkAnQNXByJ6m0nKd8TLZqAD5gPnYoJyz3bIIe1ekhMF+tRm7TVv4/6QGxc3iuNEd2Zzu6T8ayy9WMgYeq4Zc1YDA4GL4H39XXJfVGbbMbmUkhyIKL6E5hOXhG0A6W3ebPlERt+hBH3G6Df4W3W2NoVAsmdixSt4Q==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(52116002)(478600001)(6512007)(41300700001)(38100700002)(38350700002)(316002)(26005)(2616005)(5660300002)(83380400001)(66476007)(66556008)(6486002)(6506007)(110136005)(8676002)(4326008)(66946007)(8936002)(2906002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/VLX9J0yxyuigkf5L1/E04XiqMQUDfioD6J+65/XOOD9pM2sU+1Xhr9X3BXG?=
 =?us-ascii?Q?9omeK7wIaQiIeHq3ynPSz4KMOZmXabLbNFo72YDcYcXGcTgAR8c6XDX0Ur0+?=
 =?us-ascii?Q?RCSaeEIM6LxSULxV7ZaD2Kom3lU8gdW7uAII5Kw/LO+ohu/TXGk9/ogO60le?=
 =?us-ascii?Q?za4EHHqwTCAew5BFfpg+DKvkuItqkbKNYR3ElJJW/CHVSGy86q2GfTN+YQar?=
 =?us-ascii?Q?b+2o2NfXQ0rQQ+VnbglkZZhmQEmfsSD0ZVky2P4pmAmM+d1jKrM0MAimYWsu?=
 =?us-ascii?Q?R1K9QwAlrT7b+t2/yxLBxsXUHRFWGIq79+vsHIHFswCXz2fOTYKN6MCRRLHo?=
 =?us-ascii?Q?zaqaH61AWTD74mzqtQgPJKu91QblbfCpa2PcE7OgT4noLv+y5acPUOHpE/iq?=
 =?us-ascii?Q?5DGSb3KMeOiHSMux29/s0ogejYUIKcT09sCwnkeJJsX7YTOvFvWzQivnPfnm?=
 =?us-ascii?Q?OOxLraoTfBbXeRKq70MN8EOAOojjFyMzMPhiKfH1l9bmPktERKssPDNS3Swh?=
 =?us-ascii?Q?P3EQNYd+p4S5gVmqtsCE6pS9U38cc2CWfz9NngdIFED8K5CDcIbri1xstt1h?=
 =?us-ascii?Q?peJya4luS8AnWgMZSx2inZUIUKaEn2RX3o9BjZvzY8yZDW7oOOcOlj9CAQts?=
 =?us-ascii?Q?L9T6kbT1jL0Qjx0e/6nQKA+zj5NbYMWq1tUz4/IE/WevmLAA73kGyr4n0Hhq?=
 =?us-ascii?Q?5ePwQXESbe/rxc9NcYifLUOxxNNCqcm3xHR5grRIMo1yBKyUFtsf/PJuU4Iz?=
 =?us-ascii?Q?c8joQlb5ZO7puKC8FFVmrY2rTyj0jcs/SeWXe6CQROoHMeO5zIRYdxrAKepw?=
 =?us-ascii?Q?koLXfn0AkMemzuBqxKmg7GTP5x6aM3EAdrTaRWDFFzbY7H/9OYH5b50LvbNg?=
 =?us-ascii?Q?i+pUqv2mBJL/caWK0YnYkXt/3pAkO0o8rM/dxYH3w7Sg1jH+emm7dTRL3skN?=
 =?us-ascii?Q?MzVVWpK1vjFSE3mtmd7dLaJDCz9jKHKd3CSkRwSSB+i9j9awTedPna8nWpL3?=
 =?us-ascii?Q?CM8Lampq2P+a5lKQbHacDse+NEXWMaew+aiHoSuH5NYySKfNdI4xnSCLVhkW?=
 =?us-ascii?Q?3QdUYr6QXjOCm2uftMgDDSsurDW/dg5p4RhVrr0yNaiOmkxuX1rZcN5dN5sc?=
 =?us-ascii?Q?xYbt85UuoPK90x5t+zk9ZYTfjSrj6B3oJ6oZXCUb2iQhsArU4ENqU8feox5D?=
 =?us-ascii?Q?QF/8PEtOFYjdpQBAedenoe3A0PAnt7WwWtwu2dooKJlaiRMhiOWvEhA4D4z6?=
 =?us-ascii?Q?50q+WEpKM7s8QCIHIQqPU7LFtuZKDdzrQ/eQHtSVHNRH5aD3rEaq7p2LFyjo?=
 =?us-ascii?Q?qnxfdCWtKqIizBP2YXw3NYHZhDHIXSRZBoBH6DCz79XFqjLmnCBiKl3r+zwN?=
 =?us-ascii?Q?5xcHsZBj58ZnIaVNcYlIpkrGt5cfp6jK4GWvrepOi4tyofeTRIm+CZYs642p?=
 =?us-ascii?Q?X/W3QEAGVMq0SBCXrOzxCfSWwyg3rE4HnjLAwwQl/eDuAMA4HryLR4VeZazz?=
 =?us-ascii?Q?zNuNjGOGMFrKhXNDGmmXrKk57Bfgil3yVE7VQJm+bVwr0IohgMUUWDXi1rMD?=
 =?us-ascii?Q?WD2Ri67S4nagDUEwr4KU0qZpRcFN5fI4xlZ/hBDt57qMLkbJ3mG+BbmCrw46?=
 =?us-ascii?Q?4whcCbT9APU/r4NHaAyf/1Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 78dd7948-807b-42a4-07e7-08dbbe58f72a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:22:31.7045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 jktUo7koPEJ8msu9IMx3Bq694R61IMPsWcvi2S2luiiJBLhOveEcsSn463OPaBQi5u4iZE/YhJAtiOP/JTI7WFjIDyAsIWyWIZ0h7iYFyM+uZOU8DX1joywP0fZoxKDv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10364
Message-ID-Hash: O65SIK6ON64U5FTD5VOAN65RBMQ5NLBC
X-Message-ID-Hash: O65SIK6ON64U5FTD5VOAN65RBMQ5NLBC
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/O65SIK6ON64U5FTD5VOAN65RBMQ5NLBC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sunxi/sun4i-codec.c | 12 ++++++------
 sound/soc/sunxi/sun4i-spdif.c |  4 ++--
 sound/soc/sunxi/sun50i-dmic.c |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index f0a5fd901101..ad6336cefaea 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -282,7 +282,7 @@ static void sun4i_codec_stop_capture(struct sun4i_codec *scodec)
 static int sun4i_codec_trigger(struct snd_pcm_substream *substream, int cmd,
 			       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
 
 	switch (cmd) {
@@ -314,7 +314,7 @@ static int sun4i_codec_trigger(struct snd_pcm_substream *substream, int cmd,
 static int sun4i_codec_prepare_capture(struct snd_pcm_substream *substream,
 				       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
 
 
@@ -355,7 +355,7 @@ static int sun4i_codec_prepare_capture(struct snd_pcm_substream *substream,
 static int sun4i_codec_prepare_playback(struct snd_pcm_substream *substream,
 					struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
 	u32 val;
 
@@ -556,7 +556,7 @@ static int sun4i_codec_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params,
 				 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
 	unsigned long clk_freq;
 	int ret, hwrate;
@@ -597,7 +597,7 @@ static struct snd_pcm_hw_constraint_list sun4i_codec_constraints = {
 static int sun4i_codec_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
 
 	snd_pcm_hw_constraint_list(substream->runtime, 0,
@@ -616,7 +616,7 @@ static int sun4i_codec_startup(struct snd_pcm_substream *substream,
 static void sun4i_codec_shutdown(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun4i_codec *scodec = snd_soc_card_get_drvdata(rtd->card);
 
 	clk_disable_unprepare(scodec->clk_module);
diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index b849bb7cf58e..199cfee41d31 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -246,8 +246,8 @@ static void sun4i_snd_txctrl_off(struct snd_pcm_substream *substream,
 static int sun4i_spdif_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct sun4i_spdif_dev *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
 		return -EINVAL;
diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index 2599683a582d..3f6fdab75b5f 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -75,7 +75,7 @@ static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
-	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	/* only support capture */
 	if (substream->stream != SNDRV_PCM_STREAM_CAPTURE)
-- 
2.25.1

