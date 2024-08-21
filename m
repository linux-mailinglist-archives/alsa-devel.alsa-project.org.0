Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA10C9592E4
	for <lists+alsa-devel@lfdr.de>; Wed, 21 Aug 2024 04:29:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D510826;
	Wed, 21 Aug 2024 04:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D510826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724207373;
	bh=Z9HQMCTtjq5jVNbFmJOGI2szu4Why9Xyist5j/hnIdI=;
	h=To:Cc:In-Reply-To:References:From:Subject:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ANdmA/ZEntkmpB8Eshjocbyyc0WlxGu0052FdhquVyml6yXvkDK8ewzxxfkNCDynp
	 84cF3o7Yznw1scdGffOVpBA5AxbRTp2IA+jIGa/9R7n3Itj74u00FTWChbhkwywZYE
	 +lYOf0G5tAslApcmgdOZbY0puJWSqnZUaNRyICxs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C54CCF805AF; Wed, 21 Aug 2024 04:29:22 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6DE60F805AC;
	Wed, 21 Aug 2024 04:29:22 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 495EBF8049C; Wed, 21 Aug 2024 04:29:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4F7BF8025E
	for <alsa-devel@alsa-project.org>; Wed, 21 Aug 2024 04:29:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4F7BF8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=JkbRPw6v
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=niTBRKsITGH8Sd4g7N94BWA/l9zSidxeD5PWNCOa6dZ3lhT9eO3J+sNxgaOh42yQkf82+A7fSr8PZkKl0IBUXzcRMywdSM7YkZjQW+k5nhkIMcIAUPav9Rp5BTsgs0b4tHXXdRdlgxsu/v44epq0OGfP76/XkQI/BfwqQcN9tvrFjmTkyK5ItI0Jm8HoGSuCGgBUV5jh54f5dMfWzqwAnBPtWrrFHqP+R0Iu+L8uDLhg7c/gUGSQ3bP8QFczXebb/AL7tCypnCF+PFlzvWLOD52BbZssb+o+cSqwRQ8CZP+8OUhIuqEukxyupyKFqlSE4SP7J4M2t4i9sns0op46ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGirFK46gfKBrPpMgri2VH0OCXwC05M4/9v2mS1WE+c=;
 b=L6E0CPK2j9ERVdDqps9QQHkY2k/N6kWXHE4z4JajeRwpO51nH7ZaIqL0YlxXXCJCxBsg8kb1Se4XRVe8QCGSzfOzf0+lvCsGfWhDwiK/nEJlUXFC54KjB8hGeUUClxxmPHtFMAOvJNqYOJXwbW3u3ByRYaTQt0/0vR+vIKv4U2yuGyPrc9cZXbq7Ao7zPkjunUy6hLVcsuP0BJXfWbFmADnnuIvVbi80bXc0rYLbORb4J5+N85GG04ZdRLYaRXLi7DSab0q1bd+Ypy+yvRdBcEFEY4z6mB1UccLbdW4mOrvfXTYMPqQ5UaNUtBfmtPM+s/D9gv5ZSYIDneCfWEPiCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGirFK46gfKBrPpMgri2VH0OCXwC05M4/9v2mS1WE+c=;
 b=JkbRPw6v6XC0f4e1OgJ3quLWoB0cp6yOQdImqXeMG4aC81fdb7YDwIeIgxUPam/DiQGqtUbuvsRpN0eCfTfNo29kTWML6YNlLExLXujXXrgpS58T6/zJVB/aaC4gOg7XbspU3oYwZS9NFZaOptLBMu0pQKielJy5jh7XKYxKl7g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYRPR01MB12156.jpnprd01.prod.outlook.com
 (2603:1096:405:ff::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19; Wed, 21 Aug
 2024 02:28:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Wed, 21 Aug 2024
 02:28:58 +0000
Message-ID: <87jzgaa9sm.wl-kuninori.morimoto.gx@renesas.com>
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87le0qa9tc.wl-kuninori.morimoto.gx@renesas.com>
References: <87le0qa9tc.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 1/2] ASoC: soc-pcm: move snd_soc_dpcm_can_be_xxx() to top
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Wed, 21 Aug 2024 02:28:57 +0000
X-ClientProxiedBy: TYAPR01CA0176.jpnprd01.prod.outlook.com
 (2603:1096:404:ba::20) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYRPR01MB12156:EE_
X-MS-Office365-Filtering-Correlation-Id: 92f411d3-ad74-4fef-ac46-08dcc18902a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?higIQck+jRJDFP4gowFmN+MdyGTzcfyYHD8d605u12e0Y/H/jw7IZSj2kyYm?=
 =?us-ascii?Q?BVwzWx5p0SzIXaG7WpKtulSZzJYcwEY+2uStGIBZUx0VHjlqAAEFpEumdbjz?=
 =?us-ascii?Q?nsWVpXVytcYcIq7TKsRTf85IiXzL6h+G2qwJOHaz/A6zhjicwGVVOwz9f1X0?=
 =?us-ascii?Q?VeY4jcIiOwgk0SIj51wNzE0lUDk4+g0hX2zVpdYRoRzuhO8r5a7CsWSPrpuP?=
 =?us-ascii?Q?Dafa9h/aRbsX1tMg1dfmIbhLl37h5OYGVcOJlPWd60cwk6DIXpOU6V9A9rqA?=
 =?us-ascii?Q?IBk5o0AxHpKIIT2F3lyDHcKRD8CvqFaB047O+DyiOfQn14mtbDW3N2PmBK0i?=
 =?us-ascii?Q?9kP2U30rVxpc3d7dpzEbaS16cvw89MdrnlZelc56jwj0Wi8dSgtIITBT3Z/x?=
 =?us-ascii?Q?e+j5De4Luayp69hbYVO6SGn4vKWWux/ob9TBgR8kLa+3yxe9DZA5X3G3qzKy?=
 =?us-ascii?Q?ypBoK3s0VdtQzCikIL6h8EsTiHXZPMYSsZH0sXo2pBVUAprpuvzyisCT2KPy?=
 =?us-ascii?Q?4NymRqPeL1SZG9S7QW67t0af54eGVrVaK95a0C33JfsJPQZFm9+H07T1qMiv?=
 =?us-ascii?Q?Va6q1FVGA9mCSmPRlMDm1NKXQ7784CtKlkkPeZSf/keDkyM0tQTmA5FB1mZJ?=
 =?us-ascii?Q?V8qmzXoVxxX+0zzd1rvMaT5Pr6P3avCFVV3ZOtIfgdaBTtABY9m3PKsCF0tF?=
 =?us-ascii?Q?HQABczQWXcWTGwSfkqTK2QbSL5mMIv3fpf7p95MBe49wdU/2ZEGEdfzIWu9r?=
 =?us-ascii?Q?itySwxYJrkpw2Y3JHdd56Y4Glc8c4FKhDuLzuwkKTFO/TxG7sro7G9Rc9YdZ?=
 =?us-ascii?Q?Bw2MjIzGC+MM5Xg54/jS699JrlTSQ4CWaNAXFIV2imLQtctS6ZPx2YcalPQC?=
 =?us-ascii?Q?3dAa3UfQwHd3o8sAx8tK7cfCFJUjk91E/In2mqRC1pZS7Oi8cyY9U2tUoT8n?=
 =?us-ascii?Q?RLRG+iDad8w+m204fyp502PYDPQdHfq2krTb/0eVHquX4FwRTPGu8ptFnNrS?=
 =?us-ascii?Q?KgWjJLBYbFoisE/lsH5EwzPNUPCYD4PRCQlRTl0udYyTFXFrB+dvfxFnISdH?=
 =?us-ascii?Q?Z1jDmpSFjeFJBe+GHnhOJksxs2FVLe0S7QriWdcHsADY7f6lwXdxdgIngfEe?=
 =?us-ascii?Q?ogr0FkDooG96fGk0xqr5oD/F+tIM4sn/N1R8RIH2OtJjYjWDwz68NTDQiVn4?=
 =?us-ascii?Q?MTYGcULCUBoFz/Xi5NaMw9tLOYIDAXD39vy5vpU2njuoon32zn9NkMfmeCOb?=
 =?us-ascii?Q?M0E5U0WOGBgIKSuaEVNy5vQRmVoCMwGfSEkcvbtnsQIW1rC8LPg9cAgNi3Gu?=
 =?us-ascii?Q?uaJbqdIWTXUOLzVBkhmsVHO+GkV8WbFnSryJNqaSmRUJGtvvD1zZphETkxrd?=
 =?us-ascii?Q?ozbbV5nUU40dnYBm49am+txAYeYq7vpYkDkShJ2/Ziz+BDd9tw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iU09FYA7EgFGMj/EwWwvweKjqP25NUbXv19aIesGjUN5zGUYXs1tZtK6fYpb?=
 =?us-ascii?Q?oDuIW5lD6lGou1wfu3cBbJrQDO7yX3y22t0nZCYhdk2fO9vWrmsUgcnmu85r?=
 =?us-ascii?Q?2NHdDOkH4AiVv7ZkDASOBa0ynd0N4F4abhdslB/2k4EjdbEAeWh3vHrjs/Df?=
 =?us-ascii?Q?R63a542I81P7GACXFD+hHsco8c8U7lO9Il+1uUGdPoF9MnQFptEx58rsixI/?=
 =?us-ascii?Q?jI5zZsW+WywDhGMI+Vvtx41bNfAZkvaz1neSPiKKDyA9fhObVn/b6YEgkn4n?=
 =?us-ascii?Q?KbQcVsaP4BG87o3srB+fiMnGARkMfix0Dls4RqXEBiRzrmKbButJqj/nd49m?=
 =?us-ascii?Q?jwre7YJNbZaMSQC/WvuZEDg/7Tj0CmisHbqAkwRV/mfwDdE6ZUaS2r+7ID8S?=
 =?us-ascii?Q?zuCDUFxxWi6kLE/qNkD9kC0a35wTvioZezeT9O07I2A/zRzuEtHigooIXxJ+?=
 =?us-ascii?Q?QVTF7krgOLx3PqwfqHqEuKbLNjlsdz7NMRiyGTQpo3IImeH1JLy8v1csEwmf?=
 =?us-ascii?Q?bZuZ9ascNGZKa9zQL7D/+72ghmkZh5+gBzL9D3VbXx7w1/+SqONYc+yZRSCG?=
 =?us-ascii?Q?jGsiUPQ81D5FJqmHx6yyP6BtU/6yUAs3NRyJREoWoTAMZYFtoCtdFLvJJUsr?=
 =?us-ascii?Q?HTthVwncgxjbjv6EWvDdzi6PhnsDzliMypfkC7wfkhiDXl5BGHytQcmWcYjC?=
 =?us-ascii?Q?qXjGMKx85JpKKEbz5rV96Wz5T1oTApMiTtYEhc1KkRCnO5NKxqoe2V0m2Uo/?=
 =?us-ascii?Q?pW8jkSkGLCvDP6h64v4e/yGQ+EDjma7t+9vR02/5emnb77sC1G+pYBl+6Am4?=
 =?us-ascii?Q?ZFS7WdEhGVtZe5UDV28K90xgzeO/I+UscvvZkZ/aQs5Ew6dL7Nb62TyKuoC4?=
 =?us-ascii?Q?zSKOgC3+bHoAhYOPbZuyA19odXB+l88FJWbehc0WAlV58coxe/KTlpRoWVCY?=
 =?us-ascii?Q?q0E1tBMAvIRFAvjbmTZ/GGzHgv1LbnP8IVIWifX6B8Mboplxk9eHjKOM4LGv?=
 =?us-ascii?Q?PVrUJjipJVJ4Cov7b4zug1kL6erN1eJTW8Fazg26dnBRHQmyv32he9bTcxeE?=
 =?us-ascii?Q?/kc3kMcUJKp8emx6Yk11nfMttVigSpd87nV9+pPTi+eBAN45l8aN+D0Ph7aj?=
 =?us-ascii?Q?LctatokAJRpi2lNNrvOl/k6sM8mv0Pl5YU1f4LHwM3LHyRlHat7QWt0m/lxU?=
 =?us-ascii?Q?d2LjLvjOcmxDIeLGNLf7/Q/9ZYVlMKcxV3EfR5jD3w86FyRlP9nrwNY8GDo8?=
 =?us-ascii?Q?k3FWYK5VBP7GkPNF2W14YoxfmdRntrA5j8TqjlDnKe5AZP9LWJqXW+F6QEsG?=
 =?us-ascii?Q?4JRVFsGRG1Vr5wgZchd0mhiXGPEwx6j3XwWw6dcIVYWUjVFZ8OPLUHkcxFW6?=
 =?us-ascii?Q?PrJRxvjAY42eZy7vbCGmqYe17nxKdTEgX6+hmOx58VIv435UWIvdmpvZBXPV?=
 =?us-ascii?Q?+GjfTjMBnJXG/OLMRO1B7o+1js8eL3I9qq/HSP+bf9rBOtiAV4WylJGnc6Iu?=
 =?us-ascii?Q?AKwHMeT2ttW/BCEpA2OMdE68ZcT2a4V+gqUVoVcUEIVTTLL+vHTexZz1AlUU?=
 =?us-ascii?Q?/q2miI2LWbifVhM1fQ6zB9xwrxfkecdDPioBWgm9ihvA+09IJSh0pDmM4ngU?=
 =?us-ascii?Q?myMFancx+Xyu9NORVKWZuZI=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 92f411d3-ad74-4fef-ac46-08dcc18902a8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2024 02:28:57.9622
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 mrTN1Gfp4RKEjJ04yeNDxk7287ISxxFKk5suxmwO800BLYsL/bBquK7wa3J66Yzxx5YI8X7vvt6UxRNKbcligOlbw0Riik2WC85+PHz0V3j0NIJ/ap+hlVZk5kD2cq17
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB12156
Message-ID-Hash: DMY3NMZLQ3JVADKTSZSAB4BFICIPQBA5
X-Message-ID-Hash: DMY3NMZLQ3JVADKTSZSAB4BFICIPQBA5
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DMY3NMZLQ3JVADKTSZSAB4BFICIPQBA5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

This patch moves snd_soc_dpcm_can_be_xxx() functions to top of soc-pcm.c
This is prepare for cleanup.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/soc-pcm.c | 204 ++++++++++++++++++++++----------------------
 1 file changed, 102 insertions(+), 102 deletions(-)

diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index baf8b81e7110..667d8dff1314 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -49,6 +49,108 @@ static inline int _soc_pcm_ret(struct snd_soc_pcm_runtime *rtd,
 	return ret;
 }
 
+/* is the current PCM operation for this FE ? */
+int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
+{
+	if (fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE)
+		return 1;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_fe_can_update);
+
+/* is the current PCM operation for this BE ? */
+int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
+			       struct snd_soc_pcm_runtime *be, int stream)
+{
+	if ((fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE) ||
+	    ((fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_BE) &&
+	     be->dpcm[stream].runtime_update))
+		return 1;
+	return 0;
+}
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_be_can_update);
+
+static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
+				    struct snd_soc_pcm_runtime *be,
+				    int stream,
+				    const enum snd_soc_dpcm_state *states,
+				    int num_states)
+{
+	struct snd_soc_dpcm *dpcm;
+	int state;
+	int ret = 1;
+	int i;
+
+	for_each_dpcm_fe(be, stream, dpcm) {
+
+		if (dpcm->fe == fe)
+			continue;
+
+		state = dpcm->fe->dpcm[stream].state;
+		for (i = 0; i < num_states; i++) {
+			if (state == states[i]) {
+				ret = 0;
+				break;
+			}
+		}
+	}
+
+	/* it's safe to do this BE DAI */
+	return ret;
+}
+
+/*
+ * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
+ * are not running, paused or suspended for the specified stream direction.
+ */
+int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
+				  struct snd_soc_pcm_runtime *be, int stream)
+{
+	const enum snd_soc_dpcm_state state[] = {
+		SND_SOC_DPCM_STATE_START,
+		SND_SOC_DPCM_STATE_PAUSED,
+		SND_SOC_DPCM_STATE_SUSPEND,
+	};
+
+	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
+}
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_free_stop);
+
+/*
+ * We can only change hw params a BE DAI if any of it's FE are not prepared,
+ * running, paused or suspended for the specified stream direction.
+ */
+int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
+			       struct snd_soc_pcm_runtime *be, int stream)
+{
+	const enum snd_soc_dpcm_state state[] = {
+		SND_SOC_DPCM_STATE_START,
+		SND_SOC_DPCM_STATE_PAUSED,
+		SND_SOC_DPCM_STATE_SUSPEND,
+		SND_SOC_DPCM_STATE_PREPARE,
+	};
+
+	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
+}
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_params);
+
+/*
+ * We can only prepare a BE DAI if any of it's FE are not prepared,
+ * running or paused for the specified stream direction.
+ */
+int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
+				 struct snd_soc_pcm_runtime *be, int stream)
+{
+	const enum snd_soc_dpcm_state state[] = {
+		SND_SOC_DPCM_STATE_START,
+		SND_SOC_DPCM_STATE_PAUSED,
+		SND_SOC_DPCM_STATE_PREPARE,
+	};
+
+	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
+}
+EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_prepared);
+
 #define DPCM_MAX_BE_USERS	8
 
 static inline const char *soc_cpu_dai_name(struct snd_soc_pcm_runtime *rtd)
@@ -2960,27 +3062,6 @@ int soc_new_pcm(struct snd_soc_pcm_runtime *rtd, int num)
 	return ret;
 }
 
-/* is the current PCM operation for this FE ? */
-int snd_soc_dpcm_fe_can_update(struct snd_soc_pcm_runtime *fe, int stream)
-{
-	if (fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE)
-		return 1;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_fe_can_update);
-
-/* is the current PCM operation for this BE ? */
-int snd_soc_dpcm_be_can_update(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream)
-{
-	if ((fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_FE) ||
-	   ((fe->dpcm[stream].runtime_update == SND_SOC_DPCM_UPDATE_BE) &&
-		  be->dpcm[stream].runtime_update))
-		return 1;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_be_can_update);
-
 /* get the substream for this BE */
 struct snd_pcm_substream *
 	snd_soc_dpcm_get_substream(struct snd_soc_pcm_runtime *be, int stream)
@@ -2988,84 +3069,3 @@ struct snd_pcm_substream *
 	return be->pcm->streams[stream].substream;
 }
 EXPORT_SYMBOL_GPL(snd_soc_dpcm_get_substream);
-
-static int snd_soc_dpcm_check_state(struct snd_soc_pcm_runtime *fe,
-				    struct snd_soc_pcm_runtime *be,
-				    int stream,
-				    const enum snd_soc_dpcm_state *states,
-				    int num_states)
-{
-	struct snd_soc_dpcm *dpcm;
-	int state;
-	int ret = 1;
-	int i;
-
-	for_each_dpcm_fe(be, stream, dpcm) {
-
-		if (dpcm->fe == fe)
-			continue;
-
-		state = dpcm->fe->dpcm[stream].state;
-		for (i = 0; i < num_states; i++) {
-			if (state == states[i]) {
-				ret = 0;
-				break;
-			}
-		}
-	}
-
-	/* it's safe to do this BE DAI */
-	return ret;
-}
-
-/*
- * We can only hw_free, stop, pause or suspend a BE DAI if any of it's FE
- * are not running, paused or suspended for the specified stream direction.
- */
-int snd_soc_dpcm_can_be_free_stop(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream)
-{
-	const enum snd_soc_dpcm_state state[] = {
-		SND_SOC_DPCM_STATE_START,
-		SND_SOC_DPCM_STATE_PAUSED,
-		SND_SOC_DPCM_STATE_SUSPEND,
-	};
-
-	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
-}
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_free_stop);
-
-/*
- * We can only change hw params a BE DAI if any of it's FE are not prepared,
- * running, paused or suspended for the specified stream direction.
- */
-int snd_soc_dpcm_can_be_params(struct snd_soc_pcm_runtime *fe,
-		struct snd_soc_pcm_runtime *be, int stream)
-{
-	const enum snd_soc_dpcm_state state[] = {
-		SND_SOC_DPCM_STATE_START,
-		SND_SOC_DPCM_STATE_PAUSED,
-		SND_SOC_DPCM_STATE_SUSPEND,
-		SND_SOC_DPCM_STATE_PREPARE,
-	};
-
-	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
-}
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_params);
-
-/*
- * We can only prepare a BE DAI if any of it's FE are not prepared,
- * running or paused for the specified stream direction.
- */
-int snd_soc_dpcm_can_be_prepared(struct snd_soc_pcm_runtime *fe,
-				 struct snd_soc_pcm_runtime *be, int stream)
-{
-	const enum snd_soc_dpcm_state state[] = {
-		SND_SOC_DPCM_STATE_START,
-		SND_SOC_DPCM_STATE_PAUSED,
-		SND_SOC_DPCM_STATE_PREPARE,
-	};
-
-	return snd_soc_dpcm_check_state(fe, be, stream, state, ARRAY_SIZE(state));
-}
-EXPORT_SYMBOL_GPL(snd_soc_dpcm_can_be_prepared);
-- 
2.43.0

