Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE2576C4D8
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Aug 2023 07:26:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DB6266C0;
	Wed,  2 Aug 2023 07:25:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DB6266C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690953971;
	bh=Xgz8iQ37X6loQ+qbKEDfoww147k6tgiLGAXRBijT56g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fk//mYozyANR9i5SlOxFVYWWrId12ftG4LHMXdqbSWerFmK7JhjvtgM/z9CvieCVJ
	 qPNKGSSWKWNl3SN1qQOit8/ojz4AadlSaYDitiEZYgJ7XFIk4evdDTPDtVHIq7Nqun
	 SMzChB7pi/mjquHCyCgyMqkpiE8krbh846AeFZws=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4FFB2F8055B; Wed,  2 Aug 2023 07:24:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3A5D6F80535;
	Wed,  2 Aug 2023 07:24:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 237C1F8025A; Wed,  2 Aug 2023 07:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,SPF_HELO_PASS,
	T_SCC_BODY_TEXT_LINE,T_SPF_PERMERROR,URIBL_BLOCKED shortcircuit=no
	autolearn=no autolearn_force=no version=3.4.6
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0625.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0c::625])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C4964F801D5
	for <alsa-devel@alsa-project.org>; Wed,  2 Aug 2023 07:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4964F801D5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=Y57MDaCg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZEvkEfeIrqRRMf+lgmufyU7MSKy/tZCVhZ9gKHLA8whycFZPQEItHJ4QXDUwxNHTf6n4eyf79K2bx14OyY1CkY4wWoLYhEcQp68qfPZwOAJVGQqv/04SXkcHnjMIqSqc6SuJfmWYDYaK6eZ56MJS7ovd5UbNhZVv2zq2hgTdPxYDfY0YngPD+KK6a86nYlGSb5hzx1HYP3fzpkM77+/RA144b9hVVK2rKSJugWVK+mcjnguZeVZvQG8yHdbK6g/DshAsFdVHWrYFwyidtD9FW7fd7STBhxypEWFJKAplbRZaE/T3vl3R6UuUWIJdkYb9za5YB5HnSvCk7MOOOCmCAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r4U6lL6p6mHOsHiIMI+EcJ7LZ8ZvA3idq1lCknkhapU=;
 b=PZEMEB8cMCsA3rAxN3M/GVnUQ+QOH9NOUIVs07zH7OTwRW0fQ4vhLdrxLOc6h3j71meWsTNcqL057OO+1aQMsZAYPK78O8uqM/IHHB7G0dYPPl46hf12iSGo65sIX4JUR7C2bUz+wUOJgJ/c2Uuvci1j8lBuS4zKUvy5MfQcW5oErwMoxTgB0Xq10JnGuQY+VheqNOoNby7zmYqbAtet4fUsNGuWH5Zuz19K1kOFLfGPVD8FUaNGOLf5dKMjTuDqo2izYYFXqLMWCnkV4vwcI1RqPcZRJrlHUBglhcItbyWeIb37GzQ0wrZo4e6aoZyOlWa9TC5HOsWA8aUqNhpo4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r4U6lL6p6mHOsHiIMI+EcJ7LZ8ZvA3idq1lCknkhapU=;
 b=Y57MDaCg1vBHM/h8p04xsIUASlFp6aPZ5UJe0JQe+VqG2TmHdFYLS7hKyn7Eh6PQGE6OSXv7jco7frbhgUKSnUHtaWQWA4A8847hMcbURNQkeM98B9YPXrIiW2dtO2hq2ZuZQrXz32i/Oo1/EFknd6Z2/A5AIl5AGOe2ukNo3f0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by VI1PR04MB7088.eurprd04.prod.outlook.com (2603:10a6:800:11d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 05:22:01 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::cda8:5cad:29b6:3c96%7]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 05:22:01 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Chancel Liu <chancel.liu@nxp.com>
Subject: [PATCH v2 3/3] ASoC: fsl_micfil: Use SET_SYSTEM_SLEEP_PM_OPS to
 simplify PM
Date: Wed,  2 Aug 2023 13:21:17 +0800
Message-Id: <20230802052117.1293029-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230802052117.1293029-1-chancel.liu@nxp.com>
References: <20230802052117.1293029-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0025.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::13) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|VI1PR04MB7088:EE_
X-MS-Office365-Filtering-Correlation-Id: 20627bc7-f872-4072-12d2-08db93186644
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	YL1iJsc2BgP0oMWU7Z3qITSPaMo7tofEbRSHjqF8doJiDXemK/bEQip0ZnMVGkto/6l19A8j55KzGdE5uRyW02h9ug/xMmYbcsWjjdE3RxgAOJ6k7I8z1Cj4egbkOoIQhe49g4IfRhF+x+GMI63kyYP8Z0ju32YWYFZXHsPwC4yLbHk+usiwC9nsltYfG1flsziX6knaj2ZpKsInott88BoCEk1/mpQDI7z4pOrjxDjfCIbDLV7C/iOhvEki7Ci015N8DIhJxnIe7NenB0AH50Hdr1z6mUT1EwarDrrMoaSqKpzmuiUQqEShDla5hxCP1sqZI2IvEqultlsirSZevUt325Z+mVFZNBk8bcimLvzTFIb/i06ofZynCGHxOzocr+21hH4QKFp1fPl24q69B02ijcfgxhjLBO4uP1bfla6aXKm29zxG1+xm/ZacfnyeE0q1+AokrOhpINhSCBxR4+YCd7lwLNssy8fNV502/V6/BL7IqhAJcRWx3+PgdaKWzvZqcWhZBKN5SuWb4ZHAivbNuBUwrSpmhW9kXsgbZKPQQL0biQqD93sUq3xtzQY6Db6ro+dIS0S4gSHhJs95DK77o+EpuWckGd1Sbi6FFCThiy7k0fmr1tcV+PRBoE1YDjRWTuSOB806Qro0rXVsZQ==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(39860400002)(376002)(366004)(451199021)(44832011)(66556008)(66476007)(4326008)(66946007)(2906002)(38100700002)(38350700002)(2616005)(921005)(186003)(6506007)(1076003)(26005)(7416002)(83380400001)(86362001)(36756003)(478600001)(6512007)(52116002)(6666004)(6486002)(41300700001)(8936002)(8676002)(5660300002)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sOqNbeX/swah2+xJGtdBhdsLJgO6JEaj3qLGSWG0EKsYaU2U6ZxYvoFI1K7S?=
 =?us-ascii?Q?4DB2zhQhzvr32tjBRV9j38D7910dkMmEsxiFBSdoXtWi8y1Y/oi/SlYwlNKn?=
 =?us-ascii?Q?33cHEVeXeo4lU93EJNEFqTRk11P+5fs70c/ijgwrVcLBHlLGmlDqgayLpbsl?=
 =?us-ascii?Q?w+3wTUF1EG8oIApOlpXeVSlp1dwBd2o1pHQs5ntJ1yCW8r7YbxEyT45VB1eg?=
 =?us-ascii?Q?/JTe9fZiy5g+lCyPNG12LqnKL2xgplJkUR7RZ5wnS3o20lG0760xuwqZEPOA?=
 =?us-ascii?Q?OheoJya2Rn99tldNtCupiSoiisBYPv/60wg3CRQjWDOLsXfE8E/xqIlUOMVx?=
 =?us-ascii?Q?JWec5M8l6KBg1BlEUkXuAOXUwdC1afsjEor5GdotE/00W5BP6lktcnZZYe21?=
 =?us-ascii?Q?IQAP2bYU3utY1lBOsEevejHlbi//WADv7/PpJbn5kGxHhI+PfPrFGkHwYPbp?=
 =?us-ascii?Q?/itGn5AfX3rHJeC051CQ1rAZYH+Yfsyrq7VOsMshDEOVlYfYEpNnDQkZsfO4?=
 =?us-ascii?Q?XgX8pAdIJ+rZZtoNmC/cKPsOZ2TkKpR9zVsf9ZDiBZlh5hEsp6oQZrOsIU65?=
 =?us-ascii?Q?VJ+CHVu4FEYcJRHAmYdxI6EDOmzDFJLWWCJx7CuLI83iLOwFLnbp7bEuIPOA?=
 =?us-ascii?Q?x2g3iY5Z7Px+8e/jDc38p96YB28AQjZtzzHRqMb+fRkKvJgGnby348M/7vZu?=
 =?us-ascii?Q?+G3xGY2KBRJ1eUpUp+ILeSDQKhjwdjQXzoDhGttVR1pe5xF85N1cWaj+pn9E?=
 =?us-ascii?Q?ZqgDXCIZHe98Uds3/kvjH6KeigZqa//qlWrg9fW1eItZz8CjaYTSI8wbDBpz?=
 =?us-ascii?Q?+XHQDVexl2gzeexvdeh8T8OkRd6sCx+rH++mQn5/rpiNx/AHRTynp59xNRif?=
 =?us-ascii?Q?lqtYwAtFYUWHMLhk8xVIesk6yy645vu+y5CstAZSSKu0J4IQPJFaufsVaFfA?=
 =?us-ascii?Q?0Z3HLckpA+wDAMBP2ffACl0CZoZaoIS7gKM2q4YQRtr9NoQw7QQqq4yzTEaI?=
 =?us-ascii?Q?kXd+/kMuegWhpICqtN0gYkZkZ7+dDt/lrBktC9xTEfl6n7RM5MaL3HLO9LaP?=
 =?us-ascii?Q?7wrdRFZxadMtkldzWsJWqmuLNJVADdUyAAHbDQSNUugjBpXIIjD0QYk0zZhM?=
 =?us-ascii?Q?Zvj2xHMDLVwbGqo96vbJJfDEl1dRu2cg/yodW81puSl1Af319Gb247oHzGwt?=
 =?us-ascii?Q?E+MvI6PnGxoRyqKn6CYaWEJmwrwiQ9o/eRd7RrMl+GrfNWvdXxcI3tzFnlxu?=
 =?us-ascii?Q?4wOetBZUnA6ZmymQT3Ig+CjZ5kueKyaRBgA+YWC8E+vf7uWA+FcrnDfoaLHx?=
 =?us-ascii?Q?Lpul9CcdyrhHYy5b1hfbGVQiKcu2H6cZrOyMI4l9eLACK7VGCswpGa1wgRul?=
 =?us-ascii?Q?6D0cLBHIjrIsZrBI3q0LDVlT0zUsFvFMlpkt2V6Ps2tVBx1LlozW2tqsG+sQ?=
 =?us-ascii?Q?ww825HLEzkBt/YoNuXdvcE0VmCR/TtnETk1zbxvEvWQJdl3g1leJjuRBt53L?=
 =?us-ascii?Q?TefWFhirszlNUJNZFiBbHCyqDhzd8g24IMfohYKigy7ZnNK2q5DLodlcN3We?=
 =?us-ascii?Q?8UkgqCshrJEFzYhpVbugFjYO0AHYg2gsAQmU4z5c?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 20627bc7-f872-4072-12d2-08db93186644
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 05:22:01.0539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 aUSg2lPFPQglB9EeB48XhoPfhIUhgb+cPz891NGEZesR7hhezNiYuo6AhpQrewUAZ0YUNtCJIAYOYrusEESgTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7088
Message-ID-Hash: OR5CCW3YIZCXBN6WMKXANEHVG6JSTXD4
X-Message-ID-Hash: OR5CCW3YIZCXBN6WMKXANEHVG6JSTXD4
X-MailFrom: chancel.liu@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OR5CCW3YIZCXBN6WMKXANEHVG6JSTXD4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use SET_SYSTEM_SLEEP_PM_OPS to simplify suspend and resume function.
fsl_micfil_suspend() and fsl_micfil_resume() can be deleted.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index c4ff8ea49390..d6a5527ee7f6 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -1297,26 +1297,12 @@ static int fsl_micfil_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused fsl_micfil_suspend(struct device *dev)
-{
-	pm_runtime_force_suspend(dev);
-
-	return 0;
-}
-
-static int __maybe_unused fsl_micfil_resume(struct device *dev)
-{
-	pm_runtime_force_resume(dev);
-
-	return 0;
-}
-
 static const struct dev_pm_ops fsl_micfil_pm_ops = {
 	SET_RUNTIME_PM_OPS(fsl_micfil_runtime_suspend,
 			   fsl_micfil_runtime_resume,
 			   NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(fsl_micfil_suspend,
-				fsl_micfil_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver fsl_micfil_driver = {
-- 
2.25.1

