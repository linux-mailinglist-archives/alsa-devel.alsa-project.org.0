Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6D06FBBA2
	for <lists+alsa-devel@lfdr.de>; Tue,  9 May 2023 01:53:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 870CC11A3;
	Tue,  9 May 2023 01:53:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 870CC11A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683590038;
	bh=cAkseY9REGZzhsULOT5Xw06VHi9a9VOc6xmFl+d177c=;
	h=From:To:In-Reply-To:References:Subject:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=pDw/AmRYozGNZKsNKHhCzsPATtArs4xALjCgFk3AcVaYN6oZ8rRbr1a4fNT7DVHps
	 320gliV4Gvpkk504EmLb5MhsDR2YAdBewCDomUPWAx9CiBBZbckxOYjp3RtyeRCU1J
	 reZpsAMFy9xKrUtqpm+/ORRArNrv4PH1517uCpMs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8FD6F80568;
	Tue,  9 May 2023 01:52:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id EAE72F80563; Tue,  9 May 2023 01:52:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 951A6F8055B
	for <alsa-devel@alsa-project.org>; Tue,  9 May 2023 01:52:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 951A6F8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LPD2wE9T
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cnuoec3yUyOd7nPgyIUCuPW8gk5Cmzk74hB1+Uma4jAQxjJ00SDxbSun45vmez5UeFc59QpoY/NWlRsou6T6u+oKsHZ5Hl4qo//maJ/lcgqdSya0wj3GxV1bXPDn2dZVBxgNL+hpnkm5cC3603MTBZulZeDUbChW1AM5v4Nr1vKd6O587Jgw7x8QTo4giuodPC27zflvFmvxIsFEiLBir2gQLXDtcgFYB+lQ8d+dVU4HESsh/V+M8mIANrN2+VypXNFQw9MoUlpbu/y48EwmXtRdE3EgJUb3O0HdEiwfYQe9dTQ/Y1j8h8m1ev3+zKs0YXUcwxyOHbK8Ct/kKA4dNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SJelzOKSG6hyaWuHYx6SIJ93S6WZv/09MTEXHcfo/pU=;
 b=g97Li1TH4e8OTDjV5nv+XP2tMPyn3JYXZ3JrNJ5HHRWdh444QTmyzlxcZIhwhzsSvWBYKX4SuPrzc55s8rmWAjKkBV9N0wE1988V4BnQT0c6PIi6ZzFWof1fwPbdSSKqwW6KtU4qA6ZXWANVT4M7HGU7IZrvQk7GmfS/DW4bkG0/UxfT2bZzUxCsP/Mzs7lfzdYlmocJzkFyBVL39OlxOstblay4ylsNe7LPDEEFhOgD10B0NwikoufP04Ysl9gDa4OVt0oIq/QVLR9IlrMLszOlK4gc3XUnT+Y7R9ABKNY93mJK0qsfJuU/y9tHVXfmMtDX8sViF17t+xKASvnTyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SJelzOKSG6hyaWuHYx6SIJ93S6WZv/09MTEXHcfo/pU=;
 b=LPD2wE9TaSg/Vjm9n3heTacVz3KzfPzfO9yj7MAdq4KGUXmN3iBU7T6zc4623henHr5w9R4RLf7XzolAdjh0VZhpP4tgZs2jVNeW4pNMruZFbqw1G3S6B1hKxD49h9p7lyo9WA5SppbbJfmWXUSivb5AwIPCwrSjnMnfIgLu06Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB8249.jpnprd01.prod.outlook.com (2603:1096:400:183::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Mon, 8 May
 2023 23:52:02 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%6]) with mapi id 15.20.6363.031; Mon, 8 May 2023
 23:52:02 +0000
Message-ID: <874joml6u6.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
In-Reply-To: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
References: <87fs86l6y8.wl-kuninori.morimoto.gx@renesas.com>
Subject: [RESEND][PATCH v2 08/13] ASoC: meson: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 8 May 2023 23:52:01 +0000
X-ClientProxiedBy: TYCP301CA0047.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::11) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f1640b6-c5b7-4a78-54ed-08db501f3825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OGvWzgljYRZAFnKZIqrCeSCqR4xuG0WuT7WHGjZQKo3cS2oGeegTiYCoydlRqCQg/vOt+fD3xWV3zfNwStaCd8a8vZ18ONuwdgMQ/yu8A3vPABt88KhTpS1hgWI4Bps0hXSZebfO6hXQ5ugDAnizohTI7SZZJyBRxLtzDSvF92rF8avF9VeWsLfUVGMrd1d3H+LPEVaefABJ+gwUq3Bszp2MqzASVWHmabIccV4A88/cCJRSfGUf2FhSmI0ibDpt1EvWDQezjdlfw5DJ37wcgFHhwvRSzXzVQarIDqd/UTPOEct352aZrThf5TYEHJBULLejxtsoqyKSjBw8tNexhUf8cHNAc9tPp08+JziGtWuAnAPzD72mSboiYjJHYtBUh7RUf2jJt9Ly9visoKILtJGSsJELwcEdOQ1J/C68l9eCf/BP1jnLhS2FQ200S3yte7UCsQkKgUWTmlCSrq+4+8XtTMTuJIm+pjCmygojVeToKk/T+fsjNSASOBsbS3EndzbSzPnwzJNepCoBYjBLaFva5CxkAzndpMGcAwYnf6UyjJYPgtFPIrsu+9tuwCaDmjhOrHU/yCej8h42CtbQYQd4dcVLMWxRinACambySKkOLHRQfxD6rsDkiKHXCcEv
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(396003)(39860400002)(376002)(451199021)(4326008)(110136005)(52116002)(86362001)(316002)(66556008)(66476007)(41300700001)(6486002)(66946007)(8936002)(8676002)(5660300002)(478600001)(36756003)(6512007)(26005)(6506007)(38350700002)(2906002)(186003)(38100700002)(2616005)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OZCI1NjwGuv6IiQvuiY6C0MMvfTp4BxJzLIAZNYsu8ggieimXV71r/QGdO0L?=
 =?us-ascii?Q?tzJERl9W2JE/Y3MbcGLFsez+AkatJlhrTeoTKZ6sgI/OW/1UK9IsCC0aEuzC?=
 =?us-ascii?Q?nxpIFNJObThfJWV+aGjNkbhyTlom6aUGUo0UFwVF9/YKuQS+4bjN+S7NJku5?=
 =?us-ascii?Q?gfMoUBp4Vz7MLufmUULAQGNnrBQgEOnauC8QqZa0LNgv54GTuIdjfNw+wboM?=
 =?us-ascii?Q?iHz7sTkTNuobAk6WRnHlnHwCwAI0Kw3GU8UJ64v7DOjmkk1dIv8JmuI6dbNh?=
 =?us-ascii?Q?lSiZVxVGOmPs4LgFlRD6wsGisypSQLxAtjFK5/OZH3fthjxMa7zSOvLWCvVw?=
 =?us-ascii?Q?+IehUPd/Fej3YGdsDD2VUi0khvtgckmIM74KR7XBhnnnF8k/LtLcwZE+BmLt?=
 =?us-ascii?Q?rTs5SKSE4luybkxbdcpRCTI3PVRiRzwZrws65D8yw7CgXMF5/eAYwaj5dnID?=
 =?us-ascii?Q?yjDRnNcICVR5jAujKureFWfelZr46IWsZqfCnpxt2KV9KzsNmFEKjdsGIf3L?=
 =?us-ascii?Q?QpTfxrq1xbHseZ+h/0p9tnWLkva+OBIZmbjSeOVTjvMxWXPxt5x8sOHEzj4V?=
 =?us-ascii?Q?HmBZ7jyT7beF5TITRvjzWvj25rGr60qs76wS/w15pM+5epNYwVQhVpx15cRu?=
 =?us-ascii?Q?S1NPd64fKaXhTXftcqkpDK27pGBrt6Q0ZAW4lTOa+8JHLyYSS6qSzy1pFmx/?=
 =?us-ascii?Q?nsHwMsooUlWwNCmCqg0IidfeeJrugZn/DBj1Lh8gGDLXqQxW1hP+BLF7bHjF?=
 =?us-ascii?Q?s3dvhTcUsGZLNv8Ab0oLBIKja/d2USi1hnE4KyMaA/fIWXcio08TDZIZ01i6?=
 =?us-ascii?Q?/fhT7myVLZff+HHY47MGoqpH5BTWR/wYEHIDSmGPfnhoT2OLPN9hx9gusmnY?=
 =?us-ascii?Q?lH9CB9B27bYQ8v+PM7k3uQdt7fl5z/hTfvVGSUMw2eGjBSBwSORwzL+Re8ut?=
 =?us-ascii?Q?6SqNhuMq/M6RFqTsylHyyUEkbaqShfHyA4QLRKrdj8mzIi5UZerZak5PWoZj?=
 =?us-ascii?Q?Xgca6RIdi2H3hUnVMHXbp87JyPBg9zfiFDRmkfxT47rynaYqUTlOm80z0B4W?=
 =?us-ascii?Q?SBibwXJhCydLVAnvwOzLUvgx9a8sKVnyfkrmg7/7+Up1G0Sql22m7Vl9mEj2?=
 =?us-ascii?Q?snXd+ynECZlwsexcDw4Xjq/82Jj4pZl/I0hYgekB72pTJTDkgpHQaGyrOjSj?=
 =?us-ascii?Q?3e132yvHSRZOhtgZkGEcxLR76PiCEMeiVWauQWaohOFKY5xCkJAhLElz+s6z?=
 =?us-ascii?Q?rwMeVI7ix3jPOOUxLzrUBxeeAsRCQtwQoNwPH+uHwUfLy+dhzNsyoj8hZW8U?=
 =?us-ascii?Q?g1ZcnvnXf3+2perUlQwoGWPKo+VCyvRA7ZxeVAE2LSc2671xP/Onj0la6dq5?=
 =?us-ascii?Q?QPknnkBhGOFmhtJEMTT7+IZ1nNmygZnj58IUVvzOhpL4oxgKvfMltxoRz0dk?=
 =?us-ascii?Q?48mVlSc+Qk0GUJtw6d3RxpoR8dkAdEFGPSP9pz9NQQDrkkQbL/voMxi3y3Rq?=
 =?us-ascii?Q?1TTzHt3CljumLp7pOfg3q2t4zUiomgqG7EEZfAHT0yiCoDNaypvWZdivLS0Y?=
 =?us-ascii?Q?Ck33MMAhK1bN68Sx50Sc3gK0jXmwpBRFaeg8kzSG3SL6WCJzsdqLN869uP7N?=
 =?us-ascii?Q?HIQQQIaWUXHlw3WiKDh9Ynk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3f1640b6-c5b7-4a78-54ed-08db501f3825
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2023 23:52:02.0180
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 kfKCIgTjzcnJKFSITg2eyIfG0gkGlFQ6upt841jsupLas7OtgYm8ihjE9CuySy5DdK1CtwZ10+oEy/yU5MDTKqSl2GRNIJHk94VCuAFhXUH9BhnqDDDsTCWYsH20ldvr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8249
Message-ID-Hash: 2OCDLPI5M5N7HJ4OKLTWNRXTLCMKUSPE
X-Message-ID-Hash: 2OCDLPI5M5N7HJ4OKLTWNRXTLCMKUSPE
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2OCDLPI5M5N7HJ4OKLTWNRXTLCMKUSPE/>
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
 sound/soc/meson/axg-card.c         |  8 +++-----
 sound/soc/meson/meson-card-utils.c | 10 +---------
 2 files changed, 4 insertions(+), 14 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index a25c397c66c5..74e7cf0ef8d5 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -120,20 +120,18 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	if (!lb->name)
 		return -ENOMEM;
 
-	dlc = devm_kzalloc(card->dev, 2 * sizeof(*dlc), GFP_KERNEL);
+	dlc = devm_kzalloc(card->dev, sizeof(*dlc), GFP_KERNEL);
 	if (!dlc)
 		return -ENOMEM;
 
-	lb->cpus = &dlc[0];
-	lb->codecs = &dlc[1];
+	lb->cpus = dlc;
+	lb->codecs = &asoc_dummy_dlc;
 	lb->num_cpus = 1;
 	lb->num_codecs = 1;
 
 	lb->stream_name = lb->name;
 	lb->cpus->of_node = pad->cpus->of_node;
 	lb->cpus->dai_name = "TDM Loopback";
-	lb->codecs->name = "snd-soc-dummy";
-	lb->codecs->dai_name = "snd-soc-dummy-dai";
 	lb->dpcm_capture = 1;
 	lb->no_pcm = 1;
 	lb->ops = &axg_card_tdm_be_ops;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index 2d8d5717fd8b..ffc5111f9e3c 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -183,21 +183,13 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 			   struct device_node *node,
 			   bool is_playback)
 {
-	struct snd_soc_dai_link_component *codec;
-
-	codec = devm_kzalloc(card->dev, sizeof(*codec), GFP_KERNEL);
-	if (!codec)
-		return -ENOMEM;
-
-	link->codecs = codec;
+	link->codecs = &asoc_dummy_dlc;
 	link->num_codecs = 1;
 
 	link->dynamic = 1;
 	link->dpcm_merged_format = 1;
 	link->dpcm_merged_chan = 1;
 	link->dpcm_merged_rate = 1;
-	link->codecs->dai_name = "snd-soc-dummy-dai";
-	link->codecs->name = "snd-soc-dummy";
 
 	if (is_playback)
 		link->dpcm_playback = 1;
-- 
2.25.1

