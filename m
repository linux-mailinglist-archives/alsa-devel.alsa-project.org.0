Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D61699DB0A
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Oct 2024 03:01:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF8DDEA3;
	Tue, 15 Oct 2024 03:01:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF8DDEA3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1728954072;
	bh=gb8047m6aUcDhBvJPYS6TSjIVhl4bb/0b9SN+1QCZQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fwWQb31qfywDCKk8K0Qz6QZ6i9q/LFAgPJtdBfF3oheXmOFXNV8mgWKl6K2nGyaZV
	 ka39J5zD2CnITwEdyXtsc8TaYAAOIdzEoL3y88p48CKYAap+RIC77ofz9SEpdZiUO6
	 oLw1TnfWfIOvvb2/6sAks/F8jczoi0ES4PBcSg+8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E9F28F80C06; Tue, 15 Oct 2024 02:57:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 13738F808E7;
	Tue, 15 Oct 2024 02:57:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E96DEF80791; Tue, 15 Oct 2024 02:56:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 78265F80794
	for <alsa-devel@alsa-project.org>; Tue, 15 Oct 2024 02:56:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78265F80794
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=nIwkuqb4
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q29kckRr4xdwVOMtrUFOMe2hCYmGaf9mctgRsoXHmHutpLiup3HlWMNfhT8GtcBQmGhBN1LsqvUhYwQshUZPl/FTMF36HUUAJMAAhdd7SEgcSEsxkZfxydXvZ1by+fZ8bJwvjfdn5da7f+Ziz27baOx98bI8yGBdxjZ/09QrvRR3CpTIZvqpec9tLlnA/xH/WOWAdo+ht2rOaIjmV4OkjGmxCwZleFDmoYjqRkrYqop3tsg1Ym/6OWyEOTOevlN9F8VQc2OFIOX++7WSjaz3s2HneW82q/zYxbT1O+vyU18Q9vW5LpTxIpbZcuJEbREZigNnPfyLqZei4oblZHhGKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zF9L7c8BWVpiszPzAdAnNL/OjGbbyqG4WtEn5uBwTt8=;
 b=j6i12dTcC1dwTtatfAs+MGjV64lYfAz9kcVC+LzW7S6upEhXY49oD7V3+P7FxBgFLFPsyQYOiVptR+RieN0ZMCI7tr2yT9QlCSfnwVDJnYIzyt6c29gKIEHUniYxlAaiFr2PXFtQ5FdKGbFhuKJuQhiHjpsfwFRcA93slS1hIhcsvQC30cM0eDZMMmoL3GdLO7pJ59XvCm0m8nm//87fMqS9zfGXlFIFOS4CdURDlErEP95hES4UXANHGCva1M5WvYpQIUYZBkSa3v5HIJRmcH7O1Ps+07xAoG1MjrbVQb5i4YLpA9qGBr8gVhUeW45rXRoHRHGlldjS9GgLYgQ2rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF9L7c8BWVpiszPzAdAnNL/OjGbbyqG4WtEn5uBwTt8=;
 b=nIwkuqb4m7IvBpmtsRnlYyqn00lNoZoJoQqoY+O5vqXQj6Y0sBqn9KuDd/Suf4RUygj6HOxKGxYX1uCYILaeynLe5OvHwdCcPsFAsMmQQG/umJWh8HK9aP4/d/gdQBGQLZWFWjZcFtVquaGbZ83kdF+79N79CxvT8WkpZgmKufA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYCPR01MB7121.jpnprd01.prod.outlook.com
 (2603:1096:400:c0::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 00:56:45 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%4]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 00:56:45 +0000
Message-ID: <877caaqj3m.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 12/13] ASoC: doc: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
References: <87o73mqj5b.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 15 Oct 2024 00:56:45 +0000
X-ClientProxiedBy: TYCP286CA0209.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::12) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYCPR01MB7121:EE_
X-MS-Office365-Filtering-Correlation-Id: 350ebd5f-1d3c-4566-aa80-08dcecb43def
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?LDxFP3yd/xlQeqjKe2lWruKFN6eC7YD7vjgScQ1y+s2+8g5CPFDonf6uJeEV?=
 =?us-ascii?Q?+IvDb0csY3q37GfZ8RbLV2pXZFO/VHjG3Lp5VsqkJTI9WpL/knhWFNacRs2p?=
 =?us-ascii?Q?aiVVmG4wyyA3MJyg7LYVcu+Wn1/gPENukmTG2HGkna/Gbazz5cticIKH5Ds2?=
 =?us-ascii?Q?AugguZXOwRac8hUx/4Ye3PfLzhgKTTecUpcs2Ao/1zotDX1qGsLbs9dqRc1s?=
 =?us-ascii?Q?zIV3wg/i1mcGI3X1DP2vpququ/6abiolqQwJ5f0tKQnmfYVcwW/93XKrMGzO?=
 =?us-ascii?Q?t5PAaMj2XVDTk1h6JJTF03ffcGAtmp8O9tS23ptwLNLCiX0+ajgTbg2mxHLi?=
 =?us-ascii?Q?KpCOno/mtHVg1R8axtQHUuJoufD9t6rrq0htJi/BuF/c2GQz4lYLGpUVxmFb?=
 =?us-ascii?Q?GJW43ETAt+0AFQuROvKWuOLKTt+gLzv61/ATRGuoo2cagCgpq4rkcrCdazQz?=
 =?us-ascii?Q?0OKxi3YxDRb0IbB8N2DuEOiSe2aq7cn7T/3KbMVNi3ono9W/KLOSo1eQR2At?=
 =?us-ascii?Q?57KiRQ8AykvgQ1+DFklpEbwq4XwGQWQLqwI4lGiXUBKpLFJSIsJo4OcobzTO?=
 =?us-ascii?Q?MNwp/qeWuQSueLkA+HN4iUqSpNoED8VuCC1zi4Ntk7WA5Nx9M4vDDSBbkDo+?=
 =?us-ascii?Q?v5RNTylutxeAdZyXnpXR68mgjg7Od4YH8hDTcGkiUuS8ZHstTDy/rhMncbM4?=
 =?us-ascii?Q?x4s7Bod5c5pKBImwxKv44zUPIlxic/oNSJjsACTKp1YKhz+JI2CBt9y8uU8x?=
 =?us-ascii?Q?m08NUKZ1T4vmHkTcZUqQOpBSRqtWRIYi4nwkEsjNnSxdoqIK58tQsqiyjtC5?=
 =?us-ascii?Q?pz74nJOYpRbtMib1ROsYrd3yqaypnv9qlq3EkC3Ho8iw7S+jW4y9nHPHFtL+?=
 =?us-ascii?Q?+9C4bTePoTJ7SeLsWAQ+FpgeMx43zhoqcmWNfCZr5G3QpACek0lG25y1HZBe?=
 =?us-ascii?Q?T/i+E8XB3jPs+EeXD6KBMOMwnlrbMYcpAkJIVhMntCM1DTSSXwmo5/rCqVvs?=
 =?us-ascii?Q?fFJgN/okivcGUYPmReuF0DAlWz6pzBx8+SinuRt5iOm+7ckPtF1GlelziqQk?=
 =?us-ascii?Q?WSe23IOF1U7DN6Xy4jWysFTemh8f59FeJoxsnfkOnkkTFh6WqrTPCLOy7PW7?=
 =?us-ascii?Q?cuwKp17GeaciDSewin1g57HRLi1ZnYOUTk8IDcowr9qKGFoNSPZ2fa6w8TNI?=
 =?us-ascii?Q?Le+AS5LsJM+Nm/wpVqwKnqgY8/aTWHcGpABVdBxpPRbAJZ4+vYtqFtZm1Gr+?=
 =?us-ascii?Q?dzkQRSobaNouR1TC/bi0M0OiRdNqffwfnRzwWRtvu22mmKhwL4cuKi91LGLv?=
 =?us-ascii?Q?wnCiawP8P9UGlxGEEsGBscZLasylIN67NJGnU4BmBpoaEA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xD5I0wG2hnk0pUNmPWMC+5cW0SApwIpEAg9R6WIaJfYQVkovgjoXymaCsIFE?=
 =?us-ascii?Q?KLy9JCMTw/LuZAJzncJfy/5TFyTqkiWEw29TtvxbZZbxyhlPwBWiSlwnVZXZ?=
 =?us-ascii?Q?LH//HI8yEK+jt7hakKukDFeKJSQN0J+EnRn+1xxDQTq24cbQQjRu+6ZqZnC8?=
 =?us-ascii?Q?X6Yt4GsV9c6PAuYszckSW4KcKKACKcONz24xZYoFl6rSW26DsS9lwGHilmMm?=
 =?us-ascii?Q?HmbLdYoFlbi7Ohrdx75JMKR+UIvFIiZLO6QJ92FFBVBszXCq7m4C4arrco2r?=
 =?us-ascii?Q?NlYqvFOdA42MvHhsKGINRln5s5Lp1HJ075hBsFvWw2r2VZgUGUI0zTlggZEk?=
 =?us-ascii?Q?0rG/BK3BXHAuGBmwLIUCxz99yRaY5W6zI9XiOqOBgCcKcjm2TadPJhtrGufT?=
 =?us-ascii?Q?ETp9WlFvTB3i8ZDGJ0jJjAZrUkF+Ced1S5iImtwKaMG4pZmcq9IWImwTa6sr?=
 =?us-ascii?Q?S7bYOLxT7Tpl1sS/Y6MT3rIYdveM8rEAWhGP+nEAkxCwmZwSeeQzIA/KAS+C?=
 =?us-ascii?Q?LSjGAQWCvH5uOP+5LHM00Noz1IoHn4l2eI4R1rVJuPuob8MwyIG7GPYR+7ZY?=
 =?us-ascii?Q?hMCQKFs6sec8wTvzBhVi6bkUvH2GVkk8HxR0ez5HwbZiXl4fAcCpVuSjslks?=
 =?us-ascii?Q?8UCN0kjujsCg4l4KqS3urAa8iUKRRdEhf5eyH0txmd4rV54zdJjZn/KYpOVe?=
 =?us-ascii?Q?S2sOXGm1DmJKX8qZxDgME3uNj2PE9K1h1Fmdzc9sk9nDlX9akHjQ7C+qGPWf?=
 =?us-ascii?Q?8k+1uvGFqXcJ8Zch/X2z/pMXdwpn8Bxn82eljfdlbeQK4nMry1tLzgmPNhgy?=
 =?us-ascii?Q?XBJwV6+/G/AxoJhW78DlKk7mGUVQhED9/MkExgNDOnup1ijTAJwlEkx1i3qY?=
 =?us-ascii?Q?td5KP9SykiGJQOREmdTJHVfrCC3Hs+V845TeN3PyV8bCnpFpcjjSe70bnSge?=
 =?us-ascii?Q?JfP0+riFeG2klvIZQapBah7RMymEGtDPHhIncvWYQBauosOfZzJTTFY6pvv6?=
 =?us-ascii?Q?HNfeUOH3wD1HniXhZ0AzF+6jYZzW84eS5iMrYfxiLet/K1d8dRnEoghT4qAK?=
 =?us-ascii?Q?dGnv2t741+Q3Hk/XMFhAwCoElxSxrjuC05+O3mUGSApqfsi4Ci1e+WW3OW42?=
 =?us-ascii?Q?XfAzbs7z64jg/G+kupk6y/FK+9n3Zdu0uT3okIUeDkY7fNuH4lddE7cBJsa3?=
 =?us-ascii?Q?5ib8grdjbcErvmn90KzTqWopFFPg856ARlOy1Phh/dOqPx4/sPL8SjBFp01g?=
 =?us-ascii?Q?p3Jvi3WNWxtTkDQs3YbG3Cq9wQqIYo9cXK7jI9BqC7p6fZgd3ukRg8aWMZwP?=
 =?us-ascii?Q?1AT8eh6Ne8nPa6giAdI09VPM2Fgk4PGy+sUTEFwxONG9WKX0h3ikFR8JNdvU?=
 =?us-ascii?Q?jqRb3tvA4jGyJb7/WwcImyUm7HSNvkiM3ACWVhd1ecpBVEg/4AkIiSG+Ycxp?=
 =?us-ascii?Q?mJ9QORlaHwKnnBLkIJ+Pk3E+btv5l2JB5QtdHZVOj6FTgGD4eNKenmEq9JA0?=
 =?us-ascii?Q?W72e/gP/Twq5I3dwM8dQoky2nuRnvSrFr2H0x6zQKE5ymu0B30WNWuewh9Dk?=
 =?us-ascii?Q?8qAgPsjxl7Ha/bWToluouCrkYoSMIEo1fOzaZO5hJ6ZmGBTOuMo28NXwdg0E?=
 =?us-ascii?Q?bCbV20lS1ARxeNd89Ks/nqs=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 350ebd5f-1d3c-4566-aa80-08dcecb43def
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 00:56:45.8191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 eGDC+g09kIcfQBxF+PHPs/re06drqdMly9odYLISWshyHPe8W5y+yKvviKeWiwcA3yuVJruLCusN5hmRc718XmVjsd/CWWdNPjefhu2m3YaFOTsSRK5ci9UvFCxPTUI+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7121
Message-ID-Hash: EHPIAA4MO5QNUM443YE4ND2EODBT6XUU
X-Message-ID-Hash: EHPIAA4MO5QNUM443YE4ND2EODBT6XUU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EHPIAA4MO5QNUM443YE4ND2EODBT6XUU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. Let's remove it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/sound/soc/dpcm.rst | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/Documentation/sound/soc/dpcm.rst b/Documentation/sound/soc/dpcm.rst
index 2d7ad1d915043..02419a6f82132 100644
--- a/Documentation/sound/soc/dpcm.rst
+++ b/Documentation/sound/soc/dpcm.rst
@@ -157,15 +157,13 @@ FE DAI links are defined as follows :-
 		.codec_dai_name = "snd-soc-dummy-dai",
 		.dynamic = 1,
 		.trigger = {SND_SOC_DPCM_TRIGGER_POST, SND_SOC_DPCM_TRIGGER_POST},
-		.dpcm_playback = 1,
 	},
 	.....< other FE and BE DAI links here >
   };
 
 This FE DAI link is pretty similar to a regular DAI link except that we also
-set the DAI link to a DPCM FE with the ``dynamic = 1``. The supported FE stream
-directions should also be set with the ``dpcm_playback`` and ``dpcm_capture``
-flags. There is also an option to specify the ordering of the trigger call for
+set the DAI link to a DPCM FE with the ``dynamic = 1``.
+There is also an option to specify the ordering of the trigger call for
 each FE. This allows the ASoC core to trigger the DSP before or after the other
 components (as some DSPs have strong requirements for the ordering DAI/DSP
 start and stop sequences).
@@ -189,15 +187,12 @@ The BE DAIs are configured as follows :-
 		.ignore_pmdown_time = 1,
 		.be_hw_params_fixup = hswult_ssp0_fixup,
 		.ops = &haswell_ops,
-		.dpcm_playback = 1,
-		.dpcm_capture = 1,
 	},
 	.....< other BE DAI links here >
   };
 
 This BE DAI link connects DAI0 to the codec (in this case RT5460 AIF1). It sets
-the ``no_pcm`` flag to mark it has a BE and sets flags for supported stream
-directions using ``dpcm_playback`` and ``dpcm_capture`` above.
+the ``no_pcm`` flag to mark it has a BE.
 
 The BE has also flags set for ignoring suspend and PM down time. This allows
 the BE to work in a hostless mode where the host CPU is not transferring data
-- 
2.43.0

