Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D90099592B4
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 04:23:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2336A7F4;
	Wed, 21 Aug 2024 04:23:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2336A7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724207033;
	bh=H4P2t2AW6dLI5LStSzO/dMvFvBExRx8RME4VDIy6XTE=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=tc8sVx5bFvw54l3IzVEzpKxdYysmrrBoL6ZGGxOGuVr4D3Df2bzJETpRYH4U3nqg+
	 devmK8MJxb2ngJ9ea/aN9WQ02ZyV6QRnOCwiXIs2tDcp3I7YsPZW5F5qDnM3/zpJB8
	 bu9N1Mx/2spkI1Uj9vlhgfAR4a2PzbUF18ZuZRdU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D69D3F805B0; Wed, 21 Aug 2024 04:23:21 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2F63F805AF;
	Wed, 21 Aug 2024 04:23:20 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A1659F80494; Wed, 21 Aug 2024 04:23:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 934F5F8016E
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 04:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 934F5F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=gw/Mnmpm
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c9Yj4PFIrUS1Bqwmg6M0pVEsxFFtMrjfBStXcoZgq+lwvYfZ96icMmpTY7O+rPEBnROL74PST5UsycGca1sBJpXxCtlhjDM95IPEnVIGN/9jDhikAPPYqN6lqS0z1cX8nJEdQqX7BoRFTOjBTEC8J3qQzdsPQezSbiLR12uYutiTq+XZ1wO6pHrMqb3HXgLYGEeRqzdjME1x6h/VxWyvqspeEyA1A2xbAS/x8Kgw+cFi5xQNKWW8u6YQUMJVrQ+5jo+9Jae/oyLIspD9vGV0FZhVq9yaUdkFYTgdk2C/dHlqOPkjyxldqSw/r6DwEtsZVmwYZ5su+r+Sa+6AbNwAeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6cpLXym1PWiyBc7HN3FN8PwqYWUQ9jjHSOuf3rfIe0=;
 b=Bal9zoIn20pBRmD1eQ3AvexNQH9eW76/RtPl6eTIKdnrax23l3pycS1Od/Y3c/ASoC4DbmJ5tZWjcutCSyHdkzNeQtJFnscl9ME3/k3z7/bb2wLbDTkxcABXamC7MWTV1WzIxl/QITruZJZ73KWFE3Q+jR/Tun6dshqq+6o0BWf5OBQHywt4guiYB7QR27tO95cPw5cqdCjhbItokTNWov6hHEKUNwMi0VZyTRQMdsXeSmNyyVYCoDlI7NGhmRlKWrQta+yo5lK57E27uTqFFevglyd39zV+R0mDdw7GMer3sunxPkblQNng+gcpA4UWimx8Tzh/3+jQvYUgDVBIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6cpLXym1PWiyBc7HN3FN8PwqYWUQ9jjHSOuf3rfIe0=;
 b=gw/Mnmpms67Ms1E8h/vuZDdc70xx/KhPEfePz8EPztE2FG8ihQfb1dTyhje30kOA+vH9nxQUZTkLb/9zJTXeY9jZls2JKQoi85uMubkgW/synQo6GolK2HhxoAQ8yeidlR59OgwXpnXQ+iKLhgSBfg13T50ZVT359W6BKa3TqFc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB10610.jpnprd01.prod.outlook.com
 (2603:1096:400:2f4::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.20; Wed, 21 Aug
 2024 02:23:07 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 02:23:07 +0000
Message-ID: <87msl6aa2c.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: soc-pcm: remove
 snd_soc_dpcm_stream_lock_irqsave_nested()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Aug 2024 02:23:07 +0000
X-ClientProxiedBy: TYCP301CA0025.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB10610:EE_
X-MS-Office365-Filtering-Correlation-Id: d01ba753-19ef-47be-f8ed-08dcc18831eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b+AhudpfErxBgHThCkJPtlGoq9DVTfPWUdpUDQz/avf8xi2Sz+3sfQu2XVBU?=
 =?us-ascii?Q?RjuydnTVSQW2yYLp1LGWin7q7lCM7r5+cHOuoM/Hcz0xzqtWjkYswq4RVxbn?=
 =?us-ascii?Q?lER/UQJzsU7sStVAsZaWtbUgr6EZxENhi5pHJ5PST+BUt4cMZDqEruJ4yMHD?=
 =?us-ascii?Q?ej5LBNjnTmy3aHBI1uORBUM+vZ27VGahHJhJ5Kp2wJ2aZZUHOAtE2bt19JRV?=
 =?us-ascii?Q?/21VYmpw20reioaOPnObXbHunBZ3voCmhBs1upW/ZJRA2an5xofVQ07iYOjG?=
 =?us-ascii?Q?uwXqa+OuA8ctRerqga7xD1YRUw0LRXUindw2TBka/Or9x2YmdaKLPvRKZYx2?=
 =?us-ascii?Q?G6fmdSdp3w4QAutOleGb4/VRhZ5b/0iFV4G0iQDvt5f1PXgwppALmPrpGtJx?=
 =?us-ascii?Q?1v+BVV4S/XclnCyuSuFQzlw9tBHMmZNS9ZdsZkFXlfi5rf8cTKpPzYbvl5YA?=
 =?us-ascii?Q?3/0/D3lsMIRJ04m4dQ5M/A+pVEYf+43vCPpDox52NiNCXwzPwi4QA8m7EnvT?=
 =?us-ascii?Q?4tlDqVQadS8IcdjiSqWhSpCZW6uoKznkPhiGhGT8BMpy4z+aukMMAqh84wab?=
 =?us-ascii?Q?ImxWnYs1oeG7NJtbsruJp7XBtY9UJLUpcfppAb6TH3ntNx+myoU/+HxuICgH?=
 =?us-ascii?Q?p2dEVahQTZDDu1Zm6V+fywN6U8MSg3FCArE8iFcEQPDcPXYPPZsg41rws/Tp?=
 =?us-ascii?Q?aWWTVBFFyZjYK/D7HSIVdWtc2zfXCHbkgcL57iJ8/4zu1ltdruerkdoYt2S7?=
 =?us-ascii?Q?JfOD9WXNSt0zilPQUyhvJIsFCJifRhyrdZQaQ1tglcN9pPE0pqC2rCBeJwKw?=
 =?us-ascii?Q?AVzhnhx/sZolZohQ05ZATZqZaQYZIgiXyDjN+b0tDNGuVtFaKp9ZRhxAtN4n?=
 =?us-ascii?Q?LIcciN9kUm5/nnpCa/mF6koQjmKLZ0yz+s3UNl7Sh+HKwhRLadS91GPiS4kw?=
 =?us-ascii?Q?9nBB7Mlmk3eBGQ/ZNHR0vStwFzhzHbAwdcmZxsr1I9zcwLxodO6fgxATGVjQ?=
 =?us-ascii?Q?igIv7KzFEfnsP5gghjPGkHPZgXaflfZy9Vr4g5xJQdrCLh4CMB6h1BwMcHe1?=
 =?us-ascii?Q?RI/jQPoHAw0jO7x3LA9AyKkqMJoFKRJqsxDIgcebYoUzKufxZKG1DXwY6cFv?=
 =?us-ascii?Q?jis9DIk/WzUPingssHRXCizJCeqssTip4oIFTH+/AdvvQ10Z9io+tMUJ1FrU?=
 =?us-ascii?Q?Hb+dYHyywFv9Hcp6lbHkxLv77d/fhwDU+5m4FF2blnIt7qiwtRRfVp/tNGMA?=
 =?us-ascii?Q?vYtq8ssHqtsj98QD4S2Rmte15ZrcQ2HnKvaXCCHAj3vM2bcJUN9Mj5DbTumI?=
 =?us-ascii?Q?/ugtVYP1EX6QPyz7m/xEe8otdsrVBGaXuRz8MK+lfN4qLHZ7AEH2yQ8F8Olx?=
 =?us-ascii?Q?DjCroE9EdaTCQSN91neukEYayWPO2KcS8tWdDnvPHTQ0Lg9Dig=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?o3mJASjZKtGf3y6VDfPWjSLTHFcc4Eh/9xsw3N1BpRMYY8v5LXI2vwsNyfpt?=
 =?us-ascii?Q?mNTWItyu8qWh3dlOXeSNRVkyY0v4UcpVSmWFGYTWHfluEFefHEqmmeupTCdX?=
 =?us-ascii?Q?yUBC8NdCB++L+sTjqyFWw9d7NuDmullKc+Ih4GPlbCkAZJffI+L+UyaDXa2T?=
 =?us-ascii?Q?55cysfZ6WKmL8vQvXJDNl3eLaZt58givXzCGE+xyp/F7IsysqDFXdOFtaGus?=
 =?us-ascii?Q?jvcrpjgV2THIDqzMutZxREWC63s9+tONzEy5MvTy+E/59NWuY7mICWQJXvYo?=
 =?us-ascii?Q?ebHiWVBBD0jfePWir745GVx73toWPgcui+yJARVOdK+LELujsMJPNiodB+1o?=
 =?us-ascii?Q?EEfxR3x7anhEBUyBulXCLDa49eI2qr1R2oLJu8oWAxUpVtMxkSclCNq8dEoT?=
 =?us-ascii?Q?KCXdbHwWTjJdNhG2jGKTje0EPLkqh/gkcZQmGqFXqZNGBx8VK/RTK0F38n0o?=
 =?us-ascii?Q?iJ5TE5FjE1VfIYEWZZpUb73V3qTEClU3DgT8fBoOEQJazJ2TPSSSlIvjnj2F?=
 =?us-ascii?Q?1k8dKsBdrRx6/HFHynHmknO8ZtfjFsfNTFHsxEH2efoyJdRC4/xLUMZYIWmJ?=
 =?us-ascii?Q?sQA0SmCvstsYg5hZ40XNHqVXyp0W4q3RTzGMJOInee5ddLFJdXPt9r5gACsB?=
 =?us-ascii?Q?htpaikOjvXeaAzMM072qVkOGUfyy1u/oQejnilBIehx1hJ+XzOTai1mBxq99?=
 =?us-ascii?Q?CAtys9HJqzLb8+vOINQvXoUBRv3k32THAsE2IwgskMp+ryGkBT200CaZyxmD?=
 =?us-ascii?Q?a0jfp2WEdT8EHnZW2UY14tY1E/zlK90KAMsD+AXGBUmLsXwwi/mYvH4lwCmr?=
 =?us-ascii?Q?T4HAbZZpTbnI9inlZ6uPqIcpmppX1VXAAJjcRpiAPdHSyKUS2WjhgIeDExop?=
 =?us-ascii?Q?p/uuuI8VqEXNYIlrqaeLWZ1nKFh8LVdDZZ6APY8wwd5hJ7d/f+mbld3TF2xM?=
 =?us-ascii?Q?uJ6jM+73eILTrr/5TqnqCvhp65iXP8NAxNyD/1NaakpTJTwA50PZEoliJyHN?=
 =?us-ascii?Q?tf465O0q3wuRX2231kGGRvXtnHA5mlIXZqn/9zx/WeZHI1lRbGX77dKfhTkg?=
 =?us-ascii?Q?8FeTkPNqZk0UhXfGdZV5flDVx2vJKtjQw6khp3OlPY+xU7OrjXbdbRHbsEkO?=
 =?us-ascii?Q?MkOlEZ/lw2PJ49PJY7UMtlMKV6DerZMbyX3lnZqDdooH8G/+YrrQkJKxlBLN?=
 =?us-ascii?Q?V80AOI4D5BhmHvI6M4T13j8B9ioIGyzdzE8PBkIrMejYYVgD/25EGQVdhq/3?=
 =?us-ascii?Q?0ASOxHXIMx2kZEvezDosf/vxwY3+8uF6iEkZffzdzw6egH8qdtGJoNDFd33M?=
 =?us-ascii?Q?4wPvjlcfKhUKVmaqs48UWVY0k7XTsr46eRNRMrj4s8jsT+G8tD/c8NQd74du?=
 =?us-ascii?Q?MurSNjP4+p9k0xHPVkaKRQNKZo8NWQsN17lv94dNYa4F4bKwn9kvYUwE0u+W?=
 =?us-ascii?Q?yWbLCdKrHIsYy8IZd/+s92L6ToxwT5/8nnPGMsg5qqCtH8KtLy7oQmcd9Wjb?=
 =?us-ascii?Q?JedKHK51uD14/Vw+M0WxkHYZrvYuYkvQfDOPuWs4cF7YeVR4tPJ8V40Jq1w/?=
 =?us-ascii?Q?RqrbpB3EHM5qVATInkj08hoNSlDtXnkgsDOkKeaB8EqfrC30UxeP5vdodDaa?=
 =?us-ascii?Q?se+TpP+N9bhaR0rVyW5t7B8=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d01ba753-19ef-47be-f8ed-08dcc18831eb
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 02:23:07.7628
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 sP8ZjHmD2TsPGzn1UdO0D/zqYsbNHzRWVlCVq5WJaGKlP0mWhGpLm9ajeDxqEc5ZJ+1/TrwrSImQa55cIg5AURcJeUDzJP2tEDarslLbuEF6+pC5VWJxefpUu9ix+dwa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB10610
Message-ID-Hash: WV3IW6MS6L67IRDMQHAEJMWA5KMCZOXZ
X-Message-ID-Hash: WV3IW6MS6L67IRDMQHAEJMWA5KMCZOXZ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WV3IW6MS6L67IRDMQHAEJMWA5KMCZOXZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

soc-pcm.c has snd_soc_dpcm_stream_lock_irqsave_nested() /
snd_soc_dpcm_stream_unlock_irqrestore()  helper function,
but it is almost nothing help. It just makes a code complex.
Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- rebased to latest branch (for-6.12)

 sound/soc/soc-pcm.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index f79abcf36105..baf8b81e7110 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -49,12 +49,6 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 	return ret;
 }
 
-#define snd_soc_dpcm_stream_lock_irqsave_nested(rtd, stream, flags) \
-	snd_pcm_stream_lock_irqsave_nested(snd_soc_dpcm_get_substream(rtd, stream), flags)
-
-#define snd_soc_dpcm_stream_unlock_irqrestore(rtd, stream, flags) \
-	snd_pcm_stream_unlock_irqrestore(snd_soc_dpcm_get_substream(rtd, stream), flags)
-
 #define DPCM_MAX_BE_USERS	8
 
 static inline const char *soc_cpu_dai_name(struct snd_soc_pcm_runtime *rtd)
@@ -2144,7 +2138,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 		be = dpcm->be;
 		be_substream = snd_soc_dpcm_get_substream(be, stream);
 
-		snd_soc_dpcm_stream_lock_irqsave_nested(be, stream, flags);
+		snd_pcm_stream_lock_irqsave_nested(be_substream, flags);
 
 		/* is this op for this BE ? */
 		if (!snd_soc_dpcm_be_can_update(fe, be, stream))
@@ -2291,7 +2285,7 @@ int dpcm_be_dai_trigger(struct snd_soc_pcm_runtime *fe, int stream,
 			break;
 		}
 next:
-		snd_soc_dpcm_stream_unlock_irqrestore(be, stream, flags);
+		snd_pcm_stream_unlock_irqrestore(be_substream, flags);
 		if (ret)
 			break;
 	}
-- 
2.43.0

