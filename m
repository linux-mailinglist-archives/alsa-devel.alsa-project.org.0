Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B58449EE08C
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Dec 2024 08:48:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7D65410;
	Thu, 12 Dec 2024 08:48:02 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5744EF80246; Thu, 12 Dec 2024 08:46:35 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8DD1F80687;
	Thu, 12 Dec 2024 08:46:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 00B1EF805E0; Thu, 12 Dec 2024 08:46:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,T_SPF_PERMERROR,URIBL_BLOCKED
	shortcircuit=no autolearn=no autolearn_force=no version=3.4.6
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2612::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A350F805D9
	for <alsa-devel@alsa-project.org>; Thu, 12 Dec 2024 08:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A350F805D9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector1 header.b=a67e8F6n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TSef7rJ4BB2lrkMU5XCqD4ks45nCr40ohzcLqtTPf7emll0NBN76lwWqMW4fUo0GUhrd/FWgZvwUDpoVUzwxT8joyBtvSMKkE/glknS89n2QjtZ7/ANPXV9LfhO0Vzgcj3ehblOedjlWbYZtSN7fy53W6MJkNamHJJHS/g0YMin6PCFSz3zTBBJja4TTqVGocqQwAX3d2WYbGuQAOJWivmigsoRF2B6vV1A1GJvpWLsF4sgd5HWiSTurx1OcOdcDa4up0aF/I59Q9jzIOhCmz7WEhtk6kdWXdWb0VGkqspl3plrNaWUdq2dfXtrYsc1EwTvZYwT1mQJbMdP40kRZ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gx4r59MsUrRSAYnRBL2LULLZNbMWnLuBxzcN1FydhN0=;
 b=CxzKYYIx2Oklvhu9oOCBTquA5pST7o7eOE5H5xryN1a/mRPbqc5zXiuUZR+8UTEecCoxge6DsCm4T6ZO1p8F2Znc1NCVUJ60ESPPC9MTLm7RRtGu4s+1rQSNuS+fkT+HWUW21Up4M9kG053DRkdco2MCwvQLsmUncwcQmVQbXkhp+5S2B12S5feSqrmYYypJaWesBDmXSwVD0kbZuvq96giXJghHAcbuZEwcG79pYI8AbZ1PBakZxFYBa9OT4ShNxT2zlNJlqiuKQ0jLlfpOyfu7+aKWZVQ3BQI3EfVlsNEAK1WKPt0QQzEErCOAWF9CwV1qF/VcNJqXtmahG1H95g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gx4r59MsUrRSAYnRBL2LULLZNbMWnLuBxzcN1FydhN0=;
 b=a67e8F6nyhBGHbNUWpHWa5bUncjV/R4064btg0+EUNH0afIzyskU52sxGzecwyh3be8dxCJk5OtZ0BHO711rLNeHk0Pw2mpsH8yv/mwcPJTeNAqf3hvd4RQCDdHFHJRtfC+rMl7sFGRpVfnxkP59LizrkqjyGw6pT8Wnl7r2hP9ZxQS6s3Ab1uqYH/9bA+zBhOefo+zPHPxjIHLFuySOLbHg9jOw+RPzgws11adE2irne9zGtKXzstcIcTbNDWcqrsM937P3YlCbJcYcUTSm4UYSebXy/HbkNPVxNXl/YlfQAG7hV6A4pin6LL/UHCkmtKJp4xIzLuL77O4lPntUDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com (2603:10a6:800:123::21)
 by DBAPR04MB7256.eurprd04.prod.outlook.com (2603:10a6:10:1a3::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Thu, 12 Dec
 2024 07:46:10 +0000
Received: from VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8]) by VI1PR04MB7055.eurprd04.prod.outlook.com
 ([fe80::d6ab:1538:d868:bf8%7]) with mapi id 15.20.8251.008; Thu, 12 Dec 2024
 07:46:10 +0000
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 5/6] ASoC: fsl_asrc: register m2m platform device
Date: Thu, 12 Dec 2024 15:45:08 +0800
Message-Id: <20241212074509.3445859-6-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
References: <20241212074509.3445859-1-shengjiu.wang@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To VI1PR04MB7055.eurprd04.prod.outlook.com
 (2603:10a6:800:123::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7055:EE_|DBAPR04MB7256:EE_
X-MS-Office365-Filtering-Correlation-Id: 28411037-96e5-4dc7-a835-08dd1a810b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|7416014|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9XJuRy/qZT65gTJTYf8nALwdM5/SS5kthR1MZyuanGnqvhRSqh8ZkZdngkfz?=
 =?us-ascii?Q?tAVEPcRvqdv9xiZpO+gojRclV7W3n0b/pJikJN2tk4s2C5LzRwTD3EdtWWpc?=
 =?us-ascii?Q?YPg6nIBNtklitQiqvayRrVO0Co9JxBXR7g6H4cF4TPEHIBNqxxtZuxeGd8f9?=
 =?us-ascii?Q?nsB2EMxih+nA7X3D4lszztnmStM2LNwas1I5SP47bXEZiTqlxF5xP2ZZtgk1?=
 =?us-ascii?Q?Zm9p6wmjngu7ZqpIO9z8QsETuuvCHBg9+jpfBD1NvEYCRDmSzzqJAa80jZb0?=
 =?us-ascii?Q?n4uZ1Nee4PmsVYIPbKpIV8mvgF6ji+2SxfczB2ktLMcq8Gz4MNsYE6mw4zht?=
 =?us-ascii?Q?seE90bdVtQd4v10JvHz5EGkNM0O9Z6e3A404NpsrlVG8KG30whyPwSNfuusQ?=
 =?us-ascii?Q?TnzfZxBop8ABWvnNp+VLiXcbqEaiQ7oAfmF6CPZJQsNtF1vg7MFQH2Aaxwns?=
 =?us-ascii?Q?A8ILyYNDR0hhxG9ZPU9i/zHN94y8GHF6UwXXmReP6tYP+/Q9c7K7VCSojvBp?=
 =?us-ascii?Q?Ilc4dizqSjpQHbC5J5HfYLTCz7eb72sgypM+DMA5JmxHplFr+GPuXnih2pWJ?=
 =?us-ascii?Q?VHlK0SvQquIl4WPfZYi+KwhF9t/2GsP5TMiAzjwaOpk39OEIdS75Sd3d7HIR?=
 =?us-ascii?Q?hwbFCTFL58rI/a04GCBGv12pwBj/qxWYdbZOeUi6atLc5g8DgpRt+dmzqc8g?=
 =?us-ascii?Q?24dbPUmLtLx34kzGGa68dK2u+Ge6SJSuy6+jCAXwocXGrUKt4tMHEk90ddC3?=
 =?us-ascii?Q?BlLLVtGMnKgoPnzvfHtVLsJHfMGbAZzMBzf4/FiQGfbiAL9/s9BnNc+9z2OX?=
 =?us-ascii?Q?RCAnhNdWsmkU5bu5wXMJ7q92GoWOgoSQdBJaMWR1iLtp6UV/QcOC42h8zlln?=
 =?us-ascii?Q?/lTWG2QfO60l4K0sHic6NoI0RgjFXD6yIi9rIazUBxyVHAgKnA4F8t+OHb8L?=
 =?us-ascii?Q?zlqcEfSHUvtq1VJMu7g2IgicnbuKOmmQmj7V/lE3GXi6iSxIUWHQC3RHfkFT?=
 =?us-ascii?Q?YGhomdyk5bXgNuMh8hPs1PgCcyOPma66TB5DcyCaWdZaQh1ZZ7G+Mx1hzfyh?=
 =?us-ascii?Q?ZaKHnsiOQZZMRDyXN4xTA8oXUxfwywKhurJu9xT8jIiRtMV1TsphJmq+5Njd?=
 =?us-ascii?Q?LGfIdXks5IZzoyDFbEAAVeM/w6s7Dyv+LTGIg1d8ShDZIfIdnx55xS+c/PAb?=
 =?us-ascii?Q?9idjLbsmEy3A2YhBHMjs90MgNXKI7jp4sZKXtGJ3J27MHqtF79PSy9V63X1B?=
 =?us-ascii?Q?lVk3qHe67s5wVw1iaJ6jpGFqUr34A9qFv2fK2MbwR+BoXZ2n5PUsEU5gpKy9?=
 =?us-ascii?Q?7Kg9SzRckslCoq8RPbApg2o9vg7Cz5AmGneijCAaPn8gCfJ09zd8s/e/msGb?=
 =?us-ascii?Q?a/u5euG64AemCf7ia3CEknyXOo5FiLSA1Jshl6yHibxyJx6OraCCo2vvgs2M?=
 =?us-ascii?Q?1JpRlVnkgcc=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(7416014)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VZs3A0tr8O+3F/y4jH6YbeNRJQWEhs5GXyVE5dd9ZbC7dJLCB0a57HsAC+9p?=
 =?us-ascii?Q?3G9umZtAgWpUE17g/i9sETgdI0ZP7ht+fYHYwnMam+v9EtTjkrJN2o6mW5Xs?=
 =?us-ascii?Q?EU+7kq5/6/x6UKNXIw8aqp2DFsAQU+DdsM2QjI/rXud0y62hRx7xay4iIWng?=
 =?us-ascii?Q?jUahaTvr8AxORbmUy4g+K3s0yI/sCchNIwYhTK50A6id99wLXfM09KDOXuZL?=
 =?us-ascii?Q?/CRokYp7gsKwu0uNWdMl8UMDuTcbrcWV/fvTgKbVA4e6FEv3B0ekEBgESzd4?=
 =?us-ascii?Q?IJP0z+5d1DoyyWBr/H8LqdW417ZuA3EPF3roeazSuuVQIqnUU/fqKb552jHY?=
 =?us-ascii?Q?+FLqll5PAekMdhJ9tQIsUhW2t7wMLN/cTAf1QXYXTuabfajYtXS9pyRdmBav?=
 =?us-ascii?Q?9MFni8k126e3KLi/O1Wqei5MFdzY+A8ftig1TfoUQJ8h0FTEaymrDeH3qxn0?=
 =?us-ascii?Q?RFQtKKXSGwdLvJ4fobpm9q5lK+JNi9VvVzRLr/BQZII/wYMlc5rQmQSd6xA+?=
 =?us-ascii?Q?ON7sA+vJXYF2Crbwv5WLMoOyxMDRolxF4JNqIRdy40LEoUahfX66hzaTvUsQ?=
 =?us-ascii?Q?TOh9z1DCjIBEbqUEjkevD1BgHR7lA9CzEIhnnH+xr5agYXWGfRYIKpKpgdYK?=
 =?us-ascii?Q?GR6YwUHw6p94MuQSnnMekEaoS04rzoDSpnrnGS2aqXQiLe24QZTEUwk0Aj/m?=
 =?us-ascii?Q?gJ4dOsRmThEtydiQ1imBbkXb9YbQzg6/7u8SvHMfXBKOVibRzf5Bx4cH1wkp?=
 =?us-ascii?Q?2cExHXh2lFdrk1XxHHAa7b3eQ37dNeG7wz1RY2Mee3vrbQstj7UsMmYR5IFR?=
 =?us-ascii?Q?9M4HrUzDpR1z8b7OALcWeasavtgMwntt+m2MMVYTbVidnEOScd5ysFAn2odS?=
 =?us-ascii?Q?O4s0E11v0tsMGzb6DAxaQJFNW01j9o17gIJx7kl9g4wYVkf4zY3pIbnrOcYN?=
 =?us-ascii?Q?fu3XR+SXxM0JbFa7mefwjEB+511vvx3uBEG8/DCUbvAC4ylxCEh1Mj+Eb4f/?=
 =?us-ascii?Q?OmLg9xRuC9P1h35AUNzYYaz/a+Q2lIMOCxMZaKMNyuS4ODWtgS3rREHOxVx1?=
 =?us-ascii?Q?/6ioYB3MunOVDvXciKsaljgOQVwoFUpNxwyeEn0KcFQqpguXvd1qqCzWhIvk?=
 =?us-ascii?Q?dMbjhehkC40+y7lbYB9rZGaZP3cf2oZjLdGMXDVFyBA8VIM2PtSgVxhZl95i?=
 =?us-ascii?Q?/BqhSJhB4FcBfaJAV4OUC/OAq799jNLIgEPIHvNweUc9FNPDiyw9rc++LyFQ?=
 =?us-ascii?Q?+EPosQ109rXQgzgeMkShiEP2hTRn+l7Lc/ECMl3wx+tynKR7HgZi4jc7blXo?=
 =?us-ascii?Q?uHuuoepOdcXTzPTGssrX+K9e0dwM23nImo+0qxN8Te3+z484iDQaYBMvQw+w?=
 =?us-ascii?Q?3mQzytTL6sVbjs6XYok/l12OnW3Vqo32gaQBMhhD0Up1Zf/XLpWG35z/d5Fc?=
 =?us-ascii?Q?9LR9j42zlDGSAr6gYzAuCD8fE+lrN1qlKQE8m1FN4YYO63tOyqiyZRDfqy6U?=
 =?us-ascii?Q?P2IS+8m9PY8fzCSrwQZJp6TeZPYI8TaQJeaimea5jZKOXbDwP/SDVsex4/tE?=
 =?us-ascii?Q?zJbfPv83vbaMTZrMs0yWDRvoY+0MW6vWlLQKiwma?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 28411037-96e5-4dc7-a835-08dd1a810b81
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 07:46:10.6388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 8Bmv76gR9GlLxTObvpkEZPYk5d1SMupLITTrErB5nNBwz2YMfSj4kOh9xpKHsaWNkfk/23Bm/e260kSE2dz3Dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7256
Message-ID-Hash: SM5JIHJCEMEVME3KM6W6GSXW2AXZRWG6
X-Message-ID-Hash: SM5JIHJCEMEVME3KM6W6GSXW2AXZRWG6
X-MailFrom: shengjiu.wang@nxp.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SM5JIHJCEMEVME3KM6W6GSXW2AXZRWG6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Register m2m platform device, that user can
use M2M feature.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Acked-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/soc/fsl/fsl_asrc.c | 37 +++++++++++++++++++++++++++++++++----
 1 file changed, 33 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 471753276209..677529916dc0 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1384,6 +1384,12 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		goto err_pm_get_sync;
 	}
 
+	ret = fsl_asrc_m2m_init(asrc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to init m2m device %d\n", ret);
+		return ret;
+	}
+
 	return 0;
 
 err_pm_get_sync:
@@ -1396,6 +1402,10 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 static void fsl_asrc_remove(struct platform_device *pdev)
 {
+	struct fsl_asrc *asrc = dev_get_drvdata(&pdev->dev);
+
+	fsl_asrc_m2m_exit(asrc);
+
 	pm_runtime_disable(&pdev->dev);
 	if (!pm_runtime_status_suspended(&pdev->dev))
 		fsl_asrc_runtime_suspend(&pdev->dev);
@@ -1497,10 +1507,29 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
+static int fsl_asrc_suspend(struct device *dev)
+{
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
+	int ret;
+
+	fsl_asrc_m2m_suspend(asrc);
+	ret = pm_runtime_force_suspend(dev);
+	return ret;
+}
+
+static int fsl_asrc_resume(struct device *dev)
+{
+	struct fsl_asrc *asrc = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	fsl_asrc_m2m_resume(asrc);
+	return ret;
+}
+
 static const struct dev_pm_ops fsl_asrc_pm = {
-	SET_RUNTIME_PM_OPS(fsl_asrc_runtime_suspend, fsl_asrc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
-				pm_runtime_force_resume)
+	RUNTIME_PM_OPS(fsl_asrc_runtime_suspend, fsl_asrc_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(fsl_asrc_suspend, fsl_asrc_resume)
 };
 
 static const struct fsl_asrc_soc_data fsl_asrc_imx35_data = {
@@ -1538,7 +1567,7 @@ static struct platform_driver fsl_asrc_driver = {
 	.driver = {
 		.name = "fsl-asrc",
 		.of_match_table = fsl_asrc_ids,
-		.pm = &fsl_asrc_pm,
+		.pm = pm_ptr(&fsl_asrc_pm),
 	},
 };
 module_platform_driver(fsl_asrc_driver);
-- 
2.34.1

