Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E179B774EED
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:04:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE77DE7B;
	Wed,  9 Aug 2023 01:03:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE77DE7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535851;
	bh=0pLJD2IrAFT2AT/ngf8Y7BOJkentP+fHxhePgQL8QYo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ipjPDeS0md63iwfReMK/MUaG4S8mUPOOwsm/6rpncQI3/b9Ia0C4cyZ8b7DSamM+U
	 gw8LA6iSler7Y3Bsb1mmX3Xhh5n3+RZlm0ovbBIjJ2ynJGUceEZUOsXha+2cqWh8cw
	 hxqPP48prPmo949gSvpSC8AGQRu4igmv23qkDlnU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DDA24F80553; Wed,  9 Aug 2023 00:58:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E30EF8057F;
	Wed,  9 Aug 2023 00:58:13 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8635BF805EC; Wed,  9 Aug 2023 00:58:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2071d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::71d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2A608F8057F
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:58:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A608F8057F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JdaxFO84
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=erSsyJI/A9n0QBcW15W7G51rw06aV3rnEmN4WguNjoK5u6O/aN7BgtMqnX/LfQFvp9SnaEhpvdw1HbhfHkQllUPYGwaKTvwwkJDU2sfDfCxLkjw3akDyn0uGLcB0l2JA1dFdBYmTkkn03ABcJ3j1hXvwH4Xsu+zw9mpc4eY4VNuRjURDWzmH0FH1lbMWSqwKTsW9kuTD0bhNqJR3dqV3xEwsMEeZ6OqDQ9tHR1OEqGlnzK334ywrs5MxqowtFBHv7bqmKPlijrtksfi/4DSDMNoCXJFFM8j+veiYu0cTK39+SZAW27LA9W949gt9mpJN6hpeocFVNJzMCnPqoAW02Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rUqi7Q2b+o8tA2mzivN7N7UsqRDu9nkka9XJ+o7GkME=;
 b=afW37CfrVJbMJSZQVvn2Ix2+MLaW13WCf4HDfpNXtuURYNdYoS5MAQJHAXmmoGcE89KUHj8LJ7vReakLzNh3eaNKUp10DLObWBrDDiUBSlc/jfvP0JhawTxfeDYn23cY5Q0TMGhoCo61NXZtaZ+2NG6tU4Rodac4kr1TI5v1Gb4wIcOZSMJHNf5K5hDC5MMbfclX0rNLuB4RfMsG5jX6+Gwgg0zYVG/+/CS2QKZdkuYcwe4x3NrLi2+Lzt25enAWNrfcUwMZyqNO0JcJXKMJ/9yvMFgr6vrgko8dX6gPvbEMT994gKy8grcF0HJIiGdwuvDuCdcz6BOLyger6bm+VA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rUqi7Q2b+o8tA2mzivN7N7UsqRDu9nkka9XJ+o7GkME=;
 b=JdaxFO84iY9dJdRpktDBbR5Ovej9cxbW7G1AmV8cSOJUpUVk/P0M5JgIcKjHZuztU6AP6e7Go7kmJfvMRB8eYbl0m2hlNekIKdSgj4h2KdnolSf+lvtOm3ZFBRg4vag2rVdRKBVJvmrkS6HYOJ297HtBkkQZ85rGjIdx38Qvr7s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8414.jpnprd01.prod.outlook.com (2603:1096:604:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:58:00 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:58:00 +0000
Message-ID: <87r0od9m6i.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Heiko Stuebner <heiko@sntech.de>, Jaroslav Kysela <perex@perex.cz>,
 Judy Hsiao <judyhsiao@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 29/39] ASoC: rockchip: merge DAI call back functions into
 ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:57:58 +0000
X-ClientProxiedBy: TYCP286CA0147.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::10) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e5955e2-c314-4bec-84f5-08db9862e8ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eVKCPqWcvElJ2KVSXtomSiJxbY/xKnTPZLJdJ6sNnEKPJgvFy9L6F627kmfPrim4JZ/BuHsp9tTESd6a0pgkJKYNS9UNelOZDRjcykV9jfzbUwnicwsaCkAAiDKEEFm4sBaMJfemCPE/FZsJu5RYRyrOsNDgNWh2K94DRmfz/dYJ30vjqNvtPjUeNw7cIv8/2Heuu+iJ6bVB9a+EcdZqotIYTUnVWfm2FMaVDrik0AkqrK8SCBGobIafwCFvg6JmkindgxvS81HucdWf9MwF6oZKZss/Agt4ThNxwyVa+wLX1XQTy6DtOZ5c2iy1Mo2fzLnqfhOLh6byaStxbMQuxQ+BsxpxYXhLxqCfvRL86Z4gsZ3N0XRfNdqh9GpiZFffFTmeyl5bKIMVMGYsilVAniCLFnCbBCjuZRaYf3L46c30pUpu0x4jc/U1sYJCVet0P+XaDOi1v6YEkvj2GrT6gyC4v4BfO31BZD9zkxVmDhwKOTtEql/vtyBZsGOYvmXzV7YOOvkyixIBJSfogIl884BnnRkS2MWR8N+pyM4fnAgUavXF5xaMSAYyuE+80AYOJQd7mehMcCQ8dRzNFf2Cnkw1l9FR8rZR3XwsBT70Wb4PAw2F5bU5A6c/cssPtqYO
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(1800799006)(451199021)(186006)(5660300002)(38350700002)(8676002)(8936002)(38100700002)(2906002)(86362001)(52116002)(6512007)(6486002)(2616005)(110136005)(83380400001)(478600001)(66556008)(6506007)(26005)(4326008)(41300700001)(36756003)(316002)(66476007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UxAeJltnFHAK35GRKEGS95Vr0ZHKgZYWenAR9QU79cwratFf8eeDGdoOY4mw?=
 =?us-ascii?Q?Q6WFvn5CB/T1FZJaOpL1O05aoMUFw2fcSVhUJqyRPL45NcFooHR6QHWpdkZ8?=
 =?us-ascii?Q?HGE2W89XY450SeS5bHWuMKYmnZrvqk3HykM7MjcVvvVEs/8zKJMpdqsX0ed7?=
 =?us-ascii?Q?nSf5vyvwVL2vl6j6d2DvKHiHcnpyTOIe77g4Zh9vWCVQCe2vgw+Zg+a9DKLs?=
 =?us-ascii?Q?umeLe9b4TCeHXre7yb/bMVIsyPu4y/0j2QndnCmwvQeUHoEXFAqV8vhrH1YE?=
 =?us-ascii?Q?V72LNZDkOXha3WhD8wJPZeZfk3kVkRqdngMWVqLlMXwxSqxmx0oNZoPDYz2n?=
 =?us-ascii?Q?5URF7f4zEIpcfOV7ggKROx3hyNrh2l/vSiGTuOKqaPtfg2lXYHhx+pFdmlmQ?=
 =?us-ascii?Q?2sfXB4Xoa+ieN/APSP265YkygjoTsSmv4YN0sBK93LRoMhEIh43sYaBpbWCA?=
 =?us-ascii?Q?BmWIS40K9DKiAiXWY9bJ/f6JDncbPnOoqDn4JU164emFpOU0QBOJg/eQUAmc?=
 =?us-ascii?Q?qyO7RfSPC9/PfVnIVZW9we2bj1as1MVlFE6dDxY0plCPB3Os1miabz5dyhox?=
 =?us-ascii?Q?9Ut/SdLPeWU9j21XG2kMeXIUVFdUfogYmZDPvKNQe8Q1jLBg+TJFfxbfaUdB?=
 =?us-ascii?Q?fQaEyECnMP7MW5E1Blz1lSIzpvIA4PvQCILxF5FcjkHOyz4QcnujimJzIzzU?=
 =?us-ascii?Q?4MP7qqIVs/9Z4JXYrJOpptEnT7hjr3ku0DQZmIGymuoRBy/QOhQgyx1JELiC?=
 =?us-ascii?Q?xRXodlZhfbNC01T9TYqicncyiFUMw39uDYABmjUTnlmplSl3hV3OIuQo7iE5?=
 =?us-ascii?Q?ydQcuS8SKHVX07ZELSTiPeJM3Na0dT78p0awUpxmmU/SZk7RLigkdTzh6lJl?=
 =?us-ascii?Q?4zz09Lx0nEzUIRwityuo1YWsItkZ0+i210BzOO1CtR8uKic1lsaEZyvCYHRx?=
 =?us-ascii?Q?vgvEjPjhC486ybZRwmTrDqqlYZPv8U5n4rn+mnrlmnyl0L0fFPICwH8jElir?=
 =?us-ascii?Q?xv8tieHJzYyRXL2p5t7pFyY1bcSXlthg1cZ6d9b12PipbdPPHO3+/bHb8rrg?=
 =?us-ascii?Q?4PrgojpC+WLnsDR6kNf2//Sn6T6Qo8YX7ioQcEHZY6X6/rSclE8N1Xs93cyp?=
 =?us-ascii?Q?lRYHgbD1PZdWcbCugo0bgT0zC0EtVPDqDyWElAF1bJIvMDIcI6cDc3e2vhGq?=
 =?us-ascii?Q?i44yFcOdo+g3sYh6ZhkakXWNFXTOg7ebM6UQB84+ld8o0vRetTo9HygQqMY/?=
 =?us-ascii?Q?Oq4dV6eSCvOtnhScIJ8dw7nn2Uxr93SqG9Q7NAwt2O7h8RFelenI+J261Ypa?=
 =?us-ascii?Q?XPQYSuY7FlF4WHKTBFw7w0Yrb3mj+1Ix3E39jsZTa0GoUbD3dtgB2ZleP8dL?=
 =?us-ascii?Q?vFf8zFJ1GBAQ1c9qRQOmyocEGG8zf4QuBd35MT+9clN7+loll2/4aoXZpDO5?=
 =?us-ascii?Q?DggdDlozvG8k2P0aD8xYz1O2xtSY6NjfFs7zqz82lhnqgiy1JUt+5XKQd0qM?=
 =?us-ascii?Q?Ty7R4OQ61Zf3zNLGzm8oYGqrwnuU4h5NUtXpKwM3001vHTUWl1HoXcBtRugb?=
 =?us-ascii?Q?GBSl4NPq1FKt8wk5weP77qRVJpu6tUF7NNuPeLINfM7V9j0gHIjAYSYG2DCU?=
 =?us-ascii?Q?8RNfw6V4U7qfxF9OGtAerK8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3e5955e2-c314-4bec-84f5-08db9862e8ec
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:58:00.1681
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 h8hrvYBxEnrt4WRA5SUEGkmPvjk9Ckm9CMN+XxVIv9uCHOWuSvsdf7ZElVkceHjvDGTk2ov8SO8J9sWHJFW1pOk6S2jvpXtqOfiGtMM/OgJmpQp+5M832JqVwFXgdITB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8414
Message-ID-Hash: UPARAUWLS6HULJHXCEJUUMMAZP33I2GB
X-Message-ID-Hash: UPARAUWLS6HULJHXCEJUUMMAZP33I2GB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UPARAUWLS6HULJHXCEJUUMMAZP33I2GB/>
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

