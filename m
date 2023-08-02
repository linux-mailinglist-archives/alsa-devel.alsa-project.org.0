Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FE376C1A6
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:53:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1B2831E7;
	Wed,  2 Aug 2023 02:52:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1B2831E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937604;
	bh=SNakYymuN4DdtR29CqOtH0Iu486Ro3vOVhA7lnmvzvE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=byPbNKDPPU9hTcAlB8jkbL7dMHbWPUkkTqBypbNozNNlobMuLFcR9uFzk3OFameET
	 Iuzp/R2JiGTxKwA2Ew9ec0NdZuy4SNAzCCkL9HlJ7TSvogGNJ/75HIgI0nJ31pfXhj
	 rDCA3XGMT8rm7nNigFBUWlSNof5gm0a/iyzqrPFI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D2A6F80544; Wed,  2 Aug 2023 02:52:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 188CCF801D5;
	Wed,  2 Aug 2023 02:52:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10397F801D5; Wed,  2 Aug 2023 02:52:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20727.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::727])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E4104F80163
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:52:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4104F80163
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JGUxGwLf
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QBgJtiqiy3N5wa7OFu+zwYihJaSB13OkkAGa2zbYPi2NvE/WtV3OCstXsA8Ey9rFGQVwTdzFGv2GEf5cWeouGzp3QT+QDPGJ0t7VBKdLjYhmhx6ZH+ih+NXRuInWfn/rCokb516zJmeGvO5rmLJouMCusynSWJYjSy9EtYdD5unzzBGvXcK19QC9tAKZ6WroZyxoN3bxJ1t7Ts4jNBrqtn5lImUnnwyHtXUg1UhbY6qZo6P8+AFtsT1Y+uvqr/RwUrpnbAgdnniKzSI5e4zN09UFQCtO6DNbLPh7DJ9aKt4h3n2n58E97qjxeikrAl0qx+5JsykeqM1/4SROwaWTjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zjlz7aganOewiybsIwTtVYbLt3D8p/SXFmfq1EhM7Hs=;
 b=JcQE5Mx9+WACjedgnRgBAZkv7PBxlSxz7Bo7BCBQw0B3wXh/098T+ez4lpvYOBWeDzRTOZoO+bsbVva9eBIRnCIPrpQSuztWSqwNIV0pEtqw+p4jnVUHWOYWyP6zWFc5xXCRGlkkIs8LXsLBzIJwlMc6cS1oBTenvuikR/22RqmwkQwMXbo5PFUcrER5ZTyD/hB2X/cBMy06Gu/kwCtzKTM1Nmu59Alaj1Zdn2Ed0rLFFM2Jy1uWdmoCT1PcqpgfaFxF19joW2wDI3JT4MaE/McQ3YCO9+mNlsf+GO/y9FU0tgEp+3o/XYKobVKKT0z9yMTDLv3n7EwOvEV3D5Rg/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zjlz7aganOewiybsIwTtVYbLt3D8p/SXFmfq1EhM7Hs=;
 b=JGUxGwLfzfxCRZhEEOSzFYx3pambguxn1WRjRS6e7f+ZlvZzTCtsp0rXaIueM/i724fHMot8dH2POhzH9v/r/TCnFWmJSmHIEQLD5+4xV/3KoqGpQ2u3tlY4YmrlkPah8S6MdaDJKDg2eqLsNx3W+BLN77h23wWo0jTHLXC1ONM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB12016.jpnprd01.prod.outlook.com (2603:1096:400:408::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:52:11 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:52:11 +0000
Message-ID: <878rauuuyt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 01/38] ASoC: soc-dai.h: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:52:10 +0000
X-ClientProxiedBy: TYCP286CA0325.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::8) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB12016:EE_
X-MS-Office365-Filtering-Correlation-Id: ebeaa0cf-d7ef-48ec-0991-08db92f2b465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CCAHlvrIkH8ffF8Sjcd3EnbjHItSeWz9c7KEHIXZzB537783hY1rJk3AHWLFkbnjo1eNgUsdw3AbNbfyjXu4uHUmQyNovyNLy0aR8BzADyaviulK4hQcktg2hrslCKYd+pwsTFX5i2S5z5HHHTYtU9QJSfqUo9bOXrOgaReI0NYAS2bP9lCykvna+TrWiw4qOAlr6zz/PUMIa9jevZ3SU56Wtb7PuNS8DijtB+VcJMd3QRQARAKq2qi4xLSwL3t/bzVSP7C6MNxu+BXYIXAfFYTDNactSobTIOWqdx/7rycbMFCVOa9iXCbfSnwGAiBxrjsPJS7ragJGoH011ShYu7hywHy42YVICIClzZzPQWK3aKOcS/+bVeGcKly7/A4rr+TfCLb+CCfa+yjrxDYJ06Jv/8ktQ/1FrshnvM+gfrmI2Dxk7APGGOEYxep//7KZMdh05XxbtvSCHOuZTu+MBtgCmRG5vue3Abl3mmn+W78dxEsZOD91qJMaAjXq5t0WAS+ZfBgHRtrDhPOMgXkTIWEj3I9/VLHzJatG0Z4BaKxfDCq4oIehYSbkNZqhDOr92zse+myIOY46p6SeSuvtlwNqxI37UkSOOCQS/SnlXBdzp6b56iEtzhnvE5T1M9NV
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(366004)(376002)(451199021)(186003)(8936002)(83380400001)(8676002)(26005)(41300700001)(2906002)(5660300002)(2616005)(86362001)(478600001)(110136005)(38350700002)(38100700002)(316002)(6506007)(6486002)(52116002)(66946007)(66476007)(66556008)(4326008)(6512007)(36756003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y4I0IlSbmW+MpXb4s00okkpFL0M7ehuVrw2muLzpl7F7pP7ArSde5pcGN6Si?=
 =?us-ascii?Q?QhF4gpQdI/Na6oeJCjiwE/6QXhG6BGfpW26JUoBdgY2bBds7AZuKLSkrDF/O?=
 =?us-ascii?Q?lEna1qUQUBYJYxIjZjnb1d6kUgAmDAOsuWBirYwNsx67kfGv5eJeKSAqMPoI?=
 =?us-ascii?Q?Cetk/1TUjK5q6stz+hU4Skx29kWxCV+8bbyKZhjbc3/pnq+IBS5wiNVHwceH?=
 =?us-ascii?Q?vYfsSrGUL4A0rWvvrU3J7sezgXCwIfsn+y+vZksN0iv2hNYoE3DBRFlnJM0N?=
 =?us-ascii?Q?N1QJkwyReQR5XXWI2n+LvEycYYetn9vsE33TiynQCTNwS6WFRLjZV5sSAu++?=
 =?us-ascii?Q?2MePUycrcWm/MRejc0W/22Y0w0ejjZAnihJOL1GgORx89fHR59Y/EGN1YAyV?=
 =?us-ascii?Q?ZJJ7R5bUPDM1p5Ak5WFau3lPJ3tOGM58GdnrvP05BExfTElXSir1NER40XLz?=
 =?us-ascii?Q?eo8/CWvgVlyG4rasEnQNIMRiU4xm1lsApwHGPp1kQunNBNL1COtbis7uznLi?=
 =?us-ascii?Q?UrG0KJ+3ky42g9tEpMayNjizWYsiopvQAhhvcycO/m6qlqLWTJkcK6tGA6z5?=
 =?us-ascii?Q?HhsywkLtaOtHdNat1lKitcR9O7X1ibHckagEjx6FMQprQz905xS8RQ7PINf/?=
 =?us-ascii?Q?snovM355JERh/Qcwwv+zJLOsQiozUSGWsprDfz05j5WeMn3UCohXf3Fdzu16?=
 =?us-ascii?Q?dwA9+IYhMbXLZk083yztOYMb4FsYkYh3PWhSRh/375GcycRMQ2ejmpqkekhX?=
 =?us-ascii?Q?p9158A8vJ0rRMueTJsDhUahjmajNStmMO/w18G7CPgAJEMlOPIWSVQkP+kyo?=
 =?us-ascii?Q?J12Z6WlkSr5wx47YOK5emZ1HpjjMRImerC9FFVzA0fbWVLQVlmRVDyvrdCX4?=
 =?us-ascii?Q?lsB5kvsHlCdROn7bm+Y4aNEqgy1Wen2z9/eJ2uCGmtxw0UGFSZ1yL+qZYixH?=
 =?us-ascii?Q?imsV4oiLk5pJI2BzthkADKt5qozGSrUKMzIOf6cSKfFG0nvkf9Br6XglrA6s?=
 =?us-ascii?Q?kV19JPrvY59Z9M14FF/a41icFLth1fc6iHsVGoO0TxzUfW1019tXMALaYNSo?=
 =?us-ascii?Q?MUI3JfLkkzpOLECGLsnF5FFmvbZ2d3ECxPlfBGI6fneEjuJGEcyifXaUq65A?=
 =?us-ascii?Q?ip5NpifIEi5y98o3Xo/aD9AZqgXqQsO+aVa7FEcgOs/mtiB2i21i3Sqvyi2g?=
 =?us-ascii?Q?6WpqaCWwk0L6Oebu8nCxQ5KXw1hiZqU7W88OlTCiwatTDke6rZErfXvq08PR?=
 =?us-ascii?Q?Syj4Dj9V7+ZpQ1ZKxvyXcCIMDTmQWAehBVsRxol830mllaD4chg3xqKRUPqe?=
 =?us-ascii?Q?3kT1bEHNKGVzoP1nQyCmyJHFGvmxX+MTwkUgyy0taleG9GT+NhrlZA3GpH3Q?=
 =?us-ascii?Q?8dIE9slICaF4RYFhx6UC/iVOc0eXc3likzD4X3jpirbdGrFpJ8PzuQ+eqi/V?=
 =?us-ascii?Q?Sa2kMeQr/S66IlBXC7mUPyTgd/X1NlwjPPzF762xHtShQ4ykrdfDC7QzAzuQ?=
 =?us-ascii?Q?KL9BgdIVwoWadplJtU8lFHK12bAac4XKcKVOzPVXt/pYF78QNP+6XV3J6i2v?=
 =?us-ascii?Q?5uwv+l8YwNHTjYeW1XC5ZfJWmFRK9Fk6JtzP4R8iORQqUaCGF/ITGKY39j5J?=
 =?us-ascii?Q?iKVSqR3KFNrt04Q9B2pOA0U=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ebeaa0cf-d7ef-48ec-0991-08db92f2b465
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:52:11.0760
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rjkuR+0RmYCpHF7gSLY828KKVVFyrnfDabXMAfSjnF4VlgQBI4P5cD1lVOGyrXCLibrxBdLZL8vzmh/RxyXMDUIRZLeXUFJfuXzJJ9mwj93Ii9wsL/wZXK1CcmLZxyoU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB12016
Message-ID-Hash: 54J7LTDXN43H3FLWGPDC2R3OHXIQZ7KS
X-Message-ID-Hash: 54J7LTDXN43H3FLWGPDC2R3OHXIQZ7KS
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/54J7LTDXN43H3FLWGPDC2R3OHXIQZ7KS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

snd_soc_dai_driver has .ops for call back functions (A), but it also
has other call back functions (B). It is duplicated and confusable.

	struct snd_soc_dai_driver {
		...
 ^		int (*probe)(...);
 |		int (*remove)(...);
(B)		int (*compress_new)(...);
 |		int (*pcm_new)(...);
 v		...
(A)		const struct snd_soc_dai_ops *ops;
		...
	}

This patch merges (B) into (A).

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/soc-dai.h              | 13 ++++++++
 sound/soc/generic/audio-graph-card.c |  2 +-
 sound/soc/soc-core.c                 | 25 ++++++++++++++++
 sound/soc/soc-dai.c                  | 44 ++++++++++++++++------------
 4 files changed, 64 insertions(+), 20 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index a33d803fe548..85f897fea21a 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -274,6 +274,15 @@ int snd_soc_dai_compr_get_metadata(struct snd_soc_dai *dai,
 const char *snd_soc_dai_name_get(struct snd_soc_dai *dai);
 
 struct snd_soc_dai_ops {
+	/* DAI driver callbacks */
+	int (*probe)(struct snd_soc_dai *dai);
+	int (*remove)(struct snd_soc_dai *dai);
+	/* compress dai */
+	int (*compress_new)(struct snd_soc_pcm_runtime *rtd, int num);
+	/* Optional Callback used at pcm creation*/
+	int (*pcm_new)(struct snd_soc_pcm_runtime *rtd,
+		       struct snd_soc_dai *dai);
+
 	/*
 	 * DAI clocking configuration, all optional.
 	 * Called by soc_card drivers, normally in their hw_params.
@@ -355,6 +364,10 @@ struct snd_soc_dai_ops {
 	u64 *auto_selectable_formats;
 	int num_auto_selectable_formats;
 
+	/* probe ordering - for components with runtime dependencies */
+	int probe_order;
+	int remove_order;
+
 	/* bit field */
 	unsigned int no_capture_mute:1;
 };
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 0b8258b6bd8e..13693ef9c242 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -60,7 +60,7 @@ static bool soc_component_is_pcm(struct snd_soc_dai_link_component *dlc)
 	struct snd_soc_dai *dai = snd_soc_find_dai_with_mutex(dlc);
 
 	if (dai && (dai->component->driver->pcm_construct ||
-		    dai->driver->pcm_new))
+		    (dai->driver->ops && dai->driver->ops->pcm_new)))
 		return true;
 
 	return false;
diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index a5b96c17633a..7dbf37e0ba2f 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -2510,6 +2510,7 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 {
 	struct device *dev = component->dev;
 	struct snd_soc_dai *dai;
+	struct snd_soc_dai_ops *ops; /* REMOVE ME */
 
 	lockdep_assert_held(&client_mutex);
 
@@ -2538,6 +2539,30 @@ struct snd_soc_dai *snd_soc_register_dai(struct snd_soc_component *component,
 	if (!dai->name)
 		return NULL;
 
+	/* REMOVE ME */
+	if (dai_drv->probe		||
+	    dai_drv->remove		||
+	    dai_drv->compress_new	||
+	    dai_drv->pcm_new		||
+	    dai_drv->probe_order	||
+	    dai_drv->remove_order) {
+
+		ops = devm_kzalloc(dev, sizeof(struct snd_soc_dai_ops), GFP_KERNEL);
+		if (!ops)
+			return NULL;
+		if (dai_drv->ops)
+			memcpy(ops, dai_drv->ops, sizeof(struct snd_soc_dai_ops));
+
+		ops->probe		= dai_drv->probe;
+		ops->remove		= dai_drv->remove;
+		ops->compress_new	= dai_drv->compress_new;
+		ops->pcm_new		= dai_drv->pcm_new;
+		ops->probe_order	= dai_drv->probe_order;
+		ops->remove_order	= dai_drv->remove_order;
+
+		dai_drv->ops = ops;
+	}
+
 	dai->component = component;
 	dai->dev = dev;
 	dai->driver = dai_drv;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 73a97ac6ccb8..3f33f0630ad8 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -460,8 +460,9 @@ int snd_soc_dai_compress_new(struct snd_soc_dai *dai,
 			     struct snd_soc_pcm_runtime *rtd, int num)
 {
 	int ret = -ENOTSUPP;
-	if (dai->driver->compress_new)
-		ret = dai->driver->compress_new(rtd, num);
+	if (dai->driver->ops &&
+	    dai->driver->ops->compress_new)
+		ret = dai->driver->ops->compress_new(rtd, num);
 	return soc_dai_ret(dai, ret);
 }
 
@@ -545,19 +546,20 @@ int snd_soc_pcm_dai_probe(struct snd_soc_pcm_runtime *rtd, int order)
 	int i;
 
 	for_each_rtd_dais(rtd, i, dai) {
-		if (dai->driver->probe_order != order)
-			continue;
-
 		if (dai->probed)
 			continue;
 
-		if (dai->driver->probe) {
-			int ret = dai->driver->probe(dai);
+		if (dai->driver->ops) {
+			if (dai->driver->ops->probe_order != order)
+				continue;
 
-			if (ret < 0)
-				return soc_dai_ret(dai, ret);
-		}
+			if (dai->driver->ops->probe) {
+				int ret = dai->driver->ops->probe(dai);
 
+				if (ret < 0)
+					return soc_dai_ret(dai, ret);
+			}
+		}
 		dai->probed = 1;
 	}
 
@@ -570,16 +572,19 @@ int snd_soc_pcm_dai_remove(struct snd_soc_pcm_runtime *rtd, int order)
 	int i, r, ret = 0;
 
 	for_each_rtd_dais(rtd, i, dai) {
-		if (dai->driver->remove_order != order)
+		if (!dai->probed)
 			continue;
 
-		if (dai->probed &&
-		    dai->driver->remove) {
-			r = dai->driver->remove(dai);
-			if (r < 0)
-				ret = r; /* use last error */
-		}
+		if (dai->driver->ops) {
+			if (dai->driver->ops->remove_order != order)
+				continue;
 
+			if (dai->driver->ops->remove) {
+				r = dai->driver->ops->remove(dai);
+				if (r < 0)
+					ret = r; /* use last error */
+			}
+		}
 		dai->probed = 0;
 	}
 
@@ -592,8 +597,9 @@ int snd_soc_pcm_dai_new(struct snd_soc_pcm_runtime *rtd)
 	int i;
 
 	for_each_rtd_dais(rtd, i, dai) {
-		if (dai->driver->pcm_new) {
-			int ret = dai->driver->pcm_new(rtd, dai);
+		if (dai->driver->ops &&
+		    dai->driver->ops->pcm_new) {
+			int ret = dai->driver->ops->pcm_new(rtd, dai);
 			if (ret < 0)
 				return soc_dai_ret(dai, ret);
 		}
-- 
2.25.1

