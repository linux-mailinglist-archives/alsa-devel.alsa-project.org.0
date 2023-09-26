Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FA67AE5D2
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:27:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BC685E96;
	Tue, 26 Sep 2023 08:26:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BC685E96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709621;
	bh=Jl9B3zaCbrWOSyZJN0nIh+eeL0/dTil/GvFbuhciICA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OUxRu371eJlEui5lPh8jyCcgtfUYxh5ask9lPnCFbhMXx9AK66oawiOyzuIfhEW6c
	 aLoLNpay2xSsd4ACLIO/Jy6TOZEgQgziGBN0Nh/4xrNaGEvkSNxbfUF9IJAyogRomh
	 rbqyzkLVw5cJgwoAQ2XaPqX4OQzI4o2XNEY8pcSE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 943E0F80618; Tue, 26 Sep 2023 08:23:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 481DCF805B0;
	Tue, 26 Sep 2023 08:23:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6BDCDF80618; Tue, 26 Sep 2023 08:23:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6C6EF805A8
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6C6EF805A8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FhAUoP5c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpO5K2fe5ej26LAOZt79pRzLiVXgQdDzyMnneAwC1C9H6ihf8+Z0F657yKnIsuCA7MH/wP0zsMWUN5k+PPyIpI9Is6bi12FqnqRXy3wJKmLLUXGStOezSfOX2S0hNoyl4yJvbJmJ56sRuYiL0puHsBchD86wtAflGQybX8Q5t/ojZlqIdHFSJfVV2jCeQG1afn9hvcPes6rvCuk6Bi5EJZy6s5wBzeYXJanGnT0S368YWES8P0c22Dc7PgkXq2dA6PILN7mXLxRTyE2jlS8lOukyY2mHq1nxLtE0Z9o2Eg5qFMyB5nwUjLOSZ7ScoHpKBBStAsW8ZSoC4gL2/VLp+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BjdhGTLZYHENWzEgqVA3IKTLpRjniXReQZBzz3fefHU=;
 b=P1MJ8R0sgadZt57u0F05BzrJEEjKAr5WcRNUZhX8zMTbRFD+teerVieXeNELC+taI/zCyXBuRLh6L7+lJN7VsUsinz6SkUhMchVzdLzIJgBu9NB365b7R2QpgBT8+3AkQ/4tCeS1gOdS4Dkb9h9p7f01IiUYIb6kaEVxaQ8VNMsQdPxpitiOmPB5skvHcnYauzlGvBsfDQIb8I4f0jgHzyI4bqqrjPTBxqJrfXCETUc7L3/Y89KAauJ1K7cUxNopH40zWhy1chZtR03f4j435GpzxMNjD2Lg89AjR3/hxrqAjo0Sqah7HjbWfa8l52/9U1BYWRVNbNpoPVKSn89xdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BjdhGTLZYHENWzEgqVA3IKTLpRjniXReQZBzz3fefHU=;
 b=FhAUoP5cXKftJmIrZVj2/uCfrHwFye73aO8bZk1d4/jT8s9/2qEhUg7tBP4NMh7jtwPAx84KY40UpzYnwUxGFeMdfHXtmU3hS1AClTXT/uBfaTPGNpbVIGkpGvpXllIpVUmck1i4Ybo036MZSep7Syxl/gWmO7Bs3I7lTviMBh4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB10364.jpnprd01.prod.outlook.com (2603:1096:400:240::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:22:49 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:22:48 +0000
Message-ID: <87h6nhh2rr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IlBhd2XDhYIgQW5pa2llbCI=?= <pan@semihalf.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 23/54] ASoC: google: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:22:48 +0000
X-ClientProxiedBy: TYAPR01CA0079.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB10364:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ab614d1-6222-4f25-8fdf-08dbbe59016a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	cOZeFFCtjqqXIbiIlfgt7SkVgsCAT8Ojjp9Ta/eU0qXJtcN3hcociENnymG3khpd2zAGtGI2u3hL4WHkh6bwakBN1cNyGzg6pHvUi1M1DPxXJXt4M1DwNk9wDMAv5bV3vUv86opFQnY6wSMvXVyC5mguyxmwei6oRaJsf9kHIMCe3de0FXH/QJ33uGC+GRB//Gm67i4izAIGL52C12BIA8YI/i6RhKEe8WsY3kQ8lIKPTMGSRiaNj4GBiAVI++DItYqVVe0wYnkd7i7x9HEP1bSMkis+AsrWojQb5iIm7/Ao0NROyjmrhHanrzUFibxUMwBoZIShZI5sVvn5L1V4awXHiUe+FjBBn7a2pFiy6OdB4qC5hivUBoAs8IPD8AyUbnzQ2ZPXhkkNvIbm29TjDRD6z3h9HIOqnJ7PaIR4Ikaf3ao7Ajr8AEh4qo987GUt51yWU9TK/mZnnfXJqubSQINGySWUG7wOAuXtG6sJFQKKtDOryst/WsT5SFeWx+l8pEA8KPeFKJF9q6gPNKmXHqVPGSph/voeAhUmtaE8k1z1XnVBFN+4LlTIUtoDbMmyf+EWYK+m82wRi6hGg8mDFEkRZFMBbi+a5rzIOO7LVQzTWIbYxvSQT6GHZI3T50nX3NZVV9b3I0rxhDNLMCU+qw==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(52116002)(478600001)(6512007)(41300700001)(38100700002)(38350700002)(316002)(26005)(2616005)(5660300002)(83380400001)(66476007)(66556008)(6486002)(6506007)(110136005)(8676002)(4326008)(66946007)(8936002)(2906002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3FweSc/ne3vSVN59ipkLHH+14ISId7MxY47ohDG/05pJGCl37hAApyQHG5pO?=
 =?us-ascii?Q?p/zY2TQpO4086qNi9u7fudhC3YgOUZAAV0XcEq0iaZR04wHR6AFFRZJQkLrZ?=
 =?us-ascii?Q?3+s888YCsdgTnQELcA27mDH9sX8bmUGYUGnrZ1Qr/Wxavat4dJLFVMlIY5So?=
 =?us-ascii?Q?DbgVnO81n00BmVQ+dJsSimpaaSuSjfNzI1DQTWtYd3E2piGIOK431M5Ap5ch?=
 =?us-ascii?Q?o57/PgdDlFKBhxC8yhYUMnGWro5vE9PZA1+0m3EhcqTZshNzYveLVfbS/9oo?=
 =?us-ascii?Q?K9LW/AHnpnKHDCw3wuwTb5ED+qijpQVTld6PQAwXNqt2hbXgBSbml7239V6W?=
 =?us-ascii?Q?z8Ejk2quuntCFKRoM44UBZ1XAHSRa2Fj5qzNIvrdftGQqrMNkP6MycepFSxa?=
 =?us-ascii?Q?0SO3ilJs7YxjolhM3gswyeeT36MQFKwUDMxGhk6ZfeI4XVnUacmWBdwfwjuM?=
 =?us-ascii?Q?8gF+i3hpq1fJ6m1KEKmo1rYygBcAI4TL4yLBQBh3BnOmX+SQMjTdbz91gXLo?=
 =?us-ascii?Q?8+JjT6qHUkJ+TZbRONpj25hiEtlLDFQV1XWzi81S27QiSii/f6MHggmSWWf9?=
 =?us-ascii?Q?SsHRQaa1dgNhKrH+0tbgRoXNM0LV+NvudJfVTbvP6DPtZGYvXode5eOz5URa?=
 =?us-ascii?Q?/pB0RqKVAUc6QtNbH7lfnSbZzteyGsuBneeov4i6pa4F7eyNyZHB9HnSu7Ag?=
 =?us-ascii?Q?i0AQLoy7bVQJ75isx/npNOWBcZEayMx3uyRQ3xnHzTHoFjHLrHzvX7UhdgCX?=
 =?us-ascii?Q?ojE2ZJU/QwefM6HoEXhSQgG18ZlBz9LkwuE6Oc3Uh09B5yfrLl3Uq37vdUt2?=
 =?us-ascii?Q?u+4cbZXK5/xBIAKdDTZBKN8m3WUHOD25onh47hW48/cHoNird+bRPafOcHe8?=
 =?us-ascii?Q?xr0q8m8mNneGTxWwiLgXZTYC3Oh/dgnCZP8tg6t3SPCjL+X4gVyQljwl/D9P?=
 =?us-ascii?Q?d4c4yNFiM34kilj6bLgtPH+ohXxpCkmaHYOL/QpqSRB1ZYstqUU0mWoZiYtG?=
 =?us-ascii?Q?klVi6ELGL8c5lOO1yy+wC4APjUZIFiwZFESA5tPSHiGj8aqFFsc9Qgib0cJe?=
 =?us-ascii?Q?p/i/5ufOzH9MxVIDR8P5mzN96Pvsj3wkbWoH8NfhD5tHnAtM75G2TGGIaUwZ?=
 =?us-ascii?Q?mcNP5SQbARvofyV7z+4Wr+PYDC5v/d5onJeTHO7MPj8vUUAjxbWR9LfOKDrk?=
 =?us-ascii?Q?PS3PT2E2d3MXT0Pi+lHNWDXDqnkC7yj+6HLOcDO0/MUuoN6UpM5O6DXXwDS4?=
 =?us-ascii?Q?ce075mLJaPE1fZvL4KQV9y2yfDjRL5lgN2WjN73SNAcxJiEaxFc1OMO+b7DO?=
 =?us-ascii?Q?vLQ8enE0g3Rr33Fc8x25HFeS0tMFedqYPo7BfVFZ3hLnCk4ZfDH0htFWEXax?=
 =?us-ascii?Q?8Fro3zwpY9zNb3G95nPcvBf7R+sDTDxhFEaoBmzrOlAyid2HqROY8zFVA4xv?=
 =?us-ascii?Q?ev1SFhq0JpkQp/Iuk8L9zihnJWPDahksqUgv7FI1HR0pTyl/Q5mzueIkH2br?=
 =?us-ascii?Q?59gbIA8GzecJfdL6SKG2RfwHW/1joI3S7EldXWEBdRQyl1haDSqXIi5R5gs3?=
 =?us-ascii?Q?c7Es22TiIq5onyS/QTfNcgYlxFzR5dgGsVYBs5uE8q+w6SdXRk01Zgk+ZUog?=
 =?us-ascii?Q?b8q7wf7nUeKaQ20pkmVfDp0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5ab614d1-6222-4f25-8fdf-08dbbe59016a
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:22:48.9222
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DKcqIyTlwrjeap6nD060gybz50Z1uU14kYvXbxRI/IYtwWqEbm9xoODwaZnlBDv7l9gEkodSyn9ipI5UEpIbIXb2ZylcaYjEHfuYrN/4k2cgV/1GQDgH9D1VfObL10zi
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10364
Message-ID-Hash: JDI4BSFTW3N6ZPKHPZM4XQY4UYGWDQHH
X-Message-ID-Hash: JDI4BSFTW3N6ZPKHPZM4XQY4UYGWDQHH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JDI4BSFTW3N6ZPKHPZM4XQY4UYGWDQHH/>
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
 sound/soc/google/chv3-i2s.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/soc/google/chv3-i2s.c b/sound/soc/google/chv3-i2s.c
index 0f6513444906..08e558f24af8 100644
--- a/sound/soc/google/chv3-i2s.c
+++ b/sound/soc/google/chv3-i2s.c
@@ -131,8 +131,8 @@ static irqreturn_t chv3_i2s_isr(int irq, void *data)
 static int chv3_dma_open(struct snd_soc_component *component,
 			 struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	int res;
 
 	snd_soc_set_runtime_hwparams(substream, &chv3_dma_hw);
@@ -152,8 +152,8 @@ static int chv3_dma_open(struct snd_soc_component *component,
 static int chv3_dma_close(struct snd_soc_component *component,
 			  struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	if (substream->pstr->stream == SNDRV_PCM_STREAM_CAPTURE)
 		chv3_i2s_wr(i2s, I2S_RX_ENABLE, 0);
@@ -166,7 +166,7 @@ static int chv3_dma_close(struct snd_soc_component *component,
 static int chv3_dma_pcm_construct(struct snd_soc_component *component,
 				  struct snd_soc_pcm_runtime *rtd)
 {
-	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	struct snd_pcm_substream *substream;
 	int res;
 
@@ -200,8 +200,8 @@ static int chv3_dma_hw_params(struct snd_soc_component *component,
 static int chv3_dma_prepare(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned int buffer_bytes, period_bytes, period_size;
 
 	buffer_bytes = snd_pcm_lib_buffer_bytes(substream);
@@ -229,8 +229,8 @@ static int chv3_dma_prepare(struct snd_soc_component *component,
 static snd_pcm_uframes_t chv3_dma_pointer(struct snd_soc_component *component,
 					  struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	u32 frame_bytes, buffer_bytes;
 	u32 idx_bytes;
 
@@ -252,8 +252,8 @@ static int chv3_dma_ack(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct chv3_i2s_dev *i2s = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 	unsigned int bytes, idx;
 
 	bytes = frames_to_bytes(runtime, runtime->control->appl_ptr);
-- 
2.25.1

