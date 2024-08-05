Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E92E9472D1
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:06:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 163F7413B;
	Mon,  5 Aug 2024 03:02:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 163F7413B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819740;
	bh=MBwS714mAGBlLfd9PSUcrW08HRMlcirt0EmtU7lhdK8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vDp7hV4s8EsqOS7XU4OeBk8dXV8Pa8ciKduSFBaRr492dYM39UeEAGXbO4rCQOCX8
	 OgAhDLNK358cBEeM4smsbs8AtFkoOnIpsCIFuxKy2zuDaStvlWdVBUDWfCQgoq7J1t
	 PBQio8Ep6kDjWDb7mS/sRuMN2tskiO8mUGNo+7wk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DCA0EF80807; Mon,  5 Aug 2024 02:43:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 59BCFF80C41;
	Mon,  5 Aug 2024 02:43:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6F256F80C43; Mon,  5 Aug 2024 02:42:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id EEFBEF89D5D
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:42:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEFBEF89D5D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=DThb64te
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LH4DL2JZyJ4794coFv1N+vnVRiHZ4eO2GasIUosOJMZGyesjRK6EuP7ZGqzanvKKSZexQim635D0nrnHQPVu/NxPwdIOZah/6uOUNa8WZgSthJL8RCuAqYnnSk6D3wcJdlRuoiKChoiPsrJpIca6Sio2NHJXEbuHIhL/YVa8LmP1/JLFta1fgeNB80WwsxRtrVPaGe1x7QpdPiRx/5PiPF0ma2y97qa3Z7rZ6iRZ0itjSkefkla/oACO0njr/WO4/yWZY+FRTqW4xwrhG9p65FGzlQIbwEJJon1sa9hVc0W3FyrAy4J0NehDCuRLp2u5hPx2CTxWAV+Azqz3426SzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y8mDYYCu/00Qp2W39bd+KlQwRIQcOzol7h9V+y4bRqk=;
 b=jA879qjb8a5sl+bNVNAmozrSkvLKPJCszcE3qcUE6GrbUcdXPhFxX1WE1Z0w75cMZjwTyP6Qre7kkZLCmw/nBmnPe1g21i8NYXQ4L/g4e57vkYUxaPxg94jcFtWMm1l/6ZOxmdI4kFhmMxn+e1/KbEgVZIqbDaHJk7hcKWxyreEHunnRqf35cSY0azrbk60YCss7Q1MXHCuGYSqZo5lGk4KCJSw+c9y8i8uNKj8Jk1vPypcBLcybAGzIlNy+67IwQBXaqyJQRqrfAD36dizC4gGE4E9fr/n9IvqeaiJQ/01S48b0nXejdFUib8bCnha96ZsePVlKK1iJuPhthEhIJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y8mDYYCu/00Qp2W39bd+KlQwRIQcOzol7h9V+y4bRqk=;
 b=DThb64teJ5Xt1WD8XfYfza641lXWnrhn8b8py2E71OpWeu00z6jvhmOeDWRQrtdv3vwKUqUs3iuMG2uCJ8GSlm9P5Gvtmc/ORtN+Iq2tTieaRrYaxq+xEp6EeXA6V9PvrySlqSgwPDSYQntmdLesW2h1Z1bKwFymj+KUAdAamZ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:42:37 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:42:37 +0000
Message-ID: <87o767x0jm.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 086/113] ASoC: codecs: nau882x: use
 snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:42:37 +0000
X-ClientProxiedBy: TYCPR01CA0145.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::18) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: dcc896a1-acab-40fb-295a-08dcb4e7811d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?D4OnEnn7LwWy/JQx6fZgwjZNQ0Xpw6FCoQ3yHV7tDyIGeqk5wDAKsDrtaKUC?=
 =?us-ascii?Q?lJWUSXKBZFbJrBXPb7B4yzzSiH+FqX5R6+7jy9MYfmAg7SLkVB24xZD9/j+f?=
 =?us-ascii?Q?qT08MgdNuwwyir7amVj/H/VgMDiXuWKx266NTcy+V6dMDK1ppodqkw5BxbL3?=
 =?us-ascii?Q?DjKL6xQHOfxQ6v1tOYSEa3NnNx+WtLvYJzEyBBd1/TFI36pzf07/Wh4RYaox?=
 =?us-ascii?Q?AR7TAbAkezhomkympiRnPmYLkcAFi8ApIIvD8SkIG7usGI3IwU3q/zT1jXEs?=
 =?us-ascii?Q?q85mhEAc+BFQ/2LsOeDBNgQzwhC4ZZJJXvTMRl0UlXYgIVyUYgs4SwZUKpXd?=
 =?us-ascii?Q?X7lztTHKtW/SR0eI8dG0cR+ZM5Hc6en0wTFfHdqMJ2byLVZOOygMp1UMKgjA?=
 =?us-ascii?Q?Te54aW1v1EKZ+Nca0RvZ59/VUfeazZPKjte4gAB+joZcMZOPWsQnkJfc516Z?=
 =?us-ascii?Q?MtbXBwBYW8xnsJd0pfMrL8iIxOkYZqUN8wY3FOS2xsETol0POEFvN9+Mff73?=
 =?us-ascii?Q?Q2ybEaGo3RCezlz0wNoN6CuthhSO1eT6V/sSbsJsTCkCco7TDjNTT3rKcktV?=
 =?us-ascii?Q?ITyWw7JpGzdun7tFEHp5ADJ+ktRjNpyte6+XxpU43S2E0wJKVXBRtQXLGCdU?=
 =?us-ascii?Q?wO5UKJr4nmGrJ2NdGiR9c8/SzMQYbqZokuWGZvYmd2dBX23RUFXxw56/XHWu?=
 =?us-ascii?Q?+Db0y4gbvFJGDVlsiPtwciT23m7OuLqgoKHSpYV9/e/+AYM9bZVU6BPSQTkK?=
 =?us-ascii?Q?yrjeth5DLSR1OA2XshTu7P57iRisq9qCi3I7Ycx5jpmmPuV6s/Kn6/U3y7w8?=
 =?us-ascii?Q?QzMmu0bOW7kB8IDNu+6hsovr4ix03jBgn25ooTDEnACeOaRHCBa82Vf0OiIo?=
 =?us-ascii?Q?DqVdR7880AvFLYBrsOYYzdaQo8Yskoher9l15PwN6lfTtJDuHViSLQoXtIyi?=
 =?us-ascii?Q?fO9N39cGGT0CyQqEmlsXlgalmw/IJ2O1RstbPfY+p+E22hoxGGsFZDkmexw6?=
 =?us-ascii?Q?P3K/4U1/9IYOaLJmOdlI3JgOfsGqK+/B1iePI0oPw0mai3rgijAkT+WQIDrX?=
 =?us-ascii?Q?TwUZcIASkJD7EwEu4hghRtQtgxk0XYHQtBowAVq4bMWt1qL9Sf/ysWTaCbXQ?=
 =?us-ascii?Q?dWbyzZdWtIa27MHobs5ynPDO7AGZX2Eo26f+vqHedFR3q9PxPBgfPPkIJbrz?=
 =?us-ascii?Q?cC428gS1Em7tUh2ZlVtcmkw3fVaboZol61Nc7PJ/Lzv/lS4Aq5REaWoGRIY1?=
 =?us-ascii?Q?VEK0qrXUPkH39d/+LYFMZBMZt0pJAcpnQ3lCtpuCR1TmccM3Z4kinfsdh/vL?=
 =?us-ascii?Q?vb1YRMXtTOsMn7Uo2+r3HB0B1CsMpN6Ic+ejQSllnuCS6i+vmDORWmjjaijy?=
 =?us-ascii?Q?q1B4LX4+shvsa0hi9nRHznmptxBaFg7FsBX3b6/FH9TOM+6ipQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DfIPn21IPfN/EHFAMJzz2D99wwn8ZLyGNSIFThdnNiBvZmpscrZfwKnygeY6?=
 =?us-ascii?Q?AuPl0cSgkDv2EuaAwHKTtQ8o0UdOeUdOlDwEy2wVlwm9k0TjT4FXU9VR7OTW?=
 =?us-ascii?Q?lN6MFyWkJZHOTpRCSpWf5hI+GU/O1i9qbMF1r/xzmR2bXGt4o4IW6/jXpcdR?=
 =?us-ascii?Q?dU5M6Ocj8ieq+ntri7R2Edj6SP+3N5wmYv4CRIQfsmbJemHaqncmYxiLZUNl?=
 =?us-ascii?Q?qiEfPddW65suK3s5a/96ZRW/zEVg+RBrw3FHcY2rdVzqTSgRHvkJ4aT3Mszc?=
 =?us-ascii?Q?oq2QKG0CCPWv4KoJfAHx3t4LHS8zs3fM/9eCQh4duiZqBNdfHVTOUkwLUhFz?=
 =?us-ascii?Q?OTJqtPk9m83z4eVpHRaa7KyTP+9RgffRl1FkIjR52pWm2hfxUNNDlzSNOlPz?=
 =?us-ascii?Q?jsHl51Ckgs05Df8JVLWSXmgF0kNkgsYXZViPEx9nR8Nt2HcYm8GpGZYn10Vu?=
 =?us-ascii?Q?ycKPDuGLF4BZ6F3woPIzxHNlNMvioSt+poGbwGzmpOGQepd2EJg8e5S1i5tX?=
 =?us-ascii?Q?vWDCgjet9dmzaQUEPIDqCUUHGjpynr3KgzyHsjKh1ljNgPLOh/yHVlZ1yGpT?=
 =?us-ascii?Q?kmStJm4JFb91umWyNw+z9IX6nKIKb3j/YOh7hNkUK5xuYuJD7ksvaQuCYPiE?=
 =?us-ascii?Q?yTa6rV3derCzsnuH0DmOOLRdS2dqzBmtx4AVOLsAJCoa++yg4LnxtwohWKTk?=
 =?us-ascii?Q?mcCupMJllSAkREaYLHa86uV7xjad6fgSe75wfOHBTxdF4GL1KFV05pV+F5si?=
 =?us-ascii?Q?ZFOMplwbOi6bxkzZGNI5QQ63SpcFP60we5BYowH+jIj9LMGWMXsgVTrUWhqM?=
 =?us-ascii?Q?RqC4jSgNHc/zYyiaump9o4FQjp8AOY5SwQQaooUarYEmgLDh/RH2fi3yn7d7?=
 =?us-ascii?Q?vgGugvQqTomTN91D1NxZT82yGUyBtkHsmyfAw6FKXCZzVsn2sfmMxjZLlGiP?=
 =?us-ascii?Q?OGlNg2TQUxsJhu5HzZTi9sg4kLYGLwU5ULYuiS8QJQnM3dU4vtPHXpLnfXIr?=
 =?us-ascii?Q?9PYwb15jHL3W7ELoygqM+KCGPMUPqgWPWvVvo9ipDO0zE8oR5L7K0L3oxfBH?=
 =?us-ascii?Q?NbaumJ7mhxWfs+ngR4YHvpwtFYPYrBEbnL0Lvf5iogs++Vz1NkwV3eD25Cvm?=
 =?us-ascii?Q?ThtzC8x7CSGorBeObxr4zI70A5eHuALzY/GhFjy+K9budqeIrhDxIpk6+3GY?=
 =?us-ascii?Q?KmtbKtdgOBYlO2EtLkSE2T4+VQTMON5TmkbnTl6A4UED8mJ14z7GN3uwq/xW?=
 =?us-ascii?Q?eOmTOWUn9hVI0MLYBIb1QTg5HLva8tiAWOfQ44u0VSPiAaeyxTytyG/CTb6n?=
 =?us-ascii?Q?JtmxPanoS8V5941tWtNwc/H1QA9zpCFook1y2lC1eWBwVztGEIvKdyxk/P/g?=
 =?us-ascii?Q?Nz2BnTtDlcn01J+ZQuEPCNKZTMhpzjmPjfBF1KQzwcxsb09xiG0UZi3BZWeD?=
 =?us-ascii?Q?F1bNVCv9w2HoQ+nVUsKbwM29s2qo+uEdK4EVH7FHNACxY4LkQRqQwggTk1hX?=
 =?us-ascii?Q?onEXrMKikOKQBDzlIRQbPDSTBwcoUMgtIV3bNIXt1Zq2nBO6HqoWx26JzqtA?=
 =?us-ascii?Q?AiIZhSh+XN8rsZ62ZNLoKIngtqu11g/rOChmIbj2jyO5Yql7/l1a2AO2eqNj?=
 =?us-ascii?Q?RR6I2fjJck1pKETra5NaLU8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dcc896a1-acab-40fb-295a-08dcb4e7811d
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:42:37.7861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 PiRP6en9CWpqjPRvMpBSHtqdkOy+B2qIayrzGB+Vr5UUAFSNJQvgTZhl9Th60FyrpOQSYAagJti3Tt7UdkKp0J8nbDoQdzd6NmGmA4GRjGnk8ZGQe2iK5q6K2n52k/dd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302
Message-ID-Hash: LCJYQMVYE22PQOPTUZBBYHIVOFRVKKFM
X-Message-ID-Hash: LCJYQMVYE22PQOPTUZBBYHIVOFRVKKFM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LCJYQMVYE22PQOPTUZBBYHIVOFRVKKFM/>
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
 sound/soc/codecs/nau8821.c | 4 ++--
 sound/soc/codecs/nau8824.c | 4 ++--
 sound/soc/codecs/nau8825.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/nau8821.c b/sound/soc/codecs/nau8821.c
index de5c4db05c8f8..f887c192b87cf 100644
--- a/sound/soc/codecs/nau8821.c
+++ b/sound/soc/codecs/nau8821.c
@@ -803,7 +803,7 @@ nau8821_get_osr(struct nau8821 *nau8821, int stream)
 {
 	unsigned int osr;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		regmap_read(nau8821->regmap, NAU8821_R2C_DAC_CTRL1, &osr);
 		osr &= NAU8821_DAC_OVERSAMPLE_MASK;
 		if (osr >= ARRAY_SIZE(osr_dac_sel))
@@ -854,7 +854,7 @@ static int nau8821_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	if (nau8821->fs * osr->osr > CLK_DA_AD_MAX)
 		return -EINVAL;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		regmap_update_bits(nau8821->regmap, NAU8821_R03_CLK_DIVIDER,
 			NAU8821_CLK_DAC_SRC_MASK,
 			osr->clk_src << NAU8821_CLK_DAC_SRC_SFT);
diff --git a/sound/soc/codecs/nau8824.c b/sound/soc/codecs/nau8824.c
index 12540397fd4d5..21cda3b473bad 100644
--- a/sound/soc/codecs/nau8824.c
+++ b/sound/soc/codecs/nau8824.c
@@ -1038,7 +1038,7 @@ nau8824_get_osr(struct nau8824 *nau8824, int stream)
 {
 	unsigned int osr;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		regmap_read(nau8824->regmap,
 			    NAU8824_REG_DAC_FILTER_CTRL_1, &osr);
 		osr &= NAU8824_DAC_OVERSAMPLE_MASK;
@@ -1094,7 +1094,7 @@ static int nau8824_hw_params(struct snd_pcm_substream *substream,
 		goto error;
 	if (nau8824->fs * osr->osr > CLK_DA_AD_MAX)
 		goto error;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		regmap_update_bits(nau8824->regmap, NAU8824_REG_CLK_DIVIDER,
 			NAU8824_CLK_DAC_SRC_MASK,
 			osr->clk_src << NAU8824_CLK_DAC_SRC_SFT);
diff --git a/sound/soc/codecs/nau8825.c b/sound/soc/codecs/nau8825.c
index bde25bc6909d5..951406fa5d32f 100644
--- a/sound/soc/codecs/nau8825.c
+++ b/sound/soc/codecs/nau8825.c
@@ -1238,7 +1238,7 @@ nau8825_get_osr(struct nau8825 *nau8825, int stream)
 {
 	unsigned int osr;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		regmap_read(nau8825->regmap,
 			    NAU8825_REG_DAC_CTRL1, &osr);
 		osr &= NAU8825_DAC_OVERSAMPLE_MASK;
@@ -1294,7 +1294,7 @@ static int nau8825_hw_params(struct snd_pcm_substream *substream,
 		goto error;
 	if (params_rate(params) * osr->osr > CLK_DA_AD_MAX)
 		goto error;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		regmap_update_bits(nau8825->regmap, NAU8825_REG_CLK_DIVIDER,
 			NAU8825_CLK_DAC_SRC_MASK,
 			osr->clk_src << NAU8825_CLK_DAC_SRC_SFT);
-- 
2.43.0

