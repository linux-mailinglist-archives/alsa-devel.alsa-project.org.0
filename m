Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E209674DB7
	for <lists+alsa-devel@lfdr.de>; Fri, 20 Jan 2023 08:05:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22BEB2E02;
	Fri, 20 Jan 2023 08:04:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22BEB2E02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674198308;
	bh=FYEMEZverDpT/l8VPzz1dryizpJ20nREbYHc+hLbIgs=;
	h=From:Subject:To:In-Reply-To:References:Date:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kMqzFHt2bZJV5docc7LP2zTWYfI2k/r8M/Ocfj1SjvXFqxbdf1bV3kJbEbJ5xfeHD
	 3wLvbn2jDztmED5UQgsTA9WIK7phTOth5NruX0n29hGdqfzroWsBs9858Z4rE8xh4F
	 qO3nkOXBeFNn64xZcMb0YfVds97/KiOddt6aFhTE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF2C7F80580;
	Fri, 20 Jan 2023 08:02:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 548E5F80589; Fri, 20 Jan 2023 08:02:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2131.outbound.protection.outlook.com [40.107.114.131])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 561FAF80580
 for <alsa-devel@alsa-project.org>; Fri, 20 Jan 2023 08:02:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 561FAF80580
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=cLvP25SN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LWrZDMgxAHIcY3W/CGO3qTGUvkRMQkBWc7XDBaKXhh88u9I81P/cQhi7ncF9aYrCCKeqnuJ71L7CSFYOpdeUwX9EtULFVQIwhYDN3O1EXsFJRNGIG2o67hCNEfqfymdvqvsiAZs1lIzwqsYogSEOrad2xlE76Tc33PW8OGZYNAKaK0BTQYYnvamF31svIlvVV2MXnzwTOynz/Fgv6oLSK1SFdkxrUPEEyJXDwLkpIgkL3EkXnFstWXfnc4erLxjrMPxb5aTo1nPCcKlD2RLPNDyVVZXz/J5/wUQwcq8VGis0iLjrkHT01LrtG/ZCXfnoHTHBKFA1Y1YvSD8cwF4vjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TQDboAe4Y6sGeKLK8cEpp0tfsDmJhZlmOfIo9hM1LEw=;
 b=h/E+qe5elgzp3jShIw3zmi5N8dmFkQ30IgEmX96NGjU2hpIVZdS2Kfo/VQrcBobFJkCKvp6W5VthWFdYD/Jk6JFbsgmSBaEeSKn8g0CE38Im5RGukOVSRJsG3T8fP1nDKr8U+LGBUPdlH9bvF9rTIUrTXeSNlHQZFl2QMBGfAWTpHYsD76h6LZCunQfg/DbiDkd9rLw+QFPhDi4y2TzZL8xtWGdjtNDnZ1/8Q66b/8gsAoWNI2Hs6KSt+HPy7QF5vpmbAZc18mR4pNqu7c/8NDeGkO7sSXEPuv5moSX3VCILcAMMiLF7R8xGQnaDDdaIHit4Kme8SUMV4y8Vs5IvGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TQDboAe4Y6sGeKLK8cEpp0tfsDmJhZlmOfIo9hM1LEw=;
 b=cLvP25SNMSVyevLa6xIH0wz0c9L250KS/d5IdtzpZ1JtYwPI/6be7geihXg7qq0kQsJydrXheQ2kqANtpoqwRRzgsguMXs+1VTe0tMZny0GOzI6GHi3RttNhxjperU546+oFKg6gZBcUhbRxkqer5gTx9VDWr/lCfEAwzvK7P04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9337.jpnprd01.prod.outlook.com (2603:1096:400:195::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.26; Fri, 20 Jan
 2023 07:02:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3cd7:a7b5:ea86:9ae%4]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 07:02:38 +0000
Message-ID: <87wn5hk7si.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 09/25] ASoC: rt: use helper function
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
In-Reply-To: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
References: <87a62dlmmn.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 20 Jan 2023 07:02:37 +0000
X-ClientProxiedBy: TYCP286CA0041.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29d::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYCPR01MB9337:EE_
X-MS-Office365-Filtering-Correlation-Id: c81f18d7-d70a-4601-03ad-08dafab450be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I8s8XX0kjfHNGRN9izM7EODJMBqTE9wB5K0QPeMRKwQtfpwvlIWh3qRHQcFL5q46l0E4toqcuWvYsBUtGPr6k5JRw9KaqOTzvVe6bK4y4uNLPkpeVwukKiumaEaryWiZ6OjwMrRwFr/GD37V1ciNU08qZLzErRfsh4qr2JlqNa2T2wcb3hbdysBG9OXiVFYjfixx1TdUe3VV2Iieoyz+XF8Sns3YKIUmP4oTQXpGzGlASaQn5auaixLLPYcq/V/OzkX3VKTLJCOoSJ7SlrCwzrhS+9vPXTX5D4vMC3165ca4eFz9GuCY21cXtjpo7LeMNpyMpPd5DiRU/wS1fCe24apdijF0k9sIXiHRzvqBhExeSQzyYciMLD5Uo9ja8SFyN+GyErs3qkVZ1Xjz58U4s5LSyWIrvK4pHgi96rWzRltKz7oyWgj00gAVQUb6bJ5En3ccO9T7NxfvsK3WPmiiPt/WtB+JXG09UgUx1gu/8vOKX4NCsDTZlnNF3yjhHYTSXR4jccl0D7NWGxPygraiiChrvm3dcI66cqa3hgHhfc4UPpWAtqT6Ksz7jkOa/ERRImtZD7WWn1XB4iA1TvCRcGNiwEYrUUjl42dFwp2iaDY7HZXX5+hoevFF6y4dnVFtMcToTmra63mQH6uYnCCc9QZf2fgVXJjAZIh8BLmGFc5orwXFMAqm7o77HiVVY6eKv7H3jdJOA1/rSJoM5529fw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS3PR01MB8426.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199015)(2906002)(83380400001)(41300700001)(6916009)(66476007)(8676002)(66556008)(66946007)(36756003)(4326008)(30864003)(7416002)(2616005)(8936002)(54906003)(5660300002)(316002)(6512007)(186003)(26005)(478600001)(38100700002)(38350700002)(52116002)(6506007)(6486002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BYD7iY5ipWa0qGd3jaWWxTUUa4sPW56lluPJ0z5QnR8dKf4QEwUk1vwM5whk?=
 =?us-ascii?Q?Bbuc/07OhL1xot6xwvKEG9NYqOI5KQsM8zgb5ro1Lh5cJ9Mo8YwPbslYZytz?=
 =?us-ascii?Q?KyNnlpvHi0Dwr+AtIoJAiBSyTnk6lN/6iYCAsTlT0nx0ttha9S7hNrCiCkUx?=
 =?us-ascii?Q?aZDarSoEw4xoWo74Lrfnycrvh2OYnI0U3DhzR9Q3hUGyXb4/THgjdb+PQ41V?=
 =?us-ascii?Q?jK3jLPzO+Db27TxfRtffiS6j8rhsXKfVZnjAhyx48Il9MMVxhFBfJ6k3t3u0?=
 =?us-ascii?Q?HCJHUrgm2gzCydmo2lWsp84OUzNJg9vBZzNdRQ/YaER2VdWie81cxzAkzvTV?=
 =?us-ascii?Q?y+zwj4NGnIvAbPM4KteB2MbDkq/IAyzh1+QNqqrYk4gMwc/JOaQZROwgsjA2?=
 =?us-ascii?Q?3T3jtUb9f9odw3JCM53RaYWqpaixPLK8F7NYOuOWQRY3VhA7cqQpOz0+Flmi?=
 =?us-ascii?Q?NNot1QUTO7+W8VNhy91t/sdnVJuk9cRF94kWjXJxhwVT34CB75iDOQqDGNEL?=
 =?us-ascii?Q?h39IIwRWHsC9YA8yNog/dkydabOPUAfMaBXO7XQzhRsMd5aaliuhf6STAw0t?=
 =?us-ascii?Q?aYK+vzFaLjaC5lzdPUhwX8dzV7rr9lipRUV1GeafTcE+XVKXmWZfBcCtGPIR?=
 =?us-ascii?Q?mW085xjFkVC3olj/tJR+RQsIwZs/cRyIuos9Mq0VHt3yZp7PDJ+QgXD9AT3S?=
 =?us-ascii?Q?9EzKfNP2dL/6yal+xit8jKJ0xTVjvBQcV4wt5MEpZieexNYe3AVROdwBQjj7?=
 =?us-ascii?Q?no2vdHFtnm+9+EPDyJv+Vcj1EBV+MYV+v8J47p6MxxuWXaR8FYzf3bDZQDxn?=
 =?us-ascii?Q?ZZDCwCk7XoFoJHkbtQ7Ult8XQziFGOEMib18x54U4KnjfJbYnT+Xv7C/0keP?=
 =?us-ascii?Q?CFeBH/pOZKjoCEYyRY0zOsw7xTSmK/vV3DJRFUWdlwJavqhkKA0vGSv6IckF?=
 =?us-ascii?Q?h/PHbLktz2HHq+LIgrpZLgo9VlLkJy8gJqgUrplGs2Ja5BGsHzQ1AQQHzhAh?=
 =?us-ascii?Q?9xretD0+Q2OsF8UsPpzQcM04S4GBMwA+a1ITzIlfvRC8O6Q49GxAw13PtCnP?=
 =?us-ascii?Q?YtVkdgJXfYHRRkg8YrRY4pCVPI5cjnooOk8rsL3X2bzTE9PNv2qzUlLDq3TV?=
 =?us-ascii?Q?GUEIDSX0vdjldvQq4LVJPZr5fKM4to+QulTMd//G6jHNDuWjN/w+FW+nYvND?=
 =?us-ascii?Q?TJZD9rlGw8MaiyKBaBed+yxeAmp0p8jrT1OiS7b0YmGGb7PFmr2rVwtmUKsf?=
 =?us-ascii?Q?ZLiyMbguUkprNM+f1I6Uc1AYvlgIiDeyLK4rpFzNUQ411a/HlRPr8UsURae/?=
 =?us-ascii?Q?MS90eejWfe0IZRJcAXOF14hn/3ojID1m7vaACKr1S/orXAQO/ca58Y1meVfB?=
 =?us-ascii?Q?ciFLHNjhZIK152PrDhXAD4xLIaAkXhoQSenbM5JZlwGWw1BtfjwYIwTSLnfT?=
 =?us-ascii?Q?3Ch954X4WMGi7lsF6tWB+qAqLhRl3altdpj/nL3mBZiK8fbKwVQ6UJFMcl56?=
 =?us-ascii?Q?pzTjI/5D88zD+pN3UqGgyRc3jAb/xVQ3SyMjSARBfCtlVi1EEr7RIGMOtwuU?=
 =?us-ascii?Q?tEWpRxf3rkiYaz66q7ISpNAv8avVOjIxH5jZcIlC3L+H5Z6dQbWPKC3RRzSA?=
 =?us-ascii?Q?Kd+V4VnrYpL/2nQnAqVac4E=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c81f18d7-d70a-4601-03ad-08dafab450be
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 07:02:38.3439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYOQmpYg6fhfhmEZbcsEUazZVLUlRmvFQrHvHU6M9eS8icStbM+3RbDkE4oH2e8FOkY3nT+N2uOz22eoykVSTqt5VmUBcbhKF5pkkWFsWdWdX3b43rt2hBBny3qDTQDJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9337
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>,
 Heiko Stuebner <heiko@sntech.de>, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Colin Ian King <colin.i.king@gmail.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Current ASoC has many helper function.
This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/rt1308-sdw.c | 5 +----
 sound/soc/codecs/rt1316-sdw.c | 5 +----
 sound/soc/codecs/rt1318-sdw.c | 5 +----
 sound/soc/codecs/rt5645.c     | 2 +-
 sound/soc/codecs/rt5665.c     | 4 ++--
 sound/soc/codecs/rt5668.c     | 4 ++--
 sound/soc/codecs/rt5682-sdw.c | 5 +----
 sound/soc/codecs/rt5682.c     | 4 ++--
 sound/soc/codecs/rt5682s.c    | 4 ++--
 sound/soc/codecs/rt700.c      | 7 ++-----
 sound/soc/codecs/rt711-sdca.c | 7 ++-----
 sound/soc/codecs/rt711.c      | 7 ++-----
 sound/soc/codecs/rt715-sdca.c | 5 +----
 sound/soc/codecs/rt715.c      | 5 +----
 14 files changed, 21 insertions(+), 48 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index ca2790d63b71..45544b530d3d 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -508,10 +508,7 @@ static int rt1308_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index e6294cc7a995..6dbb59f51426 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -507,10 +507,7 @@ static int rt1316_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index f85f5ab2c6d0..784147a1004d 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -575,10 +575,7 @@ static int rt1318_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	dai->stream[direction].dma_data = stream;
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 620ecbfa4a7a..7c7cbb6362ea 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -3157,7 +3157,7 @@ static int rt5645_jack_detect(struct snd_soc_component *component, int jack_inse
 		snd_soc_dapm_force_enable_pin(dapm, "LDO2");
 		snd_soc_dapm_force_enable_pin(dapm, "Mic Det Power");
 		snd_soc_dapm_sync(dapm);
-		if (!dapm->card->instantiated) {
+		if (!snd_soc_card_is_instantiated(dapm->card)) {
 			/* Power up necessary bits for JD if dapm is
 			   not ready yet */
 			regmap_update_bits(rt5645->regmap, RT5645_PWR_ANLG1,
diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 6e66cc218fa8..17afaef85c77 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -1298,7 +1298,7 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		usleep_range(10000, 15000);
 	}
 
-	while (!rt5665->component->card->instantiated) {
+	while (!snd_soc_card_is_instantiated(rt5665->component->card)) {
 		pr_debug("%s\n", __func__);
 		usleep_range(10000, 15000);
 	}
@@ -4748,7 +4748,7 @@ static void rt5665_calibrate_handler(struct work_struct *work)
 	struct rt5665_priv *rt5665 = container_of(work, struct rt5665_priv,
 		calibrate_work.work);
 
-	while (!rt5665->component->card->instantiated) {
+	while (!snd_soc_card_is_instantiated(rt5665->component->card)) {
 		pr_debug("%s\n", __func__);
 		usleep_range(10000, 15000);
 	}
diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index beb0951ff680..ecf3b0527dbe 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -1022,8 +1022,8 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		container_of(work, struct rt5668_priv, jack_detect_work.work);
 	int val, btn_type;
 
-	if (!rt5668->component || !rt5668->component->card ||
-	    !rt5668->component->card->instantiated) {
+	if (!rt5668->component ||
+	    !snd_soc_card_is_instantiated(rt5668->component->card)) {
 		/* card not yet ready, try later */
 		mod_delayed_work(system_power_efficient_wq,
 				 &rt5668->jack_detect_work, msecs_to_jiffies(15));
diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index d8a573dcb771..5f80a5d59b65 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -107,10 +107,7 @@ static int rt5682_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt5682.c b/sound/soc/codecs/rt5682.c
index 7e3eb65afe16..f6c798b65c08 100644
--- a/sound/soc/codecs/rt5682.c
+++ b/sound/soc/codecs/rt5682.c
@@ -1094,8 +1094,8 @@ void rt5682_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_dapm_context *dapm;
 	int val, btn_type;
 
-	if (!rt5682->component || !rt5682->component->card ||
-	    !rt5682->component->card->instantiated) {
+	if (!rt5682->component ||
+	    !snd_soc_card_is_instantiated(rt5682->component->card)) {
 		/* card not yet ready, try later */
 		mod_delayed_work(system_power_efficient_wq,
 				 &rt5682->jack_detect_work, msecs_to_jiffies(15));
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index f5e5dbc3b0f0..77dc62219bb8 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -834,8 +834,8 @@ static void rt5682s_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_dapm_context *dapm;
 	int val, btn_type;
 
-	if (!rt5682s->component || !rt5682s->component->card ||
-	    !rt5682s->component->card->instantiated) {
+	if (!rt5682s->component ||
+	    !snd_soc_card_is_instantiated(rt5682s->component->card)) {
 		/* card not yet ready, try later */
 		mod_delayed_work(system_power_efficient_wq,
 				 &rt5682s->jack_detect_work, msecs_to_jiffies(15));
diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 6534c9b51442..659ce26e9f3b 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -163,7 +163,7 @@ static void rt700_jack_detect_handler(struct work_struct *work)
 	if (!rt700->hs_jack)
 		return;
 
-	if (!rt700->component->card || !rt700->component->card->instantiated)
+	if (!snd_soc_card_is_instantiated(rt700->component->card))
 		return;
 
 	reg = RT700_VERB_GET_PIN_SENSE | RT700_HP_OUT;
@@ -887,10 +887,7 @@ static int rt700_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index 7cdf184d380b..c65abe812a4c 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -295,7 +295,7 @@ static void rt711_sdca_jack_detect_handler(struct work_struct *work)
 	if (!rt711->hs_jack)
 		return;
 
-	if (!rt711->component->card || !rt711->component->card->instantiated)
+	if (!snd_soc_card_is_instantiated(rt711->component->card))
 		return;
 
 	/* SDW_SCP_SDCA_INT_SDCA_0 is used for jack detection */
@@ -1249,10 +1249,7 @@ static int rt711_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 78e1da9b0738..862f50950565 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -243,7 +243,7 @@ static void rt711_jack_detect_handler(struct work_struct *work)
 	if (!rt711->hs_jack)
 		return;
 
-	if (!rt711->component->card || !rt711->component->card->instantiated)
+	if (!snd_soc_card_is_instantiated(rt711->component->card))
 		return;
 
 	if (pm_runtime_status_suspended(rt711->slave->dev.parent)) {
@@ -976,10 +976,7 @@ static int rt711_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 1fca7a3f46ea..920510365fd7 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -793,10 +793,7 @@ static int rt715_sdca_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 1a2036ccfbac..c6dd9df7be45 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -777,10 +777,7 @@ static int rt715_set_sdw_stream(struct snd_soc_dai *dai, void *sdw_stream,
 	stream->sdw_stream = sdw_stream;
 
 	/* Use tx_mask or rx_mask to configure stream tag and set dma_data */
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
-		dai->playback_dma_data = stream;
-	else
-		dai->capture_dma_data = stream;
+	snd_soc_dai_dma_data_set(dai, direction, stream);
 
 	return 0;
 }
-- 
2.25.1

