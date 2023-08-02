Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EB576C1C4
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:58:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D163845;
	Wed,  2 Aug 2023 02:57:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D163845
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937914;
	bh=Q3F2q+0YPSAxMGw4rk1VBA5Qi4ipUj023nUel0UaJS8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OmvYNZG2DTc96grAS1CPhMICM9gwpN0Hbl7rG/8l4kK2akqTdTjQGVZR68o/P5MMQ
	 EKpvP5Wbpqb+u7B+JF/iLWicYjyAhnnoRK6XVYwQhL9ts6R5JAKLhSvoimppBdtGAM
	 P725cHZ/mIcOplyEbSseyhrwZPDgdDS9yZrEY8Q0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A9803F805F8; Wed,  2 Aug 2023 02:55:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 64E58F805B1;
	Wed,  2 Aug 2023 02:55:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64AE6F805F4; Wed,  2 Aug 2023 02:55:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 96D68F80580
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:55:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 96D68F80580
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SlMGTKfD
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGKP/p/AUTB6qM8mYL124P3wF/dBNETsHChpnc8quCgy0Qc4afd3T1JsN+du6wzLYrL+L0YfoPusJrZ23/vjRRp6g6FE9hXbMQ5ZmvugzpCK/MGESjSLEKkXlE1r+L8R5wN+rzG/CfIG2n6E9OYcOZui5BIsHu7YqZuAD5lq/2TQE/jGJ3PkruW0m4066JGyDIJdOOfLKJVMRIdvPtWB62+f7q1Oqx3ZFZ0C3Zet81ocoob6BtWIEjcza8FsetQpn8Oo6jtLDHtHagb2szhhbTXgZopTar3BPpPOTny50A6ZW2qrYsPZJZbpHi86s/iDpVPwCpKFquZyiNZkxWokRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jHUn1EaLPo89PjGHQHwgON9LqKYAm5zbyfzGcB+CPS4=;
 b=mKiYCFaDHdfHw1y6o+qo4KpMZfHA2wqYCoOOEjy1sdJauki/SNSWUKEMHrm0OhbYePUUKsQLTSU+ivRUI7ySML8mxcXyZ2CkHseROTNSBsDY0T8InDHSPu6VZdlV9eCF4906qgGLvfxUIW1N/GNKb6c2biW3HCMYAF+4cDHfj3K0AFVXahFUzkb8bIbmFC04fnVNNA5ZLTB98UHnF9eawGOU/dhNbDtBF7YRvPP5Tt1jpxB4jJ8SgrZ28C4jgY6gj6Rc8Cac5prqVN9aHdV9nB9p0wCdMZabI4Q+c30+XeVnJ65b54Doh6YY7KD5P9nFjS110142XcKKkUwXICYuIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jHUn1EaLPo89PjGHQHwgON9LqKYAm5zbyfzGcB+CPS4=;
 b=SlMGTKfDCYLzATOHx9lWikCPQTbemzCkAwrA85BBiR4S2Dz0DuDJ+wNHMaFFfXk7EkWqlJhAFFNM9CB3VVS+N7LnfNRSaqZgmKrZ/nNBhOgY20ylkIsybp4w2mcpqOjkyKti+Eu2CFnm/Kz/2d79yUwqcT9BDFsWQIwI27iLV/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8348.jpnprd01.prod.outlook.com (2603:1096:400:177::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:55:02 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:55:02 +0000
Message-ID: <87il9ytg9m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH 19/38] ASoC: tegra: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:55:01 +0000
X-ClientProxiedBy: TYCP286CA0240.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8348:EE_
X-MS-Office365-Filtering-Correlation-Id: 71dbc70e-e7df-412c-f12f-08db92f31a40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	oWl8yWkmPNrH8dqSEeC10RFaQ5b+N7qV0+4yIiLNu+N7cdslYOBi65M/218LXUYCgqXwd2Fk3Bo3MrhAGZ7QCUmu1PVjQZnWF8hUl0AjfxB/Slh/n3DjCUI4TBMfaXJ0WKlGbLmsuQL0EsJam4DkcA+Ttiv4K/Xwq849/DlM3giKIYftsvKGfp3I22ikH7Lyn4edzVFBMAtOz0dmArbri5ncYQg44mOXVL4f73mogTGKujlj4MghwgsWVkpE3hPvY2MBpLgd4Ej8ckyk/kgBjHg66Cil2yLg5VtTkAiQaFEx1yVXFjceJr3ACVmIZl31h7Oug/6q10np3LcUtjaSCfwzjqgwSXxbm9NC40830rdUqzaCR5pR44/rorkbCs2VvdVMwmnwj0CisYevIiwj1DQvWagrr7ZomiabwlnQuyINEsGOkcmI8px/I05ChuauV4N36FyIBlVxSM+UGpipykDbz/GIcethkOgoXfkdqAdlTKJCDxBnALmAlIDJHrORjhcOQDhWMJfohYFzm06qewL49W27sEmACXjA25HsS/rlAs+tUoykbZokLJLuOozfrcCfim8sL8nkl25ad8wA2sNItCAnoRI2Zj8UXFXBadydfpuzeZwn0W7e0FpaSUIu
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(451199021)(5660300002)(8936002)(8676002)(41300700001)(316002)(4326008)(66476007)(66556008)(66946007)(2906002)(26005)(6506007)(38100700002)(2616005)(110136005)(83380400001)(6512007)(86362001)(6486002)(52116002)(38350700002)(36756003)(478600001)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?S1WV8Irj7q1FkSZ8xlynXiNBJ1fUOjxHuip5fG6gmvq6E8Qst+x1pU1EAHS3?=
 =?us-ascii?Q?Rrmf2+MkW5eZcf84+pQkLIws5QNfZxT3uOaY8lNDcJuqqSIGTN5odp8+UGay?=
 =?us-ascii?Q?63w9wh+Mbclymxz6rOlEkqca8yo5hJ88429D3MIE9exNV07MsT826syYbjkv?=
 =?us-ascii?Q?agjGtfrubaiZQy1zGgEuyk9pOB1gGX4s7dCuZd41zSrgICLI30f0y9AUABKF?=
 =?us-ascii?Q?08GYuKroK7hO8wawxp/1cVRSfjhxRB3wFyA11nW+/TBLyR14L2EAakv6jonQ?=
 =?us-ascii?Q?vbQh6DTDgAbBXtRDtapd5c8TXCsn4Fj0s/c0Eqywbm+0sgRgmt50+OMC6C1o?=
 =?us-ascii?Q?5qwfDeooMSJWk4FSt14Xr9tegswYIqoOpNsddY/fO1EUiSuGp/nAfmYDMn/9?=
 =?us-ascii?Q?rbd1fg0X9jq8Bm1717JqqCTY9dVFJI6PmlNs6QpU6/yFEZVdMAzN9g7BqytK?=
 =?us-ascii?Q?QJ4yizG0iJWD8llvqLHefxLZLdRAd6bcDzopsDGRHfVjrromGJ+fNN/0MZtW?=
 =?us-ascii?Q?81XNQJz1FJQ4s372xMf78PiMzP0mBg2TsUvFq0aRl6AGCedF91O4OENg8qqa?=
 =?us-ascii?Q?o1GKM66XYPi1lBz81w9/cbTy9V893fMm+CViHoXktW4lOKzMLNc2Wgi98O8y?=
 =?us-ascii?Q?fR8CQFPGxik1qheu4/8nhyiK3vKIebwnv920AFf46vGBS+rx/K8tMLI07n/f?=
 =?us-ascii?Q?mcB1xQ9QXQ0PaUU5Ssgtb8AKX3ZwlefyQyNt6lTOK/Fuf1mfRPizObNKTBrP?=
 =?us-ascii?Q?mKlEKKs8bHknIgz8Y+O3WTQdDRVR4pRvk51nFrxZRjoWZpk5dmmU/cFJLPtB?=
 =?us-ascii?Q?RAbD2WDFJuOef6iXnlDC6Stj5YZRQtRursghMoqvCyg/+lj5Y2AxStSNJxDX?=
 =?us-ascii?Q?VT+iw1Sync9oqkwp0YoHq165hR+Ex+eP4s8ZTNg3QK7WbL3rlVn6mG4bXuDy?=
 =?us-ascii?Q?ZQKFO4FIk6pZ0+wDSd14qVl331ZuJ13nsY/i8/NKQUPNIxxXhpNv1U8Pnjnj?=
 =?us-ascii?Q?etf7MiKpKxczuPXOVYd3DlUh1mtGRNfCxPIAUG6R+7ji7aA9MUmFQolNcq36?=
 =?us-ascii?Q?5rsKFBUQFBbuxj9LImKeRiVtmZf0AgWuPP7o2tthR+w4/X3aZHIqEA+2yzH7?=
 =?us-ascii?Q?OuybLv/++UewPfpugBaA54KRlw4fc1eHFeI4anHlPIs5/zmH9Gm01SGK5eOX?=
 =?us-ascii?Q?05+UAkHvLZZwU+quMObRmdUIlJ+Qm0oyaDDMVYlK2dcObsnqMEkQXUaNIchX?=
 =?us-ascii?Q?fD9uBYQIIB8hR0ZnjaHALkJ/dMfg608F2ZcAYo3zAKb9+xJ6TpGoBe4JS8Lz?=
 =?us-ascii?Q?GVSaOFHGPPJyi2caVEF+9kmVCnLNYQWVle/nDskwrrlq/va/IrX5of2VkTzz?=
 =?us-ascii?Q?hdblj3Z6xUba3dluKlw0RgRwQQtBsegXIAy3Q2iod8pXEArms/pslmkcPBMD?=
 =?us-ascii?Q?VjjLf0RNgzCBFcBiDOjE/+bSEH1cKBqx67kOjCCXwlAMCokfdHpyGpDAJ5WI?=
 =?us-ascii?Q?bQ413cW5mTus96SaHkbi8pBbAoajXQSLNQjla0pJO6ZKZd+/D3FnlJtMiuUP?=
 =?us-ascii?Q?uadAnm+VPh+9+zpt3S2y10evdy7wAvSNhJmHAC5zVTgoPQ5lnjTGrbbeBuLz?=
 =?us-ascii?Q?/kUKFZJdTA+Sb3C5xX9M11k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 71dbc70e-e7df-412c-f12f-08db92f31a40
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:55:01.9453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Z4x2rRAm3yHXWb07XE9Pqb7h9zJrwJWraQyz5vofG/kEaZFIfJSN4ZTZQY/CqvcjUfLcXObSmx90COK/0r9ngI5FnlHtGE1OXrQnPkp1BN6xEeWced8qKcBcKp4LdgAg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8348
Message-ID-Hash: CYYAWIVY3YIMDB3VRCC4LZTCMA2AYHXW
X-Message-ID-Hash: CYYAWIVY3YIMDB3VRCC4LZTCMA2AYHXW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYYAWIVY3YIMDB3VRCC4LZTCMA2AYHXW/>
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
 sound/soc/tegra/tegra20_ac97.c    | 10 +++++-----
 sound/soc/tegra/tegra20_i2s.c     |  2 +-
 sound/soc/tegra/tegra20_spdif.c   |  2 +-
 sound/soc/tegra/tegra210_admaif.c | 12 ++++++------
 sound/soc/tegra/tegra30_i2s.c     |  2 +-
 5 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 60e7df41c64c..e713feca25fa 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -203,10 +203,6 @@ static int tegra20_ac97_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops tegra20_ac97_dai_ops = {
-	.trigger	= tegra20_ac97_trigger,
-};
-
 static int tegra20_ac97_probe(struct snd_soc_dai *dai)
 {
 	struct tegra20_ac97 *ac97 = snd_soc_dai_get_drvdata(dai);
@@ -217,9 +213,13 @@ static int tegra20_ac97_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops tegra20_ac97_dai_ops = {
+	.probe		= tegra20_ac97_probe,
+	.trigger	= tegra20_ac97_trigger,
+};
+
 static struct snd_soc_dai_driver tegra20_ac97_dai = {
 	.name = "tegra-ac97-pcm",
-	.probe = tegra20_ac97_probe,
 	.playback = {
 		.stream_name = "PCM Playback",
 		.channels_min = 2,
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index d38b58305c6b..f11618e8f13e 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -310,6 +310,7 @@ static int tegra20_i2s_startup(struct snd_pcm_substream *substream,
 }
 
 static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
+	.probe		= tegra20_i2s_probe,
 	.set_fmt	= tegra20_i2s_set_fmt,
 	.hw_params	= tegra20_i2s_hw_params,
 	.trigger	= tegra20_i2s_trigger,
@@ -317,7 +318,6 @@ static const struct snd_soc_dai_ops tegra20_i2s_dai_ops = {
 };
 
 static const struct snd_soc_dai_driver tegra20_i2s_dai_template = {
-	.probe = tegra20_i2s_probe,
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 2,
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index d034803695a0..b0670aa4d967 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -241,6 +241,7 @@ static int tegra20_spdif_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops tegra20_spdif_dai_ops = {
+	.probe = tegra20_spdif_probe,
 	.hw_params = tegra20_spdif_hw_params,
 	.trigger = tegra20_spdif_trigger,
 	.startup = tegra20_spdif_startup,
@@ -248,7 +249,6 @@ static const struct snd_soc_dai_ops tegra20_spdif_dai_ops = {
 
 static struct snd_soc_dai_driver tegra20_spdif_dai = {
 	.name = "tegra20-spdif",
-	.probe = tegra20_spdif_probe,
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 2,
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 6868508585a0..9f9334e48049 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -419,11 +419,6 @@ static int tegra_admaif_trigger(struct snd_pcm_substream *substream, int cmd,
 	}
 }
 
-static const struct snd_soc_dai_ops tegra_admaif_dai_ops = {
-	.hw_params	= tegra_admaif_hw_params,
-	.trigger	= tegra_admaif_trigger,
-};
-
 static int tegra210_admaif_pget_mono_to_stereo(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -550,10 +545,15 @@ static int tegra_admaif_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops tegra_admaif_dai_ops = {
+	.probe		= tegra_admaif_dai_probe,
+	.hw_params	= tegra_admaif_hw_params,
+	.trigger	= tegra_admaif_trigger,
+};
+
 #define DAI(dai_name)					\
 	{							\
 		.name = dai_name,				\
-		.probe = tegra_admaif_dai_probe,		\
 		.playback = {					\
 			.stream_name = dai_name " Playback",	\
 			.channels_min = 1,			\
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 644280603095..81eaece51130 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -304,6 +304,7 @@ static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 }
 
 static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
+	.probe		= tegra30_i2s_probe,
 	.set_fmt	= tegra30_i2s_set_fmt,
 	.hw_params	= tegra30_i2s_hw_params,
 	.trigger	= tegra30_i2s_trigger,
@@ -311,7 +312,6 @@ static const struct snd_soc_dai_ops tegra30_i2s_dai_ops = {
 };
 
 static const struct snd_soc_dai_driver tegra30_i2s_dai_template = {
-	.probe = tegra30_i2s_probe,
 	.playback = {
 		.stream_name = "Playback",
 		.channels_min = 2,
-- 
2.25.1

