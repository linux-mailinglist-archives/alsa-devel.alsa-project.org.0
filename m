Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7155598992F
	for <lists+alsa-devel@lfdr.de>; Mon, 30 Sep 2024 04:17:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E98842190;
	Mon, 30 Sep 2024 04:17:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E98842190
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727662677;
	bh=gb8047m6aUcDhBvJPYS6TSjIVhl4bb/0b9SN+1QCZQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Ucm1Tg6ldkIO6LhNUTNLkWzvsPIurwdXCoVTH2cSmqEGQ2Z0gqqB40o1sbBmPNzDZ
	 lTZOLqZ4XpmY4Uapko9pRulG3dDPuSvIHfHzlFd4JDiSO7GYbWT2vsVtGol19g+mLV
	 qXIpk3fpmYVHGWGFQR486IsVoz15xB/99iY+WxCg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B622AF807DE; Mon, 30 Sep 2024 04:14:53 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFC5FF807CA;
	Mon, 30 Sep 2024 04:14:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8417F8074C; Mon, 30 Sep 2024 04:14:48 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id E580BF80726
	for <alsa-devel@alsa-project.org>; Mon, 30 Sep 2024 04:14:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E580BF80726
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=H90PoayG
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ENDH94pRw4fhR8xNXvy0TfBAM6ckSveyRR/5kWgtVPvzgxEZAeJ7cnEUsvnmy9EuT6+0JYmFJbPj0QUcgS9ncy5kFwdthx9zDyjiioh01Fdv9Cy13m4otZqOwc7/n3a3uxrI2BpO2Wx1+FCGWzSa+FZOYvduN+76BSc78TfU5dT7W14pxtFxnClyZ9bOnaO+ssHUN3Kp39iED9270OikhLVzheK1j5fvHufwo0pTRVgQmtclfWOpeTfiw323RiBDpCwvcONyEDJcnB7JHqqxjtScCrDmn0L0YyXyM9zFN/ZxlEjYAG5VAo6qV+rMeHSJncqBnputzQQ636wCfG+47g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zF9L7c8BWVpiszPzAdAnNL/OjGbbyqG4WtEn5uBwTt8=;
 b=jx1jWUSfhXm/VrBfVptZZgVa68q265Z03gccx/J2dbcuvVI7bHMKY8bTGXMUGj2fqj4IrNRFSb4VvVo1NIUQmfPzYjlzfUuexZUxPCmhfQCEWExTyEltrQ8i442SwzgbD1vb7W8y/4fR1KReC7Njfaw4EOpf5tRYhPE8A5RXe/GF/HGBP9zivg2lmPEu+GeR2GRfgGRbOFpI4x4b4mN/oLh3OaS3m1vVujVCJkKfb9NkUs4Oo1RV+iWCrVpzQYEDzL5drmvZWAOFnucT7soiS4Y449ErqseKP0ujNSDHCFPCf5nTyGW+Rt8KNXkIhY7ApPOx+6mz2DHka8E1X7VhNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zF9L7c8BWVpiszPzAdAnNL/OjGbbyqG4WtEn5uBwTt8=;
 b=H90PoayGKjYGoRaegGys9B6wAfEFF+oX/6ug2I3BDdjgjZjT/aAmvayRhTn0ks9PoE6U+SUxkFJ9/IL5QxxJAd9BJmgNW5VCqQmGgeTyfnMeB6GDDMYxwZbzjJmDrze/H1yLjAsQTXjmjOf0FPhr5yIWMzU/QCEOnhpR3ghc2c8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB5798.jpnprd01.prod.outlook.com
 (2603:1096:604:c3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 02:14:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.024; Mon, 30 Sep 2024
 02:14:42 +0000
Message-ID: <87a5fplwfh.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 12/13] ASoC: doc: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
References: <87r091lwhg.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 30 Sep 2024 02:14:42 +0000
X-ClientProxiedBy: TYCP286CA0111.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB5798:EE_
X-MS-Office365-Filtering-Correlation-Id: bbdf3f13-bbd6-40e8-6201-08dce0f5a55e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YQUSoiCjuni0ICf4y7YPdA16+HcMjDUDN/nkiqhUAjd3WOQw0JfMd69LC2o0?=
 =?us-ascii?Q?D0CIgl7+cmIOGz7KFGbLTMPpM5Z9Xj5a7bN6B3NL+1O2oriseN30Orr5JVst?=
 =?us-ascii?Q?Xpg53H2aTfIxKQOBe8iy7cExNAyatvX7xW/FpdzxPjtdYXmj7/9yMhXSMkNe?=
 =?us-ascii?Q?rlb2jbLTm1zVc0yvJBsBt7xEkweFxzWP3WSt2wgzauwu116FE5jYAYzREn/M?=
 =?us-ascii?Q?1Nj3cV9eOn5WIn6Xb6BBAgiR2wh6DfbO/3FCA3dKJ+v51H0cKEegzC7X+cgZ?=
 =?us-ascii?Q?SCtvhtQ7gMQsH/PihUgTjDGteP00VNNbZxUrMu8/h4Co43fkp6ifQPhv+8PF?=
 =?us-ascii?Q?0ERoJgf8/yiXjUv1oc+XUwnw5gSll06ZcLjI1x5tjRyX4R5a3g5k6A+jlwK5?=
 =?us-ascii?Q?LInl20y7fp1++S/MMBPCy7bt3BbLcPAnj5k85w+udTuLUARFrtgItp0fn7wl?=
 =?us-ascii?Q?MLOIxYLRU8FTxV+N1DKhecWP6KYsuRVufgDk961Qlg4/ZhQNOc/Oc/ALGZBo?=
 =?us-ascii?Q?d9o+A/Hk2ocksRrjqo1Fi1HJ6S/anBP4nzik2Ay8onCG7qnLjenX/ztjHzJu?=
 =?us-ascii?Q?eKS6Nsk+XSxwhIJ1Z4sHyu0uNcyYR42xyvHh5+Lg3rDGA/kL70Yjm5htm9jE?=
 =?us-ascii?Q?BO26sPy5LyXRRf1U6WtPf1PewjRKVEzAP2sPZpfVOmUyPJP+UmF1KxaTxM2q?=
 =?us-ascii?Q?45/bPeOyK8nqVQ/e7rDKdEZruzYM8n3tPiUiu2uj2EZUtfQ/ZfEqIASlN69D?=
 =?us-ascii?Q?RZrbGpAKNwwSqee8lXPRkUrOkLRkxEf1hhw5/wmjk6xYjsTwVdQFy3uWh+co?=
 =?us-ascii?Q?1iN91OWp3YUGsUw2ucqnVmOBi/b4XzbK2vL4/XvFL70wpT3igtrcAY0Y8kYI?=
 =?us-ascii?Q?5XHEu7hBBn8JHaeMet3um1/gZaWf6PLAZWxmXoTwzOZfWSyr1vN3OpefFvym?=
 =?us-ascii?Q?6+x1WdRRj+aW6jzOm8PhfU07kmLslrEqM0UT08cF10wxNzAo1TEJ4MdNuZXR?=
 =?us-ascii?Q?6FE8Z+If5xhynmu+4XzrXwqGNkdKL+5xPNauxyHSG3uyM1Yw5W0OYtoo17BR?=
 =?us-ascii?Q?ZW+ngrSJncZRUEuN7t8XBEkYHURudykS/vK2dWMrSlMyPpGzFiyhUx8Vmu/q?=
 =?us-ascii?Q?hlllSO3siKSXUa+a4UDtXS7d9LoA1Vz5yuncR4fvf5I8ldvmMoWWGlWYxJ8P?=
 =?us-ascii?Q?X5sW9Y8q6fTzF3ULyimTEP1a+nBciyclqhS+hs+w3cofbFhYd9VrKMrbktqs?=
 =?us-ascii?Q?NCPS01kMt2H6diZ19Z3LYhG7XtUh9FUNrvqLC7gt6Zm7ZtW2ZLxyqkRA7e99?=
 =?us-ascii?Q?1gEIIYrEB21orZzuqxfgXJNlyAverCCm5Rv89mvY/2P8sv4qh4qVIWfYqRDY?=
 =?us-ascii?Q?pE8biRRdg59Agohm0kDKM6J5OJ4QlQGovcmUwYQBM9+WNb8VFQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?fPbJgpM9EOB291cTUQl9lW8cxgjmCRu3Qz097Dh1Czzz4owTsLA4PF9kB0eg?=
 =?us-ascii?Q?Gs1yHNDSH6VHAkqux8ODoGupd6EXuOU21Wz97L11EssfUGprA5CKDXgluxe/?=
 =?us-ascii?Q?12VUAWt0sODdlRCzUx1gQ/6YLMkdMY93EggNhS+8s/K1l14QY2vC3rB0cILJ?=
 =?us-ascii?Q?tvWkQW9jDI5RUvssQbXQ/9FxJgxCqWQwwpH5bpV7UnTQvVQWVw/KAEIOmgAa?=
 =?us-ascii?Q?39dTgkJ8kaPwuG2meQEHDJ3B3nPIFT9hNcOVbDrA/mRf/2KvHDAlZDuLw/VS?=
 =?us-ascii?Q?KVrQmWcA3rP00qqKa4wU4N1Z+NRFbQhCStS4WcNVi4svy5GuXEpJo4EB2gUF?=
 =?us-ascii?Q?sRJ84+5m7dTv2vLCnqU3iAAOxkmGN9o2rF8IgYFJmQU2CIUG8qs+AcRENraC?=
 =?us-ascii?Q?raXYuB8YiHLy0WHwMouXJtba1cq8SK4CC5r5ZPhAhINHumaaLDjgnR9baKZQ?=
 =?us-ascii?Q?KOyFiMvPzkj415slK5/CnbeHaT2pZPeKGAEYVJMW6Yph6BwfWFnlf89TLqjZ?=
 =?us-ascii?Q?6FnIZF1qxizvGMbjl3XjAHQv15rk18xMdDk2s063VWC69db72wDXhJpDEm03?=
 =?us-ascii?Q?/CYjtyhcnXsWnou4gWbzW5PWcyJIk2wDdqyxQxWe5WX9RPrd/jTyEur+jY5W?=
 =?us-ascii?Q?sDbrKFVpPw1ljQmlDzPin1HLFH5keC7nl2WtiSKYT1njZBjDU9+Yy4ghe+CB?=
 =?us-ascii?Q?bCdX1MXwQUpvRzIY6WHysJ9YeQM0M7Hu0/SWGOD0BNOFqPaS/pIAZM5P1SMH?=
 =?us-ascii?Q?D9//B1ZQrVBXmH5v+un1r0g1yEfFKokY8sAJpCjxsw6P8aAM6bX07UlbsVi7?=
 =?us-ascii?Q?VRMLllCuGajdcdMcu4lyWuOwfpG4RViJI8egKn8EfdPkHofL7uEy6yygSvNz?=
 =?us-ascii?Q?UEh/1tO2DsgYHAgZTtjuaR5TR28+KBITYh1X1tjddCmpJBUNv+912Kh8z7Fj?=
 =?us-ascii?Q?VD4Cn8a09E+bPupf8DIh3xcdhiSRrTqC9pDtk9Re564/3DmGcmEOgxmzD6M9?=
 =?us-ascii?Q?Zasuh7yCdQWE1yryUN14KmDxwqo8NZKtPhsfn2t9pw0t+DgSGCavvygFJS+9?=
 =?us-ascii?Q?6ztllKUa7UTNwrUGtlNnlPxwvN1SwgKCeUWKS93wuln25SoRamTPHwX+3hA3?=
 =?us-ascii?Q?VjcT2z0VOXfz6OleVYenEekbZN/Ew02Gqxkqu1WzRNFrdWaAOM7OgpOnXuOe?=
 =?us-ascii?Q?vhK41wairyyNQOKJvaAu4yLTn8dsexPM5hrGhqRLio16qdQDMwdoLeVZ20zp?=
 =?us-ascii?Q?zXuM9fcNGtcGSi5gQ6GhVKcf293fD1+0JbFwGMfh+hbQJ1dLg3wZROlURIPD?=
 =?us-ascii?Q?HrYJeBfO2zSe5UhyJgO3dfH5NWLmVlIjGorPXlx4/fE1iGfapiELH5GVOZdJ?=
 =?us-ascii?Q?1aoIVkO9PmqzgFlsXJ+azdHMPLKXjTQeW8hzEdmVqmaIlD++9wVNvVuY4aaT?=
 =?us-ascii?Q?zUy37JooiNTdKGKME4OrjHRzHqUa4AYRTlJ6+3EmCAM+2Ei0FSYo3XPpp496?=
 =?us-ascii?Q?vsM1UNpcNtMtlzj3KgNvy2IrNQGIH+mzciecgoFksI0w5CbejtZffzq8azYg?=
 =?us-ascii?Q?sQw4P87AoHGWGOTOWaLNIWAyBcBsGypI+GxTXqbBwV+CFw0Sx1d/2LRAV2Ep?=
 =?us-ascii?Q?Wxq8ui79Kj/OAOqa1o9pRbM=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 bbdf3f13-bbd6-40e8-6201-08dce0f5a55e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 02:14:42.6490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 hL+xHdJOEAsEvZPOxNNm0rvi8nrcPY/tPvgMONl2jLEuxO7LQmf41DdNN71FZW3loxIYfHWYpqY4vVtBchKAMAmHQnpXEiNzgYtYU1YzKdOo7zdnWi6vAJ6UhZ7wyOkh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB5798
Message-ID-Hash: LJDMXIKGCT3TOIMP2FLCBEX3NWGV26CU
X-Message-ID-Hash: LJDMXIKGCT3TOIMP2FLCBEX3NWGV26CU
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LJDMXIKGCT3TOIMP2FLCBEX3NWGV26CU/>
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

