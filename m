Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A466821D7
	for <lists+alsa-devel@lfdr.de>; Tue, 31 Jan 2023 03:04:58 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49CDFED8;
	Tue, 31 Jan 2023 03:04:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49CDFED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675130697;
	bh=yQepghdZrcvCm7h4uwL/PRBbPFACmaaDrTIVfJGtGow=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=iM7MgcHV2YknECMIGu7qWy08y/z/QpolieMvnL+4KZeDOuaWzdum6Kz6fh638QinE
	 qP/Zc5hsFBZd2iobPoyrJpnfFd3Jt4b68peuAoR/+hDGjNusjk8DxRi6j162HZRJs1
	 khKDzCalPYaSfm3vYrkKhz6ypSyTWQt71ANbl/ZE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09936F80578;
	Tue, 31 Jan 2023 03:01:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3FC0CF805C1; Tue, 31 Jan 2023 03:01:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2071e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::71e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BA00DF8055B
 for <alsa-devel@alsa-project.org>; Tue, 31 Jan 2023 03:01:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA00DF8055B
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Hm17PbLY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NEjSholnOjyNq2tIjwX5v53xvbkmyWtkww+7JKBugTc+rNKc4+Fp+Va+JufyzkotUHmQWNR3MTmjG7w169M8mTSIh5FLTf+7AO6yE7KBCxErhIEZEfsN08Qga1f+l6jD/OY2b8Y03aZkUCUNR8aVsN/Bo0+In5lMOkMkCOKVHR/xGHyREhP1Rg3rvOIGl2c7p4qGnpqyZan0Qnlzi48luHZ4l+iZIXKRbJOiQt/Z7fdcfDYeicJfP4TgnbFMcFgcaNsGpzHk6HedRPJ6ik869b0ww6Th6kzhJl9ZzH0g6m/zYAiUqdvy0qAVw7mQU1lWxqHHNxUG9gvXFT5iDuUuoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KG7siTEsOEZfn7FQUjkFwjTNKSzkDLrUM35wgbsLNZg=;
 b=AjiPJRGFUeLYCZ/T8GjPPI6H6uy2gzM5ahvkvW7aEoQ0EP7YtEtiwXAZIwJCZSKwEaSNTgECUO+08FJJeQNe4W8sJCqYoD2LRwTMhPdmMZq1ffwIn5gRj56a9FpMe66l961kIhYTL4R6bHZLlCYPk1S6Fp57qAWWbnFsQfLF6dr0XHVa75BvRqhc5veuGgVqPMbJ/9238kVOt/T81uwklOazdtrdnYtbwE8MEsMrTdJ7rvHomrPwpn9627kBOSw47Uqbd4X3qSMKuAuJUsiuKc7GaA8DSLc0K5AJ36jdlzC1bF3sQzkzWux7RFZYxYjVJ/495cS1JrHBf6Yjw9rRqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KG7siTEsOEZfn7FQUjkFwjTNKSzkDLrUM35wgbsLNZg=;
 b=Hm17PbLYTaLM8CN/XZyDRFCClzT3cRqbCoOfVTk2f/7db7sSKRcySvCiquulNHM4O/OopmUGDHMpf6sKH+/ND8EyEzDrPcZgEtbvOg7Q7IUx6mg2jTlTCxzvhAT/RDBhbvD6/ti6PuytePZCGlR6xIba3l6tXLu+6mnwoqFbFWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB8464.jpnprd01.prod.outlook.com (2603:1096:400:173::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 02:01:14 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::4b75:8d8e:d89a:7860%8]) with mapi id 15.20.6043.036; Tue, 31 Jan 2023
 02:01:14 +0000
Message-ID: <87mt5zea3a.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 18/25] ASoC: tegra: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
References: <87cz6vfosc.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 31 Jan 2023 02:01:13 +0000
X-ClientProxiedBy: TYAPR01CA0164.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::32) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB8464:EE_
X-MS-Office365-Filtering-Correlation-Id: b223a189-8ec3-4fdc-c3b4-08db032f083d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AubRhJ93DYuCUzQmUv5P95k4AZ8j92LUUHSW6s1+3b+TSpqj2MTArnKXZVhpy82Ec+Ab4Wdb8GztaS1xovMkUB+FP9Mq2KpOOOz9dDrJwxxAqMD16wfwkQPFxCP1M6NXo4PoOfw5L+z0geM9H/wM6LjI6Xvm6hjqyyU/630ArT5L+bz4iddzCyjGBn0zScon0tqqJHkRI+ULgxlI8Zo1G99a93O+rIjto7iKD4ieIDF0NJQaLxJ1FWawO61HEfNoaIdTjsiOKXzqvNmtIuZlrR/DvHSwEq/GarXrUOUwwF5Ou39+bCYe2kLPb+CgC1zp6k8HOaNti22qqUQmJxfDnL+wjnpHK0q5y0lv/dj8uHt3QSA2tp0CoSBM/knRi1eZyi/FqdaDVkxy1GKcFIDP/4Z1QpXlBCuHpbJspLtFFIZXeYyqLKJRQSIckI+VtKC0xL5NJwpcvkagfBveGBatTGH0MV1H/DOyyyvtJ5UC/2bdtnle7YCvmIgxCXUt+akWkBnKixwu/x1CaZj5z8/RlhuXLJsjrRRLbb0not2RXRtl5GRJ2R1wbiaJjP+G6BhJH0RnXcDlNSfXiUg+Mqud42zpJ0OXA7bYD+ALgaQGl4GNLrWBjFpjX+9xZDC0bILZ7WBBdXG00spIcqHWOW5FISqx6R322OORCQ9RqBT1s9Vr2x5cObmYko3MIfiMMNU92wESt9xd7x53Suk8Isxgaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(366004)(451199018)(36756003)(2906002)(83380400001)(316002)(2616005)(8676002)(478600001)(52116002)(6486002)(6506007)(6512007)(26005)(186003)(6916009)(86362001)(66556008)(66476007)(5660300002)(8936002)(41300700001)(4326008)(66946007)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dGPUdsJYYeHzIu948XEc4bIGUenY3iiIH6xvR1lAHnM4gOe4TvBZP2xD2Fnn?=
 =?us-ascii?Q?tYOOr0+5dZ8g8cnZ3+0PrsYk7xfCkPCx+2tdbmfayy1YQnyXMoWHilegMkhl?=
 =?us-ascii?Q?CTQSwjJcWVfSyCY4nrXDSktlMtDfuYftpLymt7nZvu68j9SSh6UrBYBJjKbn?=
 =?us-ascii?Q?ZKIyki1BMYDVeEPZ+R6xMRxtr0YGcSV4rUxk/Frv4EUuG7KqTF9moCJmBfIx?=
 =?us-ascii?Q?jAEsxLkV0wygoOMDK9i9vf2cdVOua3movcy1bh9862M18BHUjZQr1hIHoOBF?=
 =?us-ascii?Q?1yBR4CRKwOcfVHWrN/bvwaW6DGCrkjIOAzCIrdCunItwqMy8PZij9wluzZaq?=
 =?us-ascii?Q?8a0Xwkhm3V6LPUW7rsl/NuWqBqoDwPi3Mq+SaQH/MugbrlCuhvUzzp0/3sCM?=
 =?us-ascii?Q?iP21XPLpw0UlzxWPpYzlMqMWZ8Bvg7IhlvyO5knsKwrIHjxyAE3T0H9eS1/5?=
 =?us-ascii?Q?VqRvWgxzqbb0B896CWXovwjkYy+x5IozyCs8IUby1zEp/l2LuwKJL+4faHh1?=
 =?us-ascii?Q?YqDlmI6x+yUFG5dCqi9Psgv4ZtVAB7/2KTfS6r2yMXW5hOcruXyKjuBcbPyD?=
 =?us-ascii?Q?DSjhRHBpSpHMv4RAZoUB4OtwnGtQa+TGp4LuZC1H1Rxksf3Hhv6RzcQM7rXe?=
 =?us-ascii?Q?QmW/Pv9eW54sc6fY7lZBvODTo3tEEIB40P7JsCA0akD+fswXXMdmPnd5D7ym?=
 =?us-ascii?Q?srhZvVcgZ82liZgh71H9pTpOtOi1ns+ARTDmhd4flJQs+wmf5CU1u1Gmlwrp?=
 =?us-ascii?Q?5djdhHcBCLUntdB/lFNayoXk87rNY/yHbBmWC39aOeZRV3yxmVh3HtH1IVtH?=
 =?us-ascii?Q?78g+ESfkmW8nPqZKayspK5prx08BI6cSOoWp12eEwB77t5orFhGjTt3Q4mPA?=
 =?us-ascii?Q?rXu17S2cOaKFO1nYSK0VF+MUm0C0AhkiatV5kLQJAVxHE8AEq28m0Qk5qvV5?=
 =?us-ascii?Q?O0xzVUk6zjB8mCylCn7+9mrsX4KIi12LbOmJZYS7oa7gOL0MO1VwsIxLu/5q?=
 =?us-ascii?Q?j4SW0RBzpMja+z/R+gW1mDTuDFaH5Sdg/MAOuCfq7TAbNx6gPYuHnzUSiMhc?=
 =?us-ascii?Q?SGTOD77hUD/QQRdBXZO+w8sSb1XHCUW2c7zq7lillw/4uqoW+nS3o2VOff9v?=
 =?us-ascii?Q?BJf9xFbAKeQ2SwyfDFRxQEJ1p0R0GlYJ571P1dxDXbll64GndQJnk0I671Y0?=
 =?us-ascii?Q?Qya71sbhXz2V3QZ9uarScuFNDMTBH4E1fdUxdFv0esiYkVxCQjEBtE2LvyKK?=
 =?us-ascii?Q?St/gpCUmp8fiWaDpRrnAZtdwGERYP74cm9/z243BdWEBYCfUa16otZJNo+It?=
 =?us-ascii?Q?4ktJAJa+l89mkc78gaDJMYFOBdBOs86aAQcNmbfLUCE5RrB8x1/m8rOoaOir?=
 =?us-ascii?Q?ZQeitXuL/E20k53g7/OhVvA8JRS387nSjrxWGvIiVDwQ8LTmqKLUR2JCaF13?=
 =?us-ascii?Q?SksIpb8M+UiyHduCa8KPxoAIl5oY5SYvs7aU3Fa6Dqc6/w/WNLwFKVnqO01V?=
 =?us-ascii?Q?DWiWFqZxOCjEpSJs4+JlJPoK/88JSvSqv8p8jB0uKWYtI9BuAYI9rIyIytGG?=
 =?us-ascii?Q?TVVRugQgEFeGTU7rDI924mMVdwvBbxosSOiRQmZ4M+KerDC+upwCtsASEA8s?=
 =?us-ascii?Q?h7c1suLopKi51gpacclLXP0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b223a189-8ec3-4fdc-c3b4-08db032f083d
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 02:01:14.0762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGr19BjGEpkVTau11GiN9F0j/f2s1a3siY16Rt9XlfBKSKOExdDi9ba7oUILsiUyCRrExdI5gh6yoHZkhU7fxI/SbdAaZWVuGvA2GBhzfB0KSM8eyShOD3MimJYrhtuc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8464
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/tegra/tegra20_ac97.c    | 4 ++--
 sound/soc/tegra/tegra20_i2s.c     | 4 ++--
 sound/soc/tegra/tegra20_spdif.c   | 3 +--
 sound/soc/tegra/tegra210_admaif.c | 4 ++--
 sound/soc/tegra/tegra30_i2s.c     | 4 ++--
 5 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 87facfbcdd11..d23d88a10899 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -212,8 +212,8 @@ static int tegra20_ac97_probe(struct snd_soc_dai *dai)
 {
 	struct tegra20_ac97 *ac97 = snd_soc_dai_get_drvdata(dai);
 
-	dai->capture_dma_data = &ac97->capture_dma_data;
-	dai->playback_dma_data = &ac97->playback_dma_data;
+	snd_soc_dai_init_dma_data(dai,	&ac97->playback_dma_data,
+					&ac97->capture_dma_data);
 
 	return 0;
 }
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index fff0cd6588f5..d37a9f2603e8 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -256,8 +256,8 @@ static int tegra20_i2s_probe(struct snd_soc_dai *dai)
 {
 	struct tegra20_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 
-	dai->capture_dma_data = &i2s->capture_dma_data;
-	dai->playback_dma_data = &i2s->playback_dma_data;
+	snd_soc_dai_init_dma_data(dai,	&i2s->playback_dma_data,
+					&i2s->capture_dma_data);
 
 	return 0;
 }
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index ca7b222e07d0..86bef54dfdf2 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -236,8 +236,7 @@ static int tegra20_spdif_probe(struct snd_soc_dai *dai)
 {
 	struct tegra20_spdif *spdif = dev_get_drvdata(dai->dev);
 
-	dai->capture_dma_data = NULL;
-	dai->playback_dma_data = &spdif->playback_dma_data;
+	snd_soc_dai_init_dma_data(dai, &spdif->playback_dma_data, NULL);
 
 	return 0;
 }
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 1a2e868a6220..100a2b6e6063 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -544,8 +544,8 @@ static int tegra_admaif_dai_probe(struct snd_soc_dai *dai)
 {
 	struct tegra_admaif *admaif = snd_soc_dai_get_drvdata(dai);
 
-	dai->capture_dma_data = &admaif->capture_dma_data[dai->id];
-	dai->playback_dma_data = &admaif->playback_dma_data[dai->id];
+	snd_soc_dai_init_dma_data(dai,	&admaif->playback_dma_data[dai->id],
+					&admaif->capture_dma_data[dai->id]);
 
 	return 0;
 }
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 10cd37096fb3..c26f960c6afd 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -297,8 +297,8 @@ static int tegra30_i2s_probe(struct snd_soc_dai *dai)
 {
 	struct tegra30_i2s *i2s = snd_soc_dai_get_drvdata(dai);
 
-	dai->capture_dma_data = &i2s->capture_dma_data;
-	dai->playback_dma_data = &i2s->playback_dma_data;
+	snd_soc_dai_init_dma_data(dai,	&i2s->playback_dma_data,
+					&i2s->capture_dma_data);
 
 	return 0;
 }
-- 
2.25.1

