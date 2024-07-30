Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC26B94041E
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:07:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 584ECE76;
	Tue, 30 Jul 2024 04:07:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 584ECE76
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305267;
	bh=hxgWa2YUKvRfpAj4OkVnzgaaH9aGWE4xaeMqjuCtZ28=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tLllXT0RmdbXBppa5C52JWRfjFLoTzE3EDTmkvLpyYGFgbZsXWYL8YOgUAAfN9BlM
	 loXYAehYOpJj1CBRKS7IYgLJEfaciAnqb3M2xABEF0DLHIMPBsZyyj0ImfxCfhB4mD
	 K3f8HwRSeu5HocOgSh3yiRRyc6AXNP2dRGOMlraI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75F34F805A8; Tue, 30 Jul 2024 04:06:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5FECEF806A8;
	Tue, 30 Jul 2024 04:06:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06166F805F4; Tue, 30 Jul 2024 04:05:59 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id C2910F8057A
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:05:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C2910F8057A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Nc8Mgwfg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BhbdysHYVd4SJhE6A3M1fK+NtXIVQZz9phjIbS9B0ZHmP8Gp5s+RQMl+PhOEsqLLFX/AzG75xAU7tSGbGFwPIYc16KJUFcLAIHepk11RRItMNHTD5BalT4PaPFfR1BuFDY8p5Y+oByB9C+b8HJG6zIixCQ0BDhgNM8ymdCRqv00JEIDo5cZTHllQ3zwGUxRRTRJFVbagDvXTNBicn0ePDmjy6fDVg2gWZCU7X0mEib52OmYR+ZlinO2tteL1aPqP/4rd0+53tb1aUmo+Mrw2IoUhm7akp2JNdegoVDKaHruzivKKCM78UFpzmPyJrp+ODlvxfKkcyDQa9Yx7mfxsBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EUAtbawBbde7dUata8p43IzCdsHojxCarM2/h+aXbTs=;
 b=eDqYgo6h/mYrA+Sb6GBxtCl2ne2wa6DvSw0mOzDrh8bED5YPamNC1+j7HD6yInmOtyF59xzxYyVv0JMFnSXy6gNZao0t/lLv/YtU/2KMbV+pfXawCgaCg3TG1cEvGLctRJpXceTQtXGa+v2CB7QLclgdWaU8ii4aUazjINJdlypzcuRjhs8B0VcwAy4u3IxjJUtAf8gYufVitcRny3136CYj6mxvOaEGYMiaw/t02/yV8Fee8gurmm/YkezXeEJIdpMdW7x0ksGpbkGDmhvaD9d5IvrSj36IVHasVj5rYpHHiBVy087F5VtxnAVDRMnM0PO4OSheqXvuDkS6OJ3Elg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EUAtbawBbde7dUata8p43IzCdsHojxCarM2/h+aXbTs=;
 b=Nc8MgwfgjHDZNV7wUVR9X/TkPhiQuPwOlpnMq4cTzMtElgaRGd8W7Ue3wc9AxrAXhyUpe1Mol8OVSVZKbklpxyOM+apEb3ul59dlFkk8ZXphA3T8ESHYGMKPzDw4v8RZIVynQk6SLz8Si1IWDitWbdIa5GjjJE5KlfhcNr3slZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB6427.jpnprd01.prod.outlook.com
 (2603:1096:400:a1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 02:05:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:05:53 +0000
Message-ID: <87le1jk51b.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 08/12] ASoC: sof: intel: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:05:53 +0000
X-ClientProxiedBy: TYAPR01CA0138.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::30) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: f9e2b42b-a69d-49ed-4d2c-08dcb03c2441
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H/p9AHEYW924eVnHnZoLz0DoSofI+d8GpU4j5ODNvbAO94oQg/GgjWQYw6z7?=
 =?us-ascii?Q?vaZUpzrEgqa1YcFOUm9eBRHfssd4NMB/9HvQBu7V4ysS+aOZLfiLsf/363EM?=
 =?us-ascii?Q?2hRpCjeIaBuGzAoQ33vdnC+KE/ALF7nL7nJpqIK3Nx38y9ez9u2J2IuS49vp?=
 =?us-ascii?Q?QILv4qwnwEqRoApXpWHJjJ18yAnv5vI+VOcWRMlGgwUKt74lia9fbfmPPVgl?=
 =?us-ascii?Q?xycTE3+Uh2jv84IUQGFUXtxzGqomSgiKbRPehUi1X648SXVgV/TtdH5Zx+1a?=
 =?us-ascii?Q?Qs/h0h7WCvedLuNO+X2QIJt2BGacEB3Fq34MbjUFPltR2tdpAuyWNZAC5RgI?=
 =?us-ascii?Q?VIQqop0m6k+awH3xG9SG+FljO/o1/GGvInVOrM8ynKLYWBtlw4QxYurKuFWh?=
 =?us-ascii?Q?YM0TRSdF1uXRYAMpNCD1kRgtLtxAbXk2CbipgplbedlcV3dyJEES0Rpsfyc6?=
 =?us-ascii?Q?za59EI7gzR25AtPrk3vfvPWPbCfaQwyBQGJK5MSC26jUj5wWreJPWrEZ1JpB?=
 =?us-ascii?Q?knLbvh6jWJV9yNq9KlZmiKrcnQlPUQaHQhcKgC2DlReZ7yKWFewUUXen4wI+?=
 =?us-ascii?Q?6IdfSfFSFWm3szbXE3L2gMru/Sl+7BWbfju/6F+5/f0Pn3dOaCyJurgmHSmN?=
 =?us-ascii?Q?KgLa3/dKBlOYHF+LD+njE6X3y+Dd5ZkmyOWcBd02bH1BDnql5dOvXlHbFU9H?=
 =?us-ascii?Q?Z759eoBIv6P2x6Vws/8OwuciNSM6FhKVrhD2TZBXc7EHPKlvbAv5gRGOWOhV?=
 =?us-ascii?Q?w48K/L1B0ppHc6dc5dlPoK85iQK5koY8T8x23V3PXyCPjUxOAK4CCRqOVkPM?=
 =?us-ascii?Q?msoWaF33+UZN8aNfzkPceXi4R9dCVZXeaKLo/8WP9/ljplmPqJb9hOA0iXUi?=
 =?us-ascii?Q?iSsmP/aBJkMPhxYAXWAc4lfqi4pycmXRhQ1IaelTGZ3uG1dB56XMfYnyhyFU?=
 =?us-ascii?Q?lK80LM1rUyyJSRgrv3XpjyFh3nDbZKjpKB8zaFwcKlQJZQXvui3lQzoS3uFo?=
 =?us-ascii?Q?ji+3YFl8ib72DgWTUKXrRcMZtcDEvWF8+4HvAKmfadLEHvgw1Z+a4RTLuiu7?=
 =?us-ascii?Q?m4dD1hjOmQIuSBY1ar0JtGrBAE+A0ANXOdZGScogN132vBtwrExzYD3swr6z?=
 =?us-ascii?Q?fFWlN7MvEv3yk9iIkx2lczpCiVZeX8d4YHxvELWDh1msZmjuBICn/zZ40Ygo?=
 =?us-ascii?Q?Yhu0fwYRB94AMhuVpPMkZzzbQOrYDcFVBf53kiJq2uzixGTwL+DQXgXoH1BK?=
 =?us-ascii?Q?F3mrKG5LrP9gixYvfnWLzUL1vB8zUeNx/FIg6VTS2SGgYyo/wUsKRbfjHv0r?=
 =?us-ascii?Q?sx7ti4BA3vD+tcQiMwnXmNSVo2LTVoa83YD7R/uqG+5oOhsNK0AZSVXXdyvD?=
 =?us-ascii?Q?SYapITdG8gI5hzxc8FqHrhifqiVuaoieIJ/G8mAFabpQrBK26g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/jkalKXYxrcPdAF6XKMiIe4HJE8+jS1Yh1G99dXXtQb0tnRKd3A1bSpMe6Vo?=
 =?us-ascii?Q?UTtwzPV5Ha0bf6a/KNxu67UN9aW+UOAQB2WntBf8hxMYlIGevjbfZfI4kqE0?=
 =?us-ascii?Q?76KuYWGPg5WOQWTkQ8S0EDYRuGFRHDZPt/W5RQlHBVac3DIZdLrpYVRvBhaw?=
 =?us-ascii?Q?t1TNeS93+auWhhmz+Pgu7ICZLIpJctu0uXZM58smdCL7w/+E+o43DYvVnDvZ?=
 =?us-ascii?Q?p2tq5n5w2J+Xm7dNz/cQEozfdTn6nJb4l3Z9kvla1wVG0qYLfJQMJIbdYJjT?=
 =?us-ascii?Q?tNHtO5m6OnhyGp5hNe2yv0n4/ytHM9httXB8XAkeA1Jg+DBy3OT9FJ4ZhYEk?=
 =?us-ascii?Q?0Rx79OnHiwyO4RBjuerSFtMlwwdSi0Ijpi2+dcX7j9gIQdjibKDg3sAQ7dc3?=
 =?us-ascii?Q?bvnzmKysEIAea7FST0vyCP/kh4Cjlo0QGvxcOzkWCKphUnHHa2VdY1PXYJjB?=
 =?us-ascii?Q?jRpTOFK4UURW+ypNPzDY9pgIOCxs3w+zSqHNWc769ERpQ8wWuXY/sQgrNYBS?=
 =?us-ascii?Q?7TSRfP1r/10wMkVEmBQISI438TSQSZRqz3zxMMWfWv0P9/vJ+erQdMhin301?=
 =?us-ascii?Q?RyOn0YfjixtM3oNdSLCVsL2uHRbst0LBAAuphT5G7RTtO+J7f+tshxwDGX/t?=
 =?us-ascii?Q?zH6+0Cx2AWPhkAG626OTSbyY/X8IUnV3mQzh5cm19Aij1pGq4f4d9SVxT5Tu?=
 =?us-ascii?Q?uvR3MWdv2imdchcheY5psfTXdf/orDQqZ6sGkLDZh1rQdCUb2Vf67I7ujgi/?=
 =?us-ascii?Q?h9UgtbrnkYvkYy9wAL5Z+ZnR0nEc+fnwvdoJ07H9+YC7bozZJVdXMWw+EYPD?=
 =?us-ascii?Q?H1yid/kL6z5C7fsU4IihOrbrmmiwz5YUzR0cyAyAIvy4N4AHBXO1CtQLFE45?=
 =?us-ascii?Q?MQuQo7EWL4Bv4MXbwMfUiKe+qtiFDXf/IUr9wfafnh13fY9527RngYLDR1cn?=
 =?us-ascii?Q?P6KYtopHHVo+d8v++EaUzZ7wk8OGerqaThf9eQt6XnRN+4Ju39UNRsa/r1jT?=
 =?us-ascii?Q?IS7xzhTAwzBiZZUWnNAjb0fMkOkj1LDswPQZ+1Oq7Zr7O9w/eWd7B3TR+BiR?=
 =?us-ascii?Q?HurnFhJ61IDT+EMbxM1x7JxGq1BpXSDz4rSWdo8gKHqUL183Bf0XsuJFIMF2?=
 =?us-ascii?Q?Vvy4ooUzc3LGTancWaSQO7yCUeMLTRZGvpwpvFbAKU4QZo5Wm52C2G/TJkti?=
 =?us-ascii?Q?HICsnhUuzZ8oOJXXLyLaXaKETvbWxBM1xHsHW2piKb1sEfrXsmoPmb9pgjS/?=
 =?us-ascii?Q?sy65wPgfUioOjE1ibuKNX1Dco2zqJNG6R7C3+KEQqv3p7STLACZ54Av7+s0A?=
 =?us-ascii?Q?P0NOJI+gp/zJrBnTd+nhkIhgjEB61/TQiwiKbJCW3cEVOz3rXTf7LeP+0sNR?=
 =?us-ascii?Q?t/BEmq8NEgQb6QpmGdq4QTBzAJMoMiIKFPDyPCqZB8dTvwRyRCFT/NHEbZCV?=
 =?us-ascii?Q?80lNwb6VsUfStIhAhYzqbzEx+vmwAabpDiV4NK+8tI+OmC8l7xdQAT/q7maq?=
 =?us-ascii?Q?bhUTqClBUUmvcHVcWhGKl4pngXjLqo6AckNN11R+/FOKzqov2sfidjjA25n1?=
 =?us-ascii?Q?kB0CUA4t6l13CeN3enVADYSudyNEn5S0au5ss4BYAx560f3BOyq9/dM8ftnY?=
 =?us-ascii?Q?5+wb8HspniZTYebb5u5KQn8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f9e2b42b-a69d-49ed-4d2c-08dcb03c2441
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:05:53.3965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 CeL7F8tJ+TPLs0PF2bJBQ1g/x499BTF2cN3ou+Il/dUwxuqgUICOljrE/HjUTrH/ze0CRqSeOXiYWSf+QUbQtwdMoHP5pW3GkjQwGvaQFpehUa267HT674pBxmktEnqG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB6427
Message-ID-Hash: HDCLEEZPQV2VJ5S2SFCQNVJV77ZSICZJ
X-Message-ID-Hash: HDCLEEZPQV2VJ5S2SFCQNVJV77ZSICZJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HDCLEEZPQV2VJ5S2SFCQNVJV77ZSICZJ/>
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
 sound/soc/sof/intel/hda-stream.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 8213debde497c..3ac63ce67ab1c 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -216,9 +216,7 @@ hda_dsp_stream_get(struct snd_sof_dev *sdev, int direction, u32 flags)
 
 	/* stream found ? */
 	if (!hext_stream) {
-		dev_err(sdev->dev, "error: no free %s streams\n",
-			direction == SNDRV_PCM_STREAM_PLAYBACK ?
-			"playback" : "capture");
+		dev_err(sdev->dev, "error: no free %s streams\n", snd_pcm_direction_name(direction));
 		return hext_stream;
 	}
 
-- 
2.43.0

