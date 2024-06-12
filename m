Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A04904B4E
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jun 2024 08:05:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8C45C9F6;
	Wed, 12 Jun 2024 08:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8C45C9F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718172353;
	bh=Sdd925GnaWtulHOIQbrbeV4+oZkYL3aNFymK47iC38E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Gn16EDdNX4FsydYRqJHn1u+9UARoUs1LFgrxUKdF61UlTl9xAh//4fpZ5fNf20cNc
	 QJ/a5F9zZPjF0J4fNjYqcqFgyRnd96rhfh5WwpQZCYGCMgGdVRMYnKkbvFCdrp5VDH
	 xiPR9M6lRKgwUro79MLctIFgNzGqN47E86YSrP6w=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 758C6F805D7; Wed, 12 Jun 2024 08:05:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C9F7F805E2;
	Wed, 12 Jun 2024 08:05:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56E28F80580; Wed, 12 Jun 2024 08:02:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20611.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::611])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 635C1F80578
	for <alsa-devel@alsa-project.org>; Wed, 12 Jun 2024 08:02:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 635C1F80578
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=oiyk8OC7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PFPSfROeu70kzlrYl+TUy0rwZOu7YHeiNGjcGpesBP+zNDjnxjxiAtkR0++RHngUNAEx+r4o+BA+plNqQup+9wguCss3Bp94i2enNFD1QTWC/dH4DCJNKRG4mAI/r2mSTOAHVSAFrbLoT4O4m2u2fRoahk4T94IsOuHUj2eyTs1Lod21xM2obnanCWFZ/FHvcr+lzL9dS5KT05r20RkU/FjFHnazm3TO2jL4kp/quHoFE8/XYaFJuKT4aCJ6iDV4InzCo52b46ICbHbOEefR5Yh4BSvoyDkDOLcq8Eo/Coy9bnXRP2j0SKxL3xutiXGP++jNsH7NZnFOyeu/eFqqrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiYl7d41HDAbIrguH0qlm3Y73PIq+mA7LAU6aGRR/Gc=;
 b=j5qFb1vHOHd3P5RjMd0gdUlk/a3pkZMGOg7vkwr1+ruxe0Ts8+KLKtzMw2ZX6ayNUOo2s/m9T3H6gOm5JEEu6XWPfA81WdQ/N5efuOuf2FWZ16kBiGFXQ0UsDO9e8I5jqjgMHvFTPwOvhDij1xN1YQbiPMvQKMT8EHkoJ0W3z0qU65TxOp5AhbYbbAib7sNcSFsVd0ojAxYLVu0IzIMElJluVdL3H4qzrlNZDWvuadM53336O+iZLX1SWcBuic5TFCMnMgMfepEjNDHxbY4UGzTJIYUIL5uBalbJ8PhMFCqL12s1KREpVqk/l7oeiAeqFYpPS2llp97flvdQw3dH0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiYl7d41HDAbIrguH0qlm3Y73PIq+mA7LAU6aGRR/Gc=;
 b=oiyk8OC7DemS+gKIvzUE+3XGK922ed1wpmK05H0cniiEMjv7YA1/XHMEiJS7ndQPOhiHrRI5yg0ynkCtE9H0KIz5toMeoJqdblKrAF1PXQmZ6VvTnQ9GR2fdWHSkajES6E2SDdRznLa+mz2rcNIs+ytXC7htTRx+OBi1fsOxQ5Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYWPR01MB8904.jpnprd01.prod.outlook.com
 (2603:1096:400:16c::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.39; Wed, 12 Jun
 2024 06:02:33 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.019; Wed, 12 Jun 2024
 06:02:33 +0000
Message-ID: <87r0d2zojq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 2/5] ASoC: simple-card-utils: add link-trigger-order
 support
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <87tthyzokk.wl-kuninori.morimoto.gx@renesas.com>
References: <87tthyzokk.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 12 Jun 2024 06:02:33 +0000
X-ClientProxiedBy: TYCP286CA0196.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::7) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYWPR01MB8904:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f515733-c1ff-491d-9fb2-08dc8aa54060
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230032|1800799016|52116006|376006|366008|38350700006;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nHPyVK7696YDwYnRcqLDrMRZ8PFxpg9vYIHdWtbTSAoiHWPWTq0ZQv14tGWr?=
 =?us-ascii?Q?NtJyhc42840MGbnQNk3d4NtGVXo0Zck0CHXIxs2yvHRruFDupHyk6RcoChXG?=
 =?us-ascii?Q?CuWkoqBMlYu3OJkvKS5oGEzeIYOzLsqy4YOuU4iXhrboNG8lJve5JxNeFCAS?=
 =?us-ascii?Q?fIOXJfdt4UC6vX9oXKro3QHDFkIFUrBOFNTZc2LDTADmHDpItj5liOzs4eiU?=
 =?us-ascii?Q?jqk5z3fCCLUUko/RE2oRSo1jBHYVmFLA5+JVQw3/t+5qMn3YXwwfbh4uVlmo?=
 =?us-ascii?Q?sVYD5u3hgXttvfv0Vt7hfeUQbpvEXe1PGwcqYWZvYPlyVGEx6XphcnDRvZ3X?=
 =?us-ascii?Q?/lm8fUh0ozJ+5HgGsiU7KxDXw/U1tVue2cQJq6fy8nmtReJ7pip7EKKDZDcQ?=
 =?us-ascii?Q?mM/JnMdybDrEAa4IZyJLo8Bb+Uc8H6IBgrLroVaTqcLszTZTwJrEQyUo/HYE?=
 =?us-ascii?Q?9nQSWhnfhwtMbDJcS5iy4NIVqHROu01x3+iRAGQ9sPXt/Xsp1rBpRdbrSS+7?=
 =?us-ascii?Q?L7/ivB5a03qVhYSebdRCnY4YOJh9QPhkE16JO8xW10Z2CMLTWAW1LOYOt6TK?=
 =?us-ascii?Q?OHRYN1xtzK479nLx+iTgBh124nyapgaMo+bITT9AE3/OzlpWXSTylbyMrYye?=
 =?us-ascii?Q?vQTldl3tfMtqQJYIWpnQdA1YTaP59epl1QoVuptjWIsmYxaxr1Vx299V6hZc?=
 =?us-ascii?Q?LFSdlLthMD3vlFn+IlXKzQA2DZF81qxob3YzQcPbW0u6+0CjiWc3lt2WOX2W?=
 =?us-ascii?Q?hCOPXKZ9aNb7GBpog/msH6XS8lknUVZNSlajkANHAywQ80a//t23D9hv3xmy?=
 =?us-ascii?Q?c06CCTAfAfdriR/eXqDbAKoAgYm+UHzDxuiHMVnQOP7QVBGkDTR0musw7aeJ?=
 =?us-ascii?Q?UdVueE7vO0B6HgMYYNov5ZApoNcNIWQeAFZ0ORJ/GS4f8DBMP0DIQ1eKnhaw?=
 =?us-ascii?Q?IgkYlOYi4571ecAVv8nmGTOpPk8r+dDuSHYT7zcaGb8ZQynOgIxkqG8R5qRY?=
 =?us-ascii?Q?QgrIkT6WA0ChF1m2wy9TATsmPeCJsctEd+HXxOEhw3cDgeAPc3eQBGkyYK0W?=
 =?us-ascii?Q?AV4wzziyGGJzl4eEzloOk0NwZHNJ0hgyzttIeL58aYydjzY1z5LEzpeh1Vwj?=
 =?us-ascii?Q?F163ShBLTae30i4D+L0SwFMkfhOQ8AZMRVB5iDcEYHfAiEspkpt6wtgmdY1y?=
 =?us-ascii?Q?y3agxIi7525q2Z/XIvx1uGBBsVoGTqOE/lEYs74fkeDptnAWAgHr/1bBIbBk?=
 =?us-ascii?Q?tuQesCYK6SPVS0tApOcGO0GW1fB2hOea9mqsailJ/byutq24LK3lLvPhIyNt?=
 =?us-ascii?Q?+P36tVFBJW9jBeWKyuKvRhNYPZz1c0jQHblDHAGEG67OKzqVeaJvEmK4ufcI?=
 =?us-ascii?Q?0RRxW8M=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(52116006)(376006)(366008)(38350700006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?b22dcz9UsyDV7QZ6llVGr2U3C3GYXh535yR2qHGG8LcE1Y/QWNnx5uuZNX3Y?=
 =?us-ascii?Q?mVliZ75kDr9T7L3C42IwiRO6Sjp/GBdzuO6/MopeWwdkrtkDs0iEgS5pzq3n?=
 =?us-ascii?Q?cMuwoNEZqL1CdTDDdjPxqUZuyxM+m5b6qnk4pd3xDA5BLfwudI3xnEiSA1zo?=
 =?us-ascii?Q?ZilFJC245OBmBP08nZbv5/bWD85BcR4ujE4qm0FoNIlPCx+HCT+7DtSG5PpY?=
 =?us-ascii?Q?Khm9Shwy448MZ2kaC27EP0dUHtW3XZxxhxmt4ZyVAL18SAyMPBoafFRjL+2p?=
 =?us-ascii?Q?ktccW1foGRFN2+TiFj0/6/vIX856y7FTLBgULRaTC7f0/NTqy9diveUCbbpC?=
 =?us-ascii?Q?sflNyjRhREjS9rIrwTiARELWrt5gQBbJYyJt+Uzyf3NuiTV+CUd4jXeV5nb9?=
 =?us-ascii?Q?H/v1jwVnysnZyrxgDKzftOdMmJR/0qYmPTsfIDaaZg46mgW5FEuCMDbF8LH7?=
 =?us-ascii?Q?k+C2pkFOrPMfbZ6lVHUYwPTjrji4SmDle/AIfHzgreT87o2djzXJ3M2Nj6X6?=
 =?us-ascii?Q?znWhmZg54yumLY4cbMGoOWEf/LA9Q8dPMh/P52xflhRQg8wjD7Vm/mjWR7Bl?=
 =?us-ascii?Q?8PW1wzLsmFKJFZLDSqrzxNbj9XamW1EpMT+VLxD7SDwAPg2e7XtDsckB8qVh?=
 =?us-ascii?Q?seBBrUNXB1JlAJQnybvgQ+EsTjLrisWDwJJjh3BPyBR6DesewHrodDf+ePO5?=
 =?us-ascii?Q?+4rslRDE9nBMgyTstNsut1XGCnktaYsjhD1NkMuoKCKIV/Yfs6cw8VRdD2bO?=
 =?us-ascii?Q?smrp80zG0xUWphsdHqfTO9tNi09KjNk7SNks6LZ7ZRAx6Izf+DpMedxszXm5?=
 =?us-ascii?Q?TVuH66V4pV9Zb1QN4YPSEFP0jWnVYRwb7bf0IP7A2vFJRyjrKbsFMgYQ/yvt?=
 =?us-ascii?Q?eo1AedLJEmDFjI9uc1UfpYRYkicbOCH4Bc6HcWlHtcE9UPXPMQ5exRd1x0pR?=
 =?us-ascii?Q?S00REQOprY+3v/Uf36sdr5t7ZW3TKXo/QPHgOdLTW23jkrRYd1EnWh0+TmzA?=
 =?us-ascii?Q?av9ODeRbFaAwr04A4qpUGSdhomNf5g9bn8saVV967uF1SI3X73kaQEEDSnaC?=
 =?us-ascii?Q?xcHpLo43Qyy1FUzwwFUnlZgAIdv3IrXo2JAm8HFgZevs8uMUlscy3yZ0BOh2?=
 =?us-ascii?Q?F7Fr3fIQJSHTm7G9Xa9XeoVJe152f80ueXC7dI62/j8BwVoDZV302DoyMhMg?=
 =?us-ascii?Q?F/3ouN+TDs6TdBGRFugrXWlKW6S6t5IMFOCAKYljibBIHEyoxOdCvmEjSez3?=
 =?us-ascii?Q?Tla1vDgG+oVSu/WqWrjm+cw1lshvtLYIrFylwHRYEmuH1b1tx07OKblgkOEp?=
 =?us-ascii?Q?PSp2FwtVAOtLCTDpljUB74uPF37US8X477e+edP4MAt7xzh+ChS6wlDOeF6A?=
 =?us-ascii?Q?4sYX3XpJTPfkdg+ZreoYk1cSi3ZoJGYXDOvZugIAYrbPMjvUJYXqrCwpa28V?=
 =?us-ascii?Q?Lx8kWdnw7v/bXSRHgGYtqkBqAsA8yeggpyzG+BSa3vvgrQlrwetVB2p9nrdp?=
 =?us-ascii?Q?vrLi+nrMQ8zEvujdgBPkUYRtGcTVucCpZyV6d0F/g/bG4ag9bKf2K+NSIpin?=
 =?us-ascii?Q?r74cMTGbWutKHWgYl0alXeiRILU1vO76NVa9gqyaQbMeLEy2d73az1YeEo9A?=
 =?us-ascii?Q?S8UFDN9OVe+oMZobq4T6UBk=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8f515733-c1ff-491d-9fb2-08dc8aa54060
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 06:02:33.5387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 vtvctE8WMXark+7fweCjCBxi2rcjviN36DSvjSMLMHGnbsNGG8AelDG6t97ZFVBR23Gc7QkUWmEYtmLhqVgsxOP16SEuqD1C59uzf+lBgd7mWiQiHL6roA3RMK062Grh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8904
Message-ID-Hash: 5IJAN4QLFHPBN7D5AEM6XTSPBERKKNJF
X-Message-ID-Hash: 5IJAN4QLFHPBN7D5AEM6XTSPBERKKNJF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/5IJAN4QLFHPBN7D5AEM6XTSPBERKKNJF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Sound Card might need special trigger ordering which is based on
CPU/Codec connection. It is already supported on ASoC, but Simple Audio
Card / Audio Graph Card still not support it. Let's support it.

Cc: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/simple_card_utils.h     |  4 ++
 sound/soc/generic/simple-card-utils.c | 71 +++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/include/sound/simple_card_utils.h b/include/sound/simple_card_utils.h
index 0a6435ac5c5f..3360d9eab068 100644
--- a/include/sound/simple_card_utils.h
+++ b/include/sound/simple_card_utils.h
@@ -199,6 +199,10 @@ int graph_util_parse_dai(struct device *dev, struct device_node *ep,
 
 void graph_util_parse_link_direction(struct device_node *np,
 				    bool *is_playback_only, bool *is_capture_only);
+void graph_util_parse_trigger_order(struct simple_util_priv *priv,
+				    struct device_node *np,
+				    enum snd_soc_trigger_order *trigger_start,
+				    enum snd_soc_trigger_order *trigger_stop);
 
 #ifdef DEBUG
 static inline void simple_util_debug_dai(struct simple_util_priv *priv,
diff --git a/sound/soc/generic/simple-card-utils.c b/sound/soc/generic/simple-card-utils.c
index dcd0569157ce..a18de86b3c88 100644
--- a/sound/soc/generic/simple-card-utils.c
+++ b/sound/soc/generic/simple-card-utils.c
@@ -4,6 +4,7 @@
 //
 // Copyright (c) 2016 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
+#include <dt-bindings/sound/audio-graph.h>
 #include <linux/clk.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
@@ -1156,6 +1157,76 @@ void graph_util_parse_link_direction(struct device_node *np,
 }
 EXPORT_SYMBOL_GPL(graph_util_parse_link_direction);
 
+static enum snd_soc_trigger_order
+__graph_util_parse_trigger_order(struct simple_util_priv *priv,
+				 struct device_node *np,
+				 const char *prop)
+{
+	u32 val[SND_SOC_TRIGGER_SIZE];
+	int ret;
+
+	ret = of_property_read_u32_array(np, prop, val, SND_SOC_TRIGGER_SIZE);
+	if (ret == 0) {
+		struct device *dev = simple_priv_to_dev(priv);
+		u32 order =	(val[0] << 8) +
+			(val[1] << 4) +
+			(val[2]);
+
+		switch (order) {
+		case	(SND_SOC_TRIGGER_LINK		<< 8) +
+			(SND_SOC_TRIGGER_COMPONENT	<< 4) +
+			(SND_SOC_TRIGGER_DAI):
+			return SND_SOC_TRIGGER_ORDER_DEFAULT;
+
+		case	(SND_SOC_TRIGGER_LINK		<< 8) +
+			(SND_SOC_TRIGGER_DAI		<< 4) +
+			(SND_SOC_TRIGGER_COMPONENT):
+			return SND_SOC_TRIGGER_ORDER_LDC;
+
+		default:
+			dev_err(dev, "unsupported trigger order [0x%x]\n", order);
+		}
+	}
+
+	/* SND_SOC_TRIGGER_ORDER_MAX means error */
+	return SND_SOC_TRIGGER_ORDER_MAX;
+}
+
+void graph_util_parse_trigger_order(struct simple_util_priv *priv,
+				    struct device_node *np,
+				    enum snd_soc_trigger_order *trigger_start,
+				    enum snd_soc_trigger_order *trigger_stop)
+{
+	static enum snd_soc_trigger_order order;
+
+	/*
+	 * We can use it like below
+	 *
+	 * #include <dt-bindings/sound/audio-graph.h>
+	 *
+	 * link-trigger-order = <SND_SOC_TRIGGER_LINK
+	 *			 SND_SOC_TRIGGER_COMPONENT
+	 *			 SND_SOC_TRIGGER_DAI>;
+	 */
+
+	order = __graph_util_parse_trigger_order(priv, np, "link-trigger-order");
+	if (order < SND_SOC_TRIGGER_ORDER_MAX) {
+		*trigger_start = order;
+		*trigger_stop  = order;
+	}
+
+	order = __graph_util_parse_trigger_order(priv, np, "link-trigger-order-start");
+	if (order < SND_SOC_TRIGGER_ORDER_MAX)
+		*trigger_start = order;
+
+	order = __graph_util_parse_trigger_order(priv, np, "link-trigger-order-stop");
+	if (order < SND_SOC_TRIGGER_ORDER_MAX)
+		*trigger_stop  = order;
+
+	return;
+}
+EXPORT_SYMBOL_GPL(graph_util_parse_trigger_order);
+
 /* Module information */
 MODULE_AUTHOR("Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>");
 MODULE_DESCRIPTION("ALSA SoC Simple Card Utils");
-- 
2.43.0

