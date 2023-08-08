Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4BDE774EE3
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:02:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4F174E89;
	Wed,  9 Aug 2023 01:01:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4F174E89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535749;
	bh=JDIMT8mpdIsj5OTO6awkWMN47ZjwBkh2olQvCeiN+UQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=BoAgMW0bCrf9IpPqg1qS+n4zNEOqkLHOzcHMWkWFFJBK5frDBgvO8yxpdIKxa0LZl
	 ah7B5nahqzqIZs4fc1yvMYhzeLjgEoY2SBnf4xoTnLV+kwAoj7m3/EtwxPPBRuNmo6
	 /oKmOtGK+Xyao8qHfZLIdaAvn6xnp0R0Lx/06KRM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1CBA3F80675; Wed,  9 Aug 2023 00:57:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C12EF8055B;
	Wed,  9 Aug 2023 00:57:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F1858F805C9; Wed,  9 Aug 2023 00:57:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::708])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5C3FEF8055B
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:57:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5C3FEF8055B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Kwyd4LjE
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ih1Tz+2DkDBOy+OIt5Yak8OWuHR0XoISP5qP3r9UmtyPxzsokjQ59BSnop53cDb1CyDF3frsMjprHdJu87xfIILcSvS/aEbHwc2j7BPnM1djLKe8zPIIq5VqSxj+yMgiitczebXCgXoAljQwmYoyy6DAz3mddBunZAOwuBHpKp7vrXfM0H0kLhc6VVpxGb3d1ncrClM1wM41hFwo2nAIRbFS096Dj4sUsCqcaOJoVVdDRHnvV37+IohWWTZpB5U1Iy1z3FW4nechVg1BdNN5XPUQQK+Y5byeeBPBIQNDTLxIToBD5tuaDG3mPGd0ILbNw4vKY3/VVXBiCSDe2CGk3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nfh/GNuCIbo+K+TB6AKmwAfvtjtzgFjclGajRGMTVxw=;
 b=Ep4M+NyQi1MStYPct9GXaipARmdIyxDVufjwqP+OmPAkkDWZgeHl9v56fUbLXux0S1DyWuLfYmjSyWRsWUUqJ27Le/WCE879nHC+ZPG6i0GIRluXxDzbspG0KkiFpC4EdL9jFhUeLCmWNKM8qjlzmxHMHvczYJbV2DB47+H1Ruy7kY4I15bvUwirfD020a3JV3Tm0v4H0A1dzERDvB6zxFVESUYczkT5ISIzY4NV2wlLXSTwNADznD3H78cOYhOVJq2TppmTyt/9q4BbSTgCcgA9jaBnB33pDmqxhhDw2PhspFoonP93lsvUDzJS9Uu7n0TeeAg4R/aQ+3TT2aimOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nfh/GNuCIbo+K+TB6AKmwAfvtjtzgFjclGajRGMTVxw=;
 b=Kwyd4LjEfS6+8nMaCQ0E9PXinmiboWwWYWfCnBGBqsGOriorCF17AH2C3V/JD1PF4+UO9k2jc1PFb2JFBXXqbWDcEpYuUcabJ81yTAP8DHx+h9oFl92URJ7bhSjo0p3GW5Q7HxzA+wEdacjrd9i9LChZ2WziP/+HdJiN9uwlwew=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11379.jpnprd01.prod.outlook.com (2603:1096:400:3f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:57:19 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:57:18 +0000
Message-ID: <87zg319m7m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Jaroslav Kysela <perex@perex.cz>, Jerome
 Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Takashi Iwai <tiwai@suse.com>
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH v2 23/39] ASoC: meson: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:57:18 +0000
X-ClientProxiedBy: TYCP301CA0051.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: 7abd862e-1201-44a3-05fb-08db9862d122
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9YZnKfZr0dFXlBS8PEMvjm6eOFHXT6mFjMQx/qetGKY/u98fgG9jhnVp6Ym8D6Y8em+Ax/sVIvaffhXHlh4YTUObBL0uSYrETq9aLgXtBYlzr8Zsu59JJknMrv2Ap5YOdA8CKP8Qvm0cJU1FZ1HJcN3ayG98QaVRPSl6PkUz5750hvY6mMZB/9HQwGhXGqvTcd3/wHTsYYSLiNMld/oBWxPRKBE7fthp9TDU9HUlwJvtelOKfXXyqYkYZWsCnahbh1nWnCrotESGJrEym0pmXtjjBeyYyKlHZwM3tRrd7scEvvx7f6mBR/PG0Dvjt5rFYWf3H1ifRHLA9VLqKYKyV8v0yAiiGdsY/u9aAP5e8Eu8hJZEHAjlZQAMf7hhz1/NB7kHhUYx+CslhTTbws9ClzVVAXgu43uzSxPAzjxa5c+iQTI62A0yNTyGgejqYEJzTxFtNEj5H+TDxdRjfgt+0xq0Qb7p67xywtFwMy8YNtU86AL0YDZL62SmtV4SNIvwp1+YZN3z0eC+dhZG0M4UYXNZMCDbAOx2BcDvKrwVJsk+isUza2bmhJAiA6C7FNyQWahsfgrRsFXiIXhP6wlEFNyTGcMuqAYv7vWqpiI9Q5Xde6T6K1wCMGP4Rgxtp7mt
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(1800799006)(186006)(5660300002)(8676002)(8936002)(7416002)(38100700002)(38350700002)(30864003)(2906002)(86362001)(2616005)(52116002)(6486002)(110136005)(83380400001)(478600001)(6506007)(26005)(6512007)(36756003)(4326008)(41300700001)(316002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DnS440/BikAm0cX8jbZR4wLMPhjGL0puDTBEH9YXkHBwX3IQESn8x3mJpWnL?=
 =?us-ascii?Q?+swVG/UMiQYc0E2AL4Sbtl3MKNuMc1WZlfbVwfeDQZ7IUUSU7asiNpANnMvd?=
 =?us-ascii?Q?b5MwzfiT7WRZ7yG1s/YE4aLSeF6HP8Lza3qgiwJTtKo0wV5GaGP4FIrcykUE?=
 =?us-ascii?Q?kn98fUleLc3JND08yKx1xEo/aPNkYt2lSf8vXFg/0Mo6HE9B1nKfi19cWHvK?=
 =?us-ascii?Q?do28nF4+xT5zomxMCCD6MyLSEs9pNEQ3A/hGMI75NWuica75Acm0mAFa0trS?=
 =?us-ascii?Q?OqyKqIKLSpJsK+znaUvz5/8Qfgp7zTHM4CzQBSQPIEjxvV2zaJGN6A+w9lnt?=
 =?us-ascii?Q?OhgO/63Q90hxv6OAZvX5CpHaqFOR4MkhFs/6uADnI5+O93/fH8AhYjXphEVU?=
 =?us-ascii?Q?Y81PVbopRL+Gk/5XVUMBsVEkok3YzQwYEvwLKhpTveOnothU/MgxNWgGJm0B?=
 =?us-ascii?Q?jwrnnY91i9WRIdmykxkBHYkc5PHhXVJobxLinzYTU+Z7uLRNS8hUBObya85f?=
 =?us-ascii?Q?rhtYoSStBpnbSDuQ8fEBP08KQX0bfOKCRX7j3eeM/qZFQ5AZeq8ft51SVzhd?=
 =?us-ascii?Q?N9N+U3JphcVi6XzsIjJ2taWvaldUXR5NOyOBea9UDfhG2g+SjQfH10+PtVAk?=
 =?us-ascii?Q?Z0jqBPuzG+05wyRKrixCi99ZpcLZS+qkC6XaMqgrmQeKbGdVKoWCHrknQZmZ?=
 =?us-ascii?Q?XVF1/RtV2fzZGiz5cHHOafcWNw8vDfEpx8z5utn929VbVJ6XosdXO5iT9EPV?=
 =?us-ascii?Q?i1QicMGm/0ScSnjJXCSeUo2MrHaeVBmfbIY/Ilb3dxblcTRPH6Ymvosi3G0q?=
 =?us-ascii?Q?VdJBuq2CgiisgQZ1VEqp9NzJwu+hcV3xzb3CqsyvWGnmx9GaBrrq732bCE0V?=
 =?us-ascii?Q?FbTOLrkewvA5W/sXhrG00NoiQfhA2+FW7lOZfmoeyx9h1GV5RX7vmvjIQFu4?=
 =?us-ascii?Q?+9/NNR5goDqIr+Qi8PHSj8TUjOlcwSuh3+iIN3QQeuyuOGxl+H1duwXSH+f0?=
 =?us-ascii?Q?qGoYa0b7hyScMLmZl9DDhsRmXoTwS/yfbbi8nQHNV7Vp5VB066CGm7JhcVTy?=
 =?us-ascii?Q?KuKYphR4hwc3C9ikeNwQ8VPletvdqY7x0MMQnvAfbtiV0rB54fdEPflUHdmu?=
 =?us-ascii?Q?xEgDkSkjMaWds62LTFzP+CFoin+UdotCVNyoS84Z8AVgjLjp8n2N+gdn0W3v?=
 =?us-ascii?Q?b2CAzYZ2S1eCsrwwPrDex9CCMYRpib+c39DSTepnurLqsMrVKeWPrga9nu+t?=
 =?us-ascii?Q?4xbn8AuRupov6ltRtf+flqU25pNj+uryuy8tzHVGYY/cJH7rL1TckonghkwN?=
 =?us-ascii?Q?8tAUSz3MhBGilDu1yFJleXlfCL3DCNa3NAtUJ+ZMCroqRXO/DGL88M07mhNF?=
 =?us-ascii?Q?ewuE+gPeQ/fpHbsKKGADKAF1kyfjp0TG4h6LJlsZ3C2haQH0qRpNzVJd3Cn1?=
 =?us-ascii?Q?mkSyBszD5kjixFLyr/HiG6TyluWBuMN+J1saSJtuaNYlxKlXhfsI/We4a2I8?=
 =?us-ascii?Q?TfD7MAfJnRBdvgiRr6BDOJOvq63Cpck9ApDNZhQ+MGycmMnF0Pl29SERDUfP?=
 =?us-ascii?Q?0UZ3QqYJ6CM8d4vFjx74gadkUm7Xp30LTFQ3ACu7WVm6s6rcjCtnRWuiwRnk?=
 =?us-ascii?Q?d5756SDuqDbjXqFvsgGtcjA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7abd862e-1201-44a3-05fb-08db9862d122
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:57:18.9126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FBoaxxGQL/qHecF07pds68VIWd1HLR2gWR1MritBsWT1udvnZzy3hJzPq15tuqxyku2Tso/ZhnUdYOqEWLSTgcMcu8iS1T68FldRfFoJ0pUW/y7EhAnr/qAtasK8vIhE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11379
Message-ID-Hash: 3FI2PSVVTJREQXS65FBXMTYNLFSPLAE4
X-Message-ID-Hash: 3FI2PSVVTJREQXS65FBXMTYNLFSPLAE4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/3FI2PSVVTJREQXS65FBXMTYNLFSPLAE4/>
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

