Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 255BA7079DE
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 07:51:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E372D83E;
	Thu, 18 May 2023 07:50:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E372D83E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684389067;
	bh=B3ftONP+YkmSQ3x01Xzt1nD+kxFPj9Y8w2brHu/tG4w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PrO0d27mWD6vH4zMRYVwguxiI5NpIYPaY1emxnAleyDmu+CPYpWxWuPUev5ZKm+c6
	 SbkekbFQCK7zsPDmYIXrqKTh6VkEAZrzmGUxMETAMi7ZKvy/LLhtGZBhapWecjFqw/
	 zj4/eBHS8ExCd2dDsjM+QwrEc2SW2CN0vdD89NKg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF71DF805DF; Thu, 18 May 2023 07:48:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8330BF8057A;
	Thu, 18 May 2023 07:48:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 063C2F8057C; Thu, 18 May 2023 07:48:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6FC9AF8056F
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 07:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6FC9AF8056F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jynZT38D
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWpuCc89kUyELIcl1ZcpIeOX/Gj8DgY4wpJpuycFJKnh51fpet1KJfbIydPgoXX5qk06zS33lfIIOtzo+K3m6BKEELQhco1oSz3oVktAj3dW0cFjftzI8IFREmxwF/JDul8ae5ZGqEqltF0fo7PJ5RXq2MmzzB+jmu7Pcb30fxHRAoyEEQQadQRb1j6Xbq2wCgLDEy5ING0HPreWpBE6hh7pT4VWEftP05l8T+kLyxUCflz00Bj/xRIHOJRHN42Xmh9XnMHXZ0oatuMsb1zWc6mGS0vfo3Kv9WzIgkvqMBJbCNNKNbGeZkIQCL4mCdlJ6//1M4eqidOect+Gm6U3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9H9iKZmrQL9EcgiIFBJwF3X4RSUHdBusJ2Ue1tVZU4=;
 b=hiHU8HwXGBvkSwgqQQhML6VkKq+gekTx+P1CIlllkRlO+ls4JupSPboashx1DgK6GR9fQkSDIRK89R5Wi6w/uJ/BddAgexEtt3/w2C1uzUmSO3u22wdKUatMvzr+qmdtEnJ5RTbJcxqhw3O+NX0NWd/191FGV8CyM3SBjY0f4D3Q1pDaQQB7wf4vZeTvJQZnfXP38ID/hLPA6A3TqH0R/wNdy08Y3cxdBSP4b67+ZTu4ekIg3+fgJ+/VYAL67VyPqgjRG5aChU3UxRSZFEJdh97RtHvJmNNhBuU7N2liP0qNdoYXKHW5m1diRfnfTJrkKfXkkdnz2S8buKARhgdT6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9H9iKZmrQL9EcgiIFBJwF3X4RSUHdBusJ2Ue1tVZU4=;
 b=jynZT38Dh1UgWdAHW4i8NP6+FkzbtWEP7J3Q8Pdin9KdCqeK7dodjR50gJTchxSPHgM2wLOsHCwfvdCtN4jJfy6ED2WNgimPn4AKj56KziTehJYQaxdCoYnsuJfDiutlp5d9Chw5PlREXg4dZLkDa0QlQMUSzzBv8ExDnMyEDtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB5591.jpnprd01.prod.outlook.com (2603:1096:604:b5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.18; Thu, 18 May
 2023 05:48:29 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6411.018; Thu, 18 May 2023
 05:48:29 +0000
Message-ID: <87lehmp4ur.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org
In-Reply-To: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
References: <87353uqjiu.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/20] ASoC: meson: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 18 May 2023 05:48:29 +0000
X-ClientProxiedBy: TY2PR06CA0040.apcprd06.prod.outlook.com
 (2603:1096:404:2e::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: dcd49926-0e01-43a5-659d-08db576381c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	kbA8Db95CQCqU8RgrKsB9aDCz8AN0R2KkOa5WB26Ny4NqTCMr34vbHXK4ok4LO94ANLTbbPhT518z5V/Xp8gniykc4WSExNwOoc2aq3vpqe67ppUxu7bMAs41iZpUYphgUWWGKU6iNzvfubhMgfJF6U3R+bfiy99Fx8P6x2DXg7OhfMxlZ+j/TYlYauPS29Q2UN+Jp5/xkdT7bTemPZhX0im0Tc1BXZ8aSlQMmzDr/K2yvb0aJTRL5kjQ0WbsMF5Cqj9+4/GUz3Oo41X3vjqEoRYgvJB6+AROB1d2M5JXoGabH1pGPM9U1d3mtNU38g8N6gpZcJELWxngLsHld4W2QuxfAKTAZXkpPumnl3v9x7JZCJVf/tF31G4G6H7qXlDHs17vGtmzfW9I9RjL/yk8/0SsKadqybL0tMJdGmxW2s227iXVivmWFcXJ78zobOe4BfeT3I/Aa5SIS+m7j9qvBVEikcLw2O1ewAHlDkjX+nBIC8EtR1yqyHfgmT1Sh+xNWUEeceDdVEH6H//zwMqE8/puAb/7mu3VOWNrlwxN6fbgPj5blwV6wKRgYGgdvt0gnh0muhz6tK60ceIRwdAVAxdaD6DmZi1uU0GD8kkqpPob2ABC866WNhQZ7U4mI6F
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(396003)(346002)(366004)(376002)(39860400002)(451199021)(316002)(4326008)(66946007)(66556008)(478600001)(66476007)(52116002)(110136005)(86362001)(36756003)(83380400001)(6506007)(26005)(6512007)(186003)(2616005)(41300700001)(6486002)(5660300002)(8676002)(8936002)(2906002)(38100700002)(38350700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?99cXu/BqPXbrJ+gaSswfgwzx9q7NRAtWAnqWaMV17K3RC293GNNh/0vxNCpA?=
 =?us-ascii?Q?Ht21RXzyxa8NNBswuBiUMguERQYzqgQHMHIn5iq/wYeXKsJ6MGOryqZelchx?=
 =?us-ascii?Q?3Jt/3KyP2f0oMP73RZC3lIeWh0lz1CPqLaJRwz4bIbi846GDPqFn8zJSUy1w?=
 =?us-ascii?Q?ENPzAPtoeZInuMQXuYFjOwCs4nA8cAwvlL2RNiz2hdEMQgLG4SE9FVNjvVQ+?=
 =?us-ascii?Q?xcsluy6lFo1AHlbME++syI1fpy2N405XLLrR362se5Mt+c+DlDPQJ1HBcced?=
 =?us-ascii?Q?Mf9kiaG3po/UC8/gOJzHMZ6tZRLwUVRYat+kbLYBEVU+9Jq5Cr9MGYtb+9Ka?=
 =?us-ascii?Q?rBd29SFz3nXlTR8s3Mfpn7/C9w8vvwyi1HJo5BIcLJZ1+AfztMesQ5ka55S+?=
 =?us-ascii?Q?l/TaQc6BjqNNZNgVEKyYynl0GO9gv3+4dvMEFIK/uPtvccUKu3qVSpJMlP8O?=
 =?us-ascii?Q?oPoel0wGqVvth0hn9L7ZnZBGrNTRvsUy5aL5x50PI9cVKuRyOLWTydGNiaTq?=
 =?us-ascii?Q?Bv+eFsdQsy+5aq1kCYQOcRzEBDruA0Aq0nJuD2T+B2n005gb1eJAZdKOC/RM?=
 =?us-ascii?Q?Ng5DqbDml0jvJGPWdMY3FIc5mdyiC9SlTIPI+qRi9X7xMkBc8wBFrTo3QfzK?=
 =?us-ascii?Q?uIqwUPdi3kkKXa3Y39e2jGTc9ZC/ygrT3loS39NrI4tcuXZhZE++QdJoMYVJ?=
 =?us-ascii?Q?Bj3SD8/JB4jZ+c4ggOIZ30awISwTRlv8U+JOkmq0Hr/ADunNJqbglsKmeywt?=
 =?us-ascii?Q?7GffYxRA73hWYQxiqUkebUP0LXGhzSkUHM9rV8gSW24z25+6rcGSDlvPZ/g6?=
 =?us-ascii?Q?YLmTRB4cGXj7l9yy5W/AOxm/ICVONzB4BxRwhx0vTCbTUNet4fA+Gp3E/EVO?=
 =?us-ascii?Q?dQ375++txrIu27bObpcMWTk1iTFwVIhVz35ZH2GNa9v8mvJYTsHoSXRCEuyi?=
 =?us-ascii?Q?397CpeEKn44n9ukyGM/bmFiT9V9kRny9Bcc9yDoiBY6MqthluscyIR8iHk6+?=
 =?us-ascii?Q?Wpi4qmm/CYYabbC2jiq7RqJI5Xxki+CbcPEsoL6GdNcPLWWhRb2FxYth+1tX?=
 =?us-ascii?Q?I/yBl9kcFNIFp2p7pLRiAcIAND1LVYJOxW4oUhlPBSItixGcgfJPfX70yjm1?=
 =?us-ascii?Q?Tga979IUbB3Zt/7/co2xcbBiGslqpHIvMQWVu/imohDRKN1btVI9DiUNz4fb?=
 =?us-ascii?Q?NUXHc2Nk/UPBJunRWE4Cg21jgZMgpCLSisqwtPFTShj5hn2wHsvXJFJK2DQ5?=
 =?us-ascii?Q?iHwBqfr7ahkJQy7Op7Nm113cNZDH4M9XcKUye83qyP7/kdATjA+bzJcTUc9T?=
 =?us-ascii?Q?ZrzwDCj7nIoED0lCe8VF7qPk/y8H994HrcMzA27zaekXHfIKxm6W0rU7fRHP?=
 =?us-ascii?Q?jh/wj9NfygdKraVOcWuzSNJHDQqywjPImr5GocEmKXupkdNrSCVF3AF1331H?=
 =?us-ascii?Q?qlz6pZC2pTBf0zt1hxqPBlgj9dkRZGMNFgfOeDoyMkRDGbCm06NH/a2rZUw0?=
 =?us-ascii?Q?M3Q5HeLsKaaQER2niJ0gZUrzxNseoc9NqCpEOhyJUV1D9p73vZs0tHTL9sNH?=
 =?us-ascii?Q?9bn5SMIDMWWRxJaY8r1g6J8V0lR63dua3k/iZNVYTfQFz+z4Cs9eMNlV1dgr?=
 =?us-ascii?Q?J21NVer5XCSwVMSHyFlCj3k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dcd49926-0e01-43a5-659d-08db576381c9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 05:48:29.4993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uxRPed06hEUvSujEk55Z0oekT2iTYlOWRc0zDBFBKD26UkLIImUs6HTwRl3yk43dVLcY8a4Pr6H/s0zzVHxl1GslYGuduThGAozpB6w4lFMIvLdCn6+/+bLgp1er+S/4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5591
Message-ID-Hash: 2ZAIJKAS27IIFZAK4AEA2LHVMKRPRCBK
X-Message-ID-Hash: 2ZAIJKAS27IIFZAK4AEA2LHVMKRPRCBK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZAIJKAS27IIFZAK4AEA2LHVMKRPRCBK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c         | 8 ++++----
 sound/soc/meson/meson-card-utils.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 74e7cf0ef8d5..2d62e1ae7425 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	lb->stream_name = lb->name;
 	lb->cpus->of_node = pad->cpus->of_node;
 	lb->cpus->dai_name = "TDM Loopback";
-	lb->dpcm_capture = 1;
+	lb->capture_only = 1;
 	lb->no_pcm = 1;
 	lb->ops = &axg_card_tdm_be_ops;
 	lb->init = axg_card_tdm_dai_lb_init;
@@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable playback is the interface has no tx slots */
 	if (!tx)
-		link->dpcm_playback = 0;
+		link->capture_only = 1;
 
 	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
 		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
@@ -186,7 +186,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable capture is the interface has no rx slots */
 	if (!rx)
-		link->dpcm_capture = 0;
+		link->playback_only = 1;
 
 	/* ... but the interface should at least have one of them */
 	if (!tx && !rx) {
@@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 		return ret;
 
 	/* Add loopback if the pad dai has playback */
-	if (link->dpcm_playback) {
+	if (!link->capture_only) {
 		ret = axg_card_add_tdm_loopback(card, index);
 		if (ret)
 			return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ffc5111f9e3c..8a531ec8fad4 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -192,9 +192,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 	link->dpcm_merged_rate = 1;
 
 	if (is_playback)
-		link->dpcm_playback = 1;
+		link->playback_only = 1;
 	else
-		link->dpcm_capture = 1;
+		link->capture_only = 1;
 
 	return meson_card_set_link_name(card, link, node, "fe");
 }
-- 
2.25.1

