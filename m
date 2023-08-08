Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C6E774EF7
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:06:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3716E80;
	Wed,  9 Aug 2023 01:05:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3716E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535997;
	bh=GiYai0OBQKCpXbnkQSbrNHCnnp2/t1Qa21mkJBiYSzE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qSAjty1Z7MdFTca+w43tMEbScvfqvpdy0hfkd7RTznTZ3lEojl7+NuDtgDgcpbxFn
	 dtsZfGiynbtcEKjXbx7YucPYxbfTwjk65SUwq0+Z2Sw+mmsyDMQecH9cnJ+HKzNTrA
	 HTvFwjxl3lLZFaUX+f4LidYJewdZ5kcrifbIpv1o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8851AF806D2; Wed,  9 Aug 2023 00:59:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18061F80549;
	Wed,  9 Aug 2023 00:59:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A9D8F806C2; Wed,  9 Aug 2023 00:59:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20715.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::715])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 270B1F80580
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:59:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 270B1F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=FJ7OHhZS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DCtnrjri3DdF/c28uNVDSrPJV3IsiHJa7F1ruZJ26tJDFblBVJLAiEYIN+jrwUEjseRtUgg4IuBkf/FipCZ0NJl/9z28aYzMzE6pblAcHSUKxlKokzSXvfTbS5jdyZ3Tfq1fqrHrEm7Ik3XXGcmQwjbYBsbiFZGqHvaqBcpM8slIevsZwcqLug8u5V4OqI3cc3O8s7eDEqCV8s6m+Vbv1PTVgWeLIQYjd4QyzW02GxfQrC8XTL3/rzBgZXYV0mlKCJro1IS9k/6D7ROP2PgDkYv0shdQPOJqMPPdsA2TakS5D8FoSJsRdTfpG8li8i5PT+aEBLag1Q0wz4U3MPcbJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnUKKTHXzU45kPAwhdoLL6cAq3jlhEdI7WHg/vFZsvU=;
 b=jmkv23UvPW7jJoxr5FPi9uIRXvO56QN7uDmpQF3rM6ezJKloS1G//LD8+I8/qZK31xzus2Ksdg4JrgLJIRCGzFwDVxjHLycoFCl1zMPJmeo9/72017xRvDvPDmeVF9W7B7LAI+GesuIGAW2WCUAfqUWSurc9Wmuhc1TUWS4lTMf+BPvL6BAZyr6UzQO2Wjev8rW74yhyIj5Bni8QvHYXJDiJ+omy2djGjMbAtHFN+XqhAM4+3Gv5iMz+xnLNTqzNMCFqzaxMNOYP/V278rrs2UD/GaR5bPNFmUSTc3kFIC2205D309ASU0Ra0qVDYfQyrJsQjKM8Dwz+nqObFNRBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnUKKTHXzU45kPAwhdoLL6cAq3jlhEdI7WHg/vFZsvU=;
 b=FJ7OHhZSkRloi+lfS0U7Wm64ioTcpY8u5b1sSCP94MZe+b+JCO5qb/op6Qpak9Q0sirjUKOWws7wj9FAlijORNdEKAqe4qrwjiqpV2Pv+i73P5qdfrG5s+B9wFPEi/jXJ2RDdH6P9Q82kgv13674Yh4i5dvco27+4h+fEA7hABg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8414.jpnprd01.prod.outlook.com (2603:1096:604:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:58:58 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:58:58 +0000
Message-ID: <87edkd9m4t.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 38/39] ASoC: codecs/hdmi-codec: merge DAI call back
 functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:58:58 +0000
X-ClientProxiedBy: TY2PR06CA0045.apcprd06.prod.outlook.com
 (2603:1096:404:2e::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 950e8b43-ac05-422a-216e-08db98630ccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	md27ffKIPPNRluH4pM1Q5sIJRgTVKiM7AMFQSwEyXCKp8YG5M30GRRXu5pjL95M29++3qH/YELwChpQKERk+2A0CcV8mMHJB1SxC0aimxY+lys7SCpGrzY94yWSmXSBq4LqFR8hYzfuHf5OFG2BDE4gs/q/mpw+aGNdkZZu9fBiKZk+Iiq44Mo2nXwSEIDzfx/6tmtdA0ObeuCPEX1frR0SvZe/BJ8y3L/GzQq48suiV37G/8Cl0WSBCzP3r7u4cmWxlNVrTgnP5+zP5Q0MsonQCjsYo/Uy/a/nfzfF+4iz6vZURN46Rt2QbO9c8jsFE1h6nT+F33ChA5P3nj2w6hodHvxYt+/kZ1he2tX52xc+Sc4hKYkfUczAo8Kf8+r356B0jFZIhzRPO5xirzRRcxpypxByXxxYwF2aFLOV+nByJPOIq+20uwSWPCQL6NutzbdAXuNQpy3ntLXckBZqrbMOXcKqqzz7WMxB8rfHZww7aRDMf7/gLgc3OnpfBxwTPiMb2zlqtSq1r8GBqZVOCJEEf1/pKj5ofRGzrfIrdrukh8MUHfhXkKE1JcrPVQBzjQJbIEfBeuopvHOVbrHCCq/2Z78VvEgXmipW/vj5JKSZAowYjnENkU/j0ZH4zNXmJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(1800799006)(451199021)(186006)(5660300002)(38350700002)(8676002)(8936002)(38100700002)(2906002)(86362001)(52116002)(6512007)(6486002)(2616005)(110136005)(83380400001)(478600001)(66556008)(6506007)(26005)(4326008)(41300700001)(36756003)(316002)(66476007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?J6awiLFo5S9QW8KIt5koMDLKsql98cRlwh2rbLkcHzZR71ZJhyL7Bo4EsvKX?=
 =?us-ascii?Q?kzgHV8cP/jQbsKvufd5fYYxfB6FVspf3GLuGrEk+ADve3z0NuAKbSWbRY9d/?=
 =?us-ascii?Q?GktF2+FlJp7irL5Ef4l0SZMdVFRLQJoT0qr5k8kIT1M2FEnOYyDNlhxGTgt3?=
 =?us-ascii?Q?reNAXTeU0flz/9T3eIWTA/jMJKmTWwtwtyt26lB4H37kVgs5svi84TPibWis?=
 =?us-ascii?Q?jDQ0Z+/nIFjfe94555N8FGn65bjAMuBrNDDN15vciYI5pE7aa/h5zIzLFeBu?=
 =?us-ascii?Q?CBwtASPyWsx60jdHPL1aTlpTzpe8n/55uupLurpAQEvu3XoZwSFQZrSASHx2?=
 =?us-ascii?Q?3N35CEv2S+1joSCXV3gLKltJfTpZLF6HKqMrgLcWQPnvV+XywNCXQQb/vChW?=
 =?us-ascii?Q?Jr8WbiiQ8mb9RRRXNnBfwryGfi7nZVluM6Mfaow2C6OovoSQFs25xRYXjVAR?=
 =?us-ascii?Q?pefkg8wP3cAPtQ8/ebB5NJQjvPsNFTKZnaa5yemC9IcQHrbwrpq9xSvcRjPd?=
 =?us-ascii?Q?3y/YwykewTgPWLMcAx9UQQqJeGdeEkypTHH3h7XbYdmDL69qUcF33zkSONWh?=
 =?us-ascii?Q?MQbOOU81CxvEm460HREG5A34xtBtGdGTVKUL+IUmxRMBi5qLqg0mRFEvE1vM?=
 =?us-ascii?Q?rP9te9tWLigAyp8jV3FsXQOw2Mbu9gRVuRiPPGWazZwN9tRAUPs9Hdjz5Nl1?=
 =?us-ascii?Q?tJdRifzq9D/mD4ibgaVv9Nsd/lMbf3hZEQFm2uxmTYrg0h0axpXjhCULrqlc?=
 =?us-ascii?Q?cYd12A6h7pCc6JC3S0F4bJLApfFi0bTyH9zzRLA8TptmT8+PyRm80aVTSZeF?=
 =?us-ascii?Q?KxMqO5J1rjbUvAdJdt6InnjYpKdgCaGF3T532FTIgKlTqcqdk6TcPWVObSMO?=
 =?us-ascii?Q?m3cQmMTFcpWRcn+u0OxTwyejX0YXVX8VuajxvGSxjV8qYbSd5dg796ACRYNh?=
 =?us-ascii?Q?kZtS4Q0jpcz8pj3ucFhZ424BkWkHxM5H/yIgbunb4jZBpOzzl/b0WEnEhTHI?=
 =?us-ascii?Q?X4cZRT2SqWybVkmCXU9gt+amura+MnzzeuvDooakwz6KrQF2IycM9Q+UtLnH?=
 =?us-ascii?Q?1GLJfdlSoTaDCBt1QAc9kajR0c6/f0zWYMEaVLqz1DMeND73zrdPWYgp7VSM?=
 =?us-ascii?Q?QQmruxCsQtTD4hnmcEzOWgbjZSUqEmDWBhI0so9Hg/pqh9AVGVpicx6H4m3x?=
 =?us-ascii?Q?xDcgN1GtAUCjvK7MrOIbCnFKeRS00MXS1Ts0Ua/1yiiIA9KuxjyWVH/GwDk2?=
 =?us-ascii?Q?5T2ZalJEL+KChDOsLe530PM/lvXhcJLiAxXXWh+T7xsurIt1323RKUDh9EkM?=
 =?us-ascii?Q?3Q8JSboJ+NlK+5tJ5bGf96t70zL121d8DnEjRyiH2d6J5VcaRCW4dQLhUVjy?=
 =?us-ascii?Q?7DPlFM4PkEg865q2TUinShWwKuS6dm14I4Jvdno7u9A79LzZZz7wthY9D0nv?=
 =?us-ascii?Q?nm9N+Yx256jkC4wLetRsfwMUWVt42XNYHRKGJTUj9LGTiwEyXCXU0EL49O6c?=
 =?us-ascii?Q?56kAdjkMmtkG18rQDSQEGe07w5X9g6vJlGwuXcu0cMBnlc2X1F8F5v4g75oq?=
 =?us-ascii?Q?CajSckDKgW65iGm7roKrYVPDECkblM/y9mTwKz5MA9HaldEYGea9I+vqwFr/?=
 =?us-ascii?Q?e3iWKQicTakigp8D0BVWluA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 950e8b43-ac05-422a-216e-08db98630ccd
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:58:58.7863
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Wd1WCIW3+/LSpN1TepBCNwyEyrZSz9urKCqjlyF44XYtLtNKrTVCndfa2HVNWpwv7xTzTxmjDDqRYIAKfatF3CR1eBlhDLQBMhu1zrI2wXghwGBzApdeNBlzMSOm7Bmn
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8414
Message-ID-Hash: 3STQVAXOWZLIW635J5CSIVQD2XJY24RB
X-Message-ID-Hash: 3STQVAXOWZLIW635J5CSIVQD2XJY24RB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3STQVAXOWZLIW635J5CSIVQD2XJY24RB/>
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
 sound/soc/codecs/hdmi-codec.c | 44 +++++++++++++++++------------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/hdmi-codec.c b/sound/soc/codecs/hdmi-codec.c
index d21f69f05342..13689e718d36 100644
--- a/sound/soc/codecs/hdmi-codec.c
+++ b/sound/soc/codecs/hdmi-codec.c
@@ -723,24 +723,6 @@ static u64 hdmi_codec_formats =
 	SND_SOC_POSSIBLE_DAIFMT_LEFT_J	|
 	SND_SOC_POSSIBLE_DAIFMT_AC97;
 
-static const struct snd_soc_dai_ops hdmi_codec_i2s_dai_ops = {
-	.startup	= hdmi_codec_startup,
-	.shutdown	= hdmi_codec_shutdown,
-	.hw_params	= hdmi_codec_hw_params,
-	.prepare	= hdmi_codec_prepare,
-	.set_fmt	= hdmi_codec_i2s_set_fmt,
-	.mute_stream	= hdmi_codec_mute,
-	.auto_selectable_formats	= &hdmi_codec_formats,
-	.num_auto_selectable_formats	= 1,
-};
-
-static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
-	.startup	= hdmi_codec_startup,
-	.shutdown	= hdmi_codec_shutdown,
-	.hw_params	= hdmi_codec_hw_params,
-	.mute_stream	= hdmi_codec_mute,
-};
-
 #define HDMI_RATES	(SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |\
 			 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |\
 			 SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_176400 |\
@@ -921,10 +903,31 @@ static int hdmi_dai_spdif_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops hdmi_codec_i2s_dai_ops = {
+	.probe				= hdmi_dai_probe,
+	.startup			= hdmi_codec_startup,
+	.shutdown			= hdmi_codec_shutdown,
+	.hw_params			= hdmi_codec_hw_params,
+	.prepare			= hdmi_codec_prepare,
+	.set_fmt			= hdmi_codec_i2s_set_fmt,
+	.mute_stream			= hdmi_codec_mute,
+	.pcm_new			= hdmi_codec_pcm_new,
+	.auto_selectable_formats	= &hdmi_codec_formats,
+	.num_auto_selectable_formats	= 1,
+};
+
+static const struct snd_soc_dai_ops hdmi_codec_spdif_dai_ops = {
+	.probe		= hdmi_dai_spdif_probe,
+	.startup	= hdmi_codec_startup,
+	.shutdown	= hdmi_codec_shutdown,
+	.hw_params	= hdmi_codec_hw_params,
+	.mute_stream	= hdmi_codec_mute,
+	.pcm_new	= hdmi_codec_pcm_new,
+};
+
 static const struct snd_soc_dai_driver hdmi_i2s_dai = {
 	.name = "i2s-hifi",
 	.id = DAI_ID_I2S,
-	.probe = hdmi_dai_probe,
 	.playback = {
 		.stream_name = "I2S Playback",
 		.channels_min = 2,
@@ -942,13 +945,11 @@ static const struct snd_soc_dai_driver hdmi_i2s_dai = {
 		.sig_bits = 24,
 	},
 	.ops = &hdmi_codec_i2s_dai_ops,
-	.pcm_new = hdmi_codec_pcm_new,
 };
 
 static const struct snd_soc_dai_driver hdmi_spdif_dai = {
 	.name = "spdif-hifi",
 	.id = DAI_ID_SPDIF,
-	.probe = hdmi_dai_spdif_probe,
 	.playback = {
 		.stream_name = "SPDIF Playback",
 		.channels_min = 2,
@@ -964,7 +965,6 @@ static const struct snd_soc_dai_driver hdmi_spdif_dai = {
 		.formats = SPDIF_FORMATS,
 	},
 	.ops = &hdmi_codec_spdif_dai_ops,
-	.pcm_new = hdmi_codec_pcm_new,
 };
 
 static int hdmi_of_xlate_dai_id(struct snd_soc_component *component,
-- 
2.25.1

