Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 420A279B08D
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 01:49:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C7226A4E;
	Tue, 12 Sep 2023 01:48:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C7226A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694476189;
	bh=VuY7W8BiPkIb1xmM1Z9RSlSVK2CfT7vlqXmVtnZSvWc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oByqvopt1bAlsMtBK1DHxtSTL/WYNk6TDFi3qsPEgeRf2HblnvHrNkkF6i8Fn2iuR
	 ktB+OvhqRP/WOYUjeHLPzllNkg3afkre1kH1woW/qRlLZmDWppBwYMcfgKcd0t6c5c
	 fkyAyY5hhSO0WwK0dyEgWiqThLuRVHrn/5wrjHtw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 740EBF8055C; Tue, 12 Sep 2023 01:48:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 97A14F80551;
	Tue, 12 Sep 2023 01:47:59 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C22DF805C5; Tue, 12 Sep 2023 01:47:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20704.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::704])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0945AF805AD
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 01:47:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0945AF805AD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Jp7SdSWd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvLUs+G2Ds49yHQak09Cf/ZheHI+gA3+BH1a1H2tCeXwpfGgfxNRfSD5xUu/FrezP1w6CSXOEipX79yd2jurf4MaYjW6VoNfkk0AkBNEzqVBret7HxU7QPfdUmAgc5+aKLa11AFGcdAiXEbZH1WctgtW96CWq7dWnDejhBbnThQfRzHWnRiQtJJDIw9+eqYfxgzBZvcq3Pn4M0wKFV4XbRUMHhsNvnPWSlooXJB5TgROCPy8ZhrddNayNOIURezkwh4ZDIu5n2kCgEl+INBI0rRFYSDgh9qoTUDY3luNQyZM5QTQoBYdr0bbE7UXXcoZRQGLQ3k343T2OhQQt2QT2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BK9yOsnNYxSMiTtgDy6tw++B3v0jhCdILHhIH3VWIlk=;
 b=NScspBWBdSZiRD4s6QgvfwXXs11N4GwBQ0GJhUsg6HYvPQLtFQR7juoghYXNaTo/e6MP4JQ3HkUdPYv2dx8kVO1Is3yHQgDRHPHyrU5MHtxMq6pZQ2xBwYDSjlXZ66hR441ghABie4h86NBmbhQSDUtveEp4/+thPN7rvHQzRVjX4YffuFwfqoYkEoajd+3EEvUng9x/ZQoPEtpfd7oEDgjSZoCN2HUL5Q2WB4hx5DCZp9yGdfd1PqtzSpHECTkSPrmN/ny/pkIFbgb/62Ctoxs/PBtrHPlHU54mD4m1uximGBHsdNZTRLEX2xjOyCepyKo5JRNl4wbBYmvhWOUAeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BK9yOsnNYxSMiTtgDy6tw++B3v0jhCdILHhIH3VWIlk=;
 b=Jp7SdSWdNoDl7HXwtqwUY9AstuOIT2e16awWsxmF8Xq9NtrthYCpM9W1cU0HpEAjRBA4ykH5t3dh+3NCfnMN1LWarrDLYhxMSgQGSOvpNTusFktjD0iV/6vrcVtwdd1vjqjERZPoNceT3uHvABF302YCKw1/qCLMVfgGpFRlM6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB6192.jpnprd01.prod.outlook.com (2603:1096:400:4b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.37; Mon, 11 Sep
 2023 23:47:45 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::8c08:d94c:8e54:9b5d%6]) with mapi id 15.20.6768.036; Mon, 11 Sep 2023
 23:47:45 +0000
Message-ID: <878r9cs25b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>, Alper Nebi Yasak
 <alpernebiyasak@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Syed Saba Kareem
 <Syed.SabaKareem@amd.com>, Takashi Iwai <tiwai@suse.com>, Venkata Prasad
 Potturu <venkataprasad.potturu@amd.com>, Vijendar Mukunda
 <Vijendar.Mukunda@amd.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
References: <87h6o0s275.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 06/54] ASoC: amd: convert not to use asoc_xxx()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 11 Sep 2023 23:47:45 +0000
X-ClientProxiedBy: TYWP286CA0021.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::12) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB6192:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fe6457d-79e3-4036-b81b-08dbb3217f5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AkELPFwBb30WG8hr+oPoghYqvPYpL9N4E0vhj+ySFjeIYuubjasXuJupvm8AvX3k+iizRy8SMknWleN+EDyEVsExY5VFL3sjTwKWwjR564Fe3oUb/o013Sw/uDMrXN7zO1AFYi3pt8bPdeBsU0KeRI1dRoVfVOpWtezZ0uPo4LH688t5oux8MwdFaIhTqsHwq2NWGPRv1N0te0JmryqCmYsndPp7H7HsuCSRrT+Mx6upS8tGwz8T7AEkwXLvUFCTArTO14/rnd70SwPirF8Bv3UZG5SDE0l4tipralvURCmK9+2/4cDgh4mORys8gKzLRp7jng9Mxf92XlKDN0qdWvrZxoKkT2nIw8iwWgy2XJqG1izQ0pb9kIJlW0ClyqxGStteWVFmngy++Xbs48lvvL/wr6Z3/fXPsifcLWyQqERR4i4M5TXqlHqKtknICmjt7b1JYJVgwWpnMcdVA4NB/Zgrge8LvEa1mYVzxU811M7To2Q3DelKFmEp4N8p+Hev40NvA6tMMwtXLVsDh+avQ1os/i4oravEh8CRgaw8z/sw/ye/ljKhPdpe7nOcIN/Oi7n74QMWW5/iSZ+2Pbmb66uBV8onrKsQ7a/M8ep2V0idGIrkJoozcU3xUj7/JaVE/u3k0rvYwHNrcDTlxK49MA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(366004)(376002)(136003)(39860400002)(1800799009)(186009)(451199024)(6506007)(6486002)(52116002)(6512007)(478600001)(83380400001)(30864003)(2616005)(26005)(7416002)(2906002)(66946007)(66476007)(66556008)(4326008)(5660300002)(316002)(110136005)(41300700001)(8936002)(8676002)(86362001)(36756003)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UlpawhZX/p9aW+I4WjyYTawpTNwykhtn+oSSpoXmSIDsxXE8CczT4HyZxlKB?=
 =?us-ascii?Q?R549SOevyB9aGv8b49CFKr5Ri5UaIVf1yRoa9KHWXpwPYyvhlqKJBUbZgwUk?=
 =?us-ascii?Q?qkHGFAZ+rVCemyONNItn9RiAP1ZU2E+n9y5BxFY1T1f3d4JkBuXfGt6vLzsT?=
 =?us-ascii?Q?oId3pkCF2d5PiQdZJb+YCaZ2UBzhEO7bUiCh8cnLxbjvLZi2BjG3QCfjJtz1?=
 =?us-ascii?Q?6fhDLAbTvo4jkXsIBxmiwwzoyjIAI59ouq7cgrnybOnMU82Stinj9rPvQC4N?=
 =?us-ascii?Q?64fpZuChR8t37XIZm9rJ0I9Ab408z5+NOxvux2UCSqBKNZcD5kMQXXeWjF1F?=
 =?us-ascii?Q?piSeI6t2M7TT5gAMRUetCI1wHYpYrZHCLKYwrIdLjwLWgAlz3NKDMNNUSFLZ?=
 =?us-ascii?Q?bIqore7siSNQG1g78VYrPjStOWMrDysaBdeIOHPZ8N2KX2ItAetujmEqiNOi?=
 =?us-ascii?Q?GLzk6vgofE7o6E/lelUtUrw6YsGD5AqxaWV8MX55s+KNinwPtqNqKjh5u1UK?=
 =?us-ascii?Q?nXFhnxWleXkaTAxxXcIqRql/DX7Idy1h8rx0UYfsr1g10YePN3ercgCTOv+o?=
 =?us-ascii?Q?/qDHkXFKPyuyMgv9FSTAo4+pGvPxWg0puySfVvj0x4BsewGiG2P3xp0MymJr?=
 =?us-ascii?Q?ee3agYbOeG12gZBUMoLeBsf5yu+5IkPuyp8PT4db7T8ubpnI+npXNgjUkKSR?=
 =?us-ascii?Q?c7Nm27pzET++3KvWaCqrsqN7wKpiSeVceZgiOWZZd2/ZcVLAsVmkNAGgWyJB?=
 =?us-ascii?Q?l6KUoqPd2Emo7AJczCjZvzFFeaEAAP2U36WS1HGLwym7J0oawk2kHUfN3hjK?=
 =?us-ascii?Q?llO/HQPSdG7xfQONf14qFxYIRpYtQIHbLgc3cppSVS9HASaweF0wAk+kLhh8?=
 =?us-ascii?Q?faKaJUm0NZKwFEwpSCpKnz4N/7F+EwvHiVAS7onzH3lzH0oJgCKSSqJ0utu1?=
 =?us-ascii?Q?1d6XEztpPnP8RUT6xsXtJ+i6bulCP2DgXamjhZ4Qa3KsiZjSWzT02WNEnZoc?=
 =?us-ascii?Q?YIDBkL9CDs3n+fdL4IRaEvuX9IQEgheVo19Xj6eWEeW5181+B0ArMHLB9wdL?=
 =?us-ascii?Q?OfBnMQstNiDEhEpcHrVCUJhdWJzZ2M474qLD5nQcvwFh/p1zHsn+FXJq2ocP?=
 =?us-ascii?Q?PGFyMi1vajJZwyJ19wyN7pVAJimH85QXVTzTPGXrC/tChLceEddpDXKYz5yi?=
 =?us-ascii?Q?aJbY83HK1TumONj/TzcFZWMzARWHFxXsRMxF1dAiWDTyyikgg6hJzzVd3EJI?=
 =?us-ascii?Q?xzdTIdlaJ85S5RGIJmbOeOwjj23rXJ3osP1+pAv/FENp/uM9GC2FbKM+mXsE?=
 =?us-ascii?Q?NlHoXtV+dME2mR5R2lDeU9ga8RFyvViVOSaStkJqEcgh7LCW6WzZdeG1lGSV?=
 =?us-ascii?Q?juVq6wlK107mbZk8grRWOEPqdA3N1D7y7Q6bR5fSHKjaVjRoWxMozjmiNMtN?=
 =?us-ascii?Q?W3bCz+SD7fx9UflxIR0SYJWNjlGgMbTkebSsQtXdEe5vJzrBvIn42N5kYCRx?=
 =?us-ascii?Q?Hm1ZSWB/laXsZ7+PdgagHkBYBznx5UeSmXu5mrK2P9zfdDU7aWBJxv3rbsGd?=
 =?us-ascii?Q?inoU9wKP6orkTJiY2n+tdvgEwRaidwAPFAFx9+r5aiV5ai+8ofaQTAqZfyIx?=
 =?us-ascii?Q?XYiLEm6zMOrhmypR1LAdIf4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1fe6457d-79e3-4036-b81b-08dbb3217f5b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2023 23:47:45.6374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 OJlFW43oaVA1F4x5DMbvGk/e09gW2ppUFwQFiGh4cOVlo8z3xLGpJ0t0IGZLZmfOfHqv95PxRI0CoYBGIXXhBB8dyiWTRC5m9TeSxsFzk4UEd3Pffy3QWLxQta945UcD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6192
Message-ID-Hash: CAEHWYYO7WCA4YPP4J63ZOI6KSWYREI3
X-Message-ID-Hash: CAEHWYYO7WCA4YPP4J63ZOI6KSWYREI3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CAEHWYYO7WCA4YPP4J63ZOI6KSWYREI3/>
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
 sound/soc/amd/acp-da7219-max98357a.c  | 28 +++++++-------
 sound/soc/amd/acp-es8336.c            |  6 +--
 sound/soc/amd/acp-pcm-dma.c           |  2 +-
 sound/soc/amd/acp-rt5645.c            |  6 +--
 sound/soc/amd/acp/acp-legacy-common.c |  8 ++--
 sound/soc/amd/acp/acp-mach-common.c   | 54 +++++++++++++--------------
 sound/soc/amd/acp3x-rt5682-max9836.c  | 12 +++---
 sound/soc/amd/ps/ps-sdw-dma.c         |  2 +-
 sound/soc/amd/raven/acp3x-i2s.c       |  2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c   |  6 +--
 sound/soc/amd/vangogh/acp5x-i2s.c     |  2 +-
 sound/soc/amd/vangogh/acp5x-mach.c    | 12 +++---
 sound/soc/amd/vangogh/acp5x-pcm-dma.c |  6 +--
 13 files changed, 73 insertions(+), 73 deletions(-)

diff --git a/sound/soc/amd/acp-da7219-max98357a.c b/sound/soc/amd/acp-da7219-max98357a.c
index 9e3133bec2b15..84f3d65ba52e3 100644
--- a/sound/soc/amd/acp-da7219-max98357a.c
+++ b/sound/soc/amd/acp-da7219-max98357a.c
@@ -54,7 +54,7 @@ static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 
 	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
@@ -106,7 +106,7 @@ static int cz_da7219_init(struct snd_soc_pcm_runtime *rtd)
 static int da7219_clk_enable(struct snd_pcm_substream *substream)
 {
 	int ret = 0;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	/*
 	 * Set wclk to 48000 because the rate constraint of this driver is
@@ -134,7 +134,7 @@ static int cz_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 
 	dev_info(codec_dai->dev, "codec dai name = %s\n", codec_dai->name);
@@ -191,7 +191,7 @@ static int cz_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 static int rt5682_clk_enable(struct snd_pcm_substream *substream)
 {
 	int ret;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	/*
 	 * Set wclk to 48000 because the rate constraint of this driver is
@@ -245,7 +245,7 @@ static const struct snd_pcm_hw_constraint_list constraints_channels = {
 static int cz_da7219_play_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -266,7 +266,7 @@ static int cz_da7219_play_startup(struct snd_pcm_substream *substream)
 static int cz_da7219_cap_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -288,7 +288,7 @@ static int cz_da7219_cap_startup(struct snd_pcm_substream *substream)
 static int cz_max_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -309,7 +309,7 @@ static int cz_max_startup(struct snd_pcm_substream *substream)
 static int cz_dmic0_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -330,7 +330,7 @@ static int cz_dmic0_startup(struct snd_pcm_substream *substream)
 static int cz_dmic1_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -357,7 +357,7 @@ static void cz_da7219_shutdown(struct snd_pcm_substream *substream)
 static int cz_rt5682_play_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -378,7 +378,7 @@ static int cz_rt5682_play_startup(struct snd_pcm_substream *substream)
 static int cz_rt5682_cap_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -400,7 +400,7 @@ static int cz_rt5682_cap_startup(struct snd_pcm_substream *substream)
 static int cz_rt5682_max_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -421,7 +421,7 @@ static int cz_rt5682_max_startup(struct snd_pcm_substream *substream)
 static int cz_rt5682_dmic0_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -442,7 +442,7 @@ static int cz_rt5682_dmic0_startup(struct snd_pcm_substream *substream)
 static int cz_rt5682_dmic1_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_platform_info *machine = snd_soc_card_get_drvdata(card);
 
diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
index 5e56d3a53be78..e079b3218c6f4 100644
--- a/sound/soc/amd/acp-es8336.c
+++ b/sound/soc/amd/acp-es8336.c
@@ -62,7 +62,7 @@ static int st_es8336_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card;
 	struct snd_soc_component *codec;
 
-	codec = asoc_rtd_to_codec(rtd, 0)->component;
+	codec = snd_soc_rtd_to_codec(rtd, 0)->component;
 	card = rtd->card;
 
 	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0,
@@ -111,10 +111,10 @@ static int st_es8336_codec_startup(struct snd_pcm_substream *substream)
 	int ret;
 
 	runtime = substream->runtime;
-	rtd = asoc_substream_to_rtd(substream);
+	rtd = snd_soc_substream_to_rtd(substream);
 	card = rtd->card;
 	machine = snd_soc_card_get_drvdata(card);
-	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	ret = snd_soc_dai_set_sysclk(codec_dai, 0, ES8336_PLL_FREQ, SND_SOC_CLOCK_IN);
 	if (ret < 0) {
 		dev_err(rtd->dev, "can't set codec sysclk: %d\n", ret);
diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index d41df316da58e..b857e2676fe8c 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -849,7 +849,7 @@ static int acp_dma_hw_params(struct snd_soc_component *component,
 	u32 val = 0;
 	struct snd_pcm_runtime *runtime;
 	struct audio_substream_data *rtd;
-	struct snd_soc_pcm_runtime *prtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *prtd = snd_soc_substream_to_rtd(substream);
 	struct audio_drv_data *adata = dev_get_drvdata(component->dev);
 	struct snd_soc_card *card = prtd->card;
 	struct acp_platform_info *pinfo = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/amd/acp-rt5645.c b/sound/soc/amd/acp-rt5645.c
index c8ed1e0b1ccd0..72ddad24dbda7 100644
--- a/sound/soc/amd/acp-rt5645.c
+++ b/sound/soc/amd/acp-rt5645.c
@@ -57,8 +57,8 @@ static int cz_aif1_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
 	int ret = 0;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 
 	ret = snd_soc_dai_set_pll(codec_dai, 0, RT5645_PLL1_S_MCLK,
 				  CZ_PLAT_CLK, params_rate(params) * 512);
@@ -83,7 +83,7 @@ static int cz_init(struct snd_soc_pcm_runtime *rtd)
 	struct snd_soc_card *card;
 	struct snd_soc_component *codec;
 
-	codec = asoc_rtd_to_codec(rtd, 0)->component;
+	codec = snd_soc_rtd_to_codec(rtd, 0)->component;
 	card = rtd->card;
 
 	ret = snd_soc_card_jack_new_pins(card, "Headset Jack",
diff --git a/sound/soc/amd/acp/acp-legacy-common.c b/sound/soc/amd/acp/acp-legacy-common.c
index ba58165cc6e6f..217b4c89b9754 100644
--- a/sound/soc/amd/acp/acp-legacy-common.c
+++ b/sound/soc/amd/acp/acp-legacy-common.c
@@ -80,8 +80,8 @@ void restore_acp_pdm_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *soc_runtime;
 	u32 ext_int_ctrl;
 
-	soc_runtime = asoc_substream_to_rtd(substream);
-	dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	soc_runtime = snd_soc_substream_to_rtd(substream);
+	dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	/* Programming channel mask and sampling rate */
 	writel(adata->ch_mask, adata->acp_base + ACP_WOV_PDM_NO_OF_CHANNELS);
 	writel(PDM_DEC_64, adata->acp_base + ACP_WOV_PDM_DECIMATION_FACTOR);
@@ -192,8 +192,8 @@ int restore_acp_i2s_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *soc_runtime;
 	u32 tdm_fmt, reg_val, fmt_reg, val;
 
-	soc_runtime = asoc_substream_to_rtd(substream);
-	dai = asoc_rtd_to_cpu(soc_runtime, 0);
+	soc_runtime = snd_soc_substream_to_rtd(substream);
+	dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		tdm_fmt = adata->tdm_tx_fmt[stream->dai_id - 1];
 		switch (stream->dai_id) {
diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index a06af82b80565..4007e0fc173a5 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -117,7 +117,7 @@ static int acp_card_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	int ret;
 
@@ -172,10 +172,10 @@ static int acp_card_rt5682_init(struct snd_soc_pcm_runtime *rtd)
 static int acp_card_hs_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 	unsigned int fmt;
 
@@ -206,7 +206,7 @@ static int acp_card_hs_startup(struct snd_pcm_substream *substream)
 
 static void acp_card_shutdown(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
 
@@ -220,8 +220,8 @@ static int acp_card_rt5682_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 	unsigned int fmt, srate, ch, format;
 
@@ -342,7 +342,7 @@ static int acp_card_rt5682s_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	int ret;
 
@@ -402,8 +402,8 @@ static int acp_card_rt5682s_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 	unsigned int fmt, srate, ch, format;
 
@@ -573,7 +573,7 @@ static int acp_card_rt1019_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	struct snd_soc_dai *codec_dai;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int i, ret = 0;
 	unsigned int fmt, srate, ch, format;
 
@@ -737,7 +737,7 @@ static int acp_card_maxim_hw_params(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = substream->private_data;
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	unsigned int fmt, srate, ch, format;
 	int ret;
 
@@ -928,7 +928,7 @@ static int acp_card_nau8825_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	int ret;
 
@@ -980,11 +980,11 @@ static int acp_card_nau8825_init(struct snd_soc_pcm_runtime *rtd)
 static int acp_nau8825_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
-	struct snd_soc_dai *cpu_dai = asoc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	int ret;
 	unsigned int fmt;
 
@@ -1142,7 +1142,7 @@ static struct snd_pcm_hw_constraint_list constraints_sample_bits = {
 static int acp_8821_init(struct snd_soc_pcm_runtime *rtd)
 {
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 	int ret;
 
@@ -1204,10 +1204,10 @@ static int acp_8821_startup(struct snd_pcm_substream *substream)
 static int acp_nau8821_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	int ret;
 	unsigned int fmt;
 
@@ -1358,7 +1358,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == RT5682) {
@@ -1395,7 +1395,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == NAU8825) {
@@ -1425,7 +1425,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == RT1019) {
@@ -1457,7 +1457,7 @@ int acp_sofdsp_dai_links_create(struct snd_soc_card *card)
 		links[i].no_pcm = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == MAX98360A) {
@@ -1536,7 +1536,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == RT5682) {
@@ -1570,7 +1570,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_capture = 1;
 		if (!drv_data->hs_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->hs_codec_id == NAU8825) {
@@ -1598,7 +1598,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_playback = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == RT1019) {
@@ -1633,7 +1633,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 		links[i].dpcm_playback = 1;
 		if (!drv_data->amp_codec_id) {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		if (drv_data->amp_codec_id == MAX98360A) {
@@ -1661,7 +1661,7 @@ int acp_legacy_dai_links_create(struct snd_soc_card *card)
 			links[i].num_codecs = ARRAY_SIZE(dmic_codec);
 		} else {
 			/* Use dummy codec if codec id not specified */
-			links[i].codecs = &asoc_dummy_dlc;
+			links[i].codecs = &snd_soc_dummy_dlc;
 			links[i].num_codecs = 1;
 		}
 		links[i].cpus = pdm_dmic;
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index 28ad5f5b9a766..d6cdb6d9fdd63 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -54,7 +54,7 @@ static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 {
 	int ret;
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_component *component = codec_dai->component;
 
 	dev_info(rtd->dev, "codec dai name = %s\n", codec_dai->name);
@@ -126,7 +126,7 @@ static int acp3x_5682_init(struct snd_soc_pcm_runtime *rtd)
 static int rt5682_clk_enable(struct snd_pcm_substream *substream)
 {
 	int ret = 0;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	/* RT5682 will support only 48K output with 48M mclk */
 	clk_set_rate(rt5682_dai_wclk, 48000);
@@ -194,7 +194,7 @@ static const struct snd_pcm_hw_constraint_list constraints_channels = {
 static int acp3x_5682_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -212,7 +212,7 @@ static int acp3x_5682_startup(struct snd_pcm_substream *substream)
 static int acp3x_max_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
 
@@ -228,9 +228,9 @@ static int acp3x_max_startup(struct snd_pcm_substream *substream)
 
 static int acp3x_ec_dmic0_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
-	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct acp3x_platform_info *machine = snd_soc_card_get_drvdata(card);
 
 	machine->cap_i2s_instance = I2S_BT_INSTANCE;
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 6230d1b122251..9b59063798f2e 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -222,7 +222,7 @@ static int acp63_sdw_dma_open(struct snd_soc_component *component,
 	int ret;
 
 	runtime = substream->runtime;
-	cpu_dai = asoc_rtd_to_cpu(prtd, 0);
+	cpu_dai = snd_soc_rtd_to_cpu(prtd, 0);
 	amd_manager = snd_soc_dai_get_drvdata(cpu_dai);
 	stream = kzalloc(sizeof(*stream), GFP_KERNEL);
 	if (!stream)
diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 4ba83689482a7..e7f2a05e802cf 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -80,7 +80,7 @@ static int acp3x_i2s_hwparams(struct snd_pcm_substream *substream,
 	u32 val;
 	u32 reg_val, frmt_reg;
 
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	rtd = substream->runtime->private_data;
 	card = prtd->card;
 	adata = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 9538f3ffc5d90..3a50558f67516 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -215,7 +215,7 @@ static int acp3x_dma_open(struct snd_soc_component *component,
 	int ret;
 
 	runtime = substream->runtime;
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
 	adata = dev_get_drvdata(component->dev);
 	i2s_data = kzalloc(sizeof(*i2s_data), GFP_KERNEL);
@@ -252,7 +252,7 @@ static int acp3x_dma_hw_params(struct snd_soc_component *component,
 	struct i2s_dev_data *adata;
 	u64 size;
 
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	card = prtd->card;
 	pinfo = snd_soc_card_get_drvdata(card);
 	adata = dev_get_drvdata(component->dev);
@@ -327,7 +327,7 @@ static int acp3x_dma_close(struct snd_soc_component *component,
 	struct i2s_dev_data *adata;
 	struct i2s_stream_instance *ins;
 
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
 	adata = dev_get_drvdata(component->dev);
 	ins = substream->runtime->private_data;
diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index 773e96f1b4dd6..7dbe33f4b8678 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -95,7 +95,7 @@ static int acp5x_i2s_hwparams(struct snd_pcm_substream *substream,
 
 	lrclk_div_val = 0;
 	bclk_div_val = 0;
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	rtd = substream->runtime->private_data;
 	card = prtd->card;
 	adata = snd_soc_dai_get_drvdata(dai);
diff --git a/sound/soc/amd/vangogh/acp5x-mach.c b/sound/soc/amd/vangogh/acp5x-mach.c
index eda464545866c..de4b478a983d0 100644
--- a/sound/soc/amd/vangogh/acp5x-mach.c
+++ b/sound/soc/amd/vangogh/acp5x-mach.c
@@ -92,7 +92,7 @@ static int platform_clock_control(struct snd_soc_dapm_widget *w,
 
 static int acp5x_8821_init(struct snd_soc_pcm_runtime *rtd)
 {
-	struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
 	int ret;
 
 	/*
@@ -144,7 +144,7 @@ static struct snd_pcm_hw_constraint_list constraints_sample_bits = {
 static int acp5x_8821_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct acp5x_platform_info *machine = snd_soc_card_get_drvdata(rtd->card);
 
 	machine->play_i2s_instance = I2S_SP_INSTANCE;
@@ -165,7 +165,7 @@ static int acp5x_8821_startup(struct snd_pcm_substream *substream)
 static int acp5x_nau8821_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *dai = snd_soc_card_get_codec_dai(card, ACP5X_NAU8821_DAI_NAME);
 	int ret, bclk;
@@ -197,7 +197,7 @@ static const struct snd_soc_ops acp5x_8821_ops = {
 
 static int acp5x_cs35l41_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct acp5x_platform_info *machine = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
@@ -215,7 +215,7 @@ static int acp5x_cs35l41_startup(struct snd_pcm_substream *substream)
 static int acp5x_cs35l41_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int bclk, rate = params_rate(params);
 	struct snd_soc_component *comp;
 	int ret, i;
@@ -334,7 +334,7 @@ static struct snd_soc_card acp5x_8821_35l41_card = {
 
 static int acp5x_max98388_startup(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct acp5x_platform_info *machine = snd_soc_card_get_drvdata(rtd->card);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 
diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 587dec5bb33d9..491b16e52a72a 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -209,7 +209,7 @@ static int acp5x_dma_open(struct snd_soc_component *component,
 	int ret;
 
 	runtime = substream->runtime;
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
 	adata = dev_get_drvdata(component->dev);
 
@@ -245,7 +245,7 @@ static int acp5x_dma_hw_params(struct snd_soc_component *component,
 	struct i2s_dev_data *adata;
 	u64 size;
 
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	card = prtd->card;
 	pinfo = snd_soc_card_get_drvdata(card);
 	adata = dev_get_drvdata(component->dev);
@@ -322,7 +322,7 @@ static int acp5x_dma_close(struct snd_soc_component *component,
 	struct i2s_dev_data *adata;
 	struct i2s_stream_instance *ins;
 
-	prtd = asoc_substream_to_rtd(substream);
+	prtd = snd_soc_substream_to_rtd(substream);
 	component = snd_soc_rtdcom_lookup(prtd, DRV_NAME);
 	adata = dev_get_drvdata(component->dev);
 	ins = substream->runtime->private_data;
-- 
2.25.1

