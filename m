Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4422B7AE5F7
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:32:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5CA6149C;
	Tue, 26 Sep 2023 08:31:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5CA6149C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709954;
	bh=RroniyMgQMpSLI5qoDsQgN4oecSh4cyMZzbh9gqq+HI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EyT0SY9vZmBxicrcJzOvzQPYBqEX6uVtLoGy5XoUpQdxW51vojQKe89baM876YqWo
	 vYhtALfHSPO+XSOzWe09DWPhCqjiTqw9BU2oFHZ9Sm3MQapu459/JTo9kGLuBqsRJY
	 HyaHRehehZvMJBaDGs64U0fh8WC+MKwJWlz5Qhuc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 490CDF80587; Tue, 26 Sep 2023 08:25:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A3087F80587;
	Tue, 26 Sep 2023 08:25:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BEF05F80602; Tue, 26 Sep 2023 08:25:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::731])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 65763F8016A
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:22:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 65763F8016A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WmZgdcCc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZwtY8fta9djZak7j/IJXe/Zc46bQk/vSafE/0P/o8Tk7lPqePNnShfabMU7k9zRTg4XovQIZR8dR5NZdJfwhdhzWisgZ9EnKZnksGi6Xaru69xfax96OVDtawz0Bj1C3YZlm/klwE03CTKMdcvoukbz9YYigjXPdUMkdvKduOjxOfKnBidotGj+rIfKXYKXPoN/Pn2jDtDpBpsJwCDtce/Eb3FrEZAcLvmDf5+WvDlK8sdD/HCZpcKXXF4p0hKi7eP+qpMKzxSfmHhEKzkNj9g7az3Wbn8vGONIWbjR8Mqci4yoSJ/19bAD+4xeeKMQ8dZK6Gm/DkAIr/L6m3YeIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mL+TvYL+RB3OsRnhtZCeEQ7mzznRIwMWnpNJVLCyBBU=;
 b=dGeQp103lpwetDt06vwW5wiIEsh2Y4sptqQM0QELZZgbZP6l/GAAHcFWUg603oZT0RUkxA49o/m6hk7RnGa/Ue02umJ5iS40pk+kWXigPGZS+9ZHFneVfgTkcniOu1fGr4o6ZHlR2/KEbVC7qcigN6JYg/bOtrqbiibpOjnJp7M1HaKNiDwzXsJEvUcD/RtLBk8p5w77ZktMrPWNE0dtIivkcgQL1D+7rdyj8jVcN24npgll6BMuNTRz1ND3JMk0Ja8Y1/lPai1x+xWOKsq4JqnZtZtxRVHyLsmnYL2Om28CAbW4cgPO+CsNdWryNbMYbrcpCyO9GQC/2PMK3dWV4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mL+TvYL+RB3OsRnhtZCeEQ7mzznRIwMWnpNJVLCyBBU=;
 b=WmZgdcCcNlahScAqDxLZR2Rvo0BZK+wEy2UKv19e7kzAar4VzuWxEaK3ZrzvZVbbitkM4Cw1KQn1bXiE7tWtJXNvFMnMu8O90sWkRlekafbrKWH6vLcI73JQL9K/imcF4U+o2hOx1N9lNrKn5NE6Me5kPshbJHImJF1S2OJXnZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10364.jpnprd01.prod.outlook.com (2603:1096:400:240::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:22:18 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:22:18 +0000
Message-ID: <87o7hph2sm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 18/54] ASoC: atmel: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:22:18 +0000
X-ClientProxiedBy: TYAPR01CA0224.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d43018e-089a-4cfe-7ffd-08dbbe58ef6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FIE+7cV2iLMqL9CSUG4+8IyJOsfi6TUifgFI36M8iyqX3x3Tqw1mawkmQWSjs5JwUZv7nf+XIIggNjWX1+pJx8wMAu/mmCVJDy/ael2lKwjBb18SzufJUy3gKcTVbcnXwY/AhZQtuhpEW2GknKmrrXQtQXGX7obcNrSGevL1BwrD5vHwU+vTDW8uO5H8F/yQnafIVe013EsJCHt/0+unoqgar4L70e65DQTxe1vwnaam1EtdmIT6bEhGVyOAIzqsgKNDk4muurEx2hzb4FK1I9z4qt6E0WoVfWOqMosMpPsK4LDXVw9C3xNcXLZQ+ze/IeiQddrODI7BSRaTaCmdT1cwUD6w6LEtHhaLMrnJ5Jo5LM3U9vEwxEbi2JPk2Mt3s9bTL2Bxtqj7Vw1bxIyo2G+oLkiM9pMV3wo5eCgbg8ImS5SmUrfKuYJmVyyHIqScUyxWXR8XunMl7JUtczaPwlbXNyr8vH0AmJt076+Z63l/mLFOjSVMBClDWDz8rUVc2z/lJ15Ax/6jVOuDYrAo7ToewtnYpl9IxKmQ5w5DrnWGaxp/q3JvTmq9s2ECSKNOgWQddE61P3YQZcPg9Np/N6Rmizeok2qBE38B4tDMp0rsp5mYJwsaXaRp+MXYlQNLyKMECec4aVZxjxtfOpGPMQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(52116002)(478600001)(6512007)(41300700001)(38100700002)(38350700002)(316002)(26005)(2616005)(5660300002)(83380400001)(66476007)(66556008)(6486002)(6506007)(110136005)(8676002)(4326008)(66946007)(8936002)(2906002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?XDrEa+eTxP1BxoCCr7F9874tKb9b4Fn7GwN4vFP2cXMKww6n615b/rkbllBV?=
 =?us-ascii?Q?dpAKf91MAuLWh39C8MfIypsEccWXECjzZfnUndpr9zUEuINSyhjnYxlmhiNW?=
 =?us-ascii?Q?5LjVwULnNttU+rzYOf32wh6K+GfFQ/s2xcF6sdpIHT+/9SnHPhtbNJK4ZtV1?=
 =?us-ascii?Q?SXC35OEBGj0dPYoIfpmdEKOU3z7JBfCQcp4r9jbfbv0dyEI6MQ8n+dKx+OUs?=
 =?us-ascii?Q?Co5T7EeG3UtmY29VNFrB0Sb08ZmiIUrZLUgAlnveWSHexD4rnCyGrHoNHWtN?=
 =?us-ascii?Q?KMbP77CcYkmfbTboam0zt7mWgo5Wor1bdaQEIvbo2GFwiFO1HbcabCf1ci+B?=
 =?us-ascii?Q?/Jk+1N6ZlKZETUN8Bxy/jgAqq1aVxutu/r7XU2acWYWz6RAiyZzeKD7CJPjS?=
 =?us-ascii?Q?5n4vBhe6+d6abq6zwhNmvcpqcP/V0DYKoXZaBiYL3diwkE31nnAn5+wuAfVg?=
 =?us-ascii?Q?hX3VoUiW0aZJ44IPT45K4xoF22HS0K1UXALZNYQSzjMrrOhOHoHI3Ti+VtGM?=
 =?us-ascii?Q?Wm3DrMK8lpkz3q+JILD6dw3UyWnP+G/JHTFnqdpMEAOZoSGMOuuAV6K4FB26?=
 =?us-ascii?Q?K4Ify9WKR7a8gJ0vX+LCXD0Nlx+WEnxDZ3Y2EuT9NeIp3HULQsG+1+szvmVd?=
 =?us-ascii?Q?iqEuNbG8AJHvwKlEOTQ8xwHcRxTSYO1b2EVTwXzRhWofqbvOPs1iPigeRZb9?=
 =?us-ascii?Q?nOwUIHlUIPnnQ5k8UbCrS6Jl5ggXre0Wq6kS6hdFhW974bZbFSIVF3ipHxCk?=
 =?us-ascii?Q?zT0grRR3Ch14H3IFmblbzz9fmdY5X05RwYZbepSAmyb67EiqdV1CmfabU4oS?=
 =?us-ascii?Q?0NUyRmAAWY71/XlFQvk4eELJnh6BMRRupTC69+I6IJcihOzqyDKYBDqWLQ6Z?=
 =?us-ascii?Q?qNncQqEKI/Nbw2pqu6M6qQpbHTkwCXFmNiYTPZYHehzKSyRC5uYm0FcFpWoj?=
 =?us-ascii?Q?+RsfBM8I7snQXdWGkHQFzFY4mkAT19/RbVuTW/qLVQ9KcnCPzbgzW9its3va?=
 =?us-ascii?Q?o7U6kHffyOTOGH1u7NnynCUKewTZXKucbuCVCbD1bP9DMfZFdzmeAiMmw0Xa?=
 =?us-ascii?Q?JbrfT+F5dPezKy24zf1VnPmst94AMWZG+sPzgAHDhYRzx5ncrR1HdrNB3hDG?=
 =?us-ascii?Q?fnH7VexJv/kDBzRhzzgQubGh3if27nCxdAaRvqxrmm/mAZR5aI1llPYHSc0v?=
 =?us-ascii?Q?Irgv/MR48wK0yWCSCWhNo53YeaCGit63UaMtOY1eVTbV2pYi8s6OGkmWGPgs?=
 =?us-ascii?Q?vVvNKRdCLktcz3++gp+vemLKlFtBiNV4exCdno6nn8CVgbqNtqqDdn/jJCaD?=
 =?us-ascii?Q?RoQANoHeEwj945GLy/ILWvcXuxF1t1Fv356PG2nODrABNwkmJojl3crvzuVz?=
 =?us-ascii?Q?vFd5xDYZ3AG0sF4uWvvJO+z5ay663le2pfID95kA1wx8bAgyr55lUxMK3Q5T?=
 =?us-ascii?Q?WuLdkk9dBj+oYLNgikc9nl82bBD+oluBkOANc4T/m64SB1hhwAPwGsOxKzQA?=
 =?us-ascii?Q?2nmw52k/FdyrtCVren2cBAWxVnFdbf7v7snUYgpGNGVu2vuX6j5L+FUeAlXv?=
 =?us-ascii?Q?UWTibJrWw6kc0MbFr5nfQxY/czEz08incLB1wtL+uxALeaUUKG7C4Ko1SRRT?=
 =?us-ascii?Q?CVJl2MxYjZGiS9Um0uwg2tQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6d43018e-089a-4cfe-7ffd-08dbbe58ef6f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:22:18.8360
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 xDV0xvrpvy5+0gCfn/hsSgbaXipnjWb+BsQkOiJ1+nun4V5CyesZzIPi9/kLHcssK77JSMueVvLdkf+Q/GEBfrfCLtDWKzS9hVbxI4ntcT5g3EptPF7w9WJbb09uL27P
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10364
Message-ID-Hash: 2ZLMU22CYPFWMBIN4IMIJZIEX5ZDQVNA
X-Message-ID-Hash: 2ZLMU22CYPFWMBIN4IMIJZIEX5ZDQVNA
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2ZLMU22CYPFWMBIN4IMIJZIEX5ZDQVNA/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/atmel/atmel-classd.c   | 10 +++++-----
 sound/soc/atmel/atmel-pcm-dma.c  |  8 ++++----
 sound/soc/atmel/atmel-pcm-pdc.c  |  4 ++--
 sound/soc/atmel/atmel-pdmic.c    | 12 ++++++------
 sound/soc/atmel/atmel_wm8904.c   |  4 ++--
 sound/soc/atmel/mikroe-proto.c   |  2 +-
 sound/soc/atmel/sam9g20_wm8731.c |  2 +-
 sound/soc/atmel/sam9x5_wm8731.c  |  2 +-
 8 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/sound/soc/atmel/atmel-classd.c b/sound/soc/atmel/atmel-classd.c
index 4c1985711218..6aed1ee443b4 100644
--- a/sound/soc/atmel/atmel-classd.c
+++ b/sound/soc/atmel/atmel-classd.c
@@ -118,7 +118,7 @@ static const struct snd_pcm_hardware atmel_classd_hw = {
 static int atmel_classd_cpu_dai_startup(struct snd_pcm_substream *substream,
 					struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
 	int err;
 
@@ -141,7 +141,7 @@ atmel_classd_platform_configure_dma(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params,
 	struct dma_slave_config *slave_config)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
 
 	if (params_physical_width(params) != 16) {
@@ -338,7 +338,7 @@ atmel_classd_cpu_dai_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_component *component = cpu_dai->component;
 	int fs;
@@ -381,7 +381,7 @@ static void
 atmel_classd_cpu_dai_shutdown(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_classd *dd = snd_soc_card_get_drvdata(rtd->card);
 
 	clk_disable_unprepare(dd->gclk);
@@ -478,7 +478,7 @@ static int atmel_classd_asoc_card_init(struct device *dev,
 		return -ENOMEM;
 
 	dai_link->cpus		= comp;
-	dai_link->codecs	= &asoc_dummy_dlc;
+	dai_link->codecs	= &snd_soc_dummy_dlc;
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
diff --git a/sound/soc/atmel/atmel-pcm-dma.c b/sound/soc/atmel/atmel-pcm-dma.c
index 96a8c7dba98f..7306e04da513 100644
--- a/sound/soc/atmel/atmel-pcm-dma.c
+++ b/sound/soc/atmel/atmel-pcm-dma.c
@@ -52,10 +52,10 @@ static const struct snd_pcm_hardware atmel_pcm_dma_hardware = {
 static void atmel_pcm_dma_irq(u32 ssc_sr,
 	struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pcm_dma_params *prtd;
 
-	prtd = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	prtd = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 
 	if (ssc_sr & prtd->mask->ssc_error) {
 		if (snd_pcm_running(substream))
@@ -77,12 +77,12 @@ static void atmel_pcm_dma_irq(u32 ssc_sr,
 static int atmel_pcm_configure_dma(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct dma_slave_config *slave_config)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pcm_dma_params *prtd;
 	struct ssc_device *ssc;
 	int ret;
 
-	prtd = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	prtd = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	ssc = prtd->ssc;
 
 	ret = snd_hwparams_to_dma_slave_config(substream, params, slave_config);
diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-pdc.c
index 3e7ea2021b46..7db8df85c54f 100644
--- a/sound/soc/atmel/atmel-pcm-pdc.c
+++ b/sound/soc/atmel/atmel-pcm-pdc.c
@@ -140,12 +140,12 @@ static int atmel_pcm_hw_params(struct snd_soc_component *component,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct atmel_runtime_data *prtd = runtime->private_data;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	/* this may get called several times by oss emulation
 	 * with different params */
 
-	prtd->params = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	prtd->params = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	prtd->params->dma_intr_handler = atmel_pcm_dma_irq;
 
 	prtd->dma_buffer = runtime->dma_addr;
diff --git a/sound/soc/atmel/atmel-pdmic.c b/sound/soc/atmel/atmel-pdmic.c
index 0db7815d230c..fa29dd8ef208 100644
--- a/sound/soc/atmel/atmel-pdmic.c
+++ b/sound/soc/atmel/atmel-pdmic.c
@@ -104,7 +104,7 @@ static struct atmel_pdmic_pdata *atmel_pdmic_dt_init(struct device *dev)
 static int atmel_pdmic_cpu_dai_startup(struct snd_pcm_substream *substream,
 					struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pdmic *dd = snd_soc_card_get_drvdata(rtd->card);
 	int ret;
 
@@ -132,7 +132,7 @@ static int atmel_pdmic_cpu_dai_startup(struct snd_pcm_substream *substream,
 static void atmel_pdmic_cpu_dai_shutdown(struct snd_pcm_substream *substream,
 					struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pdmic *dd = snd_soc_card_get_drvdata(rtd->card);
 
 	/* Disable the overrun error interrupt */
@@ -145,7 +145,7 @@ static void atmel_pdmic_cpu_dai_shutdown(struct snd_pcm_substream *substream,
 static int atmel_pdmic_cpu_dai_prepare(struct snd_pcm_substream *substream,
 					struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pdmic *dd = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_component *component = cpu_dai->component;
 	u32 val;
@@ -191,7 +191,7 @@ atmel_pdmic_platform_configure_dma(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct dma_slave_config *slave_config)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pdmic *dd = snd_soc_card_get_drvdata(rtd->card);
 	int ret;
 
@@ -356,7 +356,7 @@ atmel_pdmic_cpu_dai_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params,
 			      struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct atmel_pdmic *dd = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_soc_component *component = cpu_dai->component;
 	unsigned int rate_min = substream->runtime->hw.rate_min;
@@ -501,7 +501,7 @@ static int atmel_pdmic_asoc_card_init(struct device *dev,
 		return -ENOMEM;
 
 	dai_link->cpus		= comp;
-	dai_link->codecs	= &asoc_dummy_dlc;
+	dai_link->codecs	= &snd_soc_dummy_dlc;
 
 	dai_link->num_cpus	= 1;
 	dai_link->num_codecs	= 1;
diff --git a/sound/soc/atmel/atmel_wm8904.c b/sound/soc/atmel/atmel_wm8904.c
index 00e98136bec2..01e944fa1148 100644
--- a/sound/soc/atmel/atmel_wm8904.c
+++ b/sound/soc/atmel/atmel_wm8904.c
@@ -26,8 +26,8 @@ static const struct snd_soc_dapm_widget atmel_asoc_wm8904_dapm_widgets[] = {
 static int atmel_asoc_wm8904_hw_params(struct snd_pcm_substream *substream,
 		struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 
 	ret = snd_soc_dai_set_pll(codec_dai, WM8904_FLL_MCLK, WM8904_FLL_MCLK,
diff --git a/sound/soc/atmel/mikroe-proto.c b/sound/soc/atmel/mikroe-proto.c
index 30c87c2c1b0b..18a8760443ae 100644
--- a/sound/soc/atmel/mikroe-proto.c
+++ b/sound/soc/atmel/mikroe-proto.c
@@ -21,7 +21,7 @@
 static int snd_proto_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	/* Set proto sysclk */
 	int ret = snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL,
diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index 0405e9e49140..d3ec9826d505 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -66,7 +66,7 @@ static const struct snd_soc_dapm_route intercon[] = {
  */
 static int at91sam9g20ek_wm8731_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct device *dev = rtd->dev;
 	int ret;
 
diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index cd1d59a90e02..d1c1f370a9cd 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -40,7 +40,7 @@ struct sam9x5_drvdata {
  */
 static int sam9x5_wm8731_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct device *dev = rtd->dev;
 	int ret;
 
-- 
2.25.1

