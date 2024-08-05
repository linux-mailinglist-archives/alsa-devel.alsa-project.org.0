Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 09CBB947293
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 02:48:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20CC848E2;
	Mon,  5 Aug 2024 02:47:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20CC848E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722818840;
	bh=twAO4m0NbFNEN3VdvY7CaSFGxPH3+uRvtg4VOT3L6wA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qgWB1mD/7Zy082cyMuwHjchh4opFrSDsZSFuzcJypwOPHYdCvMsO3dOnZLyBhxgXX
	 We5zfG6k7v8gIMOpOBvWag1AGji4ul+xu3+aGthdwkMozoQwNjSVNNTElJTqm4hdRp
	 FmsMo3zw8KcN2w85Cs+6BnIpEpe8QfYtZ+dOrPOE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CCBF6F80C81; Mon,  5 Aug 2024 02:39:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F1534F89765;
	Mon,  5 Aug 2024 02:39:18 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EAFBF80448; Mon,  5 Aug 2024 02:36:49 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id BA852F800B0
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BA852F800B0
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gUysYGQb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGAhIIlsU9JHDKFNsey3DtnGKE1Ba/to4VW2BIn6bKUPOfBwKJCUXI6zzSoDZEvo4X6R81MZKHE1dTzmmf/DBVGCNLgbE9SFKOMYhJVKLs3e7GyjqhlZbRD/rTvNHcX/AmL/Fcy7gMp1qYOvtpvlzIQqrL9tq4VKxC3H0OddmaUFZI8GOApQT+Lg45ZttAuydiHDupRD9zdc5wmMUhX2Q1P2+VNhWQqSMxpBLxf1biCvxP7DJ/ufK0gq4D6ccsk1QNBVWp8shtHLRfL2HNvK92gn1WSOljvzMZhDB60dplI4hVTkCaY9ykZLJiZnTvRvZUIUIuLdbomn35/y4kfUQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NM/kwySv9IWD+l5L1gOqEK4w0rf2dXzrAk6ErGxenss=;
 b=A27cGevcGNEQ47QPArGWkzeIrWyEYrl/ODv4cisUnT66whUNBmKNi4Lf1fMPDBOGWzmtl/TrqXx3ZefIHuJFBOg/ZKIymZKmanbXWOh4xAyBG/uJnmBAJ3s5/ASLP9lXdEqupgt49bnLE/KQvxpYkaKlPokUyESdQ+Sr5pvvBayj2SNBE5EToef9kQkVdA4zSDif2fkbO3dgRl7gZPO7gXONS1jxjwTgjcbHMy9V/7V+c4eTTqdhGw9XEiGIy6UpTOOoe57w/dU6IQEOjF8JoV4PMxuUpymd5XItcblvsgzbkq6wmXffg5JHLS45QCwf6l/eHo1JWgDre1tv4a1lWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NM/kwySv9IWD+l5L1gOqEK4w0rf2dXzrAk6ErGxenss=;
 b=gUysYGQb5TNiY3T1NwhouAS2E+YfX1PZSsnKrnF6HoVDbdPmnJgOsx5SqORY3YHW+cYGa8TW6iHSJnJxNUOiQFsXl8QoBury3XTLoPIlnkYf+GYmeupajjHwSO8uCKSjnM+6XYHajwVD1J/mE05tHpOb0c13kR3bWFwdVRsDd6Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB6318.jpnprd01.prod.outlook.com
 (2603:1096:400:7a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:36:38 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:36:38 +0000
Message-ID: <875xsf24bt.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 024/113] ALSA: pci: rme9652: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:36:38 +0000
X-ClientProxiedBy: TYCP286CA0324.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB6318:EE_
X-MS-Office365-Filtering-Correlation-Id: d7de162f-5c52-4444-b957-08dcb4e6ab05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?fB7v60MMDM9AY30QLR1dpOJZ4RzPMUFcVnIixQZS81WJFO2LBCmzv6IdbUeA?=
 =?us-ascii?Q?lDMaSsTm5LRHI4zt2Lg8OqWGzzcwbM0xWWmBs+Vqe4oEha2CBf8AODT9w5JO?=
 =?us-ascii?Q?QXiQnV+QJSuZnGxa3pgddyul70rWmYg//lbd4E4XB60krMyGInjuUxWl+klj?=
 =?us-ascii?Q?pTnOyQbYR4bQ98mYaNEvUJNwPUofzX71bqiHvN6K/Mfd/EyHc2vH/WSmzmxF?=
 =?us-ascii?Q?MqrTB4adtc+jRhl09LV4rLeWHO4hnPg3KNz9ofNacCzVITU/NCkd+hEhGqKx?=
 =?us-ascii?Q?LnZKup1EOjYF2roMv0SRfLl5h9gxXve+PIQIdUjoXMwnB0UVRpJKK4htQHb/?=
 =?us-ascii?Q?mX08tuSBPDbdIQSMXoOSOHCSTVPfidWj7kXqEs51S9siCMi9Na6Ky9CCAdhv?=
 =?us-ascii?Q?4V2P2urs48JIZ3FHcSq+p5NNwSRieYA1rd/L6bwBXWg436Jy0doErJQQBi17?=
 =?us-ascii?Q?TfEk5nma+rKwdpSWLxQf/hQug+r/kckdtWNLAuPyQQYB6Zs1igbqdREIaRle?=
 =?us-ascii?Q?bcTfTwK+IRz0V3/W9GXS+m8UkBY6WM8Tiaj5VCZWtRo+kA5ktF8JTokcT0zV?=
 =?us-ascii?Q?LJHunFxtJ4A+OnLwJElD+YBL/VPfYrpPUvIz7zLKQcMr7uw5CYIn1m1zf/yf?=
 =?us-ascii?Q?jIjFUGjgKCcaExuCyvoYG2GC5YsntDQWTC//jUc6CU+yLUOiUSovPW5TSFZl?=
 =?us-ascii?Q?kUalYl8PsyR6AF/Mt5nFlnMDY6iO1MeI0RyJAwHLUKhv23T3b5gCwl/f9ZqK?=
 =?us-ascii?Q?V45BxTQncymQWishaHij6l7+yY6Bp4shE3cVR83WDqn2PQbfiI9v3jkCFAvj?=
 =?us-ascii?Q?6pYoRRhgCk2Bgvgq+JKmVcnCyMmx5VTwud9mHU4rwKcsXLblrHzFe0R3VniS?=
 =?us-ascii?Q?rEcAcDAOHIBkXAW4VAvk7PYITInl0w56lmbQpSSsoVNfZ8Y8NDfAgPZQgBR1?=
 =?us-ascii?Q?7smDAkoKHxJU6VqzYN9qATnNFub04DXYURYyZWFfH+fsKRK45Ge/cahu5NYE?=
 =?us-ascii?Q?P9DfhkqWJwsXrRODFAEyr/v9dWQSJ+Tcr3gaxmHEElV4ZoLDfx7mzYJ263kJ?=
 =?us-ascii?Q?KoPuojmkfjqOMjONZvvYjnTrfBqlR/WiF1WGlv+tP7bs2ekwqj3vjAS1CfqA?=
 =?us-ascii?Q?uJ6e3JSLVVWtRzBWvwSpWNUPUXc2R1nUyT2u8rn9um3qcuRD+d3QC+srO8uY?=
 =?us-ascii?Q?y3ZuB/qj8aC9LWu0utWX1S0zeJMj3QGQG9Mtm/+4SwB6JoHvxpnUA8AJpBtm?=
 =?us-ascii?Q?t0He67jCGI9ywZJhyYT8c0fRwLEvsmXg+ePwF1RCx9fA9kNL3ZHe416TS0W1?=
 =?us-ascii?Q?H01BN0W1lG4C0Nzzw/O/xvCZLgzqI9nlPtc/l8dCfudvR8SYZxWK70KvR9Gt?=
 =?us-ascii?Q?Anle494gMiCUTPWxwXykdnwGry2D/XBmphxUP/LwrjYk9iYT6w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xr6+v7nrlStwAU0j6p/ty3RjVxpYa638o9/+ohOgG5Uus+cMP366wS9cT7xr?=
 =?us-ascii?Q?I5hlrglXN5nvmY5TOh7OzcyJrLEo7J+mqqcHX7M+T/JpknnarIguf3RimkO3?=
 =?us-ascii?Q?Nj+HNsBvO6yCyw0Ft03fV5Xp8w39V5K1upkFKpQkqOMjy4Bnwl1CA682Mml4?=
 =?us-ascii?Q?0vHif07b7W5EO0O7SLS60NwXz3ShzNqEmYBcHQSoJX4SETeHeITmla4rviYR?=
 =?us-ascii?Q?QRzAu9o7VFl3wLy0IuGow1ig6hAWqHMgyFZRnhwGOWKQR14A7dqThmMC/PM2?=
 =?us-ascii?Q?gy31N4FxA0T1wVHak9YiTmfEHI8+d2m5j3kwNLasQtegL7Dh642laiDx8vOC?=
 =?us-ascii?Q?JlL9scxulAU1GVN1zWcxLhtzt1gcoz/fqmeX/K1JMjvtSwdagwmhL+j3Va2o?=
 =?us-ascii?Q?wzOw2ekxafZ1fBVCrFF+bTsBPRI3e1NWPopaI/zuLomO1BgnLTtlH6GEcX0U?=
 =?us-ascii?Q?Tqt1OSh6C1rWOicdyZTk/0H9uzbJLc38MhhHv1xqrEKc0nLoW+TXmy0YueSG?=
 =?us-ascii?Q?fPUsO8/TYCSNxlgPhxqtXRF2KwTYGUIVwqG5KLJvL3QoUYlEjRYNdWSjWFI8?=
 =?us-ascii?Q?2kN459odx6GvhyVfaSrHI+AEXe7vHvw2semKGA0XhJ1gua8hW2a+WSJI8sYm?=
 =?us-ascii?Q?0TaQ+FtfGuVQSPwdzNm8oG6QD4NPKCoSc38F8J7h8pVw+a0G2U6LxyDPv4z8?=
 =?us-ascii?Q?/daNKi9CjgVFNAyTG8Q+q/8Ytih1td1KahYlynneAsUywvZr9DI4hoOpgAHS?=
 =?us-ascii?Q?h3XIZIoL4vMwvmXgAUpjuFBvwoxcGAfww12HrxF0bVweVjjGlQJ2nsmHpLPt?=
 =?us-ascii?Q?NsG4GcMtl47xijSAJb4ZXVfcsZrJ+I24sJeAeomV29Nl770vJWmELwPkgb21?=
 =?us-ascii?Q?h90GLpFx5jQ1l4v7HUDZxVtplWZ14VZiztkSYWXu5ZiETJkFhir039Fl79sE?=
 =?us-ascii?Q?GQfI9NicjvO/8TVwO3eR0nqoAHjmnC8mIm8lbtiQvuoWOKfCCY9ki4ioaBs2?=
 =?us-ascii?Q?7R+cl/xX7sKeUNgqIKxAZ1zH7PI3u1h9DUzdOiwIgVxnfKrbi7ismhkbLmLh?=
 =?us-ascii?Q?hYaxPe2S2LOiw1SURnRiPRSybGGCXew3zwNCZB88/j19V8w83UBaCWcRBrLm?=
 =?us-ascii?Q?EoGohB7fUawPMDbF4wzjtY1NpRzXt/zGKj9B4Sq5wNOUKsfyc22Bdu0pbbwq?=
 =?us-ascii?Q?Py2iPuHrBktAmJmv/sunzHZLUaACIAhdqn2lboPvBROnJl05dCtl/LRTy4ju?=
 =?us-ascii?Q?f+vfjjlrQQSV6yhwMtrMovz+oVk7wW2z8MoccDvd0jHbL4wyRub/IsU1lJiB?=
 =?us-ascii?Q?eqXrCoH56Mz8o9X362b+25uFZMfoFF2XEjE0E71ojA/5tRt98wWlzoJWiSgn?=
 =?us-ascii?Q?CwmZqBx4z0dcdzWxKNPhqJYxRI30i8Ir14APwJFoxK8foKVCrRqB0WOFtEL9?=
 =?us-ascii?Q?QYXEY3VZ9JyGxirpcuplgfdbfVyBmy5GoinkRTZKvfWmLFLLLhcgc+CttemN?=
 =?us-ascii?Q?vxDMwRnf28LrymfXUx92xAAAumwDsnk6xAPeOm9VVV01uhSysXctthFiML4P?=
 =?us-ascii?Q?Gl10SL48uxtI3X60fhiJEI9cXxT/ZwIhbmqYySelgFttbRYHSPBlqnrnW9+w?=
 =?us-ascii?Q?8W844oqgs0Z3zwJM9FZXwBY=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d7de162f-5c52-4444-b957-08dcb4e6ab05
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:36:38.5611
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 FmXsIkgBYqT28wLJMWlmrM1kjMSmLePKyPOhva9sYDb/DCyrhYqrsSYMbqiGO7VdCyvW6NN0atajRnE5MhAAZdJm47OPdbzUHM0AKCY8FNLUsEjg0j621Z7A0JrPheW6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6318
Message-ID-Hash: 7CKOT5J7EEH5YZ2FA6D4UFMOEI7EJFKY
X-Message-ID-Hash: 7CKOT5J7EEH5YZ2FA6D4UFMOEI7EJFKY
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7CKOT5J7EEH5YZ2FA6D4UFMOEI7EJFKY/>
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
 sound/pci/rme9652/hdsp.c    | 14 +++++++-------
 sound/pci/rme9652/hdspm.c   | 23 +++++++++++------------
 sound/pci/rme9652/rme9652.c | 14 +++++++-------
 3 files changed, 25 insertions(+), 26 deletions(-)

diff --git a/sound/pci/rme9652/hdsp.c b/sound/pci/rme9652/hdsp.c
index e7d1b43471a29..b99f32d24f7df 100644
--- a/sound/pci/rme9652/hdsp.c
+++ b/sound/pci/rme9652/hdsp.c
@@ -3953,7 +3953,7 @@ static signed char *hdsp_channel_buffer_location(struct hdsp *hdsp,
 	if (mapped_channel < 0)
 		return NULL;
 
-	if (stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(stream))
 		return hdsp->capture_buffer + (mapped_channel * HDSP_CHANNEL_BUFFER_BYTES);
 	else
 		return hdsp->playback_buffer + (mapped_channel * HDSP_CHANNEL_BUFFER_BYTES);
@@ -4014,7 +4014,7 @@ static int snd_hdsp_reset(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct hdsp *hdsp = snd_pcm_substream_chip(substream);
 	struct snd_pcm_substream *other;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		other = hdsp->capture_substream;
 	else
 		other = hdsp->playback_substream;
@@ -4051,7 +4051,7 @@ static int snd_hdsp_hw_params(struct snd_pcm_substream *substream,
 
 	spin_lock_irq(&hdsp->lock);
 
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream->pstr->stream)) {
 		hdsp->control_register &= ~(HDSP_SPDIFProfessional | HDSP_SPDIFNonAudio | HDSP_SPDIFEmphasis);
 		hdsp_write(hdsp, HDSP_controlRegister, hdsp->control_register |= hdsp->creg_spdif_stream);
 		this_pid = hdsp->playback_pid;
@@ -4172,7 +4172,7 @@ static int snd_hdsp_trigger(struct snd_pcm_substream *substream, int cmd)
 		spin_unlock(&hdsp->lock);
 		return -EINVAL;
 	}
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		other = hdsp->capture_substream;
 	else
 		other = hdsp->playback_substream;
@@ -4191,15 +4191,15 @@ static int snd_hdsp_trigger(struct snd_pcm_substream *substream, int cmd)
 		}
 		if (cmd == SNDRV_PCM_TRIGGER_START) {
 			if (!(running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) &&
-			    substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+			    snd_pcm_is_capture(substream))
 				hdsp_silence_playback(hdsp);
 		} else {
 			if (running &&
-			    substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			    snd_pcm_is_playback(substream))
 				hdsp_silence_playback(hdsp);
 		}
 	} else {
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 				hdsp_silence_playback(hdsp);
 	}
  _ok:
diff --git a/sound/pci/rme9652/hdspm.c b/sound/pci/rme9652/hdspm.c
index 56d335f0e1960..a85e09535636a 100644
--- a/sound/pci/rme9652/hdspm.c
+++ b/sound/pci/rme9652/hdspm.c
@@ -5465,7 +5465,7 @@ static int snd_hdspm_reset(struct snd_pcm_substream *substream)
 	struct hdspm *hdspm = snd_pcm_substream_chip(substream);
 	struct snd_pcm_substream *other;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		other = hdspm->capture_substream;
 	else
 		other = hdspm->playback_substream;
@@ -5499,7 +5499,7 @@ static int snd_hdspm_hw_params(struct snd_pcm_substream *substream,
 
 	spin_lock_irq(&hdspm->lock);
 
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream->pstr->stream)) {
 		this_pid = hdspm->playback_pid;
 		other_pid = hdspm->capture_pid;
 	} else {
@@ -5570,7 +5570,7 @@ static int snd_hdspm_hw_params(struct snd_pcm_substream *substream,
 		return err;
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 
 		for (i = 0; i < params_channels(params); ++i) {
 			int c = hdspm->channel_map_out[i];
@@ -5656,7 +5656,7 @@ static int snd_hdspm_hw_free(struct snd_pcm_substream *substream)
 	int i;
 	struct hdspm *hdspm = snd_pcm_substream_chip(substream);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		/* Just disable all channels. The saving when disabling a */
 		/* smaller set is not worth the trouble. */
 		for (i = 0; i < HDSPM_MAX_CHANNELS; ++i)
@@ -5682,7 +5682,7 @@ static int snd_hdspm_channel_info(struct snd_pcm_substream *substream,
 	struct hdspm *hdspm = snd_pcm_substream_chip(substream);
 	unsigned int channel = info->channel;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		if (snd_BUG_ON(channel >= hdspm->max_channels_out)) {
 			dev_info(hdspm->card->dev,
 				 "snd_hdspm_channel_info: output channel out of range (%d)\n",
@@ -5765,7 +5765,7 @@ static int snd_hdspm_trigger(struct snd_pcm_substream *substream, int cmd)
 		spin_unlock(&hdspm->lock);
 		return -EINVAL;
 	}
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		other = hdspm->capture_substream;
 	else
 		other = hdspm->playback_substream;
@@ -5784,16 +5784,15 @@ static int snd_hdspm_trigger(struct snd_pcm_substream *substream, int cmd)
 		}
 		if (cmd == SNDRV_PCM_TRIGGER_START) {
 			if (!(running & (1 << SNDRV_PCM_STREAM_PLAYBACK))
-					&& substream->stream ==
-					SNDRV_PCM_STREAM_CAPTURE)
+				&& snd_pcm_is_capture(substream))
 				hdspm_silence_playback(hdspm);
 		} else {
 			if (running &&
-				substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+				snd_pcm_is_playback(substream))
 				hdspm_silence_playback(hdspm);
 		}
 	} else {
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			hdspm_silence_playback(hdspm);
 	}
 _ok:
@@ -6046,7 +6045,7 @@ static int snd_hdspm_open(struct snd_pcm_substream *substream)
 {
 	struct hdspm *hdspm = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	bool playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	bool playback = snd_pcm_is_playback(substream);
 
 	spin_lock_irq(&hdspm->lock);
 	snd_pcm_set_sync(substream);
@@ -6121,7 +6120,7 @@ static int snd_hdspm_open(struct snd_pcm_substream *substream)
 static int snd_hdspm_release(struct snd_pcm_substream *substream)
 {
 	struct hdspm *hdspm = snd_pcm_substream_chip(substream);
-	bool playback = (substream->stream == SNDRV_PCM_STREAM_PLAYBACK);
+	bool playback = snd_pcm_is_playback(substream);
 
 	spin_lock_irq(&hdspm->lock);
 
diff --git a/sound/pci/rme9652/rme9652.c b/sound/pci/rme9652/rme9652.c
index d066c70ae1600..84e18197f26f7 100644
--- a/sound/pci/rme9652/rme9652.c
+++ b/sound/pci/rme9652/rme9652.c
@@ -1833,7 +1833,7 @@ static signed char *rme9652_channel_buffer_location(struct snd_rme9652 *rme9652,
 	if (mapped_channel < 0)
 		return NULL;
 	
-	if (stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(stream)) {
 		return rme9652->capture_buffer +
 			(mapped_channel * RME9652_CHANNEL_BUFFER_BYTES);
 	} else {
@@ -1903,7 +1903,7 @@ static int snd_rme9652_reset(struct snd_pcm_substream *substream)
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_rme9652 *rme9652 = snd_pcm_substream_chip(substream);
 	struct snd_pcm_substream *other;
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		other = rme9652->capture_substream;
 	else
 		other = rme9652->playback_substream;
@@ -1934,7 +1934,7 @@ static int snd_rme9652_hw_params(struct snd_pcm_substream *substream,
 
 	spin_lock_irq(&rme9652->lock);
 
-	if (substream->pstr->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream->pstr->stream)) {
 		rme9652->control_register &= ~(RME9652_PRO | RME9652_Dolby | RME9652_EMP);
 		rme9652_write(rme9652, RME9652_control_register, rme9652->control_register |= rme9652->creg_spdif_stream);
 		this_pid = rme9652->playback_pid;
@@ -2056,7 +2056,7 @@ static int snd_rme9652_trigger(struct snd_pcm_substream *substream,
 		spin_unlock(&rme9652->lock);
 		return -EINVAL;
 	}
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+	if (snd_pcm_is_playback(substream))
 		other = rme9652->capture_substream;
 	else
 		other = rme9652->playback_substream;
@@ -2075,15 +2075,15 @@ static int snd_rme9652_trigger(struct snd_pcm_substream *substream,
 		}
 		if (cmd == SNDRV_PCM_TRIGGER_START) {
 			if (!(running & (1 << SNDRV_PCM_STREAM_PLAYBACK)) &&
-			    substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+			    snd_pcm_is_capture(substream))
 				rme9652_silence_playback(rme9652);
 		} else {
 			if (running &&
-			    substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			    snd_pcm_is_playback(substream))
 				rme9652_silence_playback(rme9652);
 		}
 	} else {
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) 
+		if (snd_pcm_is_capture(substream))
 			rme9652_silence_playback(rme9652);
 	}
  _ok:
-- 
2.43.0

