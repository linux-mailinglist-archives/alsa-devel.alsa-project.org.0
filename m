Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0C798B1E1
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Oct 2024 03:43:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3C96383E;
	Tue,  1 Oct 2024 03:43:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3C96383E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1727747035;
	bh=qCfCXvPoqfEdNxYr0N3JyHNuwKb5ICKifWL792VqKGI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TZvgej+ituIE8ZtNnQhggRKXpxwyIs5JBs53XSKQnvs261FXXhvJLtQeqniHyRiqE
	 /wga9Mtky2hWR9X0RMej242MVnmXEDlsPpoR9uZRIi8GoLYFV032hP5ksFT4OCp2y1
	 eF82H5Oxcht99XjwK8fCLkRaW2GSL6lB6Rxq22TY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 73981F806B2; Tue,  1 Oct 2024 03:42:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 45016F806AD;
	Tue,  1 Oct 2024 03:42:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 89BC0F80690; Tue,  1 Oct 2024 03:42:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
	SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4DA12F80517
	for <alsa-devel@alsa-project.org>; Tue,  1 Oct 2024 03:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4DA12F80517
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Qt+DZnqX
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4SGesKtMVN7G/0TPTA8grtT40fF7UlGCxOvUgKEWzL5REuiCtDl9QvKB3odun8kTf8UETC5ywMqVIjMk1JOmmnpe7hkq41MdzXPEyv7Y9ufMhs133Ujt83zlF6qoRmQ3H0NugKvAverEEt0QQ7/qFPjEBHSRA1OH0BogWJ7nLX8Bsgy/JKNysfBd3jlCxTQSJllv5PhSzvb974bUZzVIg/pDnkE5ZXJkaJbwQby1EzUcHP1UJUlsrJVLa6cITqpF0EQxXCPBHhL7yKH5Ev9k1CrixU4w6DnhlGuAW1z6vZ78/fFNyQA+0Gg2poudLBR9Ru4M09hMpJMOy4vEBSyNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIMtZcbJyIvp0ryPHe93khfXsSDbpFECSAB0hX6kAxQ=;
 b=D3BH5YD8P9Iln7qNVSqdpB1SZgckmDxG0HG4V8ucg8pQpk3KhwrVb3LxIuT34xQUEJUziQYTrm54/44T2D3GA+aepr8M+wZmnFMMbcNvOnibhkFKPacND3tRRZnZ9xhYef8s9RBzJhnTmuyoAqck/ftxqxj82Xv2ODvfEbdGzvuSWOSEThUTef30HbBRBEcFsCQLPR4Vmt+vY1CqslK9UCyA1r+WMFBud+XK6fRCatlxz9Y4qtMkgRutEVNfQ6+Omj/ifyp61oCDwkRpwUSzr2wMwmYZ4XMQjnLeBHw62Oc4BOdkK9WYaXRAGeNLLwMkNlod7BeabUtK2/tOk2ZoqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MIMtZcbJyIvp0ryPHe93khfXsSDbpFECSAB0hX6kAxQ=;
 b=Qt+DZnqXAL76HTzF++XUhwG9WamIPr98SSxxOsrvnRtULRwYq4eK/BBhc3c0mdKgzI5JS9OnUCmylbZ6ZLQIm8M3ObKNqIDgYabpfk7tjVxeQfxtuoMY9PcHzUDxPJHIh4eptwu/CVBv3F+K64CTGsK7j1//jQDL12/UuAi4zBI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OSZPR01MB7132.jpnprd01.prod.outlook.com
 (2603:1096:604:11a::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.27; Tue, 1 Oct
 2024 01:41:55 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.8005.026; Tue, 1 Oct 2024
 01:41:55 +0000
Message-ID: <87o744vbtp.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 07/13] ASoC: soc-core: remove dpcm_xxx flags
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org
In-Reply-To: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
References: <87y138vbv7.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 1 Oct 2024 01:41:54 +0000
X-ClientProxiedBy: TYCP286CA0113.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::10) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OSZPR01MB7132:EE_
X-MS-Office365-Filtering-Correlation-Id: e5096ebc-ce5a-4204-2756-08dce1ba3af8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?14yryLGpeYJEJPkLSX7deTaAMcQtpPOBsVqHEqO+G9n1jf+fCso/d70FOdYF?=
 =?us-ascii?Q?MnsOFQDsyfwsC5vRt5Y/D38pM0ACZbeV+JePwqjelhGCqDZTFMVU6c/PLjvM?=
 =?us-ascii?Q?LrcdIlRJFA20lsnyoU3Fwu5jKUFju7oSOKfdmuq7H8SpzQLbwa6Jwdt2C0Vr?=
 =?us-ascii?Q?AAC8+TSmYvMqIGn9n5K3nASeFqHLWFqXsm1XiDG9f+buwcqv6v8qGYNCI/cw?=
 =?us-ascii?Q?+md880NVQdkowH0B+ZUPi0farpqXsCtiNOILs2CDn6eyRH2iDXhhUkjfiZA8?=
 =?us-ascii?Q?llOLE08bDqyAcn0N8VzquYnQK/dEBolYKRUmB4Z5HDhVOj7SZyctc2yYwwb6?=
 =?us-ascii?Q?2nnevy9f0msJ1AQ/V1iwt3E5o3TF5dz3Mc1DvyMuafpmHx92kGck68f1QLVy?=
 =?us-ascii?Q?svbn7wp4r62tBSsnYl9G3l0KFRyNccqmUC1d9EX3snYISI3a66LnOA4VRC8A?=
 =?us-ascii?Q?r60y/27Bc0bl2XuA7j6ebExCRI0eLkAqe0Dh2lbc6XFLTI1KBciKqLa6I9un?=
 =?us-ascii?Q?eXly1G7vuU7NrvNuhLiLpougFiqA4fwDNP/INpcg38xetEpWQNjEAMhDcu6w?=
 =?us-ascii?Q?2F/uOv+uUw3MEHAVRqoMTM8X4bbibQ8ueNJzgOb6Dxn4SDzkQIqiNrKb5Dd3?=
 =?us-ascii?Q?Q+WUxf2xx0uTutjac+hvbz3L+QRGXSu57UyO9r6RnqXbZQGuOnZgyHemhlTn?=
 =?us-ascii?Q?z1x09QGTArp4U0Ydmb5Z1OTl7n2vEi645pl+fIRk11JeRGEZ5zAl01D+pBLH?=
 =?us-ascii?Q?GcvWuYKU+IsBK+JZ+ZFmN6yCgV/s+cXnM65I/19n2iVfYJTeGqvTSXlffA2C?=
 =?us-ascii?Q?TUctkkzmg+AVfTwlDE/Frqe9Rz5ACgMZ5/ZY4MzmqPkR1WHAJ5bNc8tK8mFC?=
 =?us-ascii?Q?oBXG/sZ1LmmMrLzo2+xRpicCBGQYUCHn+SVyXddbcix30FG1+GVmEh2OCeAF?=
 =?us-ascii?Q?cF0hd/7zIPG6DfzDemlPn7hzZEirvLHxMDvOlr5JOwFjHvwUs7NLF0Q1dsCQ?=
 =?us-ascii?Q?AcFHSx4iw8Ey5hMeNy9SC6foslY4TU3lifu+xPBdt2dJ7tE0xUuVIaJpl1Ey?=
 =?us-ascii?Q?cwO2UP9c1APEh5RwlZy8lNuQhddOsiknjoeKoNYsDwRwzngISEdeqOzbgC9o?=
 =?us-ascii?Q?YJkFVB7ARUpCAHhpHEM1K6bxvDkx9c3IU2Pq72nOBzHUPsGXhAb4f+tkjrjY?=
 =?us-ascii?Q?Whi3sz+muw6+EO2p+b7MHPRC4WHBOsJrDPr71VaebdS3yFrC6cpQfQZJCNa/?=
 =?us-ascii?Q?rf3k2bRh5j6s0D/ynAo0Fv8NQyOIfR4Co+QCyM8WMRf8rVIEBPenKlZlO0dx?=
 =?us-ascii?Q?cwFVFFg+6FamG1JuxMxFqey062H/9g0Ul7oQIFKFheYwig=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FDVQbchJwty6qtAxSvTRPvTtzdoQls8xhwxlGu9cjh9bptzyMvuZbh92I9O6?=
 =?us-ascii?Q?h+H3xDCol1cRgyVtASFiSPKFd8vjon+oeCCEaaoO0+0f1mNwDep6X1efcOqe?=
 =?us-ascii?Q?CKq3i11hybyMpYkw3sMbSm+eqiI2xBav6VWo0gvCfgWiMGXxc9mTDjqBybTe?=
 =?us-ascii?Q?Xd0cuS69GQugbQiGDopk6Gub/582h3Sf66nIwQLkxlzFrLytIq/g6eZYLaZK?=
 =?us-ascii?Q?F6kkwOLAdIAhWnBZB9aJ+fYlhDqLWyzWPsxgvaJ3qyX/Riy0fQdgbLgXezKC?=
 =?us-ascii?Q?FzHFnUokeYcOvPIGjGqFsbzCZuoMi93yEdpeTo8lwYR8+GlCBjWzpqz0ogKd?=
 =?us-ascii?Q?idrwxmsvnAiS1qYWtLjAB6rLOZqvDOBstg+8IQ1WG9iABb4y0GZ8GddU7hTY?=
 =?us-ascii?Q?H4iiL/Jt/LDr8D5RPo9uEgwKHw4nHumP/cx7mIU2fPrcJOUyMLYyR63PcC6D?=
 =?us-ascii?Q?LklIiJP588bgxLG72vYZWlo8cftEf4yeDYGBgnsTDTvr5rn47NIcAA26C6E6?=
 =?us-ascii?Q?goMF8RqVD2/dm1AONe/xLxSYCBQgWDrYIcRflsEoQB4Sr12rwSjGhtQJCBD+?=
 =?us-ascii?Q?kqjDtwJwJCVW+LtaybboSe5k9O86okV07lolM7700OaAh8TUa9k7NbD1X/4C?=
 =?us-ascii?Q?t7RKggMwfuF3lLMjnqzLbJ0mti+QuzjYeWhJGE+NCLYdqixAJeHPWFUvmJiv?=
 =?us-ascii?Q?vZItTRwbqDRQMd5XySV81N1o28caQ4rDhJC/w4ShnJVpP44QPDPymGEO0T/u?=
 =?us-ascii?Q?EUIgGakmwYG8AfIVFnF4WEM2oInVXJNcb5WVtJVnmHYpD1kdhH/jxmVM7+Hw?=
 =?us-ascii?Q?gvJUv7a5+Q2gdxVau28UAwYZTt1hl9DhxfSmLZ5s38jAatAMXkzy/8b+Wcvn?=
 =?us-ascii?Q?FxduV2PYRIelbAqEFBeYd7vhWqLsh7N6Lr6Z43kD3BUECC1B4OVouxkkj3xa?=
 =?us-ascii?Q?ufQGxE55qWuVeahpbGIMbuOg0uuHghgbfHxk/xFGgijzL9IpuZFwjceCKA9e?=
 =?us-ascii?Q?UZ2nyatgGKZEDV1oFk228xzegZBcxNsPxNWqlMum/l9ce8N5CsJ9Mr3IKijR?=
 =?us-ascii?Q?Uyb6H5zmjEn5GPGHwVKIxX4PA/EqjNc9GqHz0aWCJZLGlxBfu7cBjPsqCi3M?=
 =?us-ascii?Q?aMaJlSUP5xz+K2UQvZ/J7ZUFzzqLomaLLNBqQUx+NmA11EBKtoT1mUV4fibj?=
 =?us-ascii?Q?ZFTbzBEU2f3QJdejedg901crQDdp27x0vHHLGDa7+mFjgLmL9kWQKrQbdXPW?=
 =?us-ascii?Q?DtfZ5mSzbpijlcC6FiwLmlupZJ2M+/BADZGxuvHfMCDuSLrsD9j2gxivY1Pq?=
 =?us-ascii?Q?H3somml3quNurrz78olQvc3tGP8YLcQ+xSrUzeSP0kCETnI1N/IIbcSMtI90?=
 =?us-ascii?Q?VJbZXRqmymqhn4PM+brnXGOMAT7y2JCXP6M4pAmVJNlIb4ySbRc6tNoeiz/c?=
 =?us-ascii?Q?Jw2TlZhiWP0/FTl2EDI0Bbq0JcwqGkr0FWDSmU5Wab6UfWuVumfCDOmEiY8v?=
 =?us-ascii?Q?XRLBX2jQngw25Gj2b0E2XOZBdnAUog8XZk7UsCF1+5X7raW6weT+gx51tpwJ?=
 =?us-ascii?Q?wOoOyVO51GVbBR7y/WXzRriesEELko3TMCoVZVbu5svgDBYlzSyoM1rUoMoD?=
 =?us-ascii?Q?FCEaHQ+3BeFuIyd1CrdV4zU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e5096ebc-ce5a-4204-2756-08dce1ba3af8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2024 01:41:55.0131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 HZVZj7gAt67D3FuKpJccRrXXfH4NLlkRDX57KkPNb1M1InPnPYzIKt4xGIwS/0qnGvCQu+y9TP1zxea+eHxBXQkYI6tS6FOYTfoc1OdDTcICCAqX0P1KWKBDnED7nQyh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7132
Message-ID-Hash: QSPE5TAYBUNHVVYOY7HZURA35N2RVCIQ
X-Message-ID-Hash: QSPE5TAYBUNHVVYOY7HZURA35N2RVCIQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QSPE5TAYBUNHVVYOY7HZURA35N2RVCIQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

dpcm_xxx flags are no longer needed. It converts dpcm_xxx flag to
xxx_only if needed.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-core.c | 20 +-------------------
 1 file changed, 1 insertion(+), 19 deletions(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index 20248a29d167..f04b671ce33e 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1999,25 +1999,7 @@ static void soc_check_tplg_fes(struct snd_soc_card *card)
 				dai_link->platforms->name = component->name;
 
 			/* convert non BE into BE */
-			if (!dai_link->no_pcm) {
-				dai_link->no_pcm = 1;
-
-				if (dai_link->dpcm_playback)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_playback=1\n",
-						 dai_link->name);
-				if (dai_link->dpcm_capture)
-					dev_warn(card->dev,
-						 "invalid configuration, dailink %s has flags no_pcm=0 and dpcm_capture=1\n",
-						 dai_link->name);
-
-				/* convert normal link into DPCM one */
-				if (!(dai_link->dpcm_playback ||
-				      dai_link->dpcm_capture)) {
-					dai_link->dpcm_playback = !dai_link->capture_only;
-					dai_link->dpcm_capture = !dai_link->playback_only;
-				}
-			}
+			dai_link->no_pcm = 1;
 
 			/*
 			 * override any BE fixups
-- 
2.43.0

