Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 283A7947272
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:44:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 18CFF32BD;
	Mon,  5 Aug 2024 02:43:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 18CFF32BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818608;
	bh=gsde/cJHAmwbbp22NkWXiU3qOdpEOOZulO9Kz5BIpxI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=sKZmkxm61S45rHD9ml9MRXKWduwsCyfp97nRzqntT//iNA9nvo5o6tAbboglLnN2a
	 elGKA4a2e+x9E815nGBrrQ9m6WPuRCBRyKiuts0PNlEsz6zKBUDDecnDix5WyUXJ/A
	 Ymij+jDIpO0X6nZAk5a1NN3Av+4fibe+Qe6A479M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D26CEF80C78; Mon,  5 Aug 2024 02:39:09 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 833FEF896C7;
	Mon,  5 Aug 2024 02:39:09 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6A541F802DB; Mon,  5 Aug 2024 02:36:08 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D461F800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:36:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D461F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=GsoVauOt
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dZAIFsd2fqVfMp1dhruRW78cutgGPSAnkh8MhXGaIxc3XfbR6yNmbtKeBmCx3QkmsZFAxJPvBsq8hBAtWeUliqUXpomW96JvaZSco7zHtZ6XBHvpI6va7BHneJipDzFur3kh2nxcaKZuI3gcVhkwkuefAOxmqEQ6bx0xW2oH0uWCm0YY5GgPNeqSI/+gvfM7WjoXtpDRDXabRlHMyC8f0SJsIe5d6NVe530eBs5sU2eVX5F1VnUWQ4J+f/XAEcrPoGNEv+T/leigGS/8+HJNXf3awYyYkqnbyB/70c02J7hsgYHEgYyLNembR80ZKf/F+8X4PrZ8MiB0n8xobZumPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GmQw3MIk+q98y/3wEF9FGiNcya3N5KLX9JV2Js2j0o=;
 b=tMnlJH57bLnWnzuwaDvhjoE3WNPnIK1cQK+g18T83EunNpzBWSOrjDwjlnCmcTIn16uQvkGoTmzuqfVjfYNbnUt5sWgibDFlhFe9dBFTJPbdMc467APrEhxOCpleOKYIWf1bb1O+J8qDWxIJAxQhyIVV4n/lqHccHCo7ogOCrhIVj2/ZoHlfZkQbpENkGiui5+FcpWQFjdTNky7iWaiRev0Xl+Xgr49QzEJehJEm4lunOqKEeMgPdzBQcTF/81ycyqOC1GdbY0GH3Qi1paFG9zsdPqiVjNJwUWe5zjzeBSRpX5M1zUf1jYLSW/BLeMIH7LPuQdNj2eRxDPgs1wontw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GmQw3MIk+q98y/3wEF9FGiNcya3N5KLX9JV2Js2j0o=;
 b=GsoVauOtpTMNpxtvNEhf2MNDti6LbC9WPFxY2HnYcsONrUrTyRVbwhOv/4nXhEQnEDxCTOxeUINhiUCej/htyTeTYkTSBudekEIGgrR04NIgKuqffMoxteQv2xwntDujWVvLagFI/TZ2s131r7iAxnSNhSjwUwc7pmSrHjfDts0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:36:01 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:36:01 +0000
Message-ID: <87ed7324cv.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 018/113] ALSA: pci: asihpi: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:36:00 +0000
X-ClientProxiedBy: TYCP286CA0163.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: b92e6272-e5e5-4cea-c4a5-08dcb4e694b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?S+UStLMKpbz4S4yUmg0kB2BIl28ch6UHBTYEvIji0KR3ShjKus+JXIuzwbGO?=
 =?us-ascii?Q?39Aiqmt0djBXUllqnH5duLNb0kJBTj9+r6Ldia8Nwh4TLewoM6yGWX7TIjXx?=
 =?us-ascii?Q?q3KoAq7r7gZjTXzBUTtx+NuE5Sz1/KQBLWB9Rl2Qc7ZCJu0YXahnEnsdwNaU?=
 =?us-ascii?Q?DWg+454Pq5mxfDGSD9QbSqM5tibIy2YnZWgoHG27CIaR/cnNUzCGRGH4PVp+?=
 =?us-ascii?Q?GsGFQwXzgUBesj7jjgkIZn3XpTWuwuT5ctgVwZgavj+S0mA9nn/r+qB2dZLc?=
 =?us-ascii?Q?VFrQBKOaTaWyPyFGjMfozlQlFGzTo+vrgTk/aYkU01Nn7SJCaXM1ccTVWPIB?=
 =?us-ascii?Q?FMW/53MgVj2sa2sLvEKZVzez6Der4QEcwMaYgBiCq8TGMpDNgywNAa/5VfsQ?=
 =?us-ascii?Q?zSuG4heuyntCu8DR/70FEpLp7P8pxxoABH0h3vy18hSNWb8TZfFTPs2nwMfp?=
 =?us-ascii?Q?tnFgCzRLeVQG9E/sMIkCFXJl6P8fo/4e6UpQXsDoy9YR6PlQc3clXQkQS3xM?=
 =?us-ascii?Q?PA84ogwOyoObzOuwIrDsSzeC+41Q1LIdJIo2RGgCRimmVqf7ftUv/ckcUlQy?=
 =?us-ascii?Q?XAKhUpm1rbPlh8GtuQ0RM/qTqek6ohGhrxWLwB6HljG6/r3rT8He1h5B4Mbw?=
 =?us-ascii?Q?3cWnRCh+vA4OvuyCZ1Hyp0Z8Bkt14HGEyQhvjwJyloCFbdosNtUShl/ch4t4?=
 =?us-ascii?Q?xZoqoWxeWcoUpSh7gVZOy19AiKrICf+Bs1hQU3pbMj3qXJaq3UMHgharUE+F?=
 =?us-ascii?Q?vCcYCVPqkp3lyQadco+sPjCAMhJSlIpQnEQOpwqByfqONqFdH2lVBtzVzZ/E?=
 =?us-ascii?Q?cyImS6m4xv7c53p/dFsveeGYA4Q9ZVE0EenuV+/ZJaCn6+QyzBV8bZlx1XO+?=
 =?us-ascii?Q?fAsK4YwNOsPI3CqQsFj36DzLaQP1cXOYCOSiHSALncYx/umPvCp6gtqhbSug?=
 =?us-ascii?Q?B2wHPP5Y867SxVwM3lFhtEmQOK3xuJDFDHewlsm9Z5nlvHrsj9e/jHf++Egb?=
 =?us-ascii?Q?LFaeqImlvmd6F724HQl19zHAmcJmCtGa9WXbV+gL6MYDIpIuStgie1+b7LSf?=
 =?us-ascii?Q?uor9a9YNUG3FC+70GRXGt+3gqnZktM0a3gRAPzMeQgDax5+7Ncyz3stCBC02?=
 =?us-ascii?Q?COANM7mcm8XCqbF+8t5FRQuS5xZZS/uRo2dT5DjpouLHGTfc40rIKw5cCGgq?=
 =?us-ascii?Q?F3UpzH1JKHqfnTWs+WBZv+8CqD2NeFuQRjNr6eXG9XtK+DDh9Qwd3w2C9t5T?=
 =?us-ascii?Q?Arfvy88bT8hvKteR0ZHxjWF/aLhsy/f3AH3a6OoWMkhY/fWTSP3w0PxR/Woa?=
 =?us-ascii?Q?Io54BBnHn8yFPo1YtLHPW1E0ez5nWW5kZ9KeHPA7Hf9hBkGJFsqTQuhV1tPO?=
 =?us-ascii?Q?tI3oIaZSyWGoH89PUuR3lD7AJNhMz+JRXjyw0CWoyGuUJk6JZA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+qHVx1K5SsWGLSKIul6u//CsLTtdaC+I4Kjv62Gn8lksGYy80nHZ1LxTLBQR?=
 =?us-ascii?Q?nXBLl1A4kwxCf4dJLTEEhFW/le30Qo+hOJxlEKsLaPo69NYGH0wB1hyvBKn6?=
 =?us-ascii?Q?+B0BwYt9lEd9O81pEZDApqFiap2+3XQor++FiTmJ0vGcfdFgFWS8+0G4x/G6?=
 =?us-ascii?Q?cJ8/s36X8fYRutcKhFw1NxVcVBOPZ3+O0FU25CYgvTPahyvxfuPjgPnounhz?=
 =?us-ascii?Q?KsENoZXU/KcPqaYtvpELbHa+ZbCjRAjL2MGty1SEu3CsFybV2Pw/e/PnROhp?=
 =?us-ascii?Q?0zYx171P3njbMCOkyBmioUMLXUY4sD0H5TPZQAITv3r+hEuL7jwTO+5Us6VX?=
 =?us-ascii?Q?BkIg0ks58d0qw3rybeGuSclEWkDVLtQkazs7Ei8KnsRLIfTZXhIwk0U1QDbU?=
 =?us-ascii?Q?/NDAbnNIOLNFzPSTmM8TPFxWB+TN5cxLABzkYBA7zrscD/2lc3mFbBZYtDda?=
 =?us-ascii?Q?uikoNZFsnNvL4bjnApACBCjkVsuCvmglrkYhCI21Vr0gPRBqgfw+AKwOBbmi?=
 =?us-ascii?Q?oOvXJOSEmxAI+4wWjD5jhvqDirEupFRR256ycK728EKYK1ElNTsqQ9CAqitC?=
 =?us-ascii?Q?1q7U8ALgfQ4Ybe7h03K/pEFSvw0W2+Uf8qY5JV/l7lBGn7iAtchyXuBZmBAB?=
 =?us-ascii?Q?s7O1+swJkCzcn+/z1Ifu7fRK2pOgdwZWLIaOGhTQmdvwQFrUfJ5vNVGFtHQF?=
 =?us-ascii?Q?RnqQ+dktuoESo9UDMZecAMhuIQMQKHwJKzORftRq9iv9AWaZFXiS2QX59/84?=
 =?us-ascii?Q?QVk4FqQjeEg7SIEUJgx54QcSAhh/SuikHmngq7EndSkFBH/D5+eJVcK3zoz1?=
 =?us-ascii?Q?Ez4tWRvEVF3jAO3c1oFKDBQn1a74RBfE29PiqWoctGOaahEYB9GUs73OeyFx?=
 =?us-ascii?Q?hH5Kmpn6SKsydpL/5ii5snVmEubUpsbRDHMgbxH9/J539UHLepvC7jruGFqK?=
 =?us-ascii?Q?FhBSCc8oXr4cQYTBMHDmb4B//XWINL3UtbURykYft32+Wjyap1y//4t2iV6m?=
 =?us-ascii?Q?9E6FxklmChRmHZWv/ZEPJoM4XfswypF5bATomjFcNvtFIy/jbxPAL6qyJRfQ?=
 =?us-ascii?Q?EplPSut3NEQG7VTfXQcIJHdVm1pB7HGqknC+I28R1RUJ0M9WnHSiZHmxOdyv?=
 =?us-ascii?Q?WyHHW5G2B3fCXS3hSCAimq5EQf9+OOO0WeQx8xwgEeYmNJopRufi/AR7/XOp?=
 =?us-ascii?Q?G/3NGfO7LCV0Yk9w0YDmAYCJq9kCiSTRXBya95gIzGq+VgMldqXW15yUIDPh?=
 =?us-ascii?Q?lYj8zqidkpwoKbEQGkLHBSuqT2UsbCIxGE4H8C7z3veyEmQ4v9i63MvKmn7k?=
 =?us-ascii?Q?vBIBIRfE7bQWx/0bFCegMmw4++n2ZGKwSGElHXBip1IvLAGftA6Jsaf15LH3?=
 =?us-ascii?Q?hz0VVq6J3ihJIBi6hklJV53pa8LIDAKuJbs+taGqChzNHX+csvpC2x6p8OEz?=
 =?us-ascii?Q?mZgA8nAMKvsR7SHDn09yYllWSzSP5e6kCsWT6JSoApwg6gGyEdYbsDOas9ro?=
 =?us-ascii?Q?+vGUtjzna98/2DCWOotciQppsfyzwSiNL1i0lKmHzJOpWAgOKx3g7uwAeLiK?=
 =?us-ascii?Q?Xi5qPTkuvdsjYBPxTQPDPjxJQsIEF5iYdYGr+72rx1WYDWuqvBlcUhYwAXqo?=
 =?us-ascii?Q?PL/h1VwFQOb61zeXqwwiz0k=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 b92e6272-e5e5-4cea-c4a5-08dcb4e694b8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:36:01.1178
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 nDAUeRtlev17UMgtxxfVHssCsgjpG9eYqf+NE1keHSPb2sJJKvC0LVTmI4dVdR85zFJUtMwtN0Mv+IapjwONYFfTTl5nVLrOvyPHb11EyNT7+1FortolwxzcfAzQoqy6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318
Message-ID-Hash: 4VANEPFYBVHA4UOAX7S6X3EOYIG4T4TJ
X-Message-ID-Hash: 4VANEPFYBVHA4UOAX7S6X3EOYIG4T4TJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4VANEPFYBVHA4UOAX7S6X3EOYIG4T4TJ/>
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
 sound/pci/asihpi/asihpi.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/sound/pci/asihpi/asihpi.c b/sound/pci/asihpi/asihpi.c
index 001786e2aba13..69eb696012933 100644
--- a/sound/pci/asihpi/asihpi.c
+++ b/sound/pci/asihpi/asihpi.c
@@ -447,7 +447,7 @@ static int snd_card_asihpi_pcm_hw_params(struct snd_pcm_substream *substream,
 			params_channels(params),
 			format, params_rate(params), 0, 0));
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		if (hpi_instream_reset(dpcm->h_stream) != 0)
 			return -EINVAL;
 
@@ -582,7 +582,7 @@ static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
 				continue;
 
 			ds->drained_count = 0;
-			if (s->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (snd_pcm_is_playback(s)) {
 				/* How do I know how much valid data is present
 				* in buffer? Must be at least one period!
 				* Guessing 2 periods, but if
@@ -615,7 +615,7 @@ static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
 		}
 		/* start the master stream */
 		card->pcm_start(substream);
-		if ((substream->stream == SNDRV_PCM_STREAM_CAPTURE) ||
+		if (snd_pcm_is_capture(substream) ||
 			!card->can_dma)
 			hpi_handle_error(hpi_stream_start(dpcm->h_stream));
 		break;
@@ -643,7 +643,7 @@ static int snd_card_asihpi_trigger(struct snd_pcm_substream *substream,
 
 		/* _prepare and _hwparams reset the stream */
 		hpi_handle_error(hpi_stream_stop(dpcm->h_stream));
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			hpi_handle_error(
 				hpi_outstream_reset(dpcm->h_stream));
 
@@ -755,7 +755,7 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 		if (!card->can_dma)
 			on_card_bytes = bytes_avail;
 
-		if (s->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(s)) {
 			pcm_buf_dma_ofs = ds->pcm_buf_host_rw_ofs - bytes_avail;
 			if (state == HPI_STATE_STOPPED) {
 				if (bytes_avail == 0) {
@@ -837,7 +837,7 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 		if (xfercount &&
 			/* Limit use of on card fifo for playback */
 			((on_card_bytes <= ds->period_bytes) ||
-			(s->stream == SNDRV_PCM_STREAM_CAPTURE)))
+			 (snd_pcm_is_capture(s))))
 
 		{
 
@@ -853,7 +853,7 @@ static void snd_card_asihpi_timer_function(struct timer_list *t)
 				xfer2 = xfercount - xfer1;
 			}
 
-			if (s->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			if (snd_pcm_is_playback(s)) {
 				snd_printddd("write1, P=%d, xfer=%d, buf_ofs=%d\n",
 					s->number, xfer1, buf_ofs);
 				hpi_handle_error(
-- 
2.43.0

