Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E41F89494F
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Apr 2024 04:24:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0F51E2365;
	Tue,  2 Apr 2024 04:24:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0F51E2365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712024681;
	bh=imr6LLdepZU7O3oyZ8k24EkLEf4w7YVaQb5SkLhCvYg=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Dg85QHohethS7hJ77phhVBNFvVwa9bkEQfJ3djoN0LCxgeMKcs9pHzrNMYGhphCrY
	 Ln/iTXssjdAi/dWj7/bWDG8qNEeLvQJF+2XaLoEzmftHF4RGmuPSMYjX5h4xdl6p+E
	 CT2rwoS8rg2dpiq8nnvcHcaYgAJ/m+H4NFv2m+HQ=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3AEC4F805C9; Tue,  2 Apr 2024 04:24:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 44200F805BD;
	Tue,  2 Apr 2024 04:24:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5219DF8056F; Tue,  2 Apr 2024 04:24:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,UPPERCASE_50_75,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 86B3DF8020D
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 04:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86B3DF8020D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=VgIgjSw7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jE4abYjpLk0uJJOGLDua3UM5R6Y/l1SiLQ/gOybW0PH5pfDZYx9tmTQnIRMyQBj+CtSmQNQ76PHvynlhikP5z267i439Khzd7uzCfv5vk612fgTsQe5+9WkwFsrnCH6HfMGI/qBzH1bcXnZqyI+NXKFxyJhrA9z/l3iD440WmltT5hvtR3Fk1nBQ0WJYskIwp2Ze5bawYd3oJ7bQ2mYdQS1V/p43Fg6vtt14f3HjYp+U2XpmBhYBl/TW2pJblJtlObiJ6n54T1tcDh1+3YuuTRcXkv+CltUbci04a3wAT5oz+f6sZB7o6DD5mHG2kOlqFQqo8DyNQeJlEbmoDupp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7/ucwcPvxY7Z60g819eDci6fkhK6+purnpVXXwICTZk=;
 b=cHTXfv5ZUvK+Uk5LGJor7Fy+Fjg6Xh6QErqw8ZTKhlP6WUtWGI4L+j+Hngjlu4Hgs26sOCl2CEtWKgEednOb48g681l6LG/q8ADPGd7q6zf1gBFXCut0KpJo37d1ViATXOM9gnNnKjPtcwts+UBRB12EdjpxdbSCEhM5NL4jU2RmZfyHmYsDwQc3MM9ogSQ0JVQ5S7aX9WaDQ5ylxgneYDL+kGtYl5tjNsDhv3LSICbsRmdrEdWZa3b70X+pKo1MM21nhil2tXqwaG+XF+mW1pE9NbvP2/2j7YuBvnQ5mqRCISakaT4jk9X2Y4zSEOx5tPlhHRcg2LW/YknFlKGmtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7/ucwcPvxY7Z60g819eDci6fkhK6+purnpVXXwICTZk=;
 b=VgIgjSw7/OFOjEhaU3nPw+hQYFWUcs7XznDSz3dd6eqGWwIpUgmPk8fKOjxKjF3N2unsWXcHcNgrexvilwRIPgIobM8zfHB1iUItNRRRza8fp1xVioNfA3aWdS1oz8EYi0wgi+NwSO0U+kjIru7KiU1uqoKLOrZ6h31YiY+pU5w=
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5959.jpnprd01.prod.outlook.com
 (2603:1096:604:d9::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.45; Tue, 2 Apr
 2024 02:23:54 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::131e:55c0:a4a0:713b%7]) with mapi id 15.20.7386.025; Tue, 2 Apr 2024
 02:23:54 +0000
Message-ID: <871q7obiyt.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Khanh Le <khanh.le.xr@renesas.com>
In-Reply-To: <8734s4bizh.wl-kuninori.morimoto.gx@renesas.com>
References: <8734s4bizh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 1/5] ASoC: rsnd: cleanup regmap table
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 2 Apr 2024 02:23:54 +0000
X-ClientProxiedBy: TYCP286CA0146.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5959:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	ZZXKDVNsDSqFLuFp3PGvIB59u9BaYA3OlzuVygAUIml3t+j63D9GETQ8rATc4haH0WVw87HP3JRu0DN4kgDITZyDlNq5l0f2jv4VDpxBwzpD3VsAgC9/TbEg2OYApS3GmquZHpOHWUmco0s5+BPPzZJT/tiGfcaCull5509EnDOy5xGaaQZ3imeXCZ6qK3onzntq5hreOqVmBB0e1sNoCx7xrnPW4QAXSjqjM4aLJtb90zXgciPGy6+vP/j2UOxPg+ed3DlFrr4UiCqqemV7NS1BssVh7iYzcFbP9GJFnnghMqx67iejm12V+k3QuAk4tJFRUieHjycz2IF7amQO8iDAQIXblgt1j5bvh36XxHsD96DF6xNrQvpYLnE+kstTKsFi6tOmbDauNur9btZzIc8URFApHjCCCM7bpgBwA8QVJQszoR26QeUIjonupWjRj2S+LNA4zo57YvQ1axmIvDhk5rvQhKAAQxWHBfwEUGi6+klXfuBh3vhbRdU7U1arqYB5P6aTWiTSAOCb7oo7FqNz+dF8IM52PImncTrZob8NzLQE8L3Z8h1chJG3LMZU7CmXefRNqVUsJqfjMgb11u+0BAviYCFOBExGrjzkbzwyWuBIHyeC95SEI2SoW0AcV8cFmWZq+pojpCEJEr7aJLRIjYkevBI9a3jvNtvMvvbQ7U/vHKIX5b3YY8YgeEmYwasE9S5yE1QzHFaUBGUrzmfdx/OYhrqn0WxLEzMdXY8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rFsAI9xGAJwxH9qo2ds57/AvR0dIwKQEBUkr3PSoabqiEbPFYmjm/waqtKsR?=
 =?us-ascii?Q?cqSYde+3NqWEWI1LWYOnbxZB8I9F3sBkBf7bU3EylPzBaOJ/dezaWDrIbvq7?=
 =?us-ascii?Q?wnOTay06Im4KnGYczY5jIIjPpozxDFaDSwcwCqyrdyPeDPNBHr3TIJguBnhp?=
 =?us-ascii?Q?Q2Vv3JavJzb2/LjOr7eU07LHoydoHrJg7hcqJKZHunfOj3Rm07Qw87+csb/Q?=
 =?us-ascii?Q?X3NhTdIwT+5bOM8QnJT45e0Tu2ozN/bHGtc84pnGkWf83afvTXmTmOhF1cgc?=
 =?us-ascii?Q?Z4QWl/l6mVwXSWrfoYFDirSl9Xdq6G/GZ6SjUVIzfkLe0dWgtkzWud0MR+m5?=
 =?us-ascii?Q?eiVqxE/WGL97ukP2hZBhyE8wg2bu7Meb2+eKQevV+doWRULZ41+mIyffFYaY?=
 =?us-ascii?Q?kMgiXBTbrxKgPY0DgOkF66n9rVLSLYrT1bvbcbQMtiK2YqvY9s0fB2WiEnZq?=
 =?us-ascii?Q?7XOB56M01syKRPamNXh9Szti782CbL3Yn2XzJoXhUYNe/t7T7kU1+d0TSFQg?=
 =?us-ascii?Q?2IoIzQ2Nc0JNwKG9CIBsBbR1U5oAbL3VO7EhhLr/meo/xUd47RUxpdxx8383?=
 =?us-ascii?Q?zwoJJBTNL4NTgFYPvqyxc8m0f/e9a64ZPUmNii4krMAFhBpdwZfZvU1GwDd6?=
 =?us-ascii?Q?Z5o3fXaUBhAQqzwjqMeDFpWM4g76ppj6Ojs5qkqT3KlF/ARY0VDqxg9Wtys4?=
 =?us-ascii?Q?tdJF0OXNfhGLUh/5GxjcwtDrBWnSExSLY+AnP6nWt0SSs4QP9WZ7VhlFq3aw?=
 =?us-ascii?Q?MmtxTRubenN3nwYAv60Xei/5m60ZC64ZYMEMvDvdyiMBHMi68OW6DZP1RVIN?=
 =?us-ascii?Q?7ScjN40rjM9Y0pVPGY7vS2CTry/87TyO46qIn6eUhNpClmHaJLKV4EbbdYfq?=
 =?us-ascii?Q?/n3ZSVLNHHj5m1WY9dLNApRreFgCvUAOvkHx5A3EHdhtmjpy8K5jm6reN3sW?=
 =?us-ascii?Q?oVdhhUx5vVQrk4VNXx1lBjXZxzOU87bsLkzujtd/oHagqBbiDyYH++aKvzsS?=
 =?us-ascii?Q?lvvITcHmAxy0hg4d/6eMaEAqimKrYObF/mqEsPT72peMocjAtfexAcXs5G+E?=
 =?us-ascii?Q?c+wWOiDCVFzJIWr3KeVYX/9o/Pmd/x2rhOwiwRicL6nYSsbl72QfnxqkYmxV?=
 =?us-ascii?Q?aJ3klaXua79iBEDwP3pyW554xpGnNPvRtRNYwmoTK/NVcLeOCBOTkEKv9t3P?=
 =?us-ascii?Q?Nxr/a/B3EVSDDwzFswG02bVIFk57RSgZ5KE35ngTkvC+SKNK6hDbsUtwu7rO?=
 =?us-ascii?Q?wDMrqytFJscuKy3jaFbb2ZuVLEmzK8tzehhehx5Gnz0wqqK9jxzx+t1zoh4h?=
 =?us-ascii?Q?zeO8o1jhurBdPHS3wUx/TVKKlq4pBkfjPEELyoJayxugGiM2XzuGQq0X1Hpt?=
 =?us-ascii?Q?3MouxYXwxzSE8emuRGbIQpZ5B8hCMB4997xnu8MCSb1AfHSumS+WR7R6jsb6?=
 =?us-ascii?Q?C7/Ygj59BFoJ5KuLxvooYM85w4fwT29wN3/HM7R/yVBOkXIOMNGDDC1tL0ib?=
 =?us-ascii?Q?bz05+JcRztQZ+vMl4fK4QbrWFpEGeC49wwqKtGmKnekrw80NrEQhHeSbF1n/?=
 =?us-ascii?Q?BGrrWcKtyVjdcyrgkCL1cFLvj946A0EE4fQ9QzJltkLPAPRiovU9En6Hy3Wo?=
 =?us-ascii?Q?Ql14bkUIuSwwpO1QnovuWYo=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 3a59d40d-b686-4b91-53ac-08dc52bbf19b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2024 02:23:54.7632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rgjlR8Pv+0940BKLF4+hQ4yol8sDHm+U9BARFmKU4G7SfhHX+olni+P6ZjwfcQ0cJbQOE/epGdJev+IkCyoQMVgOKbzbxzKPWeJKfo1dAkQqjeY0ofnLtz6GaAgddlA6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5959
Message-ID-Hash: CXFC6TB53UVFSTKCVKBC75NL6Q4GZVPN
X-Message-ID-Hash: CXFC6TB53UVFSTKCVKBC75NL6Q4GZVPN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CXFC6TB53UVFSTKCVKBC75NL6Q4GZVPN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

R-Car Sound is using almost same register mapping on each generation,
therefore we can share it. Here indicates some memo/comments.

SSI/SSIU/SCU have multi channels (SSI0 - SSI9 etc), but ADG is single,
so, we don't need to have multi channel settings for it

	- rsnd_gen_regmap_init(..., 10, ..ADG, ...);
	+ rsnd_gen_regmap_init(...,  1, ..ADG, ...);

Gen4 added new SSI_BUSIF, but it is not used

Gen4 calls rsnd_gen_regmap_init() for SDMC, but the address is calculated
by rsnd_gen4_dma_addr(). It needs physical address, but other info are
not needed. use NULL conf for it.

	- rsnd_gen_regmap_init(..., 10, ..SDMC, conf_sdmc);
	+ rsnd_gen_regmap_init(...,  1, ..SDMC, conf_null);

Gen4 have only SSI0/SSIU0, we don't need to have multi channel settings.

	- rsnd_gen_regmap_init(..., 10, ..SSI, ...);
	+ rsnd_gen_regmap_init(...,  1, ..SSI, ...);

SSI_MODE2 address is different between Gen2/3 and Gen4, but it is not
used on Gen4. Thus we can share same regmap table.

	Gen2/3 : 0x808
	Gen4   : 0xa0c

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Tested-by: Khanh Le <khanh.le.xr@renesas.com>
---
 sound/soc/sh/rcar/gen.c  | 517 +++++++++++++++++----------------------
 sound/soc/sh/rcar/rsnd.h |   1 -
 2 files changed, 226 insertions(+), 292 deletions(-)

diff --git a/sound/soc/sh/rcar/gen.c b/sound/soc/sh/rcar/gen.c
index 86bdecc24956..e566712e5234 100644
--- a/sound/soc/sh/rcar/gen.c
+++ b/sound/soc/sh/rcar/gen.c
@@ -215,70 +215,220 @@ static int _rsnd_gen_regmap_init(struct rsnd_priv *priv,
 	return 0;
 }
 
+/*
+ * (A) : Gen4 is 0xa0c, but it is not used.
+ *	see
+ *		rsnd_ssiu_init()
+ */
+static const struct rsnd_regmap_field_conf conf_common_ssiu[] = {
+	RSND_GEN_S_REG(SSI_MODE0,		0x800),
+	RSND_GEN_S_REG(SSI_MODE1,		0x804),
+	RSND_GEN_S_REG(SSI_MODE2,		0x808), // (A)
+	RSND_GEN_S_REG(SSI_CONTROL,		0x810),
+	RSND_GEN_S_REG(SSI_SYS_STATUS0,		0x840),
+	RSND_GEN_S_REG(SSI_SYS_STATUS1,		0x844),
+	RSND_GEN_S_REG(SSI_SYS_STATUS2,		0x848),
+	RSND_GEN_S_REG(SSI_SYS_STATUS3,		0x84c),
+	RSND_GEN_S_REG(SSI_SYS_STATUS4,		0x880),
+	RSND_GEN_S_REG(SSI_SYS_STATUS5,		0x884),
+	RSND_GEN_S_REG(SSI_SYS_STATUS6,		0x888),
+	RSND_GEN_S_REG(SSI_SYS_STATUS7,		0x88c),
+	RSND_GEN_S_REG(SSI_SYS_INT_ENABLE0,	0x850),
+	RSND_GEN_S_REG(SSI_SYS_INT_ENABLE1,	0x854),
+	RSND_GEN_S_REG(SSI_SYS_INT_ENABLE2,	0x858),
+	RSND_GEN_S_REG(SSI_SYS_INT_ENABLE3,	0x85c),
+	RSND_GEN_S_REG(SSI_SYS_INT_ENABLE4,	0x890),
+	RSND_GEN_S_REG(SSI_SYS_INT_ENABLE5,	0x894),
+	RSND_GEN_S_REG(SSI_SYS_INT_ENABLE6,	0x898),
+	RSND_GEN_S_REG(SSI_SYS_INT_ENABLE7,	0x89c),
+	RSND_GEN_S_REG(HDMI0_SEL,		0x9e0),
+	RSND_GEN_S_REG(HDMI1_SEL,		0x9e4),
+	RSND_GEN_M_REG(SSI_BUSIF0_MODE,		0x0,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF0_ADINR,	0x4,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF0_DALIGN,	0x8,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF1_MODE,		0x20,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF1_ADINR,	0x24,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF1_DALIGN,	0x28,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF2_MODE,		0x40,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF2_ADINR,	0x44,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF2_DALIGN,	0x48,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF3_MODE,		0x60,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF3_ADINR,	0x64,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF3_DALIGN,	0x68,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF4_MODE,		0x500,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF4_ADINR,	0x504,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF4_DALIGN,	0x508,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF5_MODE,		0x520,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF5_ADINR,	0x524,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF5_DALIGN,	0x528,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF6_MODE,		0x540,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF6_ADINR,	0x544,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF6_DALIGN,	0x548,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF7_MODE,		0x560,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF7_ADINR,	0x564,	0x80),
+	RSND_GEN_M_REG(SSI_BUSIF7_DALIGN,	0x568,	0x80),
+	RSND_GEN_M_REG(SSI_MODE,		0xc,	0x80),
+	RSND_GEN_M_REG(SSI_CTRL,		0x10,	0x80),
+	RSND_GEN_M_REG(SSI_INT_ENABLE,		0x18,	0x80),
+	RSND_GEN_S_REG(SSI9_BUSIF0_MODE,	0x48c),
+	RSND_GEN_S_REG(SSI9_BUSIF0_ADINR,	0x484),
+	RSND_GEN_S_REG(SSI9_BUSIF0_DALIGN,	0x488),
+	RSND_GEN_S_REG(SSI9_BUSIF1_MODE,	0x4a0),
+	RSND_GEN_S_REG(SSI9_BUSIF1_ADINR,	0x4a4),
+	RSND_GEN_S_REG(SSI9_BUSIF1_DALIGN,	0x4a8),
+	RSND_GEN_S_REG(SSI9_BUSIF2_MODE,	0x4c0),
+	RSND_GEN_S_REG(SSI9_BUSIF2_ADINR,	0x4c4),
+	RSND_GEN_S_REG(SSI9_BUSIF2_DALIGN,	0x4c8),
+	RSND_GEN_S_REG(SSI9_BUSIF3_MODE,	0x4e0),
+	RSND_GEN_S_REG(SSI9_BUSIF3_ADINR,	0x4e4),
+	RSND_GEN_S_REG(SSI9_BUSIF3_DALIGN,	0x4e8),
+	RSND_GEN_S_REG(SSI9_BUSIF4_MODE,	0xd80),
+	RSND_GEN_S_REG(SSI9_BUSIF4_ADINR,	0xd84),
+	RSND_GEN_S_REG(SSI9_BUSIF4_DALIGN,	0xd88),
+	RSND_GEN_S_REG(SSI9_BUSIF5_MODE,	0xda0),
+	RSND_GEN_S_REG(SSI9_BUSIF5_ADINR,	0xda4),
+	RSND_GEN_S_REG(SSI9_BUSIF5_DALIGN,	0xda8),
+	RSND_GEN_S_REG(SSI9_BUSIF6_MODE,	0xdc0),
+	RSND_GEN_S_REG(SSI9_BUSIF6_ADINR,	0xdc4),
+	RSND_GEN_S_REG(SSI9_BUSIF6_DALIGN,	0xdc8),
+	RSND_GEN_S_REG(SSI9_BUSIF7_MODE,	0xde0),
+	RSND_GEN_S_REG(SSI9_BUSIF7_ADINR,	0xde4),
+	RSND_GEN_S_REG(SSI9_BUSIF7_DALIGN,	0xde8),
+};
+
+static const struct rsnd_regmap_field_conf conf_common_scu[] = {
+	RSND_GEN_M_REG(SRC_I_BUSIF_MODE,	0x0,	0x20),
+	RSND_GEN_M_REG(SRC_O_BUSIF_MODE,	0x4,	0x20),
+	RSND_GEN_M_REG(SRC_BUSIF_DALIGN,	0x8,	0x20),
+	RSND_GEN_M_REG(SRC_ROUTE_MODE0,		0xc,	0x20),
+	RSND_GEN_M_REG(SRC_CTRL,		0x10,	0x20),
+	RSND_GEN_M_REG(SRC_INT_ENABLE0,		0x18,	0x20),
+	RSND_GEN_M_REG(CMD_BUSIF_MODE,		0x184,	0x20),
+	RSND_GEN_M_REG(CMD_BUSIF_DALIGN,	0x188,	0x20),
+	RSND_GEN_M_REG(CMD_ROUTE_SLCT,		0x18c,	0x20),
+	RSND_GEN_M_REG(CMD_CTRL,		0x190,	0x20),
+	RSND_GEN_S_REG(SCU_SYS_STATUS0,		0x1c8),
+	RSND_GEN_S_REG(SCU_SYS_INT_EN0,		0x1cc),
+	RSND_GEN_S_REG(SCU_SYS_STATUS1,		0x1d0),
+	RSND_GEN_S_REG(SCU_SYS_INT_EN1,		0x1d4),
+	RSND_GEN_M_REG(SRC_SWRSR,		0x200,	0x40),
+	RSND_GEN_M_REG(SRC_SRCIR,		0x204,	0x40),
+	RSND_GEN_M_REG(SRC_ADINR,		0x214,	0x40),
+	RSND_GEN_M_REG(SRC_IFSCR,		0x21c,	0x40),
+	RSND_GEN_M_REG(SRC_IFSVR,		0x220,	0x40),
+	RSND_GEN_M_REG(SRC_SRCCR,		0x224,	0x40),
+	RSND_GEN_M_REG(SRC_BSDSR,		0x22c,	0x40),
+	RSND_GEN_M_REG(SRC_BSISR,		0x238,	0x40),
+	RSND_GEN_M_REG(CTU_SWRSR,		0x500,	0x100),
+	RSND_GEN_M_REG(CTU_CTUIR,		0x504,	0x100),
+	RSND_GEN_M_REG(CTU_ADINR,		0x508,	0x100),
+	RSND_GEN_M_REG(CTU_CPMDR,		0x510,	0x100),
+	RSND_GEN_M_REG(CTU_SCMDR,		0x514,	0x100),
+	RSND_GEN_M_REG(CTU_SV00R,		0x518,	0x100),
+	RSND_GEN_M_REG(CTU_SV01R,		0x51c,	0x100),
+	RSND_GEN_M_REG(CTU_SV02R,		0x520,	0x100),
+	RSND_GEN_M_REG(CTU_SV03R,		0x524,	0x100),
+	RSND_GEN_M_REG(CTU_SV04R,		0x528,	0x100),
+	RSND_GEN_M_REG(CTU_SV05R,		0x52c,	0x100),
+	RSND_GEN_M_REG(CTU_SV06R,		0x530,	0x100),
+	RSND_GEN_M_REG(CTU_SV07R,		0x534,	0x100),
+	RSND_GEN_M_REG(CTU_SV10R,		0x538,	0x100),
+	RSND_GEN_M_REG(CTU_SV11R,		0x53c,	0x100),
+	RSND_GEN_M_REG(CTU_SV12R,		0x540,	0x100),
+	RSND_GEN_M_REG(CTU_SV13R,		0x544,	0x100),
+	RSND_GEN_M_REG(CTU_SV14R,		0x548,	0x100),
+	RSND_GEN_M_REG(CTU_SV15R,		0x54c,	0x100),
+	RSND_GEN_M_REG(CTU_SV16R,		0x550,	0x100),
+	RSND_GEN_M_REG(CTU_SV17R,		0x554,	0x100),
+	RSND_GEN_M_REG(CTU_SV20R,		0x558,	0x100),
+	RSND_GEN_M_REG(CTU_SV21R,		0x55c,	0x100),
+	RSND_GEN_M_REG(CTU_SV22R,		0x560,	0x100),
+	RSND_GEN_M_REG(CTU_SV23R,		0x564,	0x100),
+	RSND_GEN_M_REG(CTU_SV24R,		0x568,	0x100),
+	RSND_GEN_M_REG(CTU_SV25R,		0x56c,	0x100),
+	RSND_GEN_M_REG(CTU_SV26R,		0x570,	0x100),
+	RSND_GEN_M_REG(CTU_SV27R,		0x574,	0x100),
+	RSND_GEN_M_REG(CTU_SV30R,		0x578,	0x100),
+	RSND_GEN_M_REG(CTU_SV31R,		0x57c,	0x100),
+	RSND_GEN_M_REG(CTU_SV32R,		0x580,	0x100),
+	RSND_GEN_M_REG(CTU_SV33R,		0x584,	0x100),
+	RSND_GEN_M_REG(CTU_SV34R,		0x588,	0x100),
+	RSND_GEN_M_REG(CTU_SV35R,		0x58c,	0x100),
+	RSND_GEN_M_REG(CTU_SV36R,		0x590,	0x100),
+	RSND_GEN_M_REG(CTU_SV37R,		0x594,	0x100),
+	RSND_GEN_M_REG(MIX_SWRSR,		0xd00,	0x40),
+	RSND_GEN_M_REG(MIX_MIXIR,		0xd04,	0x40),
+	RSND_GEN_M_REG(MIX_ADINR,		0xd08,	0x40),
+	RSND_GEN_M_REG(MIX_MIXMR,		0xd10,	0x40),
+	RSND_GEN_M_REG(MIX_MVPDR,		0xd14,	0x40),
+	RSND_GEN_M_REG(MIX_MDBAR,		0xd18,	0x40),
+	RSND_GEN_M_REG(MIX_MDBBR,		0xd1c,	0x40),
+	RSND_GEN_M_REG(MIX_MDBCR,		0xd20,	0x40),
+	RSND_GEN_M_REG(MIX_MDBDR,		0xd24,	0x40),
+	RSND_GEN_M_REG(MIX_MDBER,		0xd28,	0x40),
+	RSND_GEN_M_REG(DVC_SWRSR,		0xe00,	0x100),
+	RSND_GEN_M_REG(DVC_DVUIR,		0xe04,	0x100),
+	RSND_GEN_M_REG(DVC_ADINR,		0xe08,	0x100),
+	RSND_GEN_M_REG(DVC_DVUCR,		0xe10,	0x100),
+	RSND_GEN_M_REG(DVC_ZCMCR,		0xe14,	0x100),
+	RSND_GEN_M_REG(DVC_VRCTR,		0xe18,	0x100),
+	RSND_GEN_M_REG(DVC_VRPDR,		0xe1c,	0x100),
+	RSND_GEN_M_REG(DVC_VRDBR,		0xe20,	0x100),
+	RSND_GEN_M_REG(DVC_VOL0R,		0xe28,	0x100),
+	RSND_GEN_M_REG(DVC_VOL1R,		0xe2c,	0x100),
+	RSND_GEN_M_REG(DVC_VOL2R,		0xe30,	0x100),
+	RSND_GEN_M_REG(DVC_VOL3R,		0xe34,	0x100),
+	RSND_GEN_M_REG(DVC_VOL4R,		0xe38,	0x100),
+	RSND_GEN_M_REG(DVC_VOL5R,		0xe3c,	0x100),
+	RSND_GEN_M_REG(DVC_VOL6R,		0xe40,	0x100),
+	RSND_GEN_M_REG(DVC_VOL7R,		0xe44,	0x100),
+	RSND_GEN_M_REG(DVC_DVUER,		0xe48,	0x100),
+};
+
+static const struct rsnd_regmap_field_conf conf_common_adg[] = {
+	RSND_GEN_S_REG(BRRA,			0x00),
+	RSND_GEN_S_REG(BRRB,			0x04),
+	RSND_GEN_S_REG(BRGCKR,			0x08),
+	RSND_GEN_S_REG(AUDIO_CLK_SEL0,		0x0c),
+	RSND_GEN_S_REG(AUDIO_CLK_SEL1,		0x10),
+	RSND_GEN_S_REG(AUDIO_CLK_SEL2,		0x14),
+	RSND_GEN_S_REG(DIV_EN,			0x30),
+	RSND_GEN_S_REG(SRCIN_TIMSEL0,		0x34),
+	RSND_GEN_S_REG(SRCIN_TIMSEL1,		0x38),
+	RSND_GEN_S_REG(SRCIN_TIMSEL2,		0x3c),
+	RSND_GEN_S_REG(SRCIN_TIMSEL3,		0x40),
+	RSND_GEN_S_REG(SRCIN_TIMSEL4,		0x44),
+	RSND_GEN_S_REG(SRCOUT_TIMSEL0,		0x48),
+	RSND_GEN_S_REG(SRCOUT_TIMSEL1,		0x4c),
+	RSND_GEN_S_REG(SRCOUT_TIMSEL2,		0x50),
+	RSND_GEN_S_REG(SRCOUT_TIMSEL3,		0x54),
+	RSND_GEN_S_REG(SRCOUT_TIMSEL4,		0x58),
+	RSND_GEN_S_REG(CMDOUT_TIMSEL,		0x5c),
+};
+
+static const struct rsnd_regmap_field_conf conf_common_ssi[] = {
+	RSND_GEN_M_REG(SSICR,			0x00,	0x40),
+	RSND_GEN_M_REG(SSISR,			0x04,	0x40),
+	RSND_GEN_M_REG(SSITDR,			0x08,	0x40),
+	RSND_GEN_M_REG(SSIRDR,			0x0c,	0x40),
+	RSND_GEN_M_REG(SSIWSR,			0x20,	0x40),
+};
+
 /*
  *		Gen4
  */
 static int rsnd_gen4_probe(struct rsnd_priv *priv)
 {
-	static const struct rsnd_regmap_field_conf conf_ssiu[] = {
-		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE0,	0x850),
-		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE2,	0x858),
-		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE4,	0x890),
-		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE6,	0x898),
-		RSND_GEN_S_REG(SSI_SYS_STATUS0,		0x840),
-		RSND_GEN_S_REG(SSI_SYS_STATUS2,		0x848),
-		RSND_GEN_S_REG(SSI_SYS_STATUS4,		0x880),
-		RSND_GEN_S_REG(SSI_SYS_STATUS6,		0x888),
-
-		RSND_GEN_S_REG(SSI_BUSIF0_MODE,		0x0),
-		RSND_GEN_S_REG(SSI_BUSIF0_ADINR,	0x4),
-		RSND_GEN_S_REG(SSI_BUSIF0_DALIGN,	0x8),
-		RSND_GEN_S_REG(SSI_BUSIF1_MODE,		0x20),
-		RSND_GEN_S_REG(SSI_BUSIF1_ADINR,	0x24),
-		RSND_GEN_S_REG(SSI_BUSIF1_DALIGN,	0x28),
-		RSND_GEN_S_REG(SSI_BUSIF2_MODE,		0x40),
-		RSND_GEN_S_REG(SSI_BUSIF2_ADINR,	0x44),
-		RSND_GEN_S_REG(SSI_BUSIF2_DALIGN,	0x48),
-		RSND_GEN_S_REG(SSI_BUSIF3_MODE,		0x60),
-		RSND_GEN_S_REG(SSI_BUSIF3_ADINR,	0x64),
-		RSND_GEN_S_REG(SSI_BUSIF3_DALIGN,	0x68),
-		RSND_GEN_S_REG(SSI_BUSIF4_MODE,		0x500),
-		RSND_GEN_S_REG(SSI_BUSIF4_ADINR,	0x504),
-		RSND_GEN_S_REG(SSI_BUSIF4_DALIGN,	0x508),
-		RSND_GEN_S_REG(SSI_BUSIF5_MODE,		0x520),
-		RSND_GEN_S_REG(SSI_BUSIF5_ADINR,	0x524),
-		RSND_GEN_S_REG(SSI_BUSIF5_DALIGN,	0x528),
-		RSND_GEN_S_REG(SSI_BUSIF6_MODE,		0x540),
-		RSND_GEN_S_REG(SSI_BUSIF6_ADINR,	0x544),
-		RSND_GEN_S_REG(SSI_BUSIF6_DALIGN,	0x548),
-		RSND_GEN_S_REG(SSI_BUSIF7_MODE,		0x560),
-		RSND_GEN_S_REG(SSI_BUSIF7_ADINR,	0x564),
-		RSND_GEN_S_REG(SSI_BUSIF7_DALIGN,	0x568),
-		RSND_GEN_S_REG(SSI_CTRL,		0x010),
-		RSND_GEN_S_REG(SSI_INT_ENABLE,		0x018),
-		RSND_GEN_S_REG(SSI_MODE,		0x00c),
-		RSND_GEN_S_REG(SSI_MODE2,		0xa0c),
-	};
-	static const struct rsnd_regmap_field_conf conf_adg[] = {
-		RSND_GEN_S_REG(BRRA,			0x00),
-		RSND_GEN_S_REG(BRRB,			0x04),
-		RSND_GEN_S_REG(BRGCKR,			0x08),
-		RSND_GEN_S_REG(AUDIO_CLK_SEL0,		0x0c),
-	};
-	static const struct rsnd_regmap_field_conf conf_ssi[] = {
-		RSND_GEN_S_REG(SSICR,			0x00),
-		RSND_GEN_S_REG(SSISR,			0x04),
-		RSND_GEN_S_REG(SSITDR,			0x08),
-		RSND_GEN_S_REG(SSIRDR,			0x0c),
-		RSND_GEN_S_REG(SSIWSR,			0x20),
-	};
-	static const struct rsnd_regmap_field_conf conf_sdmc[] = {
-		RSND_GEN_M_REG(SSI_BUSIF,		0x0, 0x8000),
-	};
-	int ret_adg  = rsnd_gen_regmap_init(priv, 10, RSND_GEN4_ADG,  "adg",  conf_adg);
-	int ret_ssiu = rsnd_gen_regmap_init(priv, 10, RSND_GEN4_SSIU, "ssiu", conf_ssiu);
-	int ret_ssi  = rsnd_gen_regmap_init(priv, 10, RSND_GEN4_SSI,  "ssi",  conf_ssi);
-	int ret_sdmc = rsnd_gen_regmap_init(priv, 10, RSND_GEN4_SDMC, "sdmc", conf_sdmc);
+	struct rsnd_regmap_field_conf conf_null[] = { };
+
+	/*
+	 * ssiu: SSIU0
+	 * ssi : SSI0
+	 */
+	int ret_ssiu = rsnd_gen_regmap_init(priv, 1, RSND_GEN4_SSIU, "ssiu", conf_common_ssiu);
+	int ret_ssi  = rsnd_gen_regmap_init(priv, 1, RSND_GEN4_SSI,  "ssi",  conf_common_ssi);
+	int ret_adg  = rsnd_gen_regmap_init(priv, 1, RSND_GEN4_ADG,  "adg",  conf_common_adg);
+	int ret_sdmc = rsnd_gen_regmap_init(priv, 1, RSND_GEN4_SDMC, "sdmc", conf_null);
 
 	return ret_adg | ret_ssiu | ret_ssi | ret_sdmc;
 }
@@ -288,215 +438,17 @@ static int rsnd_gen4_probe(struct rsnd_priv *priv)
  */
 static int rsnd_gen2_probe(struct rsnd_priv *priv)
 {
-	static const struct rsnd_regmap_field_conf conf_ssiu[] = {
-		RSND_GEN_S_REG(SSI_MODE0,	0x800),
-		RSND_GEN_S_REG(SSI_MODE1,	0x804),
-		RSND_GEN_S_REG(SSI_MODE2,	0x808),
-		RSND_GEN_S_REG(SSI_CONTROL,	0x810),
-		RSND_GEN_S_REG(SSI_SYS_STATUS0,	0x840),
-		RSND_GEN_S_REG(SSI_SYS_STATUS1,	0x844),
-		RSND_GEN_S_REG(SSI_SYS_STATUS2,	0x848),
-		RSND_GEN_S_REG(SSI_SYS_STATUS3,	0x84c),
-		RSND_GEN_S_REG(SSI_SYS_STATUS4,	0x880),
-		RSND_GEN_S_REG(SSI_SYS_STATUS5,	0x884),
-		RSND_GEN_S_REG(SSI_SYS_STATUS6,	0x888),
-		RSND_GEN_S_REG(SSI_SYS_STATUS7,	0x88c),
-		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE0, 0x850),
-		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE1, 0x854),
-		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE2, 0x858),
-		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE3, 0x85c),
-		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE4, 0x890),
-		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE5, 0x894),
-		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE6, 0x898),
-		RSND_GEN_S_REG(SSI_SYS_INT_ENABLE7, 0x89c),
-		RSND_GEN_S_REG(HDMI0_SEL,	0x9e0),
-		RSND_GEN_S_REG(HDMI1_SEL,	0x9e4),
-
-		/* FIXME: it needs SSI_MODE2/3 in the future */
-		RSND_GEN_M_REG(SSI_BUSIF0_MODE,		0x0,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF0_ADINR,	0x4,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF0_DALIGN,	0x8,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF1_MODE,		0x20,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF1_ADINR,	0x24,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF1_DALIGN,	0x28,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF2_MODE,		0x40,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF2_ADINR,	0x44,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF2_DALIGN,	0x48,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF3_MODE,		0x60,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF3_ADINR,	0x64,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF3_DALIGN,	0x68,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF4_MODE,		0x500,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF4_ADINR,	0x504,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF4_DALIGN,	0x508,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF5_MODE,		0x520,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF5_ADINR,	0x524,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF5_DALIGN,	0x528,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF6_MODE,		0x540,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF6_ADINR,	0x544,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF6_DALIGN,	0x548,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF7_MODE,		0x560,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF7_ADINR,	0x564,	0x80),
-		RSND_GEN_M_REG(SSI_BUSIF7_DALIGN,	0x568,	0x80),
-		RSND_GEN_M_REG(SSI_MODE,		0xc,	0x80),
-		RSND_GEN_M_REG(SSI_CTRL,		0x10,	0x80),
-		RSND_GEN_M_REG(SSI_INT_ENABLE,		0x18,	0x80),
-		RSND_GEN_S_REG(SSI9_BUSIF0_MODE,	0x48c),
-		RSND_GEN_S_REG(SSI9_BUSIF0_ADINR,	0x484),
-		RSND_GEN_S_REG(SSI9_BUSIF0_DALIGN,	0x488),
-		RSND_GEN_S_REG(SSI9_BUSIF1_MODE,	0x4a0),
-		RSND_GEN_S_REG(SSI9_BUSIF1_ADINR,	0x4a4),
-		RSND_GEN_S_REG(SSI9_BUSIF1_DALIGN,	0x4a8),
-		RSND_GEN_S_REG(SSI9_BUSIF2_MODE,	0x4c0),
-		RSND_GEN_S_REG(SSI9_BUSIF2_ADINR,	0x4c4),
-		RSND_GEN_S_REG(SSI9_BUSIF2_DALIGN,	0x4c8),
-		RSND_GEN_S_REG(SSI9_BUSIF3_MODE,	0x4e0),
-		RSND_GEN_S_REG(SSI9_BUSIF3_ADINR,	0x4e4),
-		RSND_GEN_S_REG(SSI9_BUSIF3_DALIGN,	0x4e8),
-		RSND_GEN_S_REG(SSI9_BUSIF4_MODE,	0xd80),
-		RSND_GEN_S_REG(SSI9_BUSIF4_ADINR,	0xd84),
-		RSND_GEN_S_REG(SSI9_BUSIF4_DALIGN,	0xd88),
-		RSND_GEN_S_REG(SSI9_BUSIF5_MODE,	0xda0),
-		RSND_GEN_S_REG(SSI9_BUSIF5_ADINR,	0xda4),
-		RSND_GEN_S_REG(SSI9_BUSIF5_DALIGN,	0xda8),
-		RSND_GEN_S_REG(SSI9_BUSIF6_MODE,	0xdc0),
-		RSND_GEN_S_REG(SSI9_BUSIF6_ADINR,	0xdc4),
-		RSND_GEN_S_REG(SSI9_BUSIF6_DALIGN,	0xdc8),
-		RSND_GEN_S_REG(SSI9_BUSIF7_MODE,	0xde0),
-		RSND_GEN_S_REG(SSI9_BUSIF7_ADINR,	0xde4),
-		RSND_GEN_S_REG(SSI9_BUSIF7_DALIGN,	0xde8),
-	};
-
-	static const struct rsnd_regmap_field_conf conf_scu[] = {
-		RSND_GEN_M_REG(SRC_I_BUSIF_MODE,0x0,	0x20),
-		RSND_GEN_M_REG(SRC_O_BUSIF_MODE,0x4,	0x20),
-		RSND_GEN_M_REG(SRC_BUSIF_DALIGN,0x8,	0x20),
-		RSND_GEN_M_REG(SRC_ROUTE_MODE0,	0xc,	0x20),
-		RSND_GEN_M_REG(SRC_CTRL,	0x10,	0x20),
-		RSND_GEN_M_REG(SRC_INT_ENABLE0,	0x18,	0x20),
-		RSND_GEN_M_REG(CMD_BUSIF_MODE,	0x184,	0x20),
-		RSND_GEN_M_REG(CMD_BUSIF_DALIGN,0x188,	0x20),
-		RSND_GEN_M_REG(CMD_ROUTE_SLCT,	0x18c,	0x20),
-		RSND_GEN_M_REG(CMD_CTRL,	0x190,	0x20),
-		RSND_GEN_S_REG(SCU_SYS_STATUS0,	0x1c8),
-		RSND_GEN_S_REG(SCU_SYS_INT_EN0,	0x1cc),
-		RSND_GEN_S_REG(SCU_SYS_STATUS1,	0x1d0),
-		RSND_GEN_S_REG(SCU_SYS_INT_EN1,	0x1d4),
-		RSND_GEN_M_REG(SRC_SWRSR,	0x200,	0x40),
-		RSND_GEN_M_REG(SRC_SRCIR,	0x204,	0x40),
-		RSND_GEN_M_REG(SRC_ADINR,	0x214,	0x40),
-		RSND_GEN_M_REG(SRC_IFSCR,	0x21c,	0x40),
-		RSND_GEN_M_REG(SRC_IFSVR,	0x220,	0x40),
-		RSND_GEN_M_REG(SRC_SRCCR,	0x224,	0x40),
-		RSND_GEN_M_REG(SRC_BSDSR,	0x22c,	0x40),
-		RSND_GEN_M_REG(SRC_BSISR,	0x238,	0x40),
-		RSND_GEN_M_REG(CTU_SWRSR,	0x500,	0x100),
-		RSND_GEN_M_REG(CTU_CTUIR,	0x504,	0x100),
-		RSND_GEN_M_REG(CTU_ADINR,	0x508,	0x100),
-		RSND_GEN_M_REG(CTU_CPMDR,	0x510,	0x100),
-		RSND_GEN_M_REG(CTU_SCMDR,	0x514,	0x100),
-		RSND_GEN_M_REG(CTU_SV00R,	0x518,	0x100),
-		RSND_GEN_M_REG(CTU_SV01R,	0x51c,	0x100),
-		RSND_GEN_M_REG(CTU_SV02R,	0x520,	0x100),
-		RSND_GEN_M_REG(CTU_SV03R,	0x524,	0x100),
-		RSND_GEN_M_REG(CTU_SV04R,	0x528,	0x100),
-		RSND_GEN_M_REG(CTU_SV05R,	0x52c,	0x100),
-		RSND_GEN_M_REG(CTU_SV06R,	0x530,	0x100),
-		RSND_GEN_M_REG(CTU_SV07R,	0x534,	0x100),
-		RSND_GEN_M_REG(CTU_SV10R,	0x538,	0x100),
-		RSND_GEN_M_REG(CTU_SV11R,	0x53c,	0x100),
-		RSND_GEN_M_REG(CTU_SV12R,	0x540,	0x100),
-		RSND_GEN_M_REG(CTU_SV13R,	0x544,	0x100),
-		RSND_GEN_M_REG(CTU_SV14R,	0x548,	0x100),
-		RSND_GEN_M_REG(CTU_SV15R,	0x54c,	0x100),
-		RSND_GEN_M_REG(CTU_SV16R,	0x550,	0x100),
-		RSND_GEN_M_REG(CTU_SV17R,	0x554,	0x100),
-		RSND_GEN_M_REG(CTU_SV20R,	0x558,	0x100),
-		RSND_GEN_M_REG(CTU_SV21R,	0x55c,	0x100),
-		RSND_GEN_M_REG(CTU_SV22R,	0x560,	0x100),
-		RSND_GEN_M_REG(CTU_SV23R,	0x564,	0x100),
-		RSND_GEN_M_REG(CTU_SV24R,	0x568,	0x100),
-		RSND_GEN_M_REG(CTU_SV25R,	0x56c,	0x100),
-		RSND_GEN_M_REG(CTU_SV26R,	0x570,	0x100),
-		RSND_GEN_M_REG(CTU_SV27R,	0x574,	0x100),
-		RSND_GEN_M_REG(CTU_SV30R,	0x578,	0x100),
-		RSND_GEN_M_REG(CTU_SV31R,	0x57c,	0x100),
-		RSND_GEN_M_REG(CTU_SV32R,	0x580,	0x100),
-		RSND_GEN_M_REG(CTU_SV33R,	0x584,	0x100),
-		RSND_GEN_M_REG(CTU_SV34R,	0x588,	0x100),
-		RSND_GEN_M_REG(CTU_SV35R,	0x58c,	0x100),
-		RSND_GEN_M_REG(CTU_SV36R,	0x590,	0x100),
-		RSND_GEN_M_REG(CTU_SV37R,	0x594,	0x100),
-		RSND_GEN_M_REG(MIX_SWRSR,	0xd00,	0x40),
-		RSND_GEN_M_REG(MIX_MIXIR,	0xd04,	0x40),
-		RSND_GEN_M_REG(MIX_ADINR,	0xd08,	0x40),
-		RSND_GEN_M_REG(MIX_MIXMR,	0xd10,	0x40),
-		RSND_GEN_M_REG(MIX_MVPDR,	0xd14,	0x40),
-		RSND_GEN_M_REG(MIX_MDBAR,	0xd18,	0x40),
-		RSND_GEN_M_REG(MIX_MDBBR,	0xd1c,	0x40),
-		RSND_GEN_M_REG(MIX_MDBCR,	0xd20,	0x40),
-		RSND_GEN_M_REG(MIX_MDBDR,	0xd24,	0x40),
-		RSND_GEN_M_REG(MIX_MDBER,	0xd28,	0x40),
-		RSND_GEN_M_REG(DVC_SWRSR,	0xe00,	0x100),
-		RSND_GEN_M_REG(DVC_DVUIR,	0xe04,	0x100),
-		RSND_GEN_M_REG(DVC_ADINR,	0xe08,	0x100),
-		RSND_GEN_M_REG(DVC_DVUCR,	0xe10,	0x100),
-		RSND_GEN_M_REG(DVC_ZCMCR,	0xe14,	0x100),
-		RSND_GEN_M_REG(DVC_VRCTR,	0xe18,	0x100),
-		RSND_GEN_M_REG(DVC_VRPDR,	0xe1c,	0x100),
-		RSND_GEN_M_REG(DVC_VRDBR,	0xe20,	0x100),
-		RSND_GEN_M_REG(DVC_VOL0R,	0xe28,	0x100),
-		RSND_GEN_M_REG(DVC_VOL1R,	0xe2c,	0x100),
-		RSND_GEN_M_REG(DVC_VOL2R,	0xe30,	0x100),
-		RSND_GEN_M_REG(DVC_VOL3R,	0xe34,	0x100),
-		RSND_GEN_M_REG(DVC_VOL4R,	0xe38,	0x100),
-		RSND_GEN_M_REG(DVC_VOL5R,	0xe3c,	0x100),
-		RSND_GEN_M_REG(DVC_VOL6R,	0xe40,	0x100),
-		RSND_GEN_M_REG(DVC_VOL7R,	0xe44,	0x100),
-		RSND_GEN_M_REG(DVC_DVUER,	0xe48,	0x100),
-	};
-	static const struct rsnd_regmap_field_conf conf_adg[] = {
-		RSND_GEN_S_REG(BRRA,		0x00),
-		RSND_GEN_S_REG(BRRB,		0x04),
-		RSND_GEN_S_REG(BRGCKR,		0x08),
-		RSND_GEN_S_REG(AUDIO_CLK_SEL0,	0x0c),
-		RSND_GEN_S_REG(AUDIO_CLK_SEL1,	0x10),
-		RSND_GEN_S_REG(AUDIO_CLK_SEL2,	0x14),
-		RSND_GEN_S_REG(DIV_EN,		0x30),
-		RSND_GEN_S_REG(SRCIN_TIMSEL0,	0x34),
-		RSND_GEN_S_REG(SRCIN_TIMSEL1,	0x38),
-		RSND_GEN_S_REG(SRCIN_TIMSEL2,	0x3c),
-		RSND_GEN_S_REG(SRCIN_TIMSEL3,	0x40),
-		RSND_GEN_S_REG(SRCIN_TIMSEL4,	0x44),
-		RSND_GEN_S_REG(SRCOUT_TIMSEL0,	0x48),
-		RSND_GEN_S_REG(SRCOUT_TIMSEL1,	0x4c),
-		RSND_GEN_S_REG(SRCOUT_TIMSEL2,	0x50),
-		RSND_GEN_S_REG(SRCOUT_TIMSEL3,	0x54),
-		RSND_GEN_S_REG(SRCOUT_TIMSEL4,	0x58),
-		RSND_GEN_S_REG(CMDOUT_TIMSEL,	0x5c),
-	};
-	static const struct rsnd_regmap_field_conf conf_ssi[] = {
-		RSND_GEN_M_REG(SSICR,		0x00,	0x40),
-		RSND_GEN_M_REG(SSISR,		0x04,	0x40),
-		RSND_GEN_M_REG(SSITDR,		0x08,	0x40),
-		RSND_GEN_M_REG(SSIRDR,		0x0c,	0x40),
-		RSND_GEN_M_REG(SSIWSR,		0x20,	0x40),
-	};
-	int ret_ssiu;
-	int ret_scu;
-	int ret_adg;
-	int ret_ssi;
-
-	ret_ssiu = rsnd_gen_regmap_init(priv, 10, RSND_GEN2_SSIU, "ssiu", conf_ssiu);
-	ret_scu  = rsnd_gen_regmap_init(priv, 10, RSND_GEN2_SCU,  "scu",  conf_scu);
-	ret_adg  = rsnd_gen_regmap_init(priv, 10, RSND_GEN2_ADG,  "adg",  conf_adg);
-	ret_ssi  = rsnd_gen_regmap_init(priv, 10, RSND_GEN2_SSI,  "ssi",  conf_ssi);
-	if (ret_ssiu < 0 ||
-	    ret_scu  < 0 ||
-	    ret_adg  < 0 ||
-	    ret_ssi  < 0)
-		return ret_ssiu | ret_scu | ret_adg | ret_ssi;
-
-	return 0;
+	/*
+	 * ssi : SSI0  - SSI9
+	 * ssiu: SSIU0 - SSIU9
+	 * scu : SRC0  - SRC9 etc
+	 */
+	int ret_ssi  = rsnd_gen_regmap_init(priv, 10, RSND_GEN2_SSI,  "ssi",  conf_common_ssi);
+	int ret_ssiu = rsnd_gen_regmap_init(priv, 10, RSND_GEN2_SSIU, "ssiu", conf_common_ssiu);
+	int ret_scu  = rsnd_gen_regmap_init(priv, 10, RSND_GEN2_SCU,  "scu",  conf_common_scu);
+	int ret_adg  = rsnd_gen_regmap_init(priv,  1, RSND_GEN2_ADG,  "adg",  conf_common_adg);
+
+	return ret_ssi | ret_ssiu | ret_scu | ret_adg;
 }
 
 /*
@@ -505,30 +457,13 @@ static int rsnd_gen2_probe(struct rsnd_priv *priv)
 
 static int rsnd_gen1_probe(struct rsnd_priv *priv)
 {
-	static const struct rsnd_regmap_field_conf conf_adg[] = {
-		RSND_GEN_S_REG(BRRA,		0x00),
-		RSND_GEN_S_REG(BRRB,		0x04),
-		RSND_GEN_S_REG(BRGCKR,		0x08),
-		RSND_GEN_S_REG(AUDIO_CLK_SEL0,	0x0c),
-		RSND_GEN_S_REG(AUDIO_CLK_SEL1,	0x10),
-	};
-	static const struct rsnd_regmap_field_conf conf_ssi[] = {
-		RSND_GEN_M_REG(SSICR,		0x00,	0x40),
-		RSND_GEN_M_REG(SSISR,		0x04,	0x40),
-		RSND_GEN_M_REG(SSITDR,		0x08,	0x40),
-		RSND_GEN_M_REG(SSIRDR,		0x0c,	0x40),
-		RSND_GEN_M_REG(SSIWSR,		0x20,	0x40),
-	};
-	int ret_adg;
-	int ret_ssi;
-
-	ret_adg  = rsnd_gen_regmap_init(priv, 9, RSND_GEN1_ADG, "adg", conf_adg);
-	ret_ssi  = rsnd_gen_regmap_init(priv, 9, RSND_GEN1_SSI, "ssi", conf_ssi);
-	if (ret_adg  < 0 ||
-	    ret_ssi  < 0)
-		return ret_adg | ret_ssi;
+	/*
+	 * ssi : SSI0 - SSI8
+	 */
+	int ret_ssi  = rsnd_gen_regmap_init(priv, 9, RSND_GEN1_SSI, "ssi", conf_common_ssi);
+	int ret_adg  = rsnd_gen_regmap_init(priv, 1, RSND_GEN1_ADG, "adg", conf_common_adg);
 
-	return 0;
+	return ret_adg | ret_ssi;
 }
 
 /*
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index da716b1f52e4..e063286cc328 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -200,7 +200,6 @@ enum rsnd_reg {
 	SSI_SYS_INT_ENABLE5,
 	SSI_SYS_INT_ENABLE6,
 	SSI_SYS_INT_ENABLE7,
-	SSI_BUSIF,
 	HDMI0_SEL,
 	HDMI1_SEL,
 	SSI9_BUSIF0_MODE,
-- 
2.25.1

