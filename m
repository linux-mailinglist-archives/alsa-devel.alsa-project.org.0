Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDF26D3AE2
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Apr 2023 01:02:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08663208;
	Mon,  3 Apr 2023 01:01:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08663208
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680476545;
	bh=Euj1QmiQnQ4T5l126Bv/mJffcH0+zjpfik5kYxlHq6k=;
	h=From:Subject:To:In-Reply-To:References:Date:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cOjguE41HLjPZew+UjhmVObvfAcZTDqrJv/Qo9RnSL7AsWKmQXugVHfxYZ6lZvdHp
	 r2rcE+EWKaU4uAvYDr4zZGx9LStU5jjyrCUnROpNN2MQH2WjsZ0+zyB5ZhcDPZQxr1
	 X02Ocmg7b3ToKw/KPVBTELSM3mrCeg0g1qqbMKK8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AA72F80534;
	Mon,  3 Apr 2023 01:00:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 839BDF8052D; Mon,  3 Apr 2023 01:00:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5A00CF80529
	for <alsa-devel@alsa-project.org>; Mon,  3 Apr 2023 01:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5A00CF80529
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WWbAns8C
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEQDtUaOP71/CDqQzKt6Iqb0AwYNGoxpDEqXE5KtYNtDeCkdXDZyLHENNIN2Kc1ooV1CdCkkoG5pMdObDTWh20jEerbAMdmeSE+Syi8+jrKDXt1Nvu4F1Z+MMw+YVI4eS2GO5s41mrBYSiccM3WsXPhOYF4rqxPMQI/gwSaW1COqVU8M1BQibv6f650nFSlKly2DeouuMqf/QL3ooonXoZ5U9TVY4ifaLz3S3/ym1rLtqxJMVUC/MNEyBTEFe+3kQBahgSK7QC+j+oDHj5HsDoI6SkXnBeDRL6+1I++W71vwNMMiDvxQTD9A5FUsaBfCLTE2u19/i0LGZnQh1yap8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OehcGt0dzYxTBr+Zq8wbjNtjWSmtDW5Th4H3k62UeK0=;
 b=KIKvwSrqiMHJD2RayCLJSKOlyyOWf6PU6LGy3bEdvhE60blM+Su8rJ0tFZAH8jV4cjtCAhAMW00v6XESmCinl105ljdoSSi4pSM4usKMBRRiJESxFT8NhwD8mOTbzOzaIM/5yQtf+7UuDg0y3IQxy+4iBjsAo79bH1EWHDlvktOnb1Pvz/1YSKM6y+9GhokODbVrffUyXxfv/hiXin2EgNA/m9lGlsOYM38bJVQHVh7JmNoDxVbtxil/wt2P1heD8WM5Lo7QcQ8Qb6l7ZLBhKIL7GNsmttRKYPjc1HijFoY15WN8/OI0ZDWjWMX4FHVabpitzLchIw0Ips4/kjDJZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OehcGt0dzYxTBr+Zq8wbjNtjWSmtDW5Th4H3k62UeK0=;
 b=WWbAns8C0KDRreNkKakCsvgD1bDGZRWx/jwIrD7LLZuzfUMrCZ0P3llbXZp0yw8zbmIJ8ewi1zKCgl05nRuqWWdMVopEM6BBxUZ17CKDdvvLBlIQarhVMeV0YySgLP+1i/4Uw2oajH7WKEIOM7mhgdo+Z3WDYnJthHjQMOJSqUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OSZPR01MB9395.jpnprd01.prod.outlook.com (2603:1096:604:1d7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Sun, 2 Apr
 2023 22:59:57 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::b005:5b0f:6ad8:3eb1%4]) with mapi id 15.20.6254.033; Sun, 2 Apr 2023
 22:59:57 +0000
Message-ID: <87lej9c2ky.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH resend 3/5] ASoC: meson: switch to use c2c_params instead of
 params
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
References: <87pm8lc2m7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 2 Apr 2023 22:59:57 +0000
X-ClientProxiedBy: TY2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:404:a6::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OSZPR01MB9395:EE_
X-MS-Office365-Filtering-Correlation-Id: 610e1ced-2a96-48fe-834a-08db33cdfb11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VBDR9Sw9Dt52c9nX/Rn1JwGPV7EGfDz16KBBw4cufS+zlgfHyrEcxAxq2wf/Eonjpl9gR5WKEjLjhdOIsURQ+5SHwaqMloVXuat5rKYHt0ZhoQvHSLWgCrnFbQLoKOEYhF2LIY2HlMNff9huAFyGKbD0Fa08hmFmMt/nTEZIU+NrdoXeRfAQCJgcewckpLBySsrYPsxDCYjwBnbD/KNibUfp5lrXtleVQvslIWuMt6VZplvRHmdcxVOb47j0wW53YBov8/3IY4FgbM8TFphoIX+u1tJ/V7RhIycNjU491ddS487N2SXyaphS84XNV8gw/Myrg0MjszwZ4cLO99hXoh3I/8LtRLEgCw2DGBBEOOHODFbg973joBHnTPA+HfTRKgiLxFFFIHa5xpnb0+nxNwy9U4N/5QEiblYViHU9o8LYOPNy26PmgiFSaHhTjXSRSg+PG5Lhlvl5BV/WxIh4PNzQgfFxjBdBlt8imZjMVIy0l0ngFa4Objb4i0U1kt5Wg/jy6CP3WkKNgBeJpODUURumGX7nZk5jeEOmRjSeO35Bpq6PFJ7e4alqHT9hEmZFOtL7MdGQHImMFyi/1CGT4EpvuRb/VKX/37l73SQ8sG+Wgm9LcubjV7NaHqfwzmUi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(366004)(451199021)(478600001)(186003)(6512007)(6506007)(26005)(2616005)(52116002)(6486002)(36756003)(2906002)(83380400001)(86362001)(66556008)(66946007)(66476007)(5660300002)(8936002)(8676002)(38350700002)(41300700001)(38100700002)(4326008)(6916009)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?58hjSiJwYOaOfxVyHrbz9IJqRwQl5pr4Y2l8oOBz0scafJJyZmM44BNvcx1F?=
 =?us-ascii?Q?UkMBa687lyMqU2JHgz14tXb/kQh9nNTmek6SoXLk9sG98fzARmAkoEUzEaAX?=
 =?us-ascii?Q?jYKKDOE8KWR1C1SA70cAgwYSnzoUp8nUMLdzXOfSDSeCz8hx9zD+YfpBWHnU?=
 =?us-ascii?Q?oypgEdnbH/AsAWffGic/6zUFvavqAA6Lj3iAAZiKo52CVFIg9Ona+UANMfTL?=
 =?us-ascii?Q?GS63HAAXonfVTJvxXBSE4nEHLW/JYrzVjAjtxsRkdjSYPetKfRs2hQhWDdaG?=
 =?us-ascii?Q?tHHSp64y55f+vt6tL7GO4iTnnR/DbHNlbhekGYqeo65eN4vzBhPGyVtfZ7RH?=
 =?us-ascii?Q?2opSfshR/n2TcF6atAJbZw1XEM5HBPdfR8Zd0hg7eDYKUSwRE5NM3W8XbZ+/?=
 =?us-ascii?Q?JWSnEEUdDBM54CLjOi/asoo3WYelqYifY/ME0CSlDfPQxAiKQkRtZ7W0LKNq?=
 =?us-ascii?Q?uFwY2hXxt/ckDi7oUWei/TpVMloSvhAxib8IX2zF29X5WA8lU4t96OhCzeWF?=
 =?us-ascii?Q?ACwu119/EE0dP1HAVLXAu+BTGvCIXKcTbKrUWykku4ssu9wfstINvYVOHmVE?=
 =?us-ascii?Q?cpALvx7poX5xFu4zLkpMJsEUNlkh7irgCNCM6DfrpkXTqIE56KIQ7dnAlt+L?=
 =?us-ascii?Q?0qWQG02Di0mijU0I3FbiRK7xszD2qcHGK0B59WEJeCX/ytQzFur76P4UluV9?=
 =?us-ascii?Q?yAk1JN+quSWe7OcN1KLV/NEjXiVxrtCUEr8auyoKCQ/oVzPsuo4hegBg5FUP?=
 =?us-ascii?Q?A4KzU+OvDOUx/+jJLzHS4WzZvAVUa/7dXYOmklmGZd3dWfiSxDNl/vJDOjYN?=
 =?us-ascii?Q?GgM8lO/shjCUI02Hsj1pMNFNwm+ln3aTe90VOCMW8Df4CqLTl28kcFnBCF9o?=
 =?us-ascii?Q?0paAEsw2NEP+cO8C5bWwCcF+z71igIcG4IrQLQqwEZ09hwv6laWbcXKoC9UC?=
 =?us-ascii?Q?aMWoVqB1dSmo2uVbCy+hCNbOWNbhNHEYGUJ7PmtWHjqGfnstQ9ppsZ7T1G+n?=
 =?us-ascii?Q?axBnspKgHpoXZhlSYBpgmVxTvPwtzqo//z3AmHbDLQwGVr3ROH/e5dbfFDWl?=
 =?us-ascii?Q?cC4oqXqeOD+QLcTel+FnUZOqHuzdykDcohMdWakOl+ttB5DAPc0E4kH41tN/?=
 =?us-ascii?Q?m2mQ6yQgLLNp4rLbAZjpwxS6RXVP/qlUVfzZsaRdZqA+eIPDe69q1cQZqbY3?=
 =?us-ascii?Q?YcxEeUBPKYzPSOAFSQbcj0wh5m7b75ISjgppEK7lRzGKrPjfPxw/Mp2PGzf3?=
 =?us-ascii?Q?bzA2v+DHEHY25M2OjiQYokuyyFsatxdKFk++Dwt/+O+iQaBKbt/E2Qpiy/Af?=
 =?us-ascii?Q?mzZmiBkzpLltGVuG4a4qWSgFyOoon4zht9m/FP7Jad4azvOmsBql2VHTxYsA?=
 =?us-ascii?Q?9KX95yQxZ5Kg0CiwrdKItSI5U957YLlzPxu4+w8aMiXpiFRXTcTwS7+tucvF?=
 =?us-ascii?Q?WSCaKZqdNszEEH38nc6K7UP+sSiN1W0Kgt4wNO9Zip2nAtdBZmLYMj4urETD?=
 =?us-ascii?Q?KShnV3jKeqipuw81ZS0rpb600wOETvu9xmmBx+F0RlQxVrm2CouPIEaqQ+Uq?=
 =?us-ascii?Q?RfR2QinrR4FFyyDUaOgbuBWRqJa8uxTPgHGvQlP5y5nmHaFHWPyGizdbnkny?=
 =?us-ascii?Q?a+mh3T/N4eSLO18KJR973rQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 610e1ced-2a96-48fe-834a-08db33cdfb11
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2023 22:59:57.7481
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 S22dIliQgdqaxV28it2mh3q2u5Q4zJ581LdU98yHk/2cUCwXnSAWiVW4ElaePQZrjbCw9qnndMmi6fNumzWGMufL4BThyT84+yvMnyeo1DXJEsyb+MLdxkpowYcJnAL8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9395
Message-ID-Hash: 4N2EAWVVSSYEQLAUHWQDW3N3LJUGGDZS
X-Message-ID-Hash: 4N2EAWVVSSYEQLAUHWQDW3N3LJUGGDZS
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Linux-ALSA <alsa-devel@alsa-project.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4N2EAWVVSSYEQLAUHWQDW3N3LJUGGDZS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>


ASoC is now using c2c_params instead of params. This patch replace it.
num_c2c_params (was num_params) was not mandatory before,
but let's set it by this patch.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/meson/axg-card.c         | 3 ++-
 sound/soc/meson/gx-card.c          | 3 ++-
 sound/soc/meson/meson-codec-glue.c | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 2b77010c2c5c..a25c397c66c5 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -337,7 +337,8 @@ static int axg_card_add_link(struct snd_soc_card *card, struct device_node *np,
 		return ret;
 
 	if (axg_card_cpu_is_codec(dai_link->cpus->of_node)) {
-		dai_link->params = &codec_params;
+		dai_link->c2c_params = &codec_params;
+		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		snd_soc_dai_link_set_capabilities(dai_link);
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 5119434a81c4..58c411d3c489 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -104,7 +104,8 @@ static int gx_card_add_link(struct snd_soc_card *card, struct device_node *np,
 
 	/* Or apply codec to codec params if necessary */
 	if (gx_card_cpu_identify(dai_link->cpus, "CODEC CTRL")) {
-		dai_link->params = &codec_params;
+		dai_link->c2c_params = &codec_params;
+		dai_link->num_c2c_params = 1;
 	} else {
 		dai_link->no_pcm = 1;
 		snd_soc_dai_link_set_capabilities(dai_link);
diff --git a/sound/soc/meson/meson-codec-glue.c b/sound/soc/meson/meson-codec-glue.c
index 5913486c43ab..e702d408ee96 100644
--- a/sound/soc/meson/meson-codec-glue.c
+++ b/sound/soc/meson/meson-codec-glue.c
@@ -105,13 +105,14 @@ int meson_codec_glue_output_startup(struct snd_pcm_substream *substream,
 	if (!in_data)
 		return -ENODEV;
 
-	if (WARN_ON(!rtd->dai_link->params)) {
+	if (WARN_ON(!rtd->dai_link->c2c_params)) {
 		dev_warn(dai->dev, "codec2codec link expected\n");
 		return -EINVAL;
 	}
 
 	/* Replace link params with the input params */
-	rtd->dai_link->params = &in_data->params;
+	rtd->dai_link->c2c_params = &in_data->params;
+	rtd->dai_link->num_c2c_params = 1;
 
 	return snd_soc_runtime_set_dai_fmt(rtd, in_data->fmt);
 }
-- 
2.25.1

