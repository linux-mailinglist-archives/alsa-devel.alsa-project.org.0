Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 630FA774EE0
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:01:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADAF0E84;
	Wed,  9 Aug 2023 01:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADAF0E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535717;
	bh=2P6hxfhjQ26ia4EXM4U2fcu2xOjRmEjksXn2PeH2icc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dt2Wami1h12OXQJIqi0QUhKh0gfxcaXw+xehf31bTX6iKZwc88Wr+yYqrX8r/en8w
	 CjLxSzdwHRnB3losoXzXmJ4PRPVOpC1QikswPc8ElIgXRYMCOLJUO9uX6cr5vf6QkO
	 zdmmJ7aThHqBkrBtES7aYINx4v4F3681pZjDsD4g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5E1FF80651; Wed,  9 Aug 2023 00:57:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id E8C5BF8063C;
	Wed,  9 Aug 2023 00:57:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89757F80639; Wed,  9 Aug 2023 00:57:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2070a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::70a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6D1BF80587
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:57:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6D1BF80587
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FRobZ6i7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BsVVJhKsluMy2Dmrb/rzk+0uO5iIiSVq2a2k9YYOZMS1fhgEvcAueFL9wZ4MsulwlSUqKMI0SGF6UXCNUCuvVasvBKzOpB7fHsebPDKYWWgC9uXiy9E1zXuZ14lPenu5EP+3m+pyN2f25uPKIPZAJ26uQr+CS6CMvo/jHDWSRuoG+DEDMGspjVSk5OyYcI1PZiH6KPq0ZI9JaldylsH6NwsrzJzKjdGyvLG7Gejx7Lxrh21FtQy9FyVPA+q/FioTNh2YkTCEKYRKJB7ywGgVE60kCAvzDI7Xe6WyQEYideJyYUdAYAfOTa9gVIRcTxqO4SiqCqWpvYYyyk9QJWFXTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MME9TMibQbXsaRHEl5cxqu5qB31oVFXoOIPPtbVTzCo=;
 b=S/N+y7NNY1n+U0BZLt7LdBJFlDyMQljPiwzDidOtjXD0Sh5tXSdou3qiNxuF69mIH0vHwEBJDYp6CzXf4JjW+vMiP8A8QPTHHsmIW6fCoosYdGPjbL0psfpOU7qfNsJ303VNfujLiOzS5412h3kVR12At4DNDWB14D7trn2P+5CqkVL4PbZC7cxZejXnw74JYFEcqytPD5WAsmVE1QjsNXDTfbM8+sHVdZmYMwcbYqxUMTOVPvD1Ew9EXrnpyBw5lsOBvDUgrcOBBH+XB8mwyCIkMcOGwEy6qKPYZLOzND5kVGPWaKxr5TuTIRsOeMVff/31TFfNCRuYaEK0X91AlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MME9TMibQbXsaRHEl5cxqu5qB31oVFXoOIPPtbVTzCo=;
 b=FRobZ6i7qn2IoIq4kWxmVhoDVkW69NRIIROALUZKq1Z1dV6OZdtFj2CF7aFNGY87t6GviZciGzWuixXmoIpFzcX8oYXsjJkMh1tTTICaCJsTLr6x0AV1T0+Wb0KAa/9IsfUOTy95ig5SpWb0FR82e5q8CFBrZMELp+YOU7ceS1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11379.jpnprd01.prod.outlook.com (2603:1096:400:3f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:57:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:57:04 +0000
Message-ID: <87350tb0sg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@microchip.com>,
 Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 21/39] ASoC: atmel: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:57:04 +0000
X-ClientProxiedBy: TYCP286CA0342.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c0220d7-2c33-4d46-3066-08db9862c8ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L3BlTGL+8tAC9VZfhFOCfrO1Qv6cWEsY4rSnCCZFFklziBt5tu3UWZAOFmCgUHpR5OAQOoXaoyCyQwo11eGCavJ2Sy72tqeoX5Lhw4MPhU/xsCXAcSEqZOW8gurIlYJZ3Q6E0yHSLnKQeMfvpvO5CimC1qNNx1MFlnltgQZHHpDebVIo1bajCRZrJcAHVWZAwJPvcGY1s3d5ZqJDnVAPbxRQzf3fkBxYYEb3KoVxtDsgOdG0B36HkSNXx/Az4LXVSHTQQswOWAkzisP9NLTDk1QdU5KMFj7GwpriOAt72A+aQWawI4ewmcEhBBNJso/3k65aympqpzUqIRrb09CDimSvRm4e81g0hP1jfTglxIOEB5tjrAe4LqlQwTw5XTSAO4G3edrUcrYR94sioDZwdi3mfqUIaPZR/nKfmq2PngNBrfQwgPenQSzD2HO3876RXhtW6gW0Qv5vZpoOK/qJZthvVB4HkJRf2K9SkIHjJBSNJDWVZF7g6/GzeqsdKM+L7+aMb4vmnzCsBKfAV0+XvcW3yu3Zi9I4FaUkx8hsVbAXe+Ib5QOkRWD8j0Ndl8NElY8Vw2Nas7i470/hyILBMxl04v2r56VeiRSAYP2RHIx1gRP+EAc84xIwkXfUxO7y
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(1800799006)(186006)(5660300002)(8676002)(8936002)(38100700002)(38350700002)(2906002)(86362001)(2616005)(52116002)(6486002)(110136005)(83380400001)(478600001)(6506007)(26005)(6512007)(36756003)(4326008)(41300700001)(316002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?36ihWVVfDXUY0ZohfczsFa+bfSMvJDYzLhgJ3WyTIt4tZilbbUIdVGp+Ov/z?=
 =?us-ascii?Q?jNs/QRDXr7Frsi7ehjEPKCiFANfysYM6bol+BcO1TkXIMEsy9VzbqdIWkGMy?=
 =?us-ascii?Q?KDSTVyBZM/USJhymovmfB4cL+6iPT2Lz25hVnBP+GCUUcsQSMCBXl6qVoc72?=
 =?us-ascii?Q?qn4GOB0IuE8h+dtyUXMWSW24fTVLx4yN/JV4eS9Vd3Lm3EUhqPkuCTTqt+Fq?=
 =?us-ascii?Q?vc/Z9XSL5FbdDCCzFgDpQj6x+LRv82QgvdGenIE/zaDLStPYXqN4grakj1iA?=
 =?us-ascii?Q?OwtyKtyL+1v6i8Jh1sY8Pg3wIfluEgNV+hlNQ73uPYzakzr0dJ+el7GIN7Tz?=
 =?us-ascii?Q?Xkrnew9tRiPJMXPOPVYouuw6LkiKJ2BGGEtxtZwZwn5wGTh/7A9JAfjumWrN?=
 =?us-ascii?Q?nd291dhgycKWdIW97MplE3jTsDq7UpOaK6tNU/HEuN5al5DSbT6AUm6hVOEQ?=
 =?us-ascii?Q?tx4AnOiqbLRfF2j7/K4B5a+MEPud0F8u7Vff73PB4PZ437FRRsJjsBrC3T1b?=
 =?us-ascii?Q?cDLPFjhh+seHU1ZvWyjxXFuYh1W3QYRvmblLpK7pbfzZsHMG163JE0xl8J1/?=
 =?us-ascii?Q?sDDXqGxg2FDCV0cQidZhhk6xDij7yNuY8OhC0wFuvtqBo6OpAuN7P1sljfRO?=
 =?us-ascii?Q?bDJBVmTNB3zL0ihbcQA/eYcdC5WV8r4E68w5WYQG5yoU4tK7qEn6JjbduKwT?=
 =?us-ascii?Q?YtdmlJRKX436JsJEvDh+AVLkxwFxTHPTwrFR+8WxNHNq9CxdUjFTAX5+fagd?=
 =?us-ascii?Q?pPxPJAAF3ELSHCxe/IQhzhsSj7xBNt/fZT/AfYrFOsZEi9DqHqRmLAmz+pBd?=
 =?us-ascii?Q?l4Yhnmy6u40ncpCN8+z80CoM1qyY5QcmINyZ2+SIVRJDk0cDOLm7X5J8E826?=
 =?us-ascii?Q?sX3ykiZG45kyZ+pejz/7rDG727AxZgBaEGd3pCmeLYEp/hrI4LiqN7uYJk9m?=
 =?us-ascii?Q?XYZq106BiEamlOO3/NbtEkSPR7H+XVOSB7EO3Jv5YXtBvL8/TKd6HuIo1Mu2?=
 =?us-ascii?Q?utGOEKCQYbJkPkp8+TjRtJg8cYkrcfj/gfxS5wAu2PP1alNz+MCl9AnXfmif?=
 =?us-ascii?Q?VQR1/N1KKAtV85MIkoKI6CsLQIx8TaMZ+ypRU0QMc7xEjKIzmYDchILBXiEh?=
 =?us-ascii?Q?1WYpccNLeaEZB6gB42/T8xYn9uSY02oRBaB0ojXmg//Fdukh/IiYujLt2X71?=
 =?us-ascii?Q?ccV+keEpp4QIeRyPxAV0urYaXHGp13dbisQiQgusrIFyYdX0m5praDT4ORfx?=
 =?us-ascii?Q?bvYgHX7pg+Yt9g0losq7KIfCM3/f4U47bwl093gKBMB0o05nDH8BdS9oFq+T?=
 =?us-ascii?Q?iVQKZyAMWBSmDWjTOh5iarULiwg5Ou/S3k51jk6j629GihhYB7T6sYP+Bu6D?=
 =?us-ascii?Q?m/F1lP6n7qi+mAkfJJGWDralhaRBl0Dh2cxf8iDhNpIRDF48JfAC40REc/kF?=
 =?us-ascii?Q?8bo+M3frS79Uv5IUNpbU7Ph0rEbS+KnBAMjWxdWiWKpWPlAyUMjqrVAiOjTC?=
 =?us-ascii?Q?EvM4eI79S/lm1ryOt8eogdydmyjBb64xawgLz3twtGCoow3e+zje8eNY5bMm?=
 =?us-ascii?Q?+/tUwKk2D+kD7rcDOaXNM5j6Ro0gu3CEMCO9cnf65aS3znz3QqBmUKdeHQUD?=
 =?us-ascii?Q?b4XFKgRjLBnUvF0tQHq4Q5Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9c0220d7-2c33-4d46-3066-08db9862c8ab
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:57:04.4701
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 j4D93uiJgPds4+x0iBAn4DWxnxE3R9AjflZtjCTnEV6b6fhymNFDJN8h4rJlZF+aF4sLCikQAYxLDhrbW+anewZejK5mhuIxeyizgNQlCwPWk8L4jojMaUBwsQzplkFp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11379
Message-ID-Hash: P3D4ANISI6SPFSZJJKO7AET3CMC3CMA5
X-Message-ID-Hash: P3D4ANISI6SPFSZJJKO7AET3CMC3CMA5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3D4ANISI6SPFSZJJKO7AET3CMC3CMA5/>
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
 sound/soc/atmel/atmel-i2s.c    | 16 ++++++++--------
 sound/soc/atmel/mchp-i2s-mcc.c | 24 ++++++++++++------------
 sound/soc/atmel/mchp-pdmc.c    | 18 +++++++++---------
 sound/soc/atmel/mchp-spdifrx.c | 14 +++++++-------
 sound/soc/atmel/mchp-spdiftx.c | 18 +++++++++---------
 5 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 69a88dc65165..0840b8220510 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -532,13 +532,6 @@ static int atmel_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 	return err;
 }
 
-static const struct snd_soc_dai_ops atmel_i2s_dai_ops = {
-	.prepare	= atmel_i2s_prepare,
-	.trigger	= atmel_i2s_trigger,
-	.hw_params	= atmel_i2s_hw_params,
-	.set_fmt	= atmel_i2s_set_dai_fmt,
-};
-
 static int atmel_i2s_dai_probe(struct snd_soc_dai *dai)
 {
 	struct atmel_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
@@ -547,8 +540,15 @@ static int atmel_i2s_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops atmel_i2s_dai_ops = {
+	.probe		= atmel_i2s_dai_probe,
+	.prepare	= atmel_i2s_prepare,
+	.trigger	= atmel_i2s_trigger,
+	.hw_params	= atmel_i2s_hw_params,
+	.set_fmt	= atmel_i2s_set_dai_fmt,
+};
+
 static struct snd_soc_dai_driver atmel_i2s_dai = {
-	.probe	= atmel_i2s_dai_probe,
 	.playback = {
 		.channels_min = 1,
 		.channels_max = 2,
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 7c83d48ca1a0..be83333558d6 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -870,17 +870,6 @@ static int mchp_i2s_mcc_startup(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops mchp_i2s_mcc_dai_ops = {
-	.set_sysclk	= mchp_i2s_mcc_set_sysclk,
-	.set_bclk_ratio = mchp_i2s_mcc_set_bclk_ratio,
-	.startup	= mchp_i2s_mcc_startup,
-	.trigger	= mchp_i2s_mcc_trigger,
-	.hw_params	= mchp_i2s_mcc_hw_params,
-	.hw_free	= mchp_i2s_mcc_hw_free,
-	.set_fmt	= mchp_i2s_mcc_set_dai_fmt,
-	.set_tdm_slot	= mchp_i2s_mcc_set_dai_tdm_slot,
-};
-
 static int mchp_i2s_mcc_dai_probe(struct snd_soc_dai *dai)
 {
 	struct mchp_i2s_mcc_dev *dev = snd_soc_dai_get_drvdata(dai);
@@ -895,6 +884,18 @@ static int mchp_i2s_mcc_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops mchp_i2s_mcc_dai_ops = {
+	.probe		= mchp_i2s_mcc_dai_probe,
+	.set_sysclk	= mchp_i2s_mcc_set_sysclk,
+	.set_bclk_ratio	= mchp_i2s_mcc_set_bclk_ratio,
+	.startup	= mchp_i2s_mcc_startup,
+	.trigger	= mchp_i2s_mcc_trigger,
+	.hw_params	= mchp_i2s_mcc_hw_params,
+	.hw_free	= mchp_i2s_mcc_hw_free,
+	.set_fmt	= mchp_i2s_mcc_set_dai_fmt,
+	.set_tdm_slot	= mchp_i2s_mcc_set_dai_tdm_slot,
+};
+
 #define MCHP_I2SMCC_RATES              SNDRV_PCM_RATE_8000_192000
 
 #define MCHP_I2SMCC_FORMATS	(SNDRV_PCM_FMTBIT_S8 |          \
@@ -906,7 +907,6 @@ static int mchp_i2s_mcc_dai_probe(struct snd_soc_dai *dai)
 				 SNDRV_PCM_FMTBIT_S32_LE)
 
 static struct snd_soc_dai_driver mchp_i2s_mcc_dai = {
-	.probe	= mchp_i2s_mcc_dai_probe,
 	.playback = {
 		.stream_name = "I2SMCC-Playback",
 		.channels_min = 1,
diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index c79c73e6791e..944d78ef2f36 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -706,13 +706,6 @@ static int mchp_pdmc_trigger(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
-	.set_fmt	= mchp_pdmc_set_fmt,
-	.startup	= mchp_pdmc_startup,
-	.hw_params	= mchp_pdmc_hw_params,
-	.trigger	= mchp_pdmc_trigger,
-};
-
 static int mchp_pdmc_add_chmap_ctls(struct snd_pcm *pcm, struct mchp_pdmc *dd)
 {
 	struct mchp_pdmc_chmap *info;
@@ -765,8 +758,16 @@ static int mchp_pdmc_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	return ret;
 }
 
+static const struct snd_soc_dai_ops mchp_pdmc_dai_ops = {
+	.probe		= mchp_pdmc_dai_probe,
+	.set_fmt	= mchp_pdmc_set_fmt,
+	.startup	= mchp_pdmc_startup,
+	.hw_params	= mchp_pdmc_hw_params,
+	.trigger	= mchp_pdmc_trigger,
+	.pcm_new	= &mchp_pdmc_pcm_new,
+};
+
 static struct snd_soc_dai_driver mchp_pdmc_dai = {
-	.probe	= mchp_pdmc_dai_probe,
 	.capture = {
 		.stream_name	= "Capture",
 		.channels_min	= 1,
@@ -777,7 +778,6 @@ static struct snd_soc_dai_driver mchp_pdmc_dai = {
 		.formats	= SNDRV_PCM_FMTBIT_S24_LE,
 	},
 	.ops = &mchp_pdmc_dai_ops,
-	.pcm_new = &mchp_pdmc_pcm_new,
 };
 
 /* PDMC interrupt handler */
diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index ff6aba143aee..5da88a8562ba 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -503,11 +503,6 @@ static int mchp_spdifrx_hw_params(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-static const struct snd_soc_dai_ops mchp_spdifrx_dai_ops = {
-	.trigger	= mchp_spdifrx_trigger,
-	.hw_params	= mchp_spdifrx_hw_params,
-};
-
 #define MCHP_SPDIF_RATES	SNDRV_PCM_RATE_8000_192000
 
 #define MCHP_SPDIF_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE |	\
@@ -1009,10 +1004,15 @@ static int mchp_spdifrx_dai_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops mchp_spdifrx_dai_ops = {
+	.probe		= mchp_spdifrx_dai_probe,
+	.remove		= mchp_spdifrx_dai_remove,
+	.trigger	= mchp_spdifrx_trigger,
+	.hw_params	= mchp_spdifrx_hw_params,
+};
+
 static struct snd_soc_dai_driver mchp_spdifrx_dai = {
 	.name = "mchp-spdifrx",
-	.probe	= mchp_spdifrx_dai_probe,
-	.remove	= mchp_spdifrx_dai_remove,
 	.capture = {
 		.stream_name = "S/PDIF Capture",
 		.channels_min = SPDIFRX_CHANNELS,
diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index 1d3e17119888..4b19a98b331f 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -516,14 +516,6 @@ static int mchp_spdiftx_hw_free(struct snd_pcm_substream *substream,
 			    SPDIFTX_CR_SWRST | SPDIFTX_CR_FCLR);
 }
 
-static const struct snd_soc_dai_ops mchp_spdiftx_dai_ops = {
-	.startup	= mchp_spdiftx_dai_startup,
-	.shutdown	= mchp_spdiftx_dai_shutdown,
-	.trigger	= mchp_spdiftx_trigger,
-	.hw_params	= mchp_spdiftx_hw_params,
-	.hw_free	= mchp_spdiftx_hw_free,
-};
-
 #define MCHP_SPDIFTX_RATES	SNDRV_PCM_RATE_8000_192000
 
 #define MCHP_SPDIFTX_FORMATS	(SNDRV_PCM_FMTBIT_S8 |		\
@@ -703,9 +695,17 @@ static int mchp_spdiftx_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops mchp_spdiftx_dai_ops = {
+	.probe		= mchp_spdiftx_dai_probe,
+	.startup	= mchp_spdiftx_dai_startup,
+	.shutdown	= mchp_spdiftx_dai_shutdown,
+	.trigger	= mchp_spdiftx_trigger,
+	.hw_params	= mchp_spdiftx_hw_params,
+	.hw_free	= mchp_spdiftx_hw_free,
+};
+
 static struct snd_soc_dai_driver mchp_spdiftx_dai = {
 	.name = "mchp-spdiftx",
-	.probe	= mchp_spdiftx_dai_probe,
 	.playback = {
 		.stream_name = "S/PDIF Playback",
 		.channels_min = 1,
-- 
2.25.1

