Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14105947266
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:43:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EAE544986;
	Mon,  5 Aug 2024 02:42:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EAE544986
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818561;
	bh=IOPZXeXsgRX0h0cqxnL7z7k/O8y0MVDDzhFsYovbWaI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=chfj0RCoV1qekvmCyWPSyYsYg7qwZ/SvBQpb0obgsXhVg7QcptpG8wKESbAWcmUrK
	 ZVqHGtLc/XJ/AX8sohcXQqS88KvVTLNaLsFgLTSqAi3AbHFXQTxeUQov7vw5Fk7Bh6
	 nbiybXoBc41AksFTXN7En8UNs6sXptQWSLsoTrrA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3059CF80768; Mon,  5 Aug 2024 02:38:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 79A9FF80714;
	Mon,  5 Aug 2024 02:38:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 508E3F802DB; Mon,  5 Aug 2024 02:35:14 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 457CDF800BF
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:35:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 457CDF800BF
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=e23+TJCc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hD2Bl8wJySkfsn/QE/1cenPyy009TL4jGLuke7ojO6HMRHgkFCJJ/tGeKYhipLv0NEoLno6s10SMVg4WBCI3f9pTtQ3J1IFpntjvBelQWmWfo4kJpkoWgjUmfYNHhL3MbSXRM/E3lVu8NdQFtnHlZKKdURGNrInu689YkadpAtLye9kmtD5JKPEiRYifCcRn04O93jFFZU3GUU1fkq+X0TO9P73tCaxZYF+9L0UV4J8Ym5eQ7vd8N4f8AxOEvB7Y+JpF7l8jprD3QcdfpP8FpLTYRFNp4UmRBH8cBMUoRvEePg5nar/kQNYx6ZycXvJcnU3j43jx0KWO8HVm9bOitw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m0gbCarOVeR5u5TuhQk5OH0N9gggorU44pKSD2LyuT4=;
 b=TxF9Di4Rl8thXF4BCIKNXRYCYHg/56VmfAA7+oKsXGKggCuFZcfEvvKwC9Pnka0fqGz8E4d137uzgVvyBacoUwtGausLJwX/cKsGozVLx9eOx2TAfNVHZHzpWghVHeA1QeZMgw5R6wh3uCwzdU6Fe2p69MkJa2SPAt23Xue+4C/sGi3bOX7W96z0jRFNIRKUuc3rnrYCRRxteNiyHASHhfbCknhKGYY/ydkwuRKMftMDQRpke/yIKyhA0IwBlFs3PlXPwB/0gIolHh5ABOGtg58cnukr/xVm5FXNgd7Iaq6lAflXPLHOByMYflfI4a8IbKvS2jMfYH6IInHcHyKAjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m0gbCarOVeR5u5TuhQk5OH0N9gggorU44pKSD2LyuT4=;
 b=e23+TJCcEU1nNfqUEKpjhfJPsHbCBT1TYKnn34HoH3OZoTH9goJcKrSOBpDa0ylWRbkgbmOsaPoU5j+PPEudc+W8llwsmEEs0XqLyuU9sOu1sn4Eh9enuMpGZxPl2QhVMApq7kTXsLUfK+BeUNIhuaQjZXLsKH96ha2Iy+IJslI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB7994.jpnprd01.prod.outlook.com
 (2603:1096:604:163::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:35:06 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:35:06 +0000
Message-ID: <87r0b324ee.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 009/113] usb: gadget: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:35:06 +0000
X-ClientProxiedBy: TYAPR04CA0016.apcprd04.prod.outlook.com
 (2603:1096:404:15::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB7994:EE_
X-MS-Office365-Filtering-Correlation-Id: 20d65098-8b78-482c-0c77-08dcb4e67432
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?t3NQ4zrAMWlSW47m9y+rDUM8OE6Lgb/a0iL80wYmnPO3yWeULGofCczHSRrq?=
 =?us-ascii?Q?qKYrVdoDub2MNKq+zrAQqnAZpn2uH7maCu+0IjaSwpd28RT2o2e5u2YNb7wa?=
 =?us-ascii?Q?9oHY8+GtMOCtktBjo2kdWLp/kWxIRVjRs39kpT1i2gOlzozGoxjbtm8EAodM?=
 =?us-ascii?Q?KAnggZxecOKy8ldUbycWI8qvRffegBm9WzyaEj/e+EDZ/8+c34FGuMy3wnVc?=
 =?us-ascii?Q?7Y17lTQhNal2Psfg6tS+aBA7j741i4sY+fsr/St5cZl37TzHr3Ot8OiPyYVy?=
 =?us-ascii?Q?BqZKnu/yWXm9YaG+X3MLni8v8nOburRrG/uZnsSbKeImA/3gE/7VM4PUk4wR?=
 =?us-ascii?Q?UboUBe2V31LdJx9PJ7/PHKPGKy3+D4mDB/wKAIVIZBJf1ubt/XtTFBoOLnUL?=
 =?us-ascii?Q?ZdeOF+c/myJJyYWjWZeJVkunWs8SNqBfP9udrwRw8MpNegT/IlAPLtK2iXyA?=
 =?us-ascii?Q?DYs3Ls1CnouuSor+VBTw61OQb6OlMBuMqaoTSJC9Cx3k5R6U+NZX768hCFQY?=
 =?us-ascii?Q?tetFXH7ooFQqpCli+H8SvvDgG59//7EY+rIiSvGcSLW6NQzspNu5Xq/v8jB8?=
 =?us-ascii?Q?NnRviNFxaxzu8GwXi4nGRx3e+WVWHAplkrf9GUbv0t0wb6oPWm56FkGt9Q/b?=
 =?us-ascii?Q?g2EO8Hn1kFMfCHDHelVYPvNrUF9tpm0BthcRyo3Awjwr6zltFnJnv6dgvyAY?=
 =?us-ascii?Q?t7YNm/h2XozQPFIb0AdfipLnWYQui1rwUR8+gxPqDM5lk1iT4A9bAMEg/Siy?=
 =?us-ascii?Q?QEm70t0b6sysjNvLVvis4xBxhhBIMr9jPjEEFDn1jDHneGOceofpQYZ1RLcY?=
 =?us-ascii?Q?WJP8gCYMRObzoNkYbPoyPAr+9TQxmXdCkz0kATHf9Bn3YZ3rQ9mTl8eNBO7L?=
 =?us-ascii?Q?QK634dMXx6cBtuPJu7nt90yIQSEcxUEGffxCNAKiStesVtfcvckbAzSy2cqV?=
 =?us-ascii?Q?cUkcCxHZ1C9ypgi5uJjusTOxlld3/oB84kh3sVoh+QgmMwWA/s13NPLEhgjI?=
 =?us-ascii?Q?Z9LPxZp05qKzciWPzVM7dNaNT5QJc/GsmasawV91+RXtuiAzPWYKCAvoMGUP?=
 =?us-ascii?Q?lWWyECmsh5PzHNBAL0yKlUosdIMtMSurxb6kJKsUsvDXgISNizKq8O21Ljp+?=
 =?us-ascii?Q?kUKw5ccHdBOX8u0jYvbbsz7GmSB84MaZkQvWm+PUjvobgEdbDaIaQlYG4EBQ?=
 =?us-ascii?Q?hBNxUJ+GfGYATZ/0tMN1Yb4lYZmRSWnDwGp/9iaTbR/J8xFpuqellFAh3jkw?=
 =?us-ascii?Q?VI9Td2oNwn6Hack5g6B5QQdDvKIJbapo8feMjWWe4WRTGZH4a4CV363ICD1e?=
 =?us-ascii?Q?WAtG9OpciKVd4tZPbf0h8UghE0A2CLPCL+wGG0EynNQOMAOXmgtNqZypEpRk?=
 =?us-ascii?Q?4zemN+STwQX2/XfHM4ftWmwA60Vvb/6mBAjnMpZxg7pq+RT2fA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fpTkmae9ilUm80L1DFB88uWutoeOHV/EThl0gGB0TzydxiHLIfLsnoOyxg1d?=
 =?us-ascii?Q?OoX6TPNJDlfeTN/p6wtbMVkDhLwtrLDOKDwb4uIBCo5NNpDwW710RJu6jcND?=
 =?us-ascii?Q?isJmNPlFj+UkNbNQPQxYYHoR7K4RD7fx57M8EH0cN5SQIfvsXpZa3fEmpzK5?=
 =?us-ascii?Q?C4zIGFkGHdsXSKGQVevuUW/D5S8CPrHCP11JzlMeVoE0Ff2E0oBBwrS+k/JE?=
 =?us-ascii?Q?Ms1vxCDaqSqaqp3s73Jx/aUqPHXcgbfoOucT0uV+TYy5ysso6tp0O5XdvDcD?=
 =?us-ascii?Q?R20KGE+ZAcrA6fWaEANxHR9TgN0v2HNzybWFr46mh+suqMh3P4lsibRShugE?=
 =?us-ascii?Q?kZKncP+7C+C6h4NliLIVrLEezVcBGIOrSDEj86iPh9EuhJE2IS8Fy5paFbtV?=
 =?us-ascii?Q?cHPtw9H9+e+Eu478cu5uOLNbzb9HgM4TFHOApCKZY8gQNfbxwJbKv6zJEeYU?=
 =?us-ascii?Q?PdAeg2DEh6B1fHB70qnue7kNVYsrmFdQajpIPa5Rqy+UHMUQ4WWI9+qk0iWX?=
 =?us-ascii?Q?8KrqXedsIsC3Yv8UcLEXNqHjmowcr6qXEHnK3QCLN9gPzSZhdvaRYBc4zNbv?=
 =?us-ascii?Q?TWbS19kZW+cm0f1egm37NZusjtv/BvyNZu6NiZXFjHFeDz1sgKC86fuRp9Da?=
 =?us-ascii?Q?pJ4Q1T/nj85u4OsEXE5LaCVieB2IyuhMykI6ZXP02Ok1xxY9D53rhrHw2+h8?=
 =?us-ascii?Q?JYYzXZ6+ird4myyrotzFEgXkJpbXx8VGn1FO4v+9jFDNirxYaIgqLL9UX8Ol?=
 =?us-ascii?Q?xzmqdFuPi1rwn1dXKyAnUDTc2TU7RqoZeE3UwEdeEv27+GgbAdIrn0QMo7ym?=
 =?us-ascii?Q?j0PJbkJh9N1WbUN/F/hUgcJZaFrfwnior/enqcJKkqBCKJmsgtykpqRzxpvz?=
 =?us-ascii?Q?wKCo6cfosoLpKYupr5fjYCMOILxx0nSCerOcrnDbYQolWNcqb3GjNKH/ys8l?=
 =?us-ascii?Q?3WkWRHrEHFkUAC5sFHZSEfQMwAyStG9KZt1JYBmJaMIfAz7QyQg3laMlZusE?=
 =?us-ascii?Q?FKRm/eNzUcljvxexc/wZPcN87CogTqisUH/j8K7g0w625GlLKzIFRfrLhHut?=
 =?us-ascii?Q?YppV3y+5eiVHlEBXQjUjOKOs3YzRX0zj7A+mtAgPezUeNWabujgHGreS6EwF?=
 =?us-ascii?Q?lzINhm54+dKu8ikp/e4sF94aeHfHRkUdPRS6sl4sQU+EiGMVVvqaHv5bw9xc?=
 =?us-ascii?Q?sSf2YkZniR4OTDuepkssjVpwDx4i2mIuxCuaa4l4aS32ZxTQZydjLnBGu9Hh?=
 =?us-ascii?Q?6GgzDmkewl1V76SCaiKzU7ElkCumkKf0TYPwLsqUvMipqszbgiicZGqq21pM?=
 =?us-ascii?Q?JyjdzTuHjDCiRyJIhJ8eq22PFqjDrO4vbtSMSl1b64W2d9sixNT1ppc7nVxV?=
 =?us-ascii?Q?nzm2zXg8bmQ3biYknsV5j4dnb7yVpvKCRrzoxVgQpkpLUI8kECUo5jm5njUu?=
 =?us-ascii?Q?CVDrANBBthZKcaMKCyHdvMPt2h2F4hq0wGr57WNpGFRF9SSvo934LzCVzAFG?=
 =?us-ascii?Q?tnM3W6DeZwGlJ9uDNcnljnABojdZo0UsP6Qfs6CsbSXi/OAFltYdQmRJmyVa?=
 =?us-ascii?Q?mEnmPcuZWSUs4wNXc6qQJ8790zmeTA6sEcpFR3r+BKL/L4COL0YKRYxc77EU?=
 =?us-ascii?Q?Ci0GtJeRdWjroXbe1H3fGFY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 20d65098-8b78-482c-0c77-08dcb4e67432
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:35:06.5435
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 zK75Gnthdj02EOMWpEFzkaYDM7sqS2k4evPg9GSxdka/j0IEdjuAcCmRE2PTKUHLw3xBUk7L0r66XDxvwHRvSv/Oepd0DQp+TuLaHGeceMPkOBARFg4InxRX7O7T2s/L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7994
Message-ID-Hash: WBUSMPLZ74HLKNVUGR46S6EMLCMUJHXM
X-Message-ID-Hash: WBUSMPLZ74HLKNVUGR46S6EMLCMUJHXM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WBUSMPLZ74HLKNVUGR46S6EMLCMUJHXM/>
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
 drivers/usb/gadget/function/u_audio.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 40093fa1093d3..09fbae35aea25 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -190,7 +190,7 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 		goto exit;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		/*
 		 * For each IN packet, take the quotient of the current data
 		 * rate and the endpoint's interval as the base packet size.
@@ -244,7 +244,7 @@ static void u_audio_iso_complete(struct usb_ep *ep, struct usb_request *req)
 	/* Pack USB load in ALSA ring buffer */
 	pending = runtime->dma_bytes - hw_ptr;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		if (unlikely(pending < req->actual)) {
 			memcpy(req->buf, runtime->dma_area + hw_ptr, pending);
 			memcpy(req->buf + pending, runtime->dma_area,
@@ -322,7 +322,7 @@ static int uac_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	audio_dev = uac->audio_dev;
 	params = &audio_dev->params;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		prm = &uac->p_prm;
 	else
 		prm = &uac->c_prm;
@@ -344,7 +344,7 @@ static int uac_pcm_trigger(struct snd_pcm_substream *substream, int cmd)
 	}
 
 	/* Clear buffer after Play stops */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK && !prm->ss)
+	if (snd_pcm_is_playback(substream) && !prm->ss)
 		memset(prm->rbuf, 0, prm->max_psize * params->req_number);
 
 	return err;
@@ -355,7 +355,7 @@ static snd_pcm_uframes_t uac_pcm_pointer(struct snd_pcm_substream *substream)
 	struct snd_uac_chip *uac = snd_pcm_substream_chip(substream);
 	struct uac_rtd_params *prm;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		prm = &uac->p_prm;
 	else
 		prm = &uac->c_prm;
@@ -402,7 +402,7 @@ static int uac_pcm_open(struct snd_pcm_substream *substream)
 
 	runtime->hw = uac_pcm_hardware;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		runtime->hw.formats = uac_ssize_to_fmt(p_ssize);
 		runtime->hw.channels_min = num_channels(p_chmask);
 		prm = &uac->p_prm;
@@ -1299,7 +1299,7 @@ int g_audio_setup(struct g_audio *g_audio, const char *pcm_name,
 		if (!pcm->streams[i].substream_count)
 			continue;
 
-		if (i == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(i)) {
 			prm = &uac->p_prm;
 			fu = &params->p_fu;
 			direction = "Playback";
-- 
2.43.0

