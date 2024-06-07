Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC968FFA62
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jun 2024 06:19:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9345A828;
	Fri,  7 Jun 2024 06:19:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9345A828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1717733990;
	bh=ci2e8BhC06wNWgK0fAI1KKHphl1PBB/WgtgVi6i4VGM=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=kW+mj0dS25nq+RAOOD3AINDCxZbOzaUS3f/PDyz+8jgInowIT8wDPVjX6SrVu06Nd
	 E9SU8BSw9AOxL+fZVj/FvX30d+uJrbTa7YhbOrGe9ES4Ds3os1YtEk9L51Xjeq2uBE
	 pc+p6LveE31B510IjuqP5glO1fMFsFV/0pwGHnOs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 82DBDF805D6; Fri,  7 Jun 2024 06:18:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 98897F805E5;
	Fri,  7 Jun 2024 06:18:54 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8EABCF804D6; Fri,  7 Jun 2024 06:16:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20607.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:201a::607])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3C5BBF804B2
	for <alsa-devel@alsa-project.org>; Fri,  7 Jun 2024 06:15:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3C5BBF804B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=dcwN/Uad
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oam8KS/M3s9dUurmkF60JYSTYDtMG2t/aj5Y/QFTwiD0/AyLGYpsJ5eApvdwNO61CgMnSZGgm3Vx8wHReV6Bgs3aY2mD1fZQ1gGolCAOBTW2uHaDpSKw6OH13TpGs2tgtN+ZElQYR7SmnkVoWSj1MhFLT48jWgmXUxFJ3VE4U6gfMqE8U+c6JX/iAhYrEuijkuSSd3vaBzLl8AjJB5mFeKIdbtH694tKX+gvJXLb26gZO45uDXILgGJ4p7ppbUpY4lRAD8lHqT5z8PK/P3+8nl/Wa9a1FMszDoD4CrygIJALmeMux1GvgDbkwaikVxJvz01HefRIjGdWstjp1ZWrWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SR6qFu6vbCQG93VqEgo+PjdR3MVFfB3wgIXqBfrre4=;
 b=iiZvrZLcvwuFjpwqgfCjdIZSe7c3TPh6nraxakEwOwPI8G1sizg6+brbFmcO48QxkXDFWEa1KqY8+5Wdn1djTRGSfjHCnfx5sTY1MeuY5YsVSyixVhtySiEgNMhffmNECtFSVqtEr3UlxypDDd7mEXq+LmslypWVgVA+Liqbvqlc10YF86P1fWw/tPPElAd3YYpz8csLWdJEZm9mudwkleV/Dj3TvszwmLHWZ7I8X3LW3D2iD15LpuByA3LucTFbd6CY8awtl5JFrYEVEDkUKhOIELLtp01yW7FtbJuAPABORBuJNTN1EY0fsz22tW4XxY0hxF+MNBPBfYgj5rGyvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SR6qFu6vbCQG93VqEgo+PjdR3MVFfB3wgIXqBfrre4=;
 b=dcwN/UadHfdyi4Tj5ir7sNHdGPRWhSySJeaWMObzz7VuPx5m88ktiOzgUwUy5qGGlhy55zPHci8aiOiFZi2rQZZnL9ITwe6M5zCvrMjPbN6OGHvs8/GyHygR3pUgF2935YMjAq06M9xCmFH/qsEuQr6a4cNwrsg5VgvyFPHgZ1A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB8206.jpnprd01.prod.outlook.com
 (2603:1096:400:103::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.34; Fri, 7 Jun
 2024 04:15:16 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7633.033; Fri, 7 Jun 2024
 04:15:16 +0000
Message-ID: <87r0d9s817.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Maxim Kochetkov <fido_max@inbox.ru>
In-Reply-To: <87v82ls82e.wl-kuninori.morimoto.gx@renesas.com>
References: <87v82ls82e.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 3/5] ASoC: simple-audio-card: add link-trigger-order support
Content-Type: text/plain; charset=US-ASCII
Date: Fri, 7 Jun 2024 04:15:16 +0000
X-ClientProxiedBy: TY2PR06CA0044.apcprd06.prod.outlook.com
 (2603:1096:404:2e::32) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB8206:EE_
X-MS-Office365-Filtering-Correlation-Id: c7b664ac-1b4c-4e87-da0c-08dc86a86f94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|366007|52116005|1800799015|376005|38350700005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?nU9NmLJdR7AdwFlUcaVTeN75+dEb8Z+wmz0U1JYM1VYwyU+Gv+3aW2+rrsdk?=
 =?us-ascii?Q?TWBTLB6rH0jjz8FnNgZz+OJxEE8ugkd5yM73y8fbL3SeNu5ldJB974FzxHVd?=
 =?us-ascii?Q?ML/epY87FEGiTh9Y/t0XgBRMNNTCvuTYMNW0SSN3CUNP9RyHaEbsp129SP+W?=
 =?us-ascii?Q?xiEqkclL8TDQmZUjrcXGiGhKru5GSvQHe/cagjjwXxMy+EPWTbmOnmE/LpJw?=
 =?us-ascii?Q?3TOrLbxdqP/6slR6th0p6o4uBiNRNVVJ5UFJwpGzAmgzMp8Sfvhd/H7LgusW?=
 =?us-ascii?Q?QQafwHipsFDfIlP3xB/h7j/lRg7a+ZcwJJ40dcQ92e8yIeGRVQilzEM490E+?=
 =?us-ascii?Q?KuiNvYFjTWH53m/R4dUf1Eo8Bq1gdlLUVzYWkHtMZhNIxmfeWPkE4Ug0Kz20?=
 =?us-ascii?Q?mMk1h/KHWcuG9mbWetcMpDKFTBGaQ/EGSFW5NacmmvOU5wnLf95vDDpK9yHO?=
 =?us-ascii?Q?S/XEucNealt2CNstT36EJv6aJpJBJqpURVl6+tZcaLkWLheaEiVAVgl2z8Qn?=
 =?us-ascii?Q?inrMOCFNgIoM8Ti5hdw4W8GFiBpVM8I70jFpv9K1UYS6SxINyJ5Imuq7Y8TQ?=
 =?us-ascii?Q?ILDFh6yqlk9po0ZMvd2p0wjm58EpM/GuYZrlTNsYxy52gOBVTCjYDGjBnHLD?=
 =?us-ascii?Q?O/HTbbwlg0LDrhuPoHauajHY1JmLPjj/VbkRERDPWWqFdcY87aT/Ckdrc9g+?=
 =?us-ascii?Q?ab9Fllt/PEGRCvyOV0Zdi3vZnIcIqzbgWVCL+8NU/BrV386QeFRqMt6BSa9U?=
 =?us-ascii?Q?Llajw+Sj7V2PufwpTTc6JQ+FwJaihbIdOZXICh686XeOfo/5Lj4D8AKtlpij?=
 =?us-ascii?Q?QZ6qMxAttClmXnHNcpLeWBNIndUowW4ApWaTi5L22Tl91O8t7CNxB+pXUr1T?=
 =?us-ascii?Q?IToAak9AX3yM77CW6AHdaohONPsNNxtLGW6rMtk6bp5LZWfIBcQC0ZPXIiCJ?=
 =?us-ascii?Q?xB64SHOQsyfFrbZSNCmJHiU9rfHlaAcMSMGJOokXaHnox9uPnW8uu9zXWldO?=
 =?us-ascii?Q?+xzdsYVF4xndtcJdEhRletLZutc0Pj+poHg9kwEnwFUnMLnyuMyVOTLk/KiU?=
 =?us-ascii?Q?Jd9KJNX66od0PYnnBsudnhrZiaw+z57YIfK9cEtv24bqA8lZfkSxyrY1i7sQ?=
 =?us-ascii?Q?HpFBKiylt7AYDnfP+WRyeYNvjMDO6BcFJc31r94fCSAQ+uTcrX3Cl0XXIjqD?=
 =?us-ascii?Q?6p0kIshfQVAp0lQZKUVdkQ2xEp0pWrbLJgEYNS+wCUsSGpVx6ar/OdEOae8a?=
 =?us-ascii?Q?hlDJrLAKTy2ttjudglhS6WhwZ8o8LCP04q/BkCYlYJH5LPG4hfPOuuL2cTUx?=
 =?us-ascii?Q?M08s2J/4DgmM74evXpjqNnXwXOtDAB9MipjRK2U0HgmnfXkT+HAotR9y+xlL?=
 =?us-ascii?Q?KSDKIyQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(52116005)(1800799015)(376005)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?caNfsewQhTSfVAtPzVwM3sxkRO8Y7vUb9YmHxunrHQ/cicdtAVHDmPoft7GE?=
 =?us-ascii?Q?OVH7FckdIVVw/ljU0d77emh/g7+YfVep56ACuKKCHhUt52eGLv1iYNJWc+iR?=
 =?us-ascii?Q?gzDC5DyCy8l5lRoqRtusuuCLg6sH7lk7CRR3JF7RNZKjmlx/Q3mAO+qfEYA6?=
 =?us-ascii?Q?uviPZJePYfhFtfE2GbYR/BVEwqcPsmBEB8MHe2t627UlB8l+aE/AcgOvQim/?=
 =?us-ascii?Q?u54P1AfPEqyBIf8ClqiuRO9snhWkePykggDlvUinnW9O48EFwkpyDk2YGFF1?=
 =?us-ascii?Q?l9O32r9BWIScfgX9LhKdHIW9uF1VLcwJnbEYecSlc2AREhKn/Znvrc5lU00P?=
 =?us-ascii?Q?XGNT4iktpDWwydYCWEQajXGwBruhxJ/tAWHB8R+w4jdQ7E3RuEl6t+2FtOrS?=
 =?us-ascii?Q?OiT0qo/DXWtgdGw99V5QGz2UBf8YwvXcmUA6bSGuej0h1xZ1Qo/mUU/WiXpu?=
 =?us-ascii?Q?BKI5bU/UZ8IDeYezlHoiNrpXKZ7L9KHXuWfR60E3taowXF0slTbdZrAyTI8P?=
 =?us-ascii?Q?C8wnXPmfykyI3hrrfck3Qph9mktFoSS7I98m7oa2K5qQ/voGv3PXfbIxVFK1?=
 =?us-ascii?Q?LL6g7lQzjEzLQa+KiXxsd4seWbUvO6Ltyuri6VfCrSRhrUIbYNeklmkYtiLm?=
 =?us-ascii?Q?3f3b2zEfOAXjJXujum5YS0jqY6nSGWirdhRqh0cV6SFYmD8akdMx9nm7JGOZ?=
 =?us-ascii?Q?xkIdlwK6tgpfJWCeDX7CchrjNbOlmao9j9F8MSv9cwpJZC8TTHURVQgJ6LAo?=
 =?us-ascii?Q?08ArwqfGiq2oSmfviqjUbMlHYDTmwy1fRpouD0rAyPillAKHrZNoAkbyW6yr?=
 =?us-ascii?Q?B7Nvc3/Cwxkyze7DQNes5Me7fT4xJDlK8ud9TMhbLr5MfnRwRH8ZmLFlGmzr?=
 =?us-ascii?Q?jtDIMtID3wkdssuZfIDLc4gtR/G35/75GVMw/f8QsoCW9QzIpmgnibRKe9vj?=
 =?us-ascii?Q?EM6nLnmZsZKE4HYC6vBwHyyAcb+nQVe1l5YXoWtWcPhdpsqnqVsrcV1vFtyn?=
 =?us-ascii?Q?QozpAANyy3l4bw95BVh4rTFYjns2y3r6gtxOSNXMKxOaMY/Gjcv2RIp05ZMt?=
 =?us-ascii?Q?AGWOqnG+81nZDYgE/cjjsa37NNrJdKhW6JoDFzj4vIno5EZc2ewKl3v+cAOl?=
 =?us-ascii?Q?zTrWBrhcBvckJqdEsrs6Dk2mmgZurIoZAEWS/nPOS/fe0je/uGZ5w5HitK1f?=
 =?us-ascii?Q?/HBQwDGaoVKw4Qz59RxvOOLfXrRU4oZydeHUD3/crsK6LUdEHKj2PuK79pow?=
 =?us-ascii?Q?Kq6nK+03Fpsc4TPU+UgC5XF1LpeEChLFct0F0bIsru6RHtB+2YN4nfUcHwFN?=
 =?us-ascii?Q?FAAj1iddnXq05c8+fvdL011CsdKc0BgZ42iNslXdsSR6OrWMeORxO3k9WmjB?=
 =?us-ascii?Q?yqXJB+S49o8ARO3ttfOQZSIfpE6T4MsoBlByMedZus0X44Gr4LJctaf4gg9l?=
 =?us-ascii?Q?ToeWXCEo3MHRrUIho4Lp8POYvR/bpc8M5+qHoiD+hEzhCuw+f4WlHtRlhUPW?=
 =?us-ascii?Q?rwKTDdIBOz8cTDp1FAAlUoirZV8dpG7URqgl/+jxDhUvk2zJhTnPzeTaxkhv?=
 =?us-ascii?Q?rNG5a98QP2i2E1uiofY55clGnKxqM/eqM9m8p8EromRTemIFDhGE8xn9UY4w?=
 =?us-ascii?Q?F9GRuDSa3E5pEZ77GEclWBw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c7b664ac-1b4c-4e87-da0c-08dc86a86f94
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2024 04:15:16.5123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 ywt5mGJyDP3vS9BGuW4+yH+TWUWsRpuxprabmRYcqS2a5yCwBA51cAQBgn8PqkefO70eQor/5UO7/p9DaBOvbDHtlKF+fnAusxHnwVAj7kWWaRVkR5DatQHpsnyeohd2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8206
Message-ID-Hash: 2Z4H4J4SE4DMJRNAJDJCY43SL34A4DBW
X-Message-ID-Hash: 2Z4H4J4SE4DMJRNAJDJCY43SL34A4DBW
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/2Z4H4J4SE4DMJRNAJDJCY43SL34A4DBW/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Some Sound Card might need special trigger ordering which is based on
CPU/Codec connection. It is already supported on ASoC, but Simple Audio
Card still not yet support it. Let's support it.

Cc: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/generic/simple-card.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 2de5e6efe947f..edbb6322e9be2 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -176,6 +176,8 @@ static int simple_link_init(struct simple_util_priv *priv,
 	struct snd_soc_dai_link *dai_link = simple_priv_to_link(priv, li->link);
 	struct simple_dai_props *dai_props = simple_priv_to_props(priv, li->link);
 	struct device_node *node = of_get_parent(cpu);
+	enum snd_soc_trigger_order trigger_start = SND_SOC_TRIGGER_ORDER_DEFAULT;
+	enum snd_soc_trigger_order trigger_stop  = SND_SOC_TRIGGER_ORDER_DEFAULT;
 	bool playback_only = 0, capture_only = 0;
 	int ret;
 
@@ -198,9 +200,17 @@ static int simple_link_init(struct simple_util_priv *priv,
 	of_property_read_u32(codec,		"mclk-fs", &dai_props->mclk_fs);
 	of_property_read_u32(codec,	PREFIX	"mclk-fs", &dai_props->mclk_fs);
 
+	graph_util_parse_trigger_order(priv, top,	&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, node,	&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, cpu,	&trigger_start, &trigger_stop);
+	graph_util_parse_trigger_order(priv, codec,	&trigger_start, &trigger_stop);
+
 	dai_link->playback_only		= playback_only;
 	dai_link->capture_only		= capture_only;
 
+	dai_link->trigger_start		= trigger_start;
+	dai_link->trigger_stop		= trigger_stop;
+
 	dai_link->init			= simple_util_dai_init;
 	dai_link->ops			= &simple_ops;
 
-- 
2.43.0

