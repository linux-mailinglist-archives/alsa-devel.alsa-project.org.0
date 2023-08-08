Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5A5774ED3
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:00:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CDB0B83B;
	Wed,  9 Aug 2023 00:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CDB0B83B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535611;
	bh=OBFvmaxQ35Gg20pWMM7MwkB4u9lnyIGbRmIi8vVFiXc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NdllLzHkh394d0XB+P0REjK05XNCLZe+8dljFy5f8YUNqkc5A/c8z4DWNzSgNv4rb
	 fXpLfUPSdUGl4xnhpKHq2IxQplSKjfuLrxulSQtWVqj8WkP2S7nO8oTexMPXg3+Ynp
	 AxCyj2yb5n3w7znvO4WroKqGCJa/oiHhyUkdRTFo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71920F80612; Wed,  9 Aug 2023 00:56:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3CE99F80567;
	Wed,  9 Aug 2023 00:56:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F14A9F8060F; Wed,  9 Aug 2023 00:56:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20708.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::708])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7AFCFF8055C
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:56:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AFCFF8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=fr6sMmT5
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXekYwptVDJpXWbpnYevYbdKeSl//npmTEmq+srZU63J8+Zl0TC3Yq5TRHpLRP71eEj/KLLA/BnxHE5AM2RuGp+eIvPKy3COEHdNvCzPcT62Wib1d5xLvl5NLt85/KYOMjL+WsIN7tw0QlW4ly9GDHvYSMaws26MruFBS6WdxRGVB/UQsayj/u7n8xjjXE+dSr/z8t0kTE8I18xCI8L2cog/FG5knlPsZ0Ho9EivK6L9D3YomTb4wotBQA2X6Ff7ir8/IwLSY4Rk7Xyp/Mdzfgpa8HevrNAMX9wMQxa+z+kiEdSeQMiWFj1xgHvhil0wvNcSEuoI8R1R2xj4YulI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ieuxMFBLhzUNhsmRrH+Lwo9yfzYn+M/8jTds/dFEPu0=;
 b=Fht3X+nBBtu02gWZKaLAbmc2kPnWRHhLtxU6DTUWHiOYt2MXI45AhFfXeEZSliPv26ctAqjskIG1uVkj+kpd3Zf8wpYhDqcVnmUUc7PDwDpfSyvaL2OPyasR8avNfgDKMkHGZyJKyM7ww0icEd3GXICL6n2ZljqAW6d7q5GuUNJiyiAY+FXaaVv8O4iqvwHXQj1R/2G5sjK4cmuGTJSDdTYZ5VkzjL0Oi3V7ewlyB3lJhky/O49z5u5vEDg0XXG8bGhILjWRUnkvD01S4VeEgGTXqu7QSLZs1N8G/U7+SQb/1fzB9XsJoGqcy4ZML/L3fH0ic181+mpJy4yEygrcRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ieuxMFBLhzUNhsmRrH+Lwo9yfzYn+M/8jTds/dFEPu0=;
 b=fr6sMmT5b9EE0c6pW/k+Dz5Yh/pD/g+keHsNBzRXhtcTQobwQVbHCrlfPLU0OtZvzJb5nrWbmtcKwuf++hJuB2SDj9D742GW8+6KAF0vptuMlBldNscAadjVNyqy0pnGfPTh7J8VirGGzfQ79dvGTZ4c5GG9agy5r23r2XvHip0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TY3PR01MB11969.jpnprd01.prod.outlook.com (2603:1096:400:40b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:56:28 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:56:28 +0000
Message-ID: <87bkfhb0tg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 15/39] ASoC: rsnd: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:56:28 +0000
X-ClientProxiedBy: TYAPR01CA0005.jpnprd01.prod.outlook.com (2603:1096:404::17)
 To OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TY3PR01MB11969:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce9fae9-9c8b-49d7-0406-08db9862b337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	MvouK71yTNnXtcJjzgMEd4MoqGsl8Yh5ehFWUEwBD8EgLoPGxH9/OdZE7ihky99uqQOrFM6bI/rgG4mHfkdaq9aa0liXj3T/vIiKlVJg6L5c4/TURpKfrnzTYTgkbw2kr7X0ry8nIKmDynzOO3Bmci+ijilS3WvDy/g63aqyIYPXzHu1lSKxpyP79M0g0VoBgvQPPebRBh7pnQXEPf4+eQebYqOVpYFXNcFy1Rj7HOUjU655nbQbOyvmv4u8v48ooTA9XlMA5G07K19ifC8+E1uQa4HUcF9lNkWrPZ4V738ddPeW3R6+T751A4kaeKxBfEAg6XoZN+lBKZo9fZtWu+s/bV3/OWCaiZyMBnWnY2wCcPm1njBh5/N8WpvTjFkrzClUqDZb7QNGxuwa04Q7venTQhnNnVaclqxXUxE7NDy30FrGY7nWtVrFyin5wrlSWg6kfRtdTAnBnWfqCM4kl2hoWd0vYA6Priua0RGOMcyyxFwLYLOG7INoYIEcOmCJaUnrnBadQR1XQx+JtBh9ZPZh4gq/22wKbPGTrtpBswkEaQXHULkmaVWZ7nUnEehYzwb1xf1X4r6aBlD4McqCuSAop0eak+ixdJV26eWI80ypDmsA/yq/hqeGmr4n4Whb
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(39860400002)(136003)(451199021)(186006)(1800799006)(2906002)(83380400001)(316002)(2616005)(41300700001)(86362001)(5660300002)(26005)(6506007)(8936002)(8676002)(110136005)(6512007)(52116002)(6486002)(66946007)(66476007)(66556008)(38100700002)(36756003)(38350700002)(478600001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dqv6gYP/CQVGe6GQ7v8Wl1KRY12s89Ai291jryKvRbOl+g5Ep9h5RzOQYoi6?=
 =?us-ascii?Q?M/fsDLezuvAGAJ2hBotET2mIE7NpyscjgZti9hy1uxA3fNNBE6BwzLAkyRMP?=
 =?us-ascii?Q?my3kA7OLg/lucZEklT9fP295zxERfQLNNYIDDifIJ9rxESlaVYB0NkuoDfSc?=
 =?us-ascii?Q?/sXgX2PPqp557mxHQdNLv9w646c5nqHzg0CA26aDztuImfc/khxWDSqyl0GC?=
 =?us-ascii?Q?2BrnOtnP6hMQ1rGfsBdX9ECxbFxtr4Lim+WjmTzkDyyye9YtHqduoOlshyVJ?=
 =?us-ascii?Q?2u+MbCQ95R4MwgV1LzI6MXrb3T02ZM+jiTvwDdPE0FtJ2eEpZL5TzGsTIsPj?=
 =?us-ascii?Q?RO5HjV8uSsjdc6KgcD2aewBY4SPfcLrl8HRVMhWB9BXnzCyvPYGya+PZAvnK?=
 =?us-ascii?Q?Yhm2ZsmDaZGDU8nD2SW1PzjaIU6vc+URRKNSBNNVmB1aKSp9USv0t938lv8d?=
 =?us-ascii?Q?jDeqBgWefmAOwJO7cUWTJ2sI+v0QSkQdjlTk2MnrBHKsxSKceCSiqc9UxniX?=
 =?us-ascii?Q?2f81HHvOS+m1sMDp8qVCjnzGt6F28zockAr0++8FncOWCkerKvil7nrtL3Wu?=
 =?us-ascii?Q?HomNEHjcuTLnXxzIadBkkICi2O80c94VcqntoqQFsMp33/1CKGPS2CfTQJwD?=
 =?us-ascii?Q?dVLnf0KDfIhRSH2kLx05IFe4m4Ol3CCypYLhgENaqXMKmyIN6NefS8JJx38x?=
 =?us-ascii?Q?XRj8RzUaYRa3PNihaPDkx7uo4suHxrbYudkQOGkUtj52GeKGou+SZp0KeYXz?=
 =?us-ascii?Q?J32TAImKrbhPo29rvziKlKMNwJ/sSCcCcWEGwWyKjPVyLA+aX0W4A0H4m8Kt?=
 =?us-ascii?Q?XfBcHMroFjMe+BCsO+xFa8jMN3eZu1UHD9rB9fGgVdBL9mguSmiraoufmBKw?=
 =?us-ascii?Q?ElwarUonayM4Z34FH3eEoCrhKmIX2wJUI+a0z8dQWFUEbpAXn4R+liqxGvex?=
 =?us-ascii?Q?Fg0uh3R+8zD/HEy6eSBdxTGg8O7hXfv+L7VCQsi+qu/du0cgPebE4qyk10CP?=
 =?us-ascii?Q?lWJgf5Y0usmbJvzXAtHLHDcQX77CCfe7mbYqqDsBAaCCwADQxKoCmatLSv0z?=
 =?us-ascii?Q?zzHwPPLN+wv/OPCE3SJcyf8DP6L19nX/Zrv7hdgLxSJ/rKaswJ3IZEjIcyKi?=
 =?us-ascii?Q?bNS+eesHUAvvSDj4s4bd0SsCHblfiTwI9LsgD8nbm9dNAnz0EMFuiR0EvesC?=
 =?us-ascii?Q?vtgSeVq1dtjfQOhS+TJHMluVyu9xYD8fzBtwrgFaWGh+F28gKOVkJtWkH1gu?=
 =?us-ascii?Q?b6DbLBB+HY41rmt/sDL3CorbuYs/sBqbMCF79Kr/K3hshLU/FUZVhctWPF+2?=
 =?us-ascii?Q?J/usx2rEVsoHT/ITU4dXoOHkNIpK5pdOnfCklpnTsjZ1MLxcNH0P9qP/8JVR?=
 =?us-ascii?Q?+Pq4v4G7ihNYsEkq2+zIyfK2CHi5/gQio9lv9d7thT2GB/GfOlHrODkL1XRB?=
 =?us-ascii?Q?rCPLOfU5UmIr7QYGig3l71ge2+69eireGyKTg1JZCRjox5LSHN9JJtJC68yR?=
 =?us-ascii?Q?mRlmveF3tWaHmAkRxdFPkiMency9nSUvf5FxwW5qr920X+v7j4iCHdnzqY97?=
 =?us-ascii?Q?kB45NBPB4D7YRUbXB0ky/NPJVyXV7ZIZbc0cV7nJlmkrIrkwyw55PMFWFjSN?=
 =?us-ascii?Q?ti3mrDCgjPKklbK3vOkkAsc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 9ce9fae9-9c8b-49d7-0406-08db9862b337
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:56:28.5022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6kZIpCfpxBG2j1igWgj5KmhlTVpcGRHuIZzS8Wz2TzN6VjdYu+uuINSu3IWZ0UBgr+swUx+o2Clfi3qt986mSoIS8nREAyOYjm2PleylWlxQNK1uwc/h9pJfbR8ux212
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB11969
Message-ID-Hash: GMOEM7E5YT37HSBB32BVOYHNUQTCB5SW
X-Message-ID-Hash: GMOEM7E5YT37HSBB32BVOYHNUQTCB5SW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GMOEM7E5YT37HSBB32BVOYHNUQTCB5SW/>
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
 sound/soc/sh/rcar/core.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 9f3d97bc177a..069add7b1b71 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1085,17 +1085,6 @@ static u64 rsnd_soc_dai_formats[] = {
 	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
 };
 
-static const struct snd_soc_dai_ops rsnd_soc_dai_ops = {
-	.startup	= rsnd_soc_dai_startup,
-	.shutdown	= rsnd_soc_dai_shutdown,
-	.trigger	= rsnd_soc_dai_trigger,
-	.set_fmt	= rsnd_soc_dai_set_fmt,
-	.set_tdm_slot	= rsnd_soc_set_dai_tdm_slot,
-	.prepare	= rsnd_soc_dai_prepare,
-	.auto_selectable_formats	= rsnd_soc_dai_formats,
-	.num_auto_selectable_formats	= ARRAY_SIZE(rsnd_soc_dai_formats),
-};
-
 static void rsnd_parse_tdm_split_mode(struct rsnd_priv *priv,
 				      struct rsnd_dai_stream *io,
 				      struct device_node *dai_np)
@@ -1353,8 +1342,7 @@ static int rsnd_preallocate_pages(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
-static int rsnd_pcm_new(struct snd_soc_pcm_runtime *rtd,
-			struct snd_soc_dai *dai)
+static int rsnd_soc_dai_pcm_new(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct rsnd_dai *rdai = rsnd_dai_to_rdai(dai);
 	int ret;
@@ -1380,6 +1368,18 @@ static int rsnd_pcm_new(struct snd_soc_pcm_runtime *rtd,
 	return 0;
 }
 
+static const struct snd_soc_dai_ops rsnd_soc_dai_ops = {
+	.pcm_new			= rsnd_soc_dai_pcm_new,
+	.startup			= rsnd_soc_dai_startup,
+	.shutdown			= rsnd_soc_dai_shutdown,
+	.trigger			= rsnd_soc_dai_trigger,
+	.set_fmt			= rsnd_soc_dai_set_fmt,
+	.set_tdm_slot			= rsnd_soc_set_dai_tdm_slot,
+	.prepare			= rsnd_soc_dai_prepare,
+	.auto_selectable_formats	= rsnd_soc_dai_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(rsnd_soc_dai_formats),
+};
+
 static void __rsnd_dai_probe(struct rsnd_priv *priv,
 			     struct device_node *dai_np,
 			     struct device_node *node_np,
@@ -1409,7 +1409,6 @@ static void __rsnd_dai_probe(struct rsnd_priv *priv,
 	rdai->priv	= priv;
 	drv->name	= rdai->name;
 	drv->ops	= &rsnd_soc_dai_ops;
-	drv->pcm_new	= rsnd_pcm_new;
 	drv->id		= dai_i;
 	drv->dai_args	= &rdai->dai_args;
 
-- 
2.25.1

