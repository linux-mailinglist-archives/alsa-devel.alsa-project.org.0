Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 111E2940430
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:12:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DEADE847;
	Tue, 30 Jul 2024 04:12:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DEADE847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305575;
	bh=jDwVDSiSfpot/eodvOXCxZpX8pjYDXLJtZXvuYs/v3E=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=Sdc0hN6RImKP47x6XhwnO9EGNl/3JuN4yFckGlw9/p03+YywjX795O8Yw4TebcYpv
	 TX5E5Sn9IoV9Vs576HM0qg8YgFfWhDZNt20SFgv3m++Zsk5D7qgri4Srab8TkVJK8H
	 5q3IKu65jC4JrHkbP/NjJxD5Gdm4QL4Q6H7jExPc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 42EDDF805AF; Tue, 30 Jul 2024 04:12:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6B068F805B0;
	Tue, 30 Jul 2024 04:12:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 98469F80269; Tue, 30 Jul 2024 04:12:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A72D1F800C9
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:12:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A72D1F800C9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=iYmW48y/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOc+xSbVSuU2isfNgalps5da9O/bzEG1hV6pRkQ8cXTPBIiLl6V7zpjLciuQKcSM3EENn0H/B75Y2hqHLEZipu8caBEghqzLN5joMtdVvzzURoDVePWVf6fU+DFp3t+ecBEqcaL+QHR+lPz3GGHx/I6VwuP1IJbBkUuk0fhRNsXhV9FzltxhFLcniTffgdWFnTJM78J23w355kBTbPxoOffLNlNRurdA18Nv7Phh5KH3/gLWsV/L4+XRe8Y7DaIjaeXYTc7D9k0UInjOOapJsMG8XcstCaXmfyvyZccg4WEAfcduxU4w2tvd1JItXiXtEcyjBNMnmYAK9CtsgLim/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u3C7R67rzk6D0aUYzq11V8WF4B7YxWBPYfMIzgcgt2Q=;
 b=txK6hS2FpbUIHVjQ3JoWgpAusCZimdfl15NrakYHyOvwg9zHS9PSGiS6tnp1h911DPykTxF8LAhKTAMrVzuLmLpF3kBKfWApHhf+FcgoO1rY66PhnXPFeWJ3bBZkReIm7RtOqfgEK7myeiqepSdC4YjgTi78588UUHkELBx1emx8WvHPaV7esLXL3MOt9vOqSBeDCOsTmUiJqeEGdomdIPkj3SNQNYNafu66L92hizaTP+pbDoAEtbgtRawuxVnLXHwVwp1RI+l+8Ru3XM6Z9K3nWru5yqUqqpkZgBiswBqGghIuSvv7v0MeiEmbSU9nCgwP+YL7XatDc9sDtSmTgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u3C7R67rzk6D0aUYzq11V8WF4B7YxWBPYfMIzgcgt2Q=;
 b=iYmW48y/mrjIuKMnBXBYHE+GK+jmRn27H0yozQrilny5bD7aB3Pr1cXeBUUEhdZdL6RQJhyzb+J+2UwlnXYd+XyzCMgka3rIZv3kQfG8kGc09tCN5f/Ye9f7AT/5ky2VjdsJMp0mCuDmqfHmmFdJgybP+5Y92CXVV6EvpNR+7O8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSAPR01MB7277.jpnprd01.prod.outlook.com
 (2603:1096:604:11c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 02:12:11 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:12:10 +0000
Message-ID: <87ed7bk4qt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH] ASoC: rsnd: remove rsnd_mod_confirm_ssi() under DEBUG
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:12:10 +0000
X-ClientProxiedBy: TY2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:404:56::27) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSAPR01MB7277:EE_
X-MS-Office365-Filtering-Correlation-Id: 96386077-553c-4fab-a234-08dcb03d0550
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?+NnNxxg/3qdtlwUso+rosfM8O83gV9l/hiy31VsReCr5B/vF3+WhSUJFztQ2?=
 =?us-ascii?Q?uG9NQgA9plKx+OZE8KEC3byAa3owBi3NPhWl+x07HI63m/jxOVs4c5Mm4LUf?=
 =?us-ascii?Q?ttvUexAMisBpzEehemseyuz+R0wvQTTLuIFseJPNdeaTdzbdxGO2LFRruF3O?=
 =?us-ascii?Q?o4fy3aAkxJpHzvHld/HHQfzgJAl/UWZ/oX3TvtZuunKl6r+FzIWap9JsH31F?=
 =?us-ascii?Q?OHYqucXDWLKu3DpjxSDfozAGDIj4H7IvUXgMZsNMk1hYHXUCXH7ciZdzhWPs?=
 =?us-ascii?Q?kqy1TOfrDZ9Epfo8r3JmH3fjpiFzg6vPcqVuXbTr5llERD9vpgsyB77ikv2q?=
 =?us-ascii?Q?U50us70kX3f0rgNEXS+rnAVzvULV/847dC5SAsyK8ZIVXvprRVGnhshWO5yI?=
 =?us-ascii?Q?R+RBfFuoQC4L0vNvxqEWwFbrWZ9BMhEz9QCm+DDTt1kVSNpJrOLTHF6B65My?=
 =?us-ascii?Q?h8lvEzh/wX31VwQiuVlTRtpIq4H6dRArqp4UOH+wcEXE3WrccLhAs7uUo/07?=
 =?us-ascii?Q?T20eH53HxpVH5C9Tls+S3BTLjxku3XqibG4qfj1/XyWL8M9TrlD72oE+8zyU?=
 =?us-ascii?Q?Snv2ZEPwHFgma3+e7TnWfCCceibmrYe0MkwpM5bS/ClEyfPBWPFGxHwHZO/P?=
 =?us-ascii?Q?tYEzuTsWddX58st/9Mr90j6FwULjSrFcz/yDaWxawHdkJBmKfrPCp2xU0VaW?=
 =?us-ascii?Q?r93hB1ozZc3vBJDS2/GZCH33fwq1cSFHnNP16ODSZlJN4+aNkukKSRTpJ1Yt?=
 =?us-ascii?Q?V2gwVgbPyYgZsKQbiWHtVetZn/lBxBdsCEcT/9okFrRxg0lJt/hWwFo1Rz23?=
 =?us-ascii?Q?8eX2M5htwWvfw2TRhx4Ai57KSzvl5bsIbf3BGKxAdYsZTRJInKZBuJk8jkk2?=
 =?us-ascii?Q?+wkQ4hhr8VeYjrK3Q0aJUpxbSc9jlMle57UtDut3+rnXaoj8Pn2YP32+SuCC?=
 =?us-ascii?Q?CJCx/iZCRf55jRZUWPdDCUK3okqq3Ske6vckSl62i7JsU/OIen8/Uaq3diiF?=
 =?us-ascii?Q?zaUKz3lqAFfp8Mv2Y21Qx85BJj2l1y3yH/BaMCjniqGCvjBDcS9HaDW6XCGa?=
 =?us-ascii?Q?jyfi+e+ZGI81Q629r5u/grEGCl8rvfZ3SU/Zi14dCJS/4zQxO+/UJBjpuUZU?=
 =?us-ascii?Q?HN9nefLH/MvZ/LWao8VjLzI2FMv8WhAiHT96LEwneDPdAhIp9YYKkCQvxAOa?=
 =?us-ascii?Q?UyR7Y+zSiPri2jW+paIULyle0XaOfbRa2qthsQ/hm5U3vh2TBzWGc9BnqOet?=
 =?us-ascii?Q?gpitWReRZvgKvhCHAooD50XrwzlGlo+egebRVoZpvBfQ4gkm64gEedThdPMl?=
 =?us-ascii?Q?IUVr2RB1NSZLDQaoBrXZtoKlnPIumaH3I51IZ7O02Xrw+MRmhDQIv/Sp8cT4?=
 =?us-ascii?Q?Ho5c437mUKCm7cQGpVuUoEy4xRv4xyJ+tw4BZu+s+tH/fIaNtw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?lurgnAvx6EgBUnY/zt6EeeeRF1W6LaXc7gthpyW1St1oHNgTi9zm4zdNq2Ni?=
 =?us-ascii?Q?gxMVe21Cf+McPi5VNTG2FSlPlWDWzn6tDn2ybRjEYJB9rjo/U4Y9oIGcwm3J?=
 =?us-ascii?Q?a8T08S7fwS7/pBN28+brJx10Puy2oy0gE8xYgVjKj6vcNTU8iH5Rfx7NNOzS?=
 =?us-ascii?Q?d+kWThiTit2ek5r9fqOwI8ENmMFm/PNUjPPhbYsiqNZFJIfl3uDviIgbDzzP?=
 =?us-ascii?Q?0cSKRBQYbKxh54g0eQRO0pBY6TbEcO4ShuWFsQX157tz10pRYdQvO3FSmfzj?=
 =?us-ascii?Q?BkL8AXltILHfIVw2ffxJNZ3UGr7QjoxVHtNYG+FIwu9ZDqe2bGygKrUOHFcc?=
 =?us-ascii?Q?BrdfqG/EYhohXOkC56XO51LP3w3DGmBnwPyY11tLPfPaiXvZfN2L8ZjV061i?=
 =?us-ascii?Q?5B2KrZCQo/0IgI3xpYAQUgK1LazikQFjKW6uN2vbYIq85tpMeIB4msJSUmTL?=
 =?us-ascii?Q?JoWTZunaAZ/rxqQV4eBiH/B1fnYbs2ESauuhL4tUYl+RlEbJmpJlZRXkTsBO?=
 =?us-ascii?Q?mVAcXc2JarCjxJtbODUoEMK4mF2HlRs4PL/JzpYzKgqTapd6/bkat5DlonzV?=
 =?us-ascii?Q?sqeSSHVCu62GlUWJEViiEQxiCpCEsCGGyBbI1NdXAfkG7hqCLdLInWy+faGf?=
 =?us-ascii?Q?0CEr9/LxmCX4ZBsO0lOQZXyw5mSy+GWbwYaFqcd93wz/NFRlLr93Vl79dCTH?=
 =?us-ascii?Q?DSEJGNyDmngSJQleC5vNRjmE+kiTlTbXM8+5zdIkAcNtaBG8kIGxSJuEG9Ij?=
 =?us-ascii?Q?42VP8Ph2LE21uiBoAeCCCE6Nr1DQy7w5xCT3T6zGpCuGmsNVYEZVzSYVMnp/?=
 =?us-ascii?Q?CVtjYGSbKK2KxJkzhsqlPNBeOk4tghE5aLfGZnRSAXMQWcvXH37x5jzGd+Jl?=
 =?us-ascii?Q?hqjB7aOA6tpITFr3TKk0r6qBeBIOGyDOvgtZBT8u9U55ntF/V9WUAdc/jbFd?=
 =?us-ascii?Q?yssxjqU6gn+CCOg6gliBXR5cnUsGncQPjyuEGPeTFfaGoOA31VIhD9mfw+sZ?=
 =?us-ascii?Q?T7s1gvkUgy1zC20402BUpc5gAJOcxadPBg4dZKusjJ9wFgcX2YX8fcT69Lfl?=
 =?us-ascii?Q?9sdYsig48Dcs6qwW1FAR1gZb8yqHsp5TxoKbPUVNPleA6e73cM7NXXiVfFS3?=
 =?us-ascii?Q?CknWnz5XEfjRcq7X0+Ph/tthqSAHmocChGwJjK60gGNb7PPralRBNxdV28cj?=
 =?us-ascii?Q?AQ6NLPNhJn2xRwBiU/VE5rOZMgZqSTnQRL+c7xXJJgMZV7CyLK0/cyOxzxmU?=
 =?us-ascii?Q?z4GeCi4kuoZKIMiN5dbuiakkFloxBCQ1nPHqhwIvwaV4IdZef3ztg6YlIEkf?=
 =?us-ascii?Q?zwSEoHLCtFw1Sxz6AlmF2URu/N81eNkPytRx7Dq6vT3y3wBPhGcAI9ItmPsX?=
 =?us-ascii?Q?rQGZPnMPZPNf9sR7DvYJ4FjsAGaHFZkNj903a49b8akb+yZRKO8hACAYOJtn?=
 =?us-ascii?Q?KEszN7eFdLeP5jm5dXgnLqI8s8APphUksdTM0g62SUTR9HTCL1aJJu+b7sBh?=
 =?us-ascii?Q?YegH2caSLFcCCbSk/UiGk/2WbKnYpiCdDmQTtmMoZihua6O902efcOrFiET9?=
 =?us-ascii?Q?tc0zuWZvNy6ck8PsROZMIZ8uPqOknftpfawmSma2fLMEZTE1AlAOsfMdy5QD?=
 =?us-ascii?Q?MwlnvpkOtiZ/5+saf/mRNUg=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 96386077-553c-4fab-a234-08dcb03d0550
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:12:10.9464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Fk5QvP3VyP5dGtykyz9ylH7/ClEpBksg1K3p8/4wKaO38uF6pl/hq687k9yMBJKhTAPJdXUL9nvm2U5AK1yolN7ZwPu7UY7nHxAWxaCPyRVPq1Glo6x2dbNzP58/TYsJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB7277
Message-ID-Hash: 4RVQNUHJSETND4CQRYCANOY6QRKMXDZV
X-Message-ID-Hash: 4RVQNUHJSETND4CQRYCANOY6QRKMXDZV
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4RVQNUHJSETND4CQRYCANOY6QRKMXDZV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

rsnd_mod_confirm_ssi() confirms mod sanity, it should always be
confirmed, not only when DEBUG. This patch tidyup it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/sh/rcar/adg.c  | 4 ++--
 sound/soc/sh/rcar/rsnd.h | 9 ---------
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/sound/soc/sh/rcar/adg.c b/sound/soc/sh/rcar/adg.c
index afd69c6eb6544..0f190abf00e75 100644
--- a/sound/soc/sh/rcar/adg.c
+++ b/sound/soc/sh/rcar/adg.c
@@ -262,7 +262,7 @@ int rsnd_adg_set_src_timesel_gen2(struct rsnd_mod *src_mod,
 	int id = rsnd_mod_id(src_mod);
 	int shift = (id % 2) ? 16 : 0;
 
-	rsnd_mod_confirm_src(src_mod);
+	rsnd_mod_make_sure(src_mod, RSND_MOD_SRC);
 
 	rsnd_adg_get_timesel_ratio(priv, io,
 				   in_rate, out_rate,
@@ -291,7 +291,7 @@ static void rsnd_adg_set_ssi_clk(struct rsnd_mod *ssi_mod, u32 val)
 	int shift = (id % 4) * 8;
 	u32 mask = 0xFF << shift;
 
-	rsnd_mod_confirm_ssi(ssi_mod);
+	rsnd_mod_make_sure(ssi_mod, RSND_MOD_SSI);
 
 	val = val << shift;
 
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index ff294aa2d6407..8cf5d9001f437 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -871,15 +871,6 @@ void rsnd_cmd_remove(struct rsnd_priv *priv);
 int rsnd_cmd_attach(struct rsnd_dai_stream *io, int id);
 
 void rsnd_mod_make_sure(struct rsnd_mod *mod, enum rsnd_mod_type type);
-#ifdef DEBUG
-#define rsnd_mod_confirm_ssi(mssi)	rsnd_mod_make_sure(mssi, RSND_MOD_SSI)
-#define rsnd_mod_confirm_src(msrc)	rsnd_mod_make_sure(msrc, RSND_MOD_SRC)
-#define rsnd_mod_confirm_dvc(mdvc)	rsnd_mod_make_sure(mdvc, RSND_MOD_DVC)
-#else
-#define rsnd_mod_confirm_ssi(mssi)
-#define rsnd_mod_confirm_src(msrc)
-#define rsnd_mod_confirm_dvc(mdvc)
-#endif
 
 /*
  * If you don't need interrupt status debug message,
-- 
2.43.0

