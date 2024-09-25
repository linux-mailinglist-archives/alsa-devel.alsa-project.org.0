Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8E69869A5
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Sep 2024 01:39:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0C9B8201;
	Thu, 26 Sep 2024 01:38:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0C9B8201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727307546;
	bh=E8uRcDIYfYQ3yNKQ9ccPMOVT18z2G83yqd3OOxbR08A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ohgfn8dHP22DSdsqM5Nv7vt0wj46N0rVNlJyrZ6OOCaFwRhS9/v+LF7brIG37lG5k
	 Hhhcj+ROCDaqvwBZucwbswjP+7qZnv8oAT34kGMNHkAQQFQHCCti494r/qHNT9nefq
	 6xQ33AdEMMFUg4gZ0nWJDqlZNgXtjn9Pbq5tHQ/U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BFC7AF805CB; Thu, 26 Sep 2024 01:38:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 54E6BF805CA;
	Thu, 26 Sep 2024 01:38:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 417F9F802DB; Thu, 26 Sep 2024 01:38:15 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 899B8F80074
	for <alsa-devel@alsa-project.org>; Thu, 26 Sep 2024 01:38:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 899B8F80074
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=ptckQZcc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgnDythq7qp0sq1301/pIkRx8RfrDvZIYK3P16TjspRNOR9PpXG0vCi32H+qHPvKpe4eazBaX7ChXFnkErUtvXxT0XQvn7jStxkRyvNvLAONYvwFSU0Qu/d0p7JTIQi8YcKzsMbRrtFoBEWZkSvU/YzpAX17gsl+jYjEABbgIpQG99G16TiFt6GILj3n4SJAJiIACOJAKSYHXQK3Q/vPO3K8g2/NdSngohTJtW5qQFP/wFz91+CoeVpITOdKeJE1RPr5BnzxAwQ9qujlZFmrkm9FuJUaXMCjQPUmiqGwtVrBhmXVLFnGKh8NQvjOzAtnl2lft2XsoKK7kqpuXtXMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdqlVGjn7/8vAeXOmkLE4hLk7DgXCc56AgZdATXFRY4=;
 b=ylc0VN4cxtMSwzhyOdft3akMGvFX4KeP9M342g+Ut68lcP96hesu7R3vku4VcJOPjq14OYEyNAEiDUyQjdjUsU6v4QPCWU5BovOxc1id18kF72qxWzNVdOD+3wu5zFq1Aa9+uc/tUlhEjb1KYD/L1Ca6XjIdzE7DLzzWTgHU0ZShfZCnmgBRF6GMxOUzjd4c/NLAsDdncofTJBDMJkN9lsll9G28XASlItP+7X8P36WooH4htfpb5EvJxV4lrsruB5pmfCXBzL4edCO7bkM8MiMDe/mgj7i4paEKclsXIFWOv0h6GPLluE4sy0sqJ0Nql9icD+SNQGOjmxdL/n/WPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdqlVGjn7/8vAeXOmkLE4hLk7DgXCc56AgZdATXFRY4=;
 b=ptckQZccMBqMfObZ+zBAHuNBqd/6PVuWXQAbrf+/Fb/VCGWwKMGrv5KZKOGfwnI08W3v4aPvb03zmnRa1ig9f7LsnRFAYTRH4MbswZl1fBmmM6mBa2z+YofoKxhUT7ChrJtW+S0Pr/dHcK44/Y9o0wynqeCQDEruzfUukhcEjas=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB10634.jpnprd01.prod.outlook.com
 (2603:1096:400:292::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Wed, 25 Sep
 2024 23:38:04 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.017; Wed, 25 Sep 2024
 23:38:04 +0000
Message-ID: <87o74b9ugr.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 02/13] ASoC: fsl: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
References: <87r0979uhx.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 25 Sep 2024 23:36:36 +0000
X-ClientProxiedBy: TYCP301CA0011.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:386::14) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB10634:EE_
X-MS-Office365-Filtering-Correlation-Id: 608c68e0-568f-46bf-a672-08dcddbae5b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IlCar6BR8IicynzAyieu3Kc6I9RZTdKvmqaUIPAMDP66Kk94aNmUYLFnr5j2?=
 =?us-ascii?Q?QB+PxV1VG/LS1cTwR81zTKKLVgXmit+7lYVLmZdCJzs9gzKatMz0rWs71xT8?=
 =?us-ascii?Q?9s53yUFE0vtndPbuFJxP2WYaby67cmS/5rHXwFvKHThUNNcJcc9Eirfdxdg1?=
 =?us-ascii?Q?ywe83/6M8TESdesG8zw3BSkf6dDMEd7t1se+ESxmQHbTKKnLJb2NRjJtB2bK?=
 =?us-ascii?Q?pbi3SqVx7ZihyrQHHTeubycxAen7VRoqTO4ovDoENqqaU/55uC9+39LnfHKY?=
 =?us-ascii?Q?FwKbpiOKVyRHE2SHBn+jxnG9azWVFceSJbdC2PoS1Lsi/Z27gwh9qTNZeVm2?=
 =?us-ascii?Q?r65k5ym0JffaqfymOlQXgjVQEFUHcqxIqSfZfyMOn8dX6HJbamWEkWZqQC63?=
 =?us-ascii?Q?SMdQYaSGH/oOh/8N6wnfBc1xAPYped7JPhtQ1QtB6YNq25VLrLW3TBPceA24?=
 =?us-ascii?Q?2BxNuKrMyKM8Y1QGkbDeKSjl607IVSUYtQH4s5lNq0P30a6ebZO18g8TeMuc?=
 =?us-ascii?Q?VldnTUAXXoCVQ/pTkTUBXJay8i9mNOUhV2+hWhbZ7wEzff/IZLH7/HvUSrnv?=
 =?us-ascii?Q?Cfo31PDh8iLfg3bgzh0ff8tVMwuTj6M1qC+JgPQT34UbpYsWPmdjA5e/FZu2?=
 =?us-ascii?Q?ifTvnhPbPpAtt9jVAa6E+44lYXuZSkuDDyIFkoZVdSvL5CDidGfBoKfeHQIy?=
 =?us-ascii?Q?WQntf8Wx0ltvCEXQ323caPkFj4AlYZm5JvW4LDHHkxoSP5GYBY6GPCfimq3v?=
 =?us-ascii?Q?OKGm6zsmA6O+qVKiTFKQWYBhwjzGo8IsNwdDeyU2jN4AkpXeLRlE7swuTS2x?=
 =?us-ascii?Q?1opS4qiTtlsAEF0P+VZwqCI5Fmq538YDIRqJsfDbZ0gbfT/Ud0aKooUa22r8?=
 =?us-ascii?Q?EY1MwvEsXIqlEx5y3MlVAEhM6ADuw0TR2jaKZfDfq0u3X63TVjxo04tLkneJ?=
 =?us-ascii?Q?eiX+XOx3I9DVGF69hjyjUPdu+kW0ITP2digSEtIK326UqmWZXHh7xnx36ILG?=
 =?us-ascii?Q?VyoRzy+VbErFCHVcwx4OQd8v91sejQro/4FNWZeMd82P3QlmkShhDu/OmWDM?=
 =?us-ascii?Q?On/V40SBYUDyWcRwERAlsEwtA7gYjPzgS9IxiP0SvbYe/dFjUNW5gCAQep2e?=
 =?us-ascii?Q?QUhgxit+EhLEbtM8KfnfioNvo7XMAUb8xKpEP/wEoyl7piDpihehGZJTvl0p?=
 =?us-ascii?Q?5adoPNLKuWcFDxwiqtXDRaKhF8pXrZd5UcIMiTNxj80HG0u2UdE7kcSmqDwd?=
 =?us-ascii?Q?tLhLaez1LfZB4ciQQ/+WTvHlX37miH4gOOArh/ObJ/Kn7XSrasbawxPAubXt?=
 =?us-ascii?Q?Jpo7gd2RWfAC0SBnCXaRJguzkadIF6m5A56sV1hS58PSuA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eA6E9Xc0TzBPza9BBy6kv7YvfB4m8rqA4BfwpubEphXkMw9dgW1TwwASotdu?=
 =?us-ascii?Q?WfoPJUONggxQ+ix4z2wIxfR4Tco5sawGQ8pTV+xiAqOWmdspnzKiiW9k7nuA?=
 =?us-ascii?Q?ViVpfQa6FX5QkEmkNtDpwyOsp6Qv/UFOr+/a+0lCqBdSM+i4G+en9poembrt?=
 =?us-ascii?Q?liHbMCTrUOwO2JTV/4Sr/dxt4Uaq5s8U7MnMdlPNGcQhf7NXbKGg52M7PaUP?=
 =?us-ascii?Q?6yPR+rCMaGLfk0JF46SqWs3S6UjbTxP4dVARWIfaaaDfxBLyP7WIK43TKRxe?=
 =?us-ascii?Q?aNSRVJTVqE/+ZiIyhF90ft5mUEWZ3LImrDxf2ZxJKV8qtJWopIYUBHSLuomE?=
 =?us-ascii?Q?NlnL3i6dus/9BvOxaWtHvlvFmjISooZzzO2v4KxcwOUNewH7HwVzI3ENiis+?=
 =?us-ascii?Q?iD8USj/0KOtqiKnexpLBERWC7ypcElQlCkU4517/lYDQYCeCWvFPddFK6hh6?=
 =?us-ascii?Q?SQN0IaQULZ0j5oBvrJXuCYbxjWdGHS7wG4v0aXbiUKPWE4/uOf7wcFB33NKg?=
 =?us-ascii?Q?w3/Vk0x5DPC4uvWakJWPe96fMa8SX2pc3PvgHOpJtgOy9LxT0HaqEfFmxO+N?=
 =?us-ascii?Q?QtIp2rH9oQH+3bcpPQpl3WanGBYheKOsUgcshN++JYH56uLIPMhymCJyP0u8?=
 =?us-ascii?Q?7Dt9AEMgFIvjzCvmkntdvEV3MnFMgfOQGHnG1SrmxFu2qMwG14qGAEFg6xRh?=
 =?us-ascii?Q?j+E/Um4ElknViACA3ItkA4Ei2zNe2H7N+Hf4kcFXNPAaMip2wy2CUbCm+J5s?=
 =?us-ascii?Q?6mq+3IrHETAvwSMbXGsOUlyyr81yvl6oBcp34C1xBVcgbmMwiQ/Gi0RL3Vuy?=
 =?us-ascii?Q?FAkzGofT620BdXb+gfI+ZgWKlG3F8qvo2Wei52BiP4OiomhkgoA7JsXNfi5g?=
 =?us-ascii?Q?iRix8JwF5rcUgFzxlaNxb2R9brgFARhhxqqb3GGKF3vkv05GfUsGstVp4S8U?=
 =?us-ascii?Q?4EDffV4PVVuU7krCB81fBwtxMnEqHK/xyq98IZvyZ0JddNist0GUjdkYBmtD?=
 =?us-ascii?Q?qWq83HWxLC/3prWWiyc7V4E4pQAn5oJRmURw81V4r1fh542llzJvZR6XiUxp?=
 =?us-ascii?Q?ICNx8sRS5NOxZtibtwYvrzXgUcdjwiQpm5Yhwgs+LNklI1VpxjEJj/Zm1x2u?=
 =?us-ascii?Q?KxcrFssNDF7yeXEXq1aVyAYK0B/WSBwe+U4xgWPZFcBiHqkFRBsz7asXRcPC?=
 =?us-ascii?Q?xpjfvpylrTYKHNJe7EJpxOl+KHjNYhMIIgV5iIY5WftHmkjvIgAUhqmZ4dIH?=
 =?us-ascii?Q?asinLTzfF77IXXQ1pX3FpGdTNJxmWSSMk6gQIxFEeoC3zgOJLIFCoYga/n/M?=
 =?us-ascii?Q?u+Pl6ZHo5dQ9DChaWvCANQBjgposLJpOVm+9inoZDAFk6lcAG5Qk4t2iXKd9?=
 =?us-ascii?Q?jZly8rhdcR2up5w27Ur+xTTWvjuuZJLtp8OFkWQs5pBoDpFoVzPz/PXYDWTF?=
 =?us-ascii?Q?bQE+awTYkY2muvFja6qaGAYH+zJnzQjmQND3lZHMrp0tLlJ56Vq3L+VSb1RJ?=
 =?us-ascii?Q?LbqvnykQJPHaoH4oVGUf9htKRw8V0B5GIbyxSIYp+h0sjnr22xo4rFX7EJDI?=
 =?us-ascii?Q?xMjXBCStsC2PL5hUalw59Z1TJp80xUwEBqBDfYSo6gAglokTVX/B/kmqL8/b?=
 =?us-ascii?Q?FfsDehadF1HHNqFNJ2EDdAo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 608c68e0-568f-46bf-a672-08dcddbae5b9
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2024 23:36:37.0417
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 XYFLAWMYcKcsTPA+i7cTSKDtf7x/DOGI7ixiN9SyGErG297Qv5XQJd1mgw9mryi7MYjhvTmewbYrBBIDNK7qQRypDEt7mP2EtsssnrTatyUbznaauodk38+qugCDdthe
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10634
Message-ID-Hash: SIFXMSJQDJATPZ7B5GCS3E67KIWEJZXB
X-Message-ID-Hash: SIFXMSJQDJATPZ7B5GCS3E67KIWEJZXB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SIFXMSJQDJATPZ7B5GCS3E67KIWEJZXB/>
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
 sound/soc/fsl/fsl-asoc-card.c | 24 ++++++++++--------------
 sound/soc/fsl/imx-audmix.c    | 18 ++++++++----------
 sound/soc/fsl/imx-card.c      |  4 ++--
 3 files changed, 20 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index f6c3aeff0d8ea..82ca137621cbb 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -317,8 +317,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 	{
 		.name = "HiFi-ASRC-FE",
 		.stream_name = "HiFi-ASRC-FE",
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.dynamic = 1,
 	},
 	{
@@ -326,8 +324,6 @@ static const struct snd_soc_dai_link fsl_asoc_card_dai[] = {
 		.stream_name = "HiFi-ASRC-BE",
 		.be_hw_params_fixup = be_hw_params_fixup,
 		.ops = &fsl_asoc_card_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 		.no_pcm = 1,
 	},
 };
@@ -504,13 +500,13 @@ static int fsl_asoc_card_spdif_init(struct device_node *codec_np[],
 	}
 
 	if (priv->dai_link[0].playback_only) {
-		priv->dai_link[1].dpcm_capture = false;
-		priv->dai_link[2].dpcm_capture = false;
+		priv->dai_link[1].playback_only = true;
+		priv->dai_link[2].playback_only = true;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (priv->dai_link[0].capture_only) {
-		priv->dai_link[1].dpcm_playback = false;
-		priv->dai_link[2].dpcm_playback = false;
+		priv->dai_link[1].capture_only = true;
+		priv->dai_link[2].capture_only = true;
 		priv->card.dapm_routes = audio_map_rx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_rx);
 	}
@@ -764,8 +760,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-tlv320aic31xx")) {
 		codec_dai_name[0] = "tlv320dac31xx-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBS_CFS;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.sysclk_dir[TX] = SND_SOC_CLOCK_OUT;
 		priv->cpu_priv.sysclk_dir[RX] = SND_SOC_CLOCK_OUT;
 		priv->card.dapm_routes = audio_map_tx;
@@ -791,15 +787,15 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
 		priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
 				SND_SOC_DAIFMT_CBC_CFC |
 				SND_SOC_DAIFMT_NB_NF;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
 	} else if (of_device_is_compatible(np, "fsl,imx-audio-wm8524")) {
 		codec_dai_name[0] = "wm8524-hifi";
 		priv->dai_fmt |= SND_SOC_DAIFMT_CBC_CFC;
-		priv->dai_link[1].dpcm_capture = 0;
-		priv->dai_link[2].dpcm_capture = 0;
+		priv->dai_link[1].playback_only = 1;
+		priv->dai_link[2].playback_only = 1;
 		priv->cpu_priv.slot_width = 32;
 		priv->card.dapm_routes = audio_map_tx;
 		priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_tx);
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 6fbcf33fd0dea..dcf770b55c4bd 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -264,11 +264,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].cpus->dai_name = name[1][i];
 
 		priv->dai[i].dynamic = 1;
-		priv->dai[i].dpcm_playback = 1;
-		if (i == num_dai - 1) {
-			priv->dai[i].dpcm_capture = 1;
-			priv->dai[i].dpcm_playback = 0;
-		}
+		if (i == num_dai - 1)
+			priv->dai[i].capture_only  = 1;
+		else
+			priv->dai[i].playback_only = 1;
 		priv->dai[i].ignore_pmdown_time = 1;
 		priv->dai[i].ops = &imx_audmix_fe_ops;
 
@@ -285,11 +284,10 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
 		priv->dai[num_dai + i].no_pcm = 1;
-		priv->dai[num_dai + i].dpcm_playback = 1;
-		if (i == num_dai - 1) {
-			priv->dai[num_dai + i].dpcm_capture  = 1;
-			priv->dai[num_dai + i].dpcm_playback  = 0;
-		}
+		if (i == num_dai - 1)
+			priv->dai[num_dai + i].capture_only  = 1;
+		else
+			priv->dai[num_dai + i].playback_only = 1;
 		priv->dai[num_dai + i].ignore_pmdown_time = 1;
 		priv->dai[num_dai + i].ops = &imx_audmix_be_ops;
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 98b37dd2b9013..c4647ba912a63 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -814,8 +814,8 @@ static int imx_card_probe(struct platform_device *pdev)
 		}
 		for_each_card_prelinks(&data->card, i, link) {
 			if (link->dynamic == 1 && link_be) {
-				link->dpcm_playback = link_be->dpcm_playback;
-				link->dpcm_capture = link_be->dpcm_capture;
+				link->playback_only = link_be->playback_only;
+				link->capture_only  = link_be->capture_only;
 			}
 		}
 	}
-- 
2.43.0

