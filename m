Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B0F394729D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:52:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BE0104EE2;
	Mon,  5 Aug 2024 02:50:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BE0104EE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819045;
	bh=KJ7hHIXeqPpXiCeZu4OKeUR7q5AtfLVCay8a1Iub3QA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=msmJsEIXt0cXS/NA4o3TMOBsXK8HSROJZMebiAr7ou1Ab4fe6XAtKurgd1zSeITcq
	 Lrl0vozY3YAHcirGYLYWxRRz6PASS41ZtsAIszom502xl5XuK10o4EuIQtdPL0QmT0
	 l3ZTox4YX0nQOY8vLjcERKXeuXyJMEVdLYB3/H18=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 46FEFF899A3; Mon,  5 Aug 2024 02:39:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 235E7F89939;
	Mon,  5 Aug 2024 02:39:43 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2E9DBF802DB; Mon,  5 Aug 2024 02:38:34 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BBC93F800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:38:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBC93F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jhURBzIY
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bDMgrchOgJqRRwSkmEYwEJa71tvC791lxdLKCZmOMYbmZEUkgs4i/mCZSgSzt2dm2Zdg/1DfHyFp9taV7iEZFfl+2a/v4YKXZsovl751rnBBikUFEP06vSf5aQghkgbcIj7mLZbZ8MEKWTbMRqkMuk9RGPB6ylDyzumCCUe+JJHNW9ukvFHeomKfQKCIVQ1MaLghFW9UuHPVriixJghad4RJEQmXjwjBIx0XGlXQkka6M7Gw6aeFi8NnkNVb6WSJt5hacCl5wiwGdg50qA/VLEO3sOsp/gVcCdgolSvYW7gU+WREtYkyxmFvUt00gaqoB8A6KDD5x/aeHcQNskPxJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgMXDh5BBrEx3fDNH4NG18IPsWtxZY0FHEAj4bUfTqk=;
 b=Q0uRhwE4l9/B8VEZUiofoCSxfBf2N6IizPQ9u76F595d2taBXYDOMtAau4Nl1/12EbT+r0zJmxX8QvSrdilE47xiaQJ+3FUmAmnYdULwEDUihfYZb7rvg1ZEJPvca0m/rry9/cR0JANv7+BnWX+dtNfhdlp33znLejpAoCVnv8Yhz+mU1f2fwpVizcC8q+ZJA3fDXZeZrL4SEcdc4L91blDEt8sSqLt/bZORZ51Do6eROLYuPYApOyFa5nMbrTiJx5Vh6EQOMd4EHXVdnjzJGj3Hgc5R4OMF59KwMqDaZ1KqHAyOuLb41i9xlFlbWPk8GteRaA3NLBOryIXsOZ3AvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgMXDh5BBrEx3fDNH4NG18IPsWtxZY0FHEAj4bUfTqk=;
 b=jhURBzIY0kv2UIW85vIswfbBL54fKwpjlCiNvsqeBmGXcoUKSBhWpqyNHjADGw8SxbnYFcP1OGsM4auowbiz2CuHs48+6ps7dYiQgQBG/LG5C/746cBsFnLDItK6wl/DVIDpQ4hyq3xMyefqDwHUAKTFBxblT0Bs8kM6WoIMzuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:38:28 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:38:28 +0000
Message-ID: <87ikwfztvg.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 040/113] ALSA: firewire: digi00x: use
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
Date: Mon, 5 Aug 2024 00:38:28 +0000
X-ClientProxiedBy: TYAPR01CA0100.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: 567a35fe-b585-4412-bf76-08dcb4e6ec7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?v+sO8IglqNAxnVp1KTFsbgd6NyF3W1xypioNKGxk8z9U7ooXVLzvQf0p9vjM?=
 =?us-ascii?Q?D1U82ne5Ljvyf8ISj6SCDGM7FXMjnwDke3gFC07UCGdQbyNK7zaaDREx6+j3?=
 =?us-ascii?Q?WRXg9rJd8btdXqkw6PIR0tTS87a1kEFGFxbHrAvtcouW24vgNoJ2vHyCPnRF?=
 =?us-ascii?Q?5mAc2lCjuy28bKNMd6QIHz2uI853seFvv9T8MQ/yVp/BFfukHv34tiiKf47F?=
 =?us-ascii?Q?XLqsJPD6flDSJesQAl5if7b6x80AwYAV6CfDs+cHhlx0fz5iPwwTtqBLtaCA?=
 =?us-ascii?Q?pA+QC2pNRS/TKDnIcQvP74cQp3rmsDXmFLQEEqiAIgOQAvdL0FcMUMNesSuT?=
 =?us-ascii?Q?AHRgeswqKagQi3wrmtArg4k0Bj44NVZ/vXKXcICWPFUCOA0OkA1/G2NfL6Ke?=
 =?us-ascii?Q?j3SHfTKIXkkCgc4FrIAMZawI4+wiquuictasxU3tn5he/il5hMpyR8kJk7ug?=
 =?us-ascii?Q?gwuXoQxo1GOlOvA65gMPyS0LOM34vIOaj2pUeTFdhmCejaupio5lKh/e0pw1?=
 =?us-ascii?Q?VyZkRZDWZLxqDwE0optIXxTL7PjMFbbY5liECu+5jcsxs98AgoBdCJY6evAX?=
 =?us-ascii?Q?Hb1nl87hXonQpO1m+dKtFG01IlOZUHRtmCuxtVbmu1lEfvRYBHX5utqlM4rJ?=
 =?us-ascii?Q?4xXRG4SHwxMPLDdcXmoilVF3bzwCKh+PWjAg+pTslurVlcGmjZ2Zz4CP0+6B?=
 =?us-ascii?Q?QlxudyFIllKmm6lq9xn6V4QTQcqFwc8qtAldazLBeWYcGXY70OTwyuNOX5+Y?=
 =?us-ascii?Q?pgyI5dHQjJzjl8d+BGxAhU0hf0qfOoFAISa7dz/YEC91RQ8TqYhKPpYiSvcJ?=
 =?us-ascii?Q?lNANDmIHiiDpqdqeWJaQLftLM8711VnqxN5M1bFLUa/gQ6b/C3xOmZ9w+Co+?=
 =?us-ascii?Q?vVZVHmpABbNZU/Eh6VTZDMbFXGHu2tpO6eo4unfDeHP5BvOf4+Uig3AYIx3T?=
 =?us-ascii?Q?IJ4SAeFOBKaqBbwkNt3Cc5e22/fK8Jx06O+IhljDotPTwHuWuSvTg2saTJaf?=
 =?us-ascii?Q?HD+N20/ORXDrksBhlev7gF1df967UakNM7I5vRD9jC6NJpCjQWgYrNOhHrN3?=
 =?us-ascii?Q?4iOzM7x7HFZm4/bo0+CWUt8kQAh1hEhjsrN9fkrLffk9KfPTgbfpddK7tR5I?=
 =?us-ascii?Q?EyP/EOdu/vpJiN62+OgDNHLkxdA9yLMTphVPwcLVKvLwXkyVBkA83m2RVyeb?=
 =?us-ascii?Q?yT7J7qnW1ZqrhQQldDnmJ6rWgrtArd6aYQY5FK9wsuWeJ0TPnL4XPMR02pnU?=
 =?us-ascii?Q?mw6HexHN3sChAS3mguClzDdXXRmF9XWMArck0fQVbIqrAoiEev6i2tTVYgZh?=
 =?us-ascii?Q?xZKmskV9H+Iap2y/wR+asUa6s1FzsGCVc3A+JhNtdiDEgtnxAOWkZkFWj9PG?=
 =?us-ascii?Q?LQzRTtTiLr9q5c5PDrAkDOSLOVbRRcD9WQPRVSmwo7DPHtSs2A=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zARYYYA9C5Qm/g09JRUgaxC3uwjGLvfxdeIC84I/jiAhVRDb5fF6QDBXz+Zy?=
 =?us-ascii?Q?ulOSr6A45Dsy4cpGHxBbWvF9tvgPJMX4utqxkArY1pq8ASfS+0w1NX6Yh5ml?=
 =?us-ascii?Q?N0hHJR6kzhvDksnB1fYMvV1DWCSuuOKkH52FQUapLgmz2p5Z+sXW/naLTkk6?=
 =?us-ascii?Q?a4ITCd+6ixkHuDzEuIrFsSeuBOH7yQk2upew24kod5UJPHpmuBSp5Hs9E964?=
 =?us-ascii?Q?VHjR3mOa7htqVevorLq+nnpF8xwAliWopbPHH+z33Qh/xlVIPLeA5AM39bnA?=
 =?us-ascii?Q?s/TtjC3+VQFBUw6d8rKOpcRpN8LW+Hv7kEvvprwtIfhrvFPgBomN1WhXA3ht?=
 =?us-ascii?Q?X+Hc/eKuye/bf5dx/90oi3mTXVLcT4tqHV8eoi3PJV9CRFixBwCvRl0P+7DQ?=
 =?us-ascii?Q?Uu1vPsN5kOofpm7vfXgsefT4IQTDjW9btHdmP6JfbVRVdqeCw+teZOo2izJT?=
 =?us-ascii?Q?AWxkQBZbj/1OhGdtzPygPP75mpB2JWqH317UXVX00+3o37C13YkzUQu3VqoS?=
 =?us-ascii?Q?E34qNeJT3oDx384U1YY0tcq4skwV9Ro2bbZ1lM+hyfbb2u6jXYvERdD+hQvS?=
 =?us-ascii?Q?y2RIBnOyrGFI6yMX80oezABy5ITtuuFvGlrAy5dyMj7xP7ZIBuVqU2BSZd4U?=
 =?us-ascii?Q?xVBoNZCP6R7YiTY+gTPAwN3dXHJMXJwRUqS5ZfTBm7XN7vPQibYVEt6mt2dK?=
 =?us-ascii?Q?GXB6Y33aSXjiGY6VdkZUWyMdE/k8sO6Y/sIqJv7GgpLgkTLu1I3Px3KPHZxy?=
 =?us-ascii?Q?u3GR4UIlMve687BPpOQvvCUoMuGHLFj1KAJIiVIDBzsQx9enugjCwpT2vWoP?=
 =?us-ascii?Q?rQyjfMKcYGUru2C+mNi/aDMhMVdB00CtIKK8nKqeir8xa7vkUZ5ThCCm4nLn?=
 =?us-ascii?Q?A/nX4QKKkv4fjmyaM35ivbIlqT7GAcDWnLL/wrj4SpaRs/JuFOMyQTklN4Lx?=
 =?us-ascii?Q?YzKk0D+NBv5ElQqDzGoJErq1KKLUde+sRPuDlvOeOQDevrDIeYq115vp4eeH?=
 =?us-ascii?Q?cGfpth6OXA9Gpr1KQmQMV1xqn7CL1YiHMYVfs4Xj7xP+I8geFRxSmgKetifY?=
 =?us-ascii?Q?cwoKGCN+Z9owGej35MbHhJCLcGCMg4QVP5G+mJaNQTVxCi1vQFDobMuZ5YWI?=
 =?us-ascii?Q?wZmw5wj6ikcQeoc3/45EZAnOtGQPuZfKM7NAMsjO+wOAbGfFq5cK2SpRrLeu?=
 =?us-ascii?Q?5TbdT6bIsLDFUGtarHGAQHrmkJ8Y7DdZuaJ1o0Vpv784msPgTZbnGyJcRoF8?=
 =?us-ascii?Q?8eTX3w/XJBF0VOqsAh44kiJop7boRjXKasyIZaSNBqY7UkPhysQe5hQBlLDD?=
 =?us-ascii?Q?Dxz8JL+mB/dmctsHhjC4Jp0qROYjs/H6k3A3PpVeyz42WjfHRqF8cCg5HeXb?=
 =?us-ascii?Q?EsA2jx+HIZPpve5AjokJmC30dSCI7AmNGJiahTXsfjg+OsxoJhFSJfxY4ZGH?=
 =?us-ascii?Q?RDKqobqPtwSlreaGmeeq1PJGzklRBKw9PG9Yijg5dZeZe1OQAl9YqEjThuJ6?=
 =?us-ascii?Q?rLn7kElU04WnDGynwcEsMBa9pBeCcesNpvl487r5AqXaLDEQ0O48B7lIzUk7?=
 =?us-ascii?Q?skVwgIFx4DBzDCXAhuHVB6dQZqa6VgWK4wOXSr91oV9Q6CMRkSqSQrdpQT1Q?=
 =?us-ascii?Q?K0oy1Gsy1MU6rYmWXs9QW/Q=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 567a35fe-b585-4412-bf76-08dcb4e6ec7b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:38:28.3768
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 0++0KTCfFAGHaVIYs+DQlU8eiciyrsEM4mXK/ICuIGtaFC1/ikZOH/i75BL7nDsF15yyTa7spBCLkKY0EQZSxrxMOH6zI6qgKQ52PtODTM0CY6PRMecfxxehlb+nErPu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: A64Y2Y6DHDSMSCGZG25HX4U7EVALHP6Z
X-Message-ID-Hash: A64Y2Y6DHDSMSCGZG25HX4U7EVALHP6Z
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A64Y2Y6DHDSMSCGZG25HX4U7EVALHP6Z/>
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
 sound/firewire/digi00x/digi00x-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/firewire/digi00x/digi00x-pcm.c b/sound/firewire/digi00x/digi00x-pcm.c
index 3bd1575c9d9c1..42ffed7b19e36 100644
--- a/sound/firewire/digi00x/digi00x-pcm.c
+++ b/sound/firewire/digi00x/digi00x-pcm.c
@@ -63,7 +63,7 @@ static int pcm_init_hw_params(struct snd_dg00x *dg00x,
 	int err;
 
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		substream->runtime->hw.formats = SNDRV_PCM_FMTBIT_S32;
 		s = &dg00x->tx_stream;
 	} else {
-- 
2.43.0

