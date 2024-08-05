Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE9C9472A3
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:54:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 963663C53;
	Mon,  5 Aug 2024 02:52:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 963663C53
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819138;
	bh=ZVla2kCVfa7OyH6JF+K1WgC/yZlrEDto9pnX6hfnapI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ri2IeKlaVCpaVH6sOvocK9lkDWdqgx4Oj0Fxl+RQC5DgKLswJYzZPHrnzFYRLfvcW
	 DE8gFSAT/vHVmvXf1X0/3Nk1cNCi0jhIFsKG2a5W8Z9uw5rD4885uzBgHjTWtomIYY
	 C52VkWLYKr4Y+gQXEwKqVqaT+wTACN3yj7uhzqoI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 865DEF89A73; Mon,  5 Aug 2024 02:40:13 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 32D06F898C2;
	Mon,  5 Aug 2024 02:40:11 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3F7EDF8988A; Mon,  5 Aug 2024 02:39:23 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 90E05F896F2
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:39:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90E05F896F2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=cSPFrZCp
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rprrc8CnulSq3eIEOjYdXT/R6PyGizQZARKtPK2K64SaUzO+4UBt6hf3TM/8VN5sez+6Z9YDpnvpqLJ4ro8gEYipTeGF+8aOr2dPyB6t6YZzRyFrqqDr8kVJRZKfA0Rdlf/cu7kOzS7AaBqQCQTz5fSv7hgVlmlGBhezTpwRO2bYZB/Yp9N0QC1dwbyqkcZyF0sjoIDP73baSlCdMaWX8K49LzUY7idg039LPVNDsh0VANX8M/DRWBCxe01eYUO0CY9XWUTMaktDfZcON4FP9H6X2d28K1g59AaDiDL6eWcWMJx/awPW1ZZON87Jh5i+MVnYI+mo3PdhBV7uJBVUwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=diqNshMfNO0lQYIcWhAiRyqi4EE1UTUgbAzeKkTFsGk=;
 b=dNJPe1BOH/sAC916ZAjz4qRyeEmYlUBJlXczSdihT9EKreIRodsXObZexDzPohPWad9Se+t9t9mZbP9x52XcTq3UcrqpBA2ffXHbJ6eRM6XNOXDFtL2qfyDXdBAVdruRRnkUj4xWmHrlwuTijJWpxSSLNCboQiVYjzFKDoNCNVIytHHQgl0e5G4R0vr8hmW7h3JFO32CxDLKkuDNiB3LNxDoRH4m4wtzYythnB2x5rWYDyKhmNnlaEeWTD/xDYoZ2gGR6nJ+bEuGIRG5vdXy5ssBGPjatjlnVg8L55iq43sxFUJ+LNkWk/l01sF04JnYH37bc4b0DGLSsfFoq37FeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=diqNshMfNO0lQYIcWhAiRyqi4EE1UTUgbAzeKkTFsGk=;
 b=cSPFrZCpDPme3CZ63yjaEGBM3H+nhzn1LKmOtWadcaEKMfKh0C2zgb5a4/Jz+oYMwagkv2Fzt4ZVlrsVtNtxWWblJbel7DpCWeU4lwuuFxhOBrqDRFd31bYwDbXS1HcQn6yT4TkeOQmG7y3b7tjx/YNoIF5Sj2zBLWEl9afrzCg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB9459.jpnprd01.prod.outlook.com
 (2603:1096:604:1d0::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:39:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:39:04 +0000
Message-ID: <877ccvztuf.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 048/113] ASoC: dwc: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:39:04 +0000
X-ClientProxiedBy: TYCPR01CA0148.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 70b70dab-b8b5-40b7-00ba-08dcb4e7021c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hsebqS8rhKR9qM3QLJpIWRjs/RCiXTvArChppTQMOTd9rf416Az+CGLtv+iB?=
 =?us-ascii?Q?P7NRr640aR1Y9aE4hjf3T1uIuz2n5oVSwoWlzTtZbgdxLzTaj9RaSxWtr1BY?=
 =?us-ascii?Q?xeiv/yzVuYSYp3XFWg699x4T/cid4B675PSgGxbFkihiSX0gz2UwDZ9/ao7m?=
 =?us-ascii?Q?7niYRdVI77Jr5d76XPYkR6vH7N3wHxPlImfuFl4H8vMKI2I/uHCW6CyG4BgJ?=
 =?us-ascii?Q?GvOlPIoqparig+vUtG3KhAG1OzV+qQz6wo/k6AKXETYyvNLOPK8v54jb3kER?=
 =?us-ascii?Q?2FXrE62bnd/QlmsCFB68Bi5237qFEfV9gMqQ6T5dZDjVJomo5skZ9WHE5OK2?=
 =?us-ascii?Q?N+m5o0crHzxzFu0b8bzo8KQHjpEW/vRh206tVmFbPyTEnCKKqwAI9oj2FW6T?=
 =?us-ascii?Q?05fnjb9G4nHBeRfNZlyUAtMTdXJdB9TuZ7nC8bfWyNgANNp4GyhLL8hm7+ty?=
 =?us-ascii?Q?NJW/nE1gH/sBjOCf9btjhdtZOsWIlmuam6bBzkAt+UOsuV/o1cje1LPmoTiO?=
 =?us-ascii?Q?vHg0/X8hBZwDrom2zSYMIvcseHFs2f2Xsqv3F17U/9IiFwcNsbWwCMDx1lBM?=
 =?us-ascii?Q?+VzEWaL7I0iw2GOqzCwCGwWAdTe7/CoAsi8hN+gTMUejJYrWiO/VCrzw+9Q4?=
 =?us-ascii?Q?vAzJdtCQXyM0roPP8WPOO1VtyE5CgLmYu+61hGfJjl7kZwbybESXMxus5nF7?=
 =?us-ascii?Q?nOiBuzvhcTJfRxehT27werCdFHDa0YgMH4gp0PM0koQmYbUMPt0ZVlxxMFkp?=
 =?us-ascii?Q?y1Z7AGdIqlLGqDBWzxASwPmPY64rN3y8KaqBQ/NP9s3YVFhmkKm/KzmyQ4s/?=
 =?us-ascii?Q?TJNuRUWo26XmwRdyE1a+Ioz6906NcJ97YadDa4tzma/UvjdE7V8cKaAOW69A?=
 =?us-ascii?Q?zk6PIlZL6UMhxOs4E24ODdp7zKmKGRbEVZVAf9wi+wIW55gX61YHS8ai+HtZ?=
 =?us-ascii?Q?jJEPA6/dgyZr5UeEIizbt9zTPatMahmqI1RLkk5ZaZvRBrRVnI0wFADfMVSo?=
 =?us-ascii?Q?BQIluoiFKXSuaOs9H9FxmhQykTz6vfFLmP7t9aecpKZ4oxkZsGl0GrHXusgU?=
 =?us-ascii?Q?NEVFlz0MNSIc2GVjkHKqLc6BCDhBZiX+Xh9wnrZoJB4oz44Wvi3ikDQb17C+?=
 =?us-ascii?Q?SZfMu9mfKESXcVsKTmj2edGDsFBm5I4420rtGeOCQxuB6Qsa/WcSze11CbxN?=
 =?us-ascii?Q?4P4RM1YG80sygInRgIDMKCLrcnNVH1slRtdNplS1ngKNDtnrub7O9Ki425XX?=
 =?us-ascii?Q?XW3g5LLegUwOmqA8wVXVl41Ktn63RQRqfkjIpXlWdRbt4qomRvWs8aLoDXyS?=
 =?us-ascii?Q?m5neyL6sub3qrTmpfYIM4CFnqvrpcTlfPExIfSB72TZ4DgPAutUTf268jj3U?=
 =?us-ascii?Q?mKH3hnG6CgFZHVKmFSugroDCah/yjcwqfcazNYdql3eZV6yi7Q=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6fTSicm4/IPXv4G1kdyWqBbzdq8GGf2+eGuUHtLlyqZTWIyeMfMBs0RMints?=
 =?us-ascii?Q?udNSnRM5lXhstr+NqpxMAO/4hsIOEsGewsOAkZTyttYWdrljk6kWnGGVu589?=
 =?us-ascii?Q?Xp+05gddzV/15m+X0K7kZh6CSvSXZPCGBrVuGik4ev4XZnm0ZBOzOhHfLpj1?=
 =?us-ascii?Q?HZbT7gRV6Iy5owV9yFLDa4IuBS8PbLdOlx7ETJPe+wDXuH9q/yboCSw6InSP?=
 =?us-ascii?Q?T5yVa6nN/OWypH1lC1CSAzheRIttiw5gJ8aOyDQRshu+4197aCY5UxAs+ZzJ?=
 =?us-ascii?Q?iHsWKWazYLIu7aKQQl8xMLJPHhMlnNd2jRG+qS+BT1zVqmC7XcVGxdypU1wW?=
 =?us-ascii?Q?/k2w8JhhRpsC4iRfFpHYKk+Ll3uKD+T/rXh71k5GWTsrfVMWDT7V7sArSLkE?=
 =?us-ascii?Q?kag2ZLubmDsVWkhJXjHsHaexeW/fRG6jrEche4sE+iO4LuxERr/HPMgy1rMs?=
 =?us-ascii?Q?GX2r4RtS3xJRJbBuf6EwARCO+dFqkh9BNb+67rfviHfCh1soB6rRcgquCzih?=
 =?us-ascii?Q?A33sFZXA+ItI8AzN9RN18Rec6+SvTYbzEj91TGmkdYsm5toVIiynf1THhYBo?=
 =?us-ascii?Q?2jHmGuPbS4ZGhmwrROvWoz8oAVQxgt5zlJit8YbAMRznPFO0hsSwkMNUSb8P?=
 =?us-ascii?Q?pZF+u8LfX5Mi5QnKE4BANVUQZmTlICZOVgUzjhCFVxijGyb0Ab45vKg/XzTE?=
 =?us-ascii?Q?cXPOVJ6pU5JNuswYOza3+c1V+WH3p85Q1Kfas/TNGihaMt9Y1Wi7dOe+WrZs?=
 =?us-ascii?Q?d68cHQtwFJi5+4b1bOTmTzDU0WiGBu6HOEdQzqevx+91kSAl23di73D5LSfW?=
 =?us-ascii?Q?zCx54XT89UOOst9rHJ/cjL4tUdoom5/fnjJX2m/h3fGsB3W3AFIMK5R5D6tU?=
 =?us-ascii?Q?qISUoBWIUR9Qv1U6s0AyQ+ggqn7YES43VTlGS2y9cF+F8F30IxagRw/0RzNN?=
 =?us-ascii?Q?lNROyQ49tJeILH/BFjy6J1VyO4I5szEixPiT1k72SKRS56ccV1k2KteSYyo5?=
 =?us-ascii?Q?xlccoD4aOBd0qvKStaEPd2Fqwvod4lT5bIm+odIGAMN3JXbytKEaW6+WccXq?=
 =?us-ascii?Q?3wFK8b+9WfQoOz/BZATxRoTOmcPGr4zIz7J4xmCNSM/65JmNbneKMM6Jgqpf?=
 =?us-ascii?Q?uqTvNoriosOhs9gwP0dVPQKOiN5SKbVuJ6kLNEPC+CiXZab/2KapbnVcRQ6q?=
 =?us-ascii?Q?M65ubmf7akLY9mKzpV5t7WbI1tQhWXBT8srm/wPStu6b7j43cmxoy59XmVcA?=
 =?us-ascii?Q?o1MPc8kSNB+6m+03EEvZB8h02QRzCtZ11MM3FEjLtYTbp+Bj6MA4hG8zljiG?=
 =?us-ascii?Q?A/Vse8Z0y+PkqyA34Tet0STpTeuKJlvLLa33NvQAxDclV20uS9UAC/DISTav?=
 =?us-ascii?Q?B61okCfZumDhkdK9NAUikwfTa+9a4kNVPFhiIkh1BdYWMqh2l4HO8hahONa5?=
 =?us-ascii?Q?K40PfGB7ZRT2o3E7we1cLcjXZsznsWH34AD9S7rNI3iOiZISiKAnbi0lOjjJ?=
 =?us-ascii?Q?XW80fGpLfC+sDFHnIc4coV3gYNVAdLtwBVFgT30uVI0JoDPp0r99T38zZg3E?=
 =?us-ascii?Q?vWQXfaIPSzKeCI+29WTVZYBfXm/6v9Zdbdv8fdtYrlsEwy4VZ/18qe3k6g08?=
 =?us-ascii?Q?25dWpnaTA0yCKKqBjaH2jjs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 70b70dab-b8b5-40b7-00ba-08dcb4e7021c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:39:04.6655
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 +xtTOvRolP3bWeTJIyogDPntqzmq2DaNmUwtDE2S44XiMn262FugBThct+zL5lGMNDivsk9TTMOMMmcHtm1sprVAbo549oK1Zt/ma/dob0y2HBbzzFJ3kEWohbS0+yGH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB9459
Message-ID-Hash: IWPX3BUCS5SIQNYP4PZPB2KUALN4CQT6
X-Message-ID-Hash: IWPX3BUCS5SIQNYP4PZPB2KUALN4CQT6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWPX3BUCS5SIQNYP4PZPB2KUALN4CQT6/>
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
 sound/soc/dwc/dwc-i2s.c | 20 ++++++++++----------
 sound/soc/dwc/dwc-pcm.c |  6 +++---
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index c04466f5492e9..874d5bf2985e6 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -42,7 +42,7 @@ static inline void i2s_disable_channels(struct dw_i2s_dev *dev, u32 stream)
 {
 	u32 i = 0;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		for (i = 0; i < 4; i++)
 			i2s_write_reg(dev->i2s_base, TER(i), 0);
 	} else {
@@ -55,7 +55,7 @@ static inline void i2s_clear_irqs(struct dw_i2s_dev *dev, u32 stream)
 {
 	u32 i = 0;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		for (i = 0; i < 4; i++)
 			i2s_read_reg(dev->i2s_base, TOR(i));
 	} else {
@@ -69,7 +69,7 @@ static inline void i2s_disable_irqs(struct dw_i2s_dev *dev, u32 stream,
 {
 	u32 i, irq;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		for (i = 0; i < (chan_nr / 2); i++) {
 			irq = i2s_read_reg(dev->i2s_base, IMR(i));
 			i2s_write_reg(dev->i2s_base, IMR(i), irq | 0x30);
@@ -87,7 +87,7 @@ static inline void i2s_enable_irqs(struct dw_i2s_dev *dev, u32 stream,
 {
 	u32 i, irq;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		for (i = 0; i < (chan_nr / 2); i++) {
 			irq = i2s_read_reg(dev->i2s_base, IMR(i));
 			i2s_write_reg(dev->i2s_base, IMR(i), irq & ~0x30);
@@ -156,7 +156,7 @@ static void i2s_enable_dma(struct dw_i2s_dev *dev, u32 stream)
 	u32 dma_reg = i2s_read_reg(dev->i2s_base, I2S_DMACR);
 
 	/* Enable DMA handshake for stream */
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		dma_reg |= I2S_DMAEN_TXBLOCK;
 	else
 		dma_reg |= I2S_DMAEN_RXBLOCK;
@@ -169,7 +169,7 @@ static void i2s_disable_dma(struct dw_i2s_dev *dev, u32 stream)
 	u32 dma_reg = i2s_read_reg(dev->i2s_base, I2S_DMACR);
 
 	/* Disable DMA handshake for stream */
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		dma_reg &= ~I2S_DMAEN_TXBLOCK;
 		i2s_write_reg(dev->i2s_base, I2S_RTXDMA, 1);
 	} else {
@@ -194,7 +194,7 @@ static void i2s_start(struct dw_i2s_dev *dev,
 
 	i2s_write_reg(dev->i2s_base, IER, reg);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		i2s_write_reg(dev->i2s_base, ITER, 1);
 	else
 		i2s_write_reg(dev->i2s_base, IRER, 1);
@@ -213,7 +213,7 @@ static void i2s_stop(struct dw_i2s_dev *dev,
 {
 
 	i2s_clear_irqs(dev, substream->stream);
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		i2s_write_reg(dev->i2s_base, ITER, 0);
 	else
 		i2s_write_reg(dev->i2s_base, IRER, 0);
@@ -253,7 +253,7 @@ static void dw_i2s_config(struct dw_i2s_dev *dev, int stream)
 	i2s_disable_channels(dev, stream);
 
 	for (ch_reg = 0; ch_reg < (config->chan_nr / 2); ch_reg++) {
-		if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(stream)) {
 			i2s_write_reg(dev->i2s_base, TCR(ch_reg),
 				      dev->xfer_resolution);
 			i2s_write_reg(dev->i2s_base, TFCR(ch_reg),
@@ -352,7 +352,7 @@ static int dw_i2s_prepare(struct snd_pcm_substream *substream,
 {
 	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		i2s_write_reg(dev->i2s_base, TXFFR, 1);
 	else
 		i2s_write_reg(dev->i2s_base, RXFFR, 1);
diff --git a/sound/soc/dwc/dwc-pcm.c b/sound/soc/dwc/dwc-pcm.c
index a418265c030a5..673218e010607 100644
--- a/sound/soc/dwc/dwc-pcm.c
+++ b/sound/soc/dwc/dwc-pcm.c
@@ -200,7 +200,7 @@ static int dw_pcm_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(substream)) {
 			WRITE_ONCE(dev->tx_ptr, 0);
 			rcu_assign_pointer(dev->tx_substream, substream);
 		} else {
@@ -211,7 +211,7 @@ static int dw_pcm_trigger(struct snd_soc_component *component,
 	case SNDRV_PCM_TRIGGER_STOP:
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			rcu_assign_pointer(dev->tx_substream, NULL);
 		else
 			rcu_assign_pointer(dev->rx_substream, NULL);
@@ -231,7 +231,7 @@ static snd_pcm_uframes_t dw_pcm_pointer(struct snd_soc_component *component,
 	struct dw_i2s_dev *dev = runtime->private_data;
 	snd_pcm_uframes_t pos;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		pos = READ_ONCE(dev->tx_ptr);
 	else
 		pos = READ_ONCE(dev->rx_ptr);
-- 
2.43.0

