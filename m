Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC714754C7
	for <lists+alsa-devel@lfdr.de>; Wed, 15 Dec 2021 09:58:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEF1C177C;
	Wed, 15 Dec 2021 09:57:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEF1C177C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1639558727;
	bh=JU/NN8A8vJCaggGGj1CvAqiT+QlASM48cA3uCNHioHI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mFvzyVxNVJh2AZNBxbR+9P1LkqekRy3nMR0Tw1uClLz0xxrUTQdr4NfoeFfeDnLEw
	 OfxtnLgr+0dYjDh1I6k+mrjLd/Xa+8mttS3BR+F5k7E9VhoQIyu7uoHIH05xXL+5j6
	 IQA5N/nUH7ndczTARUMr0jZJhZQ4XHHsRVoK1EwI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E66BBF8025F;
	Wed, 15 Dec 2021 09:57:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C51EF8025D; Wed, 15 Dec 2021 09:57:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr50041.outbound.protection.outlook.com [40.107.5.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A7C6CF800FE
 for <alsa-devel@alsa-project.org>; Wed, 15 Dec 2021 09:57:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A7C6CF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="lauCTnxs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d7HJwITIth3NUJgVjg29hEqx0EO5VojaE7leZHlaDp6ZsDlBpicwTsOO1tFqdzWGq3Savk6kHU3ec6/IsVVFaQNFx6EKeUf8IzBeeHIZi0ho1rT0tr/9FkoK7/BaMT4Wht9s45geIsNKDKARRCoEW/p4SWAgJq2Sxc9pWnTveGCicrW86DnIyWRuLcMFWY1Oktin9HL7U4NiBH8ZTNJ0dqEBHwFMRS5ufeQNEk7j6GAlWABEgrxaRryf4W5+0JdBTJ+Vu2kCHcjhhAcKnGAWjL6jP/Kq1u6kPgq0Cbbq4dQGlViWJPGjrO8F8MzskyUQM2gIH6yCACMqG7YPtjiWbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8dV6AYZvirlSmt3DpNuAyBPxJhwAnqFHtSp4li5l94=;
 b=dHmPk6mLBC8lrVgHuC70kCnN4Cs89lLuNmK3Ct3Am9eS1LrXjYjzLye+mMyvKiaRSjVJ2xETRreAr2Yh9FGHCyt8onZT34d9YdI++vL9gxq3iE63/MmKS3kmG/tmptRoDLBBVVg5soyLjw+bZ8HPQUUuBnXozw4f/9qT5n9Gf2/p+N6oeUfMPtvy9dev0fnpsb+V2Z7TRFOI/5/X7XeZHdnU/+RYbQmoKiWyvky6UwvvdfekdgBWO0HxqJ+DUXVzOpj27KOp4yGIukAeRnA7mgvbISHE7zlhjIwPB/ycPCOVcDVJKHxRya8eKIMIhE+2ODPm5r19xSlZEPRjlFgbUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8dV6AYZvirlSmt3DpNuAyBPxJhwAnqFHtSp4li5l94=;
 b=lauCTnxsCGBqV/1D3KmI2I2sC0eUt4whNdjFHDepA9DOCxapBdQtfceDFD3JJjvsyvkx975IliEYXft9ElYKLIpfSpocTfM5tnbLTILwD9RTbWT940jX++XBi9Yr6gytcXBUEplL4T/eWRFYHg5P6Ec/RtZT4vAMvzTEQ2HsCGU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB3246.eurprd04.prod.outlook.com (2603:10a6:802:a::33) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Wed, 15 Dec
 2021 08:57:29 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::3de6:806c:e71:2a2f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::3de6:806c:e71:2a2f%5]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 08:57:29 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH] ASoC: SOF: OF: Avoid reverse module dependency
Date: Wed, 15 Dec 2021 10:57:03 +0200
Message-Id: <20211215085703.137414-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR06CA0153.eurprd06.prod.outlook.com
 (2603:10a6:803:a0::46) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9058ed2f-a1d0-462e-6f74-08d9bfa8ec5b
X-MS-TrafficTypeDiagnostic: VI1PR04MB3246:EE_
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB3246311F170C22C397003479B8769@VI1PR04MB3246.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:849;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +IdGZECZp/Qfe35fKuNOgO8i5N9wG4ZYkgYStTkKETnhEDxuEkdMeY1o5Hz8iqykTzNVHG3NND2U3biF2rsB4vD4qW6ahe6cGK4H5MPjVbCNIRTliUwRF3cUFQtxs7lY4jGtQEGOOe1WVRIBKESJ56CgBOtCvPd6gqXI5akMOcOkXv87cmaN7UxWTZ1pANz49DA9LBs1GvRpQE8BDUEgtJOy7CcGsDLCTxN9PaYEkT7aJ2SvTnG51ebCSTn/Io6fhPT1+LNCo6izAzcvaIMITqW9cEoRk3U9BjzX5orX6Cyctb7e3z4+prl4s95RphbR/IycfNSuiYJvxxU9Z4iI6HrN2RfnwjjsYHy1CHvuqFCj35EQOpInpbr492rdSN88N9ZDrff2IYe7Ej2u6To12l+apqMIl3S0IA3nOuLYQgABxt+qcPTic7C/Zjq5GNCnTf0tNSKI2E3spU82EwqlgZr+ml+HdgYl2fLlqvbmNiM6IBBzAvPy5TuRzAxd5IEIWbQta/B74g14FrcHaY11+0033cuIuNEk+GBDav3k4qa5l8N2opHdtYSbYXpW8YjaH40NHEKGumy4T13rKBaf0vNnTMSS+8+hcZvYApCuBHlaTtkRdjuYato7feTTyEW/BcR7auFDEimvpEZRzvR6kg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66556008)(6916009)(186003)(2906002)(30864003)(66574015)(6506007)(4326008)(8936002)(83380400001)(44832011)(8676002)(2616005)(6486002)(6666004)(508600001)(66946007)(86362001)(66476007)(52116002)(6512007)(1076003)(7416002)(5660300002)(316002)(54906003)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU9oSTFINU0yT1FKWU1qbXRHVU81ZE42c3VZMm9OWWV6ajNNblo3eEsyWU9n?=
 =?utf-8?B?Q09Ka3pYV3dSbWdFZk9wRGcvVkRmakhaN0lXUkF1TSt2Mm9aZUEyQ3o5a2Fu?=
 =?utf-8?B?Tk13Y0Rkc1REM3dBRk5kUW5heE9tQmhJT29FVUR5c3RTMTBnVTl2TFNQbUNS?=
 =?utf-8?B?R2N0b25OQWVRbkFLdUhpREtoeTRtaXJiQjdzR0xZMVZYMzhkN0VDOEJsVW9i?=
 =?utf-8?B?Wk14WE16OTR5YlFnMlNsUHRZdXhrZXFIOCtHeUo4aDl2Nk9POGlEa01FVUdF?=
 =?utf-8?B?a0QzTmVKSys5UjVMV29yeHVQajY3eXJXd3R1blgyaTVua3RySnNZSk5oaXpj?=
 =?utf-8?B?UUthN0cvQnZmYk1ENWRuYWI5L29QRFFqWklSb3J3K3UvbHFBUjRseUFyZkJT?=
 =?utf-8?B?c3VzWGpMTVRxVks5L1ZqY2w2dUxlMmxRK0JjdUdURmRBazcvaldBUXR0SVMx?=
 =?utf-8?B?a20vSVdDTjgwNU9teHBhVWt2S3dyWE9CZXFTcW5vdjFNRVFHNE1rZGFHdFBa?=
 =?utf-8?B?S2pZUnJaV3BmazB0ZCswOHVnWTNGcE54bjNvMTFYZExEUTdwMUN2bzAxMStB?=
 =?utf-8?B?M0lGYVhhdVp0T3Fvb1VsN2MvV0hEc1dNZnA2SkxEK2hySGRUTUFLUDVGNjVz?=
 =?utf-8?B?VUgwOTJyWS9raVVGZjhIYmRpbGZjM29DUU5qNHFPUVZaUVJZNk9VRUllL2d0?=
 =?utf-8?B?eVVTVXNHTTF2N0djZTdiUjFnZ0lUWE9FVE05NWVGaXpPenV1S3A5RnNWZlc5?=
 =?utf-8?B?cGUxNFZkb0N4ZlU3MkoxUWxKbnNIQk9Qb3YwVnp3aEpCOEF3eVdXOHhQNk9i?=
 =?utf-8?B?ZUdKRlFGKzhpZnQxYmlnQXdUcE14MDVUNUZnS2lQSUhaa1l1K1RIR1Rnb0Ji?=
 =?utf-8?B?REdwMnJpUEJxYXl4VjlGdE56V2hoT0wrbTkrdGorZ3VGc0xCVVgxNzFDYVdO?=
 =?utf-8?B?UWpQbGoxZDN3WDFCeWlqKzFNd1NOTTVoZm5BNmxPZEhsM2ZYQVd2VGxXYmVi?=
 =?utf-8?B?MkZlcDN6SXYwZktsQ2VOeGVHanU4THJlbjErbVo0dllrVGphWjJDTWhMT3VK?=
 =?utf-8?B?dzVYK0NUeE54b3lvSFVHOVZHdXNRVmNkKy9pdEc1OGdLVmtDc0NtcTIzS2JP?=
 =?utf-8?B?d2JCUmhGUEhNd2ZtQ0pXSS9VUzIrUmpPUzFrZWFTVGFPMEc4SGVFUGVJWWpa?=
 =?utf-8?B?NzY4akU5RlRDTU1aQmk5bjdnTUpId1NxWlNHNEJRR2NWTVJMMW94dHBmRzFN?=
 =?utf-8?B?NUlWaml4cURjcjNSVkZFa2p6YjFLM3hPK2twaXc2b0QvR1RCT3ZZajRQaU9I?=
 =?utf-8?B?L3RzeXJBU3QwdmcvOXMvRzd3Q3p4TVE3RVloV1owNnAzTGV5TFZtSEVpSTJr?=
 =?utf-8?B?R3c3dDhKZEgxdXRPdzRpaU00cm0wUjFaeW9WeXl1bzhFWFhibHZ2YUh2NDJk?=
 =?utf-8?B?YjgwM3ZSL2tZVjZzWmZlK1FyUjN2NUZHQXRyOEVNYnhMSUJmUTRrYW1heGtk?=
 =?utf-8?B?UVh2MysvVGdFU0FZSW1ZcXVMVExaYkgyWkdLa1ZMQUpsVk1WSnFVRzY2YXFK?=
 =?utf-8?B?dGVGWTVFMTJEUXc5Qk9hd2VKc0pkMHo0YXlqS2UxV3VpRWZVektBRzhtYTBC?=
 =?utf-8?B?R0RMbXhneXZONmprRE1SN1FiNk10WkdPWE1uai95d2FxWXB5eEFlK0tDZk5R?=
 =?utf-8?B?TzltSXlncVBPeFM0S2lIMHZIQTcxYUFHbGt1TXVsOEw4SThhZUwzcmJoZmpi?=
 =?utf-8?B?TWZUbE95aUxtdFh6bS9wK1JmNDR6T01SZWduTUhZR1lqR0FaTmF0anh5RXli?=
 =?utf-8?B?NmVzM0hlbDNNNnRxdVZQVVdOQmk3ci8wM2VsbzJpN1lqZGFBSUdINTl0NDBK?=
 =?utf-8?B?QmZ4V3ZXeXlEVmlTdWE5NEUyVVRYWEQ1UitNVFlxeVVwcGczeHlPb0JBR0o0?=
 =?utf-8?B?RmpEQ2ZWMDFlanZhRFNpMUM1dmllT1BNYjFjeDY0dk1tL3VjRW5hREoxRDhU?=
 =?utf-8?B?MmxydUMrYlJHVEQ0cHhnenJnR0ticXpWUDk5Q3pSR2RobjZsMmZDZHJoL0tD?=
 =?utf-8?B?NFd6dUVKRmN3b2dXVkFuWVIybElaUlcyeVY4bzgvVm41TGVNMlFUbitVaHNV?=
 =?utf-8?B?SysyamZ1dVFLczBVV0tOTXM0T0xqbEw3S2MrT0dINzQrd2krVm9yOEZCamJL?=
 =?utf-8?B?bW01VlNHWlZtT3ZvcTNkQ25zY2NTbmxkOFRKb2dreU9qdFlPTWZ5aGs0SDQ2?=
 =?utf-8?Q?gKsbA2tySXUm1vHaAMQI/L/5BcjssmM3pN7sIqnZk0=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9058ed2f-a1d0-462e-6f74-08d9bfa8ec5b
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 08:57:29.4299 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QX6e+7+EEYKHEPDOjAxUac47M7pulKdWSkXZ1v2pSmk2N8990NhnJINzqY6OtpfTKzEWN1L1e6k/bNqCUSMizw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB3246
Cc: guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 Daniel Baluta <daniel.baluta@nxp.com>,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 alsa-devel@alsa-project.org, peter.ujfalusi@intel.com,
 ranjani.sridharan@linux.intel.com, linux-mediatek@lists.infradead.org,
 linux-imx@nxp.com, paul.olaru@oss.nxp.com,
 pierre-louis.bossart@linux.intel.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

Similar with commit 8a49cd11e68ed0 ("ASoC: SOF: ACPI: avoid reverse
module dependency") we will be having hardware specific drivers that
link against a common "helper" framework.

sof-of-dev.c becomes a library with the interface defined in the newly
created file sof-of-dev.h.

This is the final step started with Kconfig simplification in
commit 7548a391c53ca ("ASoC: SOF: i.MX: simplify Kconfig")

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx-ops.h            | 10 ----
 sound/soc/sof/imx/imx8.c               | 43 ++++++++++++--
 sound/soc/sof/imx/imx8m.c              | 31 ++++++++++-
 sound/soc/sof/mediatek/mediatek-ops.h  |  8 ---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 31 ++++++++++-
 sound/soc/sof/sof-of-dev.c             | 77 +++-----------------------
 sound/soc/sof/sof-of-dev.h             | 17 ++++++
 7 files changed, 118 insertions(+), 99 deletions(-)
 delete mode 100644 sound/soc/sof/imx/imx-ops.h
 delete mode 100644 sound/soc/sof/mediatek/mediatek-ops.h
 create mode 100644 sound/soc/sof/sof-of-dev.h

diff --git a/sound/soc/sof/imx/imx-ops.h b/sound/soc/sof/imx/imx-ops.h
deleted file mode 100644
index 24235ef8c8fa..000000000000
--- a/sound/soc/sof/imx/imx-ops.h
+++ /dev/null
@@ -1,10 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
-
-#ifndef __IMX_OPS_H__
-#define __IMX_OPS_H__
-
-extern struct snd_sof_dsp_ops sof_imx8_ops;
-extern struct snd_sof_dsp_ops sof_imx8x_ops;
-extern struct snd_sof_dsp_ops sof_imx8m_ops;
-
-#endif
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 00b2bb5fd6ae..099b4356122c 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -21,8 +21,8 @@
 #include <linux/firmware/imx/svc/misc.h>
 #include <dt-bindings/firmware/imx/rsrc.h>
 #include "../ops.h"
+#include "../sof-of-dev.h"
 #include "imx-common.h"
-#include "imx-ops.h"
 
 /* DSP memories */
 #define IRAM_OFFSET		0x10000
@@ -487,7 +487,7 @@ static int imx8_dsp_set_power_state(struct snd_sof_dev *sdev,
 }
 
 /* i.MX8 ops */
-struct snd_sof_dsp_ops sof_imx8_ops = {
+static const struct snd_sof_dsp_ops sof_imx8_ops = {
 	/* probe and remove */
 	.probe		= imx8_probe,
 	.remove		= imx8_remove,
@@ -548,10 +548,9 @@ struct snd_sof_dsp_ops sof_imx8_ops = {
 
 	.set_power_state	= imx8_dsp_set_power_state,
 };
-EXPORT_SYMBOL(sof_imx8_ops);
 
 /* i.MX8X ops */
-struct snd_sof_dsp_ops sof_imx8x_ops = {
+static const struct snd_sof_dsp_ops sof_imx8x_ops = {
 	/* probe and remove */
 	.probe		= imx8_probe,
 	.remove		= imx8_remove,
@@ -612,7 +611,41 @@ struct snd_sof_dsp_ops sof_imx8x_ops = {
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP
 };
-EXPORT_SYMBOL(sof_imx8x_ops);
+
+static struct sof_dev_desc sof_of_imx8qxp_desc = {
+	.default_fw_path = "imx/sof",
+	.default_tplg_path = "imx/sof-tplg",
+	.default_fw_filename = "sof-imx8x.ri",
+	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
+	.ops = &sof_imx8x_ops,
+};
+
+static struct sof_dev_desc sof_of_imx8qm_desc = {
+	.default_fw_path = "imx/sof",
+	.default_tplg_path = "imx/sof-tplg",
+	.default_fw_filename = "sof-imx8.ri",
+	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
+	.ops = &sof_imx8_ops,
+};
+
+static const struct of_device_id sof_of_imx8_ids[] = {
+	{ .compatible = "fsl,imx8qxp-dsp", .data = &sof_of_imx8qxp_desc},
+	{ .compatible = "fsl,imx8qm-dsp", .data = &sof_of_imx8qm_desc},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sof_of_imx8_ids);
+
+/* DT driver definition */
+static struct platform_driver snd_sof_of_imx8_driver = {
+	.probe = sof_of_probe,
+	.remove = sof_of_remove,
+	.driver = {
+		.name = "sof-audio-of-imx8",
+		.pm = &sof_of_pm,
+		.of_match_table = sof_of_imx8_ids,
+	},
+};
+module_platform_driver(snd_sof_of_imx8_driver);
 
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index b7df655c49c9..c026caea4c8b 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -20,8 +20,8 @@
 #include <linux/firmware/imx/dsp.h>
 
 #include "../ops.h"
+#include "../sof-of-dev.h"
 #include "imx-common.h"
-#include "imx-ops.h"
 
 #define MBOX_OFFSET	0x800000
 #define MBOX_SIZE	0x1000
@@ -411,7 +411,7 @@ static int imx8m_dsp_suspend(struct snd_sof_dev *sdev, unsigned int target_state
 }
 
 /* i.MX8 ops */
-struct snd_sof_dsp_ops sof_imx8m_ops = {
+static const struct snd_sof_dsp_ops sof_imx8m_ops = {
 	/* probe and remove */
 	.probe		= imx8m_probe,
 	.remove		= imx8m_remove,
@@ -470,7 +470,32 @@ struct snd_sof_dsp_ops sof_imx8m_ops = {
 		SNDRV_PCM_INFO_PAUSE |
 		SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
-EXPORT_SYMBOL(sof_imx8m_ops);
+
+static struct sof_dev_desc sof_of_imx8mp_desc = {
+	.default_fw_path = "imx/sof",
+	.default_tplg_path = "imx/sof-tplg",
+	.default_fw_filename = "sof-imx8m.ri",
+	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
+	.ops = &sof_imx8m_ops,
+};
+
+static const struct of_device_id sof_of_imx8m_ids[] = {
+	{ .compatible = "fsl,imx8mp-dsp", .data = &sof_of_imx8mp_desc},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sof_of_imx8m_ids);
+
+/* DT driver definition */
+static struct platform_driver snd_sof_of_imx8m_driver = {
+	.probe = sof_of_probe,
+	.remove = sof_of_remove,
+	.driver = {
+		.name = "sof-audio-of-imx8m",
+		.pm = &sof_of_pm,
+		.of_match_table = sof_of_imx8m_ids,
+	},
+};
+module_platform_driver(snd_sof_of_imx8m_driver);
 
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/mediatek/mediatek-ops.h b/sound/soc/sof/mediatek/mediatek-ops.h
deleted file mode 100644
index e0ffa69ecb0c..000000000000
--- a/sound/soc/sof/mediatek/mediatek-ops.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
-
-#ifndef __MEDIATEK_OPS_H__
-#define __MEDIATEK_OPS_H__
-
-extern const struct snd_sof_dsp_ops sof_mt8195_ops;
-
-#endif
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index c719ba470620..3ab12f352935 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -21,9 +21,9 @@
 #include <sound/sof.h>
 #include <sound/sof/xtensa.h>
 #include "../../ops.h"
+#include "../../sof-of-dev.h"
 #include "../../sof-audio.h"
 #include "../adsp_helper.h"
-#include "../mediatek-ops.h"
 #include "mt8195.h"
 #include "mt8195-clk.h"
 
@@ -388,7 +388,7 @@ static struct snd_soc_dai_driver mt8195_dai[] = {
 };
 
 /* mt8195 ops */
-const struct snd_sof_dsp_ops sof_mt8195_ops = {
+static const struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* probe and remove */
 	.probe		= mt8195_dsp_probe,
 	.remove		= mt8195_dsp_remove,
@@ -432,7 +432,32 @@ const struct snd_sof_dsp_ops sof_mt8195_ops = {
 			SNDRV_PCM_INFO_PAUSE |
 			SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
 };
-EXPORT_SYMBOL(sof_mt8195_ops);
+
+static const struct sof_dev_desc sof_of_mt8195_desc = {
+	.default_fw_path = "mediatek/sof",
+	.default_tplg_path = "mediatek/sof-tplg",
+	.default_fw_filename = "sof-mt8195.ri",
+	.nocodec_tplg_filename = "sof-mt8195-nocodec.tplg",
+	.ops = &sof_mt8195_ops,
+};
+
+static const struct of_device_id sof_of_mt8195_ids[] = {
+	{ .compatible = "mediatek,mt8195-dsp", .data = &sof_of_mt8195_desc},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, sof_of_mt8195_ids);
+
+/* DT driver definition */
+static struct platform_driver snd_sof_of_mt8195_driver = {
+	.probe = sof_of_probe,
+	.remove = sof_of_remove,
+	.driver = {
+	.name = "sof-audio-of-mt8195",
+		.pm = &sof_of_pm,
+		.of_match_table = sof_of_mt8195_ids,
+	},
+};
+module_platform_driver(snd_sof_of_mt8195_driver);
 
 MODULE_IMPORT_NS(SND_SOC_SOF_XTENSA);
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index b0089698eecb..e3718638f9ce 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -11,9 +11,8 @@
 #include <linux/pm_runtime.h>
 #include <sound/sof.h>
 
+#include "sof-of-dev.h"
 #include "ops.h"
-#include "imx/imx-ops.h"
-#include "mediatek/mediatek-ops.h"
 
 static char *fw_path;
 module_param(fw_path, charp, 0444);
@@ -23,51 +22,14 @@ static char *tplg_path;
 module_param(tplg_path, charp, 0444);
 MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
 
-/* platform specific devices */
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8)
-static struct sof_dev_desc sof_of_imx8qxp_desc = {
-	.default_fw_path = "imx/sof",
-	.default_tplg_path = "imx/sof-tplg",
-	.default_fw_filename = "sof-imx8x.ri",
-	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
-	.ops = &sof_imx8x_ops,
-};
-
-static struct sof_dev_desc sof_of_imx8qm_desc = {
-	.default_fw_path = "imx/sof",
-	.default_tplg_path = "imx/sof-tplg",
-	.default_fw_filename = "sof-imx8.ri",
-	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
-	.ops = &sof_imx8_ops,
-};
-#endif
-
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8M)
-static struct sof_dev_desc sof_of_imx8mp_desc = {
-	.default_fw_path = "imx/sof",
-	.default_tplg_path = "imx/sof-tplg",
-	.default_fw_filename = "sof-imx8m.ri",
-	.nocodec_tplg_filename = "sof-imx8-nocodec.tplg",
-	.ops = &sof_imx8m_ops,
-};
-#endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_MT8195)
-static const struct sof_dev_desc sof_of_mt8195_desc = {
-	.default_fw_path = "mediatek/sof",
-	.default_tplg_path = "mediatek/sof-tplg",
-	.default_fw_filename = "sof-mt8195.ri",
-	.nocodec_tplg_filename = "sof-mt8195-nocodec.tplg",
-	.ops = &sof_mt8195_ops,
-};
-#endif
-
-static const struct dev_pm_ops sof_of_pm = {
+const struct dev_pm_ops sof_of_pm = {
 	.prepare = snd_sof_prepare,
 	.complete = snd_sof_complete,
 	SET_SYSTEM_SLEEP_PM_OPS(snd_sof_suspend, snd_sof_resume)
 	SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
 			   NULL)
 };
+EXPORT_SYMBOL(sof_of_pm);
 
 static void sof_of_probe_complete(struct device *dev)
 {
@@ -79,7 +41,7 @@ static void sof_of_probe_complete(struct device *dev)
 	pm_runtime_enable(dev);
 }
 
-static int sof_of_probe(struct platform_device *pdev)
+int sof_of_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	const struct sof_dev_desc *desc;
@@ -120,8 +82,9 @@ static int sof_of_probe(struct platform_device *pdev)
 	/* call sof helper for DSP hardware probe */
 	return snd_sof_device_probe(dev, sof_pdata);
 }
+EXPORT_SYMBOL(sof_of_probe);
 
-static int sof_of_remove(struct platform_device *pdev)
+int sof_of_remove(struct platform_device *pdev)
 {
 	pm_runtime_disable(&pdev->dev);
 
@@ -130,32 +93,6 @@ static int sof_of_remove(struct platform_device *pdev)
 
 	return 0;
 }
-
-static const struct of_device_id sof_of_ids[] = {
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8)
-	{ .compatible = "fsl,imx8qxp-dsp", .data = &sof_of_imx8qxp_desc},
-	{ .compatible = "fsl,imx8qm-dsp", .data = &sof_of_imx8qm_desc},
-#endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8M)
-	{ .compatible = "fsl,imx8mp-dsp", .data = &sof_of_imx8mp_desc},
-#endif
-#if IS_ENABLED(CONFIG_SND_SOC_SOF_MT8195)
-	{ .compatible = "mediatek,mt8195-dsp", .data = &sof_of_mt8195_desc},
-#endif
-	{ }
-};
-MODULE_DEVICE_TABLE(of, sof_of_ids);
-
-/* DT driver definition */
-static struct platform_driver snd_sof_of_driver = {
-	.probe = sof_of_probe,
-	.remove = sof_of_remove,
-	.driver = {
-		.name = "sof-audio-of",
-		.pm = &sof_of_pm,
-		.of_match_table = sof_of_ids,
-	},
-};
-module_platform_driver(snd_sof_of_driver);
+EXPORT_SYMBOL(sof_of_remove);
 
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/sof-of-dev.h b/sound/soc/sof/sof-of-dev.h
new file mode 100644
index 000000000000..4e0f6588dad9
--- /dev/null
+++ b/sound/soc/sof/sof-of-dev.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license.  When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright 2021 NXP
+ */
+
+#ifndef __SOUND_SOC_SOF_OF_H
+#define __SOUND_SOC_SOF_OF_H
+
+extern const struct dev_pm_ops sof_of_pm;
+
+int sof_of_probe(struct platform_device *pdev);
+int sof_of_remove(struct platform_device *pdev);
+
+#endif
-- 
2.27.0

