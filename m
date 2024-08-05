Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C88E94729A
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:51:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D7C44FEA;
	Mon,  5 Aug 2024 02:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D7C44FEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819013;
	bh=yby+K8sbLa1AzCJRJC/iAu2eKcIg1c7Eq/aZvkozcT4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=CnDQJ7RjhF11HQQMqJSwuwEFocUJua+IOZFIezbaqee1Pc2NntmgGZ3pa3QBHB3hv
	 ZnPQAUaZmc93iCfi5w8zdx+qJhJbzRNpKEe8H2u2EqvCkJGA8eFQrlbMG+7gDcpTnO
	 fVN4CXlihaAx0u6urljKgVgA2CXaiNJsk6tHs1JI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 981BAF80687; Mon,  5 Aug 2024 02:39:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9706DF8060F;
	Mon,  5 Aug 2024 02:39:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 15EF6F806A1; Mon,  5 Aug 2024 02:38:54 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 504ABF80602
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:38:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 504ABF80602
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YEukzmwr
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO9uVY8c414K3GHr0Ek8B5dRLOaSwFHKt9bMmh331Mq6sIvBTT3g+GMX/E+GmGG2YSBkdiIliVtxBCc25go0y/xl+c3yrYR5fb1uqlIbB3EOw5eGRPJh2Q5yeFHBlaZHnoJyfskrHFSwTGaI+Jkat8nY6RPFdjoveAbmiSlAxAH2Hcs6bOwKROlk8NMkBkupIGrci3E28bKilCRcwOAyY6PQhH4iP9L5815c2mf0Wcd2loENwh+p3h4nka1QwCuPl6Ce1THjCOj/XIigQTYBfl269Y2Y3cyA6SblcmP3/4c9FJ3qzqvSJajB9/eHiOz3RlPSFBZXaYYQNmX38lE9dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ch1ishbVL9mT6gtObRicFJ4osR/ashHveJ4Eei6CYvE=;
 b=FCdp0UjQcHMAff3KceDep+xRLaG+QlwdEfFcUw5zs2Nzj2SRtyHWTIj2dyJVZeaFHEAUPePWEnvPa9H6qj02+YHPVUjxYbc+2cz0TQAjaQHNealvQiBdHfsyHlpW/nmHwtem54+X0uiD8ebQZKh6S86Z+TQeNdnOWb6IscJY+E9tVd7ho13geksbtURU5J8/kZXIzWDl+jqMq7sn2hvAfrErvL4PufaWwsjdKYdOrjE0skbtKSfWw23PC86/BuaV/jpCDweKFOOmw2t1GKXdh/GULyNITJQ6/N3ZRaQJIjcb2bHR+VkpVhlvHoigolwP1IXPUwkUjdVIMNiFUlexwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ch1ishbVL9mT6gtObRicFJ4osR/ashHveJ4Eei6CYvE=;
 b=YEukzmwrgKNmy9Yo09ydTSXtk7ftqLG1BEbdwWc+sCaX+gjIRKYA02MT5/DwWCDtedZMzMneihbXobSshb2CqbZy+7NJj5+g7mafzPNsxx6WAeKe3nBjOCi04gewCfEDNxbKaNORkRWfGqGMjR2tr2XrL489RQ+YywEJFdOk3RY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:38:41 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:38:41 +0000
Message-ID: <87ed73ztv3.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 043/113] ASoC: ti: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:38:41 +0000
X-ClientProxiedBy: TYCP286CA0340.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: da5c1b24-e2a1-4efc-7dea-08dcb4e6f426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IsyP9jq0snHLyq0fXEtAnzn9Ux6D0jGj5KX3qjtu0j7EKHKeYuW8yY65+O/e?=
 =?us-ascii?Q?1XeV0GVxhoe0uhEXp2bnSz+0+2yw/2kj4DqxVndDgBBnjiHXaUhq83pBcMlX?=
 =?us-ascii?Q?FREoh+lQJdvvRoRx69m8hBwSn3KQKGp6VI2w6ENIxTGRN5G4FgkT0WmWd54s?=
 =?us-ascii?Q?9lfncjs5qnS0Ow09+HV990B7k0BnjQAETq0H+dA+MM4/OVvfIZ3Z4RUGNYie?=
 =?us-ascii?Q?n//Q6DmhiUFgYxZnDZOkPGHk7hPK0sOH7VvVGLF4lL93tDbz4sovF34X495L?=
 =?us-ascii?Q?dx0FfJOTATEzHDKtzJH1x0UqkZMLFDOwwfrqnpCMOsaGfsbCw3IoIVtyKN2/?=
 =?us-ascii?Q?YxsC9MJIPEojqmMolYlwz+nNuv4v9kL0XrVt9N1mWsn5zre7QkSBE6G+XM7G?=
 =?us-ascii?Q?s6HAyfhLyFYlSQDfjrV1kAxqC2jHfQaoJPYIe0JPNSXtxj4eeFDsaFfAzjMJ?=
 =?us-ascii?Q?cC4NTLscFBQsK/wLJp2c/T0sB1a8rMnZX+ZFJqw1rONKIxyk1PVmMhKtVP6H?=
 =?us-ascii?Q?vqpXQQe1KlsdAVdo8deSn2E1ML5A4LOSS/vYOnKGmkGCzqUir4si2CPBYs/S?=
 =?us-ascii?Q?knKTEkfx6GbLYK7LTlStOkZXnf28NtxUnzCmVBpEX3Q5kkTI/kw6BMxqm2G6?=
 =?us-ascii?Q?PUmRok/pzjQ5YhYrQ7pxG6OB3Y7GgsL7c3Mu/6PanG+6/+6HOsWxHTDBW6yI?=
 =?us-ascii?Q?WLA+ri1ayyk/MuegAOGg7+H49zpmqcFXhl8vSKM+jnLDuoKx6lYpxX49UnXU?=
 =?us-ascii?Q?+fFy3eZOjzorxi8FsoBZDpzhVxJPF0HaDhg5Kp7lZU6qcLXG/FhpGXJl/tQi?=
 =?us-ascii?Q?2voq0l5cf1beU8I5pD67nfm3O427/rvqrHuJU0jffDA7WixpAPwW0xqE0Mx1?=
 =?us-ascii?Q?UwIxnUvijJUwj67hlHiA9ixDwEzRU/AR1oEtdYH9oCTgCiiXqV4qW5a7m6IN?=
 =?us-ascii?Q?23cQrOHi61DrCe/b+S8dBmaDRDPS0/LaPwOkQ+5HZ//tFp+Ub39tlwukr0Ux?=
 =?us-ascii?Q?YuanT23p8hqbCkWvPp0VVqZ5YgUBi7p9lxZzIVNPXY8tUNPutGyh3PLt3vVC?=
 =?us-ascii?Q?oSwCXgKTyD12yiuu8ZlUcNIvuGVWpkn5gbIoecGAATNPZxwUg4PCBFEBeveu?=
 =?us-ascii?Q?Tq+R+NozchJgcq1cbIJd3L2S66VNa+3g0/YA5/VLg7w63xnZyQuD/joUsupG?=
 =?us-ascii?Q?3VjSfL3e+6syVEEnCv6395xRIW0XC1Uksu3VDcoNtz2JiCLqBLsulgcCg99A?=
 =?us-ascii?Q?M4ssAnhSjv1lZGy12kuQAHeO0t5Oz/mQFs9/wvCYzC38HINV8LrRrRwIhA0B?=
 =?us-ascii?Q?93uMcrrikNLklwyWlEXDyFI5sV7dWc2W3cQOCFk2VoobAns9urjzrONuDi8m?=
 =?us-ascii?Q?6cpfZQctrbJ9eBwqlx6T4HEVqyGfxncj8ge6amnId3RG8q/+JQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9rRSb/MJgYKByXiGCoibq3Fn+xrF3JdBpHU3U3qoXMFTpnufHuMPRSI8xaYw?=
 =?us-ascii?Q?ZlpTJbpXish2015+aD7K6JqMlLCbxZZNAUjR7Nk1y9Uf31mxbSN7Y1SvEiSW?=
 =?us-ascii?Q?2+6zmtA/IL1poOQn5eyvL4G0rYyl1sKJIGYj57mpe4RFcFqm2SK9bCzV4Sj9?=
 =?us-ascii?Q?sSK2VBm6GF9MzBbK1IERFP6G+LwzgGuChlE/hy2NebhSBX7B2CN3biv3meiC?=
 =?us-ascii?Q?ohgcjyXap2twO8DH0Bai+OIgiJ+nJG9BHSTYV1DXGqpo1hT07TPMzzTN3tNg?=
 =?us-ascii?Q?OJzymGtxoMoeQ7WSKWqoFoKxmtDhDX+DFeIKusRUghYOtiXy/5FUqcNaeLqP?=
 =?us-ascii?Q?dRlLGjk6eJVIigKYAsFK7utTBAsILLbW+elZ4voDrhTawvc7dKQOVvtRsSvs?=
 =?us-ascii?Q?cvV+bnzOeC3CdMK8b/D1XwTgz6IfAR/zTQ4mrptAXLqjARG4VdkR4SLPNtJo?=
 =?us-ascii?Q?5/GhzLpPizAs4soR/7W/+lWIqs6i09J4GJCEFQ/UbqtoowDkFSnz04LxeBDQ?=
 =?us-ascii?Q?zKt/hpWpcnhFHtH7rYnbMh584xqJ0cW7IAYjPTFH78AH2sSjnLEuy5aU2EDb?=
 =?us-ascii?Q?wlRdJ1SdN3D5OKy0oFCiHEUZaOnv7klTRSZ81di+EKIcOm23rvYAetAZTah0?=
 =?us-ascii?Q?gXqqJ3QVMjHdA/jV75G5YveLOdygPOV82EMfKzLHS5plT19J3AJKnddw8MKu?=
 =?us-ascii?Q?AVEoPnn89ruIqxbE36Fzou94QBicLUD7tQnJnYeZ3gNOmyI6087x/L8TE96E?=
 =?us-ascii?Q?RIWQcdaJwTMjx0GAximIuXzIE8t86Tgzh/IblN2O3UCz2WNbK9V5CpUz9NCA?=
 =?us-ascii?Q?eh5AtEvpMreACq9c4oO2jbyL35BWW7QlmYIGjGa85oiOixEjZ6oUcj6Rk6fq?=
 =?us-ascii?Q?g7mzqrGK/5RkVDgKHh+Zz0RXH9j66jvC8d1T5y+OiLh64cjGo6JjKcDBXVfQ?=
 =?us-ascii?Q?IfcqFa6DY/29bl/64SR5Tz+P4kNEDCoN44edrn02zcvpm4e/2Modub+V/VNE?=
 =?us-ascii?Q?vyfJvAGpHZjzz98QCsy1yzZtAO1XKFNQx73pd4kAJDq++3Oxd/VQPYuHRSE3?=
 =?us-ascii?Q?kjyfC/drnjWPJTrq4LRUoLNzavJ3m3gBKghCw9PQcxgfkA1eHnHMx5UKJ8+L?=
 =?us-ascii?Q?ckNPGerxX8m0rWw9GkRETmAAle/0rwIJhOB/w10ZTJVPdBGvCkkgPhVfM7ki?=
 =?us-ascii?Q?ReSbixQZ4wxBec4paQ1fnbWPPlr6eMpPrGUGeZJVp04Tqv6lj0pQjrdVkvE1?=
 =?us-ascii?Q?MuidXsCBU2Q2zdCppOvqAVdwXeEntzM+6FqH20rDM9y1JpdCV7fZdZKDgeMf?=
 =?us-ascii?Q?MX5TaN5UCblAV703USNheRglwyXrB6y5S/su4YizYHmz1ISWfu0nIaZwpTWB?=
 =?us-ascii?Q?jfRT7RszwRFBJ7qE8ga0ErkgI0c25DhBQFhFQzoFlyGfmFJRJFGsOJlHIOgN?=
 =?us-ascii?Q?Ow705tH4j5uWfLMvdFVpMOUOwx66XIrOdGTj7WSi5K7+m7CtLa8NLBdkE+RF?=
 =?us-ascii?Q?T+I7PSrSEmHOWzr6i4GN44Ibl3pdj4NoEbZTngLrCs3NR0gRDORf6K4ibFqY?=
 =?us-ascii?Q?ctcW10t6P+lLeaSP7XZzTVPQnpMNnwrWRAqztZBPHQag8J80l0IkaPiYx5Wg?=
 =?us-ascii?Q?hxtNd3GeOlL8BfTFUJopetM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 da5c1b24-e2a1-4efc-7dea-08dcb4e6f426
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:38:41.2332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 roQeIffJd7pS7EjF6B9xxsC55QTogSxOcAaLmgnmdzUOQFBxwfJYJX5O5UA+D6FMqdJOHxnsnY1DvRwM7Ll1SbLjbMVPBCkl6J3XwJLtCZP3tEvNigxOh5K+JUR7e8ug
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: CYFCR6JIEJN2EE6QF3V4FX3DZNSZHLFM
X-Message-ID-Hash: CYFCR6JIEJN2EE6QF3V4FX3DZNSZHLFM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CYFCR6JIEJN2EE6QF3V4FX3DZNSZHLFM/>
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
 sound/soc/ti/davinci-i2s.c   | 12 ++++++------
 sound/soc/ti/davinci-mcasp.c | 18 +++++++++---------
 sound/soc/ti/omap-mcbsp.c    | 18 +++++++++---------
 sound/soc/ti/omap-mcpdm.c    | 10 +++++-----
 4 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 0f15a743c7982..f509aaafa411f 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -190,7 +190,7 @@ static void toggle_clock(struct davinci_mcbsp_dev *dev, int playback)
 static void davinci_mcbsp_start(struct davinci_mcbsp_dev *dev,
 		struct snd_pcm_substream *substream)
 {
-	int playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	int playback = snd_pcm_is_playback(substream);
 	u32 spcr;
 	u32 mask = playback ? DAVINCI_MCBSP_SPCR_XRST : DAVINCI_MCBSP_SPCR_RRST;
 
@@ -485,7 +485,7 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 	}
 
 	/* general line settings */
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		spcr |= DAVINCI_MCBSP_SPCR_RINTM(3);
 		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_SPCR_REG, spcr);
 	} else {
@@ -641,7 +641,7 @@ static int davinci_i2s_hw_params(struct snd_pcm_substream *substream,
 	xcr |= DAVINCI_MCBSP_XCR_XWDLEN1(mcbsp_word_length) |
 		DAVINCI_MCBSP_XCR_XWDLEN2(mcbsp_word_length);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_XCR_REG, xcr);
 	else
 		davinci_mcbsp_write_reg(dev, DAVINCI_MCBSP_RCR_REG, rcr);
@@ -656,7 +656,7 @@ static int davinci_i2s_prepare(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
-	int playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	int playback = snd_pcm_is_playback(substream);
 	u32 spcr;
 	u32 mask = playback ? DAVINCI_MCBSP_SPCR_XRST : DAVINCI_MCBSP_SPCR_RRST;
 
@@ -700,7 +700,7 @@ static int davinci_i2s_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
 	int ret = 0;
-	int playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	int playback = snd_pcm_is_playback(substream);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -723,7 +723,7 @@ static void davinci_i2s_shutdown(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
 	struct davinci_mcbsp_dev *dev = snd_soc_dai_get_drvdata(dai);
-	int playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	int playback = snd_pcm_is_playback(substream);
 	davinci_mcbsp_stop(dev, playback);
 }
 
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 2b1ed91a736c9..e7eabbd972e79 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -289,7 +289,7 @@ static void davinci_mcasp_start(struct davinci_mcasp *mcasp, int stream)
 {
 	mcasp->streams++;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		mcasp_start_tx(mcasp);
 	else
 		mcasp_start_rx(mcasp);
@@ -354,7 +354,7 @@ static void davinci_mcasp_stop(struct davinci_mcasp *mcasp, int stream)
 {
 	mcasp->streams--;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(stream))
 		mcasp_stop_tx(mcasp);
 	else
 		mcasp_stop_rx(mcasp);
@@ -873,7 +873,7 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 	if (mcasp->version < MCASP_VERSION_3)
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_PWREMUMGT_REG, MCASP_SOFT);
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		mcasp_set_reg(mcasp, DAVINCI_MCASP_TXSTAT_REG, 0xFFFFFFFF);
 		mcasp_clr_bits(mcasp, DAVINCI_MCASP_XEVTCTL_REG, TXDATADMADIS);
 		max_tx_serializers = max_active_serializers;
@@ -913,7 +913,7 @@ static int mcasp_common_hw_param(struct davinci_mcasp *mcasp, int stream,
 		}
 	}
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		active_serializers = tx_ser;
 		numevt = mcasp->txnumevt;
 		reg = mcasp->fifo_base + MCASP_WFIFOCTL_OFFSET;
@@ -1026,12 +1026,12 @@ static int mcasp_i2s_hw_param(struct davinci_mcasp *mcasp, int stream,
 	if (!mcasp->dat_port)
 		busel = TXSEL;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		mcasp_set_reg(mcasp, DAVINCI_MCASP_TXTDM_REG, mask);
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_TXFMT_REG, busel | TXORD);
 		mcasp_mod_bits(mcasp, DAVINCI_MCASP_TXFMCTL_REG,
 			       FSXMOD(total_slots), FSXMOD(0x1FF));
-	} else if (stream == SNDRV_PCM_STREAM_CAPTURE) {
+	} else if (snd_pcm_is_capture(stream)) {
 		mcasp_set_reg(mcasp, DAVINCI_MCASP_RXTDM_REG, mask);
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_RXFMT_REG, busel | RXORD);
 		mcasp_mod_bits(mcasp, DAVINCI_MCASP_RXFMCTL_REG,
@@ -1190,7 +1190,7 @@ static snd_pcm_sframes_t davinci_mcasp_delay(
 	struct davinci_mcasp *mcasp = snd_soc_dai_get_drvdata(cpu_dai);
 	u32 fifo_use;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		fifo_use = davinci_mcasp_tx_delay(mcasp);
 	else
 		fifo_use = davinci_mcasp_rx_delay(mcasp);
@@ -1509,7 +1509,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 	 * Limit the maximum allowed channels for the first stream:
 	 * number of serializers for the direction * tdm slots per serializer
 	 */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		dir = TX_MODE;
 	else
 		dir = RX_MODE;
@@ -1591,7 +1591,7 @@ static int davinci_mcasp_startup(struct snd_pcm_substream *substream,
 			return ret;
 	}
 
-	numevt = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) ?
+	numevt = snd_pcm_is_playback(substream) ?
 			 &mcasp->txnumevt :
 			 &mcasp->rxnumevt;
 	snd_pcm_hw_rule_add(substream->runtime, 0,
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 2110ffe5281ce..bb6a01b41ac86 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -217,7 +217,7 @@ static int omap_mcbsp_dma_reg_params(struct omap_mcbsp *mcbsp,
 {
 	int data_reg;
 
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		if (mcbsp->pdata->reg_size == 2)
 			data_reg = OMAP_MCBSP_REG_DXR1;
 		else
@@ -413,7 +413,7 @@ static void omap_mcbsp_free(struct omap_mcbsp *mcbsp)
  */
 static void omap_mcbsp_start(struct omap_mcbsp *mcbsp, int stream)
 {
-	int tx = (stream == SNDRV_PCM_STREAM_PLAYBACK);
+	int tx = snd_pcm_is_playback(stream);
 	int rx = !tx;
 	int enable_srg = 0;
 	u16 w;
@@ -472,7 +472,7 @@ static void omap_mcbsp_start(struct omap_mcbsp *mcbsp, int stream)
 
 static void omap_mcbsp_stop(struct omap_mcbsp *mcbsp, int stream)
 {
-	int tx = (stream == SNDRV_PCM_STREAM_PLAYBACK);
+	int tx = snd_pcm_is_playback(stream);
 	int rx = !tx;
 	int idle;
 	u16 w;
@@ -742,7 +742,7 @@ static void omap_mcbsp_set_threshold(struct snd_pcm_substream *substream,
 		words = 1;
 
 	/* Configure McBSP internal buffer usage */
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		omap_mcbsp_set_tx_threshold(mcbsp, words);
 	else
 		omap_mcbsp_set_rx_threshold(mcbsp, words);
@@ -797,7 +797,7 @@ static int omap_mcbsp_dai_startup(struct snd_pcm_substream *substream,
 		* smaller buffer than the FIFO size to avoid underruns.
 		* This applies only for the playback stream.
 		*/
-		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+		if (snd_pcm_is_playback(substream))
 			snd_pcm_hw_rule_add(substream->runtime, 0,
 					    SNDRV_PCM_HW_PARAM_BUFFER_SIZE,
 					    omap_mcbsp_hwrule_min_buffersize,
@@ -816,7 +816,7 @@ static void omap_mcbsp_dai_shutdown(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *cpu_dai)
 {
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
-	int tx = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	int tx = snd_pcm_is_playback(substream);
 	int stream1 = tx ? SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
 	int stream2 = tx ? SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 
@@ -839,7 +839,7 @@ static int omap_mcbsp_dai_prepare(struct snd_pcm_substream *substream,
 {
 	struct omap_mcbsp *mcbsp = snd_soc_dai_get_drvdata(cpu_dai);
 	struct pm_qos_request *pm_qos_req = &mcbsp->pm_qos_req;
-	int tx = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	int tx = snd_pcm_is_playback(substream);
 	int stream1 = tx ? SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
 	int stream2 = tx ? SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 	int latency = mcbsp->latency[stream2];
@@ -896,7 +896,7 @@ static snd_pcm_sframes_t omap_mcbsp_dai_delay(
 	if (mcbsp->pdata->buffer_size == 0)
 		return 0;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		fifo_use = omap_mcbsp_get_tx_delay(mcbsp);
 	else
 		fifo_use = omap_mcbsp_get_rx_delay(mcbsp);
@@ -944,7 +944,7 @@ static int omap_mcbsp_dai_hw_params(struct snd_pcm_substream *substream,
 			int divider = 0;
 
 			period_words = params_period_bytes(params) / (wlen / 8);
-			if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			if (snd_pcm_is_playback(substream))
 				max_thrsh = mcbsp->max_tx_thres;
 			else
 				max_thrsh = mcbsp->max_rx_thres;
diff --git a/sound/soc/ti/omap-mcpdm.c b/sound/soc/ti/omap-mcpdm.c
index 1a5d19937c642..43637ce12b665 100644
--- a/sound/soc/ti/omap-mcpdm.c
+++ b/sound/soc/ti/omap-mcpdm.c
@@ -265,7 +265,7 @@ static void omap_mcpdm_dai_shutdown(struct snd_pcm_substream *substream,
 				  struct snd_soc_dai *dai)
 {
 	struct omap_mcpdm *mcpdm = snd_soc_dai_get_drvdata(dai);
-	int tx = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	int tx = snd_pcm_is_playback(substream);
 	int stream1 = tx ? SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
 	int stream2 = tx ? SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 
@@ -305,13 +305,13 @@ static int omap_mcpdm_dai_hw_params(struct snd_pcm_substream *substream,
 	channels = params_channels(params);
 	switch (channels) {
 	case 5:
-		if (stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(stream))
 			/* up to 3 channels for capture */
 			return -EINVAL;
 		link_mask |= 1 << 4;
 		fallthrough;
 	case 4:
-		if (stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(stream))
 			/* up to 3 channels for capture */
 			return -EINVAL;
 		link_mask |= 1 << 3;
@@ -334,7 +334,7 @@ static int omap_mcpdm_dai_hw_params(struct snd_pcm_substream *substream,
 
 	threshold = mcpdm->config[stream].threshold;
 	/* Configure McPDM channels, and DMA packet size */
-	if (stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(stream)) {
 		link_mask <<= 3;
 
 		/* If capture is not running assume a stereo stream to come */
@@ -377,7 +377,7 @@ static int omap_mcpdm_prepare(struct snd_pcm_substream *substream,
 {
 	struct omap_mcpdm *mcpdm = snd_soc_dai_get_drvdata(dai);
 	struct pm_qos_request *pm_qos_req = &mcpdm->pm_qos_req;
-	int tx = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	int tx = snd_pcm_is_playback(substream);
 	int stream1 = tx ? SNDRV_PCM_STREAM_PLAYBACK : SNDRV_PCM_STREAM_CAPTURE;
 	int stream2 = tx ? SNDRV_PCM_STREAM_CAPTURE : SNDRV_PCM_STREAM_PLAYBACK;
 	int latency = mcpdm->latency[stream2];
-- 
2.43.0

