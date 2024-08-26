Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BA41195FDD6
	for <lists+alsa-devel@lfdr.de>; Tue, 27 Aug 2024 01:43:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6E1A86F;
	Tue, 27 Aug 2024 01:43:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6E1A86F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724715820;
	bh=Z9HQMCTtjq5jVNbFmJOGI2szu4Why9Xyist5j/hnIdI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TYjDdLF/VOdWkKrz/RqrvZzNZS5hU+udc1J8LuXtbhEBnJ9Bzu3R4JnoxmRReXMuq
	 ph+BpvTUu9lQKU+uXW0gEM7L5AqrcLdo/tC27OpeEfaCB6qZY47SHbLInzmCVym/px
	 XvS67vVmhcIrnpITpOnEX/F2RgZbWmvV37NCPe3E=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6895F805D5; Tue, 27 Aug 2024 01:42:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3C887F805BD;
	Tue, 27 Aug 2024 01:42:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7B7B2F80494; Tue, 27 Aug 2024 01:42:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from OS0P286CU011.outbound.protection.outlook.com
 (mail-japanwestazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c406::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5535EF80087
	for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2024 01:41:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5535EF80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=Jc2bdloS
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xzTjiJ7cOyMRt2YVZ7v3BkJHp7ocTI5Gud3dqzE8gbUUY7dwu/YujOZByQM04cS3kpELudULd/7//TnCZCbsXNzPBeoIxp3MtUSl1tod5b9CQIEaS1wIahKYbZ2AGcRKeKBtnUmMCqoygfXmuXiMzJHHJckpWx07RaJ7IsupRnAn4x7vOA/8z1pw3qvB3qqP3FG73fHv1FgOrhTQC6Do1w3VOVpoG2hSRlKfYYsv3zgUA4W7XwStHChuvrYAqScmHHdEaTp2mm3PMYP5lRhGT6msiyHKlD0Py9zCU5m2qlxPJSvHhuvOGa0jzvOQmLdoxqx2Gu1U1LZwyiCcSlWm2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XGirFK46gfKBrPpMgri2VH0OCXwC05M4/9v2mS1WE+c=;
 b=UiIxiVgXk3PwNRKewB14p5n5PcTzya2krJ63vjSx5XYhnBtsAh5/HI+qb4mjUo1WqBiAuAD0D6gdF9fQAL0iEf4zW5SJ+dgNhZzJd+x3UOSkV1kXcZLpahvYgd2/Te6YQQD+F6Cor33zZK6F1ueWliHXXSqs8+lmgCslnFeVsD9duUcrc9e8dr+x0LKg3yN+b+JHZNrJbyAul/GdDCFLBH+SyG1it+LXLJaCNsTvgZbWvoki6sK8NpKxlqeuMF75m72AdR2uxbH1Z1RvHi/YDcaDtyGntQHSLEKR+lw51FsRF7IwKRiv7aCGheuvtZVTvi+gySlANKFYaaXXya/E2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XGirFK46gfKBrPpMgri2VH0OCXwC05M4/9v2mS1WE+c=;
 b=Jc2bdloSol6r0n2eywuLpgASqzJmeCqajikgpu4NLMteoAgEQ6eNtJJOglmXygADUCwKbgtc0YwRJisvTjxceIZGmr7aCVE12LfIsqmlz0fIzXLg5A8UK7ZSaMBBQy0i8o8v0YWvIYI7wT8GAh3GxmoeoHqUkTEnmxfN14v6wUY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB8522.jpnprd01.prod.outlook.com
 (2603:1096:604:199::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Mon, 26 Aug
 2024 23:41:53 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7875.016; Mon, 26 Aug 2024
 23:41:53 +0000
Message-ID: <87ikvmdf7j.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2-resend 1/2] ASoC: soc-pcm: move snd_soc_dpcm_can_be_xxx()
 to top
User-Agent: Wanderlust/2.15.9 Emacs/29.3 Mule/6.0
To: Mark Brown <broonie@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
In-Reply-To: <87jzg2df7x.wl-kuninori.morimoto.gx@renesas.com>
References: <87jzg2df7x.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 26 Aug 2024 23:41:52 +0000
X-ClientProxiedBy: TY2PR06CA0025.apcprd06.prod.outlook.com
 (2603:1096:404:2e::13) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB8522:EE_
X-MS-Office365-Filtering-Correlation-Id: f3c9475f-2d72-4c21-5467-08dcc628a9c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8+TcOkZCHMFtZk/eH8s1YBl4oXaoG0JHQ5hSxX07/Zm0/duywny/+Va4nbbD?=
 =?us-ascii?Q?5sV4z22DfP4BWWZoqMSMltiF3OxPF487BHKErMVaE4D/2zu3uzGBW6FBf81s?=
 =?us-ascii?Q?ps1aOJ9HauM5lai4aHiixIdSirKRVAR53nbV1NQhPLWiB8ibosEz+C/i3mfu?=
 =?us-ascii?Q?G8nS18OF95+Dd/aaTz+P18RbrVFv8yCJG1VuH6Zq/I9aPF5N72w9fCAqzJ4R?=
 =?us-ascii?Q?1B+X0IMg/8E2Kta6W0VkVxheh2ybfk9/pTFTsIxIaJJDyjFccnI2HGjSSM50?=
 =?us-ascii?Q?wNipodhLCs63N08shYOzogrekaTQJ3YpBlvGoDddf96Z1mgcrq6HPV0h0LpJ?=
 =?us-ascii?Q?kXeooDmtHDEcPqBpZW9VglZeSnBb+2H33B/kXa0Dl1XckJ+NIKt0SkeR8iHu?=
 =?us-ascii?Q?LseYrMMlO5btAvet8zrBUvMgqJCcbi5NGCt9DGgrG6BRS1ndJTGDNdc/pTlC?=
 =?us-ascii?Q?UaXsYzoTy6oPyYmziwNAhYyYuStO3YyHWhYlCiGZHypLwyWH/EMHhYFii2bT?=
 =?us-ascii?Q?7T2uzYQAxau77RX88EA1sUa3dWPsvrCkNgLZtFd3EV8zehJLJCJ5i7kmh3nn?=
 =?us-ascii?Q?eyYsKrgx6azdvq9NW2e9wJiVBT6ZGa4tGkybJ01Grg8kRGu4Nt95bxEQQ89v?=
 =?us-ascii?Q?L2c3tSRjjTMRGJl2ufHV+vD6sbVj4QaZ6BPuoqe8BckuSUIcaU9nKKm3OQFI?=
 =?us-ascii?Q?pzQMM5b+a9eFvYrj0TNlVmNYGLICup7MHCELWZG/Vwak1kvcw+S6PP2wOEyX?=
 =?us-ascii?Q?AzjL7ZBUTnMl0o6Pn+Cge2t4uH4BtQEEmQTjpl5k7xgbbBbRftnOwI6TRafc?=
 =?us-ascii?Q?d74WukJwDafuCgzlz45RYVficTuJI/rAULSKSdEy6W//njyCRWerwjxdLpHS?=
 =?us-ascii?Q?/1ua3L1rk0K7FVq8QMf2fBGnx3uxv/WMZy8N/klhXEXRT032c75AZQned+L3?=
 =?us-ascii?Q?MlGLyhITB2zKAdCEAxklD9zBsXoECXSfWmHoaTXuMOfxdKmZ1LJtleWHhZae?=
 =?us-ascii?Q?fXfyPCwiXrJrdSBM1OFb7tJfqHz8liJ4QGCArZc41a6X/19WRIlHXpkxgimw?=
 =?us-ascii?Q?DR9h/jFN2vyesxBZCAeO4G9cnyCiOW6WvGFq7crThg3M/CF5FSu6z8B+aFcV?=
 =?us-ascii?Q?RThopTXSyKJyqVe9LsdqXYI7N60kO8uHLtkDbtpRcJUF3nMFfAOJImAtx+ot?=
 =?us-ascii?Q?rqIKXTFB41zlfZHKg3/XwzWNvU4Nqw6JxGjTtbSd62WefuABPHSd1N0YnUCS?=
 =?us-ascii?Q?6TpuY5uQlVWgJmlv0t/Ue5buABrvn4Jg6W4Pv69MYNt1ruwKtPcm2uETI1C7?=
 =?us-ascii?Q?M7fw9lhU8oKSgEf0ylyj+yI5SKgAadJYehv7AlIjFcuStXoMXy+5aE1MIQbx?=
 =?us-ascii?Q?C6T23aOdmv+Scdg1SXfguYpAbx5qPdecRXDhkypSCFT0xxpftw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rYouN4kWJWt0XDT36mxwS9C6RsCbp0W6isUAQ/+b5hFYO7ZEE90YCo73MxEE?=
 =?us-ascii?Q?9psXCG+8AAFRzh5mC2W3fJROnsv0qnAnGuJkflhcoiLHNK9NkYP/1qrKhWDf?=
 =?us-ascii?Q?DSClGMf3C2dn8Etzp3gYOYCJQJTV1JMW81B5YcmoNSXCB8cjh2OyzuLuKPix?=
 =?us-ascii?Q?iAKpM59PhVKvcfQqwR+jSJoq4OIzjnb4ngbfSYTLAzWmQGCuF+AVscKgMPEI?=
 =?us-ascii?Q?E8g2bzIfFQKZO+F5TpUsjRZ7DN+D3O5/BASDanoRYUzCVExt0WnZ9iT5/JHG?=
 =?us-ascii?Q?SZG5L7rv8i7xoPto7dC5vLgXEp6wBBoQQu/qyVjh0EzcMUz4xdCawlu26q3r?=
 =?us-ascii?Q?FqfgmZddjycPhxwpOckTIhW+skmVlNiJ36zmFgOPC5gNHSKjY05R1E4bY58l?=
 =?us-ascii?Q?mzYZL52HJLXnbsIIdAZa+odVTYy/BAsWpnG8GPd5Xi1Cbh4QN3amGCQPLDIK?=
 =?us-ascii?Q?U92+eozkiY/9f/4sZzpBz7lqv46jXx1QD/dENR7PXLI+4uiIARiyZPmHgSJc?=
 =?us-ascii?Q?5Sm3JRkSTL2E/Jc9+C4hdzj0HOGhip81uowZFaHZlqZgZodF6ShXNAeMdvHr?=
 =?us-ascii?Q?1YaILuH0CmWrRlFWup+p7hdBib4PZvoBFnTxNbToweijlANo9+UVQrOdhv7n?=
 =?us-ascii?Q?D9SZY0AKEYww6mTyfa5VGlbJbXypAZVuxsilHPhFu0UDr128EXI//FiSqfrJ?=
 =?us-ascii?Q?z6DYmq1mulZQJSFkd+DeUHlj/vWeO8qd/DS7P+Yd46jgmyS56VJLcu6C9XFJ?=
 =?us-ascii?Q?gJQn8To8gI/xeoVr7J24QZXT+D95vgn+X3ziNDcfIeyQmLVs4Gi3S1NJtS3l?=
 =?us-ascii?Q?6oN1wtYDr06Cno9mLxqbNcWose9z1AvrNXFcWPOGRebTHkNJqcfHiIE1NP7X?=
 =?us-ascii?Q?M+9VaEBmNOQwcLJxltD35fYL3/s4wSbyVbaWsgEHUbkpnytcRcrQ01gx3lxx?=
 =?us-ascii?Q?1FxTLIlmwq9g1hANiF/HX9jhnx8cHVKChjX8fY+9tbEVTq6a5aQ+KACTemNZ?=
 =?us-ascii?Q?ul8fMiMhU9UVmIJPpcKgm1RoYCyi1eASzxQoHixrplFbVhkL/mfzu8Q4QL86?=
 =?us-ascii?Q?uu9liepCTdhOMJgJAC+zRO6Y14BMjmcjQd/7fHocWpymQCrsRnByi5BTODrv?=
 =?us-ascii?Q?2cKEbKzTvhVQUkoPdVRqKIv4h/ZX3COIhSy77yla0KP/9g0SEPyG7W/jTv4R?=
 =?us-ascii?Q?6XjQ3cw9Slcys46FiC3fA3ADDQO0pmNtoMUQCoj6zOj4xBoijTTkqH5G0RJa?=
 =?us-ascii?Q?rw2zi98D/IdkHkcS/aor2m036faSDmxnGZ++mtEAbuG0kIuZaHaHFqRg7Kgz?=
 =?us-ascii?Q?zWmR9dtpvWRxTsNGMgmZ2pJdU9dIGgXMQOTJjm58P++9aPYHw9ferFnq2Fpm?=
 =?us-ascii?Q?uLh1MwBN9pStwvzFU++7hfRjfzLDLyttp1iFKedfGvO9BZIhVWTcIdck+O1P?=
 =?us-ascii?Q?4iTdLjHhd3nLhzCFwnjoz9rpiJixTmlQR0TfL8bD+baxO0Jeg2kRlflnqJVu?=
 =?us-ascii?Q?YXdQ08tVXoWX8wJGkhU4+uXSFeRvZx1QfkRSf80Xcp33wyNnJgIDYKEZADF2?=
 =?us-ascii?Q?KHM99W1afvuhYYj6DWYCNhrk+8IJrtlVBWswdEpxzU3DG1iroCdbCS6+bvXv?=
 =?us-ascii?Q?Ghwcq1gzNgCNJP3HZIfKTME=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f3c9475f-2d72-4c21-5467-08dcc628a9c8
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2024 23:41:52.9998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 pBkGI55ZUhukX/ZP23hh9isJUo/zq/oey5AV7MWZ/B/vfXehoB1ID5F9da8mh+134QPjOuVVZgxKL0W8DuJwpRndnHgXKqadsf5kALO+c21k3LXrigy4wURx0+K8Vihq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8522
Message-ID-Hash: I54A64IDA23OINY3267RJAPWQOY7NWJM
X-Message-ID-Hash: I54A64IDA23OINY3267RJAPWQOY7NWJM
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I54A64IDA23OINY3267RJAPWQOY7NWJM/>
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

