Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D09C9829217
	for <lists+alsa-devel@lfdr.de>; Wed, 10 Jan 2024 02:28:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 61824ED1;
	Wed, 10 Jan 2024 02:28:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 61824ED1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1704850136;
	bh=c02eRDm6vFT815iGcM69mzchvTvTCzBt+yrAyrFq6GY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=LZr5kXjy7lOnnKgkCQkYPKXNOQEwnpa5o6UOgowpswmWyuwMC8sXyBEzVLuW34vL+
	 TrhCPL4Cv0KchUiiZu409DXRXBi6lZmGMCUueHYL6NNbQz0gBtz1jwrAB81Fez106I
	 0XE4XaMrrnlnEmxOcTKg/EY4mc8oVMz4iPzd91Ms=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2879AF805D9; Wed, 10 Jan 2024 02:28:27 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 10A9FF805BF;
	Wed, 10 Jan 2024 02:28:27 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4AD22F8057A; Wed, 10 Jan 2024 02:28:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCD1FF805A8
	for <alsa-devel@alsa-project.org>; Wed, 10 Jan 2024 02:28:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCD1FF805A8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Y/76V+52
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZiRLBQuVJFT0zY75qGUX2xuElfm6/NnVSlpC01cW9FBxKNPpp/k6pYu+9/DayPJF3uU4HG2emBGreSN639YXpZkImTecJeU2ql0I9Cj6Kv/hujRzq7FTmOwqMbpANRT2RILZ0GOPpI4GqHfNEnM8oJS2DzJpW/QPqpzThtgLQWw9A4Pu4t4nDdSTPZTphA2+6GIh0c8UF9wsww+BxswmXx6sgMtTF8vZzqEC71jaGzwKrNpyW4OCg/8OPy3pFxvcGX5tfSg+FVEdORVnXs23UhJwBajoHy7wsNca11Xo6VCshBCwLv5Qhu05OjSzIEmPweP9fSTi/mPLubtBxNxr8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sS9y6VpoNPpYM60rAeyrbxprqCGJwjIbhK7CHYnvZ7c=;
 b=HTPUn/ZRFyMEzrFEExF+xqPNMJPJ6SPawF4+qrQIbEJ5UgHM/lrcBzkGZgsOoDVpehpuMlE8IrChHDR9OzIFvEq1XxJ7jaHHecTzKkQqBVB1YDJ5jBkY7LRj1qK8A7RDZPADaj+SE3tSK6tX/iqbT4paDyifBWFjR4pNs6MM61xwyWrzY3lyStigz1DelIWTU8Q5U298Gzvxbf3CtXHAxxitbPXuPvVrrrhUuwDxeBoih0y6Ex343a97aL6zrPBOQuJ/AG709y3ZzuSFiD5XrRm2vzwoJ54b+oIO76YWK+KAcT/C/17L45E0SLxBcV3dhLN3JcRH8x+irfIqoVAmYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sS9y6VpoNPpYM60rAeyrbxprqCGJwjIbhK7CHYnvZ7c=;
 b=Y/76V+52fTLLwAN2JsaPKYGwcSi8AoV7UKYa3G5gWhG8KqRt9qD9vjHtuiJ32hX8aEo55YdBP1pFZCv8nLq63rz7WO0KPnv8xQeWUCG22OCkZT85I8pz8eFih4zCmZcN04yVc8n33d8/NbEBLzgM3AUtGxsFMEqVYla2yWYS1G0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8341.jpnprd01.prod.outlook.com
 (2603:1096:400:15c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Wed, 10 Jan
 2024 01:27:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::91d:1bfa:edc4:1c5b%7]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:27:58 +0000
Message-ID: <875y02geox.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jarkko Nikula <jarkko.nikula@bitmer.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
References: <877ckigepg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/6] ASoC: ti: use devm_snd_soc_register_card()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 10 Jan 2024 01:27:58 +0000
X-ClientProxiedBy: TYAPR01CA0118.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b074733-62c4-410e-ef97-08dc117b6117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rROfLiO2wymmRbvet2fxRFRjiAO7myFmKDtFzFMMxGv6dovu90iboCPMTWhiHRA+7Vc0cd2fR11k+cP+v4iFvC5AjJlK8W6oqYSXgv6YJ4xMxpqw4Sghn1RAMi9mCdoe7HO5Vx63Fz2XzitWeiKPlu42Ez6GNnhJcS7rAtjudjB2rD2vZ9j7GXYcvEQ74a/zMkFJX3WZFD1sQZtcwjhiWjjH07XZF6K+9gWqwRIB5cIdhsO7d0O+w8N9d/ZjF19I6w/fA01uv6/sK+1FNKz+9Vue4ZwSh3D/BUKF3P6JmtEKsQI7DM5vjFxCC/L4BFqqX4wA/CvhdHmo1jSt4CUBzYH6PbdBtBsIzJL493HtX5ctwmsg9vD+OMQiRGPywsqpbnxsHIo2H3yXiMG2MpL42zUTxx2J5dJ90PUe57Y/gjgcIKXKz4bO+XAyM6PLVuEcUjgkMKPe+cqosPwspm0LkBDEkbMCcQgkkddkzahdRZ88vdhg2gpM9izlql9FNLUlRe1pd1faT5dLKsweHsKtPoxAS0/txqyj2RP/0QBuo4znzQ+dVUG6xGrgGB82JxjH5k9AZpfe4ezUxN+rOeU8Lfp+x18dgFC41jfbZFqjNOIyAnSfuM/yft0mMGL2bxot
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(396003)(39860400002)(136003)(376002)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(38100700002)(38350700005)(36756003)(86362001)(83380400001)(2616005)(26005)(66946007)(110136005)(6506007)(6512007)(478600001)(52116002)(316002)(8936002)(8676002)(6486002)(66556008)(66476007)(2906002)(41300700001)(4326008)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xneZlWGXpqDjTAh4t+aqJCvyPGTLiPAe9OFs3xZKdUap+uAkZumXEFqha4xO?=
 =?us-ascii?Q?nM87BPskRBLvvw1AcUUPlOkfz1ZE3QozUIspg/E7pq8DmaZ1bMiT4JK6y9y0?=
 =?us-ascii?Q?jUmLOmEGEcZC3CXlgi2qdSlMpwEp+nz0dvH2YT9bvNDlEING4aYi8rOS0JHT?=
 =?us-ascii?Q?odvCROw5hw9Yd9pHm/8Gs2Y89DkZ9yoZNhoj90/JGVj+uDXxdaxVp3RVYNYA?=
 =?us-ascii?Q?GkG+e3OAyvj6rpblwsPsZeO5Bydo5VwpzKeS4IpPquiQOJk74jTvSdBnaC1g?=
 =?us-ascii?Q?Dx6KicJK/U3HhuOuhRLp4qYKZS2ywhZwms/AuchPU8vqWd8I7lIgfeQD0Ioa?=
 =?us-ascii?Q?2793pBa2Mg4QYER26h3iZ3YP2bYkgK2CUesAqeRgWn1YzkX4I4c9Qi+EBML9?=
 =?us-ascii?Q?TLG9JACkomTvXLj3gOlX7B68EfRJHzLrGz0REi9i228M8ecFbWJ40SkuEUKt?=
 =?us-ascii?Q?+WXItmCzuC8FoZhwr1MkIV+cGn8KzSEPG3N4oBh5Wm8mIAbv1zpEPU1t3XFu?=
 =?us-ascii?Q?kRJfmmSkWcQ7SvlkxgvP4HKyMeKs+BEn7+MRJnqwo110zlH52b+pQdAZwypF?=
 =?us-ascii?Q?vYswwVZqFJJuTWYB8pnw9QAoum8py5BccQTGvlLWyYhMn4v3ilxilKt5cT9z?=
 =?us-ascii?Q?8MxQQmRr+XaGZkhBng7E8fhwBMzCxUA6fWuOyodLJ+SbbCZYxRb1AEmm3skx?=
 =?us-ascii?Q?XFFlq2jrgn+nD7ytalhURKdiPF9GixKl21Zq2oRNdu4Jd5lqMNbXIGZ/ADe3?=
 =?us-ascii?Q?G3VANMvYwdItaQ/uAp26gleB/VQqi/N1cxEOL3PTodM4CoQfQC1WtEMKBtic?=
 =?us-ascii?Q?gTxnvvLYT5jMuYVGfWRmLMO88GDznEW2UX0yLA0TYrl3aPIG32pq4wfGn/PY?=
 =?us-ascii?Q?tVmWgi5M0Eo7lR83Z22EHMRIM+cGHpTYwFIUP/hAh7Fc6cQZeL3A3KvJE78C?=
 =?us-ascii?Q?ElmTQXwDLprz32Bq6q2/Ed8syXwSk5UR+vHhCbAKxICPBw6Ut5Bjm7MDp+8q?=
 =?us-ascii?Q?9q5WaZOgypbLkdn6EBEQQkwk9UFjq6KbBpJFRJA1SkDO6FPKJeqpL1FnZLfz?=
 =?us-ascii?Q?+mrbSvipcM9mnOgzc1wSHyqqLgsYcs23LSMbYFuuFYTwiMXLuD+4G7bliRr3?=
 =?us-ascii?Q?1G8DJfhdIntpPoXorhH8EjXgomToIqWzlq64MSq2GlL7X9dSGJlqnx/yrZC4?=
 =?us-ascii?Q?mHarMqBtO8cPVivA9Dfb2w6i79rtpiQdjAlL3psN85uI3Yf8ZBL+0WfheKYG?=
 =?us-ascii?Q?8YcA26va6yDcHuhuVhmZq7XFX7JdfRXxVnQf4L3Q5cb+w9Yd7kd2xBwdaVYK?=
 =?us-ascii?Q?lgANMnE+iVoM9KDTS4/hAInqsdrxojCvNba6gbWBGbId0x5HO5S340FsZ+om?=
 =?us-ascii?Q?wPg+lz7mMJjklOERcpiAETqWRzM3ziLyY4TW+gicdrqkVL8T/gxD/cyUurOe?=
 =?us-ascii?Q?BczEQhNDd0L60fM/loeOPiGvYsddgc+z1Ltt64qeMif9pdpmXHn0Hcw9yPAE?=
 =?us-ascii?Q?WW2VsSuiManzPk6ewFhmzA3gZz1dcR3odLLVQWqPdc/67KJm9HBr8m3c82lL?=
 =?us-ascii?Q?LGeks0pvcdrjKqlWndb3boWKcfAq8xG9RUVeRFR7i/7Pdrq9cKQfHT8KYq5U?=
 =?us-ascii?Q?nONjuwfBMnyxKEfnWTEto+4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b074733-62c4-410e-ef97-08dc117b6117
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:27:58.8639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IkDdX32TIJaqiwJ5NkDeocEmsyhlzx/gI//anJWHVDUOVNrbwKjKniYhNbR3tqUBQWRZTvu/nmLLK8p6U6U8Gy+1mC0uZEWu481ZW3eqLZf35Sbx6enmaOBnJoTSFmrW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8341
Message-ID-Hash: WL64QB4FJK5PE6M2Z7A2AMBR6IGSMIVC
X-Message-ID-Hash: WL64QB4FJK5PE6M2Z7A2AMBR6IGSMIVC
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WL64QB4FJK5PE6M2Z7A2AMBR6IGSMIVC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Let's use devm_snd_soc_register_card() instead of snd_soc_register_card()
and ignore snd_soc_unregister_card()

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/ti/ams-delta.c |  7 +------
 sound/soc/ti/omap-hdmi.c | 10 +---------
 2 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 76bda188e992..509a13cc265b 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -569,7 +569,7 @@ static int ams_delta_probe(struct platform_device *pdev)
 	if (IS_ERR(handsfree_mute))
 		return PTR_ERR(handsfree_mute);
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(&pdev->dev, card);
 	if (ret) {
 		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
 		card->dev = NULL;
@@ -580,12 +580,7 @@ static int ams_delta_probe(struct platform_device *pdev)
 
 static void ams_delta_remove(struct platform_device *pdev)
 {
-	struct snd_soc_card *card = platform_get_drvdata(pdev);
-
 	tty_unregister_ldisc(&cx81801_ops);
-
-	snd_soc_unregister_card(card);
-	card->dev = NULL;
 }
 
 #define DRV_NAME "ams-delta-audio"
diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 29bff9e6337b..4513b527ab97 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -379,7 +379,7 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	card->num_links = 1;
 	card->dev = dev;
 
-	ret = snd_soc_register_card(card);
+	ret = devm_snd_soc_register_card(dev, card);
 	if (ret) {
 		dev_err(dev, "snd_soc_register_card failed (%d)\n", ret);
 		return ret;
@@ -393,19 +393,11 @@ static int omap_hdmi_audio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void omap_hdmi_audio_remove(struct platform_device *pdev)
-{
-	struct hdmi_audio_data *ad = platform_get_drvdata(pdev);
-
-	snd_soc_unregister_card(ad->card);
-}
-
 static struct platform_driver hdmi_audio_driver = {
 	.driver = {
 		.name = DRV_NAME,
 	},
 	.probe = omap_hdmi_audio_probe,
-	.remove_new = omap_hdmi_audio_remove,
 };
 
 module_platform_driver(hdmi_audio_driver);
-- 
2.25.1

