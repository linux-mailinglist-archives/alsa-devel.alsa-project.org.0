Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1919F710519
	for <lists+alsa-devel@lfdr.de>; Thu, 25 May 2023 07:01:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6D084DED;
	Thu, 25 May 2023 07:01:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6D084DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684990911;
	bh=B3ftONP+YkmSQ3x01Xzt1nD+kxFPj9Y8w2brHu/tG4w=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T9Utnsy9ctmuOuAXNo4DSzitCwQB84DczwlR4m9DbZOx9XCXh+brn7qDqwJW2On61
	 7ByD248bCQU5zwlkwL3eXrS5SJizEtVyb6iavqgoCngZmfKW0rl0672V3JwbZIJJb1
	 PC5r1LIRNs93RIqaFleu5lkwZs+PtjOZRiBDS5qo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6B13AF80671; Thu, 25 May 2023 03:20:37 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DA9AF8065A;
	Thu, 25 May 2023 03:20:37 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47E23F8065A; Thu, 25 May 2023 03:20:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2070b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::70b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66A1BF80656
	for <alsa-devel@alsa-project.org>; Thu, 25 May 2023 03:20:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66A1BF80656
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=kEXkYyks
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=koI6j9nQ+LILF6ZIxpbMxqcMfTNLAm+xKTw68BjOiePINiLnnrnMVwrEX4OSpW/ZUu2uGSv43hcovBB4i8rvvhFKX8chR/u1fJFyqD4wN4oaecc/VfwNMxMHjMzR6tdQs1g8eZ/chfUdZmoYiLpWjIJRD9pqLiN7UJvy5rl+VgyK4iQS62+zn/Siw78k4xieHhCqRvGHhSaK4VeSMzSEI+VjJwyuv8aQ0c2SBQ5eYbXzw5jpT9g+BOC4eODo+eXL4k8IqX1szDfWLGpOTT/L3Uxp/JAoVOW/NE0UT6c4yXhb2sSOmbFoyX1L1TIPyAF91GrE84xEdeLvV9pdi1lNLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+9H9iKZmrQL9EcgiIFBJwF3X4RSUHdBusJ2Ue1tVZU4=;
 b=Uf2LE+pBS9irIrsR8qTgNwg6CtNk2tDchZlgdTbRKH8AQjOxsFHDNKPEnfTcKZQHYVgUfG/SKE254iA4jhepLtxXqcE6+jnWsNwdT/CQNPhTMAD9IxP3wdQiRhKmMHOf17WBaJpSyjqGPNDyosVvHGlwA4RxlvNW9GQoakE5JwaZcNHdpVtFeOL2Fl3bW9kYnlYONA6i24bM/FtAcHxsQNYQpy40yceOG793EMyI9df5OM87HRhJnS3kggIlIZtLBiOge0UVa4ZTYLrBHKrUSMSeSdM0SGWAPMy5fC6CIUEHlWtu4e+wBlPs8e1j83krb0sfwe0pG9f9M15TxOTHTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+9H9iKZmrQL9EcgiIFBJwF3X4RSUHdBusJ2Ue1tVZU4=;
 b=kEXkYyks8wRXjhBwrDyKtVRXqx2MtGnLqOnsIBTLcqgGq17etP8BKlTR5a12e3jN9HZuchiWKLue2z1ZUU5Xlbg4iyKmGiURN2KZO/OzcZEFb8pcrNnYvi2sT6GMr+Oh/KN4kN6f5GWaW3YjRFKDRh8creIPA7jxwhBVXWQX3AE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by TYWPR01MB10982.jpnprd01.prod.outlook.com (2603:1096:400:397::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15; Thu, 25 May
 2023 01:20:23 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::6c36:5ff9:24c9:e4f7%6]) with mapi id 15.20.6433.016; Thu, 25 May 2023
 01:20:23 +0000
Message-ID: <87cz2pgqaw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH v2 12/21] ASoC: meson: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
References: <87ttw1gqgn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Thu, 25 May 2023 01:20:23 +0000
X-ClientProxiedBy: TY2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:404:f6::21) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB8440:EE_|TYWPR01MB10982:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a578a3f-edc8-49a4-fcf0-08db5cbe36c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	TOATQx8cZTq4HQQbpp5S9DZzP4d16pesYmIN8nDvLdbudIMwyC9njPbVnIuoAoNsbtI73GOPAY8mAog5+zK7m9hgaDRVpM4UApXn+Etezuxen9Bod/OA1NeVnbNRMGVZJu32EkoVXixBFlKOSXVd+hX1+lBq4SHwzcXaF33bamlVs+LheoBe2KI10wF00nTqIM4NuP7iDZwJfXqEuojbC2vHs2tLWUHzheV6W37rdpwAHJYUr6d0j/4vvbRyygGyYBYF2BDKH35Zv4uUhWBTlKLUe0vHT6zOoA7bRQJCuS1BbkEspmCQH4Cq2piqOlW5+NpU1P5AOBdRnk59JCtsmkXfC/CzzM0GZArY31YhMiwhRtzw/MdkJEpMSZNsGjA8RITan93OIoYJQsF5ZmCYTwE5VNkQPJ8lZmMq43uNIQ9Fm4kMvdw8wIUu9h4Os/AfaXP8shRcOd8kzyMw6FAGVoV7a/uXblYA1r0DC20KlYKLmzgLiaT6wxMh6W5lKX30ghnsvk2DmCarZK9W/By0niJqFs+XF3hGofnH8m+zmk8BXoZl/Q2WtspNLothwLIb3g16gvK5sY53JAjYcEluK52FkZjqnz+Dx3qsKmXPCe2OyRGuJXuSnPitHSfw7z2V
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(346002)(366004)(136003)(451199021)(52116002)(478600001)(6486002)(6512007)(186003)(6506007)(2616005)(26005)(38350700002)(38100700002)(4326008)(83380400001)(66476007)(36756003)(66556008)(110136005)(8676002)(316002)(5660300002)(2906002)(66946007)(8936002)(41300700001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4fMb2lHuwb5Op7DPnqlhOS9aBEu3WTQ8XZSwe6cgcwP8yoP4hH2dA7SPeBzS?=
 =?us-ascii?Q?2sROKN9lCfwJ0uxroPPWfDkvpFjmRzWT8oBwT36Syw0azmc8xjKNZOESXRRe?=
 =?us-ascii?Q?OQG24nRPfhuZ6frbGDvGreslYjKz+le90Djl9LjMeejYLHVQU2QEsIuC8L4H?=
 =?us-ascii?Q?+c+crnkTWJkDwiCW1IBHs2/KjppR0cz3WKia9qABPt2EHdCLZ6DzM8blCEY6?=
 =?us-ascii?Q?KOyL2/3zrl4GK0/EdlhmnJEclU+AMeBHV4oxkwEmVakfaFw6CDf+CcDL/Yny?=
 =?us-ascii?Q?ChI3D1yw674jLPd3tI9VYQyu8ZBDY5684TwvwnpnaKq7yF9crxQ4ckPsKiio?=
 =?us-ascii?Q?U5WZFkz+fXqCKkS2umpGFxfY8yNzZYfgtTC7Qer/kt1bStTDoYOYQ8ooGbNr?=
 =?us-ascii?Q?XiA7PLucZfs8YtfBKucc272Rav3CaOA6/UitenIZ4iWnTw89TI0aJK4lcVtF?=
 =?us-ascii?Q?EIvMdPiK4yZZV/zLIOYq8amd0Gh6q05qWlLNRpO8XsRX4kalsPgJA8/uz3pb?=
 =?us-ascii?Q?eFmrTC2RrvkyWAK2qTC3u+4AnxnO0HzRsUkFItDcIlTD3Aduin9MfgYDxuhe?=
 =?us-ascii?Q?Rd4iW+SCIRSv2x9ZqjgtynmvhSu4wlXaLahnKf3zdUD7Z/pnV7IR3CTs+Qiq?=
 =?us-ascii?Q?R3RDpm2f5dIFB/h72Ugc/VWyk3jJY9ojuwEwJ/KfHPqAZSSLfIZhZ7ilLVsb?=
 =?us-ascii?Q?oTHceO/Kd16FqN5LtOPOi7JPP90+krLJoELScYgi2sEPpmAdwUMP8iVXZK77?=
 =?us-ascii?Q?IRJys6cw7zwMCMNBooT4A+tPby9qGK4dS/ODsnEUYiTD0KUEnpkwk9Jd17KQ?=
 =?us-ascii?Q?b1068f3Upb2m8NrntozPIJcUsdI9mNx1cxl4BYBulRVRn5gPa0S2zomdqtoe?=
 =?us-ascii?Q?/4w+EiL3v1qs30VupvRdQX97G8JV/qn0KxJNjPxg0R6BlorukrocBhtkrs3e?=
 =?us-ascii?Q?yaiwytoIs7ftWCrNQVRxd5TjO3bMuBkPGOBY5k/u7zpPF3hq5MTMPCLAHSss?=
 =?us-ascii?Q?vFTVc9qmzPIHfA9TxwOkq92kQY1OHGSUwEk4+u2vdKvCxA7Hqt3oeZ5LpwF/?=
 =?us-ascii?Q?Gb02QzIYpXTU5dE+rNlIQ7ddj5wDthJRU1ElSYWZuVuKuTq+1KLgZtpPpI1q?=
 =?us-ascii?Q?902ICHTIfcskAdmpGI1qFXfcBIhfNXCqfYd1SmKDoULP5Z0JblVvVy8KNOjv?=
 =?us-ascii?Q?sWI2Zl7b5Pn2XBZs24+K5fgvEWA2HyjnCz90p0BYT2aXHpE7bQCv0T7wLXjA?=
 =?us-ascii?Q?turH0KmmLFLt0toXMB6RmC1vj0Ik9SLV1LzgbWipOVso1ZOluN8VzCf+FBOT?=
 =?us-ascii?Q?MoFd6EeMkR4wwm2R5j/GQyD4K9oV7wyUNs9Qdo5NZ85G3J71MC51TnpnDqPD?=
 =?us-ascii?Q?8QlNmgKn7GHN44KltGTaJUUit+tG+w38FTs8nO7cUp23wNBcEw9awMzv+JqY?=
 =?us-ascii?Q?ypDUEprtZDQK44Sy4KafnBvD/RT+JGKPiUYohYpKYcMeVHYy+N/oMjAqSKi5?=
 =?us-ascii?Q?5eSfM2ABOE4mqhJsB276QnnLm8livXrnVgDObWfpkbL60V7MbKo8U5WONYgZ?=
 =?us-ascii?Q?pVREn8MynubQ0ly61EUnjg99LdD4CJmjdVZuef06N6hhnx4SJcaVAqbhYYxD?=
 =?us-ascii?Q?CPekZhhwj+Od73h6KSel9lg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a578a3f-edc8-49a4-fcf0-08db5cbe36c1
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 01:20:23.6599
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ig14VhFcF/5hBILvZjWGjZZAkSZc1E6gp4q0nTWkwluDQ5txiA0Juh6LTrRUF04MEFRY0bxzLmj6ZQMtMvFr46qJJsOlQSuolJLydoWH3joJ8XZEwErv4FP97/1ARF8b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10982
Message-ID-Hash: KVNA4ODEWOW2QBBTETNQDF3CFLCFRPK6
X-Message-ID-Hash: KVNA4ODEWOW2QBBTETNQDF3CFLCFRPK6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KVNA4ODEWOW2QBBTETNQDF3CFLCFRPK6/>
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
 sound/soc/meson/axg-card.c         | 8 ++++----
 sound/soc/meson/meson-card-utils.c | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 74e7cf0ef8d5..2d62e1ae7425 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -132,7 +132,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 	lb->stream_name = lb->name;
 	lb->cpus->of_node = pad->cpus->of_node;
 	lb->cpus->dai_name = "TDM Loopback";
-	lb->dpcm_capture = 1;
+	lb->capture_only = 1;
 	lb->no_pcm = 1;
 	lb->ops = &axg_card_tdm_be_ops;
 	lb->init = axg_card_tdm_dai_lb_init;
@@ -176,7 +176,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable playback is the interface has no tx slots */
 	if (!tx)
-		link->dpcm_playback = 0;
+		link->capture_only = 1;
 
 	for (i = 0, rx = 0; i < AXG_TDM_NUM_LANES; i++) {
 		snprintf(propname, 32, "dai-tdm-slot-rx-mask-%d", i);
@@ -186,7 +186,7 @@ static int axg_card_parse_cpu_tdm_slots(struct snd_soc_card *card,
 
 	/* Disable capture is the interface has no rx slots */
 	if (!rx)
-		link->dpcm_capture = 0;
+		link->playback_only = 1;
 
 	/* ... but the interface should at least have one of them */
 	if (!tx && !rx) {
@@ -275,7 +275,7 @@ static int axg_card_parse_tdm(struct snd_soc_card *card,
 		return ret;
 
 	/* Add loopback if the pad dai has playback */
-	if (link->dpcm_playback) {
+	if (!link->capture_only) {
 		ret = axg_card_add_tdm_loopback(card, index);
 		if (ret)
 			return ret;
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index ffc5111f9e3c..8a531ec8fad4 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -192,9 +192,9 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 	link->dpcm_merged_rate = 1;
 
 	if (is_playback)
-		link->dpcm_playback = 1;
+		link->playback_only = 1;
 	else
-		link->dpcm_capture = 1;
+		link->capture_only = 1;
 
 	return meson_card_set_link_name(card, link, node, "fe");
 }
-- 
2.25.1

