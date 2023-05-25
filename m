Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9F4710517
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:01:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F65C851;
	Thu, 25 May 2023 07:00:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F65C851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990903;
	bh=3UAWpJyK9GEvSTkQzT/uVHN+RWkQFnJpy2a5VbK9LO8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=c0c/kl/EU65U4seddIBWXcvL55D19ebaqHdHVtdYVuyslOh2BbOa8EdLQnUvSguMH
	 HQ7ITqxrrJY3sr+kkAfsaZBBw9pKKxR71dC6VKRzcbfMMTVsqYPAlDVStXpP74XGKU
	 PLE5+teHOBG+VU97jFoR6dS7KsUi/HQ2z26Kmabo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8E69BF80691; Thu, 25 May 2023 03:21:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CC8AF80685;
	Thu, 25 May 2023 03:21:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E36AFF8068E; Thu, 25 May 2023 03:21:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id ABC4DF80685
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:21:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABC4DF80685
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=P1Xbiw1h
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=faKFqjaFiFjsiaOaIpVuwrhBgH6+qT0Q37zovvan529bP//V3TqJnzPgvsAfs7Kh1+sEtwhbgMoB7qx+uas78P9/QyLMXCA4uL2Ilb8aTbNntlyS1uLcyiOmiFjX2BSukB1Fg7mCB6NFovcw4arAxLKm2Cx+YbTeMvWLnzBI8vOQzK2Iv253JdofuKeyuFMIxOS05/KzBH14KbOvkCygXXfqvSz06kSeoDE+y/vaUgCEfO5x7lePJkA5dyd5ruBwJ/7RbJdq//Ivujha90pO9jFg/A7wsJD0A29e3yl4UvonTfv2Xa4Hmf6L+jzLkAC48r6JZFZ6tqZ3f581azTzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/KvGg+GtRs9ZSxrJdNNHMdnxhkoZHdRwXbE8vxwnTTQ=;
 b=NMwOcdJukUTK6eESgSSk3MdCsmwkF3uy3dELk3YloCKQPv4JPQlo4IxG93gZQeFCtVWUGHrXp09YDAGdJA4xrEWa7VKohr9YYsAxPQwFwp6Q6WIeRcZWzZefX/TfE3B3EYRB7T9eT9F84xNxdn2CtX2Zs53Ly62eZnRe4vd2Jcufd5mD+Em+apMweV2ScV+/F3AeisvpMSWIahsHd8Pg24aOofklf+EkBEZWa3iam0lmcecIbvG4bVtWaZLMpNpFEJq9Ly6vs1omS6E15BO4EAyC3gj5r7TWNT3uS83T7WbTlquKk1AvmuxB859f7TIg4XQ1YWQJf97Mz752rfYB5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/KvGg+GtRs9ZSxrJdNNHMdnxhkoZHdRwXbE8vxwnTTQ=;
 b=P1Xbiw1hS38PdsREMUMKQgu8W4TqQXUcy1ERHiQHn3BlJhhETU/9TnXrw3RM71DMKSrRD3HEi5SBlNcW1IfTsFdqtilPI3zyX2/coIKpRjgwbc4ecK68XJvvTFrC6pxsXimafeqk4G3ijh3I8ogxNwFcWbwukeyOSkAhUkOZFgE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB10982.jpnprd01.prod.outlook.com (2603:1096:400:397::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:21:04 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:21:04 +0000
Message-ID: <87a5xtgq9r.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 14/21] ASoC: samsung: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 May 2023 01:21:04 +0000
X-ClientProxiedBy: TYAPR01CA0119.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::35) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB10982:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c6a34f3-90ee-4c0b-7c45-08db5cbe4f3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mGJi14OnYeyaPnuiqELbEgIO7MM08nSx5ipt8LItWay4vTppV3/YL3gjDOm58R6RMpx7+Bl6bzIV4zEVCWbmkGcrvaQHwgAQy32D/i6+5b5eYMunv/FHVGnOzLVEcEnpdp35TGTnMRJeV15Ctv1P1qJdLAeOvx/6PbYBStNwXapaOTQf9zwrmdsmTTeI7z+FQmlxhq7Mr8RThZJw07os024ZJ54BQoRTYjqMe6c/s6xBo5sI5tCeqXYbKQRRI10NhGqgsFNePjMEJGOLBH205xLp4iskmvyJ52z1PHyJ0W1JPTBs0A4BXE+ADt7QsvfeDHh5Azn/E8yWAQZEtHl99c3Gcnf93kIeHw6kTgldDkf+5/5vZjqsDZ44gt5sVoiB0wOw9qdFLRpPAWf0wAgJb9Vh79sGzP92siAqsask6QQHO7nRjgrqZw0L+v0dZ7STeNzNL8ICkH8ye6VU497OqgHUGjdFbOuNUCUV7yX7D9s1pyA81bZgk7kXMy1YTQpHO4prHeuTgHv1xR/jU/rq00u+1Komn05T9JEntXbl6F4jPwP9hzY7UNNQ6FzhfmClVRL+TKzjzGlFXyMhnPWU+HktGaTVIgKUJ9qoxnWmPtlDQN6wupbDHdI2VMEXsRu0
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(52116002)(478600001)(6486002)(6512007)(186003)(6506007)(2616005)(26005)(38350700002)(38100700002)(4326008)(83380400001)(66476007)(36756003)(66556008)(110136005)(8676002)(316002)(5660300002)(2906002)(66946007)(8936002)(41300700001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?a/KyhqDuxkSPJGzpTrWWI4oFfH/KmHyweThIybpIkhRvCxrdLK6WKw+55MZ+?=
 =?us-ascii?Q?++NEu+Z8oOJrFwNMGsCT87YfzN2eO45UNTrpn1LXfGlQ0KOylA/pdQysADJ+?=
 =?us-ascii?Q?ZR7qkba7d2KIO0SPbROX3Y5VIqnvDRPkFLWsvMOAzEV4+xk0MalrgGWIBmA4?=
 =?us-ascii?Q?IAXRQzMqaLu5ldp/XRABtwM4Tmdley/8vrobHbwHZORF0ZrbR6vLhoJvrr/E?=
 =?us-ascii?Q?yBxTEgLWvcMug/1ASD+23wuxdU83fFJMRuCtMU3jNZw/4VGoekP/f2YRzyiI?=
 =?us-ascii?Q?wWOyunhVr6OXty0tp6YM0J+dVmaxgLLnfww1UqmoCMoTAyb9ZiHPCElwXbJs?=
 =?us-ascii?Q?OOg84c/zufcTLO4M73SxISyhEvFhu4rxXyTn5spuVfGk8OdKOZvh16JwyNuG?=
 =?us-ascii?Q?wO7qriD87IH8bjUrapsVPrbQgSiNmroVBEmra5I474vl4GfBOflLqF4x3g2w?=
 =?us-ascii?Q?UOM9n+vRFwsQZrBpUa44Qj2DagwQwYBYAfmRAUqo/q/17rHO2GOYuZrShgkX?=
 =?us-ascii?Q?HEE7Ej4uQkGCg/Fhac4SG69gP+ceEFc48zXetowhIyBX3r5aSgXne1+Hu086?=
 =?us-ascii?Q?LpW9mlunuYkKaergzuVE4Z3qZAR328vWWOXezlxOsiLUnd0owrtiLjfuzzDR?=
 =?us-ascii?Q?4uYWsKK+dcXhsKSY949AhpFG5qp+bZJafJIG+G/BaKHvQ4O6S4/dRcN/72B9?=
 =?us-ascii?Q?h3WNp2vIkfjfScBHw90lYsqUaeadJ0mZD4sxYgC8hgF+PygzqP5dOYRtLZa5?=
 =?us-ascii?Q?MpELKssB1VFSG6pNpPO94gfCwuQTZJDHxfgKpsF0DE6WgWllOxtBNQA+dJEb?=
 =?us-ascii?Q?fYBbI37v1BYvrAOPI5D7kD7I2KLmKJxELm4U7+mmWCrzSik0pl2PJ8BBvx8X?=
 =?us-ascii?Q?NMEV1BPFpcr55dcowUUaTDUQrF8JcpD8QCKZrqF9OE3BRW5qUKxDsGmPRbvL?=
 =?us-ascii?Q?PBwvAk67WL0PLwYBq9BEKRZyjRuAdaMD2ZKbaD0cS4hq8BJ92byFxWOLi4FO?=
 =?us-ascii?Q?kIxafRAYlVXsM1pq8AJmMYC6Je7vVhUtwc8q7oUEOBPkth+X6rLp3BgN8qaw?=
 =?us-ascii?Q?ZwXkJpnpZfZd3b9og5+RJg6PTgzcA9x9IQAPVGWmtYQKVShKzRKaKSehJgKs?=
 =?us-ascii?Q?4gMGuhRvXEUAjJFjhYORLurL99+6JbjxvIUhSSU3+Svosekq9SvuAEeXHgKu?=
 =?us-ascii?Q?CG+Nle/xBOSByrj/fGtsLVqrmb7eYNARz7GtfAx83X0R2PwJSfmhfZw7GW8W?=
 =?us-ascii?Q?8/8xBxA+Qevl13lZ37x+bCWsZ+Vj8xonLo8FaFSySZhsYm5/S4b9yH5QOIDk?=
 =?us-ascii?Q?iMNPyEGSQzaRIe25KHkQ8R58p8lOtrvAKSw0MQmunFCqCGEHvK3VwUv31dMD?=
 =?us-ascii?Q?uQgdLPbEfkNfnQX5wyqxWckEnZVKipHgWuBgHCyUJ+AjedFVG6+yYNLy/a1E?=
 =?us-ascii?Q?0jrQ7wuC8dg5Y64NFiFlGXJL2qVDZd3smQTzkl7B8T9EmV9smq9cyDDF6asC?=
 =?us-ascii?Q?usZC61O6b0RJBrV5VxhIc9z7pIZZFZPEmaPlv0+oEuvgUwbsqpsrQPrYanP2?=
 =?us-ascii?Q?/mSa9BnahY7v0/rPRZfFZzkBKaUNhcNo29/gRA2J4xLwhcwybZHjK25kLPet?=
 =?us-ascii?Q?T9V1H3OeP3nVaNO6wNAKZ4c=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8c6a34f3-90ee-4c0b-7c45-08db5cbe4f3a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:21:04.6973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nEv36NsnjwKc2eyiXk8AqD6kufkR987gD/OOi9U5w1LHwwhWUGtb97u+H5xnLpa0D/c9SXQmao2KU90uhIyo8oe00lDrEYLnPj14L1dAVfaJuk1h2JOnQZcJclLVBilB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10982
Message-ID-Hash: JXAESSFP6DFD3RLFMMDELLO63VMH7WFS
X-Message-ID-Hash: JXAESSFP6DFD3RLFMMDELLO63VMH7WFS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JXAESSFP6DFD3RLFMMDELLO63VMH7WFS/>
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
 sound/soc/samsung/odroid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index fd95a79cc9fa..3fd6a8c2c0fe 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -173,14 +173,14 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Primary",
 		.stream_name = "Primary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(primary),
 	}, {
 		/* BE <-> CODECs link */
 		.name = "I2S Mixer",
 		.ops = &odroid_card_be_ops,
 		.no_pcm = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
 				SND_SOC_DAIFMT_CBS_CFS,
 		SND_SOC_DAILINK_REG(mixer),
@@ -191,7 +191,7 @@ static struct snd_soc_dai_link odroid_card_dais[] = {
 		.name = "Secondary",
 		.stream_name = "Secondary",
 		.dynamic = 1,
-		.dpcm_playback = 1,
+		.playback_only = 1,
 		SND_SOC_DAILINK_REG(secondary),
 	}
 };
@@ -293,8 +293,8 @@ static int odroid_audio_probe(struct platform_device *pdev)
 
 	/* Set capture capability only for boards with the MAX98090 CODEC */
 	if (codec_link->num_codecs > 1) {
-		card->dai_link[0].dpcm_capture = 1;
-		card->dai_link[1].dpcm_capture = 1;
+		card->dai_link[0].capture_only = 1;
+		card->dai_link[1].capture_only = 1;
 	}
 
 	priv->sclk_i2s = of_clk_get_by_name(cpu_dai, "i2s_opclk1");
-- 
2.25.1

