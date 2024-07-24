Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FB093AB0E
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jul 2024 04:17:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76CEEE85;
	Wed, 24 Jul 2024 04:16:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76CEEE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1721787426;
	bh=zn771/moilrXhpUqmxmwLeqqx4kEy6PBopJtNZ9ph3w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tycV3BJowsKm8q7wtj4aQL/RMx0P5f16+42bO4paO8P/bAz5PPilx3lqgqO9KuUfv
	 25W67GFSBpPBmqxAEwWhtIcaiO9zHJpSWQ0df5tE/onM52lKSD30YKpn1rFTuSOIp/
	 b76MxcPbuuEKRMdlron8Zc09W7dWh4jyAxlvspso=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 637B9F805C8; Wed, 24 Jul 2024 04:16:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5471AF805D7;
	Wed, 24 Jul 2024 04:16:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C99B1F8013D; Wed, 24 Jul 2024 04:05:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=TIME_LIMIT_EXCEEDED
	shortcircuit=no autolearn=unavailable version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4D228F8013D
	for <alsa-devel@alsa-project.org>; Wed, 24 Jul 2024 03:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D228F8013D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=RikwPchl
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DG2ZCT3VIzR1h6DIPQD1QKxJ4PPNuJ0bZAScsqZxs+6DwAFsyhD2PBKoj+GZrgXFJWC2Slf+JkK+Bqz/thxuq29nsis5kPbCPduUSBexDE7PVlQK8zHnT+oILJQ7HWeHVai7cDr0AwYYrfGofMUOg0TFUTMj6gJQRJY6fD8PJ4bGx/8Ej2Ax0jxGLx/ju0KuTKEOpvqMne0IjjHZ/jre+rUvMoYhVAC0ebfUcCjWI+MNxxMIAovuwOIJo6Lj7rxPiWheM/F94u4XOgkQ3mqKEtH+NOl268JkautUAjntwnxPJsC8SbQwxS8Fbn7Aej/mwvLy7w5k5VkH6GeL0nPr6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgFsZPUoIFmxXlfE+0AaO+UY4LdkhOK8tTUMKORG1Fs=;
 b=Oeo6r8nlxVxYOrNadjZszW2E3d4UjNQ5a3nIhRv4cIX0+Xw4EPSPNZIJmwEC3ML8BrjgC1sgzpdoxGvu5ewFQf66FuPrUvxHc6rlHYHYpuT6Dv1e3+cWgWsTN+5ioTZNo2XeRSGHphglvr2pjPs936GzzsABM0OrbIWDefu6uTwGLGnAEISQ2qfFr6lfuHNjcgAQsPml1nzU39FP4oSfa0hogd7xga0VSfNycc6Fkp2y8tb7y7PzX3zvyUOqcokuvHvzU/0OpztsfZ14yaNVmQ3jst3j7rC+XVSjtDTGFzIIHorZphJrRvQmPjQGP+jlSKjRjv10MZNCSArGu4cF0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgFsZPUoIFmxXlfE+0AaO+UY4LdkhOK8tTUMKORG1Fs=;
 b=RikwPchlaf4ytk9xloWDHuTkHgLRFIFPTSaYwWT80QzvjneH/VVCbehkqwq0DeewOKaEYEn80WtaxJ2B9KOecOdr8emgkgguo1JAzx/MzX32ptNoxBkvChkMQv/AUfCiUkMfj9OaEzEAFwDeXxbXwXc6xFp53ixNZhOZSPeaIZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB10388.jpnprd01.prod.outlook.com
 (2603:1096:604:1f8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 24 Jul
 2024 01:59:50 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7784.017; Wed, 24 Jul 2024
 01:59:50 +0000
Message-ID: <87o76nft2o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 001/112] ALSA: add snd_pcm_is_playback/capture() macro
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Takashi Sakamoto
 <o-takashi@sakamocchi.jp>, Amadeusz =?ISO-8859-2?Q?S=B3awi=F1ski?=
 <amadeuszx.slawinski@linux.intel.com>, Pierre-Louis Bossart
 <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
References: <87plr3ft3q.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 24 Jul 2024 01:59:48 +0000
X-ClientProxiedBy: MEAPR01CA0098.ausprd01.prod.outlook.com
 (2603:10c6:220:60::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB10388:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a553f1b-8cea-4611-56ec-08dcab844d7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?votIYD24UUEB156l0VWQl9txUu+dUhwYvTuxUJxCrpdl0BXgaZu7JCDVaXI3?=
 =?us-ascii?Q?xLd7HHKMLFzhoy3sIkOBUqFtyo0KKOT6O9mzL2V7mvE3W1I/ZpDND8UHVdf5?=
 =?us-ascii?Q?IoEKvm+fad8ggXarrdU0WVD2toejBZOvPgDZpmoZaS535AbirLEIaCVqX07w?=
 =?us-ascii?Q?PX/SytA1nBZd1GSjQnEUuBCAs3EXOxSiyAY/EvacgLElpbxDHwnK2Ymst+7v?=
 =?us-ascii?Q?Ejhm4mCk/qYN51m7h1gP0GhnhxIwu86VLMIAoBckkex0m6EoLceAMVtw6Vwa?=
 =?us-ascii?Q?DdPJviaknNLv2VCoG1GPF+rpH1iyW7vZWtcGWTJTEujdNw+eLPNdmj0rBXrn?=
 =?us-ascii?Q?rWEjUT1Y/tGl/KOKog46anIj/GQThdUtctSa0i8UOJntg/UlNSxzMsg/d2st?=
 =?us-ascii?Q?zKCtJSqfWVwuUQqnGk5CTQEVYIl9BdAMfftoSuxTS2hPsMlzqJUcxnxiDd7h?=
 =?us-ascii?Q?7P/cC6VobXowBouy8RXp5wb10V3yqCAOy31xSZNAXbtjbMj0ub0f4GTHS2kg?=
 =?us-ascii?Q?fiU/8aNtPcBsuEc1/VjG00kNK++5bTqU2fMcIn7af1XzqZpNgrdGqwaSUed5?=
 =?us-ascii?Q?ouguTlEZaikFcd/ulUV7N+ryPJR9rhwhmWCr2eWZbwf3rqFOhrAEiKGMKcGr?=
 =?us-ascii?Q?Ei7wbmwGvikMoppDJff6R2qFtRSc9KXGUci0AufGcGhuWV4PSQ6ZrR5irAJ4?=
 =?us-ascii?Q?UXdUUlxdpkdQ61rTTmCunb34i791tLQKlJ1ian58FyLBvsiNbXS+uHbU9DYJ?=
 =?us-ascii?Q?rvyb12K71lCcGc7/NGR4efLVAArKhRcLuvKAzsjpg6ZSw5XnyAbAhVz4rvhZ?=
 =?us-ascii?Q?a+pkLJhtHS3naEbNSBggWDiA2EMarIaDad6Po4tEQqHKTr180j7Ccp1WkoKg?=
 =?us-ascii?Q?JaMONCUGuCsl1oIpulvlIp9WtiaxGBBWkSxgRRWfOs63CXErNCkviQvg1zbT?=
 =?us-ascii?Q?dJBQT5D89nijkjInvwtuyuOzITnVmvcLiFRwADfkv3naJlutDtCwAWA1DjWA?=
 =?us-ascii?Q?LwFKCmbZ/K+tF6ank9qJSEeN9MSkpbE9k93+3/DMc8k0E8a349hjaa8LuP3b?=
 =?us-ascii?Q?rg3xxzOKvJwX4NbYv2R/IZU+ZA7zY5nYQaPHvYzOgKt3T08m4C8aiVZIrvY5?=
 =?us-ascii?Q?qJAXRy0sKnxvJtCAubWFuyLcotweinNmQby6PKM8ZbjmFbYp8QoY24bxoZTA?=
 =?us-ascii?Q?wMMDIdIxuyGqVBjvGx/FSrrfgcIem3ayk5mMUUHFI5N32JvQXsz6RS7WWm9z?=
 =?us-ascii?Q?5Ut82rNDspUxFwgb9I0j4PPnhfaqnJW3iDZy/u/bLDnvho9UGeP8uzKMf7Fv?=
 =?us-ascii?Q?5Sq0qZMcASWMgyL+DZGVda38POVHolF2n0SK0DN6L0tDWuhXjEkk3Dzr8vRC?=
 =?us-ascii?Q?ykBZutgUer/kR0wQYyZoaL50yP4wloAbG4w8j5PiPEA9+r7R+g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?vfx4+6aM6fRYPH6bniYJ9xZrKCJagjCf6XLUJjUBSdP7ZMV43WTt5nFjiZRG?=
 =?us-ascii?Q?qVLWfk/bPiR9Jq31sUo9Li9l8JT1F0VMyBTq3/i9aBrQGWE3ukhopSUOFQEy?=
 =?us-ascii?Q?wWa0trByXe2Day52kkGgEPv1usin6MxmRABHjcaO8DzES01a91JiEkvx5FX7?=
 =?us-ascii?Q?++P8qxNTMNfUcY5irkjL6/9C7so6j5I5qTjCZGk43bgvcuPSxugpp0fD7To0?=
 =?us-ascii?Q?A+hXnZCFrpZO7VWisF3hR4Cx/X0u9ecOC05HOxdq9C6K+f2fzLCY3k7dyxEb?=
 =?us-ascii?Q?euvsMkjF8sO6yPOqzu8mIk5vMKyybf7Zqen32R4qbYYu/KakxGBC/QIMFX58?=
 =?us-ascii?Q?GECPQeF8w7xWrfTgLyAPo34JZ2ehlqy13qafqwYvecJy2oQH0PnzWxxRZPTr?=
 =?us-ascii?Q?r75TFjJQy4UhcYoGahcApozrwl1pu4PXiL133jImo5gIaqnMM+CFA6ilPSyE?=
 =?us-ascii?Q?kMWncfQ5DQsBwRh2CjucsV6sCFgFTWKYlYiBBAg8II89OSWIZrCRjvYoLhOq?=
 =?us-ascii?Q?Y9LWXD27G8hY9Nvu8rrILBIwqZhxoTET2PjkqJCM32ZpwlWfdI+U8gaBOeyE?=
 =?us-ascii?Q?98keyBVTFeX7Iw49R72uDSE3o5z5oIlDBSbyF4ycd+8o0xc5xTsojoS0DbL+?=
 =?us-ascii?Q?52Urg7e/olYB4Vg2WrTPDSyyI81JxaPbcLcCnif/cG3EL4AFDJwf8hwTu6y/?=
 =?us-ascii?Q?yekP0fAsos7I1b+J5vFq5XEQ8/AvW7TTYXC/oabG4x+t3jy1/LL67V3ymrrB?=
 =?us-ascii?Q?QqAdCycmbg3maP2VfkC1PJsVYHdcoJVbFsx1c+B6RiPW0tYNEeuCziiKxSFN?=
 =?us-ascii?Q?KGKlpDvleFCIvsppwMmJHNghd1DyJB7NXVLXjx2/J7fIFOYEQk4MDLlfF8y4?=
 =?us-ascii?Q?+y8uWgxgpsttFqqIqkH/B7Prbq38ju+LfWYAMhJH1QtGsyWCsNB5hgtGBKlb?=
 =?us-ascii?Q?EFeCz2jqUMTzBKbp67rfSI+v/OxPYFW8V0Qb2u5DuS67WQzo1tw0BX+msMiP?=
 =?us-ascii?Q?CgwBaEMkMWWkm1QgdJZnvhRrQ7UkJpO6HQ+7PKDUkWa6GNG+xd+uJ81d4CCk?=
 =?us-ascii?Q?slJ2n5AtkUk3r76dMVXmruN9Q+nIuoTjBLCKCH8GvUJJ4o1sMS8/c4IemUc+?=
 =?us-ascii?Q?ENh1depeJrmsRyuOReP8SjbDMwNiWNUDlHrNaz7eQrOx2zzo6Tum1cGPxtW/?=
 =?us-ascii?Q?a13iNqmJXFqwenMsD8blvNgWvzG6DiF52+K16kL42hfuNwiPE4yC6P0jGS9h?=
 =?us-ascii?Q?1sVIVHtxE1lM/98wRQJ7/mRKX/p40H35SDK+quNvm6IHri2TvUT1Uxl5sGDx?=
 =?us-ascii?Q?OfcBYmEuINC1cVEoUDvYuNVCMwe3/go71N9qRf6yC20yha9d4KZAQ629Cnf3?=
 =?us-ascii?Q?g/zZqBV/iRnmATcPo1G+LJ+yWWtzHGEuA8B0siedfMXxO+dPB27Lr0FLXRF5?=
 =?us-ascii?Q?ZkbCgJqk6ifZHGX69WbF+/09SvDMkTzx9C8Oal2cuW4iV6V0VQqHdBWVQH/6?=
 =?us-ascii?Q?ftp+WeOURHB9kx3TPh+qXueujFP5tIzTj8OD8qXFgvOOaMaJUjIFKeGw8F86?=
 =?us-ascii?Q?0vlcZ860OvU3YGmqKbUYDVAYXx4DluOFssSjZW8Spj+cMW/rq15Kw450xyt1?=
 =?us-ascii?Q?BK3tAqvyMWPbbpfwLZhYEck=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8a553f1b-8cea-4611-56ec-08dcab844d7a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 01:59:50.4831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Ap1zOWIJgZLcZsQ2uEWKflOgkI4OQP2CFj7ojVwr/9is6ffjcFBrLwVc1SYPnI+SQ4+36p4NZI0jpLyw4pFaD5VYHK5o5DzBVS03GUEQpDnRlq8qF6+/3QxApUgB+1Y6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10388
Message-ID-Hash: BFQRZO5K6V7BTI6PE2GXB4NISMSJA6H2
X-Message-ID-Hash: BFQRZO5K6V7BTI6PE2GXB4NISMSJA6H2
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BFQRZO5K6V7BTI6PE2GXB4NISMSJA6H2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Many drivers are using below code to know the direction.

	if (direction == SNDRV_PCM_STREAM_PLAYBACK)

Add snd_pcm_is_playback/capture() macro to handle it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/pcm.h | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index 3edd7a7346daa..b3d4a928e41a4 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -501,6 +501,41 @@ struct snd_pcm_substream {
 
 #define SUBSTREAM_BUSY(substream) ((substream)->ref_count > 0)
 
+static inline int snd_pcm_direction_is_playback(const int stream)
+{
+	return stream == SNDRV_PCM_STREAM_PLAYBACK;
+}
+
+static inline int snd_pcm_direction_is_capture(const int stream)
+{
+	return stream == SNDRV_PCM_STREAM_CAPTURE;
+}
+
+static inline int snd_pcm_substream_is_playback(const struct snd_pcm_substream *substream)
+{
+	return snd_pcm_direction_is_playback(substream->stream);
+}
+
+static inline int snd_pcm_substream_is_capture(const struct snd_pcm_substream *substream)
+{
+	return snd_pcm_direction_is_capture(substream->stream);
+}
+
+#define snd_pcm_is_playback(x) _Generic((x), \
+		 int			: snd_pcm_direction_is_playback, \
+	unsigned int			: snd_pcm_direction_is_playback, \
+	unsigned char			: snd_pcm_direction_is_playback, \
+	unsigned short			: snd_pcm_direction_is_playback, \
+	      struct snd_pcm_substream *: snd_pcm_substream_is_playback, \
+	const struct snd_pcm_substream *: snd_pcm_substream_is_playback)(x)
+
+#define snd_pcm_is_capture(x) _Generic((x),				\
+		 int			: snd_pcm_direction_is_capture, \
+	unsigned int			: snd_pcm_direction_is_capture, \
+	unsigned char			: snd_pcm_direction_is_capture, \
+	unsigned short			: snd_pcm_direction_is_capture, \
+	      struct snd_pcm_substream *: snd_pcm_substream_is_capture, \
+	const struct snd_pcm_substream *: snd_pcm_substream_is_capture)(x)
 
 struct snd_pcm_str {
 	int stream;				/* stream (direction) */
-- 
2.43.0

