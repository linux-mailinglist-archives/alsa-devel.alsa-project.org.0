Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 382D790A0EE
	for <lists+alsa-devel@lfdr.de>; Mon, 17 Jun 2024 02:32:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8ED0E68;
	Mon, 17 Jun 2024 02:32:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8ED0E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718584344;
	bh=q1Q8ensTXpXiNjpXYpE+IhifcN+2OqikrZavdolAaH0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=qOmH+kZFw/HHoj/fyIwe35gy1jFMSBgpEXkbP2MLwOuG+MgTmzz/vYWNRUz5hJEBc
	 K8SUskF6sTJgp0H0KJ78vAiVskarsSrIykKUnwt2BE9YjyWlasM8/c0JTa0mLiY9o3
	 Jin0PAX7J4j7Fvl9UKXraic4CZ2T8q8+1m4Wo8lM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E0B02F80603; Mon, 17 Jun 2024 02:31:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 62677F805AA;
	Mon, 17 Jun 2024 02:31:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CF278F8023A; Mon, 17 Jun 2024 02:31:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20601.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3BB9FF800ED
	for <alsa-devel@alsa-project.org>; Mon, 17 Jun 2024 02:30:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BB9FF800ED
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=IgrW9hcS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aGN9y3TP4QihjLH2JUg+NlRlNRBx2ooUK85RXWpxDuUZj+KCi81+pdyoeGb5vN3nGkIwBfg0//LglIruKDEgrsdqN8uJuv1nfCcBbuxUVWclsCLxtQgoNOFY27NXVnrFSmLxS/TX/ASxubA5muuxPCVB0rsEXLU+EUx5+R34N9EEDqPqNZaSOiL4w+YnKyks/2POexfnhlhiUT8AuhCHUFsNuiye5R9TlVfWua6iCJDjQbiM80iXap3cCRPTEIxTCgdPVvo0/WZN5IqXSAHh6NIfTcjHPnzxMhGmTxugG+uY2Y1+hGzo9PwLjUec9BFcE4ZQ4vkNUm+cLLsTX/v9xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8f6DV+CkDxaqwkSkmqVlBfI+9D1DTIc2Wpki9mkS4Xg=;
 b=YHzgDQ5WWdkFs6cVVIfvfCV8Tp29y2xC8OZJGxCaOJ5Q2cVrnHteWIj/3LfrueD9ibnr+0eAIvcRd5PY28fo4CjBUZQ/zWLSIjz0d9+Xc2VrQ5v5sI9aGmLQcq/SjCB7PrEYum4BJFK/Q1I6B1VOIckxmj0v5+68BglNC5+jYEOSy4Aijevq9vqyj1I55OppxToK28cGC2Di9hf+xI17+Gxx+LtM8MxlDMKZ5RpPpIdgt7ju8jx9xwJmA5P54weIvDQlqxTPtz/HFGU/91hxoxRGQ0hD4AZ14Ar3iNsz3tTiIPP9RtQWu9nlUmfNDyW5GeLocZ6BoHzDxqf6xAvliw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8f6DV+CkDxaqwkSkmqVlBfI+9D1DTIc2Wpki9mkS4Xg=;
 b=IgrW9hcSSNy2aGVJVCSeG1V/ZYVPoHmwGJEphrQdmN5xII5UNVkjIRFIYug/nYJsw0KgIUzVKk8OKMBwrSKmtPf+fL6NSfspBnQ2Vz9jFMJ0fHHcexcyeEYitxE9SOdCipb+4ufiUJI/k4pvL4F+1pTOXKmBpIvD3FI7FG1C1aw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB6715.jpnprd01.prod.outlook.com
 (2603:1096:400:c4::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Mon, 17 Jun
 2024 00:30:35 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 00:30:35 +0000
Message-ID: <875xu8tnpw.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/2] ASoC: Add ak4619 codec support
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
	devicetree@vger.kernel.org,
	Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <877ceotnrg.wl-kuninori.morimoto.gx@renesas.com>
References: <877ceotnrg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 17 Jun 2024 00:30:35 +0000
X-ClientProxiedBy: TY2PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:404:a6::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB6715:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a024334-240f-4a45-0bcf-08dc8e64b489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230037|366013|376011|52116011|1800799021|38350700011;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CIHdaAsMuqnrWBi2bWaQdQsj68eVMrcqh4zuUfPH1Tw8vXxEz98ZFw+fe33d?=
 =?us-ascii?Q?77CpK4qSL8+DbAfaJDeQcYel/5x4U8xXJc9k0vGzqdrPGcouOf3EQET7gNtZ?=
 =?us-ascii?Q?my8n6LSIbfUKxSjZ4lBprUBHObr5DtJZuqM/2Y7gcb5I2BvOb+6QYuvCBVLk?=
 =?us-ascii?Q?Xr/0zhkLiYA1F2aiYDW7ULPc/HApdXg0BtxMJW2sJdob8FF1YNl22tBZO/Ra?=
 =?us-ascii?Q?ol7Qyi+Fy0pg+Qz28qsvJUBT1zEDxLQMUsA/tj77Sci1bTwZT61WVU8OvWdA?=
 =?us-ascii?Q?z7wj7L4IU91FCEZVXQpP7ho7hfrjdDYv2O4jvIozMeGMtAjETAYxKy5AHnHh?=
 =?us-ascii?Q?z28BJPnEXsT+mnoH646f9AZRK3pDCR4rhd4+I+/RquZV6nyUpQgQv4KSx6ZJ?=
 =?us-ascii?Q?qGcRxnDrFASZxB8UmAGYrUPNnN5/uuvT5CotU4VcjYPbHI9xUBgnXqMnJaHC?=
 =?us-ascii?Q?ZlAP8jpixSwmSfvZOIVdLYc70Y3K0nZtV/rURp4E2e0SPovGVCKhybvx+bZo?=
 =?us-ascii?Q?AdY4OwmtGx2vXPjINh1RoBkAsLfm99j6xlaJYy+aH6ZNcKkk7pQR2msCEjwB?=
 =?us-ascii?Q?noUfWxyzEv1gMHhEN8HbtoxFsXHyxCNBgZ6cpaIeEehY+fZjyk1WJUvfA/i7?=
 =?us-ascii?Q?h9KOhh2aCxk8JUg8EuOlKmhyj3nAYVnDAbfq1BxqhkAmhwTW2guELQiDcu2c?=
 =?us-ascii?Q?7O+bEZ1/Y/bN3rbr9o/vYI8DsWh6xWkgVLHBpm7RoCXd/v71WSbSBnlx1sg3?=
 =?us-ascii?Q?d0+Er64hNsVv6avMmvp9TH0jkcyIYGFWLgMDZAKMbkhjcG0XKx2omOwpofgF?=
 =?us-ascii?Q?npuVFIFFcwiKgDLYWAMg+v2FTdtWQ6n2Lqn81Es0Ag5Iw10k9dmLttAFxdaa?=
 =?us-ascii?Q?OUe2lb2Kbqbvp9NIdDSOr4bOSm3bBA8knfjUyv3f1gnKuUayaHUqGY9B8m28?=
 =?us-ascii?Q?phsi1He/40xj8bTftg4PJw+d8v3zu9BupWHkWR9MG28fKfLNO8P++xvtHjJH?=
 =?us-ascii?Q?JAVWNWW3hZjgho4EOjVsZn4q5WTpcVgSOoIJEYzqL2t5rHyNXH6n9tHfB0Am?=
 =?us-ascii?Q?bghhofYAUONMjHMuVza/UQ3uPeVg9RT/7xk7ttz7RuCxz3gV3VgdpwZWXEwa?=
 =?us-ascii?Q?OcrSsTLYAsykweMSyStb7Cxm5JdsdbzupT3iQZ84ycHs1bVw3dcR7M/IAZee?=
 =?us-ascii?Q?NhRD229fb9+Y5/2tX1VttSs9OwNr+Vh1phv9X529WNfuCTrNGZykQObENdBk?=
 =?us-ascii?Q?qwGNityZ1cBIwOfPi8DT4qAfdS7Uk2YLGlaN8LR02zFPaSRZt6Bb/j4TQLAi?=
 =?us-ascii?Q?pu4gTTLDdG9ExSnv8pbyX6/5iVY3/66c4rBXsn4ngN+9ZvxmrLcKfSrVS0TE?=
 =?us-ascii?Q?pzkgp5o=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(366013)(376011)(52116011)(1800799021)(38350700011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8SaktHTU37Y5o2b0iE6Alu/ciyG0lCRTGKmZ4/VRIsQNxjEDm2pIGUW9zqmg?=
 =?us-ascii?Q?I/95B3ZrgcrvGR19Y1KMnM9yFxmMK6XEOTY0hSuys+iXO+4wxjk6nx6+0sXU?=
 =?us-ascii?Q?lygz6mf+/etm4qire8zSRZMTA1Gua84GIMrftsWB4MFfHycsg7bu2euDBMwY?=
 =?us-ascii?Q?fUtdWkbcX6tXwTIxaF96Ia5tkydn1l+V2LOxwd5VUlT3lDoGi+yhT27paJpB?=
 =?us-ascii?Q?KX5DYMq4gG+jJi2PlaP+DSjbb1oItrTwU2aisDeYeOoPerJp6+mLNaCwml29?=
 =?us-ascii?Q?jgY4tqlN+0S+GUCrAHO4dD1DMj1sXSp1zKMDR0vHyCQBbSIfEEvV+XGHxb4+?=
 =?us-ascii?Q?ygqwr02Nsi5c8dLUaJNtVH6tr6qqw7dfB7WxtC+Rcq0bqrhK4OnLsFoiBHvy?=
 =?us-ascii?Q?vrfWL3Ux8W9URwcjNGXbu2GnnRM0HsljRfei+iU/p/DJzfvWSjqL0DEaF3oB?=
 =?us-ascii?Q?TKMgI5EXE1CXLdRpxn74EHAbWFEkbbGyWSb13XLAqVtH+TCBJZyTdZT0Hs3B?=
 =?us-ascii?Q?iWnVeUeiofLHGQQv/f27eeJCLdbmh0nH+B9O+IPWKd2ZArLVgZiBFO7jiWbe?=
 =?us-ascii?Q?KE8NzOqABgr6282z022pOJBJFzu7dAyg6pdghaOaz8JHGeSctTAubyhmdGAM?=
 =?us-ascii?Q?+X3kEDATkl+nMsmqgZQCTpaDnMFBjsiENyNe9tcpePbEaYYb325Hs9WZRhQa?=
 =?us-ascii?Q?jTp2T7np/nBtqFcj+TdN1MNXlOIZevjS9myD/Uz76YJXr+Rm9dC/xojauwRj?=
 =?us-ascii?Q?JjPP8+juCK0KNswwxgvDC5lLwiY1aQ0VmJY34ZaTfgTavlHm53qTRQ/n1qyQ?=
 =?us-ascii?Q?J8Bq1qbBSQZD4bDVn3sj6rWHjjKRFsiF/YS00BnAPymEhbBgngY60gNbrg/5?=
 =?us-ascii?Q?mKdjCGKARb5zFlNJOyOern4Y4itDFguKXKBp9wvKgCmRrEF+1Oh1hEi4SG/Y?=
 =?us-ascii?Q?8m3zCvUgnMWuTUzPYbK2v1p/7qbImHg/veHrTkVLQO4YIlvZFIa/n7zC6gRl?=
 =?us-ascii?Q?P6YRlGemdPVQhlzDpAvAXJaiHB4AFXunLmlAPeyvQ/lTpcmnmsRhjQworgN4?=
 =?us-ascii?Q?4VOpHOx4AhsRlpgBUxJxyjYMviASx7PoMAVkACc31suy61zRFEE3AJP3XhUY?=
 =?us-ascii?Q?+NG17x7WKIL+X/EVoK3m1m15GvfvA0PJPE7ilucksJ5n8Hl9A1shftmTWrbU?=
 =?us-ascii?Q?PRCzICOBc57kP80TITLLTXM32ZYTb5PyQJR8JICEsAy0YeCHLbmuU/9W096Z?=
 =?us-ascii?Q?cgbNGqwF6sFTmXxEmu0He5db01xNnWzBvuRL6dgNKQnhKQXlk2fE8l9qlLrG?=
 =?us-ascii?Q?7eQU8UtmEw6rR02PZCOYJuKQvuF82G6Nq8Eg/3u1BfQfgpjWVjDYP6yVH8g+?=
 =?us-ascii?Q?F8yOnenIhugKlpRuRwk310sFsYnEZOJ5Ga1ow1RVZP3Iw8IKznQx/cxfkd0c?=
 =?us-ascii?Q?iDzVMKQvFdjmMVbEVSGEmfi0WqXAr85HIwGxtudn+vT4Gm4NBjli9p1vgRae?=
 =?us-ascii?Q?uVj+sXGhiZVjTWiiBtzDowSX6XP4VNnZdCSGY1h+kMLxFqPVXBuxB1stmb24?=
 =?us-ascii?Q?rRDNakAKiJXqNGJrQjz5visUvW6MUyk7SrDKF8ITU8mghCLx3HQeXoQTM6QM?=
 =?us-ascii?Q?XCdWUtLG+Ny6ZA/ft0wJaLM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6a024334-240f-4a45-0bcf-08dc8e64b489
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 00:30:35.7910
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 iEJGUckWeHkAaIfY/+HOYRXXHJNPTNZYc72Va2DMpjtsdBkd5L5GKFg0/8TNlcOhXZE/Iwf1fxLX17wZ1PVbSdvBxAS9sJX4hPXzA4iMWQHchQb3krxACWafkPnyTqml
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6715
Message-ID-Hash: ZJ4RGGUSU45ARKEAIMZIPDLS2A2LNIL5
X-Message-ID-Hash: ZJ4RGGUSU45ARKEAIMZIPDLS2A2LNIL5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZJ4RGGUSU45ARKEAIMZIPDLS2A2LNIL5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Khanh Le <khanh.le.xr@renesas.com>

This patch adds support for the Asahi Kasei AK4619 audio codec.

[Kuninori cleanuped and adjusted to upstream code]

Signed-off-by: Khanh Le <khanh.le.xr@renesas.com>
Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/codecs/Kconfig  |   5 +
 sound/soc/codecs/Makefile |   2 +
 sound/soc/codecs/ak4619.c | 903 ++++++++++++++++++++++++++++++++++++++
 3 files changed, 910 insertions(+)
 create mode 100644 sound/soc/codecs/ak4619.c

diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
index 7b99556f24d34..910303adef706 100644
--- a/sound/soc/codecs/Kconfig
+++ b/sound/soc/codecs/Kconfig
@@ -45,6 +45,7 @@ config SND_SOC_ALL_CODECS
 	imply SND_SOC_AK4535
 	imply SND_SOC_AK4554
 	imply SND_SOC_AK4613
+	imply SND_SOC_AK4619
 	imply SND_SOC_AK4641
 	imply SND_SOC_AK4642
 	imply SND_SOC_AK4671
@@ -598,6 +599,10 @@ config SND_SOC_AK4613
 	tristate "AKM AK4613 CODEC"
 	depends on I2C
 
+config SND_SOC_AK4619
+        tristate "AKM AK4619 CODEC"
+        depends on I2C
+
 config SND_SOC_AK4641
 	tristate
 	depends on I2C
diff --git a/sound/soc/codecs/Makefile b/sound/soc/codecs/Makefile
index ca69f35cc0f76..2db7760d2aac2 100644
--- a/sound/soc/codecs/Makefile
+++ b/sound/soc/codecs/Makefile
@@ -39,6 +39,7 @@ snd-soc-ak4458-y := ak4458.o
 snd-soc-ak4535-y := ak4535.o
 snd-soc-ak4554-y := ak4554.o
 snd-soc-ak4613-y := ak4613.o
+snd-soc-ak4619-y := ak4619.o
 snd-soc-ak4641-y := ak4641.o
 snd-soc-ak4642-y := ak4642.o
 snd-soc-ak4671-y := ak4671.o
@@ -439,6 +440,7 @@ obj-$(CONFIG_SND_SOC_AK4458)	+= snd-soc-ak4458.o
 obj-$(CONFIG_SND_SOC_AK4535)	+= snd-soc-ak4535.o
 obj-$(CONFIG_SND_SOC_AK4554)	+= snd-soc-ak4554.o
 obj-$(CONFIG_SND_SOC_AK4613)	+= snd-soc-ak4613.o
+obj-$(CONFIG_SND_SOC_AK4619)	+= snd-soc-ak4619.o
 obj-$(CONFIG_SND_SOC_AK4641)	+= snd-soc-ak4641.o
 obj-$(CONFIG_SND_SOC_AK4642)	+= snd-soc-ak4642.o
 obj-$(CONFIG_SND_SOC_AK4671)	+= snd-soc-ak4671.o
diff --git a/sound/soc/codecs/ak4619.c b/sound/soc/codecs/ak4619.c
new file mode 100644
index 0000000000000..6fdbb8f1db351
--- /dev/null
+++ b/sound/soc/codecs/ak4619.c
@@ -0,0 +1,903 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ak4619.c -- Asahi Kasei ALSA SoC Audio driver
+ *
+ * Copyright (C) 2023 Renesas Electronics Corporation
+ * Khanh Le <khanh.le.xr@renesas.com>
+ *
+ * Based on ak4613.c by Kuninori Morimoto
+ * Based on da7213.c by Adam Thomson
+ * Based on ak4641.c by Harald Welte
+ */
+
+#include <linux/clk.h>
+#include <linux/gpio/consumer.h>
+#include <linux/i2c.h>
+#include <linux/slab.h>
+#include <linux/of_device.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+#include <sound/soc.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/tlv.h>
+
+/*
+ * Registers
+ */
+
+#define PWR_MGMT	0x00	/* Power Management */
+#define AU_IFF1		0x01	/* Audio I/F Format */
+#define AU_IFF2		0x02	/* Audio I/F Format (Extended) */
+#define SYS_CLK		0x03	/* System Clock Setting */
+#define MIC_AMP1	0x04	/* MIC AMP Gain 1 */
+#define MIC_AMP2	0x05	/* MIC AMP Gain 2 */
+#define LADC1		0x06	/* ADC1 Lch Digital Volume */
+#define RADC1		0x07	/* ADC1 Rch Digital Volume */
+#define LADC2		0x08	/* ADC2 Lch Digital Volume */
+#define RADC2		0x09	/* ADC2 Rch Digital Volume */
+#define ADC_DF		0x0a	/* ADC Digital Filter Setting */
+#define ADC_AI		0x0b	/* ADC Analog Input Setting */
+#define ADC_MHPF	0x0D	/* ADC Mute & HPF Control */
+#define LDAC1		0x0E	/* DAC1 Lch Digital Volume */
+#define RDAC1		0x0F	/* DAC1 Rch Digital Volume */
+#define LDAC2		0x10	/* DAC2 Lch Digital Volume */
+#define RDAC2		0x11	/* DAC2 Rch Digital Volume */
+#define DAC_IS		0x12	/* DAC Input Select Setting */
+#define DAC_DEMP	0x13	/* DAC De-Emphasis Setting */
+#define DAC_MF		0x14	/* DAC Mute & Filter Setting */
+
+/*
+ * Bit fields
+ */
+
+/* Power Management */
+#define PMAD2		BIT(5)
+#define PMAD1		BIT(4)
+#define PMDA2		BIT(2)
+#define PMDA1		BIT(1)
+#define RSTN		BIT(0)
+
+/* Audio_I/F Format */
+#define DCF_STEREO_I2S	(0x0 << 4)
+#define DCF_STEREO_MSB	(0x5 << 4)
+#define DCF_PCM_SF	(0x6 << 4)
+#define DCF_PCM_LF	(0x7 << 4)
+#define DSL_32		(0x3 << 2)
+#define DCF_MASK	(0x7 << 4)
+#define DSL_MASK	(0x3 << 2)
+#define BCKP		BIT(1)
+
+/* Audio_I/F Format (Extended) */
+#define DIDL_24		(0x0 << 2)
+#define DIDL_20		(0x1 << 2)
+#define DIDL_16		(0x2 << 2)
+#define DIDL_32		(0x3 << 2)
+#define DODL_24		(0x0 << 0)
+#define DODL_20		(0x1 << 0)
+#define DODL_16		(0x2 << 0)
+#define DIDL_MASK	(0x3 << 2)
+#define DODL_MASK	(0x3 << 0)
+#define SLOT            BIT(4)
+
+/* System Clock Setting */
+#define FS_MASK		0x7
+
+/* MIC AMP Gain */
+#define MGNL_SHIFT	4
+#define MGNR_SHIFT	0
+#define MGN_MAX		0xB
+
+/* ADC Digital Volume */
+#define VOLAD_SHIFT	0
+#define VOLAD_MAX	0xFF
+
+/* ADC Digital Filter Setting */
+#define AD1SL_SHIFT	0
+#define AD2SL_SHIFT	4
+
+/* Analog Input Select */
+#define AD1LSEL_SHIFT	6
+#define AD1RSEL_SHIFT	4
+#define AD2LSEL_SHIFT	2
+#define AD2RSEL_SHIFT	0
+
+/* ADC Mute & HPF Control */
+#define ATSPAD_SHIFT	7
+#define AD1MUTE_SHIFT	5
+#define AD2MUTE_SHIFT	6
+#define AD1MUTE_MAX	1
+#define AD2MUTE_MAX	1
+#define AD1MUTE_EN	BIT(5)
+#define AD2MUTE_EN	BIT(6)
+#define AD1HPFN_SHIFT	1
+#define AD1HPFN_MAX	1
+#define AD2HPFN_SHIFT	2
+#define AD2HPFN_MAX	1
+
+/* DAC Digital Volume */
+#define VOLDA_SHIFT	0
+#define VOLDA_MAX	0xFF
+
+/* DAC Input Select Setting */
+#define DAC1SEL_SHIFT	0
+#define DAC2SEL_SHIFT	2
+
+/* DAC De-Emphasis Setting */
+#define DEM1_32000	(0x3 << 0)
+#define DEM1_44100	(0x0 << 0)
+#define DEM1_48000	(0x2 << 0)
+#define DEM1_OFF	(0x1 << 0)
+#define DEM2_32000	(0x3 << 2)
+#define DEM2_44100	(0x0 << 2)
+#define DEM2_48000	(0x2 << 2)
+#define DEM2_OFF	(0x1 << 2)
+#define DEM1_MASK	(0x3 << 0)
+#define DEM2_MASK	(0x3 << 2)
+#define DEM1_SHIFT	0
+#define DEM2_SHIFT	2
+
+/* DAC Mute & Filter Setting */
+#define DA1MUTE_SHIFT	4
+#define DA1MUTE_MAX	1
+#define DA2MUTE_SHIFT	5
+#define DA2MUTE_MAX	1
+#define DA1MUTE_EN	BIT(4)
+#define DA2MUTE_EN	BIT(5)
+#define ATSPDA_SHIFT	7
+#define DA1SL_SHIFT	0
+#define DA2SL_SHIFT	2
+
+/* Codec private data */
+struct ak4619_priv {
+	struct regmap *regmap;
+	struct snd_pcm_hw_constraint_list constraint;
+	int deemph_en;
+	unsigned int playback_rate;
+	unsigned int sysclk;
+};
+
+/*
+ * DAC Volume
+ *
+ * max : 0x00 : +12.0 dB
+ *	( 0.5 dB step )
+ * min : 0xFE : -115.0 dB
+ * mute: 0xFF
+ */
+static const DECLARE_TLV_DB_SCALE(dac_tlv, -11550, 50, 1);
+
+/*
+ * MIC Volume
+ *
+ * max : 0x0B : +27.0 dB
+ *	( 3 dB step )
+ * min: 0x00 : -6.0 dB
+ */
+static const DECLARE_TLV_DB_SCALE(mic_tlv, -600, 300, 0);
+
+/*
+ * ADC Volume
+ *
+ * max : 0x00 : +24.0 dB
+ *	( 0.5 dB step )
+ * min : 0xFE : -103.0 dB
+ * mute: 0xFF
+ */
+static const DECLARE_TLV_DB_SCALE(adc_tlv, -10350, 50, 1);
+
+/* ADC & DAC Volume Level Transition Time select */
+static const char * const ak4619_vol_trans_txt[] = {
+	"4/fs", "16/fs"
+};
+
+static SOC_ENUM_SINGLE_DECL(ak4619_adc_vol_trans, ADC_MHPF, ATSPAD_SHIFT, ak4619_vol_trans_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_vol_trans, DAC_MF,   ATSPDA_SHIFT, ak4619_vol_trans_txt);
+
+/* ADC Digital Filter select */
+static const char * const ak4619_adc_digi_fil_txt[] = {
+	"Sharp Roll-Off Filter",
+	"Slow Roll-Off Filter",
+	"Short Delay Sharp Roll-Off Filter",
+	"Short Delay Slow Roll-Off Filter",
+	"Voice Filter"
+};
+
+static SOC_ENUM_SINGLE_DECL(ak4619_adc_1_digi_fil, ADC_DF, AD1SL_SHIFT, ak4619_adc_digi_fil_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_adc_2_digi_fil, ADC_DF, AD2SL_SHIFT, ak4619_adc_digi_fil_txt);
+
+/* DAC De-Emphasis Filter select */
+static const char * const ak4619_dac_de_emp_txt[] = {
+	"44.1kHz", "OFF", "48kHz", "32kHz"
+};
+
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_1_de_emp, DAC_DEMP, DEM1_SHIFT, ak4619_dac_de_emp_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_2_de_emp, DAC_DEMP, DEM2_SHIFT, ak4619_dac_de_emp_txt);
+
+/* DAC Digital Filter select */
+static const char * const ak4619_dac_digi_fil_txt[] = {
+	"Sharp Roll-Off Filter",
+	"Slow Roll-Off Filter",
+	"Short Delay Sharp Roll-Off Filter",
+	"Short Delay Slow Roll-Off Filter"
+};
+
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_1_digi_fil, DAC_MF, DA1SL_SHIFT, ak4619_dac_digi_fil_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_2_digi_fil, DAC_MF, DA2SL_SHIFT, ak4619_dac_digi_fil_txt);
+
+/*
+ * Control functions
+ */
+
+static void ak4619_set_deemph(struct snd_soc_component *component)
+{
+	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
+	u8 dem = 0;
+
+	if (!ak4619->deemph_en)
+		return;
+
+	switch (ak4619->playback_rate) {
+	case 32000:
+		dem |= DEM1_32000 | DEM2_32000;
+		break;
+	case 44100:
+		dem |= DEM1_44100 | DEM2_44100;
+		break;
+	case 48000:
+		dem |= DEM1_48000 | DEM2_48000;
+		break;
+	default:
+		dem |= DEM1_OFF | DEM2_OFF;
+		break;
+	}
+	snd_soc_component_update_bits(component, DAC_DEMP, DEM1_MASK | DEM2_MASK, dem);
+}
+
+static int ak4619_put_deemph(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
+	int deemph_en = ucontrol->value.integer.value[0];
+
+	if (deemph_en > 1)
+		return -EINVAL;
+
+	ak4619->deemph_en = deemph_en;
+	ak4619_set_deemph(component);
+
+	return 0;
+}
+
+static int ak4619_get_deemph(struct snd_kcontrol *kcontrol,
+				struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_soc_kcontrol_component(kcontrol);
+	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
+
+	ucontrol->value.integer.value[0] = ak4619->deemph_en;
+
+	return 0;
+};
+
+/*
+ * KControls
+ */
+static const struct snd_kcontrol_new ak4619_snd_controls[] = {
+
+	/* Volume controls */
+	SOC_DOUBLE_R_TLV("DAC 1 Volume", LDAC1, RDAC1, VOLDA_SHIFT, VOLDA_MAX, 1, dac_tlv),
+	SOC_DOUBLE_R_TLV("DAC 2 Volume", LDAC2, RDAC2, VOLDA_SHIFT, VOLDA_MAX, 1, dac_tlv),
+	SOC_DOUBLE_R_TLV("ADC 1 Volume", LADC1, RADC1, VOLAD_SHIFT, VOLAD_MAX, 1, adc_tlv),
+	SOC_DOUBLE_R_TLV("ADC 2 Volume", LADC2, RADC2, VOLAD_SHIFT, VOLAD_MAX, 1, adc_tlv),
+
+	SOC_DOUBLE_TLV("Mic 1 Volume", MIC_AMP1, MGNL_SHIFT, MGNR_SHIFT, MGN_MAX, 0, mic_tlv),
+	SOC_DOUBLE_TLV("Mic 2 Volume", MIC_AMP2, MGNL_SHIFT, MGNR_SHIFT, MGN_MAX, 0, mic_tlv),
+
+	/* Volume Level Transition Time controls */
+	SOC_ENUM("ADC Volume Level Transition Time", ak4619_adc_vol_trans),
+	SOC_ENUM("DAC Volume Level Transition Time", ak4619_dac_vol_trans),
+
+	/* Mute controls */
+	SOC_SINGLE("DAC 1 Switch", DAC_MF, DA1MUTE_SHIFT, DA1MUTE_MAX, 1),
+	SOC_SINGLE("DAC 2 Switch", DAC_MF, DA2MUTE_SHIFT, DA2MUTE_MAX, 1),
+
+	SOC_SINGLE("ADC 1 Switch", ADC_MHPF, AD1MUTE_SHIFT, AD1MUTE_MAX, 1),
+	SOC_SINGLE("ADC 2 Switch", ADC_MHPF, AD2MUTE_SHIFT, AD2MUTE_MAX, 1),
+
+	/* Filter controls */
+	SOC_ENUM("ADC 1 Digital Filter", ak4619_adc_1_digi_fil),
+	SOC_ENUM("ADC 2 Digital Filter", ak4619_adc_2_digi_fil),
+
+	SOC_SINGLE("ADC 1 HPF", ADC_MHPF, AD1HPFN_SHIFT, AD1HPFN_MAX, 1),
+	SOC_SINGLE("ADC 2 HPF", ADC_MHPF, AD2HPFN_SHIFT, AD2HPFN_MAX, 1),
+
+	SOC_ENUM("DAC 1 De-Emphasis Filter", ak4619_dac_1_de_emp),
+	SOC_ENUM("DAC 2 De-Emphasis Filter", ak4619_dac_2_de_emp),
+
+	SOC_ENUM("DAC 1 Digital Filter", ak4619_dac_1_digi_fil),
+	SOC_ENUM("DAC 2 Digital Filter", ak4619_dac_2_digi_fil),
+
+	SOC_SINGLE_BOOL_EXT("Playback De-Emphasis Switch", 0, ak4619_get_deemph, ak4619_put_deemph),
+};
+
+/*
+ * DAPM
+ */
+
+/* Analog input mode */
+static const char * const ak4619_analog_in_txt[] = {
+	"Differential", "Single-Ended1", "Single-Ended2", "Pseudo Differential"
+};
+
+static SOC_ENUM_SINGLE_DECL(ak4619_ad_1_left_in,  ADC_AI, AD1LSEL_SHIFT, ak4619_analog_in_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_ad_1_right_in, ADC_AI, AD1RSEL_SHIFT, ak4619_analog_in_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_ad_2_left_in,  ADC_AI, AD2LSEL_SHIFT, ak4619_analog_in_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_ad_2_right_in, ADC_AI, AD2RSEL_SHIFT, ak4619_analog_in_txt);
+
+static const struct snd_kcontrol_new ak4619_ad_1_left_in_mux =
+	SOC_DAPM_ENUM("Analog Input 1 Left MUX",  ak4619_ad_1_left_in);
+static const struct snd_kcontrol_new ak4619_ad_1_right_in_mux =
+	SOC_DAPM_ENUM("Analog Input 1 Right MUX", ak4619_ad_1_right_in);
+static const struct snd_kcontrol_new ak4619_ad_2_left_in_mux =
+	SOC_DAPM_ENUM("Analog Input 2 Left MUX",  ak4619_ad_2_left_in);
+static const struct snd_kcontrol_new ak4619_ad_2_right_in_mux =
+	SOC_DAPM_ENUM("Analog Input 2 Right MUX", ak4619_ad_2_right_in);
+
+/* DAC source mux */
+static const char * const ak4619_dac_in_txt[] = {
+	"SDIN1", "SDIN2", "SDOUT1", "SDOUT2"
+};
+
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_1_in, DAC_IS, DAC1SEL_SHIFT, ak4619_dac_in_txt);
+static SOC_ENUM_SINGLE_DECL(ak4619_dac_2_in, DAC_IS, DAC2SEL_SHIFT, ak4619_dac_in_txt);
+
+static const struct snd_kcontrol_new ak4619_dac_1_in_mux =
+	SOC_DAPM_ENUM("DAC 1 Source MUX", ak4619_dac_1_in);
+static const struct snd_kcontrol_new ak4619_dac_2_in_mux =
+	SOC_DAPM_ENUM("DAC 2 Source MUX", ak4619_dac_2_in);
+
+static const struct snd_soc_dapm_widget ak4619_dapm_widgets[] = {
+
+	/* DACs */
+	SND_SOC_DAPM_DAC("DAC1", NULL, PWR_MGMT, 1, 0),
+	SND_SOC_DAPM_DAC("DAC2", NULL, PWR_MGMT, 2, 0),
+
+	/* ADCs */
+	SND_SOC_DAPM_ADC("ADC1", NULL, PWR_MGMT, 4, 0),
+	SND_SOC_DAPM_ADC("ADC2", NULL, PWR_MGMT, 5, 0),
+
+	/* Outputs */
+	SND_SOC_DAPM_OUTPUT("AOUT1L"),
+	SND_SOC_DAPM_OUTPUT("AOUT2L"),
+
+	SND_SOC_DAPM_OUTPUT("AOUT1R"),
+	SND_SOC_DAPM_OUTPUT("AOUT2R"),
+
+	/* Inputs */
+	SND_SOC_DAPM_INPUT("AIN1L"),
+	SND_SOC_DAPM_INPUT("AIN2L"),
+	SND_SOC_DAPM_INPUT("AIN4L"),
+	SND_SOC_DAPM_INPUT("AIN5L"),
+
+	SND_SOC_DAPM_INPUT("AIN1R"),
+	SND_SOC_DAPM_INPUT("AIN2R"),
+	SND_SOC_DAPM_INPUT("AIN4R"),
+	SND_SOC_DAPM_INPUT("AIN5R"),
+
+	SND_SOC_DAPM_INPUT("MIC1L"),
+	SND_SOC_DAPM_INPUT("MIC1R"),
+	SND_SOC_DAPM_INPUT("MIC2L"),
+	SND_SOC_DAPM_INPUT("MIC2R"),
+
+	/* DAI */
+	SND_SOC_DAPM_AIF_IN("SDIN1",  "Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_IN("SDIN2",  "Playback", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SDOUT1", "Capture", 0, SND_SOC_NOPM, 0, 0),
+	SND_SOC_DAPM_AIF_OUT("SDOUT2", "Capture", 0, SND_SOC_NOPM, 0, 0),
+
+	/* MUXs for Mic PGA source selection */
+	SND_SOC_DAPM_MUX("Analog Input 1 Left MUX",  SND_SOC_NOPM, 0, 0, &ak4619_ad_1_left_in_mux),
+	SND_SOC_DAPM_MUX("Analog Input 1 Right MUX", SND_SOC_NOPM, 0, 0, &ak4619_ad_1_right_in_mux),
+	SND_SOC_DAPM_MUX("Analog Input 2 Left MUX",  SND_SOC_NOPM, 0, 0, &ak4619_ad_2_left_in_mux),
+	SND_SOC_DAPM_MUX("Analog Input 2 Right MUX", SND_SOC_NOPM, 0, 0, &ak4619_ad_2_right_in_mux),
+
+	/* MUXs for DAC source selection */
+	SND_SOC_DAPM_MUX("DAC 1 Source MUX", SND_SOC_NOPM, 0, 0, &ak4619_dac_1_in_mux),
+	SND_SOC_DAPM_MUX("DAC 2 Source MUX", SND_SOC_NOPM, 0, 0, &ak4619_dac_2_in_mux),
+};
+
+static const struct snd_soc_dapm_route ak4619_intercon[] = {
+	/* Dest       Connecting Widget    Source */
+
+	/* Output path */
+	{"AOUT1L", NULL, "DAC1"},
+	{"AOUT2L", NULL, "DAC2"},
+
+	{"AOUT1R", NULL, "DAC1"},
+	{"AOUT2R", NULL, "DAC2"},
+
+	{"DAC1", NULL, "DAC 1 Source MUX"},
+	{"DAC2", NULL, "DAC 2 Source MUX"},
+
+	{"DAC 1 Source MUX", "SDIN1",  "SDIN1"},
+	{"DAC 1 Source MUX", "SDIN2",  "SDIN2"},
+	{"DAC 1 Source MUX", "SDOUT1", "SDOUT1"},
+	{"DAC 1 Source MUX", "SDOUT2", "SDOUT2"},
+
+	{"DAC 2 Source MUX", "SDIN1",  "SDIN1"},
+	{"DAC 2 Source MUX", "SDIN2",  "SDIN2"},
+	{"DAC 2 Source MUX", "SDOUT1", "SDOUT1"},
+	{"DAC 2 Source MUX", "SDOUT2", "SDOUT2"},
+
+	/* Input path */
+	{"SDOUT1", NULL, "ADC1"},
+	{"SDOUT2", NULL, "ADC2"},
+
+	{"ADC1", NULL, "Analog Input 1 Left MUX"},
+	{"ADC1", NULL, "Analog Input 1 Right MUX"},
+
+	{"ADC2", NULL, "Analog Input 2 Left MUX"},
+	{"ADC2", NULL, "Analog Input 2 Right MUX"},
+
+	{"Analog Input 1 Left MUX", "Differential",		"MIC1L"},
+	{"Analog Input 1 Left MUX", "Single-Ended1",		"MIC1L"},
+	{"Analog Input 1 Left MUX", "Single-Ended2",		"MIC1L"},
+	{"Analog Input 1 Left MUX", "Pseudo Differential",	"MIC1L"},
+
+	{"Analog Input 1 Right MUX", "Differential",		"MIC1R"},
+	{"Analog Input 1 Right MUX", "Single-Ended1",		"MIC1R"},
+	{"Analog Input 1 Right MUX", "Single-Ended2",		"MIC1R"},
+	{"Analog Input 1 Right MUX", "Pseudo Differential",	"MIC1R"},
+
+	{"Analog Input 2 Left MUX", "Differential",		"MIC2L"},
+	{"Analog Input 2 Left MUX", "Single-Ended1",		"MIC2L"},
+	{"Analog Input 2 Left MUX", "Single-Ended2",		"MIC2L"},
+	{"Analog Input 2 Left MUX", "Pseudo Differential",	"MIC2L"},
+
+	{"Analog Input 2 Right MUX", "Differential",		"MIC2R"},
+	{"Analog Input 2 Right MUX", "Single-Ended1",		"MIC2R"},
+	{"Analog Input 2 Right MUX", "Single-Ended2",		"MIC2R"},
+	{"Analog Input 2 Right MUX", "Pseudo Differential",	"MIC2R"},
+
+	{"MIC1L", NULL, "AIN1L"},
+	{"MIC1L", NULL, "AIN2L"},
+
+	{"MIC1R", NULL, "AIN1R"},
+	{"MIC1R", NULL, "AIN2R"},
+
+	{"MIC2L", NULL, "AIN4L"},
+	{"MIC2L", NULL, "AIN5L"},
+
+	{"MIC2R", NULL, "AIN4R"},
+	{"MIC2R", NULL, "AIN5R"},
+};
+
+static const struct reg_default ak4619_reg_defaults[] = {
+	{ PWR_MGMT,	0x00 },
+	{ AU_IFF1,	0x0C },
+	{ AU_IFF2,	0x0C },
+	{ SYS_CLK,	0x00 },
+	{ MIC_AMP1,	0x22 },
+	{ MIC_AMP2,	0x22 },
+	{ LADC1,	0x30 },
+	{ RADC1,	0x30 },
+	{ LADC2,	0x30 },
+	{ RADC2,	0x30 },
+	{ ADC_DF,	0x00 },
+	{ ADC_AI,	0x00 },
+	{ ADC_MHPF,	0x00 },
+	{ LDAC1,	0x18 },
+	{ RDAC1,	0x18 },
+	{ LDAC2,	0x18 },
+	{ RDAC2,	0x18 },
+	{ DAC_IS,	0x04 },
+	{ DAC_DEMP,	0x05 },
+	{ DAC_MF,	0x0A },
+};
+
+static int ak4619_set_bias_level(struct snd_soc_component *component,
+				 enum snd_soc_bias_level level)
+{
+	u8 pwr_ctrl = 0;
+
+	switch (level) {
+	case SND_SOC_BIAS_ON:
+		pwr_ctrl |= RSTN;
+		fallthrough;
+	case SND_SOC_BIAS_PREPARE:
+		pwr_ctrl |= PMAD1 | PMAD2 | PMDA1 | PMDA2;
+		fallthrough;
+	case SND_SOC_BIAS_STANDBY:
+	case SND_SOC_BIAS_OFF:
+	default:
+		break;
+	}
+
+	snd_soc_component_write(component, PWR_MGMT, pwr_ctrl);
+
+	return 0;
+}
+
+static int ak4619_dai_hw_params(struct snd_pcm_substream *substream,
+				struct snd_pcm_hw_params *params,
+				struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
+	unsigned int width;
+	unsigned int rate;
+	unsigned int fs;
+	bool is_play = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
+	u8 dai_ctrl = 0;
+	u8 clk_mode = 0;
+
+	width = params_width(params);
+	switch (width) {
+	case 16:
+		dai_ctrl |= is_play ? DIDL_16 : DODL_16;
+		break;
+	case 20:
+		dai_ctrl |= is_play ? DIDL_20 : DODL_20;
+		break;
+	case 24:
+		dai_ctrl |= is_play ? DIDL_24 : DODL_24;
+		break;
+	case 32:
+		if (is_play)
+			dai_ctrl |= DIDL_32;
+		else
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	rate = params_rate(params);
+	if (rate)
+		fs = ak4619->sysclk / rate;
+	else
+		return -EINVAL;
+
+	switch (rate) {
+	case  8000:
+	case 11025:
+	case 12000:
+	case 16000:
+	case 22050:
+	case 24000:
+	case 32000:
+	case 44100:
+	case 48000:
+		switch (fs) {
+		case 256:
+			clk_mode |= (0x0 << 0);
+			break;
+		case 384:
+			clk_mode |= (0x2 << 0);
+			break;
+		case 512:
+			clk_mode |= (0x3 << 0);
+			break;
+		default:
+			return -EINVAL;
+		}
+		break;
+	case 64000:
+	case 88200:
+	case 96000:
+		if (fs == 256)
+			clk_mode |= (0x1 << 0);
+		else
+			return -EINVAL;
+		break;
+	case 176400:
+	case 192000:
+		if (fs == 128)
+			clk_mode |= (0x4 << 0);
+		else
+			return -EINVAL;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	snd_soc_component_update_bits(component, SYS_CLK, FS_MASK, clk_mode);
+	snd_soc_component_update_bits(component, AU_IFF2,
+				      is_play ? DIDL_MASK : DODL_MASK, dai_ctrl);
+
+	if (is_play) {
+		ak4619->playback_rate = rate;
+		ak4619_set_deemph(component);
+	}
+
+	return 0;
+}
+
+static int ak4619_dai_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct snd_soc_component *component = dai->component;
+	u8 dai_fmt1 = 0;
+	u8 dai_fmt2 = 0;
+
+	/* Set clock normal/inverted */
+	switch (fmt & SND_SOC_DAIFMT_INV_MASK) {
+	case SND_SOC_DAIFMT_NB_NF:
+		break;
+	case SND_SOC_DAIFMT_IB_NF:
+		dai_fmt1 |= BCKP;
+		break;
+	case SND_SOC_DAIFMT_NB_IF:
+	case SND_SOC_DAIFMT_IB_IF:
+	default:
+		return -EINVAL;
+	}
+
+	/* Only Stereo modes are supported */
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		dai_fmt1 |= DCF_STEREO_I2S;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		dai_fmt1 |= DCF_STEREO_MSB;
+		break;
+	case SND_SOC_DAIFMT_DSP_A: /* L data MSB after FRM LRC */
+		dai_fmt1 |= DCF_PCM_SF;
+		dai_fmt2 |= SLOT;
+		break;
+	case SND_SOC_DAIFMT_DSP_B: /* L data MSB during FRM LRC */
+		dai_fmt1 |= DCF_PCM_LF;
+		dai_fmt2 |= SLOT;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Only slave mode is support */
+	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
+	case SND_SOC_DAIFMT_CBS_CFS:
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* By default only 64 BICK per LRCLK is supported */
+	dai_fmt1 |= DSL_32;
+
+	snd_soc_component_update_bits(component, AU_IFF1, DCF_MASK |
+					DSL_MASK | BCKP, dai_fmt1);
+	snd_soc_component_update_bits(component, AU_IFF2, SLOT, dai_fmt2);
+
+	return 0;
+}
+
+static int ak4619_dai_set_sysclk(struct snd_soc_dai *codec_dai,
+				 int clk_id, unsigned int freq, int dir)
+{
+	struct snd_soc_component *component = codec_dai->component;
+	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
+
+	ak4619->sysclk = freq;
+
+	return 0;
+}
+
+static int ak4619_dai_mute(struct snd_soc_dai *dai, int mute, int direction)
+{
+	struct snd_soc_component *component = dai->component;
+
+	snd_soc_component_update_bits(component, DAC_MF, DA1MUTE_EN, mute ? DA1MUTE_EN : 0);
+	snd_soc_component_update_bits(component, DAC_MF, DA2MUTE_EN, mute ? DA2MUTE_EN : 0);
+
+	return 0;
+}
+
+static void ak4619_hw_constraints(struct ak4619_priv *ak4619,
+				  struct snd_pcm_runtime *runtime)
+{
+	struct snd_pcm_hw_constraint_list *constraint = &ak4619->constraint;
+	int ak4619_rate_mask = 0;
+	unsigned int fs;
+	int i;
+	static const unsigned int ak4619_sr[] = {
+		  8000,
+		 11025,
+		 12000,
+		 16000,
+		 22050,
+		 24000,
+		 32000,
+		 44100,
+		 48000,
+		 64000,
+		 88200,
+		 96000,
+		176400,
+		192000,
+	};
+
+	/*
+	 *	[8kHz - 48kHz]		: 256fs, 384fs or 512fs
+	 *	[64kHz - 96kHz]		: 256fs
+	 *	[176.4kHz, 192kHz]	: 128fs
+	 */
+
+	for (i = 0; i < ARRAY_SIZE(ak4619_sr); i++) {
+		fs = ak4619->sysclk / ak4619_sr[i];
+
+		switch (fs) {
+		case 512:
+		case 384:
+		case 256:
+			ak4619_rate_mask |= (1 << i);
+			break;
+		case 128:
+			switch (i) {
+			case (ARRAY_SIZE(ak4619_sr) - 1):
+			case (ARRAY_SIZE(ak4619_sr) - 2):
+				ak4619_rate_mask |= (1 << i);
+				break;
+			default:
+				break;
+			}
+			break;
+		default:
+			break;
+		}
+	};
+
+	constraint->list	= ak4619_sr;
+	constraint->mask	= ak4619_rate_mask;
+	constraint->count	= ARRAY_SIZE(ak4619_sr);
+
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE, constraint);
+};
+
+#define PLAYBACK_MODE	0
+#define CAPTURE_MODE	1
+
+static int ak4619_dai_startup(struct snd_pcm_substream *substream,
+			      struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct ak4619_priv *ak4619 = snd_soc_component_get_drvdata(component);
+
+	ak4619_hw_constraints(ak4619, substream->runtime);
+
+	return 0;
+}
+
+static u64 ak4619_dai_formats[] = {
+	/*
+	 * Select below from Sound Card, not here
+	 *	SND_SOC_DAIFMT_CBC_CFC
+	 *	SND_SOC_DAIFMT_CBP_CFP
+	 */
+
+	/* First Priority */
+	SND_SOC_POSSIBLE_DAIFMT_I2S	|
+	SND_SOC_POSSIBLE_DAIFMT_LEFT_J,
+
+	/* Second Priority */
+	SND_SOC_POSSIBLE_DAIFMT_DSP_A	|
+	SND_SOC_POSSIBLE_DAIFMT_DSP_B,
+};
+
+static struct snd_soc_dai_ops ak4619_dai_ops = {
+	.startup			= ak4619_dai_startup,
+	.set_sysclk			= ak4619_dai_set_sysclk,
+	.set_fmt			= ak4619_dai_set_fmt,
+	.hw_params			= ak4619_dai_hw_params,
+	.mute_stream			= ak4619_dai_mute,
+	.auto_selectable_formats	= ak4619_dai_formats,
+	.num_auto_selectable_formats	= ARRAY_SIZE(ak4619_dai_formats),
+};
+
+static const struct snd_soc_component_driver soc_component_dev_ak4619 = {
+	.set_bias_level		= ak4619_set_bias_level,
+	.controls		= ak4619_snd_controls,
+	.num_controls		= ARRAY_SIZE(ak4619_snd_controls),
+	.dapm_widgets		= ak4619_dapm_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(ak4619_dapm_widgets),
+	.dapm_routes		= ak4619_intercon,
+	.num_dapm_routes	= ARRAY_SIZE(ak4619_intercon),
+	.idle_bias_on		= 1,
+	.endianness		= 1,
+};
+
+static const struct regmap_config ak4619_regmap_cfg = {
+	.reg_bits		= 8,
+	.val_bits		= 8,
+	.max_register		= 0x14,
+	.reg_defaults		= ak4619_reg_defaults,
+	.num_reg_defaults	= ARRAY_SIZE(ak4619_reg_defaults),
+	.cache_type		= REGCACHE_RBTREE,
+};
+
+static const struct of_device_id ak4619_of_match[] = {
+	{ .compatible = "asahi-kasei,ak4619",	.data = &ak4619_regmap_cfg },
+	{},
+};
+MODULE_DEVICE_TABLE(of, ak4619_of_match);
+
+static const struct i2c_device_id ak4619_i2c_id[] = {
+	{ "ak4619", (kernel_ulong_t)&ak4619_regmap_cfg },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, ak4619_i2c_id);
+
+#define AK4619_RATES	SNDRV_PCM_RATE_8000_192000
+
+#define AK4619_DAC_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE |\
+				 SNDRV_PCM_FMTBIT_S20_LE |\
+				 SNDRV_PCM_FMTBIT_S24_LE |\
+				 SNDRV_PCM_FMTBIT_S32_LE)
+
+#define AK4619_ADC_FORMATS	(SNDRV_PCM_FMTBIT_S16_LE |\
+				 SNDRV_PCM_FMTBIT_S20_LE |\
+				 SNDRV_PCM_FMTBIT_S24_LE)
+
+static struct snd_soc_dai_driver ak4619_dai = {
+	.name = "ak4619-hifi",
+	.playback = {
+		.stream_name	= "Playback",
+		.channels_min	= 1,
+		.channels_max	= 2,
+		.rates		= AK4619_RATES,
+		.formats	= AK4619_DAC_FORMATS,
+	},
+	.capture = {
+		.stream_name	= "Capture",
+		.channels_min	= 1,
+		.channels_max	= 2,
+		.rates		= AK4619_RATES,
+		.formats	= AK4619_ADC_FORMATS,
+	},
+	.ops			= &ak4619_dai_ops,
+	.symmetric_rate		= 1,
+};
+
+static int ak4619_i2c_probe(struct i2c_client *i2c)
+{
+	struct device *dev = &i2c->dev;
+	struct ak4619_priv *ak4619;
+	int ret;
+
+	ak4619 = devm_kzalloc(dev, sizeof(struct ak4619_priv), GFP_KERNEL);
+	if (!ak4619)
+		return -ENOMEM;
+
+	i2c_set_clientdata(i2c, ak4619);
+
+	ak4619->regmap = devm_regmap_init_i2c(i2c, &ak4619_regmap_cfg);
+	if (IS_ERR(ak4619->regmap)) {
+		ret = PTR_ERR(ak4619->regmap);
+		dev_err(dev, "regmap_init() failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = devm_snd_soc_register_component(dev, &soc_component_dev_ak4619,
+				      &ak4619_dai, 1);
+	if (ret < 0) {
+		dev_err(dev, "Failed to register ak4619 component: %d\n",
+			ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct i2c_driver ak4619_i2c_driver = {
+	.driver = {
+		.name = "ak4619-codec",
+		.of_match_table = ak4619_of_match,
+	},
+	.probe		= ak4619_i2c_probe,
+	.id_table	= ak4619_i2c_id,
+};
+module_i2c_driver(ak4619_i2c_driver);
+
+MODULE_DESCRIPTION("SoC AK4619 driver");
+MODULE_AUTHOR("Khanh Le <khanh.le.xr@renesas.com>");
+MODULE_LICENSE("GPL v2");
-- 
2.43.0

