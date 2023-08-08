Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B0F5774EF5
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:06:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 04FB2EB5;
	Wed,  9 Aug 2023 01:05:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 04FB2EB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535961;
	bh=nNDB5lz26BBTR1RTQie0FKYVTw+fdds0H+VciN1FsFA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Y8AToljE6pb0odeSJlf6qWLQF84JkosT4l7FOnT7cHHDDPNd8ASc7a9Njc0WMq22j
	 FTPBHVvTAyD9VhoKxeh3byLttrlT03cYoOeUmMleUyiZeVWIPUaVaUQTQ4SU82nrOw
	 zA+R5xNq+ji4qUhob5cKmnMiGtD0vjqVhRgKrYRg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4BFCDF806C0; Wed,  9 Aug 2023 00:59:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83D56F805EB;
	Wed,  9 Aug 2023 00:59:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DF936F805FD; Wed,  9 Aug 2023 00:58:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id F3585F806BD
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:58:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3585F806BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MHv6qirk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GTqSda8Dz0OQPcO/xYsWUAWAlcV3i06qzKQQ3nvFv60a1MjqgickzJ6loBf6/UaxGYmjVRGOwvXp2iJs67ICW2J1MmNkaNroWUjOXqHditbqAogwXs8Lj+d2Ht1bPu3QLJPYmebfPBkOIHjp+MFs+VczWyUxupCq8lQr+YwU6jqP+8nTVKi1kBsyPLHYUTkWlLAfpM1ZPiuIFs2IrSiXrXAV9iSF5oaXpS16GqHO5eQ0cfmnwez+ntwBeZGUJaPDMBAlctcaOVhmlMhk/ej/kRZ3utUO7hPiFcA56E6hN8ruTaPilu8RJ9FWKoIbvKayeJucKE9JzsRZrpWxZWSMKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQfQReTqENmpM7t8YcWRL1xGpw0PBllD1OSjle4pegA=;
 b=UkIXtsMdl5iE60uICU3zylsv180Ro05SBmY5VzkfatJ7Kjruxdsu3htZTOe+j9FK4q7zVJGjtg7F3boW9ouJUqopaJqraOnaeOngdl8vwX6/YThxbaGe49IY0DvDlh9YZxivQJiKaxi+gVQhMpimOH40LI+RIEDwit9UqKge9RLtYxjf+AAQI/y7ZOWNvo06POmWsXY1yYDy5f4hM96GKX71Sz4gHLSDE1r6NV2ZWNwNJ+4sro94hNe/5BjmcPvYi0nt8Sg/w7zLY9qK/fafkQlwdSe4ZNDPvORfud3FRV9jkOQsCxH8q8YFZQNBRxcCPzWrz+L+33YX9bwzSnqcNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQfQReTqENmpM7t8YcWRL1xGpw0PBllD1OSjle4pegA=;
 b=MHv6qirk7hEvPs5saxolXaflNyFToXbdV2L967gukdj1vqj8emIka/7dWAIeA/OXtLa0hhloesOb7dSW8imSspp6tKAIKd//lY3ATbTWlULKe7xaHQMVAR9ymnijBH+djXEPNZQ29Tc+seanC7SdD3WW+L4nE5TfejqEOVIk+1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS3PR01MB8414.jpnprd01.prod.outlook.com (2603:1096:604:192::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:58:47 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:58:47 +0000
Message-ID: <87h6p99m55.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Charles Keepax
 <ckeepax@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>,
 James Schulman <james.schulman@cirrus.com>, Jaroslav Kysela
 <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Richard Fitzgerald <rf@opensource.cirrus.com>,
 Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 36/39] ASoC: codecs/cs47lxx: merge DAI call back functions
 into ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:58:47 +0000
X-ClientProxiedBy: TYCP286CA0191.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:382::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS3PR01MB8414:EE_
X-MS-Office365-Filtering-Correlation-Id: 086f71db-8d00-4f26-35cb-08db9863061b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/bZRa7qTgIqjLmtq6Zr//bJqb7uPWJU/FP913oLZaYMu5qgdXRmCJ526idbNZT9w27UqscJ4bTdr9qUnhzAVrF07zx9VqrSPw0Hw0Pv8u1urlhxeTeP3ejAaAN/noS1PNBqc8KFdaaD96YCc6nFZtW3tO+wKnJq4gr0db2rIqpoErQms1090fAzfsws4MK2TS9I2EN++Hk+ziq0dwWihvh/hbTdE/chWMESPMBprkXdWhXBds53ELnsZZTt9XY8RWbHFII5HzrRA1sGxfilsKgu1ghD8m1qXK3jVqbIWScuSqICHJHbWqQ9e6MdJt+CMCQde0pQg2XFOirpjafxHgQAlx/fbE4kI0ZP49zg3MoGoJZ849VDrwyCPxb9OPXfPShHP/aeBh9TJq71gahb9XdYW/dAELwDtKVechZA7DRV5kCg4/OqCLuIn1Ml8whbj973S2lhtlZaKEdJrvLurFbIughU18nmQL3jG/3ekgCwDdXcEzRHG/89viUd0PPnqQ2wvWDffykH8Aj4xR0vEStxDMNRd5+m+Ts4ftHW1nmDuFN3goPszU+mHWV1HfVPGCPZb7x2ZpjzZ1cYcWLO7E4s6MHjZdadXjirVpbgHfOGmRZiqXESv6PPJJch/z0fy
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(366004)(346002)(376002)(39860400002)(1800799006)(451199021)(186006)(7416002)(5660300002)(38350700002)(8676002)(8936002)(38100700002)(2906002)(86362001)(52116002)(6512007)(6486002)(2616005)(110136005)(83380400001)(478600001)(66556008)(6506007)(26005)(4326008)(41300700001)(36756003)(316002)(66476007)(66946007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?y5BrNdMlM5mM2uJCC9CCMwz00EEKnZO1nQjgvhZvqyteKvlHQe/u8OWp0i8e?=
 =?us-ascii?Q?vp7EjacqLUgphOO/tZFFr8IQn4+9HdlloDBtobqQGbZUv01z2A+yYFjOWS+3?=
 =?us-ascii?Q?FG3Yb60e4HhUKYxd45Vm9ah107AN6fVYs9I6/1oYrF3Jy9hfEwksmQCI7URi?=
 =?us-ascii?Q?E0ouRolF45ozG9r2dlEVYIYfL8+9KpB+B7uBvjaUx1FwxtGTFBZFgM1JB0PO?=
 =?us-ascii?Q?t90CNUQQMsSZpVpDuKZveyAMIinntKkIAWXfiXz24eVOcfi4oVc6QLYnuOiE?=
 =?us-ascii?Q?SYcPU90Lyt7NEJW+iOQzDe6KMPyD2wzVTn5IuBj9E+lA7xlT3GnkMYlp98s8?=
 =?us-ascii?Q?YSuiLAx6jcSZSoskVA26aVKSz5OfbTx8N8f8SxESjk2vD6g0UXhyfzfQdm5x?=
 =?us-ascii?Q?NTG9vMNYxxw1YXHCJ2fxEKFClHT6gXod9h53dIOUTIJB+WN17d0/N/33b02Z?=
 =?us-ascii?Q?TBEiheGpoCWHpJtwYsrpdiTaavh3K81mUg1t+soAuWr3Y3/Pvxgv3hMMxms4?=
 =?us-ascii?Q?JdsN4sVeVBo7P5Vl8GPxHQGRSE1+fEIl2kjfe+u8qhjn47ipygGx0/Zh3qSt?=
 =?us-ascii?Q?Q2GSAlrUbLpoGCbFOcy9c97DNMISPUIpl/dClqG1hp8zoXYBbLheFjSqAuUZ?=
 =?us-ascii?Q?98pJCzLplKI2ONbWZonMtcOCnB0g2h+1ikfBvoRKw61gRNF/7a4aITCVTXDB?=
 =?us-ascii?Q?aIuVHQmVexyJA2ugAPUmgpArF1X/ZOiqv3IEBsiykgxmgF4s1IuyZERBU4a0?=
 =?us-ascii?Q?aRtlVSLho9HJLwQYxiYROegsaVxzPd9CBDno5k5nQRmoDGZCbrxDGlos+MOr?=
 =?us-ascii?Q?zTIncxV85pCfBfwF5qQwECXTWfp7w/+qri6NX3zWBfgKKWSzE07LhZaRaQIP?=
 =?us-ascii?Q?lEazDujurvj1vLeyzmVT1Ta/l3oGs5n+9qGJdNZ6AdfcAuh+WbVNc8MFjfyI?=
 =?us-ascii?Q?AGReQ1m2ZinG/oCGBGq0xqpsTjAZS3wiRgHfwfB8ghNQEKSuoolnkZwNnZ2D?=
 =?us-ascii?Q?HdE/3Titk2GdJnUpCGRq8LuZRASLBWgJPS5CMkVodJ9pJiuu6st+mvXpeDX3?=
 =?us-ascii?Q?GVyVbNstzuAMnthD7AmcU+4IU0ASS7EeiNOYn10whNM0NMRXdbTYcsiYQgy8?=
 =?us-ascii?Q?e1qSWO7LkKnvST0m/cVDrGnMy+coAsNc/viKH+Lxi2DikGNUozW004QKHaex?=
 =?us-ascii?Q?M+Q1SRF1rGPobly4ypIr4Oml0JE5GrpGbtffHq72x0E1KseY7XvjhcUqBx62?=
 =?us-ascii?Q?3f7b3jKCCl+oBJvWasXyQ11EMhqXrKg8UtmXUXh/ZOIpMzwsGOfeAZL7zECP?=
 =?us-ascii?Q?GrIjU004mUG2fRDZAS9ug/21r/DEHP2MPiGn0PXOpdWW8gV8Iw8+gb1SCGcG?=
 =?us-ascii?Q?+Q0OJIRdDSWAmWkMs6AonV6zHFnmNtmU3vxRtBf1i6g9DzKReIMirIOC7RnA?=
 =?us-ascii?Q?jdtQomRC+cKY2MClN8rTV62k9h5OCIkHBQWwRbUbsio7Z6IJF5Ru32+l/rL1?=
 =?us-ascii?Q?r1a4i+IwsqKal7/QtM2tug+EjuL6ixI3T4c39jna1uB5vY5k8BTKP+QQNPLe?=
 =?us-ascii?Q?X67E5SPoCp7C8/rgHC2unm/hFuzzrGAqH1ne5+QOa7lzPvwgtiuBoaZLYwlN?=
 =?us-ascii?Q?q8mbAdneTuHOwxqz+3c9Qqg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 086f71db-8d00-4f26-35cb-08db9863061b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:58:47.5741
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 6lu7gTqcButgL7pYqpf0np4La5uVFFd2X2wtwRzdxE281MxtHEyzlLoskTgYsKujKJYKFsO7o0iDGE1snmYDOszaF+NiC5eChmRkbCKgGkGuKvqI03hwflP55UenEA+8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8414
Message-ID-Hash: 4RFD36RHSUCAS54LDBO6WOGTFNPPUET4
X-Message-ID-Hash: 4RFD36RHSUCAS54LDBO6WOGTFNPPUET4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RFD36RHSUCAS54LDBO6WOGTFNPPUET4/>
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
 sound/soc/codecs/cs47l15.c | 6 +++++-
 sound/soc/codecs/cs47l24.c | 8 ++++++--
 sound/soc/codecs/cs47l35.c | 8 ++++++--
 sound/soc/codecs/cs47l85.c | 8 ++++++--
 sound/soc/codecs/cs47l90.c | 8 ++++++--
 sound/soc/codecs/cs47l92.c | 6 +++++-
 6 files changed, 34 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index a6538dab6639..1245e1a4f2a5 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1143,6 +1143,10 @@ static int cs47l15_set_fll(struct snd_soc_component *component, int fll_id,
 	}
 }
 
+static const struct snd_soc_dai_ops cs47l15_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver cs47l15_dai[] = {
 	{
 		.name = "cs47l15-aif1",
@@ -1219,7 +1223,7 @@ static struct snd_soc_dai_driver cs47l15_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &cs47l15_dai_ops,
 	},
 	{
 		.name = "cs47l15-dsp-trace",
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index a07b621d463e..cfa1d34f6ebd 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -957,6 +957,10 @@ static int cs47l24_set_fll(struct snd_soc_component *component, int fll_id,
 #define CS47L24_FORMATS (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S20_3LE |\
 			 SNDRV_PCM_FMTBIT_S24_LE | SNDRV_PCM_FMTBIT_S32_LE)
 
+static const struct snd_soc_dai_ops cs47l24_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver cs47l24_dai[] = {
 	{
 		.name = "cs47l24-aif1",
@@ -1033,7 +1037,7 @@ static struct snd_soc_dai_driver cs47l24_dai[] = {
 			.rates = CS47L24_RATES,
 			.formats = CS47L24_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &cs47l24_dai_ops,
 	},
 	{
 		.name = "cs47l24-dsp-voicectrl",
@@ -1054,7 +1058,7 @@ static struct snd_soc_dai_driver cs47l24_dai[] = {
 			.rates = CS47L24_RATES,
 			.formats = CS47L24_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &cs47l24_dai_ops,
 	},
 	{
 		.name = "cs47l24-dsp-trace",
diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index c05c80c16c84..a953f2ede1ee 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1348,6 +1348,10 @@ static int cs47l35_set_fll(struct snd_soc_component *component, int fll_id,
 	}
 }
 
+static const struct snd_soc_dai_ops cs47l35_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver cs47l35_dai[] = {
 	{
 		.name = "cs47l35-aif1",
@@ -1462,7 +1466,7 @@ static struct snd_soc_dai_driver cs47l35_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = &snd_soc_new_compress,
+		.ops = &cs47l35_dai_ops,
 	},
 	{
 		.name = "cs47l35-dsp-voicectrl",
@@ -1483,7 +1487,7 @@ static struct snd_soc_dai_driver cs47l35_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = &snd_soc_new_compress,
+		.ops = &cs47l35_dai_ops,
 	},
 	{
 		.name = "cs47l35-dsp-trace",
diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index dd7997a53e70..827685481859 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2249,6 +2249,10 @@ static int cs47l85_set_fll(struct snd_soc_component *component, int fll_id,
 	}
 }
 
+static const struct snd_soc_dai_ops cs47l85_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver cs47l85_dai[] = {
 	{
 		.name = "cs47l85-aif1",
@@ -2404,7 +2408,7 @@ static struct snd_soc_dai_driver cs47l85_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = &snd_soc_new_compress,
+		.ops = &cs47l85_dai_ops,
 	},
 	{
 		.name = "cs47l85-dsp-voicectrl",
@@ -2425,7 +2429,7 @@ static struct snd_soc_dai_driver cs47l85_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = &snd_soc_new_compress,
+		.ops = &cs47l85_dai_ops,
 	},
 	{
 		.name = "cs47l85-dsp-trace",
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index cdd5e7e20b5d..2c9a5372cf51 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2168,6 +2168,10 @@ static int cs47l90_set_fll(struct snd_soc_component *component, int fll_id,
 	}
 }
 
+static const struct snd_soc_dai_ops cs47l90_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver cs47l90_dai[] = {
 	{
 		.name = "cs47l90-aif1",
@@ -2323,7 +2327,7 @@ static struct snd_soc_dai_driver cs47l90_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = &snd_soc_new_compress,
+		.ops = &cs47l90_dai_ops,
 	},
 	{
 		.name = "cs47l90-dsp-voicectrl",
@@ -2344,7 +2348,7 @@ static struct snd_soc_dai_driver cs47l90_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = &snd_soc_new_compress,
+		.ops = &cs47l90_dai_ops,
 	},
 	{
 		.name = "cs47l90-dsp-trace",
diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index bc4d311d4778..352deeaff1ca 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -1690,6 +1690,10 @@ static int cs47l92_set_fll(struct snd_soc_component *component, int fll_id,
 	}
 }
 
+static const struct snd_soc_dai_ops cs47l92_dai_ops = {
+	.compress_new = snd_soc_new_compress,
+};
+
 static struct snd_soc_dai_driver cs47l92_dai[] = {
 	{
 		.name = "cs47l92-aif1",
@@ -1823,7 +1827,7 @@ static struct snd_soc_dai_driver cs47l92_dai[] = {
 			.rates = MADERA_RATES,
 			.formats = MADERA_FORMATS,
 		},
-		.compress_new = snd_soc_new_compress,
+		.ops = &cs47l92_dai_ops,
 	},
 	{
 		.name = "cs47l92-dsp-trace",
-- 
2.25.1

