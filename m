Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C81940423
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2024 04:08:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6C86982C;
	Tue, 30 Jul 2024 04:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6C86982C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722305334;
	bh=ol4ya0qamk80qOjUHjRiwmU+TPxNjSCFxN22timvOWo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=mLP2QQzfw2JdsGOUubfwzM24R8xb0KhGESDt9EksQfaZ3rs7bDFIZPLePJgWJtfcV
	 1X3RbRhtcL5wRY4QcsFpwiuOCutOCJ3a3Itf9wb/stgbFsWYQzQQT0EmvOjBk6rSTK
	 6KvHsyBPQKaXPgIxBM+GN1vgwEVnssXsDW+wQDxQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1BBA9F8060A; Tue, 30 Jul 2024 04:06:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 5D8AAF80733;
	Tue, 30 Jul 2024 04:06:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1DCEBF806F9; Tue, 30 Jul 2024 04:06:23 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 14A50F806E7
	for <alsa-devel@alsa-project.org>; Tue, 30 Jul 2024 04:06:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14A50F806E7
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=jgcj9pTo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TH5OEnkwKKfblbpYITEFGQVnX47sro6g7XJQQHoffZdEQ3wImgy1ZpVPJyofNNwPUFbRfcBJc6VJp96iBcj2OGToGLv3sbdVJEWOS9iL1OlJJou+wwmAJnhRBgvFi+FtV94HtKRmwvsdQKBbNyk2yplJnjGwKHzcqzE31CrMNwAiAoILHM/ekyTjQQT7XEZbQDAf55BF4uCszRmNSLFVAdhEYXc2lqJrTss2tbNNMPr9w+RfSnz+pyjhh79NAeoao969B+uDQwW1oXNad/91T8t4LD3ThWUbGbHt/g+jy4JdPMwp8aqmqbQXyaaysd82FMg7dk6mSKJ603IAJ/pusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bBtFsctu3wXsrYfQvso0c5tmnb1tncxhDtGIqP0SH5A=;
 b=JEPC6mgt7zuPNMrkXHZ8iqJtnAQoExlvGUaB+V93dC0GcJ+fy4HeXNrgqRZ8x55T4hEgk/1NoT5tOqn27YxQo3sXgotnciSChyADtUsoJFGZLuyrVc8RQ5Yt7pHLtmJ2Ep3fQMN66SE/qU2op2t8uom+WH/vVS/0tRlTDNPCRZnBVIVkxVgY5phuByVBCip2BNS9BMlM2mLaPLcKHc84sqrmOpmHOGcGeFtBUYrRNusNmj+15p2g2xUPZt4l/KpyDc19x0TAj3Ubi286vDaNfTgTnjDaFTI5iUKaATCH2KJP3+tFyLTjtqoKKxAdifDECRcw7rVrDFDuge0uigqzQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bBtFsctu3wXsrYfQvso0c5tmnb1tncxhDtGIqP0SH5A=;
 b=jgcj9pToCUDuEqVv5kA9/NYepPE5ZEC5Jme+LnH9fbiJEOwWA9yX7B3+iq6aI5qFul+HEY6fFxOvLZA/1PrFf/B63NhcqnBMJIhZ3ZDcLjSnEpK6/44cSN/lycMa7sbv4Vjnfd/mSgL6w+/mz2uDobCokSEACfgb97SBF/23VJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6621.jpnprd01.prod.outlook.com
 (2603:1096:400:ad::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.28; Tue, 30 Jul
 2024 02:06:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:06:16 +0000
Message-ID: <87frrrk50n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 12/12] ASoC: soc-dapm: use snd_pcm_direction_name()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
References: <87wml3k539.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 30 Jul 2024 02:06:16 +0000
X-ClientProxiedBy: TY1PR01CA0192.jpnprd01.prod.outlook.com (2603:1096:403::22)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b780d93-3aea-4123-286f-08dcb03c3230
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?Gdge4efN3vV16u6Miz3xlLt9pIbrSY16DUAefPfjfk5a4rU+wdtinx7cw9fe?=
 =?us-ascii?Q?NiVxZD2PXE5hVG7XTSrKsS593M/TqSPFxF6CqXsXeP9AaKpK8CEKj+dFAMf5?=
 =?us-ascii?Q?KCbgo4T6bK1O//urw7ENuYOQsh+Sff9jfZoTc08rwaKgKE7rbDXY0TVBndHS?=
 =?us-ascii?Q?WogHMkwr0WbTGY6vqX1zl/BUGh4iDe3S620qMuK3+17LJ//LEUpWbTeR4HpU?=
 =?us-ascii?Q?AIMqXxtTaAyREjeNt0pn1jY7I2TCN9FjR4jYNFsEm4N/20pEBqj04I8DyOlB?=
 =?us-ascii?Q?GI1ib8RM7YVPHKutCWKQJjQw11wEMbMXSErpIZr8yOY/mrha942t4zkjEVuQ?=
 =?us-ascii?Q?fLfk0ThKJQJfa+KkIf80F61qMNWtc8+R8W423kQNrDAwsbN7frgMwfBWQ2ds?=
 =?us-ascii?Q?YzyP5oG4q9WltKa5FhUZhJNV2bXTqZ4lRBnshlTz29ZCPqIbUCiLstQUOoO4?=
 =?us-ascii?Q?9d2wy9Ne+9AkwvfEr/Bu7kj/tXpqFUVF0Bu1xq3WUHRnfOVNDXY1a2pJNgTf?=
 =?us-ascii?Q?pDMvjfPNBzNpRh6hV1j3GL882uvx1CMuuFdCLpCcTuEloIqZ+P011/Q+ljaj?=
 =?us-ascii?Q?bUx+3pyD8FD6jyDoPokCm3d9zyXqXB1QWpk+tsa0Izc3yDVxrjmWoLr2fbFa?=
 =?us-ascii?Q?gS9B/S0er+apamHlUOmqSc7yhtJUfwv8BHYgyC3Y1gOGWDXSKi+t6MIkupPU?=
 =?us-ascii?Q?8MQyvC+dTiAhXHQ0QNFpCnIBQUprsCx2e9DWOaoh67+9/liqCulYXoh5I5bI?=
 =?us-ascii?Q?Qb7F34IFaas8s8tmMiy44XoOCKlAlTMwPMjz+wGuyr73CLc6YVHBoGKIFYM9?=
 =?us-ascii?Q?aBFpDpn8tD2VxHtpM8MrMCzRq+RVzlOsbJpNvIatbFljL6/4sOHLlqS8dAD1?=
 =?us-ascii?Q?KxfK5htESklvyy9ByHpcft6y34K9b3SDFcRpxSEgn7NOngXc3GtsbXC1VLYu?=
 =?us-ascii?Q?mNr4u3fI9Bz+TyNpr7QJDjQSyc4bqrb24WBOxhaKmv2METa3sBNXNhk8Z6hY?=
 =?us-ascii?Q?Ds5ZHJk0oYlK9rt6hTQf937v2J8rizn3inNFEKmT5lM5B8Pqf9c9XzGBYTyj?=
 =?us-ascii?Q?INzdoD8lY3STP8wwO8yUYFkfTGCB5SzbM6bQ1wtMFAYDHy1FAZQ4OWf3DaUG?=
 =?us-ascii?Q?E+RkfYD4bvDSYYiCCbtYCzEDiPqUbMplBbZK8QkuJnZNAoxIcVD0wzHU30rJ?=
 =?us-ascii?Q?kvxWtQOgE+7sIK/RksZY2KiS9BRwTbX6ArclEwyuwzmFciVSBasKQzAWOcoZ?=
 =?us-ascii?Q?nn1mt3HD0BEdtsvSjqAKBSAeoIR/KrA5/H14O4K3gRVjBTXfnh4l2eMLWQUe?=
 =?us-ascii?Q?NudiEEbFEAu4YYKhGZbeudB11SaHOal36mvs2WEX2acK7GfDayNtueQJ2Kw2?=
 =?us-ascii?Q?poarv77U3RMs9aHIZd6XfL/f10bzlHd8ql8zcw7pAsy1EzongA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?wsRQJyWR9Rpq2knPIrPgxmOVJ08KP6ISc9yZw1yTod1kEnt+s2/M93pN2WJ7?=
 =?us-ascii?Q?EYJBnxh/Iw6aX6Pp4tgaJKGqTilABXgtR1TtqjMYoWJ53uE9x+4q/61NX5xM?=
 =?us-ascii?Q?kvSLKv1+ShtzKY3+HWM06x42Lud2r7TUF196O+YcI43pEJZbWwPUS+t4h4qP?=
 =?us-ascii?Q?CeZmmZX1dhN7dwPbp0D0nLgfH+ou3iito70uV4FIFaXz0IDbYvgZdL1xUmUk?=
 =?us-ascii?Q?8RIxmZoS41ojEcZRNC8RqrnA+VdSp7sytY1CAA+knqNQBV6zD9NIc8Ns8mN8?=
 =?us-ascii?Q?mV8Pbc8iZZ8kfCp0T6UnG0ygIswS/s2h1a+cIp1mZl6BFD5XMghO1c6Zqcf9?=
 =?us-ascii?Q?0/PbR0gLW2gLOZ8aNA4QPfu62mJw+qwFM4Ws6Ie4xn+zIUEBR62v/mBmRKln?=
 =?us-ascii?Q?rt8/EFZjoA0ni89qSJhWtWmD/FmpxT4Dm2mrNVz4VUsIQP0+vTvzMqL+BME5?=
 =?us-ascii?Q?ht8nZhW/XG4CpR7iDDWYYpBtj+K0V148d3l0Eg/oWDQNtlNldbKldK7Uolom?=
 =?us-ascii?Q?9Gf/3HLWr4ISuiNletvbPnTto9UpjuuM6Gph8KmldnPayZTXRHReoAXwnP85?=
 =?us-ascii?Q?zTCP9TmuvCYPGWsw6VGVGqnmNeCiA+t3v5gIIT1tXyXd9ObhAqtbVyncSY59?=
 =?us-ascii?Q?/rdbMyec+/E47sQngtsnNWebCyi7xqFDahiuRTsiveQ9RIv+RL9xmxklr40T?=
 =?us-ascii?Q?Tpab/117Bl9GP3TuDP5fq3xzO7dubwWtaoMZjWsNe3wDyxduD0kclvd85x91?=
 =?us-ascii?Q?DTesDFan4Wt2HGSfpW6li2FWjFLCk5x5Yc7QDgdw52w2mQS6I122JrcM3mIC?=
 =?us-ascii?Q?hr8rLXoNt0ge1qXTbN2V475JoEnLJcfhAVh6BnpWTgTbrOX/TFfUc77R3WrE?=
 =?us-ascii?Q?zxeQcjxgbQfdRTPez7SLgNaBLf8+aPDvdG4omnJFf6EaMXOP32HJ3wXWyWz3?=
 =?us-ascii?Q?RAKu3irKjjRW/OWSads4odG/w7cBU7r07NjWr8FQ+dp3WQG/qtRujp9tMMKS?=
 =?us-ascii?Q?q2YtRe/yTVEnZlB0qoTwuvs0dg27BvFC5vJz98aBC2zXqtobylDJGR9yL8Ae?=
 =?us-ascii?Q?RwtA73fkKjO67lA0zdDMiGu92KgaoJ6YAzNmdAzO44pSWI8R/IRJtai4Lih0?=
 =?us-ascii?Q?jVO6qtbVIATmpDFSD0bsNzhGsnl3JkD1tznaXriiMMi+wcg5sWgyvLkTtNZa?=
 =?us-ascii?Q?gegGITH3wiMzFl7eba9B6SiHPWqDan7htlNW2OpCmO4zl952LxvxzgFfXZTE?=
 =?us-ascii?Q?7TYpI6XHWlCxngWJxGTi/knh4B/7WHroGoFNJs4BsJVCK7K1OeHrh+u8m6Mg?=
 =?us-ascii?Q?omDXlSxDXXgApXKriC+1TBiN7VCGRln9ZvjckJbpWL3DeB/OoMa2Y30uWR+g?=
 =?us-ascii?Q?SnNuoYi7v8ok//d51jpYdybvRgnOgrXBSdGjb9V8ZhgmXIxLc2EtAExDbqKt?=
 =?us-ascii?Q?uPU55zGCzN3XKKtE7AT6VDqU+uBIIT7nNQg4LstX8YJnLWLMPUp2LHzusDs4?=
 =?us-ascii?Q?o50pLx0MuITraUmHt5wpETou1tumVsqDKg2MPgik205UAyRJZYYlAuhJSTtB?=
 =?us-ascii?Q?rmrEestSsfb/iMGzuLx80Rl/kn+gYuWWVV+tI66RSGeiAZiU1xywOtWRepiu?=
 =?us-ascii?Q?OB8rmosZPsKflQk5tcEnMX4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 1b780d93-3aea-4123-286f-08dcb03c3230
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:06:16.7200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Pa68XcIMqTk2p7kUgep3f5qtLE2zD6x+mJB3nzLSTh18D6PdNjrBZkFSzziZLPgOvCO/MwcxU2aCwy5xFhwtA30L2RSAVrZKHIKid9cFT13rINKhakOEogeBpJZiCoP+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6621
Message-ID-Hash: BTDBOIBSXHIQNJ2PCJPHB5KO2K44V57E
X-Message-ID-Hash: BTDBOIBSXHIQNJ2PCJPHB5KO2K44V57E
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BTDBOIBSXHIQNJ2PCJPHB5KO2K44V57E/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We already have snd_pcm_direction_name(). Let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-dapm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
index 37dccd9c1ba01..d7d6dbb9d9eae 100644
--- a/sound/soc/soc-dapm.c
+++ b/sound/soc/soc-dapm.c
@@ -2751,8 +2751,7 @@ static int dapm_update_dai_unlocked(struct snd_pcm_substream *substream,
 	if (!w)
 		return 0;
 
-	dev_dbg(dai->dev, "Update DAI routes for %s %s\n", dai->name,
-		dir == SNDRV_PCM_STREAM_PLAYBACK ? "playback" : "capture");
+	dev_dbg(dai->dev, "Update DAI routes for %s %s\n", dai->name, snd_pcm_direction_name(dir));
 
 	snd_soc_dapm_widget_for_each_sink_path(w, p) {
 		ret = dapm_update_dai_chan(p, p->sink, channels);
-- 
2.43.0

