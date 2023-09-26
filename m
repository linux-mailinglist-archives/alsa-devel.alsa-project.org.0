Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B20D67AE5C6
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Sep 2023 08:25:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D42C8E9B;
	Tue, 26 Sep 2023 08:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D42C8E9B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695709503;
	bh=6+7yar8ebeGia1XrMQKwCNhHx+jh/EZeufXm2xKZ4lM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qZK8gAbO0KnaHCiX/AyAkPNmWu3aSynMmFAkwlM8NjI+UZXwzOpM3M4mfbKgTHAiK
	 +7IV/hX8PV8/Sc+A88m9h4Ry+wv6bhsAjtr5EtM17K1ShOx+7nvVQ1XsJSxakaCg0K
	 1UZ+6oxat2zmVqYQxen60HKhG4FX8ppgbJ23FLgo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03556F805D4; Tue, 26 Sep 2023 08:22:05 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 41B46F805D4;
	Tue, 26 Sep 2023 08:22:05 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53592F805F4; Tue, 26 Sep 2023 08:22:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8E64BF805D4
	for <alsa-devel@alsa-project.org>; Tue, 26 Sep 2023 08:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E64BF805D4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RMRSqmsK
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WzOYlU86UCRWSnv2PiOduleeCX3rYogimLyte1GFOR4tJKLXUP89wgjp5KN6Qjcg6QSyMoySGSWEOx4ikk+yGEQYyc9x4afFqEQjnQgSL//aKv/fp4K/B7ontTVcBSyccCGglnrO1W7ImWn6DD1WLkrmvKB9TGNJAI3435nhdlM8MHs2l3xVWzTzRS6tQofVWU925xySZvxF5KADq5UFE0lVVtxk7Nggk6jznv7m04VppEmT/tyG/nzn1MII50MIfcEWsMHaKXb5RGdMXjEVBrE2LfB8u/iG+pYYRpyzn4lIAVaMh7RQULzJDs0TdX/RWcTEk4Kc0cbFKQJOt0y5Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qeuzCyisUiyei0bV9OjCpFi8xJokfexdPvYgI2vfWFc=;
 b=Lqq4RZxe0oAWXwAnw2lp5uc7N3uL264Ofy9ErKkuYYPzqU5Xg20H0x1sM50fohu5YHjUE7D78AZoweXlYAYO8iaoII0V1k6PlUTdBhVW157J27ugu4zIk11nRG3FHMdCl58lSwDbrwtzoRC4EHarJzRe/iIHeVkiGuQmtADawxfWssnQAPnM+ZBXh4TKO1Wy1QIq4DUYVmjRYgIF2iUSoevp5muz8Xr6w6V6Y4tpThsaziO1nITOylvtPVfcwV3ee/h9WtppMY3TU2N7015TTiDZE3DTKJhybC0kI1a37omHeKvhdRItTVeEdmbng2CX/M7cOdZPDbBSdptovyE5qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qeuzCyisUiyei0bV9OjCpFi8xJokfexdPvYgI2vfWFc=;
 b=RMRSqmsKhWDWhonKKA2d87JANwTSdYWcViscZJxmcMgra+EFZDdsqTOJg4ZtsEaNxv8NuV9WEom1ph+RF7VqxoPN8BuOOT8IalqCQkN9AEAQ8rbVZ2KUKEXSXo0amSX6RVktbBCPvKNOHZZGRucUzoELRLuyAgERKAd10l/g+3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB10426.jpnprd01.prod.outlook.com (2603:1096:400:24e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Tue, 26 Sep
 2023 06:21:51 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d2a3:45df:a180:595c%6]) with mapi id 15.20.6813.027; Tue, 26 Sep 2023
 06:21:51 +0000
Message-ID: <87ttrhh2tc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
Subject: [PATCH v2 14/54] ASoC: au1x: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87edilihhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 26 Sep 2023 06:21:51 +0000
X-ClientProxiedBy: TYCP286CA0052.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b5::13) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB10426:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c4e9f4c-23c2-45c8-ad0d-08dbbe58df66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	7ONvN5sgJBd4v89ciS6X0uh/lWMRA2+6x3pFVXGXTuB/dg8OCQvFZmYRJ7As4WEj4/ojfhnxH6/sZYklHcmXEkcTQVmQdtJgV1CHLT6bzbLdKryjjDUG/pvDgGbTgW4rQDtWHJZQIspaxvKphU0xL/QUwHayXGDW1GFgcXjlUS3R1iNktbW9qBrHoSR2Z/Ujjm8xSZBbcaM0mpow6r1PLY0eaEE3p0mKMTKBQY6pzT0j2CMiKtZt0j61rTSz8rouZGXYowWLcl6FeU1kclHCHyc9r486VoBczgvndvTg80hKzeDBVPKUw+OxlOsFVay+XIp7r+a1ruNCtlupZF0Ku511xwZCO6xFaBOtvmP9ByeqzFFJk1czOXJESvOdl0u/A1W1WaJ9LBQvKgrXojYSXfgJeuRdcihZDayznmuKrEQCzO64ceRFxUwSrSmEZhvP4hNHVP0KpMltJXxg3UQg/lhDUaMKZgVFF1pwEg1J29StRtYkpY1KPUZiaMbId2irk+4Ss7Uj1AeCiKO0CdfW/taA5CpV8misMSbcXxbBXlCvYDAqHsfPxLllPHLBnPTFdIvTLU14FP32vINhbg+SXPf5pQz+NvvVZ7hIapYoxdD0pMcCz4WoT1CqzOOlBmFPPu+s89V6TVwtb3DDol7G+1UQYho5VGkI0AFUC3S9SLM=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(366004)(376002)(396003)(346002)(230922051799003)(1800799009)(186009)(451199024)(6506007)(6512007)(52116002)(26005)(478600001)(66476007)(66556008)(66946007)(86362001)(2616005)(110136005)(6486002)(38100700002)(38350700002)(83380400001)(2906002)(8936002)(8676002)(36756003)(4326008)(5660300002)(316002)(41300700001)(21314003)(32563001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?entpzDOjrgPRgwAjGPxTNnfZ8ejEKr4j6jmmqdJuSvY0NxGyTyCS+PbjYRBr?=
 =?us-ascii?Q?3Oy62/AMSIzmveN90OoYpN4K7ThxhZy7mc6Qq67xA1KWk5gccFCzdl4jhksF?=
 =?us-ascii?Q?2eslY1fYEIF2iV2HUFXG38yEzLn9hURh/chzjwmrrtFi4juQ28Se7CJ0/O5N?=
 =?us-ascii?Q?Qt4Y5TX6rvJa26MscvM1Z1Bg8ptsh9I49T2ADmsKJoDOgTGzfMlHBgFQk+c1?=
 =?us-ascii?Q?se36jAP67giERIPp4itIeQz02MCMBhL73l19gG9FXZPZs5YtagBypPpcxv5U?=
 =?us-ascii?Q?JNmyl/z4qadiDjvbSVZmX74TqICBlo4GqDgTMBINMsW9ufVkmlnRYnoPhuSE?=
 =?us-ascii?Q?9HT0HbiGh4FX6Besg5QV0+9kzelmq+T+4UJc7bYHzvRrIPl0dQkG0RsE0Lhu?=
 =?us-ascii?Q?Kk6j+Z1pHKb38TwwCj40yI34+B5ysLjTyIggnbq3FNDZ7kIp81bGfFL1XKxz?=
 =?us-ascii?Q?qpymvy0UpxYSUp2SQPXkKAaKJk+ok+jRaZ3rzCET+/bBdejimDC5EcmRHrrC?=
 =?us-ascii?Q?AvQnUxFPUXqfmKvuDMJPQNOONHndU1mrnzk/XRo2NmPaY47juoaPPfTwUq8H?=
 =?us-ascii?Q?C2o3NLqMaxHqwTMlO8jDdadxpzNMNBzO/1tlSTrCmzzXVhQdzCCI3atzRYqu?=
 =?us-ascii?Q?XUVIaffctEmGcmWZDh/DFzt7OTqn/gtN15Mo4OdtDHoCnW/0A73Bx4Ve41th?=
 =?us-ascii?Q?hQLE4y5B/jMxl26wyJ7NU9wc7HS1ZNrbmue8GqzSle6GnESHQoafnrlVbXuy?=
 =?us-ascii?Q?3cq01oKwsLKA0+F3wneROkbJZfWYcuFyTMRFiImfnVPhEjtLcn12mmQDuWsq?=
 =?us-ascii?Q?2I38c2jfEv8mSwM9o0CxTdbQbyeqm9GidOYAZZgpSZowQX+laY61wcNbl3Ht?=
 =?us-ascii?Q?mvQgDO0Bbog+iyqLHiGYd5+7Yr3Cuhg+7cgYSd38zzBbD4v8j2y5Bv1qPSpa?=
 =?us-ascii?Q?WgdPsRg3jlSIWX/XFoUaeB5ZkZJJMiHdn6wwHMpREtSg9HqHbNrr/3k5VyGb?=
 =?us-ascii?Q?wiTRnTNj9Dg2Wf4z/dsmCIEPo/8e4oONSJItUVRukq/5ZqcEL6O/qPXDJz+3?=
 =?us-ascii?Q?agh57WdqN5QoZLKXiQFCPwggRon58wXBUnOB7w97bFIIP0VIUtncKDwT+zSW?=
 =?us-ascii?Q?58qq20GgjEX3nwD7mHaawbpAlXhtljEbu+YVD+ew9Zq3S1wLDgzjdIOn74Av?=
 =?us-ascii?Q?OfkhTnPt+UWjNDKeQPjgg/t4QNPl/sffLHNT9i2kGOOruvBrASq1vk6Ms3nF?=
 =?us-ascii?Q?s12aNLTPiYk481N2BQyweUPJThlutGRkGFlrkJrcgoC3ma3m1Gu/pmP31LuF?=
 =?us-ascii?Q?gdltbeask/OteA1fERuO7+NEHoWTHG4pm282o7RKyqG9+ioFOS9q+O2gDNE6?=
 =?us-ascii?Q?oMbVVGsneZoT8UXxlq7VM44Q8iS/N/JF5TnkFSP6D3fNl6gMTw4JgRMFp3/h?=
 =?us-ascii?Q?LLUR6gJabjzQkmqiiLsZHjIAG/dRRPFAMnLoMpNqnqRQZPfOBM5NjRcjaqh8?=
 =?us-ascii?Q?prAMHCiOSua0raWvFwhEEELyKPwfiUAS2vaprWRvPqdKzbK7IgAgk5096Se+?=
 =?us-ascii?Q?OQPmKTn+1x0UuScBNgN0R/u2YJDJrN+hb3DwZ8xh+Rd10uRtaRW6gXEKqSVo?=
 =?us-ascii?Q?xYoMq5QidKJITxw7PsPhAZc=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8c4e9f4c-23c2-45c8-ad0d-08dbbe58df66
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2023 06:21:51.8802
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 yXL3T8QrOsWJnFzfWl3NiXs/PYNoSYgKSZb9AwDnmThq7rs3MoTWxwYQmIKEeTQ9/0dnIdXKpiVFC5JCSS2I3k27Ir2zKoF8MJ39vFiEhvAsYT3NCCSVgewGByN/PC4n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10426
Message-ID-Hash: JT44KLOQ4RKDNPLEIXRLSRTZ6Q3V5CH6
X-Message-ID-Hash: JT44KLOQ4RKDNPLEIXRLSRTZ6Q3V5CH6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/JT44KLOQ4RKDNPLEIXRLSRTZ6Q3V5CH6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ASoC is now unified asoc_xxx() into snd_soc_xxx().
This patch convert asoc_xxx() to snd_soc_xxx().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/au1x/db1200.c   | 4 ++--
 sound/soc/au1x/dbdma2.c   | 4 ++--
 sound/soc/au1x/dma.c      | 4 ++--
 sound/soc/au1x/psc-ac97.c | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/soc/au1x/db1200.c b/sound/soc/au1x/db1200.c
index 400eaf9f8b14..83a75a38705b 100644
--- a/sound/soc/au1x/db1200.c
+++ b/sound/soc/au1x/db1200.c
@@ -94,8 +94,8 @@ static struct snd_soc_card db1550_ac97_machine = {
 
 static int db1200_i2s_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	/* WM8731 has its own 12MHz crystal */
 	snd_soc_dai_set_sysclk(codec_dai, WM8731_SYSCLK_XTAL,
diff --git a/sound/soc/au1x/dbdma2.c b/sound/soc/au1x/dbdma2.c
index 3d67e27fada9..ea01d6490cec 100644
--- a/sound/soc/au1x/dbdma2.c
+++ b/sound/soc/au1x/dbdma2.c
@@ -278,10 +278,10 @@ static int au1xpsc_pcm_open(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
 	struct au1xpsc_audio_dmadata *pcd = to_dmadata(substream, component);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int stype = substream->stream, *dmaids;
 
-	dmaids = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dmaids = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!dmaids)
 		return -ENODEV;	/* whoa, has ordering changed? */
 
diff --git a/sound/soc/au1x/dma.c b/sound/soc/au1x/dma.c
index 7f5be90c9ed1..d2fdebd8881b 100644
--- a/sound/soc/au1x/dma.c
+++ b/sound/soc/au1x/dma.c
@@ -191,11 +191,11 @@ static int alchemy_pcm_open(struct snd_soc_component *component,
 			    struct snd_pcm_substream *substream)
 {
 	struct alchemy_pcm_ctx *ctx = ss_to_ctx(substream, component);
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	int *dmaids, s = substream->stream;
 	char *name;
 
-	dmaids = snd_soc_dai_get_dma_data(asoc_rtd_to_cpu(rtd, 0), substream);
+	dmaids = snd_soc_dai_get_dma_data(snd_soc_rtd_to_cpu(rtd, 0), substream);
 	if (!dmaids)
 		return -ENODEV;	/* whoa, has ordering changed? */
 
diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 5d50ebc2bdd5..1727eeb12b64 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -58,7 +58,7 @@ static struct au1xpsc_audio_data *au1xpsc_ac97_workdata;
 static inline struct au1xpsc_audio_data *ac97_to_pscdata(struct snd_ac97 *x)
 {
 	struct snd_soc_card *c = x->bus->card->private_data;
-	return snd_soc_dai_get_drvdata(c->asoc_rtd_to_cpu(rtd, 0));
+	return snd_soc_dai_get_drvdata(c->snd_soc_rtd_to_cpu(rtd, 0));
 }
 
 #else
-- 
2.25.1

