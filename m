Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1058D774EEB
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Aug 2023 01:03:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1CD46EA4;
	Wed,  9 Aug 2023 01:02:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1CD46EA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1691535826;
	bh=RIgt5zsqTEOi5M3NeqqDJqODYmdRxM0EWGcbn0+UxzM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Hrt27kIWuFnkOFvT2HGaJzjsefq9tr7c5MjZyWIFK7AHyvml4Cu2YqGf9PBJ/sBk/
	 qLoS+KQlw3c90VgaKceq9OR2cqZdQcPkNeThlFYvHBF9kQqs5SxDMTUsfxruF5zTn9
	 Og0XkzW5BGb1lGdUH9uoT42YtvF81VWur80gKa4M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 58D01F805C2; Wed,  9 Aug 2023 00:58:03 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13CD1F80688;
	Wed,  9 Aug 2023 00:58:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 47549F80690; Wed,  9 Aug 2023 00:57:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2072d.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7010::72d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7FBD8F80688
	for <alsa-devel@alsa-project.org>; Wed,  9 Aug 2023 00:57:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FBD8F80688
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LgQx7XzU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICXd52+q6Ehs5yByO6nDFmIZXS5SE9jmP6uPxJYhRofPpALZAd7n+7uYA3+9xzwjSiW9grw/tBLo8ozedW/E3S9MMTanBkIgMmkL5YeRnC8ZLRblPwb1ypUfL52fX/XJQs76LqIR0JOfUPPfZDCIPovD/V/ncGqpR6tEKmHljxlcBxff2e69pV8swoUJwmzrgbz1zrzsb12QG5QrS6aku6QT2NyLCqrdWvXKIRl/W+C2NBWABfDY9HEsvvW/TuqJViZPq6SFCUCTcsPPhWv5g9HZ0B/+rjQeEupN9klVmxWulP28w/xzjBvuSLHoNAjOCa9cuuF0HHl8snufV7v/Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pYOhQ3AgeNrny/ti4KpDd95kPNC6d39R8HOb7uhsw3Y=;
 b=ByIoFEQrGr/PezQl9yNgjey+OGmmhIj/y46Qxt/sAeZaaxK8ykI5RSZXSGAjAP7xcJcOg/wgHvIcgxf3b2X8Jo1+fYv2lYfeKq9HDvwiP3OP/5gwKOeBDhx2hUnAeUzefk1V/kCMyq+EKJ5HNptppEs4Wyt0zy7viUoIIyi8//C0pnT9x2Uvl/OTWI+vsT4YJI2BeJsl4BpZCLQc+40sc6cBVX2uOPfjRHuqLuBTaWwfk2GiKrUx6x5ioCvhAMRTD+E5+A8aZ06nPlLr18CfciASQFZmgARZKmv1l6QlzO/wwHa733QzGSaJSkNVxMmamI6lfMMKuHNLvwq85NKFAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pYOhQ3AgeNrny/ti4KpDd95kPNC6d39R8HOb7uhsw3Y=;
 b=LgQx7XzUITtC1RZP9zsB+L7+xU8RqI3q55pq8VovniJKucOsZa8oHJVCcJepAslkefVx8BfqYIcyWfbAVxi8YBPGt1Carv9IMiqMhqKowYlYSxsFdMrPUrYmOu9nwnhWXZP/qjC1hAmKl+IboxGaJzyYFQD4Kj8VGRqY5J1j5jA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYWPR01MB11379.jpnprd01.prod.outlook.com (2603:1096:400:3f7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.28; Tue, 8 Aug
 2023 22:57:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::e6db:c2b4:3f89:e3a5%3]) with mapi id 15.20.6652.028; Tue, 8 Aug 2023
 22:57:52 +0000
Message-ID: <87sf8t9m6n.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Trevor Wu <trevor.wu@mediatek.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 alsa-devel@alsa-project.org
Subject: [PATCH v2 28/39] ASoC: mediatek: merge DAI call back functions into
 ops
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
In-Reply-To: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
References: <87wmy5b0wt.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 8 Aug 2023 22:57:52 +0000
X-ClientProxiedBy: TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::16) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|TYWPR01MB11379:EE_
X-MS-Office365-Filtering-Correlation-Id: d269f096-bc91-4e0b-4c1d-08db9862e57f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZpPm5DM8wjuXBxR7rbdB1ttW9ySeQzC0FoQ+uOqthbAwm6p+EU2KfZJF1G3q1htcLiQ4r+N5c5Eht6P+l+FuCJ6oSacF0pUSAQ3FMyqRd6tsUzr0fCx5PSahIY3M8cgFDlaqMCC6bwTf1HGIllL6RuoguokviljQyUjMQEDJPjKHYTW+j6saW+bbFEdv74qWdP1Ro4bp2loe8FdUOlveSl0bSau19SfNN2xj87Sz8F+PbUxp98ZsT5hiyycSHEo9YBBgWzTsF3j2V1V/oI6y2BeEQoUKsK0QakPr9PD7V8Ra3VjW6KuyF9JVgobkqZAEzWYOSn52z7Np0jAF6cZ+C3x3vp4Z/4oSBXBE+9i+T3+kOajBSi75wr6/btT4lnSpz07xg+SzhXw0P1pcowVRHUMB3fd+9l/kwBTQ9BKQ2KSEwjs4Fkss2xCXrsN4KYhhx9qtVsTWkLLE5EFZDttRcT1b3zKgs03O9T+nIAat83Q7LISKpnYZbbt0zZWkCzQsGqSln/3dWs5dooZZfm3FYdHKtvNGItiZ25VARjK2FtDiOpU9vUirY8c65d5r7uA74KR9ctuZZs4HIrFMsTeO0aSN1hhLPf+0ClKdNTxzASTLwaaLaLKqM6d4fx5WSS/z
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(376002)(346002)(136003)(366004)(451199021)(1800799006)(186006)(5660300002)(8676002)(8936002)(38100700002)(38350700002)(2906002)(86362001)(2616005)(52116002)(6486002)(110136005)(83380400001)(478600001)(6506007)(26005)(6512007)(36756003)(4326008)(41300700001)(316002)(66476007)(66946007)(66556008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Pc/zbTfcgBmWqTpc2CWTalLbcImmFfSDEwAlkNBrDxHHoamX7ZjjnjeLweeQ?=
 =?us-ascii?Q?u4Y5a0GpOo+zPIK/BFBXC5CrlSE/1i2on1LeVQEPxaXHsnI2+yY+TKt95AfS?=
 =?us-ascii?Q?GUGFlP8xe5WgOgJLqFnnrjkZVFYnK52lGEZTSJ9hCBz5nxvlmABW/VGw9eRk?=
 =?us-ascii?Q?kfgphtuGWj9zDLOejV0XKYtNrVRiA/xDh4o5VV/OmpuJRnKNx/2ymiaQCxuv?=
 =?us-ascii?Q?nYIcyZe5l1Z9f+CQv5D/P8FH1l+y0nmQ3B9ColTcD+2Y3KRb3DptHfMWncC4?=
 =?us-ascii?Q?kXqcJj2y6+e0jnIzJjXNk8StU3ijOY9F1kun11jucBrtmfvoj92f3oUTV50k?=
 =?us-ascii?Q?XMKmesEkOeu5HU+LzyBW80CcXtSjcTaTuiPeEHm4VMZNQbdpziO0HshI3pzs?=
 =?us-ascii?Q?QPSC5zx19tDmNZM9IKPEJRBmnL1hBhyha3/ChR4rvic8pfQCoqqUfpgAUB7z?=
 =?us-ascii?Q?9ZflHKYPcCF70bayYuvlLs9kgsKYz3/qd1KI84lpF2fGkgqgjuRpgGltxXWF?=
 =?us-ascii?Q?+f5a+nS+1OUwf5iGV6wQ91Wuz6dTAbbV7WxhmEustXfy3BBJkDy3cPz63k0C?=
 =?us-ascii?Q?uJwkdKENP5iI6K/4QYVi+kNheGwOffQfvWLevr3dLRWHIcvxjtSQMxLPxZC7?=
 =?us-ascii?Q?XjiJ/UteRHg0hr8/Fdw1YXhHjBcbwu1thbC2eCp8zBtuV9mzWEkiD8AyOY97?=
 =?us-ascii?Q?dywqsDBa0PWH5YRyLHU6U4AiBgIa7513NfrG/AEiokRtF86gqFfTM87pHwA2?=
 =?us-ascii?Q?d4t3mKzz3LvW5EyuSQKHLVsIKI0UcridKosENCjdV7SYQzhLuMij/r/tz/RI?=
 =?us-ascii?Q?czra/JLqShzVQGVhgARl4ZdGx9tQ7oKlmvzSEP2zrVUfiIu8xysxubGN6Ovx?=
 =?us-ascii?Q?TuS3hYXvFqoT6N56wG6g5R0U4XeY4yMK5FJhSqw7E4aTzb6GclfVHeZrpmT1?=
 =?us-ascii?Q?zcw/Tf0Sm2Ix8ghVSBQqfUlwbWPaZ3XWas+5Em6khVN2L372JSnVczDoDIpY?=
 =?us-ascii?Q?tVBW0tOeR2kIEFOVBQmCDjPcFMwTh4b5o291Gg/IAb2QM5ORPL9tLymab1cw?=
 =?us-ascii?Q?8ROlbEWRDYn/leghcafNP0mVx+61QPH8aa8mR3ZPPBfkwJmcyfP80DcUwSp+?=
 =?us-ascii?Q?CN9b1iIQ9ah8LQfUcKtWMNEAWgpLUSn2tj8gb+UzGaSXwG7GYzS0w2X/gU48?=
 =?us-ascii?Q?v2KZYBhVrsljk682t9AhEImTqPs5BAjt02OuxeZz9r4HVIWof5H/Tst/s8F/?=
 =?us-ascii?Q?kqdh1jYDXThF9j6oOyZdCwUQxpYBpVhli72jJ+ba4o18wOPiOeSOTzAmGB80?=
 =?us-ascii?Q?FpdK6xS3wAZ4saSEmwCPivDtfU46zlYo56XJSsIo+4Z8dUtvndoJbxO4nQ9D?=
 =?us-ascii?Q?tzfyQoSbXyeeHgWQz0pd9g/ELyrICscmsqcpjf/S/Ms3dsdTdnGUyVEDXjR+?=
 =?us-ascii?Q?6jlHqa3nMkROwQR+UPSKRi7WhYhxLz6RwYlRMRbLJMHu1+tMb0gVI5Wprs/9?=
 =?us-ascii?Q?iiGXqPpfePiQ+MgJ7oRbnuRYaqRkSFtGO4nz1I1hmsxUXF5ir97c7jFFKecG?=
 =?us-ascii?Q?uRhG2jN6drMMoTmWOawuVWaKUbkpi0/MEEGHNpuY82qoehFyCf8JgEmNSQlB?=
 =?us-ascii?Q?sQLpwTUtVO1pdmc488+FidY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d269f096-bc91-4e0b-4c1d-08db9862e57f
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 22:57:52.8812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 7J2/ioB+uApifyu2r841jzE0q91HGviTGfO2qlv2D8TpJZDhAKyeWNM0TKbYz/988LaWBIN4Ck68RZa5dxS6P4OSAua8zrSjAX3ZDL28QB4UKAUw62S+Z3ELPG/Mna6J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11379
Message-ID-Hash: CV5HAXGNOCBNUSOZVDXUSOBBOF6FCWOD
X-Message-ID-Hash: CV5HAXGNOCBNUSOZVDXUSOBBOF6FCWOD
X-MailFrom: kuninori.morimoto.gx@renesas.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CV5HAXGNOCBNUSOZVDXUSOBBOF6FCWOD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

ALSA SoC merges DAI call backs into .ops.
This patch merge these into one.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Acked-by: Trevor Wu <trevor.wu@mediatek.com>
---
 sound/soc/mediatek/mt8195/mt8195-dai-etdm.c | 56 ++++++++++++---------
 1 file changed, 31 insertions(+), 25 deletions(-)

diff --git a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
index eedb9165f911..fd4f9f8f032d 100644
--- a/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-dai-etdm.c
@@ -2456,25 +2456,6 @@ static int mtk_dai_hdmitx_dptx_set_sysclk(struct snd_soc_dai *dai,
 	return mtk_dai_etdm_cal_mclk(afe, freq, dai->id);
 }
 
-static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
-	.startup = mtk_dai_etdm_startup,
-	.shutdown = mtk_dai_etdm_shutdown,
-	.hw_params = mtk_dai_etdm_hw_params,
-	.trigger = mtk_dai_etdm_trigger,
-	.set_sysclk = mtk_dai_etdm_set_sysclk,
-	.set_fmt = mtk_dai_etdm_set_fmt,
-	.set_tdm_slot = mtk_dai_etdm_set_tdm_slot,
-};
-
-static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
-	.startup	= mtk_dai_hdmitx_dptx_startup,
-	.shutdown	= mtk_dai_hdmitx_dptx_shutdown,
-	.hw_params	= mtk_dai_hdmitx_dptx_hw_params,
-	.trigger	= mtk_dai_hdmitx_dptx_trigger,
-	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
-	.set_fmt	= mtk_dai_etdm_set_fmt,
-};
-
 /* dai driver */
 #define MTK_ETDM_RATES (SNDRV_PCM_RATE_8000_384000)
 
@@ -2505,6 +2486,36 @@ static int mtk_dai_etdm_probe(struct snd_soc_dai *dai)
 	return 0;
 }
 
+static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops = {
+	.startup	= mtk_dai_hdmitx_dptx_startup,
+	.shutdown	= mtk_dai_hdmitx_dptx_shutdown,
+	.hw_params	= mtk_dai_hdmitx_dptx_hw_params,
+	.trigger	= mtk_dai_hdmitx_dptx_trigger,
+	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
+	.set_fmt	= mtk_dai_etdm_set_fmt,
+};
+
+static const struct snd_soc_dai_ops mtk_dai_hdmitx_dptx_ops2 = {
+	.probe		= mtk_dai_etdm_probe,
+	.startup	= mtk_dai_hdmitx_dptx_startup,
+	.shutdown	= mtk_dai_hdmitx_dptx_shutdown,
+	.hw_params	= mtk_dai_hdmitx_dptx_hw_params,
+	.trigger	= mtk_dai_hdmitx_dptx_trigger,
+	.set_sysclk	= mtk_dai_hdmitx_dptx_set_sysclk,
+	.set_fmt	= mtk_dai_etdm_set_fmt,
+};
+
+static const struct snd_soc_dai_ops mtk_dai_etdm_ops = {
+	.probe		= mtk_dai_etdm_probe,
+	.startup	= mtk_dai_etdm_startup,
+	.shutdown	= mtk_dai_etdm_shutdown,
+	.hw_params	= mtk_dai_etdm_hw_params,
+	.trigger	= mtk_dai_etdm_trigger,
+	.set_sysclk	= mtk_dai_etdm_set_sysclk,
+	.set_fmt	= mtk_dai_etdm_set_fmt,
+	.set_tdm_slot	= mtk_dai_etdm_set_tdm_slot,
+};
+
 static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
 	{
 		.name = "DPTX",
@@ -2529,7 +2540,6 @@ static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
 			.formats = MTK_ETDM_FORMATS,
 		},
 		.ops = &mtk_dai_etdm_ops,
-		.probe = mtk_dai_etdm_probe,
 	},
 	{
 		.name = "ETDM2_IN",
@@ -2542,7 +2552,6 @@ static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
 			.formats = MTK_ETDM_FORMATS,
 		},
 		.ops = &mtk_dai_etdm_ops,
-		.probe = mtk_dai_etdm_probe,
 	},
 	{
 		.name = "ETDM1_OUT",
@@ -2555,7 +2564,6 @@ static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
 			.formats = MTK_ETDM_FORMATS,
 		},
 		.ops = &mtk_dai_etdm_ops,
-		.probe = mtk_dai_etdm_probe,
 	},
 	{
 		.name = "ETDM2_OUT",
@@ -2568,7 +2576,6 @@ static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
 			.formats = MTK_ETDM_FORMATS,
 		},
 		.ops = &mtk_dai_etdm_ops,
-		.probe = mtk_dai_etdm_probe,
 	},
 	{
 		.name = "ETDM3_OUT",
@@ -2580,8 +2587,7 @@ static struct snd_soc_dai_driver mtk_dai_etdm_driver[] = {
 			.rates = MTK_ETDM_RATES,
 			.formats = MTK_ETDM_FORMATS,
 		},
-		.ops = &mtk_dai_hdmitx_dptx_ops,
-		.probe = mtk_dai_etdm_probe,
+		.ops = &mtk_dai_hdmitx_dptx_ops2,
 	},
 };
 
-- 
2.25.1

