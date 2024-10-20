Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4719A5793
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Oct 2024 02:01:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 254F293A;
	Mon, 21 Oct 2024 02:01:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 254F293A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1729468887;
	bh=dWJ9aiL0KPdEdwUWlUtMQzWpBBRw5tjhFlKXxKwqj90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=dbXusdJ4Z26YEEOnbWigutMcafbpayY6j93cywErSXFKUhkHR2yCZjnkkqngpBWbw
	 IgnY6JBBKN0TAmV4xNLOY2OjkHWixNW8ljas4+95Or5iuLJapFO5JqKS1BQ//gjfJw
	 ghiPCO1hB03yRFuBFxAZGi40zPla3AI3QQNTKXBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E4259F806C2; Mon, 21 Oct 2024 01:59:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C44AF806B8;
	Mon, 21 Oct 2024 01:59:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5D304F8069E; Mon, 21 Oct 2024 01:59:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 02F6EF80691
	for <alsa-devel@alsa-project.org>; Mon, 21 Oct 2024 01:59:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02F6EF80691
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=mvt6htHN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jpaVOVSNl0rxa5VMD1OwYmde0EBwYX6xEFMH5DTqBtlgXQIjFhmp8zr9mWk3cgTOCzuFeEwS4ccbqg9fqyhXfwh1ZF4T1VVQIU/h8t+1NjKf4qr8bK1hSaMmLibamwFS/5BkTXk4vseUjP/S+ms67L9w0sRtXXB8Hht7OJiYSh3Shd8vWuJEi32yRsqPPrGLAevsHcl1/G4L0212vBV6bCIZEnjh8K2LxhNHsMNYUsS76NN/bSyY5AP3H1fM/DwBQ5apq4IiaTGtPVuW5bxr0ZUcfs4bR1dEx9bjujcKSF3kGZG8iCI+GoCwGjzB1DkwWy1B/Gh+ocVcBWdSnEyncQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipWWxJjMu/EVkBUzGA8d5t1ousLvweYqHA9t/geTqS8=;
 b=eYW0SQfFREcYA6fwT2cXxa3vtqzD9wvoIk/5q36Ob2oB1GJl6xeMaKnvUbigFckmOFz19A/HMB4OtvG+9CcHHz1Ze+b0OgvgrVvkcTxR76BVeRNHJ9t2rZaT7rtI48Px9z2OvLY6EAI3N/GUkUzvg7SRalGWipFeHkCMRhHXJ7/YrSWWxbl4fiqTmWbcQ/RIrAuzx3jJ+OVrLs8eQ5y9w0aXbRqLOa/BFH2BfT7FZcJwGXJed0gmEDBPOfvrc1KYlI3cwFx3ADv6h1KYfsI0CVcf6g+4Ats/PdqvCuytvhggT7ad5r4J3fAJ/8SbIM3kNlpxw4zayfq4ZmL+TN5MYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipWWxJjMu/EVkBUzGA8d5t1ousLvweYqHA9t/geTqS8=;
 b=mvt6htHN1PspsdN5T+CPITW6xuFIgWiBen1smRhheNta4KTXYVI5mCIJB2Mr8vh9HPcPUGYO+Mrf5kLLRrTec5Lg1EtJh2N3eVmpLJqXT/3RCle0t0aZiQa8XHveb9OwBVjOsTslYJX2U97Dv9NjTRNzbjPfQo3ChT+cgeJGW8I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12916.jpnprd01.prod.outlook.com
 (2603:1096:405:1b4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Sun, 20 Oct
 2024 23:59:20 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8069.027; Sun, 20 Oct 2024
 23:59:20 +0000
Message-ID: <87a5ey9vhj.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 08/13] ASoC: soc-compress: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
References: <87ldyi9vje.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Sun, 20 Oct 2024 23:59:20 +0000
X-ClientProxiedBy: TYCPR01CA0031.jpnprd01.prod.outlook.com
 (2603:1096:405:1::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12916:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aac8d19-a9f8-4a63-99eb-08dcf16336e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Zito7ZCEkHeGDmtV8bkZ7UB3l8f8MGsY8y0cP087jqeLT2+g6raR9I+zzcXJ?=
 =?us-ascii?Q?bAzlwhXLFPjoGULAK5tZItWrSVdzEwJG8/IitGMjtdUw0g65cZOdzA/BJrCK?=
 =?us-ascii?Q?H8OsBSVHM2uNjbSjE3s+yRP4YP21gFzy32orG/igV52k5TrgFVRBs3b1tZ46?=
 =?us-ascii?Q?Dipbi62ofjySjvWtfkcUJn3zQBwiS7KvZc2YiFry7jEAQCbzKXNH6A2xYWug?=
 =?us-ascii?Q?PKSbdO9/LlM84zpTpbqwU9T9zH246ol2FbfAh7aEcMtPbJN0cHYsCkiE7zg8?=
 =?us-ascii?Q?qxxOwIShsOo3CX5pWVFo6xWB3jgz3mYwHsYFuOtoT1kIATvKFy4RZ3Swn62C?=
 =?us-ascii?Q?toutNDJg5pepnHBRsMbS8OnljsWJ8vkD465U5wNMhYE2bkmh7UlzUwrr57ag?=
 =?us-ascii?Q?4iTj5r0/Hvq37ZM4c4lUMG0S4OMjd7nclhe3s7E60AV4lVC4Qb6/UKBUrxXI?=
 =?us-ascii?Q?tVfdN3P5Z/fg4OJpYd7wj+SlUuGM1t/8j1ffmEsGrHaH9xnIHcLfxxGeKUtT?=
 =?us-ascii?Q?Cif6jt3Uha3NKN25OZW+TgrAAbwRldKwHLmR32qB/o9VrFS+zQM0lbQt4jrS?=
 =?us-ascii?Q?HginXqttEGg2xwrkyfP34j0hTr6YDNmylmWkS4As0JT5N1OEsTwtVE7rC2tf?=
 =?us-ascii?Q?LKv+3iLzXAT9f3R5UYi2vBcGx+WyfKuW3NXXaD8H6puRt4aCM/3SY2ByJP75?=
 =?us-ascii?Q?TE704twpLR9ZhiESR1a8JWfbcEpYg4LOMDB6E4vffcMgU6//Bh/biarJpM6H?=
 =?us-ascii?Q?zDwgoOHqRzhvkRd4bVEshJR3QF3j4uGhEUnnsqfXrPhoeHj7OW7S/xKldXTU?=
 =?us-ascii?Q?zx5xNkEpM2tz5p8YqTJX4AFqmF1gxLPetHonzNAeWn1CE8BJJI0ohYkiD9wJ?=
 =?us-ascii?Q?t4IMybyusHN05HoNR8G9OaBjUQhu4PyXt30NEjkAjWjScH9++32tq/2g7bJD?=
 =?us-ascii?Q?1KziPqOHQ7gODA1IhhyKqu0XZvaoMuibIHNDYigW1ASsh01VdIY4EBtZgN/P?=
 =?us-ascii?Q?kvntfkXokpd/rdeN+I144wa3hMI2npNLIIBiBb0R14XSCAIySYyf19IdR662?=
 =?us-ascii?Q?CkvVlk/4nK32Gb8Dwm/vVqjd0CRrkTY275WBHsOMdvoWch/p19RDZAtnCZ6A?=
 =?us-ascii?Q?VnDPXB1VU5Z7RaQFbsI7TW0ZIvN6oU/f61d7FY9QGteJaBp5LPgUlJSldgnz?=
 =?us-ascii?Q?P6WbNLsM0oVG3pXNm6OxY8quktKQ32ceylndaDX6e5nlhIwFNyYZ/TuWdXrD?=
 =?us-ascii?Q?foVMGwXg+miLnMxmjHrTUKP9nL0QujEmubNDHk9TtiBZAMuOjDDw3sKHR/FR?=
 =?us-ascii?Q?LMfrYVgEukFy/ViSaAHuengFNouwAj0XLSMmakqK9bt5/P6NVl7LYU3NgK9R?=
 =?us-ascii?Q?ICWNFaM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4AULD7sBA8SUmvIZu0qzvaOPn+uAL9kpuHMBnSd4+4YfHuTn27vTdH1k0x9V?=
 =?us-ascii?Q?R3sJrLq0FrSyN0kIVsQ6z7JmqFjuY7H9025hr3qXLoHno/oH9ynrITRNXwG2?=
 =?us-ascii?Q?CfduvhtpdU6zcupfQiv3JOUIKdIzCuSBEv0JbhsmVX9psfYjjtdCHLl0D0bv?=
 =?us-ascii?Q?/lckn29x9iD8oZT0mA5L5MuPsQYeMl2JBlh/bf8RWWl7UvuIdweP3T2jIhef?=
 =?us-ascii?Q?1lN0lHK/nv/4bCZYCEup6I/KM2ez96SkYcPyuVv9tnT0d8BcRA8UYL+KTG6j?=
 =?us-ascii?Q?+r4O5r4PjRSVU/GC7aJt9+QxiycrBAlouQdxBP4SbbTBx/Ry5etj1fpcNDeN?=
 =?us-ascii?Q?SISJ5M7QqDrBJxYv7smnT564SNi9VifHxoYOcDNcwA11dYBnLRVIt5MiiMm4?=
 =?us-ascii?Q?kgM+a5itxCgOBMi+bE5+cx9sHD4NefrYPSnqhj+JgOTgaQOcyGjgxuPyXWTs?=
 =?us-ascii?Q?9pposgEfTVodTupDb9x9FErqqVqMBdP8bmaYRg7zXMl/m4TCk2uVtNitArea?=
 =?us-ascii?Q?Xt3mFCmGxGsYYONnTkurzMiJ+5xPZPuPZOIwalx84scPx4yD+xJMsrwgRNK7?=
 =?us-ascii?Q?CFRfvfQ4RdxYSezCkHI5hMamKVCNiuM/urzTK+g0BH/VxqbxFDhkvNqe2LeP?=
 =?us-ascii?Q?qbrGIhfsQH95th4UcyKeQgUdFpV98S1W8x29sSWtrWWVTjS5TRExvF8jjOHU?=
 =?us-ascii?Q?FBjb9dTOY4/OdGDyUULlUaOt8CxXuymm4g+rUwwmcpvlcMblscIgGOnlnL7n?=
 =?us-ascii?Q?gEG3NoTJF3mXwx2wavD7p5Rbul0PAnk6o5fvQjlKfPuriMFPpVo3vwrlmqib?=
 =?us-ascii?Q?1uv2HLBWw+Ni/VWTIlI0diZr4YDRQ8EaMlcJ9IMqP/sokKI5oT0MEF43ap9y?=
 =?us-ascii?Q?ahULWPwDAWsAWHy3S2A1ckQW7xZCO+phxfEoY1B/CbmoNoJfOPBCdNiAiS9w?=
 =?us-ascii?Q?z9JwZLFTmil1ucTG6YRa1wtGFnO7coMUIUtln9534s7JletuSNzsRKgNde20?=
 =?us-ascii?Q?ZMeq/8YJJ7Lwi435ofEPxBNzJHw5UB9l/orlWo8JOqX8tU3VGz6ImwyMV01J?=
 =?us-ascii?Q?Amf8eGR1oOVUBePiErx9Ny1q/dhi7/LQlUrlQk6RgwJZ5xb5wUr6/e6mBj3F?=
 =?us-ascii?Q?kaWY+itw9M3T4YNnGF7ihNwpbaCx0m+9b1XGR3hosv1k1JrMzya5pjjEXZJZ?=
 =?us-ascii?Q?VOXi+M+735m6Rp6Ymnly1HMqEPXTcPDOYl/b3Kj94QGKdvshSONlKGkJqHDn?=
 =?us-ascii?Q?SH95hMZE42thbBsiAVGk2uBIXFpE/bvCGRKaIqvlfsuPNSL1PC/BxEx950BG?=
 =?us-ascii?Q?opoOeldMwVn9FGmL0+jblgAroTTbwYbDeFNoC26ABAuXoy0obJ1+3GNAHBp+?=
 =?us-ascii?Q?65FO2ycL8A2/Cxuyk326QsjwDJLm9rH/0oQzlE9K6OTKkP9MCv53g27r6A+i?=
 =?us-ascii?Q?Tj1/fufko/Yvg8GZOdyOJffBDYLTv/ALNhq+qjAEkKg9cCy13zOO+k6m1JGF?=
 =?us-ascii?Q?BdVeNnL4PG56y0P2CuaeyjmPpBza/oOzpNWERCzyX7G1LJVUpOde8YFPPpCU?=
 =?us-ascii?Q?cTxAiJ7m8wk2RaCD3mynQRk48vO1QFDN2Es73+Clam/5caUUcIfu41xWbS6G?=
 =?us-ascii?Q?pC/aqqCLGEy0MJCJw92L4JY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7aac8d19-a9f8-4a63-99eb-08dcf16336e5
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2024 23:59:20.5720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 wxkQtW5utmp3CrTtldGX+uZed2dSqPDvBEWQHoTgJdC9M+hlBrBjcnz0e3IY0GGHop90n470NN22274IlBIefc8EohbhNz6Zr5VpY7Gw7G31N0NTUTZjGHGUZjOen/wB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12916
Message-ID-Hash: ZF7K7GYXSK2BVNXHLZIVX4VLKE2VLX2P
X-Message-ID-Hash: ZF7K7GYXSK2BVNXHLZIVX4VLKE2VLX2P
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZF7K7GYXSK2BVNXHLZIVX4VLKE2VLX2P/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-compress.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index e692aa3b8b22f..a0c55246f424b 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -606,12 +606,19 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 		return -ENOMEM;
 
 	if (rtd->dai_link->dynamic) {
+		int playback = 1;
+		int capture  = 1;
+
+		if (rtd->dai_link->capture_only)
+			playback = 0;
+		if (rtd->dai_link->playback_only)
+			capture = 0;
+
 		snprintf(new_name, sizeof(new_name), "(%s)",
 			rtd->dai_link->stream_name);
 
 		ret = snd_pcm_new_internal(rtd->card->snd_card, new_name, num,
-				rtd->dai_link->dpcm_playback,
-				rtd->dai_link->dpcm_capture, &be_pcm);
+				playback, capture, &be_pcm);
 		if (ret < 0) {
 			dev_err(rtd->card->dev,
 				"Compress ASoC: can't create compressed for %s: %d\n",
@@ -624,9 +631,9 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
 
 		rtd->pcm = be_pcm;
 		rtd->fe_compr = 1;
-		if (rtd->dai_link->dpcm_playback)
+		if (playback)
 			be_pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream->private_data = rtd;
-		if (rtd->dai_link->dpcm_capture)
+		if (capture)
 			be_pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream->private_data = rtd;
 		memcpy(compr->ops, &soc_compr_dyn_ops, sizeof(soc_compr_dyn_ops));
 	} else {
-- 
2.43.0

