Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CD2940413
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:06:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E613F1E6;
	Tue, 30 Jul 2024 04:05:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E613F1E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305165;
	bh=zroIi9WDnQrQXsVVKWZJ7kB2cglSJ+rjmw35VjGMTXM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=KfD8QZW80ZU3cZ1KKPXgvqIgj+yovF/cKSIS+TbzBTvaEFxA8kJYYfqlJoBRpOaj0
	 uo4RITkaKdakPqyAlyJ1NIU8f2YqOLkI2YlMLA2zl5AhN3354G45pR0U0o6FZ+4nsc
	 ny3lvlcJXRyjRzsM8Rn8caexPKju/Gwx1jrsqKtc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 391AAF805E2; Tue, 30 Jul 2024 04:05:20 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A815EF805E2;
	Tue, 30 Jul 2024 04:05:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 030E9F805E4; Tue, 30 Jul 2024 04:05:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C46E7F805BE
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:05:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C46E7F805BE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oC95Ha5c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOIA8b5kPON5Ld5IiviTKJNXEIglwKpEZhlICy66pWKEwKiJfFIt++oaV8L+plx5Q3EAcQPpZQ3F+hk5uw/rdcSAZbsnDH+iameva3Hufc/hzsV9mX2+QSatEisw03C8g0KN+I1TwJbJJHJldb8YERy+GoKLLTR5zdcasgQGwRyT9nmCjfZUI3OKqMbjNz3nFAnhWalnVnn7YRgoqsNPWSZuEE8Qb13r6ELAq6zwJ96ifZx4Hy8Dcu5WqrMI66yCcJwYxYQ8RKKn8wG7VF9sS7d/GHElqqGJZC5MBDf2yHXoaoTuhhM7DHXgdNNwKyM1gUMimOt54fyh8MmxFxG20A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KglfVaPo2GTTco7fsgIZuvSlK4I1ecGiOqskGOefaiQ=;
 b=jCqk3/TqQd5L9xZqTex+MnbV9YsxG3c0jOHvB3/ottP7QV12P/Q16kG++kALcwXkw+WwcMq2TLtKVRg6Qp5E8Ygdq6WN4LLEtFMnxD8R7SW/qfnHrzmAXYjE10Kq8a95rRyqyhQ3fZJ6parPUNt1ZfyaIazK+ztlgw2z9SKpdQtRCTHVko4+/2qpCEjqOMSX9eGRIQtckvQUfNBRWHBNNx/DILBJLkXptI4d5GYmoxU8/ZjDP+QzBsT1nkQZI1DoktvdXMG0ZL8frt2zl97K6oSx6RI8TjbiMxnQFKrzJtfGn10erHmIX5NHClnEt4C/qG2tsUh3CR+smecDo2HXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KglfVaPo2GTTco7fsgIZuvSlK4I1ecGiOqskGOefaiQ=;
 b=oC95Ha5c94u5iZOJzke1QrvxckG5WHNmo021M7zW952BdqvFFvAkghR1ses/XLucVEUaD2HnRZAXDv7TVLBQTXY2xWwZIJ/CBN10BHZ8UWy7V8iwP+pcO9IjkfEhaOFhbLyTHvHQxwIirMu2Kx661F+TlQuHgT6N/cg1vg1q3ZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9786.jpnprd01.prod.outlook.com
 (2603:1096:604:1ec::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 02:05:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:05:07 +0000
Message-ID: <87ttg7k52k.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/12] ALSA: pci: rme9652: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:05:07 +0000
X-ClientProxiedBy: TYCP286CA0073.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9786:EE_
X-MS-Office365-Filtering-Correlation-Id: 60d437ac-431f-45a5-3af4-08dcb03c08fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZxbacbGv8zSt42tCABoyWnUwPi9vrKj7e6dHpaHipRYcHxwK2Y+0YUVqyqsh?=
 =?us-ascii?Q?aHO6PE6C3oPlvH4RUjFXRazlFL4klFoLg0fDeOLObl8ZiXb5spaujc6gT6ap?=
 =?us-ascii?Q?2pPJatf63/s5vOL1FLJF+ndRKr+1MQMBFveCbxgU/cZT/axuVulHr2eAqRsU?=
 =?us-ascii?Q?GYOTvb8w3t+HumUkbDXGJDP49/CORkWz+lOEXcwz3jbv/qb7LXxwSGnS1WnX?=
 =?us-ascii?Q?QUPRzaeOPJMPnJIxY2T73bPep8x+JakDlZimRa6i+V6Qz3XItSpI3GX7hFmf?=
 =?us-ascii?Q?PxJ5EzcseuVK2n7Pa1SGVwKKuf96bbkqcHCHBZyEr8pnusKD9QErRzAbIa9r?=
 =?us-ascii?Q?vT0IOQQWOHKC00ooGcNX2dHlbpFo8f/7gHQVAp9ejPtxDeKHH2iAsloXKk16?=
 =?us-ascii?Q?blW2oJ8m/FoXvTxXZdeEp/lTUqIHh713B4eXQB4laViiWpLVzZiu2zkAvecl?=
 =?us-ascii?Q?wLUNDsb5sNljywB6QPo6XGN5fhgrt7uETTEjriAeRPdVJq8epw6AKaZ+IpDI?=
 =?us-ascii?Q?lDCKalpKQUDLvhjdHNW2HKB9ltv9mXMdSCBzVwoJvqbV6AqtWi05I35AuHeO?=
 =?us-ascii?Q?kL/bmXHQV++289u4k1jNud7zM/3b8aZJhWDufs7vM5glP6521qveW7/XJ+VN?=
 =?us-ascii?Q?nByk4a9VXYov34186OWDJHChcOJOCkuC8CW1oxHxlcVn0VxudJzMvFvfECmv?=
 =?us-ascii?Q?se+LkRM/xTSMmQ1qVIij19Rwzdq0L+HB7UqHJltePj0KRZBScFmzBnbuRte2?=
 =?us-ascii?Q?DJsHd/NFa6cgWqs35FR+moLht7s3zsZKEqds5RrFlAaWjAWj7UFv4hGJmvlY?=
 =?us-ascii?Q?gkI+KWkoyBjpqp8lw/xU8/zQTAkznLa1fzN+goC52BrTyvTFIU7kmsx7kjHk?=
 =?us-ascii?Q?OmAfgMwk2MhFKMuYRRmoDSNJ1QqWqr3bRc9yO08ymI65Gd2V0RmwAmmHBL2R?=
 =?us-ascii?Q?PLbxqpIv/6vGoiXoQQorEsMpMtTlCYiItpS9fxW/Spb5wnKVO6ITHK9z4f7h?=
 =?us-ascii?Q?zmAmrREbsVNJKsz1VXUuv/u519VnoL0U9IC0pa5kSbkN1p5RlGFEWJmiq18b?=
 =?us-ascii?Q?HQVrRAqFLBEhmhflsmz1SItZfNKpIjp+B4jJOS/zUppLPK8pRoMSP5m5wODW?=
 =?us-ascii?Q?92sDDI5WEU6yOqDV+QyvJmMuaw0wbxBsegi0cbrNpqtQ8sUZG+PYjNC/hcdE?=
 =?us-ascii?Q?wiUwYO+6lzaeCmYIxCln+RxawwgkDpUiLeyC4gmZkn+PfMxymlNz2+0jMzfl?=
 =?us-ascii?Q?UDVTcl7y7GKpAlWDhHWhzP5pxUP9sqPmHVBQmNR7w8q9PD5u6hgGX5ONd9Kl?=
 =?us-ascii?Q?1AJd6NLE0NmUMbP7Jel+j+CbHJA77IsvUWFBFNtFHtlWZUltqbdSP+97a5Zr?=
 =?us-ascii?Q?gdFrBxhpCUe48q6lccnn8dMjmIYBR3HGZ5/s/TXMRpAO73XDgQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Zh3Lv0drLNkvlEq07pSATe51EUgVPNm+ftzap2uKaqxHvR63a+IpP6SMvUzy?=
 =?us-ascii?Q?3Q6z8fdFWWKugw2kq9B6dBmre3EOFE/pQvZkEahx279IM0kJmRX0tlYp98jp?=
 =?us-ascii?Q?9f7dO6ofEFq+OOKod4WI4Cx2EZ1/4GEpDDvbyEogOt5IyH0db2L0KslOiJQD?=
 =?us-ascii?Q?xYN7cYWrKLwRTI5I2ZcxFA38ZREI9OvRUv6XGRIbr6WMv/Cqp2O8qqamjDkm?=
 =?us-ascii?Q?XGk8KFVYwNzA5W9SnRjlaasaWX3gc/gBAthuBRe62yR3We1jDrCU81tFWzKt?=
 =?us-ascii?Q?ODYiBn9Q5+RfShMO2KhRWuKL7xtz3/5LLH8iXQcoJ1Rk3cuvHmFdXUUdFoBd?=
 =?us-ascii?Q?sg7qNHOpaEqqqUxYtMFjuEWuAWqbwTGTEmfTSX8MSSdSY4dnV97z4EyEht/J?=
 =?us-ascii?Q?RQH9KiqEHIq3PBoc4kaWKcrfd32Xl5Yv/aBGa6YMhjZ+a76+MQTuFQfHKglP?=
 =?us-ascii?Q?JPCYsOC3q/BF6+1pmMZx2kduxH/u2kSKk6y//mtQAMkVX03Q/oulO27M2zz0?=
 =?us-ascii?Q?Lsi9I3qQlJMyzaiQeVMA9YW3LBBWXvt1J8JRYH+4RFENBJv1+DRbcaryQ6la?=
 =?us-ascii?Q?wKd+0rNm36JGKaJ0OFgfVGYvMxrvCR6Zb7qAflYvPLxPlICm2U3O1xYZyA7l?=
 =?us-ascii?Q?i+BitEAH0dPol/gqnHoXLzRyGfvTTJB9XhizKfuAfkTG5hroORe4if4CPu73?=
 =?us-ascii?Q?BAXFcPLf2TPk9KFp1+p1FrfJ954QwV6XBNg22xmjNTYhBF8oLvJYBdgUN+E8?=
 =?us-ascii?Q?4OqnRHWN8gAKsi+izATbgtCJLe1G3zYgWUgbcrdDGbXTAv61aVxjPsNRmh47?=
 =?us-ascii?Q?vEbBHqvOBlDEfoPRdMapJWH2OB1XPxoU3NZ+/XinHfFbQg1YqICo5w+zTipy?=
 =?us-ascii?Q?HGHtYOowpyLSQygt+p8oyTIQHyez0b5kPoN8IyT7YtexSTpWX1I49t00JzVp?=
 =?us-ascii?Q?S7Zv6NaxJUusR4hKj5GoGOljElMuec7DNbWNJ5StQa8LMYEFFWfF7B7GoBwo?=
 =?us-ascii?Q?DN8g6f7zF+rnWw/jTey2VCTc6EZfx2sYYX1NHtBYkQPC97+Ziv49VKgD/Y+m?=
 =?us-ascii?Q?doElxSs+m6WkFrx8qtxYZIIEBuf+lgHhUBvM/8OpxXkHt/cahub6U9Qi3Ec/?=
 =?us-ascii?Q?6PrwZHciQiLCZLfknbynrNu0WyDV5+cxsDtSUU2yPmua7olbC4Uw/a+yfG01?=
 =?us-ascii?Q?eChKrADiTIjdQzn+a8Xvc8E05JZHVBU7UiXQPWgIoK0+uwippwygNEQb8Ll4?=
 =?us-ascii?Q?TKAWd3ynZ0dTQxVISR9E5rxk5GpRwjRu4V2Pc3GvkjuKDX9XWMcXmvRIRFd4?=
 =?us-ascii?Q?90LyXnCmkhHK4LE7+WL8RjpWN7aGqNidl6I1B6zWUJxiNp0W09jn+uPRIa6c?=
 =?us-ascii?Q?KLIOMbgWYPoay8Am2pMBJjHyidynTou1beW9e56QdmQa4Tmn0qWRzLY1BxHB?=
 =?us-ascii?Q?VgFkMvdBwzW2ezuQ5+t9plXUJQDPfYbSMhrB5uP+NDX9SeakTdIh42tjIKYX?=
 =?us-ascii?Q?ga8tJJYZYDp54NAXdhD0VbFkfbKhddwhP7BYTBgyJx0mgexSwOV9LkF36hLq?=
 =?us-ascii?Q?jT2eamo19aahuL/fcvyEWPQv3xAe/GYxgil9PRaIfpMyJUN49NhLk6N6nz0q?=
 =?us-ascii?Q?lu24rRFxEEleTLamK5StMvs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 60d437ac-431f-45a5-3af4-08dcb03c08fc
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:05:07.6152
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sY5Pa/oDF3fvaeOb/816ZOeEWJMQyORXK+qpKaCYlOkQPlKR1yYQOYdpgCMlnG9tg3ygGLW6ihm+bgdwZDAm7T8K7I1oxaHWF7YoToY6s+J1bP4zpvCBd/G1Gw/Pn4ot
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9786
Message-ID-Hash: B54J5ZRKBDUB7575X6KEF4KNYTKLYW5I
X-Message-ID-Hash: B54J5ZRKBDUB7575X6KEF4KNYTKLYW5I
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B54J5ZRKBDUB7575X6KEF4KNYTKLYW5I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already have snd_pcm_direction_name(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/pci/rme9652/hdspm.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 267c7848974ae..56d335f0e1960 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -5610,15 +5610,13 @@ static int snd_hdspm_hw_params(struct snd_pcm_substream *substream,
 	/*
 	   dev_dbg(hdspm->card->dev,
 	   "Allocated sample buffer for %s at 0x%08X\n",
-	   substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
-	   "playback" : "capture",
+	   snd_pcm_direction_name(substream->stream),
 	   snd_pcm_sgbuf_get_addr(substream, 0));
 	   */
 	/*
 	   dev_dbg(hdspm->card->dev,
 	   "set_hwparams: %s %d Hz, %d channels, bs = %d\n",
-	   substream->stream == SNDRV_PCM_STREAM_PLAYBACK ?
-	   "playback" : "capture",
+	   snd_pcm_direction_name(substream->stream),
 	   params_rate(params), params_channels(params),
 	   params_buffer_size(params));
 	   */
-- 
2.43.0

