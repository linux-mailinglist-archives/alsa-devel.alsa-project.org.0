Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 696B39472E5
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:12:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 728A635D6;
	Mon,  5 Aug 2024 03:06:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 728A635D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722820024;
	bh=qn1y+bRPVFaRQn0PoeVFEpDQb7fD/Q05gcVSGm6gl2c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=cPUBG2dGzFqhwfWh+2LdgYWyNVAjbI1BbsCFNOTZKADar180bxwpljTpXeuy6QUem
	 attC7lpSGvpF98xQdL/AzINM8KgzwNyEMSStsGa9CcRDq9j+tYgiLIG9N9mE5qEAzA
	 FC5ymgms775ul3Nw+xkfmeyAPlsAxZZNki0YuzzU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D1B70F89F26; Mon,  5 Aug 2024 02:44:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 91DA0F89F23;
	Mon,  5 Aug 2024 02:44:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2CD23F89F1E; Mon,  5 Aug 2024 02:44:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5F6EFF89EDB
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F6EFF89EDB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Wz7hKFIk
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iFE6N2uqrYOy3E/dqQwq5zCPCgszgw/bgNFIqWy9ESOD8+W41SzT+MhWMU//W5gFOXFUyFYGIsdWey37gfU1497Pq2zWuvH/ahYsGE080WjsLZfZHDDaCmzxo4etmjZoJHkSWw+5H2b7K10z3JgrBC3RJpcQkXHx6kJiDXtlT9U0HeVfSlWnsDWGsb8bC0sxtxnSYHm1BbKYquoNQIyHZgs9MuDLhM5eDM6WAG97OkHXLYXsCm9/jTnGEHB20NKaUbtHtbCgsOH2/fe2iQqpbXlZC1oZzLnLp841FYTk3LUKyfw4eAwPxCk9aH5B5ppIbkyyhjNCVEgJvQwHOF3fQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GT2EO3v4sy6MyUuQ+iNF1x4dP7l3YqiVxHZXWFPqdNY=;
 b=sW5RKfpHgh9DsG07AP76pc5g3omuep+ZhZGPXsFAeA3HxC5zGDH+ai3WeZyUPDICnHs8LYGQbzc15UU/qvuFUXR/EM50uiuxuUf+abMyEW8ST/I8qHRofqFfP0swmWytcLgQWdjhdwCzoWlUksSd7Ord8FtVxM0wP+UXBCGGa0lV7vsFQhBQWLVkxRTGL0MQaJwGPCiTDUt+rg7/DLk/36+0l52CydVnlHdOL23ELjRAerEteH5FZSwOYk/kNVehyeq8KyLm19ORC5eRJaLdaViTiTsr7Jhdom9ZpPpOzOruaM5DLld+VTlX3tjn9wsREdhQWav+C8ZPUPONOPy8Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GT2EO3v4sy6MyUuQ+iNF1x4dP7l3YqiVxHZXWFPqdNY=;
 b=Wz7hKFIkIpf4nZS1fbpZQLiJAIn5ldEcsCRmSljqK1WRTERTMxnJrMDuPavZov6DWcDuY6jKvvJHqkbRE++vOk+odTAZgGtwzqO+rvpEWV9M8tEu18MO9cQzM+MkNn8a8p+fQdE7IH+C914TMB/MUQjsyrZzvg1cFjTB9eEZnb4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB11466.jpnprd01.prod.outlook.com
 (2603:1096:400:400::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 00:43:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:58 +0000
Message-ID: <87y15bvlwy.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 104/113] ASoC: codecs: framer-codec: use
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
Date: Mon, 5 Aug 2024 00:43:57 +0000
X-ClientProxiedBy: TYCP286CA0279.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::6) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB11466:EE_
X-MS-Office365-Filtering-Correlation-Id: 4518b8ab-4b2e-4cfd-a971-08dcb4e7b106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eha+Iosw7melA0prwlyV6h+s2j5GrJLl/kcv1+Ijq1tydbui7iWPbvP48+W1?=
 =?us-ascii?Q?NDnwaSdXan7ryIEScWXhbmsnyWlveyeyrtNCfDuThaSKDP/7gH62S/NwmT09?=
 =?us-ascii?Q?znFTlPIZwgSiPkPI1Qm/FSr9fpQ99HMZbR51X/eQpFEP/yr1jtebkcSxla1k?=
 =?us-ascii?Q?9dkcwY9N8u/t2OCt89g1OlRejMIGeBciM4+R33jqxGozwYDi5Vowc4x5OvR3?=
 =?us-ascii?Q?WJVK8PxHRf5q5NmoPz7yH+WT2XZnOL7rwxDgpzyeW47Trzh4+cTOFG0yQ9Wx?=
 =?us-ascii?Q?aThrwsY2sOFJGdR55taOSrwT4MYqTgPHKE3Zlf8qjewmbIBSUpc1kldWbJJH?=
 =?us-ascii?Q?xn3juxdv1CBtQbJCgU3HcLoauKIoltMaWr4LV9FHfb1sEZM0GOa7NkjkCqCu?=
 =?us-ascii?Q?kW/2OHoEF8rGg1paQ1TRhLavQxi2SBiP5sRfWJ55EjF3lEpzwUzxM+vN45td?=
 =?us-ascii?Q?EM9H9GJhcjwJ2dRRpXn5El41mDf5yZpco4DWuNCkP5OjiXYxKBmqM/3obYhx?=
 =?us-ascii?Q?Yfv+00G2/ILZ2o95CWWKVGf/2Xd3tlLBBodPhxtM+gw2dOyJUIe1gLMnvuM2?=
 =?us-ascii?Q?2h/h+8xgLAo6VPPhKrkD7dFEJUfXJnliOl713BgsmWe+caivwxfqlgUXXOTk?=
 =?us-ascii?Q?tqpP2JBXcMzizrJ4BCCEHwyRMKDM5R6OpeJLHUzumdQ3rcmEUI2pnAgv3Gg1?=
 =?us-ascii?Q?gDsaaw1Gi3Jbv4PXz77hz45jHI2yEgSM7ceExV9+hFYfwlKnzqvq/oyhqX6P?=
 =?us-ascii?Q?wLJD4fMOpShp0YekElEnba4L+J1Es3UbJsCjQSo2rd440Zy7mcJOCRy7rdDp?=
 =?us-ascii?Q?PalqPY1uP9n1uzMAgblAEwORpK8hge8gL3oJKpHG7+mlTdXoy9Eej2QfxF3/?=
 =?us-ascii?Q?M+pH+QogvcfCulafCxUc6vIdaJm5IsczdpakNMz5mCQljus+7gkCAfG6u5ZV?=
 =?us-ascii?Q?BTHe3nnSkNZXK3JzOBJwUMAAc/u+LoYKzlnk++DbQ91/PjTOEHVu+N2C76Qe?=
 =?us-ascii?Q?tKTgeU2rPEFhhS309eIkCNvlTXX7ZXyLlfgXu+eVwyEvY/nMplsHGw7VUh45?=
 =?us-ascii?Q?U98PZJPBOGqfmpsytarstranZ6jiRi3Lr+MQ1vJg7n0vucNLdATtk5YZvmbC?=
 =?us-ascii?Q?16kmgrvWo6ieWmmrYxRtz9VOyYtpptgyOYDrs9vEGODIF2chhYQFrmHZ+p+j?=
 =?us-ascii?Q?zxiMFJBHpt0sdFYY7sZ7H8kuRvgBpjO228IGRZUGlGI/0BuRNquSvoi2zyJ6?=
 =?us-ascii?Q?PAPbxQ6owq3xyhero1Z+1ulzFLNkcnl48DYxZZ0xuZjAsBxpSav3E2qet7QF?=
 =?us-ascii?Q?2SmN3yVrY6AqW97Z3i/LD/qrSQnfmcACotGrFSPFi6OuBk8RUBeyJ3c44e3j?=
 =?us-ascii?Q?0wLEjfr/tqhMgGLdO1blU6e0mu1lRDSyAXXp+ukShlMyi8Cbuw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Jp6syObF5id1/Ro10cBYNtoPHimqZiKsyMMICo4XGTttK0aUveEPeuV1rk+K?=
 =?us-ascii?Q?hj+Hgf9IB9nYlkaMS5TglfqJDBiuLu2NOZf+QIbOydjBELX56KAoYjKX+8gq?=
 =?us-ascii?Q?kcMd2uDGn2ir8V/WWGO/TYAZfWyoypnemXi0Tv2v92riTmY3QGv/N+7hFnPN?=
 =?us-ascii?Q?93LNf/yKMzOWgQEZ9/QBZOys3OdVnmYprI1fw137XcYcpwxbOkmJxA/GYPkl?=
 =?us-ascii?Q?Q16jT8ak/RyFbPfZmCs04zg/96n8Xij2LlYvUmsOXWfVMkrKT5zsjbDdaAcD?=
 =?us-ascii?Q?PrEXIaImCsKHdJ5pV24NlnMrn9dYFuQ33nawDTSFdhBTpNLiCIbrPkitEzmy?=
 =?us-ascii?Q?ZNhP1F4e9qXGbXOu+Koh41D930/OZQlBJ2nQ1VZzdlHMnQkj4utoNm/14keS?=
 =?us-ascii?Q?eU9wDmz/I7aNcRZ69mqjew3e9PYskf2/YwHG73gTzJUgo6917BQcVzt+roZu?=
 =?us-ascii?Q?pDzCI9jFSY+Bqj2rLY322F6D3XAHs8T3ijLDSDAHPpX0se3ku71v6jLU3YV2?=
 =?us-ascii?Q?mojHPCBCzrcbMth0yzv6czUUqWXTJLdI5k15zLILHuI6SxKy/Nj+2oYZfs1t?=
 =?us-ascii?Q?HCpC7a79RxQx9EU6oP5PpmZuouOx9wJ9gRsm29lL1t9plzGzxvsVaVtRmaKk?=
 =?us-ascii?Q?CUY4hEgmTiqNsnr5QhkeYI7/xPDAfgnVGQSHsew+T+/H0wC6qFX+nYBSlb5O?=
 =?us-ascii?Q?EV78kMyZvn3rYQxKyt0d4R2zHKna2/G6IeJqkZy7a3Tmb6EeTR+KCU+1UXZj?=
 =?us-ascii?Q?K9niuMBTyCFBCzRgANjfYmCb6jaj2F700ZaDgxk+3bv/iQBoMFX3kcZAXj4i?=
 =?us-ascii?Q?iyQp7lchGi2DrDrRSx+Zaibqi0ysRVdqlTtnhonfGwnTSi0SzXJdYtnrt7PM?=
 =?us-ascii?Q?VawJA2yUeRujnyU0pBYJ97IcgERkcvv3rU/3zrra5tgv9EQmSQP1gQitrZSt?=
 =?us-ascii?Q?17NDY8aWYvLOG6/O9RgP/vMkVr4Sj/ZWEC2IzT0XwCxkKBkKVqpD6aBIMLzJ?=
 =?us-ascii?Q?012l7kgDV2E6+EEWW6kTbrjpDoibge7D/95oLB9O9+5iVtkbyXYlbTVwS+xY?=
 =?us-ascii?Q?h+sIVi4XG+rprcWDbnpKYj/ysY5tPN7IizsAA8B9CxIEQ0Rfh9bK19ULyBq4?=
 =?us-ascii?Q?W0DuMqcdKfBXxO3NklD6wcsAyTxwOGBcCvpf8jZNrgkh+n1NvKFgYy86jgkl?=
 =?us-ascii?Q?FyvJTgmOVPqLsEtC5aku7UylKRgSM8Dg+rX4npyR7Oo+2g5j5BsZt7gNO02O?=
 =?us-ascii?Q?5LnaOKY9qSgHanvS4baDeZdg095sBPg8beJ4nRHu65hbQ8XND9olhh2tDwUS?=
 =?us-ascii?Q?puMSC30dmhRIoEcmxdkwI+xXnbxE+pVk2pN3cEJu224hDFV0yScXuattlbGR?=
 =?us-ascii?Q?0Dc25H8YU/yfFAohdSFE/pAcyrFkfVe7Jj4+BEx7lGK36Lq8OHfVh4A8HIgx?=
 =?us-ascii?Q?lm6QKpNQPXuyNqmfTXmMLqXrcQzRC268aBGpmQ1kEzTPrPYWrbb4bb1Od2dQ?=
 =?us-ascii?Q?WMumivWmJKUI/H4u4yDMTRaWy3ZBJyAU7dw0q2S9ybLdY0vyRDIUAjxKxIuj?=
 =?us-ascii?Q?BrCjOHofjsVpMxpio69nWN7Lhcz13jR9vZdhzhNml+FhWQRbJWJzzb+edcuz?=
 =?us-ascii?Q?eDYXx+LyYylpl0wcqBR1Gfw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4518b8ab-4b2e-4cfd-a971-08dcb4e7b106
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:58.1055
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7OnAgHKtsWbuksOICrUIxsts4UJnccQTVX3GOEMXDxeKNc/sKxfI1vWK4UjOM3TCmMCCzR/inPMy4slzPHp60js/5nlTh8AaBZ3woGz98NTyxTC/errM7IWszqzIp9KF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11466
Message-ID-Hash: 4IDTYSPFUHXIZYQI4EFLFKEYBEZBVC32
X-Message-ID-Hash: 4IDTYSPFUHXIZYQI4EFLFKEYBEZBVC32
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/4IDTYSPFUHXIZYQI4EFLFKEYBEZBVC32/>
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
 sound/soc/codecs/framer-codec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/framer-codec.c b/sound/soc/codecs/framer-codec.c
index 6f57a3aeecc89..10ad78e87a7cd 100644
--- a/sound/soc/codecs/framer-codec.c
+++ b/sound/soc/codecs/framer-codec.c
@@ -192,7 +192,7 @@ static int framer_dai_startup(struct snd_pcm_substream *substream,
 	u64 format;
 	int ret;
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		format = framer_formats(framer->max_chan_capture);
 		hw_rule_channels_by_format = framer_dai_hw_rule_capture_channels_by_format;
 		hw_rule_format_by_channels = framer_dai_hw_rule_capture_format_by_channels;
-- 
2.43.0

