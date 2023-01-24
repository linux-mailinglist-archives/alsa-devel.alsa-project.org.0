Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B51678DFB
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Jan 2023 03:09:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA927E80;
	Tue, 24 Jan 2023 03:08:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA927E80
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674526161;
	bh=cnZxgJOpDmkVmBcM2TMoQnU/cr23c+Zkl91FHP4lN5M=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sea9oFeL00pYXI5QsyhFyjZ3zwFcSxiexRFN8jvVqPA60iVttqPbtchKluNTRwomM
	 ZcpcpLfVjjPL0wfidfjObYuqOzPfWEwMZeIYSlGCtxwHx1rb0NEsv257hO81Bwgq4e
	 8Ix8WplRZp0X+gYsVCjJJGNrcOGDJyl2/RBI2kP8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1964F80163;
	Tue, 24 Jan 2023 03:08:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DD3BF8053D; Tue, 24 Jan 2023 03:08:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,TVD_SPACE_RATIO,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2099.outbound.protection.outlook.com [40.107.113.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16530F802DF
 for <alsa-devel@alsa-project.org>; Tue, 24 Jan 2023 03:08:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16530F802DF
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dr8D/wjx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fxil9k3p2RJiwpE887RCmUzivVwzn7SS5eJNrhzxeqr9K8v/BRhdA6jvOBR5qgHR43NuC5ldsbn5cFKBfxG2JLIDh+SfbvWKIoW53qTIVk4woeRUnXGt8hLrGcQEmfJ2kc1kWANtAobsnNbwWWgo38ZoJ/BTl5qgNQyO6EsJH18puAW7NOSFtPUG247RCezX53nSkxdb+0YKglaprZF0dC9RiVQfiG9KEdm64TjG4SdPT2dElXJvxLYwTZaRx1hsYpsQBIuP/EV9bTw6wG0uc/3qZyFs5Nm417144O4HYbIQGqYUDjBBRVAKwwBeE0aJm+Q9jWVHh0HetF/SBtyGKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=InVWUW6g4FGe1LJnTolBTyS+unFt/5azc4hxxvd54qU=;
 b=gqCerdXA/RL2+5J4lH27s/sfkslAz0DeLjaa6JLggEI6pnFi0OLQCaznHQS4k7mz6Gjjk2LA7w+M00nMijq/0knHYDTHcCw7+OfB4Z+wfEar5M1Y9C/+avHJjmGCPrvYOXBnOoBl3WXSsBWoYXL4obQKMKgTZ8ezEvVd3cGnuueSqGgDbdNQY7dv6o+hEFRHhO4wQZlwl14GBqNSDgX+ENmtyv7Eei98cR9falIBfFqEIkMNdOv7Sjxf7gViL8oqJlPARytdFEdxst9kssytxW2IPnBl46AvvdX5af5cPWYUU9ZuztUrqXCBz7buOcuUmoDGVdUugY0eqM1iFiD6Yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=InVWUW6g4FGe1LJnTolBTyS+unFt/5azc4hxxvd54qU=;
 b=dr8D/wjxIqjMbrYzu1+fU8J8x1PwsZnBloAgZgyY3cyIOiQofDi6D19TywRwNm1FWGalYH2SuKOoNisR+ra5A8AJ0J6WiEUdWf6Jc5yN7ccXYxmi/LpNjp6jOKUfWJYO0KgzTe7r3VQNsIBfj5T3Y51yF2P5RsXUMTVHnTi2dEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB11738.jpnprd01.prod.outlook.com (2603:1096:400:3e3::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 02:08:11 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%6]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 02:08:11 +0000
Message-ID: <87sfg0u1kk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 04/25] ASoC: soc-dai.h: add
 snd_soc_dai_get/set_widget_playback/capture() helper
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
References: <87y1psu1m1.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 24 Jan 2023 02:08:11 +0000
X-ClientProxiedBy: TYCP286CA0136.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::20) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB11738:EE_
X-MS-Office365-Filtering-Correlation-Id: a9a64718-ae65-4949-b26e-08dafdafd835
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kaX6pMy/ezszPIuP3rEnqhQuYoJEP1IN+xfiBFsQokRDagFh/bGwggghs3sbHk1nSgIUdfQmNt9Xw37fd8eKp9/3syLVUnyE5eEkkpd/r/lvLOPKllPknekgz8qU111GDoEZf/4PQOtwEMHNJTTxR0av7Xy3VD+vV5/kBxTVzWA/W0k+2w3MYJ1Z9OjDEr1sFz5ewf4LVaCgLCcqUE+RdB7/mSevcKSnXgV1r5X612YT8+fP/ScttDETodP9Sw+eX4Gd26uMaaWGBmaurmrHJycT68XGOWrEjtsXIy/dEd5qIq6NvXsCerQlVjQm1uOsTOgo3OetTrEMM3Q9NLD3yMhKME5pX8TpwhKXZM3pVtnEPIv/GHIX+Uz8YXGV/n2up3FHeiikxvuRzThWf73JX3t+1KWdyiaLjVJN4yc7WA2SvD0EjiZs6fJcjaEtmYPlENro9M2dme8NcGUZyFeNHsns+3SsQiBQYEsYlEHOupm4p0hj4hfLfW/ZJ4+qQZUa/w50SkP4ljMFjFgRO6JljZgjJa0WlVVkZDmlJdeFD9R5rAiJ3Ys7ztwhFCnwVpWetHPVYIumMb015C+7tj4UD+jShEKcROASGbtoEiM7I/WEXUq9yaU8exOzoBUJ5Ikb3QT9eE0ZZVChlnm20UfR81pWadgbJ+RpQzlUOVHKoOk+Lxt2/x5x+JdcDMcI0dwFuL/iR3caVvX0REdDr8+Yig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199015)(86362001)(36756003)(52116002)(478600001)(316002)(6486002)(5660300002)(2906002)(8676002)(4326008)(66556008)(6916009)(8936002)(41300700001)(66946007)(66476007)(38350700002)(38100700002)(2616005)(186003)(6506007)(26005)(6512007)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CpNQwUaW0P1wj2yTwmp20dvj5loGahCBLpa0g0hJDSYB5PsOx5DYPzhgntuN?=
 =?us-ascii?Q?QfcwFwryPijq1Xb7alwYeI1Xf9D4hl+6aVHO532adYosztVmY3o5ZcL9Ld74?=
 =?us-ascii?Q?FAsQvzd/0h9bXbwprPjIWwOagYQs5o2PrkLNMOkKz8u/sTyLy7lMJb/I9H0s?=
 =?us-ascii?Q?i3XeR8/uFBWJpeJ0/B4Lof06LZhgRfU3u36Zr32eadt7l2kSTaIRRmPnmGvO?=
 =?us-ascii?Q?ItplwwI49PMFBode+4P53tuBndNwxUMCdnP+x5RwBJbelePV7z4xvyT7wkfm?=
 =?us-ascii?Q?mFqd7F37BWdaoUouOAI4HHCyB8mfy6kFbIEpKdAlUnTs5kiuNIaRhgV+iUAW?=
 =?us-ascii?Q?0MJybyWgIMg248BGmN9Q/DzQsI5uTVeKSeMdcfKY175FVeAMdhBnj8M1mmYx?=
 =?us-ascii?Q?oD5UQ0yDFiNcBQVrnHUCWrbMvGmw0wAbCDOV/1UZm2USAuMyLlXYMGGb2ak+?=
 =?us-ascii?Q?NZtAu5QliJPLWD1CpI/gMfbMP/2AdNK5v48WFLk+VaLeXXAbGlLlot+wEYDu?=
 =?us-ascii?Q?umIWi+xEuYvdy6xvYpNL3wviGZwJqBKegCm8gtoKfiGG6SDmvG0ZwDYXmNZp?=
 =?us-ascii?Q?nMW8+OWgaFZO7GU4I06D77K6UtsLXuRduwMKcwocRuC27Nd46yez+gooKCz8?=
 =?us-ascii?Q?72irLKLxGbUM4gAQ/JnZBVbwdjz+VOAJnzuBnbWbtzHeCwqTXhZdHRgmqgLc?=
 =?us-ascii?Q?f7lKHE03TdkmMVyX9Ew8IPafKRAxljZkDhvrqoa3G5xbDIpSAo6mSxxmh951?=
 =?us-ascii?Q?CfDWch5dUae6t412D7AKUsa7zzR8zLhMRakn3LFTEDp7IrodKGciclinmTpV?=
 =?us-ascii?Q?u1Xd7fZ7eiBlRr6XfHNTRp17ugZJyjtgvtxoRzpIu6Mvo//4c8LZfO305Y+w?=
 =?us-ascii?Q?kt7VOC8GpSyYexbIxlckrN7fL8fy4zFuscgjD6leVC7jUDJlSxRbHQCIxpzj?=
 =?us-ascii?Q?uBT6JgttzKTpaRb/Y+Rf5Q167UjspWfPhPcGxAZHL8i8f3y7IRGY/bPF8k1o?=
 =?us-ascii?Q?j8wzaz6NsF6OCSVUY6IafHuhKkljevOfBl+YD25y4T5ji51NK9e55QKAIQ8x?=
 =?us-ascii?Q?ouKoekWvMW3C4cGGeiDZkApulbE3293VbwoqXJXMeUI3ZkFaRfGjeZEH9k3+?=
 =?us-ascii?Q?fJUijhC8d9Zgbikx2fb7HIt+Lb8YejFX3kiAfml6oa9MG1CtnjMWTBiVJAgY?=
 =?us-ascii?Q?4D/dIdwyEeabaFwILpNC99hIMiKgbccnIRp0V9llwwbBvOIiKhw6O8EjXg84?=
 =?us-ascii?Q?qGA4pv/FhTKgVrQljGyJPIkMELOYpyzMIJDKljCPO8aURseT9+WaoZapXyOh?=
 =?us-ascii?Q?Zs+ATXfXqLIsWZOLGlfNIy9OIBQgiLL8DIXllJ6DvunBf8UKOGfiBlN64NCD?=
 =?us-ascii?Q?KAWhLevGApmnqYYSDRvpCWSTUWWFa1XNnMNcx8u9RIDfK8GYliJK/Jj6afd+?=
 =?us-ascii?Q?bG7ejHexwnOhZTHCiBDM2Mxy9GT/MfvZuitxNEZ5WGzevJbSgkzRoLEyqizu?=
 =?us-ascii?Q?c5gKm9jHSlKs0hKJtRUVHhAMorG9p3FKCvQAry1Sr8pgDW5g97x44al/IiTd?=
 =?us-ascii?Q?chfH16jSCO+zmMmdPW7knl7iTXMeI3jf4pNj/CEcjkSPdUpmn6MXyCR84ZgZ?=
 =?us-ascii?Q?NbjOIA7myDdpEmRgeKvzrAI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9a64718-ae65-4949-b26e-08dafdafd835
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 02:08:11.5944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /qQ7ZcdbrASMMpJY+2bJBYjR0vcVSGRB/5clkjviiGa+evCMqJE2lEA0lQCoeQyhBszVFff9zCjbuOIVj1mKWUfm6xfYLYBknZay279wOkrW1U+XdvbGeY6+/+/7siIm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11738
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

snd_soc_dai_get_widget() requests SNDRV_PCM_STREAM_PLAYBACK/CAPTURE.
This patch adds helper for it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 include/sound/soc-dai.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index 9b18e230e5b3..197dc1629708 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -477,6 +477,8 @@ snd_soc_dai_get_pcm_stream(const struct snd_soc_dai *dai, int stream)
 		&dai->driver->playback : &dai->driver->capture;
 }
 
+#define snd_soc_dai_get_widget_playback(dai)	snd_soc_dai_get_widget(dai, SNDRV_PCM_STREAM_PLAYBACK)
+#define snd_soc_dai_get_widget_capture(dai)	snd_soc_dai_get_widget(dai, SNDRV_PCM_STREAM_CAPTURE)
 static inline
 struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int stream)
 {
@@ -484,6 +486,8 @@ struct snd_soc_dapm_widget *snd_soc_dai_get_widget(struct snd_soc_dai *dai, int
 		dai->playback_widget : dai->capture_widget;
 }
 
+#define snd_soc_dai_set_widget_playback(dai, widget)	snd_soc_dai_set_widget(dai, SNDRV_PCM_STREAM_PLAYBACK, widget)
+#define snd_soc_dai_set_widget_capture(dai,  widget)	snd_soc_dai_set_widget(dai, SNDRV_PCM_STREAM_CAPTURE,  widget)
 static inline
 void snd_soc_dai_set_widget(struct snd_soc_dai *dai, int stream, struct snd_soc_dapm_widget *widget)
 {
-- 
2.25.1

