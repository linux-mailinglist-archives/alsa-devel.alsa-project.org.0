Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F352B96C182
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Sep 2024 16:58:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 688E3AE8;
	Wed,  4 Sep 2024 16:58:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 688E3AE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1725461920;
	bh=+Tb9hyFYCjfalY7tN7H9XJQwyrcIJ7KsCOqoZFz3CFk=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=l5ul2Q2rBaWM/puQ+cQEih+ez4Kh6CqLpDpdERY1EaJTJK7ZZQcQ1nGOe2xdOlu4l
	 TtpImORwrgNe+k6qon1rRN9goW/ILSulcME3juc4JG9WM9H1ILZo/r+PIsWmuSxXBd
	 aEC7UvZfvvt6uZjy8k1qNbWtcmehC/Y582Zaax0U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E8B6F805BD; Wed,  4 Sep 2024 16:57:51 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 561C6F805D4;
	Wed,  4 Sep 2024 16:57:51 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 50B9CF80518; Fri, 30 Aug 2024 12:21:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20608.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2011::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1685BF80107
	for <alsa-devel@alsa-project.org>; Fri, 30 Aug 2024 12:20:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1685BF80107
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256
 header.s=selector2 header.b=oZ8W5Mri
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DSh8cg/hqQvRImHUknmFpR9bo8fHo4q9aW1rgC5gdl9mSmnKuBi/5Qzy/2xlp61xQnpfKKZ37EFpWZ66R47ELGd38q0QdmyySis1de97ED4RioL885HEoif0G81wC0iQV2Z3zpTEr7mo0uyj4bvDPnTQBiySQ3Nt6aiR2sMe5fZnxuIOl235+yCRm2e6nwC2SjNMIGZH0M4YdSoN9TvdQX8/44/FjhbNUwf+2Nu4o5bvyAgJS3eClMOQR0RE8sZ+8aBXNW7KTLsbOEHV+K3LYBKj49MjtBhb5aGPVEC2GHJKm6dXfMTxmGYG1PUwvfeGeU9kIU/oZFuB8HLwr+Kbgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=10hKJMizoceae8yqobwsAlwB1qikcpJPLHVXv8OKcOU=;
 b=R4XHU8lPzlY97W7yVJlTRBDEpFwh+q8kXHn71FXl2vjb0Lu337+uviJbwd0W9qMtJ383RXYZ0RQVQocnrv/iL6Ee4H7TgHaPESY5jLaPGjpiIiU/IVkA1id9b68H3kBNU1FC1ca0t/FKToESC3ZHl+TkwZh3JjxY/ZZFaF3QionOTFCIKSZTnIAPJ7NieheOHpTzCxdxpGPN2prM4quKB7G9SK1csU49f8jmiBCl4ac3qfCrLmLkZuwS6IGZEeLxaqV1J1ytAhcOF1ZFg3YpgVQGRshij75jS2ySAjd8bs92V8DQEHQ+EuZZsvqaXVnO/QtatNh18cqu6/guLd8UuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=10hKJMizoceae8yqobwsAlwB1qikcpJPLHVXv8OKcOU=;
 b=oZ8W5MriXjq6wEHpAaUrrgnKw6rCNxD213/cZWcEgoTPEhKu6auj/DwKXx3MTgSrzkQCDQIyXwzV0yuIpY6BAvrvUEK5rLJQ4UAYMnGl7exm0Q2FLVXTp/f0Qxvp2og+KHwReuN0k2IfLP0/aTXapF4srAkEIt1hWawSKOIergT/AVl+wlJBaOKzPJxvZxusUyAMmNEVdnFUtjzseU3HBeHezU/suJBFORYNzvoo3RmRJjpjjrEqRaZ45XR9272XIPr4FFfKSW91K6XdWyPnX1qVYWVvq4hBOZzCNHg/2uuN3paCrWd0EPQ4R+ckew0I+EgWC/+8Plskl5t07wRwyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
 by SEYPR06MB6062.apcprd06.prod.outlook.com (2603:1096:101:d4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Fri, 30 Aug
 2024 10:20:35 +0000
Received: from SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce]) by SEZPR06MB5899.apcprd06.prod.outlook.com
 ([fe80::8bfc:f1ee:8923:77ce%3]) with mapi id 15.20.7897.027; Fri, 30 Aug 2024
 10:20:35 +0000
From: Shen Lichuan <shenlichuan@vivo.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: festevam@gmail.com,
	nicoleotsuka@gmail.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	opensource.kernel@vivo.com,
	Shen Lichuan <shenlichuan@vivo.com>
Subject: [PATCH v1] ASoC: fsl_ssi: Simplify with dev_err_probe()
Date: Fri, 30 Aug 2024 18:20:19 +0800
Message-Id: <20240830102019.33086-1-shenlichuan@vivo.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: SGBP274CA0016.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::28)
 To SEZPR06MB5899.apcprd06.prod.outlook.com (2603:1096:101:e3::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5899:EE_|SEYPR06MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: a0b024f9-1d61-4833-1702-08dcc8dd62ac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?oDUvfrjZ043YmyV9PxxejMDRnF9IBWW0WuNrGDtA28yMl5KcGfVaCe3zZ52q?=
 =?us-ascii?Q?Sx9XEQ3OelSw1RQkxo4X/1GRENJLBik2Gqm1iRV7xyZzFjjuIqaaCCKS8xxZ?=
 =?us-ascii?Q?eUdH4DATWJI9WkPg2jExfmkkzTXp7v+k/OhB0e9l4rft5qWmTwCh901VaE+S?=
 =?us-ascii?Q?5M4kVCIL7wNlFuPZDlcHvcpaaPNq6ixTQiKjcg/pOMsnIbSwwiiIbDRF2/47?=
 =?us-ascii?Q?g4vDNbbDHrMHUOZHU1Pj55lvz/f88l9aZmRDJUe/mMU+1aNXgaXJ6yZY8VTh?=
 =?us-ascii?Q?VbTPNNTWofqqwNzs/HnwN+eEcSOJbOTsV3IdXeZpc8GmZqcZIfjZ4HRxf1yn?=
 =?us-ascii?Q?nNgyBJLcKskyypSGiPbXVARL0KuRXnpPd+dz27sEeyuGg7mkl1hmzV/HTJG8?=
 =?us-ascii?Q?P/ndJHdcqsYqyUZi6lsJxJQCwmHXzcRbHffJtPkHQ2b2v/WYUnL9hRxcnoUO?=
 =?us-ascii?Q?NtFIk34HhWSjRPEY6+O+W/M/vlNGzKrf/8gQCgBuN3LSczMEeRi8T42+VLnu?=
 =?us-ascii?Q?8u4z+7qicCGzUP4Fh3mLaQJOFgfsqtXW6ad1Z5GmlTNlBd91qnxKpJGyDMS1?=
 =?us-ascii?Q?eWKwr9p1IUvAowV7/fXtnJOW4BaqrEWF1Ll1/uS5n9dT0Lm0AqZ2VUEcWzE3?=
 =?us-ascii?Q?rqu5ZK2FwGexcUdDiZ4j+riSq/WMRxGqyB7QZck0XisusgZM9Fo2HypjYg3D?=
 =?us-ascii?Q?AmiUGHtENROMGgxriq5SjW8hk8btYjd2oVKT7D9hdxpLxXI8BCax4c3N3cYi?=
 =?us-ascii?Q?7iOEgxBUQY2UApNkI4qz3ebOA02MyIEFnElGlDnjIChsgWkYGQ7R5vBLCN0t?=
 =?us-ascii?Q?Qw7Kc3NihU1A3VMXp1Qkx9/Ku8s47AKA1U8LEqsysswtaxDyWI3KZUbJrvnL?=
 =?us-ascii?Q?+mpI38EGeXuScRaWRMyBDTxLFVgewPNt6xnvPOg1eKfUVEMBosT/WJazPSM4?=
 =?us-ascii?Q?taeKuzhoy5drJkyHbiGeiM79xDLuUdyjjSV0np3NCNrACjqx0UoNzFn+x+xG?=
 =?us-ascii?Q?bgeHhmQn81rCJ6nQB+vP3LqaeG7Ymtu1gR/JPRCtxhFzdCis78zvcUx24NiN?=
 =?us-ascii?Q?FM5Pten7N9ua6StAqCAvBF53J5geErLOIPz8Uxp6YxdqqBMCe0UoBf7wvIC4?=
 =?us-ascii?Q?e8Nmkt6PVV8QEKIwNlXZxDeS0c7k3Dr64YZ7aIFWhzPuS7lh2VRPXm+SQuVe?=
 =?us-ascii?Q?SGipHPGOqRZCfATfmijKy/CV9MuFAbxMgQJ2S/mKOYQUO23c7ypkpNi4rKaY?=
 =?us-ascii?Q?nC+BGzmjcJAOIXjSsOdVNsoXmfyL4c8KFVmY506bC7qXAszDUXTaFO7EUJHS?=
 =?us-ascii?Q?wUtdJ6HLvRXmq8xCA2lHdueT8pTmOwcMBpjQPGBINymcl8SEOp4DI3i0kt3w?=
 =?us-ascii?Q?OYkNIQqr7gvsndfSSF+y9S5et8XoLILvgQ/0XdHwA0khvGp5Uw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5899.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?O5+T5SnXOCh9imZzzmv9//K+UNSRt8rDakjcPbWu1p1nDec9N846E+60EjSE?=
 =?us-ascii?Q?Z9cxuCBo2G7BrQzVhEfa2HuTAsKIxMYmi/D0TtTi4+xbzK1PLJxPiX80q5Sf?=
 =?us-ascii?Q?u7jzMLN04qHEtpmhhxXVHAcvEdn2uP8mQnKiBMwy91DyTZnLjup+0VXcjUlw?=
 =?us-ascii?Q?5JNftVtHjriWEGacVSqFqanVxzZTLU/IjdDaZXRCL836NN3IKUNmcek0kIMn?=
 =?us-ascii?Q?+2ESM2u0zhjx4f+Gvi8vJUQ9sYQOQmIrgjnH5izyqDqQg2l04sC1RGx4yypm?=
 =?us-ascii?Q?RYFugvekmkL49u2LGHE+KA3bEZKHLWAEb89o2AbLV0kNmzN8Ghi4ZCUC6jrv?=
 =?us-ascii?Q?CUKMMlYzO3CQcAjfRFO4gaEklqJLYCNsteei+j80ah+Vatb18MtG+TBrpdTW?=
 =?us-ascii?Q?F7docdR7yE4ghlkiJzAWmPOr41bDpnhrh28eY/7CMA5rkvJ7G+xEdPbUG5TX?=
 =?us-ascii?Q?o7aPPYMvYnPiC26/TKYKKSSqydBvrW/QruaZEPyXzpdqcb4FHFUznOJpvdLn?=
 =?us-ascii?Q?VTe2fj6Kf/g4nNjtN2hj0Ur6a0FEl6x9w+ea4TjlnGc97ZANRfpI8nJlXEdr?=
 =?us-ascii?Q?vPHdYgLyqTwEbQ0jwR0fwBLvypZYPNmo4qhryDibuIMex6XaHf4GS9dRQxQt?=
 =?us-ascii?Q?O9NB7E0sZr+b6aFRuqYYZNDSzr3k4Vn3uq3a9rVIcsQ+WEYbEGMfh7MP4OcB?=
 =?us-ascii?Q?zL9kDF5D3iMJ+I4dQGpNrb1hHRt/oQwqOgwO3lxX59bfOOijdXEvVYmMgUVY?=
 =?us-ascii?Q?HGjBImvkDVabSnajGGsNwYJIQbIdtymkYododIfM+yHLtjPXxvEUQZELcwoc?=
 =?us-ascii?Q?BQ7xl5U0x4MQX06nMhR8TxyAkBi+VfkY75NgvQDtSzgMjXCCjS7Y1VHZZkxJ?=
 =?us-ascii?Q?eLQUlVwZ8VYA/EMGLEwZXt8Uf0ySIoiLiZRlpE7b9tj8c2xJLJAHvrgK9JK0?=
 =?us-ascii?Q?o1SBWV49BH69in9TkhgHEMtcBrMSl0TbOmop6sZI5avVWf6Ihg0MmD9hQIG/?=
 =?us-ascii?Q?s0wctLy6tW4hytjZ+7+TqJm9Zlkbcaa3urYD55MpWh0RnIkfFIoDs4gMp73+?=
 =?us-ascii?Q?jPyqo5vpMDbzXoSxoq01ARf9+wLN3HrgP79eIBmij2S5m4+3TZ0a5RXWuJpN?=
 =?us-ascii?Q?3p2BjFUaSgpjbNGPJuGRxDbPfuDAoTxLdB2UiAM3Sv6An1Qkq3uh3e4SE490?=
 =?us-ascii?Q?ShUTAFIFq/3/m9xjboNM2gX4urB3QBInYvR4Z2BiRTshwcxOAPMbdDJoGI/z?=
 =?us-ascii?Q?jmKN983Yiy+2rCaML+OLGw03DUFiCxILvLB9fQHFTyPu48WsVTfvcEzJkZa/?=
 =?us-ascii?Q?HJ1wcNw0vpRJsq9iU/m0rWcDqHVdKravUuDmOGqc/dplCmEgngH/Odlowp2P?=
 =?us-ascii?Q?a2HX/lVluexN/ERzvRtCwbweTdPm1smabsx3JnvhFQ6++G843SeCdAvmAmhN?=
 =?us-ascii?Q?XRP/Ssq51lIH38cfl2Q0DIxxjcSSFgXBRjTM2bBhKL0YisbE5a276CFJggob?=
 =?us-ascii?Q?uKxmeAXvnQOgpk0VW89vIDftl9kCWZvmjpGc0QApU/MK59gWzDLdlzkU0QCP?=
 =?us-ascii?Q?gmIXpT/JUg4nF4yk65c34NbwMTHV1GQ4lB3LydiO?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a0b024f9-1d61-4833-1702-08dcc8dd62ac
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5899.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2024 10:20:35.1020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 AS8SGfUbv0Pknh6OCTSs4MFjA1eMMf3aPJJAROiZt2wKuWSCpEH/4jQR2ad2C99UxGe9Hx26YNOBtZZgLs/81w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6062
X-MailFrom: shenlichuan@vivo.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: GZFWFKH47UTYRGP5YYEEQVUOBBKFVGKR
X-Message-ID-Hash: GZFWFKH47UTYRGP5YYEEQVUOBBKFVGKR
X-Mailman-Approved-At: Wed, 04 Sep 2024 14:57:46 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GZFWFKH47UTYRGP5YYEEQVUOBBKFVGKR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use dev_err_probe() to simplify the error path and unify a message
template.

Using this helper is totally fine even if err is known to never
be -EPROBE_DEFER.

The benefit compared to a normal dev_err() is the standardized format
of the error code, it being emitted symbolically and the fact that
the error code is returned which allows more compact error paths.

Signed-off-by: Shen Lichuan <shenlichuan@vivo.com>
---
 sound/soc/fsl/fsl_ssi.c | 33 +++++++++++++++------------------
 1 file changed, 15 insertions(+), 18 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index c4c1d9c44056..51927f89241f 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1354,19 +1354,16 @@ static int fsl_ssi_imx_probe(struct platform_device *pdev,
 		ssi->clk = devm_clk_get(dev, "ipg");
 	else
 		ssi->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(ssi->clk)) {
-		ret = PTR_ERR(ssi->clk);
-		dev_err(dev, "failed to get clock: %d\n", ret);
-		return ret;
-	}
+	if (IS_ERR(ssi->clk))
+		return dev_err_probe(dev, PTR_ERR(ssi->clk),
+				     "failed to get clock\n");
 
 	/* Enable the clock since regmap will not handle it in this case */
 	if (!ssi->has_ipg_clk_name) {
 		ret = clk_prepare_enable(ssi->clk);
-		if (ret) {
-			dev_err(dev, "clk_prepare_enable failed: %d\n", ret);
-			return ret;
-		}
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "clk_prepare_enable failed\n");
 	}
 
 	/* Do not error out for consumer cases that live without a baud clock */
@@ -1552,10 +1549,9 @@ static int fsl_ssi_probe(struct platform_device *pdev)
 						      &regconfig);
 	else
 		ssi->regs = devm_regmap_init_mmio(dev, iomem, &regconfig);
-	if (IS_ERR(ssi->regs)) {
-		dev_err(dev, "failed to init register map\n");
-		return PTR_ERR(ssi->regs);
-	}
+	if (IS_ERR(ssi->regs))
+		return dev_err_probe(dev, PTR_ERR(ssi->regs),
+				     "failed to init register map\n");
 
 	ssi->irq = platform_get_irq(pdev, 0);
 	if (ssi->irq < 0)
@@ -1607,7 +1603,7 @@ static int fsl_ssi_probe(struct platform_device *pdev)
 		mutex_init(&ssi->ac97_reg_lock);
 		ret = snd_soc_set_ac97_ops_of_reset(&fsl_ssi_ac97_ops, pdev);
 		if (ret) {
-			dev_err(dev, "failed to set AC'97 ops\n");
+			dev_err_probe(dev, ret, "failed to set AC'97 ops\n");
 			goto error_ac97_ops;
 		}
 	}
@@ -1615,7 +1611,7 @@ static int fsl_ssi_probe(struct platform_device *pdev)
 	ret = devm_snd_soc_register_component(dev, &fsl_ssi_component,
 					      &ssi->cpu_dai_drv, 1);
 	if (ret) {
-		dev_err(dev, "failed to register DAI: %d\n", ret);
+		dev_err_probe(dev, ret, "failed to register DAI\n");
 		goto error_asoc_register;
 	}
 
@@ -1623,7 +1619,8 @@ static int fsl_ssi_probe(struct platform_device *pdev)
 		ret = devm_request_irq(dev, ssi->irq, fsl_ssi_isr, 0,
 				       dev_name(dev), ssi);
 		if (ret < 0) {
-			dev_err(dev, "failed to claim irq %u\n", ssi->irq);
+			dev_err_probe(dev, ret, "failed to claim irq %u\n",
+				      ssi->irq);
 			goto error_asoc_register;
 		}
 	}
@@ -1649,8 +1646,8 @@ static int fsl_ssi_probe(struct platform_device *pdev)
 				ssi->card_name, ssi->card_idx, NULL, 0);
 		if (IS_ERR(ssi->card_pdev)) {
 			ret = PTR_ERR(ssi->card_pdev);
-			dev_err(dev, "failed to register %s: %d\n",
-				ssi->card_name, ret);
+			dev_err_probe(dev, ret, "failed to register %s\n",
+				      ssi->card_name);
 			goto error_sound_card;
 		}
 	}
-- 
2.17.1

