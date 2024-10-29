Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFB59B403C
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Oct 2024 03:12:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C86FF10BE;
	Tue, 29 Oct 2024 03:11:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C86FF10BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1730167918;
	bh=qYZzVI0LlfJuMXguWOVx7jlkeVIN296ai7BfGvhMs2o=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=d1IqxrlKuAL9zvmwf1Xg998RI71JkPAmzRHs9Sr8IZat2XHp9t8a4VEHAE47ybSBx
	 rV9NEcqQ4/ffkYWBGTxvUWO53eUXI+tFRIJp9whJzGxr//YdaAlbFm6OJ1s1nCKfWe
	 Wa4zvq5maUGeCCcqXh5sQ8iEg1bdzx3tnJGsmuK8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1A6C2F805E1; Tue, 29 Oct 2024 03:11:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2F4C2F805DF;
	Tue, 29 Oct 2024 03:11:19 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E6724F80269; Tue, 29 Oct 2024 03:11:06 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260c::616])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EAE85F800ED
	for <alsa-devel@alsa-project.org>; Tue, 29 Oct 2024 03:11:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAE85F800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=nLZI/R2T
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CLg1cEUUYSeiBgtm9VHK4NOfG/0x4AnFBFKKXw9Do/HIPjAix22cX0mfGxRRGbCITBTBFXjPnpXQR27/fu0nCmue4LZbp93zzBRtTrGOThZAdn64BA0SoLl2P85Ctyta0e26l6leHNI/RwyWGd2O9xgi5opM4HqczgQ5W406RTDZXOx6F8jn96sT5yQsWRJQpI+nLOhOLAy/99N7ShLrxQ7Fv+3PIyEcCFNkHwfCXnYSmSuyJdcS9ky0g0SKsWg2z0NZKrXQv4TFhkCU8fxwvQW3lFjqO289ViFCRBZhg7d/g76uppLZtJBzhCj3jughpC4ad73a3d9cTSQFvCWKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AjqYSBEF+harWuyMeHZEqZwNJnm1Hy5T0NuzIdWBwpY=;
 b=gGTQo6YBFfHv2pHxxV73ADku+nyz26NhUvFZvoEzFlgsIcilH3181Bt/Lv7fDRJq22m9TlCfzUP08LcRLmMF2YWMU8kw9egxaqMo+ed3ReZjF6Ni3Gy0bD4t0XutWfdzUaQCSo7wC+T8LNCjnliGNfgRCEWPEj5EL3jnyuLCRtPQsotHJw7EzgcvzbZHwob6ukf0QvuXOl4XcCxgxoKfZHFiXGBoKWJEDaME85GcyGO0IvTvRhIcl6v/C3UUrKrZ/rMW2/I/xRLKN/XZFtdCBFpBzshojbZFzwWNq4lx/OcXFAHWmLhRVRy1E72FfD6dPcJ7HCfLPdeUjvDF7ZotDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AjqYSBEF+harWuyMeHZEqZwNJnm1Hy5T0NuzIdWBwpY=;
 b=nLZI/R2TssdKosuVHO7r/CmniHRl31MjjFoHUT8qAbbKY6f8PA5dVwXdZoosPMOa1fGhGznFDT6j3/LS6VVzl3mJZtb/uUldi26VQJPQoybJrxSfAS+j2BsFOQbuEQcGAey1Q33MHLRc0584SFivovBsfiz6oWhT6zP4AJDlV8ElpJgkU4p6l9aFELYkHJJpUFTwOtGEfBAWPynzI5hCPGPQUxcfIS6cBrdtnHyRMKgQXWUUZeoGdBurfWHIc6F1D7O8qlg8THKE5w+leOv3+hedha+N+b9GCEL/qUCAEIkaOKlW2vDUnEbvGc0qTAx3d4ZJAOE/kPTawBFOp+brkQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com (2603:10a6:208:191::20)
 by DU2PR04MB9147.eurprd04.prod.outlook.com (2603:10a6:10:2f6::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 02:11:00 +0000
Received: from AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891]) by AM0PR04MB7044.eurprd04.prod.outlook.com
 ([fe80::7be0:296:768c:e891%6]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 02:11:00 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 1/6] ALSA: compress: Add output rate and output format
 support
Date: Tue, 29 Oct 2024 10:20:52 +0800
Message-Id: <20241029022057.816402-2-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241029022057.816402-1-shengjiu.wang@nxp.com>
References: <20241029022057.816402-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0031.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::11) To AM0PR04MB7044.eurprd04.prod.outlook.com
 (2603:10a6:208:191::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM0PR04MB7044:EE_|DU2PR04MB9147:EE_
X-MS-Office365-Filtering-Correlation-Id: f808c7c2-06bb-41e4-8582-08dcf7beeebb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?IAFQJCbBay/8KtSdrz9p0j8wUibzinj/TcyiDWaKPrIkINfZAklaC4phg5Ra?=
 =?us-ascii?Q?lMrKgQc8HHL2PMS4C2v8YAHdxWQ2PptFlhpB3k0ddqF8Twjji1VipZKfz/hN?=
 =?us-ascii?Q?3HFl9c8+XQN0sbIN/+IJmqwaPNLKV3i7/FF/MRnBag2fjGZ6vT4XOfjySeFw?=
 =?us-ascii?Q?C5LHlqbzYvsYh/uxjF/Crpd8r3xOd3XHAroBRAEvQNA6miHUEAHq2VuFy/6X?=
 =?us-ascii?Q?RzgUxQA6uxj2NMEyDsvQXxo2sumf5S7DrePQKdV3+CbzSg0Kliz5cWg4qGvz?=
 =?us-ascii?Q?VMJg98ZbL5osnjBxgqqaaALBXKg7Cpk94TeMBYlzE5qC5srYw12w4OFCfg0g?=
 =?us-ascii?Q?nDyVQBeHurfEr5jYG7ZCnSng8BL6V97ljUXJue/D/+ftkyRsb3P14nmMdb7s?=
 =?us-ascii?Q?xboI10IJGfDn74SvGtGtYph5wvN0eXLTZiIhankDP2BmXs1t7zCjdzCxtdQE?=
 =?us-ascii?Q?Fn+0Bytegbu8tRZlZzCgxc5DdM9fHudGAYHGWXKdY3QYSoI20ygGMlU9cdYm?=
 =?us-ascii?Q?22clphi2raQwMNLVSkKOxHJqaLp4e+ug+RFG3tV2km3+tkaKkU77qR12y8dm?=
 =?us-ascii?Q?IwM2rVTp8Y3WeDaQiNsh4xTX2lXNyTjasS5yX2CdOMnRTF/9ncQwL8LUHSF7?=
 =?us-ascii?Q?ZQg5KIqGEVeSDw1RYmOyjRfLGTl4haxlHtQO7QunC7SKRFauQvYY2f5fRyQw?=
 =?us-ascii?Q?J5DMAgZs+IOaa1PmeDpLg+56U4cgXlv4IM6V8qYpB2COY+MhMAPxT2gAE94p?=
 =?us-ascii?Q?ms/yPtmg1d2/mgLqqI3pstIcQR7AEoTsHGAE9yNExIGQE59lvtmGydG7jomN?=
 =?us-ascii?Q?NuAoSUsXuaj+4car9HPlrNE/uzBbEk1cSzWkUGeC0sBR1bqOnxXPl5hzV2Z2?=
 =?us-ascii?Q?KTRs9sBRReT8A9cgKr6wXEqkn+L+PwItfdtLY8enc4dYX69hIcnF+G4q+bfU?=
 =?us-ascii?Q?sMbOCSbXbVHfHm1l9sNunFLFjIAMW8k3LXgQfpxkYLSMYYuFXtLxTMEDGnE3?=
 =?us-ascii?Q?m77DcFp1fZ7IeIGIuxSFZnZYWYdSGUZvF+aaR+m6RyNBSk4RL7kgjs7QgMNM?=
 =?us-ascii?Q?nhw3bAf1T3zouZiv6pyQZK6VRfYqkii5YQo5V2nKaqDoN8KueFLWzlx6gHNm?=
 =?us-ascii?Q?/FvDFLbnD8cV5Q1ikQehiNw9djMoCGcqcHZxf3fQoHjIYj54D47mcDNGNiwt?=
 =?us-ascii?Q?ilN4WLDjpDB+bdX8SL/DAlT6xMFVG+TWMoDr9dIFr41zFqJUJBAvdAYcp0i7?=
 =?us-ascii?Q?K+lk0DdTRS0N8J22FUUUSAqWfCNvrRLFwsC+BzKY9X4VpVHWjSrQ2wy2ZOth?=
 =?us-ascii?Q?/ulWwI6VyeK1PDNuDw0MT4cNfI++US7tks/7d4hQCpRP7u3HsKotC7GS1zAp?=
 =?us-ascii?Q?pYarSqA/RIBNYJhvLtTPzNbX9Ff4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB7044.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9wqgesP7Eos5M89g4uj5fNBJsPblES9gaeo91N2SvmIeRzpHuRGTGMAD3rwS?=
 =?us-ascii?Q?PZHTU0o6ob061CDmsMHGaj+1UKt88IeA7ANRLBIj+Oie1RaLY0mUPQG/m6iQ?=
 =?us-ascii?Q?FD+dSIKXbJWfLL5FDkPiE+isPuMfQTpFb3o/yU6W6TOvoBFYSy95pnovhEM8?=
 =?us-ascii?Q?tCGO3uRE4ANVNHUovgUc1La/Jcv0W2nRxw9KAsLxsODasmkAt+RAIBs4wNvr?=
 =?us-ascii?Q?5rFDMQfwC6eK3vc8GaLUTVVnCE5Spwc8/Com5wlE5AtWXxb3gSdKSlv3V5ac?=
 =?us-ascii?Q?5/N645teSnUlYZlfugfogw649AwrVVhDvOjMIlnB1vV37uiNFx+DW+pB7cj3?=
 =?us-ascii?Q?loIaCupWBBWMB9fW7h32ktUdkBSkcDjatK+ClGRfQKyvP66eK3yhXwAdQpHp?=
 =?us-ascii?Q?l1kGKxL1UVyRLkTSyf8SXoPP5AvHUW5CdV7Ir1EAE4gOwWQggaXtX044gfci?=
 =?us-ascii?Q?29GF5LsIf5y9cdMqynJ+Kk2hQZaAB6NyLv760QcfumivqvkRl7D9UOqhL6Rc?=
 =?us-ascii?Q?G91b3awJtQp7PVKuhydapnRbSgltVXoFQWW0+CWIdtY5a828+WsyEnhhskLE?=
 =?us-ascii?Q?c3/EKMfBBgByE6fENr/LuyVr7X9OGiYuOgYUnFx5Lsli56YIYTejuGHymfHX?=
 =?us-ascii?Q?viCjlY3ZueOVPxfmbQOxOhZ2m70m/XHPIPO8YaofPKIsAtBb+TQEzw4dNuCo?=
 =?us-ascii?Q?fz7gtsoHjByfjdMSUbEyvn9Pf7kWFpFlVUAwXL4yEeWXIyz0EaEPbBN/IEC4?=
 =?us-ascii?Q?e6MV2gsQOWYtx1g5sGSeD4nukVuCwpVF5RbLG2EQKPGMZkzaeedjUTIyOEx6?=
 =?us-ascii?Q?QhzNTPvhAjOXV86VcskXZCjU4TJPj3lTWXgDymbH9cJ/RoNzEh3rG/PvHrr0?=
 =?us-ascii?Q?JB5XQNSD0kdMRwFTcn6lyH68AYAClCDTSqfqi7wz+OU9XlAszBkbk9N871mg?=
 =?us-ascii?Q?tYeAYCfpvlTPL/zvsAdQotfeUNyyKE3kLQnCLLpVDTtdfPNgbP7rYF++GdHD?=
 =?us-ascii?Q?ttDKSXKF/jEuqyTe7y+dqawJXOvCYJ9rTyijc07x1CXaZxCly0jz12Xz+re+?=
 =?us-ascii?Q?X6vpSHtZ3PRFEtEi92oo7zd1mL6Fe4yfcwzpdEEY/jZb0ZIj1Vx+vW5TBJKX?=
 =?us-ascii?Q?NV2dqR82c22rNe90DhvsQYGrCR4M6jZ4nCBiuNR1jgJ5zTSRcK0FzAKqRP2S?=
 =?us-ascii?Q?uvM7stylY+TnYME3F1ms3v7sBxHyqATjmLt3X4VSZYcZBtlEJYmueTKXGcoG?=
 =?us-ascii?Q?9sklpoj6URyn2ikxVKlyDyFyxAiQkg6iTeMqNV289vOjNwkVeswHD/Oq3sps?=
 =?us-ascii?Q?2cDISow6U6aDHNJ/Mnjgw36DGGGjUZ8pth/+HsqIygdQLHp/KS7Z/yaGzHHi?=
 =?us-ascii?Q?bohM7qdpMFQHeo3uTiCsSKr35T3PwQaN4JWg3cflT4UQBVnPjxObUVLMp90d?=
 =?us-ascii?Q?S/TTdq8EPxEGPuHa1byXkH7wcUVNFBfR26HS59Fdl9oC+vgp0+JQT7SZlt9Q?=
 =?us-ascii?Q?j0SI3QvPs3HwEsrgzvdtbqHX7NBgns5JZajAhDYvBq9SlwyAyq7m8B6cSk2M?=
 =?us-ascii?Q?2ysUKHbW5pyJ/u20Ej3P4B50B4dxjZ8mUxd+d3vp?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f808c7c2-06bb-41e4-8582-08dcf7beeebb
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB7044.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 02:11:00.2858
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 LVatfpwMWLosCkuhNtRT/wq7uExptV2yQwUeePD2CgUENzxw83uAR/IKPuRU4xw3z5DaMIYZT+x8yJkjriOuYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9147
Message-ID-Hash: UZIZVUGYXYG2LUD3ST2XGQMQS5DYD32U
X-Message-ID-Hash: UZIZVUGYXYG2LUD3ST2XGQMQS5DYD32U
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UZIZVUGYXYG2LUD3ST2XGQMQS5DYD32U/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add 'pcm_format' for struct snd_codec, add 'pcm_formats' for
struct snd_codec_desc, these are used for accelerator usage.

Current accelerator example is sample rate converter (SRC).
Define struct snd_codec_desc_src for descript minmum and maxmum
sample rates. And add 'src_d' in union snd_codec_options
structure. These are mainly used for capbility query.

Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 include/uapi/sound/compress_params.h | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
index ddc77322d571..bc7648a30746 100644
--- a/include/uapi/sound/compress_params.h
+++ b/include/uapi/sound/compress_params.h
@@ -334,6 +334,14 @@ union snd_codec_options {
 	struct snd_dec_wma wma_d;
 	struct snd_dec_alac alac_d;
 	struct snd_dec_ape ape_d;
+	struct {
+		__u32 out_sample_rate;
+	} src_d;
+} __attribute__((packed, aligned(4)));
+
+struct snd_codec_desc_src {
+	__u32 out_sample_rate_min;
+	__u32 out_sample_rate_max;
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec_desc - description of codec capabilities
@@ -347,6 +355,9 @@ union snd_codec_options {
  * @modes: Supported modes. See SND_AUDIOMODE defines
  * @formats: Supported formats. See SND_AUDIOSTREAMFORMAT defines
  * @min_buffer: Minimum buffer size handled by codec implementation
+ * @pcm_formats: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
+ * @u_space: union space (for codec dependent data)
  * @reserved: reserved for future use
  *
  * This structure provides a scalar value for profiles, modes and stream
@@ -370,7 +381,12 @@ struct snd_codec_desc {
 	__u32 modes;
 	__u32 formats;
 	__u32 min_buffer;
-	__u32 reserved[15];
+	__u32 pcm_formats;
+	union {
+		__u32 u_space[6];
+		struct snd_codec_desc_src src;
+	} __attribute__((packed, aligned(4)));
+	__u32 reserved[8];
 } __attribute__((packed, aligned(4)));
 
 /** struct snd_codec
@@ -395,6 +411,8 @@ struct snd_codec_desc {
  * @align: Block alignment in bytes of an audio sample.
  *		Only required for PCM or IEC formats.
  * @options: encoder-specific settings
+ * @pcm_format: Output (for decoders) or input (for encoders)
+ *               PCM formats (required to accel mode, 0 for other modes)
  * @reserved: reserved for future use
  */
 
@@ -411,7 +429,8 @@ struct snd_codec {
 	__u32 format;
 	__u32 align;
 	union snd_codec_options options;
-	__u32 reserved[3];
+	__u32 pcm_format;
+	__u32 reserved[2];
 } __attribute__((packed, aligned(4)));
 
 #endif
-- 
2.34.1

