Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B469C76C1C7
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:59:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1219BC0;
	Wed,  2 Aug 2023 02:58:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1219BC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937956;
	bh=gVg66U9/wT06nXLLyCO4wP4DiBF4yQ4qUysZauBmi7U=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=X5M8cgPHwtt/kku9VTBUAWijoXLWjcy3wYuF+u9phLenkaEo+M2xpXgOPSd5GQnH1
	 7SyUOmsgxsGsYcY+RCgMUBrHHEGVSAeIx7niJDNBDD+3KNgavsMMxTJsTnhfR1HJyy
	 5ptaS2YrGJut/cjVWlFeEw3aPJ3SXbMLvfH+UYOA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 19564F80568; Wed,  2 Aug 2023 02:55:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AED17F802BE;
	Wed,  2 Aug 2023 02:55:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16688F805BA; Wed,  2 Aug 2023 02:55:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::713])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9C484F80604
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:55:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9C484F80604
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=hsXiK7HO
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iO+73fkK7cr9l7m3dN9MggwzC5lW7Y7FL+mp/wXgWg+dqi0yhlkyrLAe0eqcjluaewTtSeevvdr8/OXN5bCho4xF8pdpzyXr03fqKA+LysTjfVEsCa3oGwcyGVKYPoAIYuRUBh0UeF4C2iW4Ym0yhoRFEVN31RrvGQYy/DqtUe6p2xtiSqOd9FmW7FRf4D23sGCgv6Ko14RIVaotU/NwJ1SKopHxkykTf6aofrcSwzqQ7++0ac5t0aJJvHl6tZBLtRWh+XJ1AEqSGvWZ96ktMp6fxKTMpJ5C2vII1+703EyIj3WsgKp0YljuqJvploZLZA/6tJrZB+ktVr9MLug9WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqR/+dupUu86dvOWHm0QA3L9k/Lx3CgRqtnM70DH0QM=;
 b=FL4RSEh9Ap/Z/LPzVh9RJDYqx7B6/I2i7Xx+2JLsJwH1gTngaPr0VR1KBmEdb6JCBYStcz2zpNbrIuAPQ1ygbe9mc6zDuc6tddNsxYb2UKE5bIWa9G0fTByZoXc6sDdMVnyPQ7CJqZIG0UMu4Y/FPKrThQe+qDdKgZxcT7MLD2lnpD0qsw2AatL3ztztopNNSeICcFAVBqb1Xf0WGztN94eIIwOUvfvkAd6vBJneHk/kzMyjmNwlSBiHw1GB/9NlJM0jgFGtFSFOsKG81bhtHwdElm4bA95afhLUJDqsqui1IzrfT1EMEAj6nE/IhMq7ztbn+ZdwsQAhqWNyB65MHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqR/+dupUu86dvOWHm0QA3L9k/Lx3CgRqtnM70DH0QM=;
 b=hsXiK7HOwM3X79FMU2IXd0YQcwISplwyct4ldY6nU/wb/6Ky7svSM74Bk7X87w687Zz4TGrCyU2VzPSUuUCrxOwbzmB7/DlQITSGdpgQN1fTFvP9V4eBvqk4oe09kjGT9kmD6NaVewBD3ALgRcDIFcDTTY7bpWJDgIWnVk9n1VA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9381.jpnprd01.prod.outlook.com (2603:1096:604:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:55:26 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:55:25 +0000
Message-ID: <87edkmtg8z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: "Uwe" <u.kleine-koenig@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Takashi Iwai <tiwai@suse.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH 22/38] ASoC: meson: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:55:25 +0000
X-ClientProxiedBy: TYBP286CA0026.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::14) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d281d1b-d992-44e9-2b62-08db92f32874
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gge2qUr2CTa/kbnQIcRlC3GjgJcKs1uNP1QKVACvtQzUt9KfReJd9CC8tWccMJr1158Drx0CwK9zQOkt67jvfMpScIgfoMnZRCwpAFkGnXU+/OeFXFjz9gfyHb6AsYRxyd91YpxBPSPJ1A4p8vIbPtt4LLyei9C3dL5r8MI8v6hemHT9NYe4EemVMTwkAmMmOIqraThC/48QIF2YXYuTFRFSLnn1v73EOw+USN1WDof2FS4OmP0PPfSqeiWH/pv91qUZHFHBLd8O/Co8EkY4xzdZTwQUQwQn/SOuHMJqZl4sAmhyfX6iMUHuVWdQbFX8Vi5GbxRFpjmOIQoKfgxh6NHPDRC25Prfvaof+EGwUk4cGR9cwLw2OWFi9Pmih0ziXerKcr6Sj2UzOtN6p4g5sW/UDEOg+PyfJgi5lVpuS6DRi6Xs8UC/s8UQBBQCGIyFJhaSdzr7ekp1j+//9qVdQfAmXdFfe4h2maZlQQOhDrWCheEtbU4JpdCPdanZTa5UhNu5yefJMIcA4S58p/JtMk5nH9lK9pwifVEV86QEdF9ukJDF/tgX02N6knwmJak8qrSqd/DP7ZBl1InXwXDLW5TGUZxYhsjATGTdU4ZvFUfFa5K/txIGar3EmFSaoZdz
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(38350700002)(66476007)(66556008)(66946007)(2616005)(83380400001)(4326008)(316002)(6486002)(52116002)(6512007)(110136005)(478600001)(186003)(6506007)(2906002)(7416002)(26005)(30864003)(86362001)(36756003)(41300700001)(38100700002)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?pyeB6oZvUFy7rHsIVE5lhXCwHlUNovJGz1z4T6ApMYcWYYQ53JM5TyFMFoTL?=
 =?us-ascii?Q?3g2O7prAUcGgGkV8IXzukCpVw6lFsFMueH7g7XQ6c+J0UU+ocxzmaa50HJIQ?=
 =?us-ascii?Q?pc8sKx8BQVaTBbtebYyqE1EdfuJw3rZ774SHF69Zus7TavhL7tpbOdmX8eKW?=
 =?us-ascii?Q?7AnGnyYkof0iKIKdlKnbA61V5+UG9L9xrM4/adxzdsZtmhSP8zDt4/Uk6GHq?=
 =?us-ascii?Q?ZGFo0hiMxRiKTzA8gWIUDkjwaV31HMlJouV/SjX3XiLsrLfIRijH9SJydJ3x?=
 =?us-ascii?Q?8MTT+G2cegxfvqRXWPRCe6grJOiBd1hNIahR7m1H+y6h6o6w8X3WyzCl0Mpk?=
 =?us-ascii?Q?CYYSsPiiqM1ksMq9czeNLdURZZpQVpp5+wtTuS6z6cCNyTqU8qEw3Te0rv2H?=
 =?us-ascii?Q?4awIRxSeWblz2PxbzzS99BSx3QOBtvYc80wfYpeNaRK0vz38wjFENwNRc4O7?=
 =?us-ascii?Q?0cZLKANPYAuhXytEeXHLXWvkvmxDMwjk3XhatzaLFeRm52/pxturREUNslGU?=
 =?us-ascii?Q?ZDx2TDpaxnWznJE2C78u5FYR4zrsbEHL4dBp4O8ix1x0QbLAjj2Uf+g5K0qm?=
 =?us-ascii?Q?i/9jwKoUhoRDlidg//mrfnedhHYtRK9gnfNDUq1sTJvFPfggoZbYWo3Jk237?=
 =?us-ascii?Q?OJAdKXz+Uy6PVRDrUHGzhCkhJ2SJgG3Vw0S3hAEElLTs20p4rZ5eQcc9jvl9?=
 =?us-ascii?Q?up0gapzgtlJr3p/Q1Ia67aJwoYTtD/hoddaQzoWyYdN38DYd1/LunrGKcBdA?=
 =?us-ascii?Q?c55a/69IGZDUj/i9HVj9uU/Obz7q2xG8XIR4kirGUSBTJRpcMc0wHrEvSfEr?=
 =?us-ascii?Q?L82u8PziCfXlP1m5miLGz2g9rLOwiF/hbWEypkUxi7sc+3DN/sQVdjW+W0NZ?=
 =?us-ascii?Q?aRlkIVLAaIs8MqknJpEg8ko7kAiHuSp3HbLlqgjMBWsldYfDn5E8oHvSPXOV?=
 =?us-ascii?Q?wc9xMpjOndC2LB62swiMzS7T1yASBmr5D4CZvv+g2hDm3pBpIFoOanZSPQdr?=
 =?us-ascii?Q?y+qnMm2FI9nfvwBuOdx8KaYE7jOihBXgGNw+mEkv3BqqM0fd9/yOsnZW0mOU?=
 =?us-ascii?Q?kL6E3ODJ8NEcDkC4JWR+zKUQ14jiU6x28Epknvs5tKabmgqUhq3xgaK+VyCH?=
 =?us-ascii?Q?7j2JFhY0+311JKBLecT75PDKafIwl9Vk3zwSLQZCqHnDxUwP6poa9LUVPHwN?=
 =?us-ascii?Q?hpCigb5eqKs+DWLCpkgWiddog6qaN51rzLe5mq0KZYfKyFjz2h2nn40l/bx8?=
 =?us-ascii?Q?53rR1ZbAmeU45YCNgis7KCd9OUWyjPeTqqVa3oq/RUHdRWAnigelU0C/AL2Z?=
 =?us-ascii?Q?/YFYLKrjzbVy2Fhgl4m22ZI/tapR+RLBneEisPxF7/Wq1lOIrqSX6Fjf7ig8?=
 =?us-ascii?Q?UnicPQ92/11km8TeCq+2gjwNqRzid1uqn3PUlelEf1wnwmLFRLgLGkAD3tTS?=
 =?us-ascii?Q?SfESU6aPZV1+OzNmRQqcWPxyX2DtRvu04wG7N1OuOaJG9q739lk9I9AqoFMF?=
 =?us-ascii?Q?1gKBVrW/ivjveKCBJtT2X0Xf7oWmFuY8VAnMX7RsORqUsEvilMAzqJMjpf7s?=
 =?us-ascii?Q?GAOiY20kEqka4oIAGFfR5fvoHHXgXYcGVQKWHFMWxT3KTxvJEQVVLUbNWVHI?=
 =?us-ascii?Q?zPrI4DCotC5LhXuQIukiZ5M=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8d281d1b-d992-44e9-2b62-08db92f32874
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:55:25.7988
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eD7BwjIHPfRSFGotQqqyXyZt88/P8mX37Bpl0umUe1YDZFR6s5uw8NvZM1DIs7B98OlyZV0n+Ses1CVnOaBjOcI3r5ZX5yyuXhsAdi2Eqy/RW6KI90PSaGprhnh2h4VF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9381
Message-ID-Hash: F5UFI2POQYDE47PF7B6G6BMZTDCOQWRW
X-Message-ID-Hash: F5UFI2POQYDE47PF7B6G6BMZTDCOQWRW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/F5UFI2POQYDE47PF7B6G6BMZTDCOQWRW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge thesse into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/aiu-acodec-ctrl.c   |  4 ++--
 sound/soc/meson/aiu-codec-ctrl.c    |  4 ++--
 sound/soc/meson/aiu-fifo-i2s.c      |  3 +++
 sound/soc/meson/aiu-fifo-spdif.c    |  3 +++
 sound/soc/meson/aiu.c               |  6 ------
 sound/soc/meson/axg-frddr.c         |  4 ++--
 sound/soc/meson/axg-pdm.c           | 18 +++++++++---------
 sound/soc/meson/axg-spdifin.c       |  4 ++--
 sound/soc/meson/axg-tdm-interface.c |  6 ++----
 sound/soc/meson/axg-toddr.c         |  4 ++--
 sound/soc/meson/g12a-toacodec.c     |  4 ++--
 sound/soc/meson/g12a-tohdmitx.c     |  4 ++--
 12 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/sound/soc/meson/aiu-acodec-ctrl.c b/sound/soc/meson/aiu-acodec-ctrl.c
index d0f0ada5f4bc..7b04b97f7b41 100644
--- a/sound/soc/meson/aiu-acodec-ctrl.c
+++ b/sound/soc/meson/aiu-acodec-ctrl.c
@@ -103,6 +103,8 @@ static int aiu_acodec_ctrl_input_hw_params(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops aiu_acodec_ctrl_input_ops = {
+	.probe		= meson_codec_glue_input_dai_probe,
+	.remove		= meson_codec_glue_input_dai_remove,
 	.hw_params	= aiu_acodec_ctrl_input_hw_params,
 	.set_fmt	= meson_codec_glue_input_set_fmt,
 };
@@ -130,8 +132,6 @@ static const struct snd_soc_dai_ops aiu_acodec_ctrl_output_ops = {
 	.name = "ACODEC CTRL " xname,				\
 	.playback = AIU_ACODEC_STREAM(xname, "Playback", 8),	\
 	.ops = &aiu_acodec_ctrl_input_ops,			\
-	.probe = meson_codec_glue_input_dai_probe,		\
-	.remove = meson_codec_glue_input_dai_remove,		\
 }
 
 #define AIU_ACODEC_OUTPUT(xname) {				\
diff --git a/sound/soc/meson/aiu-codec-ctrl.c b/sound/soc/meson/aiu-codec-ctrl.c
index 84c10956c241..ee0ef6301010 100644
--- a/sound/soc/meson/aiu-codec-ctrl.c
+++ b/sound/soc/meson/aiu-codec-ctrl.c
@@ -75,6 +75,8 @@ static const struct snd_soc_dapm_widget aiu_hdmi_ctrl_widgets[] = {
 };
 
 static const struct snd_soc_dai_ops aiu_codec_ctrl_input_ops = {
+	.probe		= meson_codec_glue_input_dai_probe,
+	.remove		= meson_codec_glue_input_dai_remove,
 	.hw_params	= meson_codec_glue_input_hw_params,
 	.set_fmt	= meson_codec_glue_input_set_fmt,
 };
@@ -102,8 +104,6 @@ static const struct snd_soc_dai_ops aiu_codec_ctrl_output_ops = {
 	.name = "CODEC CTRL " xname,				\
 	.playback = AIU_CODEC_CTRL_STREAM(xname, "Playback"),	\
 	.ops = &aiu_codec_ctrl_input_ops,			\
-	.probe = meson_codec_glue_input_dai_probe,		\
-	.remove = meson_codec_glue_input_dai_remove,		\
 }
 
 #define AIU_CODEC_CTRL_OUTPUT(xname) {				\
diff --git a/sound/soc/meson/aiu-fifo-i2s.c b/sound/soc/meson/aiu-fifo-i2s.c
index 59e00a74b5f8..7d833500c799 100644
--- a/sound/soc/meson/aiu-fifo-i2s.c
+++ b/sound/soc/meson/aiu-fifo-i2s.c
@@ -140,6 +140,9 @@ static int aiu_fifo_i2s_hw_params(struct snd_pcm_substream *substream,
 }
 
 const struct snd_soc_dai_ops aiu_fifo_i2s_dai_ops = {
+	.pcm_new	= aiu_fifo_pcm_new,
+	.probe		= aiu_fifo_i2s_dai_probe,
+	.remove		= aiu_fifo_dai_remove,
 	.trigger	= aiu_fifo_i2s_trigger,
 	.prepare	= aiu_fifo_i2s_prepare,
 	.hw_params	= aiu_fifo_i2s_hw_params,
diff --git a/sound/soc/meson/aiu-fifo-spdif.c b/sound/soc/meson/aiu-fifo-spdif.c
index ddbd2fc40185..fa91f3c53fa4 100644
--- a/sound/soc/meson/aiu-fifo-spdif.c
+++ b/sound/soc/meson/aiu-fifo-spdif.c
@@ -155,6 +155,9 @@ static int fifo_spdif_hw_params(struct snd_pcm_substream *substream,
 }
 
 const struct snd_soc_dai_ops aiu_fifo_spdif_dai_ops = {
+	.pcm_new	= aiu_fifo_pcm_new,
+	.probe		= aiu_fifo_spdif_dai_probe,
+	.remove		= aiu_fifo_dai_remove,
 	.trigger	= fifo_spdif_trigger,
 	.prepare	= fifo_spdif_prepare,
 	.hw_params	= fifo_spdif_hw_params,
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index da351a60df0c..7109b81cc3d0 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -121,9 +121,6 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 			.formats	= AIU_FORMATS,
 		},
 		.ops		= &aiu_fifo_i2s_dai_ops,
-		.pcm_new	= aiu_fifo_pcm_new,
-		.probe		= aiu_fifo_i2s_dai_probe,
-		.remove		= aiu_fifo_dai_remove,
 	},
 	[CPU_SPDIF_FIFO] = {
 		.name = "SPDIF FIFO",
@@ -137,9 +134,6 @@ static struct snd_soc_dai_driver aiu_cpu_dai_drv[] = {
 			.formats	= AIU_FORMATS,
 		},
 		.ops		= &aiu_fifo_spdif_dai_ops,
-		.pcm_new	= aiu_fifo_pcm_new,
-		.probe		= aiu_fifo_spdif_dai_probe,
-		.remove		= aiu_fifo_dai_remove,
 	},
 	[CPU_I2S_ENCODER] = {
 		.name = "I2S Encoder",
diff --git a/sound/soc/meson/axg-frddr.c b/sound/soc/meson/axg-frddr.c
index 61f9d417fd60..8c166a5f338c 100644
--- a/sound/soc/meson/axg-frddr.c
+++ b/sound/soc/meson/axg-frddr.c
@@ -100,6 +100,7 @@ static const struct snd_soc_dai_ops axg_frddr_ops = {
 	.hw_params	= axg_frddr_dai_hw_params,
 	.startup	= axg_frddr_dai_startup,
 	.shutdown	= axg_frddr_dai_shutdown,
+	.pcm_new	= axg_frddr_pcm_new,
 };
 
 static struct snd_soc_dai_driver axg_frddr_dai_drv = {
@@ -112,7 +113,6 @@ static struct snd_soc_dai_driver axg_frddr_dai_drv = {
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &axg_frddr_ops,
-	.pcm_new	= axg_frddr_pcm_new,
 };
 
 static const char * const axg_frddr_sel_texts[] = {
@@ -175,6 +175,7 @@ static const struct snd_soc_dai_ops g12a_frddr_ops = {
 	.hw_params	= axg_frddr_dai_hw_params,
 	.startup	= axg_frddr_dai_startup,
 	.shutdown	= axg_frddr_dai_shutdown,
+	.pcm_new	= axg_frddr_pcm_new,
 };
 
 static struct snd_soc_dai_driver g12a_frddr_dai_drv = {
@@ -187,7 +188,6 @@ static struct snd_soc_dai_driver g12a_frddr_dai_drv = {
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &g12a_frddr_ops,
-	.pcm_new	= axg_frddr_pcm_new,
 };
 
 static SOC_ENUM_SINGLE_DECL(g12a_frddr_sel1_enum, FIFO_CTRL0, CTRL0_SEL_SHIFT,
diff --git a/sound/soc/meson/axg-pdm.c b/sound/soc/meson/axg-pdm.c
index ad43cb2a1e3f..d59050914d3c 100644
--- a/sound/soc/meson/axg-pdm.c
+++ b/sound/soc/meson/axg-pdm.c
@@ -294,13 +294,6 @@ static void axg_pdm_shutdown(struct snd_pcm_substream *substream,
 	clk_disable_unprepare(priv->dclk);
 }
 
-static const struct snd_soc_dai_ops axg_pdm_dai_ops = {
-	.trigger	= axg_pdm_trigger,
-	.hw_params	= axg_pdm_hw_params,
-	.startup	= axg_pdm_startup,
-	.shutdown	= axg_pdm_shutdown,
-};
-
 static void axg_pdm_set_hcic_ctrl(struct axg_pdm *priv)
 {
 	const struct axg_pdm_hcic *hcic = &priv->cfg->filters->hcic;
@@ -440,6 +433,15 @@ static int axg_pdm_dai_remove(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops axg_pdm_dai_ops = {
+	.probe		= axg_pdm_dai_probe,
+	.remove		= axg_pdm_dai_remove,
+	.trigger	= axg_pdm_trigger,
+	.hw_params	= axg_pdm_hw_params,
+	.startup	= axg_pdm_startup,
+	.shutdown	= axg_pdm_shutdown,
+};
+
 static struct snd_soc_dai_driver axg_pdm_dai_drv = {
 	.name = "PDM",
 	.capture = {
@@ -453,8 +455,6 @@ static struct snd_soc_dai_driver axg_pdm_dai_drv = {
 				   SNDRV_PCM_FMTBIT_S32_LE),
 	},
 	.ops		= &axg_pdm_dai_ops,
-	.probe		= axg_pdm_dai_probe,
-	.remove		= axg_pdm_dai_remove,
 };
 
 static const struct snd_soc_component_driver axg_pdm_component_drv = {
diff --git a/sound/soc/meson/axg-spdifin.c b/sound/soc/meson/axg-spdifin.c
index e2cc4c4be758..d86880169075 100644
--- a/sound/soc/meson/axg-spdifin.c
+++ b/sound/soc/meson/axg-spdifin.c
@@ -267,6 +267,8 @@ static int axg_spdifin_dai_remove(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops axg_spdifin_ops = {
+	.probe		= axg_spdifin_dai_probe,
+	.remove		= axg_spdifin_dai_remove,
 	.prepare	= axg_spdifin_prepare,
 	.startup	= axg_spdifin_startup,
 	.shutdown	= axg_spdifin_shutdown,
@@ -429,8 +431,6 @@ axg_spdifin_get_dai_drv(struct device *dev, struct axg_spdifin *priv)
 
 	drv->name = "SPDIF Input";
 	drv->ops = &axg_spdifin_ops;
-	drv->probe = axg_spdifin_dai_probe;
-	drv->remove = axg_spdifin_dai_remove;
 	drv->capture.stream_name = "Capture";
 	drv->capture.channels_min = 1;
 	drv->capture.channels_max = 2;
diff --git a/sound/soc/meson/axg-tdm-interface.c b/sound/soc/meson/axg-tdm-interface.c
index 5e5e4c56d505..1c3d433cefd2 100644
--- a/sound/soc/meson/axg-tdm-interface.c
+++ b/sound/soc/meson/axg-tdm-interface.c
@@ -395,6 +395,8 @@ static int axg_tdm_iface_probe_dai(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops axg_tdm_iface_ops = {
+	.probe		= axg_tdm_iface_probe_dai,
+	.remove		= axg_tdm_iface_remove_dai,
 	.set_sysclk	= axg_tdm_iface_set_sysclk,
 	.set_fmt	= axg_tdm_iface_set_fmt,
 	.startup	= axg_tdm_iface_startup,
@@ -423,8 +425,6 @@ static const struct snd_soc_dai_driver axg_tdm_iface_dai_drv[] = {
 		},
 		.id = TDM_IFACE_PAD,
 		.ops = &axg_tdm_iface_ops,
-		.probe = axg_tdm_iface_probe_dai,
-		.remove = axg_tdm_iface_remove_dai,
 	},
 	[TDM_IFACE_LOOPBACK] = {
 		.name = "TDM Loopback",
@@ -437,8 +437,6 @@ static const struct snd_soc_dai_driver axg_tdm_iface_dai_drv[] = {
 		},
 		.id = TDM_IFACE_LOOPBACK,
 		.ops = &axg_tdm_iface_ops,
-		.probe = axg_tdm_iface_probe_dai,
-		.remove = axg_tdm_iface_remove_dai,
 	},
 };
 
diff --git a/sound/soc/meson/axg-toddr.c b/sound/soc/meson/axg-toddr.c
index e9208e74e965..1a0be177b8fe 100644
--- a/sound/soc/meson/axg-toddr.c
+++ b/sound/soc/meson/axg-toddr.c
@@ -122,6 +122,7 @@ static const struct snd_soc_dai_ops axg_toddr_ops = {
 	.hw_params	= axg_toddr_dai_hw_params,
 	.startup	= axg_toddr_dai_startup,
 	.shutdown	= axg_toddr_dai_shutdown,
+	.pcm_new	= axg_toddr_pcm_new,
 };
 
 static struct snd_soc_dai_driver axg_toddr_dai_drv = {
@@ -134,7 +135,6 @@ static struct snd_soc_dai_driver axg_toddr_dai_drv = {
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &axg_toddr_ops,
-	.pcm_new	= axg_toddr_pcm_new,
 };
 
 static const char * const axg_toddr_sel_texts[] = {
@@ -217,6 +217,7 @@ static const struct snd_soc_dai_ops g12a_toddr_ops = {
 	.hw_params	= axg_toddr_dai_hw_params,
 	.startup	= g12a_toddr_dai_startup,
 	.shutdown	= axg_toddr_dai_shutdown,
+	.pcm_new	= axg_toddr_pcm_new,
 };
 
 static struct snd_soc_dai_driver g12a_toddr_dai_drv = {
@@ -229,7 +230,6 @@ static struct snd_soc_dai_driver g12a_toddr_dai_drv = {
 		.formats	= AXG_FIFO_FORMATS,
 	},
 	.ops		= &g12a_toddr_ops,
-	.pcm_new	= axg_toddr_pcm_new,
 };
 
 static const struct snd_soc_component_driver g12a_toddr_component_drv = {
diff --git a/sound/soc/meson/g12a-toacodec.c b/sound/soc/meson/g12a-toacodec.c
index ddc667956cf5..6c4503766fdc 100644
--- a/sound/soc/meson/g12a-toacodec.c
+++ b/sound/soc/meson/g12a-toacodec.c
@@ -162,6 +162,8 @@ static int g12a_toacodec_input_hw_params(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops g12a_toacodec_input_ops = {
+	.probe		= meson_codec_glue_input_dai_probe,
+	.remove		= meson_codec_glue_input_dai_remove,
 	.hw_params	= g12a_toacodec_input_hw_params,
 	.set_fmt	= meson_codec_glue_input_set_fmt,
 };
@@ -185,8 +187,6 @@ static const struct snd_soc_dai_ops g12a_toacodec_output_ops = {
 	.id = (xid),							\
 	.playback = TOACODEC_STREAM(xname, "Playback", 8),		\
 	.ops = &g12a_toacodec_input_ops,				\
-	.probe = meson_codec_glue_input_dai_probe,			\
-	.remove = meson_codec_glue_input_dai_remove,			\
 }
 
 #define TOACODEC_OUTPUT(xname, xid) {					\
diff --git a/sound/soc/meson/g12a-tohdmitx.c b/sound/soc/meson/g12a-tohdmitx.c
index 579a04ad4d19..f7ef9aa1eed8 100644
--- a/sound/soc/meson/g12a-tohdmitx.c
+++ b/sound/soc/meson/g12a-tohdmitx.c
@@ -140,6 +140,8 @@ static const struct snd_soc_dapm_widget g12a_tohdmitx_widgets[] = {
 };
 
 static const struct snd_soc_dai_ops g12a_tohdmitx_input_ops = {
+	.probe		= meson_codec_glue_input_dai_probe,
+	.remove		= meson_codec_glue_input_dai_remove,
 	.hw_params	= meson_codec_glue_input_hw_params,
 	.set_fmt	= meson_codec_glue_input_set_fmt,
 };
@@ -172,8 +174,6 @@ static const struct snd_soc_dai_ops g12a_tohdmitx_output_ops = {
 	.id = (xid),							\
 	.playback = TOHDMITX_STREAM(xname, "Playback", xfmt, xchmax),	\
 	.ops = &g12a_tohdmitx_input_ops,				\
-	.probe = meson_codec_glue_input_dai_probe,			\
-	.remove = meson_codec_glue_input_dai_remove,			\
 }
 
 #define TOHDMITX_OUT(xname, xid, xfmt, xchmax) {			\
-- 
2.25.1

