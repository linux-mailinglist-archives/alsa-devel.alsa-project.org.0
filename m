Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9CC94728F
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:48:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 881D33A49;
	Mon,  5 Aug 2024 02:46:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 881D33A49
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818818;
	bh=M1Aa293H281GOk1E3YLu379G+myrg67Q10m6OI4Y4Iw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=aJA+k+LmNGRzpsTkzpZ3jCoMD6g75nWyQq8gAPbpKRkRi76qisfy0caRUOw1R1w/q
	 kZDI1Xqw+t3B15vx+B/clH0/iZrnbv5LujgZ1xcV6QNxn+7sRok9Segj5qzsJvu1vz
	 rD6CmqcOxEVybuhBkTKqtFn3F1atjI2chZwoN+iU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 68705F89855; Mon,  5 Aug 2024 02:39:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 547A3F89664;
	Mon,  5 Aug 2024 02:39:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2976CF802DB; Mon,  5 Aug 2024 02:37:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8261F800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:37:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8261F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=g5wIKwcr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aZFsUazANDMXfVKVzOH4jKy2QJ4vwihgwLzWRGsGLZUIrRyVs0r5nuRtvaf6mtK3YyifiXhy1VqSFBFIL0cuGnygpYRGHdzqQnU6tiVz3ItEWSmayYZC/BV61D4ZW4T41c/ZcrnkvT4XTw7vsiJG6SuUMnpuw2llokMXISUFArmLbkkAXtXnOUax5V4W3M2ker4uY48tL9ziQNfev2huEUl4CiWvTT1yHaEWto6hwwV0RosP0zwaRztltU74CPSgs0No2uoWhBOXL0OH1hUTfJ1SBNmoi9HAJx74ASU7X6wFoCM9bL2ZVw21/sljdu6M5mKLLMdNpOu7eEqko6b5mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sw4Syn7tMEI16fc+eE7GoMZvdS+tChLGFNwG5VAeIAQ=;
 b=lFivKm432Mpj5R2Aip+v8MCJJEIyQlF4ckYblcZ3BhagHwOd7YO5ZIJw4f8Ae9pHXDeC/u5l+mTHSxqSdiCKjZSn/YQiCyJrXzRwvh/8CLTlUCe4zfmzSEidZs5DgNnIh089w4D0/gOUT8bqNgEeM8a4DvZ79KpnGZm3J2nbfDdLNK8jmJpUpzAOK4i67B73pTcFkt7J/H6R3rWYFOoa+kkvwIEVqR9d+u/IrkOJ+pr48tbhiBK5HtcmqKYiT/rGQuvt0yuZaBNzE+Qme43qaacctjSHCgF0etzC/T2EWXu6CNTct91XCgPZuLZHHsSAFszRPRQ6Wof8gv+ujRXO8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Sw4Syn7tMEI16fc+eE7GoMZvdS+tChLGFNwG5VAeIAQ=;
 b=g5wIKwcrjpfP9QJoU6IgH602wnRvM8ARnnifSeQVSNSGastBn0fiZiE3HZTrJsB8DisqYk27H+3yeoVAEowEdFjJ6j0x5DLylwSKis2H57GXB461pn94wBPZmFYpog/pyMGdr9KyVoizFKR4zrio21qKNQ4ytTw3M0DfggE+9KQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:37:15 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:37:15 +0000
Message-ID: <87y15bztxi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 029/113] ALSA: mips: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:37:14 +0000
X-ClientProxiedBy: TYCP286CA0277.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: cb6fed99-7014-454f-20c5-08dcb4e6c092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?GdNPgzVXi8tPKS8FG1JaHW9PdGVbJlAFcgp5dAeO/GvVBirSXZtZWq+MdEEp?=
 =?us-ascii?Q?E3brSZqTXHMkgzgbcaD9qr0PqJ6R3jMPXQzUk0sQHYIBouNkFxlM187GNVGx?=
 =?us-ascii?Q?T5P/TafvHD3izh3J6gYuHe0lENPMqyQGuvvIrFl8oXQyxRAlwHhibU/oaS/V?=
 =?us-ascii?Q?5Qrie10s70IBxmh/ZewFUcViPmiswu1nAIIIE/AuHDo+FQUaV6GWZgDKpRgz?=
 =?us-ascii?Q?8hFymJ9rrkshq/EeymUc60hCeLTkdChQ1huezHTh5FQn2fFcJ5jt2HSJ4IMI?=
 =?us-ascii?Q?ZtCuDi4AfK6DRIrN1O1waqaY+4ETaLRIMZclz5zUrSqh2xtZDj1jhILcj+Pu?=
 =?us-ascii?Q?TXzLjXNwlfS6c5cGspuyMV7BfnHu/Ds9a0bRKtx/QheABIOYEi3FqYfcx31G?=
 =?us-ascii?Q?0OPVnZr2wa9TCQmtQO4hq6hXYIUl7rSYkcJ6JkGdCjqWO0XK6pfQn8R9fA46?=
 =?us-ascii?Q?GJPXcaHjlDzGNAx05jDtIL0wcr+s0erwnF1AQ86jHjgkDhwOv/HQ0SeW1Iiw?=
 =?us-ascii?Q?hhThxVyOg7q8KD29FkAv755pROe5qBjnfpElCkCWvETsCaiKCzNAisUbWcck?=
 =?us-ascii?Q?IzjIKXqqEDiCRxc5XiHRRonOte2n1sfY0cz1sd2gcHDa90p2aTAIgwKU7fj2?=
 =?us-ascii?Q?rZgbZ8tdr2RFyzLmk5oOdbquW9XLJxd+e53vdykrpH4mcfJsbwiI0Hofs3WS?=
 =?us-ascii?Q?aIXYTLubTL35399l7I24Zr6e7SLEb4CMMOFj7eexoIQFUUnIWdDuQERSxuM8?=
 =?us-ascii?Q?SKolSCDPIeRDvyhRnYo+HWVIEg2ctEmkum9HZUy9Gtrkh77IUtE5YTie7V2f?=
 =?us-ascii?Q?hxRDdF6vrVOmiSXj2Q750E8+nku9digWIBVc5G+dcS2jQjyc3N8ICOG6+R/O?=
 =?us-ascii?Q?tsSsZ9nRKsYvE3j0AkjyzCrxVMWY6rRvluYEmPrbowM+QCqt4/JE2U5FE+gE?=
 =?us-ascii?Q?wbYjn1QfO2iIfqVlP7X5upRqHlvEjoXGehKW+svOjbwTN2tcKClQ67YQQjeo?=
 =?us-ascii?Q?v3syTKMl4Z5LB/bTRynixwL6tVAnSLIT5YxLqt9cQy8O/clVKaTxce9yO14n?=
 =?us-ascii?Q?nVQnwSp77GlBgHWPEI7d8fm7wQkh4mN8Q2UKYM/blnVpnZSvCzdxqPm/xHDL?=
 =?us-ascii?Q?p+6gHR+mi/InDrHdCJj13tt34QLHBO61pWn5tSYEQvQnkdFnl2gT+CnEKZ+T?=
 =?us-ascii?Q?xxLGjYT/f8MbrsT2z5DPvYJGUMduBKRbqrNzyHSLcOspy9UEOvyyi0t9SIjN?=
 =?us-ascii?Q?jNJLSDS3qJgLSSvcinL+CUP9xvCT2z13Jy8yG75S0Po6TSmsibjEZPB3Zt9l?=
 =?us-ascii?Q?JnNFch440yc+P63YSos9D5aposB5dcxp0CC1q81vuxWXZVE6F/r1EP125HrL?=
 =?us-ascii?Q?3Fe1tG+PYZOe75J2E6OFbHTzm+4UCKslCYq9yvV5rRYEgvyFew=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yVzfyB9pf8IkB6YpfOyxVBBpQ83cDOUj+j0SmINJLWp75xC7/F/rUNXMQTdB?=
 =?us-ascii?Q?X7OCQrfavhzh9R2aqae7RxjUDETcXr3SzXCyXuFQVRG2wT1B7WLX4tfwWj9w?=
 =?us-ascii?Q?4fODUys9N89uDCVGmwXnyWxqzWlyfEzfNmzuqD3fX1nLTVyIpWrq6dp6m1or?=
 =?us-ascii?Q?3pGrNbm/Z2FmmWwDxv6dfdt/ugc4r7SOS3Alu/XNBF5i9Dw/+kFhSoDHCHlW?=
 =?us-ascii?Q?oCAlgT5XQZsWPQ57K40E8pCoZs+z1gzx5fTCA6q0P4s9znF0qZ9TMysUWELT?=
 =?us-ascii?Q?+w9I7bt8TGXCkwIkVsk/oVDBZS6ovTvBROw7kssRUre+ZirY9+hgHx+SmD9I?=
 =?us-ascii?Q?Dg8viFTbeTkcoEAFCG+PadJ2V5d6kdbTc87d3tyzgQ8/F3Ys/BhFv9ZlM2zi?=
 =?us-ascii?Q?LfVIb/ZGjSRlgxQPnslNR3gfbBFnkU2orhYvQyO4wMlx9G0IZ3tzc3ddJ17X?=
 =?us-ascii?Q?5xjSzC04EyuNg+V2uxvgRUSFYSJrlNVBKDMv7cbuobAy36aORZKI0D8awXmu?=
 =?us-ascii?Q?hI6CuXHBWCerV71smbMbhgdQ1oHzUSYmAy0fxwdI0fEJRz0wIGu5vzAUpJ/U?=
 =?us-ascii?Q?/hjR1YypE0R755FXOeC5XaPl7YQ8geBbvCTc7l2s4gojl3Z2vWsk6y2CPnsU?=
 =?us-ascii?Q?AifKqoBjupNtMQ21TeNDay9zU+u0eIA5e2F3iB+Xoi7GbM5xbJw43ZuLWk4v?=
 =?us-ascii?Q?/svt3HauzLDeu8LxS2GsYcEUqWRdvJM2DZ9X408aMyuXWke1fFy8fF2lc+WL?=
 =?us-ascii?Q?iv9VbsFBhasGrdL7CNShY/55wc/t4UPgFlcPJEDPl6hdHvMseZCXHTKG1VjA?=
 =?us-ascii?Q?DFVvKDa9kQpwg4EzQVK1up49F8AvBRTTJq56NhCtgFdycnnmL+uejXIRVi9A?=
 =?us-ascii?Q?0ozRVzfRbm3zPXwoxGHjq96FlhLjjE/MSxCTt+3aCALaHNADImQ4YuRFtOo+?=
 =?us-ascii?Q?I2EZLAA8s4FVjzmq2tkgqs3/AVEGy/WgP/K2y8MAckY5FkzIkWkvLFrGHiQM?=
 =?us-ascii?Q?xAeH0Omusm0zfzGThNuuyxWiLqm9+4/SeNPr+D5JmZ8tkxc38tduhDmNFqFD?=
 =?us-ascii?Q?mx/1kFmXxLuvSDf1LdBFC78prsmhVlSYVk5mUG/qkHfp+sX99+PJ6DwSX9PR?=
 =?us-ascii?Q?ar5VAEkhblXmhsuyEtkRim99H6Ux7qNTZIRnsU29If1qX4u8Lj3fCXV0lVoe?=
 =?us-ascii?Q?eS0JOayy/VfD0XVYg9GHDsYyryo16+xX7tH86O1xCVTedhvYAjE/886Uqf+8?=
 =?us-ascii?Q?4S0TcpjNsWlEDdH41tXBBBVUrQRj9x02MURkA0CQz5PjSj+ZkmTJl6iseVMI?=
 =?us-ascii?Q?BestCF5zIzDrO+SqRd+rfiB22ESXeLlFWgRknP2P5N1ZJO8tbdiylMtlcU4H?=
 =?us-ascii?Q?raTqTUmZorLRwSfWx2FKfKx/fxvFBzBUG49ge+qfWgPUmxDYmMCG0ia66Qel?=
 =?us-ascii?Q?Oxzp0ilhIe+FL4eoAuRX1lNJkbeRA7kSi2GwkuWVzgJeVdJ7Dl0k17e1QogL?=
 =?us-ascii?Q?I3ymVqy9GtoGRZK7NF7EH1Ai4WWKYvCl63u082S7TwcCUEFvZXaoyh7sH5dJ?=
 =?us-ascii?Q?0djy6A2bVdDyANaRIhLO4+PSk7Cg91pU9iKamMuQcLpuR9m3zRFwRKzNSoaF?=
 =?us-ascii?Q?80W4VeJ8hNe+4mYBRtA5Edw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 cb6fed99-7014-454f-20c5-08dcb4e6c092
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:37:14.8075
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 DG9SC2iSPAi3iQXr7LsCXpstusoc8yfF725NlfwJpNZhYZO77cckT/H+i/D8WkC7gxtu+xtIwBMvz+KXvHTlDJ6W3ALBfWZz4wYmvNZS5CW08EJ1RLpLBoxYW4Lq7sjT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: XZVZIIBI4KAHQD2FZZS4QROOJGYVQ6J4
X-Message-ID-Hash: XZVZIIBI4KAHQD2FZZS4QROOJGYVQ6J4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XZVZIIBI4KAHQD2FZZS4QROOJGYVQ6J4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can use snd_pcm_is_playback/capture(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/mips/sgio2audio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/mips/sgio2audio.c b/sound/mips/sgio2audio.c
index a8551ccdd1bf8..a16f63f21dd18 100644
--- a/sound/mips/sgio2audio.c
+++ b/sound/mips/sgio2audio.c
@@ -447,7 +447,7 @@ static int snd_sgio2audio_dma_start(struct snd_pcm_substream *substream)
 	udelay(10);
 	writeq(0, &mace->perif.audio.chan[ch].control);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		/* push a full buffer */
 		snd_sgio2audio_dma_push_frag(chip, ch, CHANNEL_RING_SIZE - 32);
 	}
-- 
2.43.0

