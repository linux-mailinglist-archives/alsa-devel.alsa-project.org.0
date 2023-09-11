Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 038E079B15C
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:53:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59DCDE7E;
	Tue, 12 Sep 2023 01:52:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59DCDE7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476385;
	bh=eMuDoJ4znfSD0Adj7bFjOJunQybeLgZWVWzlfA1+km8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dQerFgnG5YREvSniJIDivI6ibP/znSgGTXDHOXsRnYsaR6oTL2hOhfqrx0IO5dPbe
	 8SSqroVov9DOk500EgI7F8b7w/cmTUducqfSOC4dp/77ZWGscVSDQqtuq8sEGisgPM
	 An51m6uxNhyFuSk1m7u/r76gWWcGUNjvBQZLvpfQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 190D4F80564; Tue, 12 Sep 2023 01:50:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A864DF80564;
	Tue, 12 Sep 2023 01:50:04 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D308F805C2; Tue, 12 Sep 2023 01:50:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20707.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::707])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9B75FF8057A
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:49:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9B75FF8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JROPGKBA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lpfiBFkCxM49LONzDz+df/tH1k/O1VuQ99nBu1AjEAQyNCaoNqP7eaWRfyMkYmEVnGIMpMfkWWA/uV7D0KCnbw7pdpe6XC1duqmYjUx3HrABy/RCcWvtCiPiwSMxN2AS+bpjrAoHMWXgj/5SU7wxYVpdP3uiKNBDTfY8I0N+OM3vbvR6zA72iNURUX0i3mg9KK40/dkDrKf3YYIg1LpPemVgHpCy/1rCkex3wVgkQET+rPSsxyVmFq234c4aJFKWL/6iUxilfcOxHoT4y4JcncLXRjboDA8DMVlYiMkJ9OByUi0h2jAygsrSBl69EbgL8uEKICplXrPO7f31MNG2Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bT7KU+Oat4w+eqQSzb9WVg9sXzv9iK43lQLjZD2EtzA=;
 b=amGqT/N452ZjHxBxg8QM4cVsf2nnnXxi75WGGzO9TCZ4FQNVH8hh2NjupyhmoZoa4Z4jZntaXSmtYz6b1n3Nr/a/8zK/lnPOKvGuXttiiB2Dayx9nvidi1FoTG9Munt3dkc3bIbBCIUleWiVlhvoG2oQy0sMF5d69abuKluuh7cnXR6sL8e2zF8hxFV6oQBQrYNev/lj0lAONPL4ANsVUCf9lAkN94Rh0r5IuFVWEnRa4DlysoXKao+XgjZkmRpYR/tKPK6LaDQmeNGOEtA6vPlwPP+PcsKDVEmTJ0doZ3cWXaBenTk+J4SJTssM8LBH8OY76hH5MHVt2GGRVhUx2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bT7KU+Oat4w+eqQSzb9WVg9sXzv9iK43lQLjZD2EtzA=;
 b=JROPGKBAcKGHmGKjeM7sa45223KWu4afFQSK93xIMTTb97ZF+W6Bsu+ZL0Zuk4roASedK/S8Ts9+WU3TpVbjH9RMe4+CIxzGr1UaMtjJo9WROc5jjjWBWNRfHah4gNb4eBI3DpbgxvKVgLNmjeRnypmLDy97HgSgRi95ATab+L0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11567.jpnprd01.prod.outlook.com (2603:1096:604:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 23:49:13 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:49:13 +0000
Message-ID: <87o7i8qnie.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jaroslav Kysela <perex@perex.cz>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 20/54] ASoC: sunxi: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:49:13 +0000
X-ClientProxiedBy: TYAPR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:404:14::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11567:EE_
X-MS-Office365-Filtering-Correlation-Id: 68390c31-a177-4860-deca-08dbb321b3e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eUngA/7MsEX6VE8luiUVM/CPjpSHJLZiTZU1bISzS639OHdphchJs/lZoAwklfRyON9yYC99Mp7N372ge7mHkNtxU8ISK8PMJUJCsGkfsvlI8q9W2oRIzMZgCzFbVQuvMSgJKUa9e/TpTGoSeDmWs6zZ94LDsysxRcsHak+B2nPamcQb6uXmmahRaAa1AXOW1qFY2E9lX6wwxWDsWIB0FSjqMtyo3TXRoaU1nunBM9coxeEqFbH825UxJMSPeCL2/fJUpkbyVKT7dBtl91BhckX2Vbxvd7ISqkG49DtaGkAjheGljt006zeo0d06EZ7tW2A1nnK/tIkRJIXYYJ/9UEj30Et0EKp1yrYVGA2t0vx4Z71Byou9uumngXZskI/STapc5bezN15I6DTQMT6gahZTTtrQsnLe99oX0Mtzzrii4JAplnQMu7WjM97KHB7Q/p0Cp6Kh0jMytfgBLajC4yl6EgSpFggEMUrvcaqomrZql/yF4fxFg7E47y5BRXmclcrq1tO9ROPTdh9KFzP0C1upTGKhl0WLzk4723NLHQP8uBPluJtKeJJMwlS0EmMKs2B1yB9rFY8RaZI4kNqpf/TEfc1tM4z+XIFxaobCoaBaVIYF0r/ADL+voGOmXjLMMk9dAB+FU1gRTOZPb00Z5g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(186009)(1800799009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66556008)(66946007)(66476007)(41300700001)(110136005)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(38100700002)(38350700002)(316002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MJ9Qkk4daQgaFZYz2sHmJvO0lI2zXEJGRcsRtidNZiRvODD3Z6xXaG8QmsiR?=
 =?us-ascii?Q?tZCLBzX0DJ73Rol4Ru0TsrLw0Onb159I+p76s0SFrkDqfCHofw8GQSpBcBL+?=
 =?us-ascii?Q?G7KwkxSngR+tDQLjHmXdXaOvvhdH9rnTnWBL5XuNMIVTHRyLCyfy/FMiSuBm?=
 =?us-ascii?Q?GL6U3oqFD18gnMFrAcFc+hmViRPogpDrvJNjobkzPDz2LU4/gBCrVlA3CsnH?=
 =?us-ascii?Q?hK9QWWqdK/sFNiocgOzTlqxVGQNV0EXudOPy3lTpcOKZKgojzPtbAhATejSE?=
 =?us-ascii?Q?JEh5+5u/ZtTql3GdaESOBZEa5RT38IqX3nFPBIMnGTEvAeFIULspN07ANkRI?=
 =?us-ascii?Q?4GD0u7XliTIERRaNVXf6BFD0JvXRxH2uRXDVgQTlLOTM2yPbhKope/Pmz0ZC?=
 =?us-ascii?Q?sdmRSu/goybEm1ia/KwDLD1JeKRZvukJaZshKDRbgYluTBJ0SfCpeKhBzxBP?=
 =?us-ascii?Q?4+vulvgpopqdCegT8H7QB3aAMnDSWpbdf4/JqoIjIw4v6pB9nH+38ka6e8CZ?=
 =?us-ascii?Q?4bjBLCs3FnOONSMy+YdTojS48LwS4+wXDJWXb1pS3Bg+0v7wc7d4QXEJgNGs?=
 =?us-ascii?Q?21DkxHI6Fhg0VeXMm0YCtK7VLbRnrCQv+SbKOYNxYYaBBfknTj3a6MCc4WGL?=
 =?us-ascii?Q?zhwcx58EIT0mLWZE9UasJYu2CQiMHAYj5u20qng4r5fG53FvOZlEXdjLbnMl?=
 =?us-ascii?Q?Y3ugInMQFuJTujyKw9epC2u7hMye3csdcj18sGSbHp2KA9XuYqGz6bh3evyZ?=
 =?us-ascii?Q?eS160w03YXySsrfEgCp1Z5MY7EyPQ45Nv6tV/Ae+CB77fwuhXJF/lQnBy2Lr?=
 =?us-ascii?Q?9y1pcdcGB2XDvzEqpauu2wDVUgJNuPRGcZ1XKza1hIJF8Dv95BMAoYA7NXe5?=
 =?us-ascii?Q?nLvp2q1EVZJVVQoNO8vr1920hBJ4AL1XmftfaX3oWCzLj+q4BYiX5DShZYrh?=
 =?us-ascii?Q?w4qtowhZbZPI7qNbbzuoMmgb+oU5qSM20oX/SMbIeiicBi12C80NhjrzBKWG?=
 =?us-ascii?Q?4hlX8CGfyXT6CN9a+yMDaVWR3x2jkela9tFOUQu8w7bBLuKQ3ncgPMzf7EoN?=
 =?us-ascii?Q?UiUgYdngrUY2gah3zNlkD1G2mhaJ+lod83RWImgFAHGg3M7op4NLb+XSc4m6?=
 =?us-ascii?Q?wgpchjOJHxLwqkAefnhNjaQHUNoNrnkVwyIcIoF8GHC6h1+M7xAhkBadDhPF?=
 =?us-ascii?Q?dH5KRUuPhWYLElrpKk0BGAoL4FJbvyFXrgBjyjn5N5RBHfWGd98ap/7MKEnX?=
 =?us-ascii?Q?6Udw4Nj+mi3NN+eJEckESY7G6ePIqJ0xm0aDuhO6AnAVDDbmQPU/rFx2maqm?=
 =?us-ascii?Q?CbLmAQwWjGrNLoYdVOYH6x/n+Ke6EiYW90ABsLYzLsYFqwBKFtZ6/HsAVUFR?=
 =?us-ascii?Q?bjh+SeAci1nnkUEQFuSxY1GN9DEv3RMDK+f6GAgeBorWWCRrd1ATHLZCUNDW?=
 =?us-ascii?Q?92OmOh3KLCWRB+VuQ0/f/LMSn+zZDzFry0kiiFxS+NRvLsqCJza732ej2vF+?=
 =?us-ascii?Q?7Su0I9aB+U5gOOhpt01I1IBNnexwXnLyt9x2SGY6Rdzje07VHcZuj8qxQwWI?=
 =?us-ascii?Q?guVRSWhPHVUye9mfwGhq5PRxobdtR1VWjzrhL1UZ7qXKFsKGuY6u0tbCnooG?=
 =?us-ascii?Q?IAVyjEaE3sLQJ2Zp2Zu0RNk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 68390c31-a177-4860-deca-08dbb321b3e4
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:49:13.7394
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RV6MBSZyu1qyKLh4o3/z/BbEv7wY+qF43H2JsCo1f1bSI9brDqWkR4Ko1UFsFrTOhninz/ajDdNxdY420JabyI0Aw5rT/w//bvmkAetnW9Z4KywU1Xhc7sVgyqW1GELJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11567
Message-ID-Hash: BG2E47MT2IA27JWSRRFSR76R75D6UBFS
X-Message-ID-Hash: BG2E47MT2IA27JWSRRFSR76R75D6UBFS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BG2E47MT2IA27JWSRRFSR76R75D6UBFS/>
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
 sound/soc/sunxi/sun4i-codec.c | 12 ++++++------
 sound/soc/sunxi/sun4i-spdif.c |  4 ++--
 sound/soc/sunxi/sun50i-dmic.c |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index f0a5fd9011018..ad6336cefaea4 100644
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
index b849bb7cf58e2..199cfee41d319 100644
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
index 2599683a582dc..3f6fdab75b5fc 100644
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

