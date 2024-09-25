Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D129869C4
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2024 01:41:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62D36B60;
	Thu, 26 Sep 2024 01:41:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62D36B60
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727307675;
	bh=dWJ9aiL0KPdEdwUWlUtMQzWpBBRw5tjhFlKXxKwqj90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=W2Zt/w4RglAU7jresk/204qSihNhTXlO6zmjUg7lVqii5Y1dJoThxz5CoJQycWnRY
	 60vJ6DWymlPeLApu8ne5QpBmg+MmMGVEWG1psuVEMh3kclTo5r0wUTmlIuYsWsVfaI
	 AFkRJEfHhSgBJmtCdU9TunPPAUz/S3ytj3YHPEFE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C9E13F805C9; Thu, 26 Sep 2024 01:39:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 19306F805B6;
	Thu, 26 Sep 2024 01:39:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E58F8F805BE; Thu, 26 Sep 2024 01:39:35 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 7C30DF80527
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 01:39:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C30DF80527
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=me2ojohv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K14QpK5TjHQFfmMTDlGYUoX5HH2U+09CpaTe6NyEh1ybQtjX07K0HCaand7EHIEGpdMumR3iL+MZGAJePP6aPsC2ha3UT3lO2RN5V/deTsbEp+i9zjYjknhzVDkeLesnjIaC71pulEMFmI1yb2aJ0rSCNeqvSnh7pPhke40Loi35ZxImuwDDY4YcGyDgvdM0Dm2/9U/vxJ/oXWS5IMDbmkDPKCIH3ElyxL3ACyYBGKPGs42MDn5krCTtTEHQpRF+fi9Tx2uRnQh5tzTKoiuXrTkkkLMizlWaWYzIEhW6a8foMrjyJOf8OUQfqCiff2bJatLzhWfjosYzDSeVnASGsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipWWxJjMu/EVkBUzGA8d5t1ousLvweYqHA9t/geTqS8=;
 b=dnjM3IVV8qCL8Bzbpb73mA2QAioCy3b3q/loPYHkNU/j8di2/R89h24Vga5y8OdEv3lV+CEUJfieriX7HeVvquhj0bs5bmPnYJhZGhtkletRkR3zb5AR9z+MR3RTsJRsZnlThPIUAsQj1UWT9oWx0c74Suj4xdbdQ1m4Zzgc0xQV5h8iP9qJoC0rFvpOf03ItDM/jq/w4L3f7YlAB9tBvKSW09gjUjeBrOa4hF+BjAwF/cB3LuoZyqw1yYU/ZDCKMTgeOywNRyIBiqHCaQSICTiVij2CtWXonf8ErLjvIQExbV9bjI12mjd/njYyczwEOUezBVqy4F10sUjzQH7pyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipWWxJjMu/EVkBUzGA8d5t1ousLvweYqHA9t/geTqS8=;
 b=me2ojohvCbo7jni4sMRm0psGCqzX7Hv3KRwcO4/U5x3xF3ECSxBAnZ1LGd4Jt2x898lsXlmW8wiemKWH7yxrhD27tSAam0rh9vGCZ1q7pC2n1tfKVZb6Upswe1XUpvP5veEPLhL/fNVnj20atODnFFWw8VOkPKD8leR2icI+Q9M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10634.jpnprd01.prod.outlook.com
 (2603:1096:400:292::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 23:39:27 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Wed, 25 Sep 2024
 23:39:27 +0000
Message-ID: <87frpn9uc1.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/13] ASoC: soc-compress: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Sep 2024 23:39:26 +0000
X-ClientProxiedBy: TY2PR0101CA0039.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::25) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f61af7e-4b6c-4007-9586-08dcddbb4b35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xbSipLqRRR7CC1VRABYXauTnRf8Ffy8psxjCv1MSDQeeagEFyCm1oQGjXcbO?=
 =?us-ascii?Q?EuK8EMHin0j2BOFXd9i2g3YpPlRLSUn+3H/qxJIdfQce/BtsB2toZ8MDjqpE?=
 =?us-ascii?Q?4IQnptPEiRnSKM/ZBhPXCDZZBXRgWUPW0gC+BoMqTM4TBFo4tqfq3jkDU1Va?=
 =?us-ascii?Q?1lzSYLYEsiHIEuLAl4uWvqkyAAD/TcaS+gM8yl6ivio5wY+poEeqgBHGzFbe?=
 =?us-ascii?Q?xPxyfPbnNK7MBJ9dpxofFjJxWlUKPhWMtCRTLluK9DMnce1kCynVOK5KqKQI?=
 =?us-ascii?Q?4fXwoZRsqIS3OQWWKRGurnA4O1Ec1P13bEniDb0gXG+zdFwpYh4vrvV+rdt7?=
 =?us-ascii?Q?VUM1MQOO3EjsASpt2Tzj6gbpDRg+tezCuImdDmhNitfQ1/JDIxATZ24nNlEt?=
 =?us-ascii?Q?RkiK229GjWg9ZmygoQx6RZMSKPVTAxAHpSzyCjFV/D1VEmb7mJKzBYjQmqVs?=
 =?us-ascii?Q?7BzEwcLlbSRYUbKiwCgYXI+6uwU+DU3L7T70LAZQqk5NsETWlTsdguHPvsRQ?=
 =?us-ascii?Q?g90cleYYyiOW+TeU39bH5R8YkxZ6c5tNb8ZYUlQ6d71mqDWzaPk1S1+Bkv2E?=
 =?us-ascii?Q?Lr7eILNS0zsyXpBeTF1hqlF+4grZ0HmMEdxtPVm05DkHmvd5XrBf3uAqK3sz?=
 =?us-ascii?Q?Xb2dHzZ5A+DW3PP2GIWWUjIQ1byZUSSupI1cbkO3WhAuGb3Vaw6b7+Y1ghhM?=
 =?us-ascii?Q?3gusdlTJYggVRxQI4EiRaM5ZxEZwOCBbcJY2/WQkBps8Y8C/b//Liq3rKUsC?=
 =?us-ascii?Q?LDwdT8CAqrlBMj62+s98KtynUMSQWJpQJIUa/DLA+BokKdxuVJOAH6ly/NJX?=
 =?us-ascii?Q?4vyOIMQAglBkigYLmelF7MRDe9sZNurcCy0s6j32AxRNur/pE5ETjtwfr0ou?=
 =?us-ascii?Q?C2AydFba1zVZBUuHkmsezuvW7QD0r6KilYOAQTw3V39k/d9dJlmvHXCNWFvT?=
 =?us-ascii?Q?6Q7mQF9YmwadweeBHBBhCmHJNTww8HdRA5w9e9e+rVbz5VqBymmbQzi0GgL7?=
 =?us-ascii?Q?L4vVn9XVsDNWoxhaFM9Gh8Et0etZdUbXhK4BTqW6HZgB8Lr+7+Psid+GyubT?=
 =?us-ascii?Q?NocQgC5oDigtRoUpskw8cDlHDZA4pSehdTz6mM8Y7qaUC7mUdZL5AObpgifB?=
 =?us-ascii?Q?Zveq84msRN2+aYlLTDOsTe9RBMYglVp8qH2z++aRrGcxqSEpjr+X8PGimGDe?=
 =?us-ascii?Q?zt16dk5OXx0FNrsIo43WPyfp1Y4v4M+VWwWPhxbsv2zKVUn628n/wUdH7v3Y?=
 =?us-ascii?Q?b/SzZNttri3pU4XgL2TGyi5AMxeSHvtgt+gUVFTktMP7vhD13DHT8BwQ3kz6?=
 =?us-ascii?Q?oDDnlCWM4HuIJb7y8syp8AiQ39oeFZwhgydU4IsnYEjt+w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?uhdQ0CBb9ugxphcYKzcsWbGTIe0e2r2p/0QNHv/+NMdnQ7rdO4yYbrPxxIxP?=
 =?us-ascii?Q?U5jc/7oRbBtxywagMrvFs3cMRdM4io9QusEynan9vCOKMrASNUEapVVBylB1?=
 =?us-ascii?Q?5bnexA1wnRt3gYZ55gHoukMyaxSBjiqsdn/9cs3S8s4SsvFqbZ3+hO+wvn5R?=
 =?us-ascii?Q?nyN/j0hY0uFF0OYMBLlC4PRHV8iASqCkM6U2gfNqi1/WwyoML2EsRzmIqXPt?=
 =?us-ascii?Q?BrYR+YP/4hMsEpj3yWSoKb9wImRpISqyWsz0BI37yAoecsBoWaR1MdLOqovv?=
 =?us-ascii?Q?3Bv6Lh/jtzK2e4Jvq8x861pIBzgtFX4DPAlQiCKLYPp/CckmVkIyRB54kdMZ?=
 =?us-ascii?Q?adwiFSkFeNREq5ropy1+hi9+92/fXl5lmKwNDnM6tzbRarnv+Z0Pqn9T16Rp?=
 =?us-ascii?Q?0wtgtADcXaDgr7/fYS1z84E2ASFIUjCAvZbhnEC5YX1goYcPMcnV8ypabnPA?=
 =?us-ascii?Q?K7y6e4mM1Gh+99BVDfecyFqexcZua0DpcOFa7f9Cf102Z30ILz0l/6a7FZJX?=
 =?us-ascii?Q?poDD/be4M4NdFybRANdlmuAD7Hr/UmPm9BR7O8IZnf6ZJOFlYB3A0x6s5Vd6?=
 =?us-ascii?Q?NFwNjGN5u7pQb637RGFmpdaraqJIHcj6f4873/+wtn5tUhAF1Me4kEy36ABz?=
 =?us-ascii?Q?Hoq1ucW8giYyyV6G6WVsfwQnGJr5OvJWYh9Jz4fKUk5SvfCCRy9itLImyDm1?=
 =?us-ascii?Q?JCsVica3ZIcel+DmNB4iBz/Hc3dO8ARwnqLBzpL2ev/kRU2LTDHF0BVu69Bj?=
 =?us-ascii?Q?YSndCvCJJ4e7YF2Jm6aYXXmn2CpyOdi7iUegZgylOLCiJ+cNrP2T1X5ilMeW?=
 =?us-ascii?Q?A1ReyIPB73NkgWSX84bIP3zHsGTHypjwOYxkET5xSZ1HETcg6YZ5QYo9ae5I?=
 =?us-ascii?Q?fjD91Ao+M+wG/OjZjIokz1+w0K3zpic9Gf+CLZ3GNGHpodSZ9gXWXqKuDQBA?=
 =?us-ascii?Q?aGVpAOBl5CZUhLMYdYwnEWgslCgDOTB5Wey4w7SdT3OuTMHif1rn+q19PWD8?=
 =?us-ascii?Q?cv/3KcqfB3c9gVPAd6kWFRRoW51dR6Uy6ZBtmak8an2oJH2Dz9aceGsIAVvb?=
 =?us-ascii?Q?eD3vl6SRBQTWy+8tIz0j7/HWi420FAhebtyXRL482PJLVhM7EKbjfeSizvrM?=
 =?us-ascii?Q?rJIbW/EaQCA1rLssues1QNxnHDmu3h+qOx7SDX5J75e101+90k9h+HnJvXD0?=
 =?us-ascii?Q?A901ser3PUdKgDHHP4tujcHdZCnkVE3TJkt8hvUtIGBe0q773XgMrKWZDBVq?=
 =?us-ascii?Q?GcCzwPqdMVniRkjCcWTefcZiXX+rAplXPE/4H+gZS+gSZO3/pUc3IDGoVBJk?=
 =?us-ascii?Q?cbQORSOEYWrGQ88eaFWRsPUUaFvmEJKMljcAyGP72Kjr197UTzVOCtZCXm1e?=
 =?us-ascii?Q?gE1f5swpnS4U5yNzZyZAgbmy5CwVnhIPBLyXEwx9bocXeahfAmRIiq08ZZf6?=
 =?us-ascii?Q?cW/nW4b8iU1+um6GQF1rkk2CWt6ja/aXzEHXjSzhT/6L9RQ/qXntpxoneqgY?=
 =?us-ascii?Q?eHtOwgoegJf8FusAgqEU3x1Lyv8nfgM4peHJD9ohBjOntxHKGa9QNmLO5nig?=
 =?us-ascii?Q?iskHmKlh/A8QrMhBrHwclZ/yJzgGl1TamnRZ7/hbnA5dZRJAR0g4iC4ZHiwS?=
 =?us-ascii?Q?hqJcNjiso+wLIWRtZkoEwLA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4f61af7e-4b6c-4007-9586-08dcddbb4b35
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 23:39:27.1237
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 y9lCDoikfAKqCdi0udcKJgmuMx8Ah+8Y6xREcSMi6WWE1fO4ESGmQHAla7oK1tXYq9sE7VFrMBt+SowM4nWBzSit3dCT6dmtXQAPtYeEr5THFE0VOk459mcwpY4eFhz/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10634
Message-ID-Hash: 7W247FJZVLEQN5IWR5IVT7753U7ALWIN
X-Message-ID-Hash: 7W247FJZVLEQN5IWR5IVT7753U7ALWIN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7W247FJZVLEQN5IWR5IVT7753U7ALWIN/>
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

