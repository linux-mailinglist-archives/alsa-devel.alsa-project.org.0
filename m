Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F7099DB02
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 02:59:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 547543E7;
	Tue, 15 Oct 2024 02:59:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 547543E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728953966;
	bh=dWJ9aiL0KPdEdwUWlUtMQzWpBBRw5tjhFlKXxKwqj90=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tJFZB92arAvbpOUcm6xupzMBN3fWdLOxNHeYRqOQZC/LBhaQ8yQAjZjcDkAjAcCUX
	 4y3a2jrZ4zdl9XMO7fdcXVUwOdjqBjryFaRtM5eNtHn+0uuVZ5sW1qByRi0ijHLU1H
	 2NKUm09x6VwUYkByPMremObcF2enN4eNRMuvZiy4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE4F6F806D7; Tue, 15 Oct 2024 02:56:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EB5C1F806D3;
	Tue, 15 Oct 2024 02:56:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3D051F806A6; Tue, 15 Oct 2024 02:56:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU010.outbound.protection.outlook.com
 (mail-japanwestazlp170110001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c407::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C3FDF80694
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 02:56:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C3FDF80694
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Qqc2wUxF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VN/ZasU6hoYbiEmv/uAOeg9qpwigJN5nYRzlF7XJMo0bVVce6X9upbV5Vzw2333PQvgrtvOkY3f2DQilKiu0n2G7F4hVWrAAnWFLNsJQCCDmz+vaohLIwSLVwnNWQa98iTTFYK5M2ia9dlIX42KOb1reIf4/GNajSQ0q+++6rfErb9paoZxj/XM5WBIFVjXl/bm9zBhTq9DXGo5NlkIiciSCl8FQMlSjLSkS9OAqlwGcaShdGfmPUKWaeaWSYRRPhJLP5SlpvLRzuJ+3TtL54FKIE/dJ4vuuHW79NLJFSTbZHiUEakJqAL5BU2dljaiTH/YSXvmHYRhxP/OGt5gAwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipWWxJjMu/EVkBUzGA8d5t1ousLvweYqHA9t/geTqS8=;
 b=eW9r0gEXqcPH2TYVnHc1y9isdT+xM5mPRXBxzk8R631yEnV0n/4GViy77LMIZ842wdbHsfxn6UtrWminpG3+39Th0a1xnNKtYf0bpYNPQSgVug0Hkrgyk2EkN6F7HfwXz8BAdznyutloKFtvRF4Y9xd7ufmciNxxFsG2DiMPkzjR33+fj/nzlbZi/ZWdH/kNT+SYPl+0mgs+KMUqw+/QjiRElQ+tpQ/+VKj9CWRD1y3yFFqhucy+pwoIdOX0+VtrDDT1T5qjk73DWW9Z10ei96ohv1d7guWQzc41b6QJQ/x0IN84+wAhXnrQhhUmsu8EYAYnHV4A3UmbSI+JdtRvuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ipWWxJjMu/EVkBUzGA8d5t1ousLvweYqHA9t/geTqS8=;
 b=Qqc2wUxF67EBptBz+97KR97BQwrfKopkhSdB+aSqeO/yjY1ggPULr/sp39SP8UaOqK+9Ul7ByxytCKXGNSJw54iGIYILfe04Zw5CN7+lOIQvFYqsLTzSplIV8C2zlHQpfMqwq6G/ZC8/nDxJH8BsqEfvjwglYsq7ZhMNA4zqt68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS0PR01MB6130.jpnprd01.prod.outlook.com
 (2603:1096:604:cb::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 00:56:30 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:56:30 +0000
Message-ID: <87cyk2qj42.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 08/13] ASoC: soc-compress: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:56:30 +0000
X-ClientProxiedBy: TYAPR01CA0106.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::22) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS0PR01MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: dd77f241-251f-44d9-618e-08dcecb434a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2lN1ytNyC1Omfh8ieKtJbzXmEi/k3E3e16tNHZx3L387xdH7r9Mt7J6pgrvO?=
 =?us-ascii?Q?aPp69tx00GfM5hkcWFm0doB617i/aJGtzXtak0qFrwzClUNnszkEcK9+av3Y?=
 =?us-ascii?Q?esgTGwOH+L9AUckL9oUXOwOIX2bf+hecyLKp6RGNseW7tprPAJ6gTARnYb9h?=
 =?us-ascii?Q?DyYfivgHklaC3PeGFdYrgYYmvOGQKHzmihjSs6rPWtlRLfv0M/D9NFfWiFj/?=
 =?us-ascii?Q?J5h1ywz/3BqkrXDzVQuhJkSeLyBFUSKKXJRBuTyzKY+zBg6nCTmCJTYucFMy?=
 =?us-ascii?Q?kZqEhKuZl4ZK3EGAIlvofYRaC7RGO51nGCSUi/KqMW3CaREoep/Ejocq92c0?=
 =?us-ascii?Q?iqfIeweFAtEbLJs/owRYw4Yi64DK0693Qj2cIpNW/8dSNPX0IPJzNDkBymxZ?=
 =?us-ascii?Q?YUvl6eBoNCsSdlYN5x0A1pysrdbLBUx/AZzKFlaaTRb/1Jmihue1qUSqF/m3?=
 =?us-ascii?Q?VzjqszhbwDowcfMVMiLCRBxylhYZv10LxAI8kfWV7tnWM0Veww5WoCEWYoMR?=
 =?us-ascii?Q?nHzLR2xTJLTenoe030w0YkboX52fHEoXWPN0sRtod6HQWKt01ixP/8vEXBWv?=
 =?us-ascii?Q?CCAFOHpCRZ42licd29T53z7nLeCq2DRAAJGYP9fBfMpgesyRk6t/HlHpnD8l?=
 =?us-ascii?Q?a62c+P0F5uM1SsNlOoJj0kK3o9ijXrCYBxRXwexvErR7+pYUMLHuRuaL023s?=
 =?us-ascii?Q?An9Hlpuc63+qcpUrujKGdVJPglvNgvfHKoFtejz3J3gFRe/AuOV21O3XN2Yz?=
 =?us-ascii?Q?gl/MOPOZF2X7F5YYg42SI1/jyCgFw+yhEH1Nbx/IAR8BcXy9dDO3bnEwuSm6?=
 =?us-ascii?Q?Np7fD52rlVtN2IowLIOcLVgODy0STIkeNpZqiR8T5woLnb7g4H2eOf6Krz+R?=
 =?us-ascii?Q?YhpmM94e++3EFwiGjDfdgxQblZmiSchGLp7Lbr9fgeIKSuqk5kYsYhm7nnIb?=
 =?us-ascii?Q?89v13diSq7ENOgYWVTVvge0zh8UPFZbmdz4LoT6jmaAild2cfXFZV17SeDSW?=
 =?us-ascii?Q?p1HUWv8vpZxRhmzXpjurzgtISNlKDCjw3rrVq6Y1sklK9folbOfERliEzmlA?=
 =?us-ascii?Q?sgqgkhF9u1UA7iE8xa6YlqjR+b7QEc6RqjGbhzP6UtC8ILYUrnfzqXFWsIpT?=
 =?us-ascii?Q?cljqyiuk1zXU4+bi9hE5IHy0pXiOxnYU9XE6wKMoHmz6zJcZR5USMJrs5c74?=
 =?us-ascii?Q?DyM1U1ZAun+os6zId9/CGP7+ZkEszhtcjzjTqrbORYvxjyNzOdNov6WS8TzV?=
 =?us-ascii?Q?xwzEaQM9hmLmOKXwS5wviMvCqApXuK57zuK/oiwaC5hgeCDPVdK2dLvkCga5?=
 =?us-ascii?Q?paHrMW9+tSZY3+jbejpZLKfCU0NR3b43wD7pgteFxwQZQA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HIPqlKbpY6xPv4AIxTTJT+yklPP1wb0j+sktwMp4s3eFsNfGcQoncLb8KTjO?=
 =?us-ascii?Q?QF0P/V0PbGeIYdmTifNt2yXoyq1FxONSGH6ULd2Bw/2+BQCezJ30lyt6EWje?=
 =?us-ascii?Q?7WcWNm3POsxRtNrH+8RjQRLvGe9MTak0zS8akoEweAR8DC+MYpUyZc0ZA9w7?=
 =?us-ascii?Q?6hLugPu8/f38dMsK/Fuf75NiCT7s/vbJZP4eIxwb2ZFE7XnTBdHsi+lMlR6n?=
 =?us-ascii?Q?S/X4WbttJY8S0ocG/kRaeC0w5+WiBtsrVHAQmVo7OyX9x2VR8Nrlu4PQqc4q?=
 =?us-ascii?Q?6JOVpTGqb5YL6AbbpIqV4KJnhcoqnqcwdUpXFqJ5Iv+IYSmm2sCe3kwXQzK4?=
 =?us-ascii?Q?Sig02rwwDXaSgDz3nhWJETQSxmPO6qSsl1qrt60qhgLVsiV1TaF7Ky3bOK+k?=
 =?us-ascii?Q?mzycpv/4rpz4QsIr/OV0Jh9OqjukAa5FjAN+9rnkyd6uEdnghkWvyXAFPrVZ?=
 =?us-ascii?Q?PxtYm5evK6p+PNPknJqRZH+82ZXIhg8U249y1g7Dgsu1byq+uaZanQrfXz5a?=
 =?us-ascii?Q?x9Twp4gp5nIEHmUgugD+IfFWIx6mXFiBCDTKaU5IUKf9xvqT7hpxcXCjLqne?=
 =?us-ascii?Q?4Hzgx7ebhibkYFxQ5+vDhti1xrtImX8P4h3JTR1IwDhZZH1H/dAuVC/vbGh8?=
 =?us-ascii?Q?vAkBkspdBT00I4Dk9Ega5VzPuzp1yv6s+dUugcACKwxG0t2T5mt0Rh5e7d5w?=
 =?us-ascii?Q?9f6np7MGJcVFNA44Wbeb5KyMaU/8Ms8R7GWm9KzNEk7h3+IeG+TEvSJHTht5?=
 =?us-ascii?Q?PK8c9077oeCG+uYw2wkO2euXp6e0jo1LHm62MIl7fTliDs5hoQcD/8QUgTPk?=
 =?us-ascii?Q?GMjkAnm3Ry1hoJyD35GWcMmCOguX0iEGdPoPjMdnbyKTpS5Lf2vCRm33o+yr?=
 =?us-ascii?Q?K4apqC393vjTT9FUwg3LA7hwNeQtP3JNltegM9NFxu2Y2wAq5Deq580oDMAO?=
 =?us-ascii?Q?XHltpDEn9XvwY3VyM8qSbMqH6BK6Ds+3yF6sLRnkBeIMAlWDSpwibKP24RiC?=
 =?us-ascii?Q?1L79N7DyKQaRvGbkK6pa9iesHrKSGs1/VfmplwBnG/+bjaMl0Ww46vRY1wiR?=
 =?us-ascii?Q?JMNX5j8PswJnNkrlH9Ufy8MKhSEa86WfTF0iJEPTb8YYewQXg/ANK/zpjkMN?=
 =?us-ascii?Q?dSQsUcJDLyjvjWnHc3u8sYWCXiErPO1UaJORTfwyEKas+thyBxTeX8FIupni?=
 =?us-ascii?Q?A/dtrV16k7eefhDntLEBWwNoQG0fJ4qJeYeOCZEEoTcqO9SOYPXrvt16OIzB?=
 =?us-ascii?Q?aMCVH6Mxbnc7hbjHJI0qX6XHArVN3qVt1Bz5/vse1uCBDkgRgmbSUZhvtE2H?=
 =?us-ascii?Q?jILd96NMvZPrRm+xwkSuILo2VqLZjcrEPZPaibQI8sIKcx2vQ/iwsTFfzDzY?=
 =?us-ascii?Q?CrwXdQPcE2LQD0qBA1M1F2yx1vjAgrECP0gRe8EYna6ffW+QO7FcP0Jmi9FH?=
 =?us-ascii?Q?EqEzZ+3YQV6WrgbLH9K528igcDYK54mwPdrifrIG4Cx5NkjHBUpV5/TNkngh?=
 =?us-ascii?Q?SYVcvUFbWV64Jyb2zF5gLzac8kInLqiJHC6m4nQiDA9vD8LWFY8iRe7PmiOq?=
 =?us-ascii?Q?kyVtAQ5h2Z15FDxBv/JUdRERBfitBwJzIZH+0KTje+ne+SV+uTgu7Tjoikbj?=
 =?us-ascii?Q?vx0rCPUFY5mvQGUAZ+qUEeU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 dd77f241-251f-44d9-618e-08dcecb434a9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:56:30.2291
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 oZL81ZGZBvtSkCCu0RPG3d61WDkzVrP0s1tURZTFtZfNIm2kRC2N0TcVE/7fqCz63okqwhjKjPim22Wwy5Dzg2JXMz/qpx1EKPS7BqV8e5botUd1JQyQEyqHMHXYCn1U
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB6130
Message-ID-Hash: N4LLMCHQN5L3H3C374YXLR6SJOK4IZ6E
X-Message-ID-Hash: N4LLMCHQN5L3H3C374YXLR6SJOK4IZ6E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4LLMCHQN5L3H3C374YXLR6SJOK4IZ6E/>
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

