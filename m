Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D619472B9
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:58:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 32DB94B89;
	Mon,  5 Aug 2024 02:56:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 32DB94B89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819380;
	bh=IAMDvzRra5MeuVT1tM2FeOOX5KqdE+0He4WrUT6IZmI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YzHbQnzcmCfNeUOjOigu40q2T5WuWWZkDmgqvuMqo1yaOn3F7i49DqsthE5Fl+NmB
	 d08ZkjBjVagBhkmAbFWrhF+L8LmpG9+SaUGBWajq3dQAq9Zi7CmdDxTyJ8lDohCg/4
	 hTV0mkCuy0+ZUOy5/tqmaDmHwNAPhv8W8svhDoag=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 705EDF89B9E; Mon,  5 Aug 2024 02:40:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D6EBDF89B8D;
	Mon,  5 Aug 2024 02:40:57 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3144FF899F1; Mon,  5 Aug 2024 02:40:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=unavailable autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9394EF8990B
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:40:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9394EF8990B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=MdT7GRF2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DQVaUIcdLqm7lG6oml0Q/9HUvjC6NWLBcryVD+cJdsvbsJyhoOma2C02RMdKtweVwRYKIqPxaWT0GSLEcEmL+BWfli02EJGLL0W10fHyUmib93NyrNxgqexI7bUP3unEHDBLJ5JZZ/AlGw8sBBF5PECjsUMQW/l2A41gvi/I7/XXn2mFCwSasnyztzS859L0qwYEMPDugtoC7eDrooW9+xq+Ckwjm/I+n3ViJtKGvQwULal04K1QHEqKstOQx/GzfK0N6ajNzLl0IY89GIOAMYGFofema82njBV1O2JKt+kpvJIR+4hSaxH7DINaJXbq2K2yazm968rDQSJl1O3CTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FW5a6qc7CqTdA20LP48e5waaE0QSt6DPfGZDBEvYLsc=;
 b=Z0pX2P+SljSLkxGRhMscnRAHYxYwQE1g7GFA2r0BTjyPysyMgEkA3+jM70vbhEpSe0Rd1cpl/eIg7trc46Rav7BnJ41SEy+UkBjGchpq1u5e74E6WEZmZAKwh1C7Zo7MQ17iF7YbFI2TGQ3gIH39Gv9q9wtpQzaDRQBmFxyBaZYAjjG7sMwP9xd1+ecepi46/xy1wx3lm3GwHBLerv7g6J/uPJeWtnuAgXD4w1G3ol/Jf/s3ydMaJFABHrJRwBkiuQ7fDEjnMSjJXXKb2d2PjcWIDTuH81ObiZ0H2dF+wRntSop4aol0bA1TSCx9k6PXtnN7kOqI6ZGMuuxLeaKe3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FW5a6qc7CqTdA20LP48e5waaE0QSt6DPfGZDBEvYLsc=;
 b=MdT7GRF2d+H7sRZgQvnQNNw6jr9b8Wgr/gwzKjCE4rvlxSCI1rjeKD1qv4BqiupG1dTrz0bJZ+EUrxqchaQGdV9YIPRIMW7Rt2k2jVnI+gkXBeYshF7i2i4bqd++IFF3eihCPLODz7GyT2R6BFPNWZfRAHgLtMMWqiOenBXszqk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:40:17 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:40:17 +0000
Message-ID: <87le1byf7z.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 063/113] ASoC: soc-*: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:40:16 +0000
X-ClientProxiedBy: TY2PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:404:e2::19) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: 880f5b9a-f3df-48fa-ccf4-08dcb4e72d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?dwxGdyNrR/QWB+2Nnz5HpIdcYaUF5EuKDLziowkbwdpbhJ2hNUt6a/Y7vHPC?=
 =?us-ascii?Q?SASU+eR5ugTzC6Qicd9Td9X6BZZ1xzbfx1Fs4IvhQ8g3mSBaYFkbwjd1bdxF?=
 =?us-ascii?Q?yuSyTuqkDbnrnpSFA5Bdq5bjmbBXEnVm5GgGOtQqqcKU713mDQk8vQqyDmQn?=
 =?us-ascii?Q?TPh0LsiCgaA0TXiYXeDHDEpQPF8ARAQtM3hxaa59wAI73kgQL9XBO59R5+Hw?=
 =?us-ascii?Q?l95HO4w8dWcK39A7WjQX/AomoUdo6TLAWAcE+jXPjgj3Eh/qRg8lxcDW+ua0?=
 =?us-ascii?Q?ulFDx+vWxDiAEefTY0GKbD58/R4IhDeeNiYsArrQxuDNEq3Yd9L0vEbUsJ9f?=
 =?us-ascii?Q?BkVdBxKXGiWV3lmQKebOzC2hWJ8qEFv6LfwQR/h6/9WMubdX3YWlEgQYAIH4?=
 =?us-ascii?Q?s+Mh0bkBoYOkpwcUToLdkdSIDnsaSdvnqp8gkSxs0NTohwC7ugltcPRGukQD?=
 =?us-ascii?Q?nHz9uCiNhDPTxlZEBBXHrECEvqOlct2xQ2hJ6axV6GuhAc5KpT698slUEkHy?=
 =?us-ascii?Q?D/hmeQVMLgqcDeVWxYQOxZK6+O69zrdIELTBhnX/7KUwLJ14MqSlgyNshC8y?=
 =?us-ascii?Q?gZx7sNzfPsapHqm/ArQqjfJcp8X2M+8ZIscbLdEcr3mhOmAmyMw60aPaWPZc?=
 =?us-ascii?Q?tG0bRfQq13Yv9r5vQetagt1EGe0Hva09Fnf8jWdjqQcgtQWH5p2dkTdXkG4O?=
 =?us-ascii?Q?440UJvD7lPLn6ysKS6vB/U6v1syuI4YNqvA8jNqna+1Iod1z4qV50cNi1sid?=
 =?us-ascii?Q?xHuEUy5iD0xRg14vPKgkZWy3bxc+7SBZoPQmJSe3+sciS1WNAXSiZtCrGcod?=
 =?us-ascii?Q?YJql8o/tvAYEpJ8/CpLH+HnWCdZqcgwwRP29qCrGPioGcnxTKrWQXO+YzOpB?=
 =?us-ascii?Q?R8kRYFMbWpANz3QLs84wJuT1KkKXlwdY1AmqwpOrsZj9b2P9goWuKl6766l1?=
 =?us-ascii?Q?02Gwdj8PlVPTT73Fe9ICKZ5WZFEbTMkxKlalh2KMF/XKpxby/UhXtr8m0Qvf?=
 =?us-ascii?Q?QA9ie9/m8ZRpqY8GcXfgs1+o+g5HDnYaNO1RFpsy2jw5U2MOnOEaAgXpCtPM?=
 =?us-ascii?Q?mLMVNWoYBraGp70n43velWg8+v8umqMuZiRsAM2Ly5RiLlSJifTvPhAmvemb?=
 =?us-ascii?Q?b92ekdkg3WBaRx1soXfxUDV+pirkSIpmz3kU9exI7JXsCq1r1QQNbjp1t4Dl?=
 =?us-ascii?Q?Dk7ABbDo2oUFfNzP/eYGzs9OjffOGLbxqoqKZtvUJMX91FHoD7bZ6c2VJSeu?=
 =?us-ascii?Q?4LBGvtfTYo0QIi8+KAQYlV/nXIRZxtF/QT+LUwZIjIEoKDLGBq0a+Vkob/wz?=
 =?us-ascii?Q?pDndnWzcV6Mm+P9l49x3QO/1pEStvnyEkC5Uj5RAK1J502J74oX2nFCUZGwZ?=
 =?us-ascii?Q?letzG6YAGyvaU/yMWDpGVafyQP7yptNKFhN0aVgVjMDZiMU+cQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PEJWKpj0gUddbFXKdgS5PbcCYY4QRDJzIYs6JfFJ88hycn0FTFZ65DQ1iNmm?=
 =?us-ascii?Q?FF2CipmOx+vOGn9Qh7oV03Ltt6hvcFD+KWVftW87M8MNOnyJLaTmd/vDPrDd?=
 =?us-ascii?Q?S9qGdkh7gDKAiJw6r2pyuMiV/ehUxsCkGtcBlKXudAv10gQl5QzG7d91L5qC?=
 =?us-ascii?Q?+M4RV2IZl5k2xYzlUldrrMKbBz+sXr1xveePoh+TulkSqDy2ZIy3WR3+xJun?=
 =?us-ascii?Q?l88Y8O8IfBubvfYuwb+sIeY6G2XQmtvuHjemDx3YYe6/tJQFj9evOuNcuKDX?=
 =?us-ascii?Q?p62bed3IawGNnIR81/wsaHw1WAnuCHFwWtosnh0WDFCO0/+tcXK9BrERN+1K?=
 =?us-ascii?Q?cX4eMmxJZx0MWySxdWIF9nzMiLoH91OXm8JlOI04sLKGLvAdJ2HVfSn6Cv12?=
 =?us-ascii?Q?oGS0oc9BYGYpbDLclGHIcJvcB6R/PUkZPegEueKU2EQUxH19My+/dEtfxYkk?=
 =?us-ascii?Q?3MH2bjOnQSU95fHrg0cfidA71/NElLU+nalry8Y9xQDskmvU/zXMlvvGHYYK?=
 =?us-ascii?Q?hZuFCALh89ot86qnfWA9maXkLwN1sZdWHLyhJYgr9Tv9P2+l+dbLGQ6Eze72?=
 =?us-ascii?Q?dqLsVfQIvVtMQ5Q5s2qyPiIlfi06lzv0VoJ6elv32322phQTYYOC+nIyYiB+?=
 =?us-ascii?Q?pqvKn3VlUI0wVoXjKmqKCT3r384FGUHDSih5+9ahTOhYeMK/aj0g099EeCU7?=
 =?us-ascii?Q?03DOLWZitT2kmishgjk3w20lB/G8mW4p/FtUq1EI/uUdwvWQL3nasgs8Kqvm?=
 =?us-ascii?Q?HhTwODG77sQs/19WsnJVsffPZBxUS3NnWQ79Yszk9mgm9pcjHjeYWQU+sA+5?=
 =?us-ascii?Q?i+X2mckj2bRFcOguRs4kcrcnSJ/iufsVltaCbDPYb1cP6bITprWDcLgBwrmu?=
 =?us-ascii?Q?D1NRGCLPUl38HPtVcvrbmfATnuoeY7tOafszXcDnTkBbw/wVu32ZMjkmX/99?=
 =?us-ascii?Q?GDFgT2z07mnQN/cYVeP5Zs/9Hk/hrXMN0zJqwD91Rsn2zEogaczgqMQ7Gt4o?=
 =?us-ascii?Q?FxtV3HEr563JXUDqloqcTmvISMHoMT4S/KUO2JblCYBRmozJt9c7OvNkQYIn?=
 =?us-ascii?Q?9sEwS6+2ZrlVt+yGCTewZeUWKgQAM9cFEC9tdd/2Ml0eNhtWq/KpB1XHpp3T?=
 =?us-ascii?Q?Z/1wrQ8PbqjkSXY4HM7ZMHccQKXD7e3H9gYFZfCbUJ63ThlR5SN15e3gJg/V?=
 =?us-ascii?Q?4ZB2WPuFKCntn5TmnX6WWQatNAGpSCuILo4CJ1RCALGnLnuenjkj3XagR2hf?=
 =?us-ascii?Q?WsxFf9JF5kke8q9b/C2ouPQW3+6Z/wDkiHd/gP4gCyjslg0lfNrnhKSJ2DY4?=
 =?us-ascii?Q?6rNf8xIi2U1isK4yzX9N8kDFW7/4DZ7e1OJnaWaSPfqk1FasxjR9w47XGqpA?=
 =?us-ascii?Q?/rLsVmJvvA3JCwPDyo5rjQigyvuRjbPTZiAGpcx/4hhfu0YkKw9WXMJOeDkb?=
 =?us-ascii?Q?6r4hauZpIvntwG2So4GPHzYSOWr50QRJ9G/bBO9Bn9Fad2avULV1bJjQ+D1L?=
 =?us-ascii?Q?PmiDTiN04fJATMGKWaS+8g4swIsjb4nzT1VRNWjDbiI8Xy5bBSOPJrN6Tu+p?=
 =?us-ascii?Q?8M4QUekphaIoEXNDg/vHYLXZ0h3YxanLd6jOocwy5pRlZbtLdzgPz5JiNnW8?=
 =?us-ascii?Q?giE9/yZ3dpBmnEzgLh8OrJ4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 880f5b9a-f3df-48fa-ccf4-08dcb4e72d47
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:40:17.0775
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 IH2hkaagf8Oq4sfxXR8KURVMTufKDYGWlxA2hOEz6HqP42IHnQkPf5dq3A6C4zwZqL1IpgipHuR1KpDEYdx4VNyQ7cTVtsOKMm00sH4RkFbJLJwT1p3Bc/oosT/Sjjkc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302
Message-ID-Hash: HQUWEKDEMMYMSGY6Z6M4B4BTCJSEQ4A2
X-Message-ID-Hash: HQUWEKDEMMYMSGY6Z6M4B4BTCJSEQ4A2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HQUWEKDEMMYMSGY6Z6M4B4BTCJSEQ4A2/>
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
 sound/soc/soc-core.c                  | 2 +-
 sound/soc/soc-dai.c                   | 2 +-
 sound/soc/soc-dapm.c                  | 4 ++--
 sound/soc/soc-generic-dmaengine-pcm.c | 2 +-
 sound/soc/soc-pcm.c                   | 6 +++---
 5 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 20248a29d1674..286e872ae4547 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -3456,7 +3456,7 @@ int snd_soc_get_stream_cpu(const struct snd_soc_dai_link *dai_link, int stream)
 	 *	CPU  : SNDRV_PCM_STREAM_PLAYBACK
 	 *	Codec: SNDRV_PCM_STREAM_CAPTURE
 	 */
-	if (stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(stream))
 		return SNDRV_PCM_STREAM_PLAYBACK;
 
 	return SNDRV_PCM_STREAM_CAPTURE;
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 9e47053419c16..28a0a7a0993af 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -379,7 +379,7 @@ int snd_soc_dai_digital_mute(struct snd_soc_dai *dai, int mute,
 	 */
 	if (dai->driver->ops &&
 	    dai->driver->ops->mute_stream &&
-	    (direction == SNDRV_PCM_STREAM_PLAYBACK ||
+	    (snd_pcm_is_playback(direction) ||
 	     !dai->driver->ops->no_capture_mute))
 		ret = dai->driver->ops->mute_stream(dai, mute, direction);
 
diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index d7d6dbb9d9eae..0d60942f64113 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -1312,7 +1312,7 @@ int snd_soc_dapm_dai_get_connected_widgets(struct snd_soc_dai *dai, int stream,
 
 	snd_soc_dapm_mutex_lock(card);
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		invalidate_paths_ep(w, SND_SOC_DAPM_DIR_OUT);
 		paths = is_connected_output_ep(w, &widgets,
 				custom_stop_condition);
@@ -4539,7 +4539,7 @@ void snd_soc_dapm_stream_event(struct snd_soc_pcm_runtime *rtd, int stream,
 
 void snd_soc_dapm_stream_stop(struct snd_soc_pcm_runtime *rtd, int stream)
 {
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		if (snd_soc_runtime_ignore_pmdown_time(rtd)) {
 			/* powered down playback stream now */
 			snd_soc_dapm_stream_event(rtd,
diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
index a63e942fdc0b7..4265e8052d6bf 100644
--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -297,7 +297,7 @@ static int dmaengine_copy(struct snd_soc_component *component,
 	int (*process)(struct snd_pcm_substream *substream,
 		       int channel, unsigned long hwoff,
 		       unsigned long bytes) = pcm->config->process;
-	bool is_playback = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	bool is_playback = snd_pcm_is_playback(substream);
 	void *dma_ptr = runtime->dma_area + hwoff +
 			channel * (runtime->dma_bytes / runtime->channels);
 
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 5520944ac9ddc..8f501178195e9 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -905,7 +905,7 @@ static int __soc_pcm_prepare(struct snd_soc_pcm_runtime *rtd,
 		goto out;
 
 	/* cancel any delayed stream shutdown that is pending */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	if (snd_pcm_is_playback(substream) &&
 	    rtd->pop_wait) {
 		rtd->pop_wait = 0;
 		cancel_delayed_work(&rtd->delayed_work);
@@ -1517,11 +1517,11 @@ static int dpcm_add_paths(struct snd_soc_pcm_runtime *fe, int stream,
 
 		switch (widget->id) {
 		case snd_soc_dapm_dai_in:
-			if (stream != SNDRV_PCM_STREAM_PLAYBACK)
+			if (!snd_pcm_is_playback(stream))
 				continue;
 			break;
 		case snd_soc_dapm_dai_out:
-			if (stream != SNDRV_PCM_STREAM_CAPTURE)
+			if (!snd_pcm_is_capture(stream))
 				continue;
 			break;
 		default:
-- 
2.43.0

