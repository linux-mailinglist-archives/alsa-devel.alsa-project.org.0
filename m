Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 72ABF79B191
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:56:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A69F3E73;
	Tue, 12 Sep 2023 01:56:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A69F3E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476616;
	bh=vpYGWMPmDXektfXUd+TtQU19HDkC/mWxFBqHVoonrDg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=A97YMkif3mgBi4EhSBz+sn39ih41KvUAQQ6nXafSV8zZ4WKvKEf+QJQAUXcWdyCQt
	 lmwreOd2AkZZU9UPnqfRfH5jKhjhv0tUo+MrDe6T6PbhQZWSAwyM8ftrCUGFGPXKym
	 lKoND8HNtNG5HsitXhm4gK23Oe+ag7Gc3UNGvDn0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67580F80616; Tue, 12 Sep 2023 01:51:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 25376F80611;
	Tue, 12 Sep 2023 01:51:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D59A8F80600; Tue, 12 Sep 2023 01:51:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72e])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E9A69F80537
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E9A69F80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=c3NUa/e3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CHGLlm1/OKSkMu1KmnfyqqusXgPJ9PQKh24o7Fj46wHqc+K4gz5mBTSt+8B/3F3apVKR58LkIsdbFUVZjmRaXgVqYG54rfjF6tLssBN42uFDNelorxP7ckn6ZUTTMbGNxHbLDs1B+FsI9klVncynAjWm+A7qkcgPcWzNfiqoS2r6nbZvQNJPtNjUWa4jI5tYskZF7Rjo0Ylb+ZBg1ujOOHH7rG7Gv79te7Nv4MWRvDy4qQZKDyh8wEdO1fTU4ucd0qv0SpVZpzOW20Ev4lzWx7AzG1Ty5luOh2To5NGRGe2ZVnVSLbTNgSJ+ESxItulk1pF7oiXIejFrpt+4eWMR4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2oDwcKSoajgXqqugldaYPJb5TkLJKNBwotZUwYrpbZs=;
 b=CMxSruc9u9VAvgyE52OG8U0XOY1A4cCEZW20muqI/r7//4zijPKtFJoGVYm9wJ6A3AN52k4Mk6/1iqST51tReq+MztSh5hlIRcZdms36zduK6v2xN1MZUcziurPCHCrv0DOe/OFMFc9bs4lIA49b4i0FQGmDxHNTVWCmbpaTA/X36Z0yqcxGuMeJRfbXkp27Aq57GKnNz3q/xM3c3quglKeaSuyGDIYyD0F+P0gCdXfuqEHNenIdyy4wayA1qvRzQbyoFteCZFiYFbDGhvhGVTLQFYDPneZE7z3LFmhXaSlg6YF3ZNqkAOWMsJr9boFoGTEbZZcLFcIEdo07Xtl84A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2oDwcKSoajgXqqugldaYPJb5TkLJKNBwotZUwYrpbZs=;
 b=c3NUa/e38HSlJ4IkaCzIsDAlLh/bofY6w/4uyTsszGTrEaFddr4DQwTKdefymB37EdOmkY7Rwfi/0n4aOdxBJWN40d4caW1tiUXuyZY+gCpzNi+SiItD27uYhMJSxiMHeGURPlUo2d581IyliLeqIdRmEfGacvhrhWnuQDDsSf0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9445.jpnprd01.prod.outlook.com (2603:1096:604:1ce::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:50:24 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:50:24 +0000
Message-ID: <875y4gqngf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 33/54] ASoC: uniphier: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:50:24 +0000
X-ClientProxiedBy: TYCP286CA0158.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::9) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9445:EE_
X-MS-Office365-Filtering-Correlation-Id: 87226d49-ad27-4c75-6e00-08dbb321de39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	xAg4QTpfNlmx8CL2ZVEwnOPUnQvnaQ7rb3xefNsR0QWmdBtAZ1EOaX8YPNES9S+DdLbIp2jjezl2vl0/QiDq+wgSH6Ix14NnTyhtzv20pajnYBJuzyBO+LesNKirqr4fsg0niHJEiW/UMiq1UXekd/ZBGWOR+flcILFSUZj/wUQTCVHVlMZyumsyrRzReWRijfqHmUJLjjGiV9+un4gJF/Syf1/d1LVijYtPZXMuD9j56voN05aWgm5ouYmIXBDFklaed/QX2I+oCc1/pXHPYoCmbPDhTZ9nVmFeg8h9aMtnrp7FIXbRSiZ5Gh5HYrLpjM4QG7ZDjCmLHXbABCkcDTAArdzBHRyGAyEZO4dL94JCu2ElsWIZyaUp9AcCsWD4anT1yB5DTJWotL1eBro1hPVGzGOrD9hGINYriv9Skq2JPnZR3a6I+1KsydxGtaHbIWl56F4iq4zUGoKt8fiIflmORX0M/E0FCjmgqlT48XHynHM3PpptJxdsyHwE6LzwuNYXC44n7uguySOLKEJcAsdwJEkxakc/DSO3TQLvIBfL80U/ausjMdWCKsH3c5LvhY4FS4K/Dlrx1L9By0c+RPXPyHcFzimok/W1lsBY/2cwszA0eiJ1styvAFfRBly26+cmo/Vje0lqMBgKuO84Wg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(366004)(376002)(136003)(39860400002)(396003)(1800799009)(186009)(451199024)(83380400001)(66556008)(110136005)(38100700002)(36756003)(38350700002)(86362001)(316002)(66476007)(66946007)(8936002)(4326008)(8676002)(41300700001)(5660300002)(6506007)(6486002)(52116002)(6512007)(2906002)(478600001)(2616005)(26005)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9WkXISpP7rLhvv381oU/yUr/Wr79WbXIQWfj/BwOQBMsd6GQEoM/ynKZuEyy?=
 =?us-ascii?Q?srSN1d4KlC6YLpG26P7I8QCHvb0A1gQsAhYLVvSlF3ld8P4LT3LjPRv2K38u?=
 =?us-ascii?Q?caMA7w1/gXGMteoj3HJjlu+JNuX1nR37pwZAPsAyLjUZqRHPeIHE7gh8ecnZ?=
 =?us-ascii?Q?aEBkXbLUZzyhRsVNyCONAHjTzxuEfxu4VfW+IXvu9Fn115bIMod6rFDRRJ3y?=
 =?us-ascii?Q?J5wetEGPwIyRsfz+C9VBWAr3XIWaTAhBOMdtZPI/FQxYRWnpEo1ZZttwAbuT?=
 =?us-ascii?Q?o4rADQq3qPTCWt2JWMnHBxJwkjUohsnubNze8QKt1TFt2Mfm3j1vb5tX0JVm?=
 =?us-ascii?Q?jKSlaunNTciG3Itm/zioADVXATs1MQEq6r6zg2+iFdPvfAgGLlZ/YaQq8t6c?=
 =?us-ascii?Q?5yIYIcWzk6k85ePhGTH655SYsJnUM7+6A9BHAptcLCB+uw3j/1wA0sWCXICB?=
 =?us-ascii?Q?2Cn3VI2RA6h7Gd1ydkVBGrJdrPdsXJvOkZCwOwd1RYoB7T4cWf7Fe6qq2PX8?=
 =?us-ascii?Q?F8SrwEkshOx1OmiiqzVGQNv86YTx7tjVwGg1pgo/IHpA6lC2aT/WDEIyYwij?=
 =?us-ascii?Q?tAmQYkykCg0zWk/MqOR6ugUklNDZ6OfHhDPUJ0GJM/Ng4G+RCEnxPkG9ivya?=
 =?us-ascii?Q?w8mVYvD6Y/5iU3y2hrBNSWdmv7FSPkP2Dml1rCxM9R2Z15XUM5HdmIGMLi1j?=
 =?us-ascii?Q?GAxf97F9ktdQcy9Zs0ZYofHLSA5xoJDROIcBS9wpHjpI93Ks23WB/7YnL/4B?=
 =?us-ascii?Q?DTJA2IPRf/zRKOmy382wUAKKCxKi7z7YKd3Mxt4LKgLmOkS/BkdexlIcGrDq?=
 =?us-ascii?Q?zcBEuVAAzLnwpgqc/VmdieYCbrgsfKii3ohxRDvRR0Mcv+NHiYNm9G3zWRsS?=
 =?us-ascii?Q?lth/GIHS+nJj+chpp1f+cngMFUA2ynLsuotzYuzYckjCPDmIpofpOQ1As3Cd?=
 =?us-ascii?Q?JraAUNTjoykU+LgYDsxbM3HiMPCyk8LQgXhG5qbu32/BlCNqf1/4g86p7AUy?=
 =?us-ascii?Q?gsXbcCWlJNPGdFHlrYgM71aFmLU3zdDoEDqKh8qQMngMtLGu2OS91frOVN9L?=
 =?us-ascii?Q?7XP74QuQ3sZ2vp05aVlHp8kIYLlEaSD9/JNOCjaW7YoYqZjci4YyLsINHwxo?=
 =?us-ascii?Q?2bYfGcKL/11Elw/I/MZAhPr0zaDxSsQNfb2FScwdPWv13COtJv+03w3jp8Hc?=
 =?us-ascii?Q?GiXTZhyzeOUuEAA7EjiZewQZwxZtaqSZCeFfaf5GGVadBBaAtXfl2PhXe5UN?=
 =?us-ascii?Q?eBDLTethNrD/37N1hPFckdMeq8XNS2e9PHcMrNznbdSAQR6CoFfnvEPY8tEl?=
 =?us-ascii?Q?9MoSXERBIlGaUVnSacZeZr6pEuYSl4mLYdnwn5zpjGiNiZnO/00rHfSNhuT3?=
 =?us-ascii?Q?qQ761rmYOMF7XObtR3aDCfclo2Y8Ad1C4DPWCfJDkM+OlTwqGwxeouSJipb4?=
 =?us-ascii?Q?xXizTtt4W8kIjpDNCvXIhldTlk8b8yLvvscdUBhu+PmcT8OZNoaYL0PGqTA6?=
 =?us-ascii?Q?i16T83Xt/xg9cxRpUa5mRgsZh5ON58f4wgc2m3uR+qGUeHGuUn0HyJcCXLOt?=
 =?us-ascii?Q?9+8SxLZvSVML2s/YOPJPlPe3230kCYTsiRIGI7ZT/skazWB3BJjyvJGH0GF+?=
 =?us-ascii?Q?UFbTxxxN1rbdg0KZvOLddjs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 87226d49-ad27-4c75-6e00-08dbb321de39
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:50:24.7758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 TPWSjRVf3NS0fw4bNrwU3vRgQs+B67X77U20LdlnF6P1xcga7KU2kn8DfEFd+V00S/sxwK0vjycrVnyaW3bhpsG5mMsZ2m+xuP/icxCkHDeehTFE8rv6kCnJ9Ew0tHQ1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9445
Message-ID-Hash: MYEAUSIY66NLAZMO3CRLIWK4XW6XHBCP
X-Message-ID-Hash: MYEAUSIY66NLAZMO3CRLIWK4XW6XHBCP
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MYEAUSIY66NLAZMO3CRLIWK4XW6XHBCP/>
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
 sound/soc/uniphier/aio-compress.c | 22 +++++++++++-----------
 sound/soc/uniphier/aio-dma.c      | 12 ++++++------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/sound/soc/uniphier/aio-compress.c b/sound/soc/uniphier/aio-compress.c
index 7d1492c15b575..4a19d4908ffd6 100644
--- a/sound/soc/uniphier/aio-compress.c
+++ b/sound/soc/uniphier/aio-compress.c
@@ -25,7 +25,7 @@ static int uniphier_aio_comprdma_new(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_compr *compr = rtd->compr;
 	struct device *dev = compr->card->dev;
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[compr->direction];
 	size_t size = AUD_RING_SIZE;
 	int dma_dir = DMA_FROM_DEVICE, ret;
@@ -58,7 +58,7 @@ static int uniphier_aio_comprdma_free(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_compr *compr = rtd->compr;
 	struct device *dev = compr->card->dev;
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[compr->direction];
 	int dma_dir = DMA_FROM_DEVICE;
 
@@ -76,7 +76,7 @@ static int uniphier_aio_compr_open(struct snd_soc_component *component,
 				   struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	int ret;
 
@@ -102,7 +102,7 @@ static int uniphier_aio_compr_free(struct snd_soc_component *component,
 				   struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	int ret;
 
@@ -123,7 +123,7 @@ static int uniphier_aio_compr_get_params(struct snd_soc_component *component,
 					 struct snd_codec *params)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 
 	*params = sub->cparams.codec;
@@ -136,7 +136,7 @@ static int uniphier_aio_compr_set_params(struct snd_soc_component *component,
 					 struct snd_compr_params *params)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	struct device *dev = &aio->chip->pdev->dev;
 
@@ -167,7 +167,7 @@ static int uniphier_aio_compr_hw_free(struct snd_soc_component *component,
 				      struct snd_compr_stream *cstream)
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 
 	sub->setting = 0;
@@ -180,7 +180,7 @@ static int uniphier_aio_compr_prepare(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_compr_runtime *runtime = cstream->runtime;
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	int bytes = runtime->fragment_size;
 	unsigned long flags;
@@ -219,7 +219,7 @@ static int uniphier_aio_compr_trigger(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_compr_runtime *runtime = cstream->runtime;
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	struct device *dev = &aio->chip->pdev->dev;
 	int bytes = runtime->fragment_size, ret = 0;
@@ -253,7 +253,7 @@ static int uniphier_aio_compr_pointer(struct snd_soc_component *component,
 {
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_compr_runtime *runtime = cstream->runtime;
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	int bytes = runtime->fragment_size;
 	unsigned long flags;
@@ -328,7 +328,7 @@ static int uniphier_aio_compr_copy(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *rtd = cstream->private_data;
 	struct snd_compr_runtime *runtime = cstream->runtime;
 	struct device *carddev = rtd->compr->card->dev;
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[cstream->direction];
 	size_t cnt = min_t(size_t, count, aio_rb_space_to_end(sub) / 2);
 	int bytes = runtime->fragment_size;
diff --git a/sound/soc/uniphier/aio-dma.c b/sound/soc/uniphier/aio-dma.c
index 3d9736e7381f8..fe272befd9676 100644
--- a/sound/soc/uniphier/aio-dma.c
+++ b/sound/soc/uniphier/aio-dma.c
@@ -108,8 +108,8 @@ static int uniphier_aiodma_prepare(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[substream->stream];
 	int bytes = runtime->period_size *
 		runtime->channels * samples_to_bytes(runtime, 1);
@@ -135,8 +135,8 @@ static int uniphier_aiodma_trigger(struct snd_soc_component *component,
 				   struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[substream->stream];
 	struct device *dev = &aio->chip->pdev->dev;
 	int bytes = runtime->period_size *
@@ -171,8 +171,8 @@ static snd_pcm_uframes_t uniphier_aiodma_pointer(
 					struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct uniphier_aio *aio = uniphier_priv(asoc_rtd_to_cpu(rtd, 0));
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct uniphier_aio *aio = uniphier_priv(snd_soc_rtd_to_cpu(rtd, 0));
 	struct uniphier_aio_sub *sub = &aio->sub[substream->stream];
 	int bytes = runtime->period_size *
 		runtime->channels * samples_to_bytes(runtime, 1);
-- 
2.25.1

