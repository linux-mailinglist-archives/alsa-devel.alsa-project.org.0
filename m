Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5AA76C1B8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 02:56:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 89E576C0;
	Wed,  2 Aug 2023 02:55:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 89E576C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690937766;
	bh=Rl0vPfr354uiEILcwCWQ8WcbK0lPr48/v2ssA0yEXh8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uHswqlDVmq/7+z20aYUSOGFhY5UeEiNBpnhofGVpt1U/MHYlmphjBRSHUbnIPbpzz
	 pulqQssGcELY3ibevk4S4GhH2CYL7hxDWOvrxGy578IST4wjwnpMoVqsKjrY/Dkkr3
	 nw/nx3AH6Z6mxyQFUDmuiFJmt647ySNxNS9yCukk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 989FBF805C7; Wed,  2 Aug 2023 02:53:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D380CF80567;
	Wed,  2 Aug 2023 02:53:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D7917F805C5; Wed,  2 Aug 2023 02:53:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20705.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::705])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A731AF80551
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 02:53:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A731AF80551
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=eYa289Q0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VnFbksUDwSeQg6kgCtjAdwwJsCn4YIdTpI6HtQCo85Prs/iAR1L7cczdeAJjNfSMU4wI4n0rZS/ylkuZnu/bP1XmK2Sq/Q9jPBIV66u6oCHxWJxF90cJ41Y9LU2Wo5qs54BeYRcXviYWjhTFDbCvr98ZL9AXNcZdQqoQtaVQlFrRyd+3Zb6isHP3NOijVu5mqLfLGY8ty9jcHgrECG5hkZViBt23y5TIZ7/MuJnixzKvy5wMKx0ojj3wCOcW847kDpYQTMSy5QgjeLGQHN/WOnvv7zhr80P3Kco1oOr0XmkeXWs4Os9YGcA9k4fIMdt22afTksFFBe2FVezvr/9BJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fFsMrQ2uQlW7xeEb6enRHp02paM++q4BNrm/b0KUV2E=;
 b=SKaEOavnVJxSZ5AuTrC95j/00rrPK0ldKBjldYk50bzgV9aSeHiZzH7CqdTmvirWraN/QwjAAtXf0a0efOo8zgJHYzV4CFSE+qklGdQQjK5yFN6x1ktpIEcKWFxazQq+ua1cJLkLDwXVklohbGmBiQeLpg7QYf0zI8XZEbhh5yNEd0oyhlkBojioAL3KRFi3Q61eSKIUM12kt9bq0gfdiCWKwiSmuN1E5ul91BKg2dN7AKAVba6xXA6Uif+II/G9RRHhb5He/2tkiiKSkyf8ihtt7V7A5sNICAfnZceJpL5St3gVwgEx+uMcZCp+y5A5P63pBZs5ttr73jzS2sik7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fFsMrQ2uQlW7xeEb6enRHp02paM++q4BNrm/b0KUV2E=;
 b=eYa289Q0Wd1cSfwVBMXShrk7MPJtno/AhoapqdhlmfMgdbLZB07KqOTwWK7p2YUUTpaiLkFRkZwDf2mCo/9VgNzOcgbR+FpDHYTbcnIR65mteZe2XBdlz5+TcDgvPSFIwpnd+fV+tVqQQB3vVVNMsCFcFM4vUmZdobSUq/eLke0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB9381.jpnprd01.prod.outlook.com (2603:1096:604:1cd::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 00:53:34 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 00:53:34 +0000
Message-ID: <87v8dytgc2.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
References: <87a5vauuzg.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 10/38] ASoC: img: merge DAI call back functions into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 2 Aug 2023 00:53:34 +0000
X-ClientProxiedBy: TYAPR01CA0096.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::36) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB9381:EE_
X-MS-Office365-Filtering-Correlation-Id: e13a0b81-e2d2-4035-0f87-08db92f2e623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	L0JNIHZ0HNbrdCpZJglG7N3+AwX761YiYjey7vbwveosY7ZGfH71WEq1YyvJgrfk03NL6FJQUYfzZtrsLds1B8sdXIdayPXZO4vSfyROg4+pVvXqB0yFDYXwGJxtdVnRHnao9r9asnKcA74XCsuadWWkyuVX6cGw1beids0og0A0zPsXoQehoCxaH2iMjo0or9UbAZbLcoMuwbaLumbMKSVucmaD2c8O8QDrCrg/tTkVoiI2iS1VJHOToSll/vWXU8da/Dn7/8sm+kvn1ev5lx1XrjT41nUUFeME0ZrjPN7PM8e4O4F20a27vIHL3hzi8AtdmlWx+qFixVpfr2sHVw8ggYR5UMVXxfTsUYd37igohKG5J1sNMHHutY5KknWqOwu/LbTwjhvUOM0kkuhzkI+Mw/JjvwpXAsUl0xfH9ToAi5iI5684RoQ2s0KtZg11JuDzmpiNxOK2vylsNuVwM0zBNcTVPe9FSOZ1H/B695JR3rXuI+aV0/5FuCENRpcy++xrUg+B5DrvobC8hpdYfypKSRIvXnjl/TabFnmM71xJ9MGczDgScA6MSvyHludTt4pxojdaEfGwfRxg4bf3RHah1q1F388HFrQJKPcDUzWCTiuxe/CkcYfHCwqHzBgj
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(38350700002)(66476007)(66556008)(66946007)(2616005)(83380400001)(4326008)(316002)(6486002)(52116002)(6512007)(110136005)(478600001)(186003)(6506007)(2906002)(26005)(86362001)(36756003)(41300700001)(38100700002)(5660300002)(8676002)(8936002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d2/j45wMh/MMkGJ8tHqVD35/shq/oBVB8WthC57VdaTdfCUURVMKDFmHUqXG?=
 =?us-ascii?Q?8GRMW4ujugsVlENgOuyreadEHWlmhyw8sKQuQrjzTvKZIeCWSf4xi3V3c9Gf?=
 =?us-ascii?Q?uDD2YXHOiu8EiDKAV4T8GLMUejNiydwSiFjM34NVZA0IlxyA8p/aem0Nlfx2?=
 =?us-ascii?Q?RovDOMnujoWXKGgM5WQql1Ib/XZc/LX9Xqszfm+TQmYEdTCVHn6x5jmfFBaR?=
 =?us-ascii?Q?/AQRFI4GKWx2IGAMfs/2MK1xMvVcDGS0r8gte74KHTJMZbFyuTqRr9VvbkqX?=
 =?us-ascii?Q?pxnxLdsMLCMCnJO9zVY9jwkcDagepuBfkrLFwxJumc9aPpqkk60yY0cXQprz?=
 =?us-ascii?Q?7QAHSHgIq6HFBR2TL2THU6h8M396rxPH3cO5P6cbEzOGmOuUvK5qo3GnXse9?=
 =?us-ascii?Q?GxCHPuibXNjxLXslg9MPw3WD1fXUvQlrMdDOSyDldN8X1HlYhIuUYwEDOo/Q?=
 =?us-ascii?Q?Fd7GtTMdZVuwGtZUcp+5K6DEdOnzXtH3wmWAQNRQUX5lOvRpc2gsiapZlk8i?=
 =?us-ascii?Q?NmaRM8B2AeHj3MDXs86QDZCctwv95YFjVUmo9vLNzwbuC/R8hnYMc+8KrBnv?=
 =?us-ascii?Q?IKi11MY122Rd7HkfLhaFOFm810YSWgzrq63YMCGQUL8QRifK04HLVYoHRtT1?=
 =?us-ascii?Q?Nw5TnvNEdlnO3vmuzy3HQm1g9nyFm3vdw8S4jcICLYXfNN1QRol+cRVW5hAa?=
 =?us-ascii?Q?S04f/qLG9XaupKd2EkKWJcyxjiH8XnSd51LVxy8leTLMsoCliu8DwNYUYDnq?=
 =?us-ascii?Q?hhkziX1k7F2pLFZ28rEFMs7JRJIskPEeX/NXaKnTd78+8vXDQmEUhBsB3qCY?=
 =?us-ascii?Q?+ydLcqQbehNDtAPepSi5m077wUzDe9f8bIRvBP2U2DHnQE0c+VJ8oTfxVUyx?=
 =?us-ascii?Q?1JknmMsCMabE+8lDIz+3tFcnEJCRaT08oegT0qpbHcljS+wYrJT4y7c8bPIH?=
 =?us-ascii?Q?3fSxiYjcFqJO8S5CKZZc/IeM2ADjxDSE1OThG/vq9DM07dzAo/M+LZRufXOm?=
 =?us-ascii?Q?422U4sZzBDzFAE3b7lPjkYlKvKcoLpRET8aDXDIfvmg/xWonSygSXnwM+iKn?=
 =?us-ascii?Q?ZvABAVoenLuabYgteUBPO9v9OTq2IfjEp3qvxD0dfgbjs0rJbq/H098YTkfm?=
 =?us-ascii?Q?mZ8l1nyXiigCh6jJlu2fR3AhC5iZXYN7TGvO32b4WfqxbSazEmKq5Vg4Jaj7?=
 =?us-ascii?Q?EcpkAqdu03Gr1KkfaH3SJj21iQGBTB9ccglXEttOWlPMbrxRTfC39SRKAxb4?=
 =?us-ascii?Q?DngOC5S8YvSXpD9r/qC7kViymX3hBNZyFdHg72KzA3oUxW/3uHbwgOYDNPBv?=
 =?us-ascii?Q?wDC8GnWoIn42vq5scuZLSH4C8OC0quDjfCKKiVFdLNqOfjYmq0ZHWTy21cRs?=
 =?us-ascii?Q?cUol44VaYro2m9E5Ic15uSsTuBxKWGINzbAUX2l0lKrunNlj3MV81uOCIZHL?=
 =?us-ascii?Q?9Fmxrn1IyhTv48WEPhyc1lThvLdAkKpI4OYZ0ABo5wE5lZth+yl5Qe5n932r?=
 =?us-ascii?Q?2bJqGm51mnqqX1/57cw+YXJxfYVbS1OxQOgAtE3erMJH3D6sY8XxxHK3SK5l?=
 =?us-ascii?Q?y40pdink2VDRhRN1sUqBem08t/TejREev1G6FCdNu+xsXFBLcRZZE2XqmaID?=
 =?us-ascii?Q?g01fYUkugcA8WdBZWqzqnDM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e13a0b81-e2d2-4035-0f87-08db92f2e623
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 00:53:34.4882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 3eqWMQuqtTXqIVxXKqJQ5GnpsLyFeWnMJqNX0yAbkClS+F13v4Jwg7HwKd15jTghGM15Iz3/LE5aEAYB8yXb9JTd3d7N21g+GEnCbhjywNpO3gYBK2ymEXdALtPVEifR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9381
Message-ID-Hash: UFY4LG3WSUOTSLHGAES4GPKENKCATG7F
X-Message-ID-Hash: UFY4LG3WSUOTSLHGAES4GPKENKCATG7F
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UFY4LG3WSUOTSLHGAES4GPKENKCATG7F/>
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
 sound/soc/img/img-i2s-in.c       | 14 +++++++-------
 sound/soc/img/img-i2s-out.c      | 14 +++++++-------
 sound/soc/img/img-parallel-out.c | 14 +++++++-------
 sound/soc/img/img-spdif-in.c     | 12 ++++++------
 sound/soc/img/img-spdif-out.c    | 12 ++++++------
 5 files changed, 33 insertions(+), 33 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index b7ab8467b5cf..b6b6339c164b 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -370,12 +370,6 @@ static int img_i2s_in_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops img_i2s_in_dai_ops = {
-	.trigger = img_i2s_in_trigger,
-	.hw_params = img_i2s_in_hw_params,
-	.set_fmt = img_i2s_in_set_fmt
-};
-
 static int img_i2s_in_dai_probe(struct snd_soc_dai *dai)
 {
 	struct img_i2s_in *i2s = snd_soc_dai_get_drvdata(dai);
@@ -385,6 +379,13 @@ static int img_i2s_in_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops img_i2s_in_dai_ops = {
+	.probe		= img_i2s_in_dai_probe,
+	.trigger	= img_i2s_in_trigger,
+	.hw_params	= img_i2s_in_hw_params,
+	.set_fmt	= img_i2s_in_set_fmt
+};
+
 static const struct snd_soc_component_driver img_i2s_in_component = {
 	.name = "img-i2s-in",
 	.legacy_dai_naming = 1,
@@ -468,7 +469,6 @@ static int img_i2s_in_probe(struct platform_device *pdev)
 	i2s->dma_data.addr = res->start + IMG_I2S_IN_RX_FIFO;
 	i2s->dma_data.addr_width = 4;
 
-	i2s->dai_driver.probe = img_i2s_in_dai_probe;
 	i2s->dai_driver.capture.channels_min = 2;
 	i2s->dai_driver.capture.channels_max = i2s->max_i2s_chan * 2;
 	i2s->dai_driver.capture.rates = SNDRV_PCM_RATE_8000_192000;
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index fe95ddfb8407..41ea5ba52181 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -376,12 +376,6 @@ static int img_i2s_out_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops img_i2s_out_dai_ops = {
-	.trigger = img_i2s_out_trigger,
-	.hw_params = img_i2s_out_hw_params,
-	.set_fmt = img_i2s_out_set_fmt
-};
-
 static int img_i2s_out_dai_probe(struct snd_soc_dai *dai)
 {
 	struct img_i2s_out *i2s = snd_soc_dai_get_drvdata(dai);
@@ -391,6 +385,13 @@ static int img_i2s_out_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops img_i2s_out_dai_ops = {
+	.probe		= img_i2s_out_dai_probe,
+	.trigger	= img_i2s_out_trigger,
+	.hw_params	= img_i2s_out_hw_params,
+	.set_fmt	= img_i2s_out_set_fmt
+};
+
 static const struct snd_soc_component_driver img_i2s_out_component = {
 	.name = "img-i2s-out",
 	.legacy_dai_naming = 1,
@@ -504,7 +505,6 @@ static int img_i2s_out_probe(struct platform_device *pdev)
 	i2s->dma_data.addr_width = 4;
 	i2s->dma_data.maxburst = 4;
 
-	i2s->dai_driver.probe = img_i2s_out_dai_probe;
 	i2s->dai_driver.playback.channels_min = 2;
 	i2s->dai_driver.playback.channels_max = i2s->max_i2s_chan * 2;
 	i2s->dai_driver.playback.rates = SNDRV_PCM_RATE_8000_192000;
diff --git a/sound/soc/img/img-parallel-out.c b/sound/soc/img/img-parallel-out.c
index df1291ee2b3b..815e68a7048c 100644
--- a/sound/soc/img/img-parallel-out.c
+++ b/sound/soc/img/img-parallel-out.c
@@ -174,12 +174,6 @@ static int img_prl_out_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	return 0;
 }
 
-static const struct snd_soc_dai_ops img_prl_out_dai_ops = {
-	.trigger = img_prl_out_trigger,
-	.hw_params = img_prl_out_hw_params,
-	.set_fmt = img_prl_out_set_fmt
-};
-
 static int img_prl_out_dai_probe(struct snd_soc_dai *dai)
 {
 	struct img_prl_out *prl = snd_soc_dai_get_drvdata(dai);
@@ -189,8 +183,14 @@ static int img_prl_out_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops img_prl_out_dai_ops = {
+	.probe		= img_prl_out_dai_probe,
+	.trigger	= img_prl_out_trigger,
+	.hw_params	= img_prl_out_hw_params,
+	.set_fmt	= img_prl_out_set_fmt
+};
+
 static struct snd_soc_dai_driver img_prl_out_dai = {
-	.probe = img_prl_out_dai_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
diff --git a/sound/soc/img/img-spdif-in.c b/sound/soc/img/img-spdif-in.c
index 558062a1804a..9646e9d3f0bc 100644
--- a/sound/soc/img/img-spdif-in.c
+++ b/sound/soc/img/img-spdif-in.c
@@ -682,11 +682,6 @@ static int img_spdif_in_hw_params(struct snd_pcm_substream *substream,
 	return img_spdif_in_do_clkgen_single(spdif, rate);
 }
 
-static const struct snd_soc_dai_ops img_spdif_in_dai_ops = {
-	.trigger = img_spdif_in_trigger,
-	.hw_params = img_spdif_in_hw_params
-};
-
 static int img_spdif_in_dai_probe(struct snd_soc_dai *dai)
 {
 	struct img_spdif_in *spdif = snd_soc_dai_get_drvdata(dai);
@@ -699,8 +694,13 @@ static int img_spdif_in_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops img_spdif_in_dai_ops = {
+	.probe		= img_spdif_in_dai_probe,
+	.trigger	= img_spdif_in_trigger,
+	.hw_params	= img_spdif_in_hw_params
+};
+
 static struct snd_soc_dai_driver img_spdif_in_dai = {
-	.probe = img_spdif_in_dai_probe,
 	.capture = {
 		.channels_min = 2,
 		.channels_max = 2,
diff --git a/sound/soc/img/img-spdif-out.c b/sound/soc/img/img-spdif-out.c
index b13e128e50d6..dfa72afa946e 100644
--- a/sound/soc/img/img-spdif-out.c
+++ b/sound/soc/img/img-spdif-out.c
@@ -287,11 +287,6 @@ static int img_spdif_out_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static const struct snd_soc_dai_ops img_spdif_out_dai_ops = {
-	.trigger = img_spdif_out_trigger,
-	.hw_params = img_spdif_out_hw_params
-};
-
 static int img_spdif_out_dai_probe(struct snd_soc_dai *dai)
 {
 	struct img_spdif_out *spdif = snd_soc_dai_get_drvdata(dai);
@@ -304,8 +299,13 @@ static int img_spdif_out_dai_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops img_spdif_out_dai_ops = {
+	.probe		= img_spdif_out_dai_probe,
+	.trigger	= img_spdif_out_trigger,
+	.hw_params	= img_spdif_out_hw_params
+};
+
 static struct snd_soc_dai_driver img_spdif_out_dai = {
-	.probe = img_spdif_out_dai_probe,
 	.playback = {
 		.channels_min = 2,
 		.channels_max = 2,
-- 
2.25.1

