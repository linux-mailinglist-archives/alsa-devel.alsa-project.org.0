Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1E09472DB
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:08:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8219E5A02;
	Mon,  5 Aug 2024 03:04:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8219E5A02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819903;
	bh=CfKC7ucYZUgmhH9qqQ7MrhL0Yz+WS3M7gXpn3TRIyL0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bMGcA+8LQVWyOXgtxjCi23E4h2Nxnllya64CTQut4JI24OyU20Rt8oDlPdCNCzlH2
	 ThdQa+2J1tKImEZLdhWwdvYPMYujrGVgar+8Ozt2IKfypKp3mO+PiqmSfOEzxKcUJo
	 SqKntAUS8gwpFgCKA4GFDxTh8B6fm5NO6U2RhXSg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7FAD2F89E5C; Mon,  5 Aug 2024 02:43:33 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 99656F89E7A;
	Mon,  5 Aug 2024 02:43:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16B54F896F9; Mon,  5 Aug 2024 02:43:29 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id D6A74F89E4B
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:43:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6A74F89E4B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=SAmxFpIW
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RpKuET4/u/j4GSvENMSHpMmR0epsGZFcW1DuYbywuhHcVMdJOk109EjUch/Qhnj2QxCtGPw6jNVUYgQBtCzLYKhIPPi2+h2gK4t1pQ0YoS2fW3w/Y6JmqerWrDhgN50i3PdSwUXWR34upqCQHSsUFnXKzqpTNTO4RTiZndDNzePyyGWVnuBidg703HP6Z1JYy+7t0V31yJqItUWlv7pcV1Mxu/bEWZ3ncYgZ2mwHJf6snsT1e2Y5IpMsdLeo5KjRUpaYwXqNbCxyXy9Rbqx0o2X5QBqmj9dNpfFBN23dauW4x2ijCP40svljuEH7I5twUK/zQTQxGiTmexz2iovvYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+AUjMNrMae3oBTS1wVIBv0t49HWKpOSxadA4q1tB/jU=;
 b=ypGFVuP2jzwu0LHzDWA7HF4ydVJGHu9nOvYy+RTioeXX8FqNvg2kJp7m2waxFlkesC6CAco/gBzudn0K1iQUfNNJo7X7qq4ubDZnSQbI13DJO4g4i0kGxmVNirpX6/8qSBWzDnUghvzCGrq7B8ZkvPcvRuJuT9Sl5pxCItC5N9+0oZlpR1cuzJOkyi+LBqpodDg7VLTXEhctICJJkhR9KxPKo02kZoyjvvIr1g+YZ7cmLwSGUwvHWv8tZcH2XRHM6P8ZYu7atMO1CmoW3WsDvaFDF0E6OX11tH95fC0HqqNFSP+K301SCAw9QDGIkieQ9UB3oMPpPRcok/gOgWQ0sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+AUjMNrMae3oBTS1wVIBv0t49HWKpOSxadA4q1tB/jU=;
 b=SAmxFpIWff9x4TTOefu3cDzqzzsSxhz9AbiGW1T+2fl7NiJYXaam2VjuEaMAtCo+hiPZoM/Rm4Xo38d62zlJ3Muhnn2GSZPbTkWJ6IiEdz+3IatXE3qIMDTh6uAn5J4Tr8cu2N2l4agCM7Aii5OATJe1MJWQPa+m/eFBgruyLSU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB9685.jpnprd01.prod.outlook.com
 (2603:1096:400:221::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:43:24 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:43:24 +0000
Message-ID: <87a5hrx0ib.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 096/113] ASoC: codecs: max983xx: use
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
Date: Mon, 5 Aug 2024 00:43:24 +0000
X-ClientProxiedBy: TYCPR01CA0088.jpnprd01.prod.outlook.com
 (2603:1096:405:3::28) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB9685:EE_
X-MS-Office365-Filtering-Correlation-Id: ccd502e7-b2c4-4936-2618-08dcb4e79d27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vgBj08hobTSgj+X1898VIXsag/bbmX43fLfkzw6q6nMKZHexlfcKlf2VvsPy?=
 =?us-ascii?Q?LPbXVVJnhqv0PbOBh/ugWfYR1LJ18y9l/tyKaX3xu1O3N9gc+V01SNthpZLi?=
 =?us-ascii?Q?ADv4vo0zx2uMogMQoj0t2qsEwXxmqFzprwcBij8F34EdNaHth/bVf8rlpkSJ?=
 =?us-ascii?Q?qyqUqJM10FXQzQMfqJCEmGO3tIdBAQtf8EmUn4KdN0VL8YKDKH/pEqJ5eI7G?=
 =?us-ascii?Q?98V6DyoDO/wn/1onzd1u61fcPhiQXt6SfPw5pwMIT8YJ2XpNASPfrHwAi3NI?=
 =?us-ascii?Q?nCW+whTWg30pfoQk1lLtsxJR4YK2lnqWGRNMtA7K4Gt5G7gAb6P5CkWpJdJq?=
 =?us-ascii?Q?arYdCV/IH07On3UN0mkwLE/K22wejtI9JGMBV4GCyPvoeh5axAjuHhPKxJhx?=
 =?us-ascii?Q?0FCu38m3dquoXIA1AsrthZInloAeXAod7XfdyPG3nMmqNjDaEUqIWF33RMvt?=
 =?us-ascii?Q?Thp0ne+0rdHto/PFcx6rKVf9Odql+FM4hE/2T2PUTYeoiv16m+39AqZ5sv4/?=
 =?us-ascii?Q?ljN/HryO8CTCLhAemHXfbj5FeXs578Mx8VZH0xFggXhz9LQwh16U6UnbnoD6?=
 =?us-ascii?Q?NYxRA9K6vhj0CksyKmNdnX0wPV0nKvP2DrIvX13A40YPrXK0Ep3k+FhAf60l?=
 =?us-ascii?Q?/kSneaAKifSl9Wpd8/OeZonhI+N9Chh9mIVIf3FHcX47f1AndocGzvST9Gea?=
 =?us-ascii?Q?V5QVU/gSiwfpvbQKaoQ5ckXUDo5x6U5p2GgfR8N/zXwmWOq2w27ypm7/bila?=
 =?us-ascii?Q?Oiu8tbWCB0mIjum9FSHTnEwI4wF1kGTIixAWyOMST4/C3GLGLCHb4S37FHqQ?=
 =?us-ascii?Q?zYHW00Q6WEgx7NgG6Ps/JbiMyucvmvzra0lM3cH+MrjsRBAZZ56mGNoQflGD?=
 =?us-ascii?Q?q0GjsCE/jqjeJGWUfdMZlEJqtb9hY1DcCTcXCZYNKFYFgZ/f+RM1ETiL5rrp?=
 =?us-ascii?Q?Qr6XP+AY7aa+sRbPXyO3rFh2h/R/0QOiYhYqJBo0zIHQDUe6Ps7WR4Il9M1a?=
 =?us-ascii?Q?Db9uyus6ds+r3270gdwQx87+OAJl/Sh9Bf2xMIqpXeossLB4nDJMvipsoeZc?=
 =?us-ascii?Q?apjPztHwcsJj92TDUnmGDiANZn+wo2kGs3WOKsDvG8viNprNdkHsJ+tW3ArK?=
 =?us-ascii?Q?rEHTZr2lH1IT1+ZOGja/hJeIL4YylQIkSsBtX/xRyNVwgXsJRKzXHIsF8x+4?=
 =?us-ascii?Q?M0r/gHU/GheOGZDV8UCsgoCNS9Cp8RCLn0Bp2IVqay+b/EyPn23VMXJEcJ0Q?=
 =?us-ascii?Q?sUJySVJAHn68JrBMwRnrivfZsEt1xLt+9ybzj3yGPxZsMOq7K6qS1Jpj5IA5?=
 =?us-ascii?Q?DJYtbTakYfzzgVVS5VjWs1rrAk8OiZoDgR8rcAKFKDm0JQbEFY9VBpXN5UV9?=
 =?us-ascii?Q?rDF2oelbKxlquvSLCu1Zb9nv7GlhEdD+TJt61I1mAtu9cd+B/w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hLUw9oJf2t1bhfiUt2VOHin8d5yO4QyO8Wc/ojp6DD0bzAWj32UcdQOvkagr?=
 =?us-ascii?Q?xxvyYmI1uBUTCSZTyHs7QlbVOw67wFSK6DU5N382I8u6e+/F99NgRLRw6DUD?=
 =?us-ascii?Q?R5zOgbf1YngTTKqcvAfraWYgxnEacwS5t52OYoKhlWMGAywEOtDYwStoirLx?=
 =?us-ascii?Q?t9l69kitOJQgQfj8MzyxAhxTJpymJZHzXFcKEZZfgmPcjg7yVynBr01KEGpc?=
 =?us-ascii?Q?b6zQsyJJfBjWgNReiax11pKyLTtyW7OAr/KHLyF3wY6fNOPP3Lpm0WyPhkgF?=
 =?us-ascii?Q?VoO7UwtTl7LWsY7rpPEaxYNytDaBb0YxIEhI2W+e9Ke8LEVctV6Yd6yMMhGE?=
 =?us-ascii?Q?kkFnRB+S8sDjMmaL77i0HFOB10e1UGa73tPCJsSU2Y7NYIPIwzsmcy5LSlvN?=
 =?us-ascii?Q?J9+Tjq+wNtS810fu6dhQiFgyOhar4OJIXj1oUCTwSHWNZPIYtO42OAmCSPva?=
 =?us-ascii?Q?xrcAqiaTeSkZwXIuWTJpGojCd2XQOOWtQAjPfxqgl3rKnVMaqSzWyN5hOHZm?=
 =?us-ascii?Q?TPds56eqKgMevLhjwxeLBM+lfvia8xo+BVZXDAxRVQXKXLZC57hyLyWNyhUq?=
 =?us-ascii?Q?EaYlbrrZd5rk8cEqf2qVN4RdqRa2hcWK6YdhLUTd5lS282U/QYxM2bfZwJZX?=
 =?us-ascii?Q?jEg0CMmfAb6OMNchbF/Pa4ejW98Mb8D/Czi0KJ9nvnU9PcpARM6RtN8akBDm?=
 =?us-ascii?Q?sSrrc79GnNY5suySG8iTjqFF6WOHK8wuiovHXhjeny1Yh4A03zzyM2SARrCI?=
 =?us-ascii?Q?MUDKV5QaSWp/DW3NXYn1T4P30zALl3cNZUB85+O+EFTnl2Ae9STUUHg8+cZE?=
 =?us-ascii?Q?nFIDzhb3VlxKfc9QeZpI2DCVhd3ATg+4wknfslZgRag10ybJp/eNtw9C1cs0?=
 =?us-ascii?Q?B3DEO9vUv9k8Cb056yPeEktUrxxyZ/1GXSASWskBJaRUPAkR+Md2V0bzTIDV?=
 =?us-ascii?Q?zXG7VfDmLvzs0qNYzrhye3LcOPs4y/YxNihQCoRHglXASL6NHtBRO7T1GAJL?=
 =?us-ascii?Q?BaoJiBqFuS5nawXrD3CuURG11Jrd0g47gpE37wYADM7DPPD8UY+DQdDjtK+7?=
 =?us-ascii?Q?1DlU+X6vyNNLQjXuJzitfpI3pXC6bwsqovxizgshOtCXWRo7cD+9gxQLr2Eo?=
 =?us-ascii?Q?mMnB6HGVJTd2QU0HOvVP9JGwIGOLX1X3MdX5DZ3wtIqT/p5B1v+9yFrjV8iE?=
 =?us-ascii?Q?cUGqO4dN1OICDJlC6fKV47WIHKyKsehaDMjpeWfDuKHrRfyM6+NCsWZMWj6e?=
 =?us-ascii?Q?UxK4HVSQEOIES5KhA6JkDQ9ZboxO2hzVeZk/3T+z0hYiiK+VYy71wyIMxCH3?=
 =?us-ascii?Q?KsQtzC/n/mpnOeYHfXfvXDga7LjREt3StbtAjSYSQkkEakZLieya1MVvgrS2?=
 =?us-ascii?Q?TRpfhpl3bSF/3I31UiwM3RoTDHaEDvM8xSHw3RgRoPe0rR/5OJv2eznFR2x3?=
 =?us-ascii?Q?3qfE9fOHUGJL3RsCdf75cYHk+hi13gPjKdnJonNMwZW0XaGQ1a/4diZrz+ys?=
 =?us-ascii?Q?khAronlwmYbq+UunOKVLuB5AXPlotR8vKtGxB8nT1i78YobnWEWmcjogD8eG?=
 =?us-ascii?Q?KLoUgaQi45LUH8FYDvpAM72A8uYhHMfGEpCs3X6ghyh+9NlZmCgpKjNa+rdp?=
 =?us-ascii?Q?jLOA4wGgj6CRKRGdeLDTpfM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ccd502e7-b2c4-4936-2618-08dcb4e79d27
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:43:24.7408
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 Tg1/mGSuuj2EH8e8ZwBuUL96lxY6zO7xtZomb6+8jj38KUTo+d5fUZouAacHgbkPx9JXZcC6QLDFguTpWmPK54LXUN41ORJGZEj+bMgo3PFtfKirQtzw099wnWEJIeHh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9685
Message-ID-Hash: Q4MS4BGIBFFIO654OL4KHGNAQNZYABSO
X-Message-ID-Hash: Q4MS4BGIBFFIO654OL4KHGNAQNZYABSO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q4MS4BGIBFFIO654OL4KHGNAQNZYABSO/>
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
 sound/soc/codecs/max98363.c     | 2 +-
 sound/soc/codecs/max98373-sdw.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/max98363.c b/sound/soc/codecs/max98363.c
index 950105e5bffdc..5ea6b36941355 100644
--- a/sound/soc/codecs/max98363.c
+++ b/sound/soc/codecs/max98363.c
@@ -221,7 +221,7 @@ static int max98363_sdw_dai_hw_params(struct snd_pcm_substream *substream,
 	if (!max98363->slave)
 		return -EINVAL;
 
-	if (substream->stream != SNDRV_PCM_STREAM_PLAYBACK)
+	if (!snd_pcm_is_playback(substream))
 		return -EINVAL;
 
 	direction = SDW_DATA_DIR_RX;
diff --git a/sound/soc/codecs/max98373-sdw.c b/sound/soc/codecs/max98373-sdw.c
index 26860882fd91a..531c67023f922 100644
--- a/sound/soc/codecs/max98373-sdw.c
+++ b/sound/soc/codecs/max98373-sdw.c
@@ -534,7 +534,7 @@ static int max98373_sdw_dai_hw_params(struct snd_pcm_substream *substream,
 
 	snd_sdw_params_to_config(substream, params, &stream_config, &port_config);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		port_config.num = 1;
 
 		if (max98373->slot) {
-- 
2.43.0

