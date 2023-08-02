Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A33F76C1CD
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 03:01:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A9834E10;
	Wed,  2 Aug 2023 03:00:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A9834E10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690938073;
	bh=uldxkI2iLdr9p4jBUoqbO8wtx1ZGAeyLCoa+nXHB1b4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=U9S71QLxB0flMrJHEB0Nj8dqNhPpthwUK1C0uKxjw32Hv3/XcbqZ3dsiDaxLRb5e0
	 fAQ4W4D8Vd4Z3HljJcd07BA4OHECH1yXwwjEZHS7XlbXYgO4/8b8+NvtuQHpA2jBUI
	 6NjryxdXfAvakcqR370sZlEcaaGY3KnzTyAbuer8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A901F80520; Wed,  2 Aug 2023 02:57:16 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C5257F8059F;
	Wed,  2 Aug 2023 02:57:15 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E637EF80638; Wed,  2 Aug 2023 02:57:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20704.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 92922F80578
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:57:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 92922F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=WA1Bnsc7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P4oL3M+9g17JztYXFPYaz57xmre02fQvFroXD1n0qh309nOyq5CuVKXCk+LrSv3EXw/st51hMlk6vM00vxyS/n5RX2BLfSSEZdDbdpI8HU0OcnZO0magxjGkXmz0SiFM8jDhnlKyI2nYLuhnaR7IFcspmghl466BKJZq1LB0nbA1uz9GMvuOtOl34nlAVuOUGln2KsoQ0+YcysW7JE8LOip6f/0V9MSbEVB0pSl8RnFb7JUBIOgALTx20UNvu/6dG5jADLTFo6wRnRx7cJpotn1BHsi6Pjm+lqzr+tS4ejvR2GdyQaGxG8MmV7qfR944RNAP0OW3jl0KjKsFYYhjQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jw2gzRbconf/WYexs5sPIOPf7oDLSXhVjZZ02EV61js=;
 b=flRlwOca+VI98bDLHYSGc2z+KqSAcHW+u2cmGqN8VLkytjKaDz2A58hXPdk3IFACXPdo4RT5iOE2iGAknKK0wCn0uXQ7Gj2T+6quIIoUzwRB4S6z0QhCMaDQ0/79qn0P4VCo3ce49ixDDmUX81hQEgeF5xblnyjVrmPrrcKX3vooE+lEKzVBoWYgFytMkGg+094JFABy1eD5aEh3C7VOLuvvtHvlDQvhrrZ5iutlXt7Cf8LcMaE4r5CjmVPOD7hLSJOqSEvpEN6MOXux3UA7EbmTy+9V+IjAmrcYkPmxm+4gcLEDlRHlaBM1mtQ/QVCL9gRB5dv+bqto4IBNvozXYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jw2gzRbconf/WYexs5sPIOPf7oDLSXhVjZZ02EV61js=;
 b=WA1Bnsc7LAPYBpBekEcF6h2v/vKIvp2KxGA7nw4Ym8R+KUUrAr6uJLamJf3w853MGVx7x/+RuqmSHOWMASMkoF3oubblE2QHQCBY7DepywdcL/Eg7SA09UHAPXfbN8gOuOtlRnoB80VqpgXUJCJ4ZHOt7qcqt3VLzCqbht5N9wk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9381.jpnprd01.prod.outlook.com (2603:1096:604:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:57:04 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:57:04 +0000
Message-ID: <875y5ytg69.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>,
 Judy Hsiao <judyhsiao@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 28/38] ASoC: rockchip: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:57:03 +0000
X-ClientProxiedBy: TY2PR0101CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::29) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: ebe0a371-c27f-4eda-631a-08db92f362e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	hZ+8IcssyhoaTMpOzPKrp1kJn+7BHQi0V92DvVXIBOJG7+wIuxkmWfzHabJgBHG4Zf4zGLddBKeaxu9qRd2MQnG6XYFY8zIOJIitWLe+R+Zt39zAuD8YFV60MJRJubgTVcjYDhpyAvgEGX/gtfTHu0HF71zTdNCod/9bkqlXuOJupQqrFzmHXocodxRJFK+QCkRwNBR20+gTF3sSxp7LX7mtCmNsPVbw/NB66rdLroF900o7Hrcy8rmbLINfSpo1aHZJjo4Nz/9n/GzSqxhQHktdHWhlyau6y7WpdiapALAGcANJjWJKUpPeP2jNkzS4O45tqk0I4EtWGF1D20SdNpivbZFC4WnZRSmZF25vUly6KWHmnFmNxKrOsMXEVNcClZT4xD59/mbIzjxO/q2N+EAiA2/FlNcr8sWhjywIYk5IhMzne05itFI3cNC2iFV4pnS5M5Y19XX/Jgk2vit5jyVdjuiBIvkO4QzNqYwROGeHmUmAPRZ/1uZmwkH/HoaPB9Jjh2f71yJaxVXxrtQhOj9qBSK+ffZ0g2Ud0WprpwkM7BgKojIQ4hm6SvNzJPNUNA1/CeWac7R8gUWT0EuBoOp9F6F4k/KlZJKh+k9nOqcQKlUQshSpjOHtUULcdFIr
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(38350700002)(66476007)(66556008)(66946007)(2616005)(83380400001)(4326008)(316002)(6486002)(52116002)(6512007)(110136005)(478600001)(186003)(6506007)(2906002)(26005)(86362001)(36756003)(41300700001)(38100700002)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MPmHMQO7XjrPSecVwMaFqfHgHZexOa5yoYoZWyJX0BewQG/Y76nMnMr5ybir?=
 =?us-ascii?Q?UUywovVCkeBF4aonzRoMPZdNipKwzQghJgTpmFfDBByMnwHQwWTAt32i1g4m?=
 =?us-ascii?Q?J7EU6/rRv8BcVp+HFR+dGKJe9G7LcoIk2mkRyI+2MBqrUbbj1PikzhIDB5Qw?=
 =?us-ascii?Q?n69fX8FWI2BKzsmzHiZBxs2x6yvw4wY2CNX3rNXbd1KOK66uUGLYescnE7L8?=
 =?us-ascii?Q?KxBKNK98M3Guj3nkoj+o59UemJau317petC3F+FXxd99g5uNsbeTy0Vqt3lI?=
 =?us-ascii?Q?Fogi9Mj+6EK/d9ctFzbcO/eM6uXr1KfUyXV4wL6XiNlg+SE7ivWq2s2G6MHd?=
 =?us-ascii?Q?xgqYXPjCxARTARSeE2kAsajSt4ExIqlugdqWCABIMq4PdVzjrCVSTUMn1yMF?=
 =?us-ascii?Q?fNC0EkB3kIKi6UFgocCfWqjqRdYtuoFfwRj/XqY7E4OSliFsU2W6oDlRWo9x?=
 =?us-ascii?Q?zazEDT4JmCiQk2jkInJ9W5RTYMP4AMG+xEVePM5KQBT5zZfvPJsrL3824Ka7?=
 =?us-ascii?Q?WT7vtJ0cBV/9jrKpZreP4QowHHT+pekSRVTSRe4cx+bvEFGkjTiSxfpeY3g1?=
 =?us-ascii?Q?ZDBcry4CKiRxthKCZ80y/NszFyQp6cLRcUyq6odc/fheN2hlSHcPPM+XI4nr?=
 =?us-ascii?Q?JAWq/oTo4M8GSF6N34hH+WnRXRLm0sGmqcjFj6JXJvN7dIjUtJb2HCe5jn89?=
 =?us-ascii?Q?2cqoabYlGmI0AqbqNvE06tOkcg0zaqesPkTsMxkXGJFNDwKCp2p2Ulz4Cncf?=
 =?us-ascii?Q?Kr7/jfJdhyrvvKLdo052RZeXBGh4mxJGIqa0YWJhyzRz30sc3IAkknvbxGik?=
 =?us-ascii?Q?HUtb5cX2Mjl90ZQwymbN1jQytUZoitMUP8N0sB2xkeupk7XiY/iq7Ilk0kZ1?=
 =?us-ascii?Q?4N9Qg5V+1GmVmfAGNkn6xdXO6oU14qrTBpi+SLNY14EuvXOcK+hB75F7KOoV?=
 =?us-ascii?Q?Q0MrawONi5LVvVILLLB90dyeUXJaXUxgucdC9iDVOuRWZWZSUEiIvKfnXtvt?=
 =?us-ascii?Q?GgrA/hdI6A8Use/ufDnbAlZzd6I89ee1+uEYkp021xb7UIHW9ra5mc8Y0r/f?=
 =?us-ascii?Q?zuXBqL3b5Cm5B0ZieqsknhuiB+H1wV8dj/0eECQeU7ekwyuUqDvGmNMsuKb0?=
 =?us-ascii?Q?bcNQEz0oNi8DBk90Q9Mwq5LKEMvAZpDbCSL7/8cxNb/+Fmjix8UvZ7lpThen?=
 =?us-ascii?Q?1jHrGH+jDejbriqggZgKpjRHI0VTpnwIFu1dejEBjt07QZbs0GnFdM7A8UkQ?=
 =?us-ascii?Q?DitWjoJDt9wXbSxG2WjByv6hsjBUz93dQedmGYPkCa3iRwezR9eDrR2QtLkp?=
 =?us-ascii?Q?Zr7QZlxWxMwY7zvxRRsLZclBMa5dyCrGrqL/a2ko0PQvVh8REP5xdRenUpWW?=
 =?us-ascii?Q?1n1+l8L1YAD0jeS9GDcUpBYqZ1o115Dp0DOCJC3SgOXJgB5HhwQUVN4sNnvl?=
 =?us-ascii?Q?leJJfJFasU58Mf6wj6eeFm5Sab1v+8hSKbYEADe0mHF1sk9Y5C5fsPGv615A?=
 =?us-ascii?Q?0zqG4PF32htbL9XCrSEv13Ox7zCfRH9+1xjRE8uoNb42WKms8Jr5/rIFyArm?=
 =?us-ascii?Q?PMGHTPOyV93tOpaa7hlmj4dGd/Ds/CxGQHargoIMhOcUFvK/huq90F5EGy2v?=
 =?us-ascii?Q?mVhSAo/J3+UzpAEwH7c3/wQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ebe0a371-c27f-4eda-631a-08db92f362e9
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:57:04.4282
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 uN02+4AED+/uN26KKz72/BYn0oirOGkyHxj1gC+qmoTgLjsh7b9+RlJPE8vwMvvnXvopiEH6RQ5hA2tqvKsg1JrA+BHEl5JJwOEworBzRWRl5OnUdCKmobxYYmfZQ8W4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9381
Message-ID-Hash: EWVIH4RIYSJYD4SQFU3PTPDSO3MK3WZG
X-Message-ID-Hash: EWVIH4RIYSJYD4SQFU3PTPDSO3MK3WZG
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EWVIH4RIYSJYD4SQFU3PTPDSO3MK3WZG/>
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
 sound/soc/rockchip/rockchip_i2s.c     | 2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c | 2 +-
 sound/soc/rockchip/rockchip_pdm.c     | 2 +-
 sound/soc/rockchip/rockchip_spdif.c   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 575a0b9b01e9..834fbb5cf810 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -539,6 +539,7 @@ static int rockchip_i2s_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
+	.probe = rockchip_i2s_dai_probe,
 	.hw_params = rockchip_i2s_hw_params,
 	.set_bclk_ratio	= rockchip_i2s_set_bclk_ratio,
 	.set_sysclk = rockchip_i2s_set_sysclk,
@@ -547,7 +548,6 @@ static const struct snd_soc_dai_ops rockchip_i2s_dai_ops = {
 };
 
 static struct snd_soc_dai_driver rockchip_i2s_dai = {
-	.probe = rockchip_i2s_dai_probe,
 	.ops = &rockchip_i2s_dai_ops,
 	.symmetric_rate = 1,
 };
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 166257c6ae14..d3700f3c98e6 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1114,6 +1114,7 @@ static int rockchip_i2s_tdm_set_bclk_ratio(struct snd_soc_dai *dai,
 }
 
 static const struct snd_soc_dai_ops rockchip_i2s_tdm_dai_ops = {
+	.probe = rockchip_i2s_tdm_dai_probe,
 	.hw_params = rockchip_i2s_tdm_hw_params,
 	.set_bclk_ratio	= rockchip_i2s_tdm_set_bclk_ratio,
 	.set_sysclk = rockchip_i2s_tdm_set_sysclk,
@@ -1324,7 +1325,6 @@ static const struct of_device_id rockchip_i2s_tdm_match[] = {
 };
 
 static const struct snd_soc_dai_driver i2s_tdm_dai = {
-	.probe = rockchip_i2s_tdm_dai_probe,
 	.ops = &rockchip_i2s_tdm_dai_ops,
 };
 
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 52f9aae60be8..667f2fa65c3e 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -379,6 +379,7 @@ static int rockchip_pdm_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops rockchip_pdm_dai_ops = {
+	.probe = rockchip_pdm_dai_probe,
 	.set_fmt = rockchip_pdm_set_fmt,
 	.trigger = rockchip_pdm_trigger,
 	.hw_params = rockchip_pdm_hw_params,
@@ -391,7 +392,6 @@ static const struct snd_soc_dai_ops rockchip_pdm_dai_ops = {
 			      SNDRV_PCM_FMTBIT_S32_LE)
 
 static struct snd_soc_dai_driver rockchip_pdm_dai = {
-	.probe = rockchip_pdm_dai_probe,
 	.capture = {
 		.stream_name = "Capture",
 		.channels_min = 2,
diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index 0b73fe94e4bb..1a24b78e9e02 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -202,12 +202,12 @@ static int rk_spdif_dai_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops rk_spdif_dai_ops = {
+	.probe = rk_spdif_dai_probe,
 	.hw_params = rk_spdif_hw_params,
 	.trigger = rk_spdif_trigger,
 };
 
 static struct snd_soc_dai_driver rk_spdif_dai = {
-	.probe = rk_spdif_dai_probe,
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 2,
-- 
2.25.1

