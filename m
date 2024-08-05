Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 877079472C0
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Aug 2024 03:02:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CA6764E11;
	Mon,  5 Aug 2024 02:58:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CA6764E11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722819501;
	bh=ImsyWURKPtTHbfCJHXosm/KB2Ilacgy4ZEImm91JyoY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=JHbVdIxArW5Xhby6vvUmTWY41SPPndieItScptJggUEoQA6TEW73o35baKjMRB8+h
	 8zzORblfPSl+JRq/bYRwrkLlLCt9wGmcgXhEC/E82PGEQSQzoNEF38hMWGDqil4pUF
	 bfVaWlE93pHOXSdLhE+HjlcXvp7IqB7nBP8vRg9g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C60B6F806A5; Mon,  5 Aug 2024 02:41:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9E14BF89C69;
	Mon,  5 Aug 2024 02:41:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 330ADF89BBA; Mon,  5 Aug 2024 02:41:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0A396F89BA9
	for <alsa-devel@alsa-project.org>; Mon,  5 Aug 2024 02:40:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A396F89BA9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=LXRDU+/q
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bjt9IxYDqtWf3um2TgwH2iFqfLMqj+1Osk0av9OfoN1UU5ih9ev2gYg37izaamnncPcTywxdfePJyV18IXAQQHSVHkjzGyMko24cO5rsTt3vFDN141lX+DtnYzrzzvf4uSwm54ClnsOBKc19VeRbOF95f9Yvoa9XgxQyuC/u5pcLUPYfk+HUyox7cV2RrldM/QyYpvFiyhVfTVTdancoQMdsJIYpRKiqebwyI5bk+upnt1Ya2NoLJ7wVE8IRjJQ+SY9Xf13X8K4ga0O0en7i3Vca+Auo1i/rbwexhn/w4kfoL/Jt5cxhgOA8cChMmM0dN3OtJ42vlZ74mccLD+1Dfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jY/GPF9nfFTlEvBx8AASVpfke7bl2sbrIDvWtgzUuTo=;
 b=R0pX1BT6WyYg2GJ1y0s5igRWF9T0bMBIUnVbNWVBhOJl6yRzeJ+7/8nHYMgqS41/WPdN6fJ5QpZSZg1EZVi3Ukuta12Trmub7d7j0i4QrDhcEYk7PEJTpRJDPDTsX5Q8CvOi6Q/ZuvrwQWNFo4gLCAAOhj/Jj4jTRWGudWhZOEC0Ext3d/1AAQYnXxJS2ZTMg6FacqTGS+8m6YJIBiqH5ZmEIc9DyOA+irFI6oc7XPcDus54J1jOu+QsxZWi8APq5d1FH/jIEuF4GwDkQsxj7VOlcigyHFKpWuG7Bj6ORQwSwf0TYLWd/qzIZG8Dn40GL2cw4reEpPBjetgFSjwTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jY/GPF9nfFTlEvBx8AASVpfke7bl2sbrIDvWtgzUuTo=;
 b=LXRDU+/qMSuBfdTTtSPM5SfenQ3Hml7R1hDU6y/hhP0e7cCpOZbIYZt3cIjuzlHxVOYoiSVjaH7CgchsAVXk9EW+JAweWikEOotcXCpD9akRsBaYepZNHD3d+H7tEaxXYEH/Gymqu/PbVmeRukqk7xfIzBVRZhErUk8SViMnP70=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9302.jpnprd01.prod.outlook.com
 (2603:1096:604:1cf::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.25; Mon, 5 Aug
 2024 00:40:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 00:40:53 +0000
Message-ID: <87a5hryf6y.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH 071/113] ASoC: xilinx: use snd_pcm_is_playback/capture()
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
References: <874j7z3j1a.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 5 Aug 2024 00:40:53 +0000
X-ClientProxiedBy: TYCP286CA0083.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::11) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9302:EE_
X-MS-Office365-Filtering-Correlation-Id: ead9b418-c0c7-4530-efe9-08dcb4e7432c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bGf1V0uA6EiTqe6QUIDBmqZp3XSXSLi5b3pw+oGtRgpDE9i0z1SigP9DsapM?=
 =?us-ascii?Q?vnecVa17mWpVcMFgdT/9n2FCE4IrczRIPlvRVewkaKVCTL68cg6wuZQbBSi+?=
 =?us-ascii?Q?Xfpp79ex+6ORNdYwIWJ5nY7zSpI1omQMT5/qYlx2uDhpR8O6uj2o1XqPZEnw?=
 =?us-ascii?Q?qyexC8nkg2x5RhAcew0QrwUSOFDcnGC9S5WE8gdplsonpiSm2LahEGAoJi8M?=
 =?us-ascii?Q?5aP5BHEKe0M25X6zJCvzgXf311RTYFSTeQQJ7Jym6wofJezOIeCtB3wrMGhP?=
 =?us-ascii?Q?4N5norI1LpEYtF/TfZL1k8gNCRvVEaN1YvT+evY1kZEGjGmyXaDU19yTdfMP?=
 =?us-ascii?Q?iV9rgIpNjjZKVQdpEMrCN+fV/iQQiALF5kJuq1k+FCEd8rhwqoN4yZWr9EOX?=
 =?us-ascii?Q?q/lI465suPMo48izvT357S5iVPk1A3fYnfVIqKLvsrkmcP61pMfEqyM5AWGT?=
 =?us-ascii?Q?7o7xxj/OAwrnTJ3hQ+03z6CiKQq6i1LTHlhF0A6KZnq17t3JNUZw3716dsEM?=
 =?us-ascii?Q?c/up68HXmL2c59tFRASL4FHqz1uOt73UAqy/OAN+JUYyfr94s8F6oKk8MfP6?=
 =?us-ascii?Q?CAQGGTpPZyIdqGm+4FtkxrhCFb+LWLJLmmLo1CAWruF38HIwLXOKwiM+bt0W?=
 =?us-ascii?Q?N4Np0apEhf4IZYue1frF6pcvZONM5LF0qyuMi6iYYI5UEjx6paPGCxmlbjmz?=
 =?us-ascii?Q?8sFiZrRY14NYQnn4WI1F5CLF+f4FxIP/oeuJuwu6ZT+N1F78mr4XGNwZla93?=
 =?us-ascii?Q?uiV8yfYZfFkBb9jis6cxQnAF/dLDt//TYTeHXZlDSGofN0nqKvzeflMYH9yL?=
 =?us-ascii?Q?Be9Iw4yQaQwY6qUkSLB0KX9NT2vFEIbDf7FRlkTE0bnBSwS9YZzbt+C536Yg?=
 =?us-ascii?Q?l/8UqX+kNoQUJj9IGh5f6bnVhikojMGHK7IZnd42h1tUoR2N5xfblEoMXDuY?=
 =?us-ascii?Q?80Q1LkGZo6soiyz8Bw+WYrKPWiYnSn965KC3bud8qKaBfzMvh8DY4RJdV0hF?=
 =?us-ascii?Q?U4I2I+40tShdRgFIa8lbic5k4pWuNRIcPubyL5wQQOQedNcWS7B4+JAXjayV?=
 =?us-ascii?Q?L+UA6IOYkDMbd9L1PGXUNqYfUwWe7XsGYnL4C3KqRnM3oDUnaosQ0OIn/PAI?=
 =?us-ascii?Q?/ft66q1l70cG69O93jQ6qjb+1zpsR7z176n3AKxHxWm4c2490bFaiHb4PY32?=
 =?us-ascii?Q?uf6nla8/KWgjiufK71WBbZ7Oo7AqeT6DMJwiBs2+xa36CTGp8fEWHTR4LV0k?=
 =?us-ascii?Q?SC3jryY66nOKbsD8nH1HS72I5oiikMKu2drpXb5R8K92O0gOSXdeVO9GF1Dr?=
 =?us-ascii?Q?R8dLnC8L8m0oyuodZboYbOS6u5ydVijYu+r+uwaGaBk8oXLFrRXU117J8qHN?=
 =?us-ascii?Q?vJ4Vd331OW7jiOmp/n0q0PE3Ac1RAz6J1bYA7AbimqchdUHUsw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?H3yQ6f5CfET1XZtK67XX9k2LjkBLmWlJ/fKLoPYBlHD/G8McFn3AuXTaT8bo?=
 =?us-ascii?Q?pUuk4LslTxIn5ooM2YXd2ZdlGhs8Z3NiS67bRStJFpfxShGy+8K/Qpr0GHl+?=
 =?us-ascii?Q?nXth444MXZwlxUXFBdc1PB/fwVquyK0IK5x+Ze8snI/kNO9XGzj4LbxsxSX5?=
 =?us-ascii?Q?lEq1AzWCb5c/19vmPqv4yq7u9MOhUk2fNb1jMjiKhcKEThUKDu241HXCl2xz?=
 =?us-ascii?Q?uJ79ewkIsG/Td7eRhmeQPrVPtp96nO3WPciw/4s2RkVQEwjUwTb9zG7pEH4I?=
 =?us-ascii?Q?+sBuz2lG+XAsJYGCT0XTZ8UmHXICVeIOnYkoqc+eBJtYkdLBNsKKnhynSqg1?=
 =?us-ascii?Q?UFgTplPLWubbgcSXYN9nwtuimKd9FLgnbs4JdTWgK2RzoDozwYYKGhYHo7qf?=
 =?us-ascii?Q?AtKI9Tk0I8E6GegqR0LgeeFjpSlFlYpfLWkj8JM/DCDDpsDcABtFv4/qouLS?=
 =?us-ascii?Q?/03uJ7DedAt7H4V62ShAaDYHvf2hlDIUUuo68MGzGg6STxwOMQRn6d58qOld?=
 =?us-ascii?Q?YcnkuWQebRW8goVm1bG6K2v+mtQu/ShoFtgZLASh4Mkoer3sByqC33JqNzyW?=
 =?us-ascii?Q?hFQs9dPLo2LBuqYgHeMb98PkPBQoZwKPoVAVvQSPHmGNGy4/w6/hyGXoq8Ei?=
 =?us-ascii?Q?1bX+jj2M29+6SWmprI624bDNQTl0Oen3TCbHKKD09GzUwpkgmoBR9KyVHad+?=
 =?us-ascii?Q?RUhke3mI78EV6i0Eoj7Iph033jXGUr7GWk1xnzrCojAZmNIFI6fxEzOJnpAb?=
 =?us-ascii?Q?Q3wFKrcbfpf9Mkcp6mh7/ldiIehYtzxLogGkRgJVDZptGjV0DCJzcOCjrdKQ?=
 =?us-ascii?Q?MhGpAsvmRfurfwaB1V4iopK99MXLHE+pEf8Up4woANGDmP7MMtu3Sgx5swMu?=
 =?us-ascii?Q?TavRcVMezN3stdqn1Q/3M61rgK9ZwgZDdobuuLxajCubk34FTudq65VneeHG?=
 =?us-ascii?Q?eapEMopw6q9fShibUCVr7NKwB/NpCnMvmAXMH7Cc08rtfCESAH+qkhQ/tvOJ?=
 =?us-ascii?Q?Ps2D1hIe4h9nD2Nil9n2cthufqhjP0DyjuCMXDbojcAzXmYCBKh37p9VmceO?=
 =?us-ascii?Q?N+H7LbKimpNdU+jGQ0QsOIg+GZha9dy092UfbzofFwDkV3vkKcofSVO5ZYZX?=
 =?us-ascii?Q?iFsyucDJtL564vsvg0kvGbwRLzhnUJWNXQbH7nczS/fgHv55tk3aWZbbHyRY?=
 =?us-ascii?Q?9zcwQAlvJN0IIKDB62iv9+PpJJajBMEYztrejqizMs+bD9h5zXUZpXxQqkfk?=
 =?us-ascii?Q?63jPlv7fAxtUhpU2P5gL4XbZzleHarmrbpWlj9z66qtkWj9MabS2CnnHbwjM?=
 =?us-ascii?Q?x3hQvxI3oO1l43wckpFT2N4u2VQqPlqiN/4/qPHkkxkuWhAFZnr1hfLi67uv?=
 =?us-ascii?Q?OIgE7DEwEaNRCSYKX3px+z4M19kf64nzgFCU8p0hYzpl/7q1a2Kkd6tMNrKi?=
 =?us-ascii?Q?20vpkk8F3JyPRAaVPJYMFi5Ltb1zQESl/u/U3x1bN+4CZBu5VVACvTTmOe1P?=
 =?us-ascii?Q?mAE2tjqB5cLjzLzqJOhL+UTrMtRBRs0vMh+rFNUPHRCBMX9RzPpmB+N7FV4/?=
 =?us-ascii?Q?U5gH3oEzofFcPr5vQjhXPT+cvEnOiiALNbRxMP2PN6ocK/f42xglk8wbZADR?=
 =?us-ascii?Q?eDxJPeLsf4OXNZNoYIX57W0=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ead9b418-c0c7-4530-efe9-08dcb4e7432c
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 00:40:53.8157
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 m0F/BNFttuf1mXGIPuLPYPV0bRhdAUeVyUQoEWANamDpEsGqq2N1vtLFaq5i7SwkdcdfPKlnxMJ0F5pM3dWrYpM6s1YAYVgpxBwBmA3Mqo9e/0dHwLhx5p3ZQUqiWqLD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9302
Message-ID-Hash: Q747DXHTG4JCG7IE25ROHH7H2LMI5K6Y
X-Message-ID-Hash: Q747DXHTG4JCG7IE25ROHH7H2LMI5K6Y
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Q747DXHTG4JCG7IE25ROHH7H2LMI5K6Y/>
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
 sound/soc/xilinx/xlnx_formatter_pcm.c | 12 ++++++------
 sound/soc/xilinx/xlnx_spdif.c         |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 158fc21a86c10..7076d0befb4be 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -271,7 +271,7 @@ static void xlnx_formatter_disable_irqs(void __iomem *mmio_base, int stream)
 
 	val = readl(mmio_base + XLNX_AUD_CTRL);
 	val &= ~AUD_CTRL_IOC_IRQ_MASK;
-	if (stream == SNDRV_PCM_STREAM_CAPTURE)
+	if (snd_pcm_is_capture(stream))
 		val &= ~AUD_CTRL_TOUT_IRQ_MASK;
 
 	writel(val, mmio_base + XLNX_AUD_CTRL);
@@ -334,10 +334,10 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct xlnx_pcm_drv_data *adata = dev_get_drvdata(component->dev);
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	if (snd_pcm_is_playback(substream) &&
 	    !adata->mm2s_presence)
 		return -ENODEV;
-	else if (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+	else if (snd_pcm_is_capture(substream) &&
 		 !adata->s2mm_presence)
 		return -ENODEV;
 
@@ -345,7 +345,7 @@ static int xlnx_formatter_pcm_open(struct snd_soc_component *component,
 	if (!stream_data)
 		return -ENOMEM;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+	if (snd_pcm_is_playback(substream)) {
 		ch_count_mask = CFG_MM2S_CH_MASK;
 		ch_count_shift = CFG_MM2S_CH_SHIFT;
 		data_xfer_mode = CFG_MM2S_XFER_MASK;
@@ -466,7 +466,7 @@ static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
 	if (active_ch > stream_data->ch_limit)
 		return -EINVAL;
 
-	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK &&
+	if (snd_pcm_is_playback(substream) &&
 	    adata->sysclk) {
 		unsigned int mclk_fs = adata->sysclk / params_rate(params);
 
@@ -479,7 +479,7 @@ static int xlnx_formatter_pcm_hw_params(struct snd_soc_component *component,
 		writel(mclk_fs, stream_data->mmio + XLNX_AUD_FS_MULTIPLIER);
 	}
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE &&
+	if (snd_pcm_is_capture(substream) &&
 	    stream_data->xfer_mode == AES_TO_PCM) {
 		val = readl(stream_data->mmio + XLNX_AUD_STS);
 		if (val & AUD_STS_CH_STS_MASK) {
diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index d52d5fc7b5b81..bf79639081ecc 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -84,7 +84,7 @@ static int xlnx_spdif_startup(struct snd_pcm_substream *substream,
 	val |= XSPDIF_FIFO_FLUSH_MASK;
 	writel(val, ctx->base + XSPDIF_CONTROL_REG);
 
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+	if (snd_pcm_is_capture(substream)) {
 		writel(XSPDIF_CH_STS_MASK,
 		       ctx->base + XSPDIF_IRQ_ENABLE_REG);
 		writel(XSPDIF_GLOBAL_IRQ_ENABLE,
@@ -179,7 +179,7 @@ static int xlnx_spdif_trigger(struct snd_pcm_substream *substream, int cmd,
 	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
 		val |= XSPDIF_CORE_ENABLE_MASK;
 		writel(val, ctx->base + XSPDIF_CONTROL_REG);
-		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
+		if (snd_pcm_is_capture(substream))
 			ret = rx_stream_detect(dai);
 		break;
 	case SNDRV_PCM_TRIGGER_STOP:
-- 
2.43.0

