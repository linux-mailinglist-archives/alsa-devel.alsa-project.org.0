Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C319472C8
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:03:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B0F64C41;
	Mon,  5 Aug 2024 02:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B0F64C41
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819595;
	bh=xztf81RT7eIb2/r7pIiOpEcTKOg1g6w1P/oYkbuNv9g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MAUzp2doc/mYEF6X0x/NuORMkuOHqVF0BpfO0D0zvTcjZfU8nTY7oOMO4WZfBysWT
	 m7oEu85Zn9n7OiP0zJd6uuIKWJPr+PszZW9xJxoLY7mnQuTofGw7NtL+xHKmk4HkGp
	 y7fDTVoU+le6Ti1GMdlkEPoJ4lBOBHjN0fneCwQQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1941F89CE8; Mon,  5 Aug 2024 02:41:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7027EF89CE4;
	Mon,  5 Aug 2024 02:41:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A66FDF89CDF; Mon,  5 Aug 2024 02:41:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2B5ADF806B9
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:41:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2B5ADF806B9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=bQwT6rTW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLLkrzB7VqJbYYAgvPg71BL4FlW5VlUJK132nM6kYKmdCDh/F7VCPetkbwmLu18htK4lMt5Iruddb01dvAQf3/HnO+kP6ABIC4SlcpfiPx4RyNoqoU0XfPfx4e//YhgilZRnr4KvUTI8JiNUQZh/zYJPR1mh26yETCqwEh+OZGozOiI5nZu6w4anIgKrx79WEmkV+F6trlLwdPDzn8b8LKTjE8lcaKfyPTq5WkfwLvrFPTIKZd6GXvBASBChKfVeAHvzrLxPOpwVSSLdZkDnAi6D1GK4LD01d/ERaQTy98u7Upxhu4zAxYe/432w43I/+8JhEcWnSzzCHC1bXnUryA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DepGlOZ9aPM/vHnXBMieZHAVDiMQSTnPwd/2u92ie6E=;
 b=HHWoc13BIXe/iVQU4t1CmvDMdCx//2C+lhBOWcDPoMBOtPNPNYT1pjivoxtJTKEqK18dlMqIifxekSqe/WD7asKKu3m/hnsEsBYbiU1+bP8wOGTRQLCtf8tAf20R1kGtCdVQjhJrHUkHb5TkCYem3OfKvEq7AYwxqZXANzGkw5wRKLSSBpKdUlu0jsyS1TjlCMniKVtSxYA7aSScUKPL1rWTRzqqlh5dxnwQ2SIIrfuFGHFeb/UVpCDwSTqSvg2d7E9GoCmNKwLltvwut+r1y1vwbzAU6yYnW5d4DQiDRPKUCIFy/U/6Fb5qTnIG+8WpNlbcsQuRR9yoxsss9hNb2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DepGlOZ9aPM/vHnXBMieZHAVDiMQSTnPwd/2u92ie6E=;
 b=bQwT6rTWT7rpdhyGR7VXNVwU+CIPkHPcvfHcZkXSOfjSmiZ5AacFsHb0EiH3aYx+V3GCx2nKzo2eX/ftPs5Z+hQpGt3Lzn/jDdyOORd45z4mcnYvkbQudOXy6uSv17qJ/IYyjmHN/rxFNVhpAIMAEL7ktbFLVuRu9VsMh0NEQQ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8678.jpnprd01.prod.outlook.com
 (2603:1096:400:15a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:41:29 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:41:29 +0000
Message-ID: <871q33yf5y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 077/113] ASoC: codecs: es83xx: use
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
Date: Mon, 5 Aug 2024 00:41:29 +0000
X-ClientProxiedBy: TYCPR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:3::34) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8678:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d3894cf-9b2a-48c4-b570-08dcb4e75888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ETFp+nRMzOO2T0VjFIw+oin2541WjoqGReMg2w+l/DI7Ym9miyDuJtAV/kri?=
 =?us-ascii?Q?vJzYZytlMXL92uNWJxWuHDCFr2A9pBCWJ1d407Q5aE3RZO5I2quRdBJJG+qs?=
 =?us-ascii?Q?BA60B5aRX5RQFQJ8idcFDlURywrSawmFN2d/mEz5qczi+QrHKzoUe5ob/nxm?=
 =?us-ascii?Q?cONQ7Njp9U1+gCY25nQ6ut1e/nsF8HG4DG5ABG20PDWsO1SbMWnQVM6NAKW5?=
 =?us-ascii?Q?y22hLtALYX9VyN0hCF4fWZYnJKL8tQAvi4/qXr1iIsuLs0tpLwrNjORlH18c?=
 =?us-ascii?Q?LrCz7dAl5tTisgMGk2YmUCzS/sp5SMd+sm5wEe3O+DFF/u8xLOcmirOnsaKz?=
 =?us-ascii?Q?Lty5iwP/+2HvZnCPUcgVByGT4yddVGYi6x7rLA0XEuoyr0PO46yeUOmv2TGk?=
 =?us-ascii?Q?UY4SPcIDFkwvUq9kY66fGalie0GsQEEeaGWQkVh+13NrTE2dEO7qcJbfHFUo?=
 =?us-ascii?Q?C8P4qZiNOdBW/e/45Cg3g5NPu8EOtzDmN/s2vnVpfzH4Oum+410oMYVTNQPq?=
 =?us-ascii?Q?JjKKLFXgzA83VFATv/norNv97Ekt1cQGKfmPziDV6JhJ1JboUq6CBmg2kpSk?=
 =?us-ascii?Q?2hqGRZDk3WUVYjDQxC/7RRSdpz/wv9nPJWKdFRQWbJaEP4RAZpF6QlTSBCRs?=
 =?us-ascii?Q?BO4AsORfBVysEGbzyFqeknxqWDKdmeB1klqixZJjA4r1SduTopiWWw9Nm1GB?=
 =?us-ascii?Q?eLTOID8zi8fiLGkIJHnnpElm23KeU8u0xt1RTyvxQmtsl4BtHDNz7iMKNl+g?=
 =?us-ascii?Q?YL6D5xoPHiMaq2FQSsaabwjzuXsy7fjWdblCdwQppv+4macPHxaIjhPCUtgy?=
 =?us-ascii?Q?QUxVC5PvGSxuoTLel02T1jV6ocWfXkJOP8bBSyL416vPG1ZPfGadS6iVjFiA?=
 =?us-ascii?Q?Zq5tG8nklSnRVlF4tOVTEOs0sKwW8u4U74xMrYaaAveYjjods45LBLnISIRK?=
 =?us-ascii?Q?W6fNNb+RxIRLHA3Hwz+iXwoLu9KrBqWedNzA7CvA6PLXU/aQVwaLTc9gVX8e?=
 =?us-ascii?Q?AqpMub3jwvcqL7LSqp6WOFLJQ0mOe1ws2ELvE7d+yjs8enh16zkvwh1sDYG0?=
 =?us-ascii?Q?D+/shORfUBzw2sj+OyLayOAQXvJWMb6HkuaRv4K/tk0WO76Se0SD467UkBTU?=
 =?us-ascii?Q?veg45xorNJsuMcU/JCp0KMhJWT+sxo2RDr9H8YuEHn4sEME/I58VordEyXHB?=
 =?us-ascii?Q?vL9/R1+FfhPXwDKsUjxYwfdvC1ml+mQDZnpVMuU/jim3jJ+orhiGQH8pTvEF?=
 =?us-ascii?Q?YZdeNuyPrdPxb5wOds2dnU4pregN91mkkAVecQuSHSiYlsxAfpayEc7rPx5q?=
 =?us-ascii?Q?t5amTvcIQYCaBVtDanEAD2Xii/N3e6qLguyQtvSvV5fdxQrGTUPJCVipOw4G?=
 =?us-ascii?Q?FWG/67SHBkzbyDmR2znI1JeuLk53jdtqC3DLfTFSrBtDTZyJKA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ST2OpaI4qRd1H1+yuSHejwy8Dgxvl9SjPTiCKrbUpAYhbmbiDiJGbOdFjNep?=
 =?us-ascii?Q?suyBHw43zg1CEoKc6D9EgF1S6nuDjuHfCkiy/SY7XcgLrejouXTXR1TeYbMm?=
 =?us-ascii?Q?NFLMY/zrnMXCaBmZbJ9csqQYJwn+jlUwm9YUfHNZaSod0kgKLnRmXb8Lu6lz?=
 =?us-ascii?Q?R70UdOZS+MWPnHeZ5cQJsgPuJKjN4Or3EE/6p4g902OQIgM6P1sr8inojb0b?=
 =?us-ascii?Q?XYstuEzgz9ehPPz3d1+fqtF0epzhqAvOE6hEg1BdV5Vs7px8XCk34SGSUipx?=
 =?us-ascii?Q?z2KSbLkosJDfUntXhGt2qXcpHVG/HKpZLo7AfeMcIOy+RMevPCX2gVe80hok?=
 =?us-ascii?Q?w+cYmOsla6XI8KxoesPAcwNstu1Bxf26a06ijX0bdRCw3z2j9Va1DQ0M9q4j?=
 =?us-ascii?Q?9omoJOecOl1h7/MaLYX5xOPXSmYleyRqInAulvl/25eIzl4jgZfS2PzV4DPs?=
 =?us-ascii?Q?WB144bA7L5668nrI/IFpO4xpViZMcZV3ZK1TEL/gT+4WgJqNZrXqpPgRaEYZ?=
 =?us-ascii?Q?uSeiJTm55zu87VIIue2Q2DA9ZDLm+a7Y8QQcS3LIwlFkJjIslqlK/dlO8KEA?=
 =?us-ascii?Q?XMGKvFamCRXw7sAGcaSBqGYPOb4i05q6b4TUuhyd5v5/x5sJ9XD+UaQ2qwby?=
 =?us-ascii?Q?zaZvtB6+QKi69dAjG8nXWQQcIf9uXBh2xE29h0mLtPMcCB9cHDCgjtz9mhE0?=
 =?us-ascii?Q?iPTgBj40Y4EoPSL2nYocHJCyrmzlcQwBNSlyJPS1+Rf6mYwirgi62t59evT5?=
 =?us-ascii?Q?NpnUiZ9+FjEnjQpK6hY5qc1XhxLoS5CWe6Pri/xaafVqvs72nAlGng9W2GRO?=
 =?us-ascii?Q?illFow8P5BPe+L6W5xTNtFPxf5XVaW5rDUuqsZtnRHFoP6oGLsGapGh0aKWS?=
 =?us-ascii?Q?AdCbX/FcrT8NtDuflJVR7eIJNusHja7MMug5mi4efok/xqqso8X3R7PkWrL+?=
 =?us-ascii?Q?hp7t0VXd3sONbcXkIxGGcoqXExqIIrNdUOaiLUVyj9IOyNSJChjnRzUIkgXz?=
 =?us-ascii?Q?CD/a4sSZaymcuvzi0QjxQ/ZL0e9qZIzFxwx1W4jLnB57ZnELLWl2JVoTC5hz?=
 =?us-ascii?Q?zaOvRPo0CsF+U7rBJUWG9xQNNmh0prdA/e1Ekc2TmJsfJxc7YnDpGqAMiGUR?=
 =?us-ascii?Q?026Rw4A8ipm7esJwfbn4EC/UaYu0nO+CdYqWD9WXEn9NbSbL6ZwaOWtmF2dD?=
 =?us-ascii?Q?XoRxqYMH+RvqkdU2DOwtFOe46QWOZTMmr6nDqnI+uv+PJwOCAUSsRmrbFGyg?=
 =?us-ascii?Q?yGevclZ4i1j2Iz6cgTzre665pT9x2wDW6RvhRHUY0vpwyjduk05/MVjl0fpu?=
 =?us-ascii?Q?HskiXt+apkUI2S9zdDVMB0ztxwWnn56yOXiASnfjxGx+zwVD+nJ6IhN2+yOc?=
 =?us-ascii?Q?DEzMmk8zGaTIFpmm/dlxkHxOk/fxk58RwDFckPiy02DfFS3XQSfjJF2qetup?=
 =?us-ascii?Q?sc1gx8umHBlAMzXnKAu+IvMpckU7JvEGEv5oyTw6tpkd/IUBVUCgs3AbJwFY?=
 =?us-ascii?Q?hmSHqGdsn5CYDJM53X8HtXKBA+CiVGZzyU9/+HKgQqNWnAOVv4C9usbkg+yP?=
 =?us-ascii?Q?kJcrhTllqhLA/zhcnhHqEha4GqHsaWgWElYSiSC0VKcg2rT9+JK3ll9EVPP2?=
 =?us-ascii?Q?uUQUb01NTAef5KmoURWcAMw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5d3894cf-9b2a-48c4-b570-08dcb4e75888
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:41:29.7619
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 GN68DC7zjH/qFLnNA0Ad+XW/TxCfiI6Y8gXut+3jpu3ElKV9qc5xGSBC2pgYR5Kx7tZEjiK3XDRUHuoO/vAWo9/R//bpEQQF2a7t6E9hpShAQauj6rz8Wy6pBkF5Oed7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8678
Message-ID-Hash: IF6Z7FYP6YQWZZWFIAQYN6LHIA2CZ3KD
X-Message-ID-Hash: IF6Z7FYP6YQWZZWFIAQYN6LHIA2CZ3KD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IF6Z7FYP6YQWZZWFIAQYN6LHIA2CZ3KD/>
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
 sound/soc/codecs/es8311.c | 4 ++--
 sound/soc/codecs/es8326.c | 4 ++--
 sound/soc/codecs/es8328.c | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/es8311.c b/sound/soc/codecs/es8311.c
index f557e33c26ad9..6a839bd5ea3b9 100644
--- a/sound/soc/codecs/es8311.c
+++ b/sound/soc/codecs/es8311.c
@@ -452,7 +452,7 @@ static int es8311_mute(struct snd_soc_dai *dai, int mute, int direction)
 	struct snd_soc_component *component = dai->component;
 	struct es8311_priv *es8311 = snd_soc_component_get_drvdata(component);
 
-	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(direction)) {
 		unsigned int mask = ES8311_DAC1_DAC_DSMMUTE |
 				    ES8311_DAC1_DAC_DEMMUTE;
 		unsigned int val = mute ? mask : 0;
@@ -508,7 +508,7 @@ static int es8311_hw_params(struct snd_pcm_substream *substream,
 	}
 	unsigned int width = (unsigned int)par_width;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		snd_soc_component_update_bits(component, ES8311_SDP_IN,
 					      ES8311_SDP_WL_MASK,
 					      wl << ES8311_SDP_WL_SHIFT);
diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index 60877116c0ef6..fd3e89cc02862 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -605,7 +605,7 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 	unsigned int offset_l, offset_r;
 
 	if (mute) {
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(direction)) {
 			regmap_write(es8326->regmap, ES8326_HP_CAL, ES8326_HP_OFF);
 			regmap_update_bits(es8326->regmap, ES8326_DAC_MUTE,
 					ES8326_MUTE_MASK, ES8326_MUTE);
@@ -627,7 +627,7 @@ static int es8326_mute(struct snd_soc_dai *dai, int mute, int direction)
 			regmap_write(es8326->regmap, ES8326_HPR_OFFSET_INI, offset_r);
 			es8326->calibrated = true;
 		}
-		if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
+		if (snd_pcm_is_playback(direction)) {
 			regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x01);
 			usleep_range(1000, 5000);
 			regmap_update_bits(es8326->regmap, ES8326_DAC_DSM, 0x01, 0x00);
diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index f3c97da798dc8..0c371da80c7e3 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -483,7 +483,7 @@ static int es8328_hw_params(struct snd_pcm_substream *substream,
 	int wl;
 	int ratio;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		reg = ES8328_DACCONTROL2;
 	else
 		reg = ES8328_ADCCONTROL5;
@@ -535,7 +535,7 @@ static int es8328_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		snd_soc_component_update_bits(component, ES8328_DACCONTROL1,
 				ES8328_DACCONTROL1_DACWL_MASK,
 				wl << ES8328_DACCONTROL1_DACWL_SHIFT);
-- 
2.43.0

