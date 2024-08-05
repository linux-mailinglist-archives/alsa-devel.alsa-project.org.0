Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 42A2694722D
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:39:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1705F48A3;
	Mon,  5 Aug 2024 02:39:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1705F48A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818368;
	bh=9BMN4WoKMTQrUp40AzXKgLjbg3IXg44C9YOag9OiH2U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YES0esgDDAemCNWxh7w6s2Q5hyVhow7FNRW618eJ9uWA7XTjdovnJc6z9cGINdb6Z
	 KO9mEwK5NpTtf98Tp8T9r+ddI3F+pf1YSMzA0AjPnyiYnyjgjqYH2ClzzPzbt9PC2d
	 08qbkxoaM5LFL1CBLfxMZYF/sFfXl3VSoEvj7ARQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B762F805E1; Mon,  5 Aug 2024 02:38:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CAE54F805D3;
	Mon,  5 Aug 2024 02:38:44 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E73FFF802DB; Mon,  5 Aug 2024 02:34:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 151F1F800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 151F1F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=aJVgRWb7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RgmHITRTRSYGCTUa1bWm0qNu99sIu1gw3G9rkE2qIU1uZwBDGCsX0J6RgpTiHoi+Aya39vsoDr2QOQ0/YqQ028ZdvzujsJm99PDkeTDHQQm3vxU8kxFXXpuKKfu0JoliXmykrL2Yt0ftvQmZ9SoacVbu0Qq0RyBLFi3tzd5MKzatWi914ubjqoNwTS25gfM0r4JPBUmn0lUrw/zhQX/wKWEde+wJwzB7dCB6hrcZjRy17KXfroWBLknZ1/SfIo82dHx8wQYIZHHsYexBZHAcyTbvX0GdSPz9sVVFqKPf3Hs+NqMJvMHuvahqj4GQwCX3n6LX+c2VRiPZq84avfCxdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=STRgMxUU3+hM8Juwob+XlXbZHALOi6eCpfXS1P5jhEw=;
 b=MC+97zJO3HXuiH57lZRsxjFzA61TwOxAb5iqymPU7wj9UPcJ2PzBIsDzjPMtrb/CxDyU0/FVft7wkNazZncSVF0+QgqtJjcXVcvduAd7Y6+MOx1vOtNrv6auwghY/KczJcS5bjqIweWw5HWcc8UOqIaJ2znhgykRLYmsMwyLSS4pVAzWv3+bIt2vDn1OwHwdv9KXYmDZT6GLpwyDXljmUF28n65L0EhY6DwtXNUqKRMhF8NyoBHurf/FWvk0h3DZLe4TTJSv8cbQWndyVfy7D/4X9zzI4AnRkjdvhohC38mvsPfbuiGeoTjwLN9G0RUapZwGWuoFiLPTpuy6Y5PCVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=STRgMxUU3+hM8Juwob+XlXbZHALOi6eCpfXS1P5jhEw=;
 b=aJVgRWb73+Sn9eceDO0GNND+x8RGSR5/77VSbVC3/Net0B9aqmAfJwadhkVC2+DKC7cTlSz5JVKboFQ0LOUM2L9HuhUlsvH2LWgcrgqowWjc51yoUy+n4dDGSXSbW9JpKiCDqYiMvB7nIoVepy7MrqwhbBU1W4regGcLLqLTo2o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12335.jpnprd01.prod.outlook.com
 (2603:1096:405:105::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:34:00 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:34:00 +0000
Message-ID: <8734nj3j0o.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 001/113] ALSA: add snd_pcm_is_playback/capture() macro
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:33:59 +0000
X-ClientProxiedBy: TYCP286CA0357.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::15) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12335:EE_
X-MS-Office365-Filtering-Correlation-Id: 4bc15a6b-aa0d-460f-7b1c-08dcb4e64c8a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5OoOhkkvteeSJ+9MfZQqZb/VgM7s9SF1Whiyo52ldEFv+sJpXjyLAU2chGg7?=
 =?us-ascii?Q?sYD1XomEf7KbclK75sDi82G7xze95cBYvn68wuSnrJbzx4qShFfaIqvpw08G?=
 =?us-ascii?Q?NtFBsCkXOZBx+/+goZJ5SnuaR+Paq+qOiYXCnxyJAM3z2/YsKS6AEAkjzTBu?=
 =?us-ascii?Q?jYAk73YNdP1aSTuWbmNRqduqU6ejTygvT/Xk1/0sD/3gzUPcpSxmsc41zhlq?=
 =?us-ascii?Q?ATxPFoH0teQzsZBoVYWzga9ZlJiITRli04VLLzm0yV6CJmnsl+qySLzDTN58?=
 =?us-ascii?Q?Hg4XOD/wWKvZxVviGfkEQgyIazNSUMF+i/UrBSwtFbuT5GTw+alxLCeAd4aw?=
 =?us-ascii?Q?zqQRj1VZz1uUHWvUt7pZ3L7AvjWQolPsSuI4Tz2BE25BgmeyJYu8P3iWAP8G?=
 =?us-ascii?Q?5uFBBDDoJtFET7PbxWtnq6q/dsvNYvehoOhBaTtOKCgT9Rnfl2l9MGxqcBv3?=
 =?us-ascii?Q?ylxwdO4/pPnKXdL/v5lZnEkDkVXdUGIVRoYycht1aAqWge7soKYCjKrSYhLI?=
 =?us-ascii?Q?bxnjrmJ4vEVNYJ+x+ZoulteJ3JQVuvGKx3o8sFBYGWun/2nrrTQmNyeS/B7I?=
 =?us-ascii?Q?VLPo9rqugByzMmODXbZGDnZcSUjQD21iJ3qAeT0LhLXwL05O7rRoJUZDk1FL?=
 =?us-ascii?Q?JrTP5PiQF1xAWiTXYhkvGtdH37rRUCmRCHWusuMO7qwsS3Cg+Y9dxggSi4QU?=
 =?us-ascii?Q?3BMxyV6AEO61COSeTeugWjPDPkkw7k34WUxctGm/8fEjpQEo1UHBMIBXt78e?=
 =?us-ascii?Q?oX86Abiubf1HrM37KCKtGWlp/WktcREuVbz3vdfuwjskwbujbiDzDX3RisE/?=
 =?us-ascii?Q?jpYzsWMyg9htp+f/Z3da8Ygn/xC+HiK4Y5ghkA9ko7VPqkTdmv1Hke6bxXTW?=
 =?us-ascii?Q?+yxvMM2ITweDRLGru/jTHjw+4/wjmF+TJzSWd0vZ4seuuLopYpWl0jribh3X?=
 =?us-ascii?Q?PwYXhsa0j7F0nzCi90LgQ/6kGOh86hZlLrGQzRuycNg19GR4WPNz4ZMM6To4?=
 =?us-ascii?Q?Da6WvFcXVgTG/rtnx0omhtT0Jythm0gOnMmCa7VFsBjpoBxOd6+H5i2LYlWe?=
 =?us-ascii?Q?caNbpgZGfXhuhmND1zw04ZbSlx56MaqW6kVUP8s2Q9t6EXt06v6NxW6eW5zx?=
 =?us-ascii?Q?KzdQyIEwL/CVReCWHy+l6OZOPQnfzQkguImwchIzQeZTukh9HzRoXjl4vdIC?=
 =?us-ascii?Q?8vEi4AX/iHRj2bJD+jSXkkfEURVm2nQxKKqS5q2PKy5nmC7nij7gzsgvupC0?=
 =?us-ascii?Q?PetYBPejawKkLPwWPHGjqcKxlXK0UtM2s9qqgnuyO7qqwfwxrxDS3sjPzzKE?=
 =?us-ascii?Q?E4EHv9BZLbdM0ZZvrLEbT9Nz9f5zCKD+X3o/fuejiotQnU7aCF6D+ue7ufX+?=
 =?us-ascii?Q?4coKg/5lON099iBVXBlj5KjVVR7w6K34HnOB9xSdQBtoXyFtcQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?agZcM2BOvG/4GIOOScfT2tiq956c3hOQIy9Kq8qn8Ug2u1kEPYgoV1GNQMqo?=
 =?us-ascii?Q?VfaEl5OJbaFA3Kpo9sDRnMCEUHDQc+81CpDvkjAUdF0PGOscfIf+rddosRbW?=
 =?us-ascii?Q?3fHLM1BYnkA1VydseeSujNK60P60022B0JYVRyxNiV4ycD3mSlYOfOP2/fdX?=
 =?us-ascii?Q?aRXvfBZHr/9CZspSTNpLeHpsDCbxU7DYNosDO7xvF0t6PtNJFgOCwTpsam5p?=
 =?us-ascii?Q?T9Ac0uGcMhX1uRdwzTCNuYsrny/ced5S5rpad9QfsGLW3J3p4gWPDy0u7WUV?=
 =?us-ascii?Q?kVIurDNlejlVB5VnZQ7An70XKHmkEvQWltt4aCYhlQHTvq7coMwLsLeULkgK?=
 =?us-ascii?Q?KJd+zdILQLtXicbDEfc4pa6eUcdEt+JI6/9bX4KGgwzF5TyRzgckRM0DmsOD?=
 =?us-ascii?Q?bmQn/DTPJuP3qcLzIaGZqTwFP5zeYbSnz3EzJhyBXYFwlIgtgJ+nub1pDsAB?=
 =?us-ascii?Q?E3hbKRwbZrRjFLjND2CIjkyHWzR1y/njoEqG/Yh/HQnYCDnVD6Q+MV2dIZqb?=
 =?us-ascii?Q?nwApx9trXWtsmiNTYDvaNAC2HqWRwyIrmgKjcfjgo3dzplvUdae0GCiP7MYB?=
 =?us-ascii?Q?u6dRWzLZ0uHZyzP8/vZB0IcjmDeUWVDZ3NgdOTlZhFC6NbNQ5cDs5zsXPm8n?=
 =?us-ascii?Q?NWwg6VGz8EeiR9WGh2CTG9/DDD372Q0ME+HxFSlIrYy8xan0aw4OKmSiiWFL?=
 =?us-ascii?Q?Y6imj77qxsXphbrh9/xdHvZrfBYdF+QSBcjCDrgqVgH7WveRihbS33zSNNMX?=
 =?us-ascii?Q?W679u+r25EdTdZB406wQlPTdZrsemifvo20/EJiS5jy5TTgkVzaqHBKCkDW4?=
 =?us-ascii?Q?eE5LF7cDuQKK8SqPc9F11vk1O9+na2uPJm5Vq1PdmE4E1ppxDHODHiInGsYj?=
 =?us-ascii?Q?OaKXzi2HlhuYoLPpfAm3btTCoycPIEUCUKOrCIR0f4h0doitAZECSFvvdu1a?=
 =?us-ascii?Q?KomRtmC321D0DjWTgTLgvuggsGziq0YWb0kjkvQqBjLhEC8CC0zmjUaQQeCW?=
 =?us-ascii?Q?cz6GTqsJj+h7/w3BVx6s+TeHE8sZF2RzxMOllRsUm7roIOkRCkmbsO1lXTK7?=
 =?us-ascii?Q?DOp/Kpwd+fkmXr9wKKm5cGe/Vy0M8W0lcv65tEATeoFkPwCFu6Z6PCKuWgi+?=
 =?us-ascii?Q?ipxGNsfDiBc2NAqy6zpGwOuqULmapMEreVbpfHPNWURzvSFnWZfVpzCYIT7m?=
 =?us-ascii?Q?Ev6pbia++OKVbQtq7mk63auPNNq2ePkZqZmwtilRzROun6C9y2S/hW3Zuf3H?=
 =?us-ascii?Q?/18TVvZatMzZ6QB3fSxZZtyPNQtvQrRKmH1neXlODpjUtklfL9HcFT5RnfCv?=
 =?us-ascii?Q?HpR2DejG+Md2ZUqgR/D0uksBxMqZTtdiMJA9RKaoNM1xrB2sNx5/4LpIB26u?=
 =?us-ascii?Q?xuRbuTXRiPoohi+hvCuiom7xl9TC6uIBUHSnxicHEI/kQDUllpaYi2Mmhrub?=
 =?us-ascii?Q?8vuJmj262yDT4MG/dzN+qz5VjLSeRgX1oeaIU0kKsQxqt8Lht5wmvz2NkcF+?=
 =?us-ascii?Q?9TkkPkkbDky8o3Dmgcy9KFVapqOQuFWG7gjpQX5iUBoNjWP0UF5K4BLUrPdH?=
 =?us-ascii?Q?t7zuA9WmTuF4QxzFtDKh4tzS5sjPnhgaYH9SaeiTJlGgVSlclnrDbfiHym1w?=
 =?us-ascii?Q?cwpmOuft5vdv8lF5D97QcwU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4bc15a6b-aa0d-460f-7b1c-08dcb4e64c8a
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:34:00.0487
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 /p0tLEq8J7tm9fjYeWedS10idxNNQODGaDds7l/YtDBz+My5E9HDeGGpDLQve1SpsQc0ElowULULkW3V2uBf7VZb+UDTH6O78aWhIeBifiQHTDXc4m8IxX6KluO9iRLH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12335
Message-ID-Hash: ZTXLYATKRVA6ACY4GFT6V4XBCIR4ZTU6
X-Message-ID-Hash: ZTXLYATKRVA6ACY4GFT6V4XBCIR4ZTU6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZTXLYATKRVA6ACY4GFT6V4XBCIR4ZTU6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Many drivers are using below code to know the direction.

	if (direction == SNDRV_PCM_STREAM_PLAYBACK)

Add snd_pcm_is_playback/capture() macro to handle it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 include/sound/pcm.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/sound/pcm.h b/include/sound/pcm.h
index ac8f3aef92052..69e535aeb8e82 100644
--- a/include/sound/pcm.h
+++ b/include/sound/pcm.h
@@ -502,6 +502,35 @@ struct snd_pcm_substream {
 
 #define SUBSTREAM_BUSY(substream) ((substream)->ref_count > 0)
 
+static inline int snd_pcm_direction_is_playback(const int stream)
+{
+	return stream == SNDRV_PCM_STREAM_PLAYBACK;
+}
+
+static inline int snd_pcm_direction_is_capture(const int stream)
+{
+	return stream == SNDRV_PCM_STREAM_CAPTURE;
+}
+
+static inline int snd_pcm_substream_is_playback(const struct snd_pcm_substream *substream)
+{
+	return snd_pcm_direction_is_playback(substream->stream);
+}
+
+static inline int snd_pcm_substream_is_capture(const struct snd_pcm_substream *substream)
+{
+	return snd_pcm_direction_is_capture(substream->stream);
+}
+
+#define snd_pcm_is_playback(x) _Generic((x), \
+	      struct snd_pcm_substream *: snd_pcm_substream_is_playback, \
+	const struct snd_pcm_substream *: snd_pcm_substream_is_playback, \
+	default				: snd_pcm_direction_is_playback)(x)
+
+#define snd_pcm_is_capture(x) _Generic((x), \
+	      struct snd_pcm_substream *: snd_pcm_substream_is_capture, \
+	const struct snd_pcm_substream *: snd_pcm_substream_is_capture, \
+	default				: snd_pcm_direction_is_capture)(x)
 
 struct snd_pcm_str {
 	int stream;				/* stream (direction) */
-- 
2.43.0

