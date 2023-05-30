Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC567152A8
	for <lists+alsa-devel@lfdr.de>; Tue, 30 May 2023 02:51:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4BFA882B;
	Tue, 30 May 2023 02:50:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4BFA882B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685407888;
	bh=TvTYotcr4ZOu144Ecmw/NtiyUw1IkWxrJ0GVFOaUoro=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=boConMbjyuJV2IP1VuUsUNYkb+sUwDHoUxYrjn/gFu74PGF2V+By8z6kr7aOX5KT1
	 T10Tnb0kC4pRweaLSMf5fWRkjrK0FF2UzTS++bX3zff1GXJZdkc4pw0PGX5lP7LyA5
	 hfkhpWVgjMn2hxbmRTK6xnqVeipj6gx+OpilLcqA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B2639F80579; Tue, 30 May 2023 02:50:18 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6171F80510;
	Tue, 30 May 2023 02:50:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0C25CF80567; Tue, 30 May 2023 02:50:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20703.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::703])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BABD0F80563
	for <alsa-devel@alsa-project.org>; Tue, 30 May 2023 02:49:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BABD0F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QC6rQII/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=obA35xwTAaQ18WDVVKSmF+wCoGpOUaUMHqg+IDunUhGGxh96DrltYM++FUu06ozLCxd+6HrZYDSSR1F2j+a31EEyKy9XpwoknVSIX7qF8w7bDmwfyx13J3+Pi3woTiffc++5R+4JlmA3sG5c3V2H0WGP5O3wDgC+Nh4LtXlBvkBIqZ5w9DxAr2stPulH+kUAYuAV7ta5+lcpeDNZ5ThJHjHrUKT0NLFH2eubo7UR2oT1FdyfFbflFLE45SLiMDN5WEJyl664PHdQ6870yFOUpMFR/+OQH128b5OoDj2a66XdNWgrvwYqGRzDyljzumpqHyQ16juK2LqQ9XZuWNqprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbeDTQB35tZm8Y9PzzEs450v5znSklXmzYkAjOadlco=;
 b=UDZsMw2D2yzBBWkmm9vsB5fuG7FHBc6oCcEHVqAlojDWv//W8cHZkfic5yPn3fMuHP6WOgO5rf6MO0tFkhGCXbhnvaDgedjGc0XXCbs1dIvN6kvdvjNU7bLgZg3qM6I+Op5EDb65Qq3Vt+u6MDGqrGn40Hafen2WvoENJVFqF0gJPzgkt35TNvfgPmrTIg1x/+Im95LembCriBwVyTVymcJHo2rzQ5/GLxW9Z9avDQw38lwG5W1gFLUfYhqZ55Rbvs02Hib3QCh2PjveOWs9WgGgund77lwj5CpaZO0dsU4YukeE9MHYBq5+AaWxYI0StSDPP4i6QyAlBtrfxNr41A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbeDTQB35tZm8Y9PzzEs450v5znSklXmzYkAjOadlco=;
 b=QC6rQII/cLfTtLVAcOFBHi0JLTMUYSjXwrGDcTXmrrBtWmRzNhiUhHnY9te/JZjAXXnpFdbRbRrFinCYLvRyUcjpp20dppO1N2jMEKKtS8WZcUNGTXAURFQgBQHjTWBm5h1TwcMgylcqo+8GUiwzxnareGTe1Dqq8t9MKYJKHoU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS7PR01MB11502.jpnprd01.prod.outlook.com (2603:1096:604:243::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.23; Tue, 30 May
 2023 00:49:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Tue, 30 May 2023
 00:49:51 +0000
Message-ID: <87wn0qzlqp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 2/5] ASoC: soc-pcm.c: use dai_link on
 soc_get_playback_capture()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
References: <87zg5mzlrc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 May 2023 00:49:50 +0000
X-ClientProxiedBy: TYXPR01CA0049.jpnprd01.prod.outlook.com
 (2603:1096:403:a::19) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS7PR01MB11502:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba9e0d5-447f-451d-93fd-08db60a7c691
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	5caEhtt7g57n/wnv03s8GbHgYsPJ5ogiWv6O4HgYkq6xUq3/7vB5HhEVTUEwc2CjLa7He/UhP/PxsCCa7hOXytTxO74akPQHZWI7N6OCdTQXX6deBq3n+XZE26IV1G0q2xT+GfqgqkI60OrHJ6oZA8B9FEILxnrHxLteHb/e0eNbo6kCcY5IhzauRZxeuo/hl0ejoSB0vNHSoG2lRR0vJxgqE/4lUIvtD668Jg5+14KjrwpZnip18X1YR1ucN/rqmxuuqZXXB4sxW1Jpt+Z1m8FOGlyn9Uy/v71JOO1Yh4Xge4H1kGlzQnaW6cgbDiERlK/9+K9jFL3UXDXRWWO5vuKDCYl3bsB6oQ0G82yVODjW9GIhrtwUQTFZbSSLoGox4dbX4Bba5nzKQzmWuRbPhTHaJMfWMYF72pytYazZG1pRFqczBT1dlg6QGIwaOv1M/7gATYOu/tpgUjsM0Gzuus2yb/mI8l4QUgtJk/Am6LhlvNFZB7g2G3OE6ZJc/vAu9+38Bv7Y1YgrRnRVU9ypEI6njM4AwmHd9XFC76Zr3ciZ7TRwvDv9k2sLkypTt6ySmkldVKxNbXmXkyTwO8qCOmEb2PTLt/MPBWS7x1GVVkKoQrbDV/7bN47infIP6JZHm8xD1ULD0XcjuPrsZH5ZlA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(366004)(346002)(39860400002)(396003)(136003)(451199021)(186003)(2616005)(38350700002)(38100700002)(41300700001)(83380400001)(6506007)(26005)(6512007)(6486002)(52116002)(478600001)(6916009)(4326008)(66476007)(66946007)(66556008)(316002)(5660300002)(8676002)(8936002)(2906002)(86362001)(36756003)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-2?Q?ZFXi80dXdPXawq+Vj6XxbAelBYfLQxyZH6bPb9V872AlJ2X3jnLRAtRdD5?=
 =?iso-8859-2?Q?MyVqJf5goJTE2sCcD7WQKf3odC0R1VtXKUKl74D0IUyxP6voji5ZUI31Gq?=
 =?iso-8859-2?Q?adl6CKwOoUMQCavk4XN2IVhYtW5ExOSJbQr5dJcmBIvzzAoQw8HPDZHoAy?=
 =?iso-8859-2?Q?5kVgPkIirnVFl+et5H0JqMgT/uATRuLyyZJQb9PK5Nq//OP1xLUDB1ItmH?=
 =?iso-8859-2?Q?CDT8IJ1Atd/ovICi2rXED3rzjf6D60QfiQFzOhGw7g/DtFW52UxlJ58wLn?=
 =?iso-8859-2?Q?waqEI6ZEf6mKnzVAekbV6PoRr4gGskoYfcg83VBgmUHv19mag6ot1ggD8V?=
 =?iso-8859-2?Q?AIpEfUoEP2HT9IAVwzfVRBSoA0yq9Pgc2w7apVK1+BcMGs7IYEr1uB09ld?=
 =?iso-8859-2?Q?r3Dn3DJh4Hr2TovKrkUVs/CRe9m7ZXCxefPJdESWZEYRi2sEjQSEgonahW?=
 =?iso-8859-2?Q?9w7kSKjqHRw7FXUjFPox752lXGneDSo/VIBXaPkmMNIG1FHna0tpKzwbTK?=
 =?iso-8859-2?Q?r0UGr46e3mwGWVBEIzLVIu+/lPu0s0Qg5c8UVmpx7iEemFvEmIXMdlIQ70?=
 =?iso-8859-2?Q?G/QvMiQ6MFIK9+hy+Hlp2z2ICn2wYVm006YRmFndrnPGhLVgCr2/m/gUJh?=
 =?iso-8859-2?Q?npUXoGpWZ4iSVOuuDdT9Q3CVcibrzd3U+zE9bDShmsa1gdCoyKCdHOkkIC?=
 =?iso-8859-2?Q?BhDpoJ/fKFWtAVfcWzM/Ec+qz7R7LKA5N1hZDwxueuKyawbpumm3SkzU+t?=
 =?iso-8859-2?Q?ruOu8GUnK7snWS8oBPXTLqVGK870LEHeqn5SG7j1rrCTbChCHAEwOImZNt?=
 =?iso-8859-2?Q?FZWRbjihUildD/pf/vv4JrH14s4/asyB7AR//mpUHgzxzu7FiMVs1UUuUm?=
 =?iso-8859-2?Q?BuJbI1m42G0KWksbsrpjySOSpaFpp+UmEvMlB2xkVo7YCIpebxFvJqYJPr?=
 =?iso-8859-2?Q?zyBysuL8X8Br+1mP/1Gggct3rAWPOQGBpVo9D84Q06hL0xsnOAVtiPPDxY?=
 =?iso-8859-2?Q?6J9eAiMHNRL1Xvk3xNhX/h1hKP7F8wS8j1yrEb+p8zgCyPkRFaGmDOHeru?=
 =?iso-8859-2?Q?GfxboqkOEDX36yFiSyTtkSoDdyEOSW9Q2sEbZ+6jGbP9goP2LqXRUKzULl?=
 =?iso-8859-2?Q?IMsjIYOSEUIl7REEBq61sUUter2u1YhohfaRWxtSm0gkj94ybRi7PJRBE1?=
 =?iso-8859-2?Q?x/l1p6m8SVDrCdvjJnwBtcuRoUEUatNbnxm7y7M+hJmkMmVtSeLHs0XSba?=
 =?iso-8859-2?Q?pFYKY/NYbAEnH4EG0EPDWMi78wZFahPhRrjJOdnFKOQXnRrGbNinBTUZo0?=
 =?iso-8859-2?Q?XP1dZHH6xyyTyOv6/ateit27uactPfmZK6cosSItf0uY6laLblqh4QR82F?=
 =?iso-8859-2?Q?fXT0PSQnRllWXKoG3TkuuESHNuInyTfbEVASYnerKPX5cZLT4bDBtCwdJL?=
 =?iso-8859-2?Q?z7cLFp2ucl66rudcZ/nNxX5JWu/IjaYK4WCKNxVYICzOz9drxWqwfWXkQW?=
 =?iso-8859-2?Q?itM9SVcKS+iI0xBuc1Z8G1/2X1utJMBRqdT4bnTRdgX2Hk/v2uHoO6Rq1c?=
 =?iso-8859-2?Q?b8T/ws7ftdndhvA85RRUipenAEIgmKkJ3jfsV3G6DsFmaLZVaKZWXULVyL?=
 =?iso-8859-2?Q?UwM/bRfWNO/y6iHEFuHnAKnkjmT1YE6TlCC0jDXTnQncDW40lfbLVOD7eB?=
 =?iso-8859-2?Q?t64FrokzSVi2YBbWaLE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4ba9e0d5-447f-451d-93fd-08db60a7c691
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2023 00:49:51.1382
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 SkTTyCXv6dSkT//4PizG8vk53tutJA65lGTI0aBax/gqARh/iWRu3tEP8dSquvunpN5pc9VHfpSyK2UA9Vq13CKBMDL/GJW+dPVRsWIAJweneM5rTZBvEk2/rR1SiRmy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB11502
Message-ID-Hash: ZOUVEADF47ZLYKF3KST4U525DT26SB6I
X-Message-ID-Hash: ZOUVEADF47ZLYKF3KST4U525DT26SB6I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZOUVEADF47ZLYKF3KST4U525DT26SB6I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() (A) is using rtd->dai_link->xxx everywhere.
Because of that, 1 line is unnecessarily long and not readable.

(A)	static int soc_get_playback_capture(...)
	{
		if (rtd->dai_link->dynamic ...) {
		    ^^^^^^^^^^^^^
			...
		} else {
			int cpu_capture =3D rtd->dai_link->c2c_params ?
					  ^^^^^^^^^^^^^
			...
		}

		if (rtd->dai_link->playback_only) {
		    ^^^^^^^^^^^^^
			...
		}
		...
	}

This patch uses variable "dai_link" to be clear code.
Nothing changes the meanings.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Amadeusz S=B3awi=F1ski <amadeuszx.slawinski@linux.intel.com>
---
 sound/soc/soc-pcm.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index fe65994485f8..db3fbe1af2ce 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2731,19 +2731,20 @@ static int dpcm_fe_dai_open(struct snd_pcm_substrea=
m *fe_substream)
 static int soc_get_playback_capture(struct snd_soc_pcm_runtime *rtd,
 				    int *playback, int *capture)
 {
+	struct snd_soc_dai_link *dai_link =3D rtd->dai_link;
 	struct snd_soc_dai *cpu_dai;
 	int i;
=20
-	if (rtd->dai_link->dynamic && rtd->dai_link->num_cpus > 1) {
+	if (dai_link->dynamic && dai_link->num_cpus > 1) {
 		dev_err(rtd->dev,
 			"DPCM doesn't support Multi CPU for Front-Ends yet\n");
 		return -EINVAL;
 	}
=20
-	if (rtd->dai_link->dynamic || rtd->dai_link->no_pcm) {
+	if (dai_link->dynamic || dai_link->no_pcm) {
 		int stream;
=20
-		if (rtd->dai_link->dpcm_playback) {
+		if (dai_link->dpcm_playback) {
 			stream =3D SNDRV_PCM_STREAM_PLAYBACK;
=20
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
@@ -2755,11 +2756,11 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
 			if (!*playback) {
 				dev_err(rtd->card->dev,
 					"No CPU DAIs support playback for stream %s\n",
-					rtd->dai_link->stream_name);
+					dai_link->stream_name);
 				return -EINVAL;
 			}
 		}
-		if (rtd->dai_link->dpcm_capture) {
+		if (dai_link->dpcm_capture) {
 			stream =3D SNDRV_PCM_STREAM_CAPTURE;
=20
 			for_each_rtd_cpu_dais(rtd, i, cpu_dai) {
@@ -2772,7 +2773,7 @@ static int soc_get_playback_capture(struct snd_soc_pc=
m_runtime *rtd,
 			if (!*capture) {
 				dev_err(rtd->card->dev,
 					"No CPU DAIs support capture for stream %s\n",
-					rtd->dai_link->stream_name);
+					dai_link->stream_name);
 				return -EINVAL;
 			}
 		}
@@ -2780,15 +2781,15 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
 		struct snd_soc_dai *codec_dai;
=20
 		/* Adapt stream for codec2codec links */
-		int cpu_capture =3D rtd->dai_link->c2c_params ?
+		int cpu_capture =3D dai_link->c2c_params ?
 			SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
-		int cpu_playback =3D rtd->dai_link->c2c_params ?
+		int cpu_playback =3D dai_link->c2c_params ?
 			SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
=20
 		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			if (rtd->dai_link->num_cpus =3D=3D 1) {
+			if (dai_link->num_cpus =3D=3D 1) {
 				cpu_dai =3D asoc_rtd_to_cpu(rtd, 0);
-			} else if (rtd->dai_link->num_cpus =3D=3D rtd->dai_link->num_codecs) {
+			} else if (dai_link->num_cpus =3D=3D dai_link->num_codecs) {
 				cpu_dai =3D asoc_rtd_to_cpu(rtd, i);
 			} else {
 				dev_err(rtd->card->dev,
@@ -2805,19 +2806,19 @@ static int soc_get_playback_capture(struct snd_soc_=
pcm_runtime *rtd,
 		}
 	}
=20
-	if (rtd->dai_link->playback_only) {
+	if (dai_link->playback_only) {
 		*playback =3D 1;
 		*capture =3D 0;
 	}
=20
-	if (rtd->dai_link->capture_only) {
+	if (dai_link->capture_only) {
 		*playback =3D 0;
 		*capture =3D 1;
 	}
=20
 	if (!*playback && !*capture) {
 		dev_err(rtd->dev, "substream %s has no playback, no capture\n",
-			rtd->dai_link->stream_name);
+			dai_link->stream_name);
=20
 		return -EINVAL;
 	}
--=20
2.25.1

