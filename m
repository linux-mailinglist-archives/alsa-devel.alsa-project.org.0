Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4460B79B158
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:52:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C58ABE7C;
	Tue, 12 Sep 2023 01:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C58ABE7C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476342;
	bh=vm80TbGiKSPPCmEYyXiEkKqso4uycAU6ACHTKMBoMvA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vBhBG86NsL8OWlFQGsgxsAgcbbzp5gl3f2PBMG3/TItnXZpGMqqMeCLrI5RvRpe5F
	 V37J+QFUCUKMaCL+V20p8RI41Uxqq02cAKgceRhlxYVbXbm8vHixqtcijfSMCvkniI
	 zOX+lBiBspx4+s2XWE+BTOcAQJ/0SXVQlqDGZUQs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ED663F8057E; Tue, 12 Sep 2023 01:49:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12309F8058C;
	Tue, 12 Sep 2023 01:49:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DAFB6F80580; Tue, 12 Sep 2023 01:49:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20729.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::729])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1690AF8058C
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:49:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1690AF8058C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=X6KZcbAc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eqyEIVwZ+15gV+Nmq3AQv8yZgl42hLc2VdY1PtVBzTOV5bVDJVmrOcBKB6gqaLD5zieD0Hid9agC6crhQOlUfajy0CtaUtxluIsGajuAimreViBJo2vR3d8EUMV6x2FxyQN5xsPh5RmMFGhqLUwucBkf0ei8tfnXrsco/3r42W8SuB4EF/x57w0OqsdKhNMrLHDfCAlANQeVr5MOcEh9qPqtmLrKjSL2YoDUr6oIHiGxcC1fvQArcUe3iZsw1RvgRs85InsTvAFqPEnSIidqZVsnznkvhEcb+lSkOGxd0LAN/U/P++re/z5VWzEWcD1pIC6qlwWE+yu4McYDMgMoiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ThYFV4yWb9xVswX/tma6Q5K1A1gqq7/tFPhEmZdzYgQ=;
 b=Arnv4mDU4BS+taxw9OHg8tniHWCmXKq17Y8uZCm5bHs86nxFXD4jX8qeUJ7Q1Mcva8HebkFNjYuGkr7uLURoiC0rK95vYs5otxEh+C6IsbiPGR+o2oxUQNWy8EjhAppVgITlP3FxVQQYj/2MJnKuhRWsm95cpZEVaOOR1aDkh/VOU49OkS+TDhQn+Grg3rsp/Bs0gaSetsHJ4SbKS/Axdjh3lk4EauxQYJkvbjikqLvGCkEY5lej/UPO9jmv3RmAZzFoKFRnaGx+wsfJ6mQ8+OuNmG/QhzIwckI2qVBYXNLyI1fLJ+qnwA3HAHllRAfJ9PQIdBE4G8M5NeGbgwNUeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ThYFV4yWb9xVswX/tma6Q5K1A1gqq7/tFPhEmZdzYgQ=;
 b=X6KZcbAcKidSjtfZcJd0h3HqEjPG3miWlEoZsB7jVxiP14bjXfzG6KkLuEHUbM6sBAbBY10wZTsLRiSz6hH4Ut9MxrIDnSqxCJhmY7wRUYuWFIrauN5hgcsec/eFoUSGuIhGI6c+mqZMLrF4KzhUAvQqo1oQpdE5DdmmXPylXN0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSRPR01MB11567.jpnprd01.prod.outlook.com (2603:1096:604:22d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Mon, 11 Sep
 2023 23:49:08 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:49:08 +0000
Message-ID: <87pm2oqnik.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Takashi Iwai <tiwai@suse.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH 19/54] ASoC: meson: convert not to use asoc_xxx()
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:49:08 +0000
X-ClientProxiedBy: TYAPR03CA0004.apcprd03.prod.outlook.com
 (2603:1096:404:14::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSRPR01MB11567:EE_
X-MS-Office365-Filtering-Correlation-Id: 5811f284-b542-40ca-8dcf-08dbb321b0c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	pL5K2Ot84YfMQzCI2dlOCsLIPaWiX6lnYw8JGwH9Pr2EMyZsDkViz9rlH4dGmJvFswtdFDcMJrJE5CQ5lzlyct1q/iHZKeiC35IQY9hGMknBgJ5Z3M9JyOOdD5HovquasAqbkj42Ej7b2E1AX/tqPlkYziC6HkQvFm+go8NoyvGbi5k9ZgWZ/Hi7+up5LhmrO5S6HV98cS2AFQY69TxGQ7NrMuVQmUftIkDnlj9/Xec6G+kN5Yq+xlKach2Z65CqlmwyP/P+gE/bCjr43kRxMK0cyt2FLcoeegHR0SERxUImX2QuD2z72DBHVudVOauwPVOG9iVyKLT0N9e97Skdd8/vNbb42N666zcdTcKYZhntJVtdvgQMTeILfooZHZYXFC1X7cMsUm62lj9MSibSa7k4BT/qgeq8iq0P9ZJHWK5XAt3NPa/Oj6Hjm8fg/K8nb5mbMD8c7sjgghiTpRyNnCSmRy6mfm1BhLXDlIvyKFJ1w+2czpI06Ul44M1/dG0zwRWY21wIdYH8rYQoonqJHxb5kCEx7+X3xXdrjuVfQ0ijAWao/ZbykqNvB/eIeUyIWJvbHaghKYa9tZEGi4v9NUTsYAzDZ5/Lb69zSMTKQS5NQ20vbPfMUEdTjIkqIlLZGfkQjbr3TngNOeKAJ723pQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39860400002)(346002)(396003)(376002)(136003)(186009)(1800799009)(451199024)(6506007)(52116002)(6486002)(6512007)(478600001)(83380400001)(2616005)(26005)(2906002)(66556008)(66946007)(66476007)(41300700001)(110136005)(5660300002)(8676002)(4326008)(8936002)(86362001)(36756003)(38100700002)(38350700002)(316002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IKGS70pw1MouoApzD+RfYwdvU+RgJ+BRNEQ5JtI/yHhUZtfesK+RviPpo2OG?=
 =?us-ascii?Q?Ot5Tkihmf1JVtjCcMd/MxPVSgLYcjCNKqftINF8rC8OrzHWvLVaTB1X7DlZs?=
 =?us-ascii?Q?1wJvYqrMHXAn5Dir1O8LH7sjLcv2rq4AooZs9j9GhqpwF8v0lOQFyAf5j1uq?=
 =?us-ascii?Q?sx2Va06SgfHUSWe8Q46DHTwqjX3S74892ZP2sj4jOVZBHtPteM2yQRtH9f8Y?=
 =?us-ascii?Q?WyCICvwZ1JI34+3sIf4hOkinni53j88vVHCEI7MVfJ/d9FKOlp6h3AX6vlgB?=
 =?us-ascii?Q?QbsKnPFrfocymhikAGVLrkIRFDlC0De2044cxlCCOEqDo8oQLvbEuDFBEMhA?=
 =?us-ascii?Q?t0MPA9id0Czuy/I9Aq7fd42w4I76SNZ+5H51df/Hci67dZw+jyrqKytW6IFW?=
 =?us-ascii?Q?Bh8PIPjG0RdRgT7Cl7cns9IG9mMfpqmd51DtWWyE/7Qd/DiMeywMjzPdTnXA?=
 =?us-ascii?Q?dVHqWDotoxfSqzr1yg685Q5QKmGIVw9wRcoOElyr3vgTYmrfZMLMZuspWmxg?=
 =?us-ascii?Q?lqPvbUEsJjEuI0XoPdHfxJGJ8cD+2zlM1Gpv/c82nzE3w6AtqD3+M5Lav8Pa?=
 =?us-ascii?Q?bZWidkHWTTkCUFM9nSbqvTrKD+StxSG2czmMpMlwwZCaXL2qjB1VXRI5g3ko?=
 =?us-ascii?Q?oyS5VsGzrZrmQ4NnFE2VX3IU/Uiqu/wsT5HRo59Z2iySFo1ooPAc9inTnvRK?=
 =?us-ascii?Q?nsTOhgHfVNU6WVHKx2k8+0JBrg/cm8OVrNB96vKNBMjx9/Bc3005nWrmW9J6?=
 =?us-ascii?Q?RtQiyKXhb3NMEtM1wMnJfKpUO2MLoK4XDENQzx2IzN9o5jKjlIFzy7L6AJlS?=
 =?us-ascii?Q?eTs+h16pv0xpKFl5cs/NYTOFMimRAVViYtq3lk9C+eJamNv3yk5wQZ7YsEqr?=
 =?us-ascii?Q?7JG0XeAzkPPUqNmi1ktHS4cBtrdXCNfPaE3bCB1HjoTEQxHglz1jXqMcs58e?=
 =?us-ascii?Q?owmc1+9fmpzaHgM7he2TM3iEJS50kl6BSAS6T8DTmS5TpLUjjU36pjgrvVSf?=
 =?us-ascii?Q?FfNMg2FN4LJXWcDrpUO7+pfpJRC679t9WycA5b9mXX0isBKc4Etez4DIf448?=
 =?us-ascii?Q?+UzyKxOowHL8cbnhTU9ynNIlKdu404H+UpRMcFWMIGQ3dwTCtoma93R9hgm7?=
 =?us-ascii?Q?X/TV5/GMnGwRlpPGRMlT21+RqFVdvqkfVu91lb3PWm5JlBWMvDu/7bWbaTcX?=
 =?us-ascii?Q?/0zHadUZsGHO4dWcwR6du0tMEUFjhrirJB6QnRHv3X30JIKQVz9mgg95Afm4?=
 =?us-ascii?Q?FoIL0GJtnTC0c5O3jfz5amBluCDc7ZIXbToNUGJbiU8+g1yN+6CkCQDcukNO?=
 =?us-ascii?Q?VLZbZR/0WXzAPePOqp8oOJ7s4DSlraWzWtX/nzuyDpq44jdheuFZ6KztsXG6?=
 =?us-ascii?Q?vZghlkQPGLEV/WK/YtVD/asABfhGVjw3XHjwb3z4jAWdp67QSb/RwWnJtbYU?=
 =?us-ascii?Q?uRT3C8NW/82B+c18f8bVMgPBRZ7ILnFDy1Ov0akVfn3J8QizePpMUUJpafTC?=
 =?us-ascii?Q?u0qFOGd89SVOaS1wbKHUfWRudNXWdY/7X7h5gU4pQ7UGA9i7jtaW5H2JP73W?=
 =?us-ascii?Q?uQ/VPbhlY3S/HXEjNtgdBWPyDUgX3GtHmhwCaEpO5yePWHJT1vdztLmHUSUK?=
 =?us-ascii?Q?XIUk/udxNwcJpjv00mUf1rE=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5811f284-b542-40ca-8dcf-08dbb321b0c1
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:49:08.5084
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 149Vg2tfwuZCaBweXhOI5SohudO/lZlfSguWQs1at5+aJJicNXtD5tb9iT4HpSxAXBMZsjCO9BGAi6QCTcuLWnK/sYf7NRv52amJfiaK0fFVzQdsQmjV5wRTynHr5lZ2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSRPR01MB11567
Message-ID-Hash: 53KND6UHCXUKI2B6EKCPS4XCCMO6ZJOJ
X-Message-ID-Hash: 53KND6UHCXUKI2B6EKCPS4XCCMO6ZJOJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/53KND6UHCXUKI2B6EKCPS4XCCMO6ZJOJ/>
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
 sound/soc/meson/aiu-fifo.c         |  2 +-
 sound/soc/meson/axg-card.c         | 12 ++++++------
 sound/soc/meson/axg-fifo.c         |  2 +-
 sound/soc/meson/gx-card.c          |  2 +-
 sound/soc/meson/meson-card-utils.c |  6 +++---
 sound/soc/meson/meson-codec-glue.c |  2 +-
 6 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index 543d41856c120..4041ff8e437fe 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -27,7 +27,7 @@ static struct snd_soc_dai *aiu_fifo_dai(struct snd_pcm_substream *ss)
 {
 	struct snd_soc_pcm_runtime *rtd = ss->private_data;
 
-	return asoc_rtd_to_cpu(rtd, 0);
+	return snd_soc_rtd_to_cpu(rtd, 0);
 }
 
 snd_pcm_uframes_t aiu_fifo_pointer(struct snd_soc_component *component,
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index f10c0c17863eb..18b16274449e4 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -40,7 +40,7 @@ static const struct snd_soc_pcm_stream codec_params = {
 static int axg_card_tdm_be_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct axg_dai_link_tdm_data *be =
 		(struct axg_dai_link_tdm_data *)priv->link_data[rtd->num];
@@ -72,10 +72,10 @@ static int axg_card_tdm_dai_init(struct snd_soc_pcm_runtime *rtd)
 		}
 	}
 
-	ret = axg_tdm_set_tdm_slots(asoc_rtd_to_cpu(rtd, 0), be->tx_mask, be->rx_mask,
+	ret = axg_tdm_set_tdm_slots(snd_soc_rtd_to_cpu(rtd, 0), be->tx_mask, be->rx_mask,
 				    be->slots, be->slot_width);
 	if (ret) {
-		dev_err(asoc_rtd_to_cpu(rtd, 0)->dev, "setting tdm link slots failed\n");
+		dev_err(snd_soc_rtd_to_cpu(rtd, 0)->dev, "setting tdm link slots failed\n");
 		return ret;
 	}
 
@@ -90,10 +90,10 @@ static int axg_card_tdm_dai_lb_init(struct snd_soc_pcm_runtime *rtd)
 	int ret;
 
 	/* The loopback rx_mask is the pad tx_mask */
-	ret = axg_tdm_set_tdm_slots(asoc_rtd_to_cpu(rtd, 0), NULL, be->tx_mask,
+	ret = axg_tdm_set_tdm_slots(snd_soc_rtd_to_cpu(rtd, 0), NULL, be->tx_mask,
 				    be->slots, be->slot_width);
 	if (ret) {
-		dev_err(asoc_rtd_to_cpu(rtd, 0)->dev, "setting tdm link slots failed\n");
+		dev_err(snd_soc_rtd_to_cpu(rtd, 0)->dev, "setting tdm link slots failed\n");
 		return ret;
 	}
 
@@ -125,7 +125,7 @@ static int axg_card_add_tdm_loopback(struct snd_soc_card *card,
 		return -ENOMEM;
 
 	lb->cpus = dlc;
-	lb->codecs = &asoc_dummy_dlc;
+	lb->codecs = &snd_soc_dummy_dlc;
 	lb->num_cpus = 1;
 	lb->num_codecs = 1;
 
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index bccfb770b3391..0a92adb67b278 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -47,7 +47,7 @@ static struct snd_soc_dai *axg_fifo_dai(struct snd_pcm_substream *ss)
 {
 	struct snd_soc_pcm_runtime *rtd = ss->private_data;
 
-	return asoc_rtd_to_cpu(rtd, 0);
+	return snd_soc_rtd_to_cpu(rtd, 0);
 }
 
 static struct axg_fifo *axg_fifo_data(struct snd_pcm_substream *ss)
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index a26b620fc177e..01beac1d927ff 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -29,7 +29,7 @@ static const struct snd_soc_pcm_stream codec_params = {
 static int gx_card_i2s_be_hw_params(struct snd_pcm_substream *substream,
 				    struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct meson_card *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct gx_dai_link_i2s_data *be =
 		(struct gx_dai_link_i2s_data *)priv->link_data[rtd->num];
diff --git a/sound/soc/meson/meson-card-utils.c b/sound/soc/meson/meson-card-utils.c
index f7fd9c013e19f..c810992185979 100644
--- a/sound/soc/meson/meson-card-utils.c
+++ b/sound/soc/meson/meson-card-utils.c
@@ -13,7 +13,7 @@ int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params,
 			      unsigned int mclk_fs)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	unsigned int mclk;
 	int ret, i;
@@ -30,7 +30,7 @@ int meson_card_i2s_set_sysclk(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
-	ret = snd_soc_dai_set_sysclk(asoc_rtd_to_cpu(rtd, 0), 0, mclk,
+	ret = snd_soc_dai_set_sysclk(snd_soc_rtd_to_cpu(rtd, 0), 0, mclk,
 				     SND_SOC_CLOCK_OUT);
 	if (ret && ret != -ENOTSUPP)
 		return ret;
@@ -177,7 +177,7 @@ int meson_card_set_fe_link(struct snd_soc_card *card,
 			   struct device_node *node,
 			   bool is_playback)
 {
-	link->codecs = &asoc_dummy_dlc;
+	link->codecs = &snd_soc_dummy_dlc;
 	link->num_codecs = 1;
 
 	link->dynamic = 1;
diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
index e702d408ee966..f8c5643f3cfe2 100644
--- a/sound/soc/meson/meson-codec-glue.c
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -98,7 +98,7 @@ EXPORT_SYMBOL_GPL(meson_codec_glue_input_set_fmt);
 int meson_codec_glue_output_startup(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dapm_widget *w = snd_soc_dai_get_widget_capture(dai);
 	struct meson_codec_glue_input *in_data = meson_codec_glue_output_get_input_data(w);
 
-- 
2.25.1

