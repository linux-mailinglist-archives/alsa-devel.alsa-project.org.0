Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F2D4414B1
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 09:04:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3428C16B8;
	Mon,  1 Nov 2021 09:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3428C16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635753850;
	bh=sYM+AQ2VI90tlRMyWDAGtQm/3ejy9/P9gDykux3i5Ys=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NUS0F0W1DIDQZZQ9oCwrdRrKfrZ/XWWb+B1QxH2mLOchbGn9C0AFHfy7Bw8Mjf477
	 IcOcnfXVg4uYZH5ZCiF+p/KEXEOj72V1S4eDkAnmQNGOAVPB5FIZ1P8V2Dbdjl7X/c
	 5iARIzP67t7SnKyHZ8cGXxudKkvMQxmMmi0gk+OI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9B44F80510;
	Mon,  1 Nov 2021 09:01:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C968BF8010A; Mon,  1 Nov 2021 09:01:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::61b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D6D9F80269
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 09:01:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D6D9F80269
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="UyUS4FDK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QT1qf1haEsgiGtUxS9M7WGmDBOF5fot4GivfYsCj4xu9Z4tOuca/uJfrEGVvVBe8Knc7C/R3UF9xeAlC/FoRo88KiVC0r550zhquBHfw4Q0eQDJqEePPSxp1cBStk4zv+ghCZhavOLzl9wMabyCSrC+DmclihN9WPGUerw+q4n9lip2YUPtxuXjvlxQCJqGqzxRgPvNc1C6sLeZTY67+eC/t3CIxU+mRIAuZgDtksL3f3HwlUUNMpoFowCx+XDky0a5WynFut2LQGi0agxRlDTmjJ5CG4S71/RLOIn6in3OCvetF4fbu3hPmq1Pn/M4joUINzESjEWER+h9+ErlAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1LywNPRrl9Cu1ZbF82MTzYSGrbHurHEZM0KMMfh3iM=;
 b=CHGdotp6UcLU1ksq5WcHcMyK19fjKuOzS5MnM4WRdfIvR0JcA9m7MIVYAdjHo72ayHeGxtAKl/mCXJqbnY4LDDtOHCzZaHgIxEpfYU/A8HPCLYokV2o+lqLLWH//ZdKWq0OIfhvyV+7SvIBLl/Tj1kppdwiX5uzfmZddqeqchAoyQqmNGOdOlMdjpHV/G2UxDjl4i8rzBS/91zLg+R5esGC2aqj3wjK4H1dmJxY5PkSG5o+1wvqcDXsfLmASusARcPvv4C/79qTfzqZlqdFkIEeWlgw+0RMO2UAzZyT5VTsaDtsPc+1UBHax8rWlqszcP6JA1p/TWq5Q/eiok1a/Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1LywNPRrl9Cu1ZbF82MTzYSGrbHurHEZM0KMMfh3iM=;
 b=UyUS4FDKPmGykZGEGfmsrcWMaOZl7/uywMzSYVqUZ5YPpQdE3heWMCWUXeTiX7m/LklBv5CZNjHc27YMjPGpoBQWZuAw4+zKLTk5UeHbQBfHhKMfYHA9hEnnetTeL8jI943VOO6Ebcp1VdvQr96K6W43vYHElM8BiBwVw6Xy/O4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2430.eurprd04.prod.outlook.com (2603:10a6:800:2b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 08:00:53 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 08:00:53 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 4/6] ASoC: SOF: mediatek: Add fw loader and mt8195 dsp ops to
 load firmware
Date: Mon,  1 Nov 2021 10:00:24 +0200
Message-Id: <20211101080026.297360-5-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
References: <20211101080026.297360-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM3PR07CA0070.eurprd07.prod.outlook.com
 (2603:10a6:207:4::28) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5719:1500:cdb2:376b:257c:429a)
 by AM3PR07CA0070.eurprd07.prod.outlook.com (2603:10a6:207:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.9 via Frontend
 Transport; Mon, 1 Nov 2021 08:00:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3df016d-f463-4392-e28f-08d99d0db9ed
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2430:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2430EEBBBB8AD62A8E6C8473B88A9@VI1PR0401MB2430.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1332;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r9ke5Ptk5URX2ffJhAbv3FyoXA1BrUNXyUe8tUuS/P6u1Bri1cVGMvjB1pedLfW62ZnPiCEpHIsT6qObRJ6qVyY9K87kUsA0/fZSwwBn5UBRjaEDkETgbSx3bV5Ql/KFuvBqA+TV7xiJTOb7tLoqd3lMT+8XYTWkqUbnckC7LcKrxGzGZnf2doHjoUnv9YjJj/gQ2JaCzXbIJEad2379zR1OXZHdj38cS7gB7iEnLrLeElCAw1y4u+eSDmPoB2vE6y7Ngbyq7TQYOz2q5HSNiMBlO8Fuv/i1HoF3XRqNpFM2YOofzbn4ibFGVpKk8ke+BEaq/J/W6K1cSSLJ8xmI9ecIZ59zT0FeAvtLuXBfb6/e24rU3mMWPRlyX4atVwfqFjKkF++aYdbsonA56jNTmbvU29U2n7j9jY5XFE7ZvrdJ6GY4Gzy4oly+M6Xxme4+k4bq5lJ0+pzikVp1JTczhDD5bieFX90SnV+iYPAuFnaJFsg7a2oYZDatFTH/zSRpgN3tb/sgX7rNCnieLJuClKeLY3YWa8NfZIqhWkrBUvCoHN7py6JagexboXJkJgL46+7e2TY2VcFpXgbyRKb+ftJwuyv/lcW0Imoo9uoLYVKDHXMGjjKlHZ45kf3LilH1KKvaQhqhlbcvzn42aBLa8w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8676002)(508600001)(54906003)(6486002)(8936002)(6506007)(1076003)(5660300002)(66574015)(83380400001)(52116002)(6666004)(44832011)(6512007)(66476007)(2906002)(7416002)(2616005)(66946007)(38100700002)(186003)(86362001)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LytLZkQ1RU1OTzg3MnJNbUF4WHRJNGpPakJROUNONzc4TWxpYU5DeE9OaTNS?=
 =?utf-8?B?aUU4Q21DQWZWcm44b1pBYmpaVkpvNzljYlFDTFFrV0lRVGsva1VhRHNIYSsz?=
 =?utf-8?B?WlFYc3A0QjcyMDFvbWRjQ1hrYUlJU1h0TGJIajRZZ0hZM04rS0RXRTNLZ0RF?=
 =?utf-8?B?MUdjYytXMS9BTUxuSlJpdjN1b0krVWUrWmhoelRlOG55NHo3aHltTUpkbHht?=
 =?utf-8?B?Mk16amEraSt1ai9xSlBWcm5yK0lVMnFOOGE5Z2NLaXpwbGRnZ0xyTmlXZ1ZH?=
 =?utf-8?B?SHRORUxCcFVGLy9mc2I2OTBmTlNDVlhjQS9FbmpoN0NsaXV3RTJ4YTd5eW1t?=
 =?utf-8?B?YmRhb1JpS0RNcUp5Q3FRWkYwTWR6b0JCaHdIQXA2dE1YZFFqNlRyVWVjb0pK?=
 =?utf-8?B?Q09XWkhIYnFlM2VIY3BSajZKc3JWdVFzeGNXa212RWw0Z3JoNncyZGNNTE9O?=
 =?utf-8?B?UDZ2TVE0WU9Dd3VOTGxMTFlwVnMxZDAySnp1OUVJUGdVZWdqS3VuQlFrYjFj?=
 =?utf-8?B?SitIN0VCb3d6QzdhVCs5ZTMxUTcwMmJiWHNQdTQ3Yk5pcHZrbktxSi9VTFBn?=
 =?utf-8?B?cG5DVlovZTFTOGlWaFJwbUtUSmpTUmFPR1hLczNBbDY2UDdvQlBDNWZZL3pk?=
 =?utf-8?B?M3FacDNGVWFQOW9qKzh5WTJSUGtNOWxubFFLaTErL3VyQS9hR1JBWGY5SGRI?=
 =?utf-8?B?YnpYc096ZnFpNVF4LzJNckhhNGRMQnVTT1lmVjMzaHFtb0JROGo4WjR2VXpa?=
 =?utf-8?B?RUxaUU85RVFHQ3JUcDcxZFZCTXJrYS9NOENMZUhlOHNZVlFaUzdaNUcvTGJz?=
 =?utf-8?B?THRVUFJiZU1vMElOWnVCeisvZndxdHBOd0lwbDdQcVZoUDA3NmZhMXhqVCtC?=
 =?utf-8?B?R2NwRkVrejZLL3M0OGhESnpjeGhiUEY4SllTVlFrV2RUN01aYjh2b3V4a0V1?=
 =?utf-8?B?U1lSd1J1TEsxUUtXdFBOdVJVSGhTcC94SUNEdU1VTzFhWnlPOHJEN3BkTmMx?=
 =?utf-8?B?MjdjdmtONDBTVFl1Y24yMlluaUpsN1FiSkNLVW1mMVZTeWErYmZwdXJzTUhq?=
 =?utf-8?B?Y3U2OFV1UmVTRWY0bTFRNUlRTnlMUEc3alg2SmVUR29uM1RoN2l6RE1yN3Fr?=
 =?utf-8?B?RkFmRisyRmlLUFJ1OTgrZkIvSUg2cXduc0xTMzdwWmN3cVJGWjNoQUswVCtF?=
 =?utf-8?B?Q3BIWmwxbEE4ckZnakxHQ25nTi9sWElGM21VWUhOUENqUys2K1E5WUdxRFBj?=
 =?utf-8?B?bWdtUGYxdmMxZFptbEEwZEtQT3hqMmRlUlRCOUxXT25IUG90OXVOb1VKRU95?=
 =?utf-8?B?WFFLcjB0OUVmd2JhYStrbE45aW1HWkY2RjVGc2dtYjdSckx0Zi9lclQvTk9l?=
 =?utf-8?B?Z3VScUtMK25zQVpMTVlhaStyR1RrRnRWUVd1NTBUL2pNaFdiSkVWVEE3Y0hw?=
 =?utf-8?B?OEM5RTNvbXhGN0Qrc3EwbUFrUmVPTHh5dmpZZTVaUDcyaUZnRlBvc2ZjeGRU?=
 =?utf-8?B?Q21SR1NMMGNvcVQxTHUrVE9rSytTcWQxOEhaYmNhM2NZL2FRL1FsSXlaZU8x?=
 =?utf-8?B?VUFrQktTc0VJdEI2d3FBMU0vQS9jZi9uSEhrSkFKT3IzdUZwMy80RUJJK21Z?=
 =?utf-8?B?QTZyOStJM2o5WDFoRXBDRC9jVTc1eU5WcWlramUzUnBKUUlnUUZpRi82UVgw?=
 =?utf-8?B?alpNRExGOWUxSVFIUk1DbGNYejhUUGxtSkF3VnA2aVNPamhIR0pzbkE5OE56?=
 =?utf-8?B?Z2xqbnFjSE1kK0hqdWg2Vk1ZU2NGWjZFbmJaTWVXRXhVOVBhWDRUNzRETDJB?=
 =?utf-8?B?OFhvcVhEN0ZVcUg4SjM0M3FqZzk3dVJkQnpzNnZkVk55RUJIUHlIcjdVQU9C?=
 =?utf-8?B?OVJFV3pna2NDWi9qeXBoeENpQnNVcWZWTXR1eDBhNGpBRmR4N05ERkM1TDNB?=
 =?utf-8?B?ekJpTURmRjlieWgrNXNNWG0veFR4c0o1RTA0RGt3T0Vwa3QvTDk2U3gxVDZ3?=
 =?utf-8?B?dko4RWttR2pFd2FnOXVBM0FBNlBXRWM0eFV0cStIMzE0V2JMblFxdzB0UTkw?=
 =?utf-8?B?YXBZN1FvYytoU2Q1REROQW9XTU9FdEJnRUo1NDBjdGljMTl1K3BzZEFOSnpl?=
 =?utf-8?B?UXNxeUo4b1l1eXB5R0x1SWpnMGFKVVFERUUvZ0NnNDFBa2hRMVVadm1pUWdu?=
 =?utf-8?B?UkxwSUk5bmhVL0htbWdEYjdTbkRURi8xMVlHWVgzaVU0NXRqTTZNeWpESjY4?=
 =?utf-8?B?NHBVUGtXbkl5NEJ1V0VyTHVmQlhvZG5BZ2JiZUpqTFFRN3RaVVZaVXRiMDhO?=
 =?utf-8?Q?xbeip03GKfIwk3VNOJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3df016d-f463-4392-e28f-08d99d0db9ed
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:00:53.0735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mZFXN04+v44lk3ZhJfuC1bmu7viMCNOTaBQfcsaS1bB8ZFAdpO8owhix30AHAUF/y8EimdVkarS+uGcYPGkUoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2430
Cc: guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 kai.vehmanen@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>,
 ranjani.sridharan@linux.intel.com, lgirdwood@gmail.com,
 linux-mediatek@lists.infradead.org, YC Hung <yc.hung@mediatek.com>,
 pierre-louis.bossart@linux.intel.com, peter.ujfalusi@linux.intel.com
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

From: YC Hung <yc.hung@mediatek.com>

Add mt8195-loader module with ops callback to load and run firmware
on mt8195 platform.

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/mediatek/mt8195/Makefile        |  2 +-
 sound/soc/sof/mediatek/mt8195/mt8195-loader.c | 56 +++++++++++++++++++
 sound/soc/sof/mediatek/mt8195/mt8195.c        |  8 +++
 sound/soc/sof/mediatek/mt8195/mt8195.h        |  3 +
 4 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/sof/mediatek/mt8195/mt8195-loader.c

diff --git a/sound/soc/sof/mediatek/mt8195/Makefile b/sound/soc/sof/mediatek/mt8195/Makefile
index bf23d88db828..60fca24c068a 100644
--- a/sound/soc/sof/mediatek/mt8195/Makefile
+++ b/sound/soc/sof/mediatek/mt8195/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
-snd-sof-mt8195-objs := mt8195.o
+snd-sof-mt8195-objs := mt8195.o mt8195-loader.o
 obj-$(CONFIG_SND_SOC_SOF_MT8195) += snd-sof-mt8195.o
 
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195-loader.c b/sound/soc/sof/mediatek/mt8195/mt8195-loader.c
new file mode 100644
index 000000000000..ed18d6379e92
--- /dev/null
+++ b/sound/soc/sof/mediatek/mt8195/mt8195-loader.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// Copyright (c) 2021 Mediatek Corporation. All rights reserved.
+//
+// Author: YC Hung <yc.hung@mediatek.com>
+//
+// Hardware interface for mt8195 DSP code loader
+
+#include <sound/sof.h>
+#include "mt8195.h"
+#include "../../ops.h"
+
+void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr)
+{
+	/* ADSP bootup base */
+	snd_sof_dsp_write(sdev, DSP_REG_BAR, DSP_ALTRESETVEC, boot_addr);
+
+	/* pull high RunStall (set bit3 to 1) */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
+				ADSP_RUNSTALL, ADSP_RUNSTALL);
+
+	/* pull high StatVectorSel to use AltResetVec (set bit4 to 1) */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
+				DSP_RESET_SW, DSP_RESET_SW);
+
+	/* toggle  DReset & BReset */
+	/* pull high DReset & BReset */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
+				ADSP_BRESET_SW | ADSP_DRESET_SW,
+				ADSP_BRESET_SW | ADSP_DRESET_SW);
+
+	/* pull low DReset & BReset */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
+				ADSP_BRESET_SW | ADSP_DRESET_SW,
+				0);
+
+	/* Enable PDebug */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_PDEBUGBUS0,
+				PDEBUG_ENABLE,
+				PDEBUG_ENABLE);
+
+	/* release RunStall (set bit3 to 0) */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
+				ADSP_RUNSTALL, 0);
+}
+
+void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev)
+{
+	/* Clear to 0 firstly */
+	snd_sof_dsp_write(sdev, DSP_REG_BAR, DSP_RESET_SW, 0x0);
+
+	/* RUN_STALL pull high again to reset */
+	snd_sof_dsp_update_bits(sdev, DSP_REG_BAR, DSP_RESET_SW,
+				ADSP_RUNSTALL, ADSP_RUNSTALL);
+}
+
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 945601a0dc37..88da6c2de070 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -305,6 +305,9 @@ const struct snd_sof_dsp_ops sof_mt8195_ops = {
 	.probe		= mt8195_dsp_probe,
 	.remove		= mt8195_dsp_remove,
 
+	/* DSP core boot */
+	.run		= mt8195_run,
+
 	/* Block IO */
 	.block_read	= sof_block_read,
 	.block_write	= sof_block_write,
@@ -318,6 +321,11 @@ const struct snd_sof_dsp_ops sof_mt8195_ops = {
 	/* misc */
 	.get_bar_index	= mt8195_get_bar_index,
 
+	/* module loading */
+	.load_module	= snd_sof_parse_module_memcpy,
+	/* firmware loading */
+	.load_firmware	= snd_sof_load_firmware_memcpy,
+
 	/* Firmware ops */
 	.dsp_arch_ops = &sof_xtensa_arch_ops,
 
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.h b/sound/soc/sof/mediatek/mt8195/mt8195.h
index 48cbbb5aacb5..929424182357 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.h
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.h
@@ -10,6 +10,7 @@
 #define __MT8195_H
 
 struct mtk_adsp_chip_info;
+struct snd_sof_dev;
 
 #define DSP_REG_BASE			0x10803000
 #define SCP_CFGREG_BASE			0x10724000
@@ -152,4 +153,6 @@ struct mtk_adsp_chip_info;
 #define DRAM_REMAP_SHIFT	12
 #define DRAM_REMAP_MASK		(BIT(DRAM_REMAP_SHIFT) - 1)
 
+void sof_hifixdsp_boot_sequence(struct snd_sof_dev *sdev, u32 boot_addr);
+void sof_hifixdsp_shutdown(struct snd_sof_dev *sdev);
 #endif
-- 
2.27.0

