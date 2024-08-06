Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9041994867B
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 02:04:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1206F589C;
	Tue,  6 Aug 2024 02:03:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1206F589C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722902622;
	bh=Y8d2OkqWeVfA0AtEq+lEv4r26E6ksOADaa/uO/6MsoY=;
	h=From:Subject:To:Cc:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=uCOozCKJdIvnx/pfFoJPXmiw+2m7yVoynkTn2/9Zb8EYT7Aj2XvU7PihC2gQMQWqc
	 /3Xt6h6a+vGwQGpcluOZAf/8NA7fnnTv5IxdfV+5jXKSD0bYoNE6DLx+zEOwnQ4tAy
	 29RkEjZ6KPKgoMstg215cFhquUOwWIBLtw2S3Y0M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D0E1EF8059F; Tue,  6 Aug 2024 02:03:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 248E9F805A1;
	Tue,  6 Aug 2024 02:03:01 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A99ADF802DB; Tue,  6 Aug 2024 02:01:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.3 required=5.0 tests=AC_FROM_MANY_DOTS,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=no autolearn_force=no
	version=3.4.6
Received: from TY3P286CU002.outbound.protection.outlook.com
 (mail-japaneastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c405::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CAAB9F80236
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 02:01:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CAAB9F80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=YZLU89bw
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o734HGGDUlI9RHX3x/wLwnYeDpvO4B5wwVl/T1DPHU00skuepnHPfwFcotwMp/28EUP8juBUcVTJu2jDq3WnyONpUL99EMF7TL3FBMdp5qfmACn6pwLgUSU0WsEQobZ3UjV/B1QvN7CjVhZPLdGDgjoZUhitknN8Y0AuCn1E1WwpGE68CC27hZ2XpEb14r0NKCYhBdfMZfosDnnb1YrfJ/kEOWmdwJCxT22xv716dTMO9Wy1cCh8H5xNNOB/bRmmPmjZ4/NR95FsdPOUyDc9IZhmafNHggjzVC9P60yAyPhY4dYXM47kq8Cwi2HU+ZYVv4nhGhLDrvobhrDPHSgseA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YAh4dsqO+Du7vr/WusCvFFUhfuck5oFbXA+7+5137DE=;
 b=Wohhi+WgOE9o/Iz0v0gCBkEzp1hJqXSFfHHS5PXmgl/fEzhsrNvPIgeUw1NAak98tvbuSbn5LTC3EXnWaCMaFRPI7VLenG3qUpyxAVVZjwDbbIwEwOJQjybes3hQGeEFyb7/zivjD7Pc5A9H8fKOpbiGJ5RAK9i+5k2Y+SS78QIYL7Y9YI60oHJfcn4vrloeeoQvj0fpkG+DZyKCiNgZFuVahDTjrjQJ65cHsx0LFvYU3+4ZrI/C6OcoCrxQMMM+OMS4reWsu5Yly1BhWof/5cVYazbU4FX+/K8eoBYMueOockyQyGSw0Xhz32Qd9NYg1cpl+EoN3iTx0F0NqJzBRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YAh4dsqO+Du7vr/WusCvFFUhfuck5oFbXA+7+5137DE=;
 b=YZLU89bwfb/bBev2wRsVUyPKv12EaH0RbG2JLc27sWFhuT/re4SnrxffyAtKGFyD+UUpsJTB71TWvx/Kd0JjDoGVAdoWCvAqbdwPPxsFbePtjQxkBCbs54igktARxGym+x64qEzp1THkWokpJts108680lurf2upNHp9RR8+V68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYYPR01MB6778.jpnprd01.prod.outlook.com
 (2603:1096:400:cd::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Tue, 6 Aug
 2024 00:00:58 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Tue, 6 Aug 2024
 00:00:58 +0000
Message-ID: <87v80ewmdi.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2] ASoC: remove bespoke trigger support
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
Content-Type: text/plain; charset=US-ASCII
Date: Tue, 6 Aug 2024 00:00:57 +0000
X-ClientProxiedBy: TY2PR01CA0024.jpnprd01.prod.outlook.com
 (2603:1096:404:a::36) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYYPR01MB6778:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f0c560b-c2e0-48a8-867b-08dcb5aad98e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?I2MFh4tTcAf7EsomQBOGp/o283DttP7FF7PoBnn+/2wBPJDMxBV3cQnUir7h?=
 =?us-ascii?Q?VyrQ7pbk9wcEwo91znlS9KOxbxYk1FvVIIBdNjKO/ob8AnZAoz/3zq1NSLPM?=
 =?us-ascii?Q?0D0cgQ0onIQ89pDicZs0mLbTZdm1ExCjzexinBjvGQfVyc+7v3cyDhQQ/BRy?=
 =?us-ascii?Q?JzDAEtAO8thnavkTLO+kKmWBVnA+CP4GcKGizY5FKrnsEQ+ZHHw2IGfU2rQx?=
 =?us-ascii?Q?uq7ToOdrCGOs6i688uyX6krgGIFD/8T+/EMRg+qDVmF8R7Z5Nn0DDlfiOztJ?=
 =?us-ascii?Q?ozuNsCPXnbCBU5T7tyv6hSDy3mF8pxc67zHnxleB3moK5keg86+C0gVDY+rI?=
 =?us-ascii?Q?k9SvrgN38+xBpRXJH/829bkfu8yyPpgWbxYJQ0Y5kEDOZe1iLBjt2UYjzkAS?=
 =?us-ascii?Q?U9WZSD4XjlYAFJavlTBzkxp5kAPRR0IUcOjg5B2bzw9bvQSZHV4JfdVEfqwX?=
 =?us-ascii?Q?UkxIlyaUGqPeaYihzich74rJl5nzhO8A4OfP+03ctneKYlycuafmvWLCXWEe?=
 =?us-ascii?Q?NcYsp/iUUk9ry7bzSnDd8xeI8X1bzJJI/c0qYyBj4nN+J5CCpgHxMMtjXsHY?=
 =?us-ascii?Q?lOxWOddHBV3KfGI6VzpK6HDLA6qAy4WRNcFSDXkGH43Z20zobMKac2a/lqio?=
 =?us-ascii?Q?hX5mciUvjQ7XQ6Sr7UJajvm5hgoU3k6spvusCDNFKpLkR3dS3KTiNK607vv8?=
 =?us-ascii?Q?tmGG5tzzHOD6q/2Jigbn4AojS/vQctXVh1hoHVuOaU7ALSm1Vvx7CFm9g63t?=
 =?us-ascii?Q?A+Lcx+9u3E102ChHWu+Z+mhhoKGc9usEytf2MJxRMJQgyDA1aBSbgG2WXszp?=
 =?us-ascii?Q?z5aLEzHGdR6uQ+TTsNS6+hYZxWJQxmhqArQW0fL2lwyWC5rvnw6Fz5i0gCHZ?=
 =?us-ascii?Q?kKv25YS1QVJE7mzQ6R7czpszOfNvfRmKlqq4Io5qqa55+/+xhNQmH6GFG1G6?=
 =?us-ascii?Q?Z/LIjV9wzosW22o8YzPZu9uSgkhnueoGcgUwFPfm5riMbs7897UFt0vXFilc?=
 =?us-ascii?Q?MOeDHPIXkT3PGJ7Tki9uJYtulZVs8IuW1qruVB5cqqCkQYDibvp2QEdI5ZW4?=
 =?us-ascii?Q?P3M0AH6OrGGHUUvx3R5LvHTvrJr+WUjhyX1AmWnxenJwRLUS6UJnc45v6bQl?=
 =?us-ascii?Q?Vodl1vpLgcwUNuwDld1zIfx2ws7x9AyJiqAUrfatQ9TbpgmBjL3SI0wd8/km?=
 =?us-ascii?Q?tsluwhNmRW8nqd8Tjghssu+BYT+wDnhgRLa7Nci1zTUIENaTXo8KpFcHkZAU?=
 =?us-ascii?Q?UYGUAun6pyqKoLVm6qOnfRmgnyi1Fzzduq0eRcrCXQ3BjdvB4HoWRaVkq7+O?=
 =?us-ascii?Q?vaGat0eIJjdj+CgjaqaRx70YwLxgRl44QGneDl2E/AkawAWs2nDbDaJuQvYc?=
 =?us-ascii?Q?LFlJNMGt+kffXU9RQd2fGbF27502yDINGS7YLi27ROxfa3ZQcw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?cUP15UXIlMCH7H+niG6FFfvx9ZeJC2jk9Ypvj+JJKCC3hqo2TTpfSa9KbRBT?=
 =?us-ascii?Q?NuSIWhmxJbm8IGVwJRRI3ltqClTgjF6r+c+XDY2aCNP/T9GHScetgNIu3Ifh?=
 =?us-ascii?Q?HWIjEFDBPkTgnbDjAfcVtU709jaH9g0hXn636XqBCQTIZiZ4awKM5q+BkLlC?=
 =?us-ascii?Q?hn4tcvHMQPMyXJoIRwrtrUzpBpJoXqWaAo8auy+dTYbaZUI8NhSs//g7sMvp?=
 =?us-ascii?Q?DLLUmPl+tJPhKvVpUQgOtLxBe7yjk76qlQrHPg6hI+o7kaOHiFLVc+bMHre6?=
 =?us-ascii?Q?TcSvpE8anDeo6cNCBf1fkx1WGfLUTfeYdyHnTz5dU3r656PwdAYWCptRSR3j?=
 =?us-ascii?Q?jT2srgeGFIkukzmCD9ROaSOtBiw9Lo1SEcA9CWYAOUyz2V4djM9enlD4H4IM?=
 =?us-ascii?Q?H1lUS98UDawr3h+pQvHOkVT1WZn7393Mwz6tbDN1iPiCpGzv8Tm8w21dyCH1?=
 =?us-ascii?Q?QoZ3goc9UFDAhv5sdYVhNSo+mGlDIjPzSfIwmuu+6SUuyzWIjjOUzf5UW3nx?=
 =?us-ascii?Q?fMrwWEmpeM0NE3gbbdKtjavCDxQw2BNt6mVXvOtKN6X9/GlTTKIu6BGt8aHZ?=
 =?us-ascii?Q?DAutL4TTk0BfvOWYLQOSOCGm9gXbakDTMvX7c8uDOdBcZXH1iMlC+CVKNUSs?=
 =?us-ascii?Q?fnVS3A0tS9xWA4fD+atxIlWOu7sM0V86h/97V67NrbG1A1ngg8JBc9hXsxTz?=
 =?us-ascii?Q?aNOSfAES41NK8RHk5XGU9kBaYHx57xLHL82Z1ApQNY2bCx5HFsp60WrgJAvV?=
 =?us-ascii?Q?5wUWi2U+Kz3yCot7bta/+FzQcUeBSQI75jqvZkAXzdOEoYkd2jbV68/eIjKy?=
 =?us-ascii?Q?+2vBTBsBbbV5okfCJeXiRwJDsfJjTeqJJvkCsjyawk9eDCmV3h+0snxWNA5j?=
 =?us-ascii?Q?PYCDsNHJpnZn6tXkQ89eZuRJvWIs6qDlhErYahnMQl0kxYJ9FiPv+6YrIucP?=
 =?us-ascii?Q?Lj/9N+VpY+MRn7NZ29j15Yc2ne3qorce4QPidxTQCu1qIG0FP21sKyuHlhmX?=
 =?us-ascii?Q?LApYUA0dI4TZ5YOtDti1+bnbd1+aIOvOUInQuYHhw5f97zUjQYNqQBl95U7U?=
 =?us-ascii?Q?RnDNXb7wx2c8bmACmAzNbgF/vNx/xoN1JGGmQr0KrnzRFpD4u+bXe2wF+8Ft?=
 =?us-ascii?Q?awLeS932ypLwMdHQcvtXPw8gdlcCeII+OK0z2HQSDdWeaNtSnnI6wOxbSUtl?=
 =?us-ascii?Q?P9/oqabhotEyDP1fkqFCAy8YZih4IcskjS+1nKyXy7gezaZNlN+gFfQghrJ7?=
 =?us-ascii?Q?D3NrQ8p/uSKRCsjV7icY3Y5EeszVC4YV2J0EHdXfRVoFJTRwnlXM5Ug+IrVs?=
 =?us-ascii?Q?etvUdlUq2eo+0/gmZUkia2zhCqpHv/ptE6V2R746cSV1Eaa7mdvVD7x7NjhI?=
 =?us-ascii?Q?nslSi+DGuAN8gXbcnz3ACKN6vyUcRBMeoY0vY0cg/wFb8EizChj1AXAvzo67?=
 =?us-ascii?Q?xN52upwqsgyJHv87fyYUDzz0a6zGlb6Vv3wD7DdyCBJYNTeMPJqEIUBKh4fQ?=
 =?us-ascii?Q?dFOXZvGQz1Hnuta2T08HN+kUAwbohncUL5loUmCdz6rDe2hCGiwj2MUqHAh7?=
 =?us-ascii?Q?J3O98192z3PyC0vBO++k5bYW1wgpeRbealc9tXLv83JY/lohfw/gxQUOnJbZ?=
 =?us-ascii?Q?L15eeRPnCZEZ3ET0ZK4WZnw=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 7f0c560b-c2e0-48a8-867b-08dcb5aad98e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 00:00:57.9960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 RJOrzEx9grYox3xBRxGxsMVjgb14kl6eLzwtt4HwRj5/d9A/oDqfwLJWyOGarBHWRuqhOe2kxpLPmzOIfd4M+R5RWXXVrHt4j8BolZRFdGqM8Vqeoza65Yy3RrbyRnyf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6778
Message-ID-Hash: Y4ZSCABDX633LNTCEY5TQSVYPZ7FIMSL
X-Message-ID-Hash: Y4ZSCABDX633LNTCEY5TQSVYPZ7FIMSL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y4ZSCABDX633LNTCEY5TQSVYPZ7FIMSL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Bespoke trigger support was added when Linux v3.5 by this patch.

	commit 07bf84aaf736781a283b1bd36eaa911453b14574
	("ASoC: dpcm: Add bespoke trigger()")

test-component driver is using it, but this is because it indicates used
function for debug/trace purpose. Except test-component driver, bespoke
trigger has never been used over 10 years in upstream.

We can re-support it if needed in the future, but let's remove it for now,
because it just noise in upstream.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
v1 -> v2
	- rebased to latest asoc/for-6.12 branch

 include/sound/soc-dai.h            |  5 +---
 include/sound/soc-dpcm.h           |  1 -
 sound/soc/generic/test-component.c |  9 ------
 sound/soc/soc-dai.c                | 20 -------------
 sound/soc/soc-pcm.c                | 47 +++---------------------------
 5 files changed, 5 insertions(+), 77 deletions(-)

diff --git a/include/sound/soc-dai.h b/include/sound/soc-dai.h
index bbb72ad4c9518..ab4e109fe71d2 100644
--- a/include/sound/soc-dai.h
+++ b/include/sound/soc-dai.h
@@ -240,8 +240,6 @@ int snd_soc_pcm_dai_new(struct snd_soc_pcm_runtime *rtd);
 int snd_soc_pcm_dai_prepare(struct snd_pcm_substream *substream);
 int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream, int cmd,
 			    int rollback);
-int snd_soc_pcm_dai_bespoke_trigger(struct snd_pcm_substream *substream,
-				    int cmd);
 void snd_soc_pcm_dai_delay(struct snd_pcm_substream *substream,
 			   snd_pcm_sframes_t *cpu_delay, snd_pcm_sframes_t *codec_delay);
 
@@ -345,8 +343,7 @@ struct snd_soc_dai_ops {
 	 */
 	int (*trigger)(struct snd_pcm_substream *, int,
 		struct snd_soc_dai *);
-	int (*bespoke_trigger)(struct snd_pcm_substream *, int,
-		struct snd_soc_dai *);
+
 	/*
 	 * For hardware based FIFO caused delay reporting.
 	 * Optional.
diff --git a/include/sound/soc-dpcm.h b/include/sound/soc-dpcm.h
index ebd24753dd000..773f2db8c31c8 100644
--- a/include/sound/soc-dpcm.h
+++ b/include/sound/soc-dpcm.h
@@ -58,7 +58,6 @@ enum snd_soc_dpcm_state {
 enum snd_soc_dpcm_trigger {
 	SND_SOC_DPCM_TRIGGER_PRE		= 0,
 	SND_SOC_DPCM_TRIGGER_POST,
-	SND_SOC_DPCM_TRIGGER_BESPOKE,
 };
 
 /*
diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index e9e5e235a8a65..df2487b700cca 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -181,14 +181,6 @@ static int test_dai_trigger(struct snd_pcm_substream *substream, int cmd, struct
 	return 0;
 }
 
-static int test_dai_bespoke_trigger(struct snd_pcm_substream *substream,
-				    int cmd, struct snd_soc_dai *dai)
-{
-	mile_stone(dai);
-
-	return 0;
-}
-
 static const u64 test_dai_formats =
 	/*
 	 * Select below from Sound Card, not auto
@@ -228,7 +220,6 @@ static const struct snd_soc_dai_ops test_verbose_ops = {
 	.hw_params		= test_dai_hw_params,
 	.hw_free		= test_dai_hw_free,
 	.trigger		= test_dai_trigger,
-	.bespoke_trigger	= test_dai_bespoke_trigger,
 	.auto_selectable_formats	= &test_dai_formats,
 	.num_auto_selectable_formats	= 1,
 };
diff --git a/sound/soc/soc-dai.c b/sound/soc/soc-dai.c
index 9e47053419c16..302ca753a1f35 100644
--- a/sound/soc/soc-dai.c
+++ b/sound/soc/soc-dai.c
@@ -685,26 +685,6 @@ int snd_soc_pcm_dai_trigger(struct snd_pcm_substream *substream,
 	return ret;
 }
 
-int snd_soc_pcm_dai_bespoke_trigger(struct snd_pcm_substream *substream,
-				    int cmd)
-{
-	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_dai *dai;
-	int i, ret;
-
-	for_each_rtd_dais(rtd, i, dai) {
-		if (dai->driver->ops &&
-		    dai->driver->ops->bespoke_trigger) {
-			ret = dai->driver->ops->bespoke_trigger(substream,
-								cmd, dai);
-			if (ret < 0)
-				return soc_dai_ret(dai, ret);
-		}
-	}
-
-	return 0;
-}
-
 void snd_soc_pcm_dai_delay(struct snd_pcm_substream *substream,
 			   snd_pcm_sframes_t *cpu_delay,
 			   snd_pcm_sframes_t *codec_delay)
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index 5520944ac9ddc..1edcb8d6f6eea 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -2388,14 +2388,6 @@ static int dpcm_fe_dai_do_trigger(struct snd_pcm_substream *substream, int cmd)
 			break;
 		}
 		break;
-	case SND_SOC_DPCM_TRIGGER_BESPOKE:
-		/* bespoke trigger() - handles both FE and BEs */
-
-		dev_dbg(fe->dev, "ASoC: bespoke trigger FE %s cmd %d\n",
-				fe->dai_link->name, cmd);
-
-		ret = snd_soc_pcm_dai_bespoke_trigger(substream, cmd);
-		break;
 	default:
 		dev_err(fe->dev, "ASoC: invalid trigger cmd %d for %s\n", cmd,
 				fe->dai_link->name);
@@ -2525,26 +2517,12 @@ static int dpcm_fe_dai_prepare(struct snd_pcm_substream *substream)
 
 static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
 {
-	struct snd_pcm_substream *substream =
-		snd_soc_dpcm_get_substream(fe, stream);
-	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
 	int err;
 
 	dev_dbg(fe->dev, "ASoC: runtime %s close on FE %s\n",
 		snd_pcm_direction_name(stream), fe->dai_link->name);
 
-	if (trigger == SND_SOC_DPCM_TRIGGER_BESPOKE) {
-		/* call bespoke trigger - FE takes care of all BE triggers */
-		dev_dbg(fe->dev, "ASoC: bespoke trigger FE %s cmd stop\n",
-				fe->dai_link->name);
-
-		err = snd_soc_pcm_dai_bespoke_trigger(substream, SNDRV_PCM_TRIGGER_STOP);
-	} else {
-		dev_dbg(fe->dev, "ASoC: trigger FE %s cmd stop\n",
-			fe->dai_link->name);
-
-		err = dpcm_be_dai_trigger(fe, stream, SNDRV_PCM_TRIGGER_STOP);
-	}
+	err = dpcm_be_dai_trigger(fe, stream, SNDRV_PCM_TRIGGER_STOP);
 
 	dpcm_be_dai_hw_free(fe, stream);
 
@@ -2558,10 +2536,7 @@ static int dpcm_run_update_shutdown(struct snd_soc_pcm_runtime *fe, int stream)
 
 static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 {
-	struct snd_pcm_substream *substream =
-		snd_soc_dpcm_get_substream(fe, stream);
 	struct snd_soc_dpcm *dpcm;
-	enum snd_soc_dpcm_trigger trigger = fe->dai_link->trigger[stream];
 	int ret = 0;
 
 	dev_dbg(fe->dev, "ASoC: runtime %s open on FE %s\n",
@@ -2605,23 +2580,9 @@ static int dpcm_run_update_startup(struct snd_soc_pcm_runtime *fe, int stream)
 		fe->dpcm[stream].state == SND_SOC_DPCM_STATE_STOP)
 		return 0;
 
-	if (trigger == SND_SOC_DPCM_TRIGGER_BESPOKE) {
-		/* call trigger on the frontend - FE takes care of all BE triggers */
-		dev_dbg(fe->dev, "ASoC: bespoke trigger FE %s cmd start\n",
-				fe->dai_link->name);
-
-		ret = snd_soc_pcm_dai_bespoke_trigger(substream, SNDRV_PCM_TRIGGER_START);
-		if (ret < 0)
-			goto hw_free;
-	} else {
-		dev_dbg(fe->dev, "ASoC: trigger FE %s cmd start\n",
-			fe->dai_link->name);
-
-		ret = dpcm_be_dai_trigger(fe, stream,
-					SNDRV_PCM_TRIGGER_START);
-		if (ret < 0)
-			goto hw_free;
-	}
+	ret = dpcm_be_dai_trigger(fe, stream, SNDRV_PCM_TRIGGER_START);
+	if (ret < 0)
+		goto hw_free;
 
 	return 0;
 
-- 
2.43.0

