Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD32171418D
	for <lists+alsa-devel@lfdr.de>; Mon, 29 May 2023 03:08:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D035E847;
	Mon, 29 May 2023 03:07:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D035E847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685322514;
	bh=NTihPacCARdgs7ZmZ3NZZDQvL2AhsPs6k2G7lqNOfZQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=n/7ih2lL55uc9z3Er15Zz3HNyY33PitOuRm06bJaseWxJ3E0ORg6gt/VMT+/56PAz
	 gH3jMHzt6Q2CozA4ytyw40mq6TiRbosvPoVU4VAqpMMmrrBkCwryyqGVtgGIfx7554
	 4IuJK8B1tw9KwRDh8FR0/MLlvLbUOBGCUBGIzPzA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AAFE6F805ED; Mon, 29 May 2023 03:05:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B0C55F805C3;
	Mon, 29 May 2023 03:05:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BD9D3F805C5; Mon, 29 May 2023 03:05:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2072c.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:700c::72c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BF7BBF8042F
	for <alsa-devel@alsa-project.org>; Mon, 29 May 2023 03:05:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BF7BBF8042F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=QDvh7Ofs
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PrptImtx3krq4bQjJaHHu9vSqGe5RocIS9ziq39fAK1hdF1V/rQZpjTxxyUhQgUiDme+XyFUgQ4Q6W01+xGXVjORzkv1E1FVAq/CysvxayO+Va1lmPLZI7X2zY78QJGPIsf/jkGBNQ9sxq8w97k8M9l4ljdQTx2R8FCgWF4Vxx7tHwbg5oZVL/WaycLkQwHoEceBkq/TBF5eFBjKTMosrCVgin8tkHDCC+Gz35P2UOsHLLpRt0STe7WhaSLS/uKimoVlrs7kLXHj+/EsCdlnmt0PONDTiU51fJYJrRupqP4b3wjGRb30ZfVS1VLna3xYtVnTXnaGxIx2rMLb3RDm8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLM11tDdg/Hyz22W+hCb+fuMD+nqtJa9WRZyjI1olr8=;
 b=kLaMnwEVYrUO1s2RIClbuGQ/ZeGhS5Kj6ji5i8IwHPDxQKDDoKngetIe5VOBD5u80r4Gg7ar23b0Hc+cgk7y0sGdTHvQpHcqWCtjXflMb0LMLQMQxIhNrdzfSsMEjcXXbX1MMQe8h6X8xnZeFzQE0v8InxhozOH23sJj3fbB+i9zIhZ12/T7lIJmVzZYhM4HOVah3MYZAdUcFQgkFys0epVQ1C3TcUaCntYvC5aNRqArr7uoQCY7pgh8rM0YYKZ9ICkxgCM6VX8R3oGVEtzQ1hkMpGQYZtLacWwupx/wJj74WvikBZnkIseAttjs9tF1hMPp3O+t90n2xPBPt8nNuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLM11tDdg/Hyz22W+hCb+fuMD+nqtJa9WRZyjI1olr8=;
 b=QDvh7OfsbAsVVLWUtAPNEglMX6+IEKCegxyzzjta+2vOC8lD/yo3NDPWBXz2GBCsBBSCXD7VNC/Dxxkp4FViR/AdYWaAwoNA+lWmx8r3sJQjBl4xHy4fuZt/iq1WqT5l7G4PEDCUoBuA4X2seX8F/86375IvhIYruwOa6EL90uc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYYPR01MB7952.jpnprd01.prod.outlook.com (2603:1096:400:fe::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.22; Mon, 29 May
 2023 01:05:31 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%7]) with mapi id 15.20.6433.022; Mon, 29 May 2023
 01:05:31 +0000
Message-ID: <87zg5okkva.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: =?UTF-8?B?IkFtYWRldXN6IFPDhYJhd2nDhYRza2ki?=
 <amadeuszx.slawinski@linux.intel.com>, Bard Liao
 <yung-chuan.liao@linux.intel.com>, Cezary Rojewski
 <cezary.rojewski@intel.com>, Jaroslav Kysela <perex@perex.cz>, Kai Vehmanen
 <kai.vehmanen@linux.intel.com>, Liam Girdwood
 <liam.r.girdwood@linux.intel.com>, Mark Brown <broonie@kernel.org>, Peter
 Ujfalusi <peter.ujfalusi@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>, Ranjani Sridharan
 <ranjani.sridharan@linux.intel.com>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org
In-Reply-To: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
References: <87o7m4lzl3.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 17/21] ASoC: Intel/avs: replace dpcm_playback/capture to
 playback/capture_only
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 May 2023 01:05:30 +0000
X-ClientProxiedBy: TY2PR02CA0064.apcprd02.prod.outlook.com
 (2603:1096:404:e2::28) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYYPR01MB7952:EE_
X-MS-Office365-Filtering-Correlation-Id: ea3bcd0d-8541-4dce-d17b-08db5fe0cc32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rHoJ0Vq2cv9/U5A+iRzCdi43aRM4L8fzrag3cx7UMuodnRzN58iEGyfqGO8dunA4P2ifRUkQaUrVbcFxqd/o9Z1LckhcoRwzI57o7ECOhHgdrKGoZJl91yQ5zLVrFt9ottGLx8NLpNS5ZXXF8V1VljCPwHFiOjzi0K9oGutmYmW9OVfZ2qkOfQ5xbW3zQKn1DU3s4Ze6KSH3MRxXaN/zaT2XBh8O2tPzOgSURCkImLQVWVGrgKtegekxHcqVPz2QpDUgtKd+mrl4/oZzAhjtBoBiNjT91GkKB4wHXSxXbegW3+EFZ1iZJJy1ZfgMW597GVzROVx2dZCbVIWyEvrharjOW46EtnARG43031txjZCSwRKhOZ+554HT80RpthyRwHZ7S1GCJhwRhgRFAWsiXQT4hTzHYIkFi24bv7cPJzBzciWl2+i1dR3SCx5ShGbXNCT3hVYfyfMuyAUoA9MsLZ9Hc6/yD1NtUlNTRhr2Lnlf7I5wmZI8/Uy5E76T8NAybplo0yO9xejVWgzA+h6WMtAhu9YtXMoBysvZp7eTjmUUsRSQqR3wxuUDQfjPu/JV91DjflgrZxcoK4jEkcRifANOuSM9MsrQwnw04VWlrQsU+gXfu/I36M4DWPzfJHLCVltG2aIkE4aivS9Tx8kX5w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(136003)(376002)(39860400002)(396003)(451199021)(2906002)(186003)(6506007)(6512007)(26005)(5660300002)(478600001)(8936002)(921005)(110136005)(8676002)(38350700002)(83380400001)(2616005)(38100700002)(52116002)(6486002)(41300700001)(86362001)(316002)(66946007)(7416002)(36756003)(66476007)(66556008)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Bw049m9eVZbn6mMZRGPJ1uHD+p2ZFKlrJVrtT3h/sU9/hKGdgT53rT8wfGJx?=
 =?us-ascii?Q?uNNMWQUa/SyiDwYm6CSmheb80pR4ttznl11wwD9SF5IamVvVC8ATuSfO+o88?=
 =?us-ascii?Q?iXEj02TSg6nDF3VXImh3QZs0fjf7FUZqWAijKDCvkIN/VkzawsG5mjeE2p0v?=
 =?us-ascii?Q?1pzYo9foGmJSSo4KLu9+MrrzCC5dzFtffPOd851OmKxIcONMPDaTPS6AiFc5?=
 =?us-ascii?Q?S8za4u/uYZMt1vF5v7VZPLpg2ePjJ4OuCk/K+06zJ3/nXHGTkOuPUHgIhnLm?=
 =?us-ascii?Q?/NC8zidDyKOVxBzBNlx2TeGll3ZZ1cyNSIqdG37/XD42TjJMXJHIAT4V/12W?=
 =?us-ascii?Q?mCdZVHxGJWM2DjXPFW/3UWnIveqHv+vjMbB82hhZKvf4HcXzHINor2vB3Q4y?=
 =?us-ascii?Q?tomJ2yb0c1cJHH/mSbvx0pAgHBMUY+Su9oKc74ro66kYUYUHYM6EuJy3Hg5Q?=
 =?us-ascii?Q?stSlufACwXcBjIaDFzeNEUvjwOBZNuqGjtMC9YoL0xqpumu72dpn6fQsAZ1F?=
 =?us-ascii?Q?VNn4qaqHil7FI9yBNLFMPCEnYafOA6KNrAgYdzCKGXgCzxtbvXfk+d6DNaW5?=
 =?us-ascii?Q?7HOIgoB0WKB6n5Qc69zI6h1g3fjYAk19ojfYdCzNg04jL01tcQ/5Lgpxa1fV?=
 =?us-ascii?Q?k1hJMLuVZF+KAQVaJ7QD5opKV6LG9yp16KSYj6ITp1pzY7PIEMrSkZqs/Aew?=
 =?us-ascii?Q?XrFR78BY5OqZ/JiEkl3U/96iqwWZ7WDOmbrXO9iCY0xr+MQZYTOTrsdF3sX2?=
 =?us-ascii?Q?AlERFXCPc3uu7kyRv3fDhb9BMmPT3zG6OcrB8argcjfPtrSGn5Def4cXnFu4?=
 =?us-ascii?Q?P9nTgsdFvVu80kTy1lqI/GiEcEm87Ko2weSSM0nIJZyH94jtbZWGvQ50DnhL?=
 =?us-ascii?Q?MY4AY+sXReQcB4E5e6U1PUnucPGu/PxhhadEu3a+42SDlCR/gNoT9FbAFmuV?=
 =?us-ascii?Q?/l6LV4+CZt5CUVwn7xo/025rcZgM/AjAOzE2tyoFEvEm5//rLfDYs35P/odN?=
 =?us-ascii?Q?DqPS8zHcCxmCvxpC9fGkrhQfYYzcev1GbH4EiwzMlFNEXuwcomAQrdgMuauT?=
 =?us-ascii?Q?wmQhnvXk8xGlbDAnxP5EK17jIlSHfz6vbYA2a8mr24ZqQ6mYd0cwy97NwzB9?=
 =?us-ascii?Q?76XM4QLvcP/LBYNWKrxG9jK7MeYeT1GfxFakjjA+nRhtFyAb7oq+Wd/cGh4+?=
 =?us-ascii?Q?KrCOPZ/sgtADrG+tGdtliVSGONlcaBrX1vr2CbegfpnJFOOUF/lt6RFwas+G?=
 =?us-ascii?Q?UKsl1aYp5ntCna1sJ2uRxcnD9Ly3CZ/hFAiKiYWm5jT5cPo7xcvmMu2Gx8/Y?=
 =?us-ascii?Q?CkDkUiWyT4gFlzAjvEELS7TauFfIb2wcG8vUdbaaXV2gTqbSinVc1CC0D54l?=
 =?us-ascii?Q?pemRCwl7kTBWOF0zOthyhGB54TQkiOch2TiPtskvkW2yDRyXsPrhE1PsY8pw?=
 =?us-ascii?Q?rL0e/1R7NORm9bzGxcDyNMGH9mBU4QXfP3wpeiV7ISq4xzLebz3GoIUqh6Eu?=
 =?us-ascii?Q?e37pU/zLn1nyg+zloHIGvTH0fVxXAeWX+N1WynfnS7SVRikTljdIappyAJdV?=
 =?us-ascii?Q?K5FMOms1uq2t6rpmrazVgRpVFGnlGPg92ctrmhVH5lpU/WkokMUDj8um9Mp5?=
 =?us-ascii?Q?ZLsbx1bKxFw5b8vtDUP2peQ=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ea3bcd0d-8541-4dce-d17b-08db5fe0cc32
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:05:31.1775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 2lrO068Rfmv7NUezZW/3kJCmzKBgNljlaIwPDKxRnmX1u//NaJz8I/m3AFo6z6APOl+EPXnwOlAydFZKHk8xfnWJRisuVJOZdjiky5XrcA0xMyAxIPce5cp9IZ8Bf5aR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB7952
Message-ID-Hash: YWE3QAFDTITMGLLY265KZSO2R44ZILS4
X-Message-ID-Hash: YWE3QAFDTITMGLLY265KZSO2R44ZILS4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YWE3QAFDTITMGLLY265KZSO2R44ZILS4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc_get_playback_capture() is now handling DPCM and normal comprehensively
for playback/capture stream. We can use playback/capture_only flag
instead of using dpcm_playback/capture. This patch replace these.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/intel/avs/boards/da7219.c    | 2 --
 sound/soc/intel/avs/boards/dmic.c      | 4 ++--
 sound/soc/intel/avs/boards/hdaudio.c   | 4 ----
 sound/soc/intel/avs/boards/i2s_test.c  | 2 --
 sound/soc/intel/avs/boards/max98357a.c | 2 +-
 sound/soc/intel/avs/boards/max98373.c  | 2 --
 sound/soc/intel/avs/boards/max98927.c  | 2 --
 sound/soc/intel/avs/boards/nau8825.c   | 2 --
 sound/soc/intel/avs/boards/rt274.c     | 2 --
 sound/soc/intel/avs/boards/rt286.c     | 2 --
 sound/soc/intel/avs/boards/rt298.c     | 2 --
 sound/soc/intel/avs/boards/rt5682.c    | 2 --
 sound/soc/intel/avs/boards/ssm4567.c   | 2 --
 13 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/sound/soc/intel/avs/boards/da7219.c b/sound/soc/intel/avs/boards/da7219.c
index 1a1d572cc1d0..435b3a4f7a54 100644
--- a/sound/soc/intel/avs/boards/da7219.c
+++ b/sound/soc/intel/avs/boards/da7219.c
@@ -173,8 +173,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->exit = avs_da7219_codec_exit;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/dmic.c b/sound/soc/intel/avs/boards/dmic.c
index 90a921638572..620ac4f07206 100644
--- a/sound/soc/intel/avs/boards/dmic.c
+++ b/sound/soc/intel/avs/boards/dmic.c
@@ -22,7 +22,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC",
 		.id = 0,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		SND_SOC_DAILINK_REG(dmic_pin, dmic_codec, platform),
@@ -30,7 +30,7 @@ static struct snd_soc_dai_link card_dai_links[] = {
 	{
 		.name = "DMIC WoV",
 		.id = 1,
-		.dpcm_capture = 1,
+		.capture_only = 1,
 		.nonatomic = 1,
 		.no_pcm = 1,
 		.ignore_suspend = 1,
diff --git a/sound/soc/intel/avs/boards/hdaudio.c b/sound/soc/intel/avs/boards/hdaudio.c
index a542a67e21d0..b2680296440e 100644
--- a/sound/soc/intel/avs/boards/hdaudio.c
+++ b/sound/soc/intel/avs/boards/hdaudio.c
@@ -39,8 +39,6 @@ static int avs_create_dai_links(struct device *dev, struct hda_codec *codec, int
 		dl[i].id = i;
 		dl[i].nonatomic = 1;
 		dl[i].no_pcm = 1;
-		dl[i].dpcm_playback = 1;
-		dl[i].dpcm_capture = 1;
 		dl[i].platforms = platform;
 		dl[i].num_platforms = 1;
 		dl[i].ignore_pmdown_time = 1;
@@ -222,8 +220,6 @@ static struct snd_soc_dai_link probing_link = {
 	.id = -1,
 	.nonatomic = 1,
 	.no_pcm = 1,
-	.dpcm_playback = 1,
-	.dpcm_capture = 1,
 	.cpus = dummy,
 	.num_cpus = ARRAY_SIZE(dummy),
 	.init = avs_probing_link_init,
diff --git a/sound/soc/intel/avs/boards/i2s_test.c b/sound/soc/intel/avs/boards/i2s_test.c
index bc3065c6ceda..e89bc6ccbeaf 100644
--- a/sound/soc/intel/avs/boards/i2s_test.c
+++ b/sound/soc/intel/avs/boards/i2s_test.c
@@ -43,8 +43,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->id = 0;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98357a.c b/sound/soc/intel/avs/boards/max98357a.c
index 183123d08c5a..2e5ef281e222 100644
--- a/sound/soc/intel/avs/boards/max98357a.c
+++ b/sound/soc/intel/avs/boards/max98357a.c
@@ -79,7 +79,7 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98357a_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_playback = 1;
+	dl->playback_only = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/max98373.c b/sound/soc/intel/avs/boards/max98373.c
index 8e221ecd34b0..d728a171a571 100644
--- a/sound/soc/intel/avs/boards/max98373.c
+++ b/sound/soc/intel/avs/boards/max98373.c
@@ -131,8 +131,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98373_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98373_ops;
 
diff --git a/sound/soc/intel/avs/boards/max98927.c b/sound/soc/intel/avs/boards/max98927.c
index 7cccce99f92e..21d8957c7498 100644
--- a/sound/soc/intel/avs/boards/max98927.c
+++ b/sound/soc/intel/avs/boards/max98927.c
@@ -128,8 +128,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_max98927_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 	dl->ops = &avs_max98927_ops;
 
diff --git a/sound/soc/intel/avs/boards/nau8825.c b/sound/soc/intel/avs/boards/nau8825.c
index b69fc5567135..9b983dbacd95 100644
--- a/sound/soc/intel/avs/boards/nau8825.c
+++ b/sound/soc/intel/avs/boards/nau8825.c
@@ -207,8 +207,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_nau8825_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt274.c b/sound/soc/intel/avs/boards/rt274.c
index 6a1e121f082f..7b7251a0bb07 100644
--- a/sound/soc/intel/avs/boards/rt274.c
+++ b/sound/soc/intel/avs/boards/rt274.c
@@ -180,8 +180,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_rt274_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt286.c b/sound/soc/intel/avs/boards/rt286.c
index 3551a05bd599..a6e1395d62a4 100644
--- a/sound/soc/intel/avs/boards/rt286.c
+++ b/sound/soc/intel/avs/boards/rt286.c
@@ -150,8 +150,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt286_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt298.c b/sound/soc/intel/avs/boards/rt298.c
index 2923f3805bbe..e13d2a5d5976 100644
--- a/sound/soc/intel/avs/boards/rt298.c
+++ b/sound/soc/intel/avs/boards/rt298.c
@@ -170,8 +170,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt298_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/rt5682.c b/sound/soc/intel/avs/boards/rt5682.c
index b2c2ba93dcb5..5e42e2b1b82e 100644
--- a/sound/soc/intel/avs/boards/rt5682.c
+++ b/sound/soc/intel/avs/boards/rt5682.c
@@ -226,8 +226,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->ops = &avs_rt5682_ops;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 
 	*dai_link = dl;
 
diff --git a/sound/soc/intel/avs/boards/ssm4567.c b/sound/soc/intel/avs/boards/ssm4567.c
index 2b7f5ad92aca..f9f6aaf957f2 100644
--- a/sound/soc/intel/avs/boards/ssm4567.c
+++ b/sound/soc/intel/avs/boards/ssm4567.c
@@ -120,8 +120,6 @@ static int avs_create_dai_link(struct device *dev, const char *platform_name, in
 	dl->be_hw_params_fixup = avs_ssm4567_be_fixup;
 	dl->nonatomic = 1;
 	dl->no_pcm = 1;
-	dl->dpcm_capture = 1;
-	dl->dpcm_playback = 1;
 	dl->ignore_pmdown_time = 1;
 
 	*dai_link = dl;
-- 
2.25.1

