Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3547A4414AF
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Nov 2021 09:03:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A245E16BC;
	Mon,  1 Nov 2021 09:02:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A245E16BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635753815;
	bh=xkn4YHb6rptgE9jOZf7AvbiHtULKfHMCgupPxFwtkXA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yz3a3XxawAkouY7N2oBnZONWeUmynsi9WJ37T5+f0sf4cK4FvOCwWo0RTaN5sW2Ze
	 dPuPKm2BTYt9uPnnI5BZFoqvWIgniRspKiob14RoamCyBhyIs5uzIG8g4wANXHlV4d
	 Is6I4p3ZZj+Vm540bGK5MZUa3t0ga2TA2z30cif8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 17CE4F80506;
	Mon,  1 Nov 2021 09:01:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15800F804EC; Mon,  1 Nov 2021 09:01:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,MSGID_FROM_MTA_HEADER,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe09::61b])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E0CA4F8010A
 for <alsa-devel@alsa-project.org>; Mon,  1 Nov 2021 09:01:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E0CA4F8010A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="X7/8oyK5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SKeNsGJd4t8dx2JCM1Q9uIF/OdXjUBhjkbzI734CpZ3VFtuEQp6ycckrWUJM/aBiYp8CgC3mUyqTZ/W86fi3Sds0usxssR9kJlscZ2+BCeuMQFvNTeiMtLkIKq9zxWPS0yuE2TXGQmF1X9Sp5h9cL3A6UPVWmuo+QKZJfS8NNyLBLxPosqPXRPkkP7gz3hC/kRW+5Y+wm7ZlnDW+zKS9uOm8VpdzvCC4Cmyuqa7t4nl96JW1nKdSAcgr/5MtvI7BEGWt1TRWy9337VecirdkkToL24RPTsjC8CNRsh672n0TWteUuZXZWtpjvXD00n/c9pXlPaalwR/2zlczOZmcbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/3xGWUwSSLI5yvDRcxvTWnoQRrkSl9b0fOqNKLsC4o=;
 b=BGBkJFnGtBuy/sjDpLw+N+/LVwYxcIBH4E3wOgVFN9Vt57I3uk8Ml4sVu/K7CxzPGIPDy6f79UBs6psaz0aqAEubLdl/1Q8HNnKAImKiF3h0hueB3AtLPZnp8LnPRgd6kRaUbX40FsLVDXc8iceCUVs1KnU+84ieTVAmv/83Vi7NaH2gSRnIiVhImU0aGOT4phODwJ1AU4Pr3DjV4VKBLgirYXa2FR9G5c5YwK4bA8dw2CYvkMOHckFzdNdlc2td/m2ndf4jQX5SAJ+2GQF+9HhK7rJjWcCZpHOTWY8vRY6BKVjlgVmm9LjptTunZWemmSJpgEfzEtfPolIskdF3Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/3xGWUwSSLI5yvDRcxvTWnoQRrkSl9b0fOqNKLsC4o=;
 b=X7/8oyK5o4OvN3KVnqctIbC5eZ+cNczsAvbq0pSW4AKQkAnRrBJx0ngbD1pyn8wUjpc+ygCWjDqDkSoAe9x0mQn6NEPzNnnJnUFtQFYpzlTH/xd5gxc1g4rj0wVPZrPVLFKuDvmeGtt/kVrLx1S/v5qOdfMvMwjzPvVf+etwKJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2430.eurprd04.prod.outlook.com (2603:10a6:800:2b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Mon, 1 Nov
 2021 08:00:51 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4649.019; Mon, 1 Nov 2021
 08:00:51 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 3/6] ASoC: SOF: topology: Add support for Mediatek AFE DAI
Date: Mon,  1 Nov 2021 10:00:23 +0200
Message-Id: <20211101080026.297360-4-daniel.baluta@oss.nxp.com>
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
 Transport; Mon, 1 Nov 2021 08:00:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a3925e6-9b90-44b9-d058-08d99d0db901
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2430:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB24307E6359C40DF83D2C56D0B88A9@VI1PR0401MB2430.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c7kgBUQJzIdYrbtdk//+16HYBYX5h6YyQsydMZejR0UVjY+xVQsuex2IiAHrDGTmelImFJlHD6DLMOqs2C8xYkCof2SUuv3qRND80zYCuQgnI1o0ZB0pA0PXTSD2mJprFt0R+XYWAwyRhb7uD5uWpBE9ucIbp0ChyddWFnz3A6QEL16GoXQ8ibk686qUjWmAKDvrkr3TpHvQvHlYXbjQ7wq8JPfWSiehK8PcrSv6uDkHmDOMLWf/KdS9RXBBXY+YF/vIdK9J38MjYJSbRLX339vGf/sOtC6egNzPXq4gFTHJlk+LLDmXQvPUYyU3sqxmMgPM2RbEZ8Z9i7j2Ti+Xnw+in8JV22TpP4HrD58OvSdQjvd7YpbweeHAEKLn1KI+ONz4ez0rMmNo2YcWuDizICFUTB2mgdJG7AZheHmsMMmqeQEfNMYqeStAFhWV1AX73KYTTTnhsOE78xAfINT34o8o1ZuZ1WdErIosWEU7DTN9pzYZpCW+I1Q7SmgQlznpjKqpSuDYnN+Hbi++3DGp0g9md+I1VKoGcidPZkKg4vjKXVDQtcYmp5nxOM77RV9zuWDrEhKwNNFP3D2dcfNn54GHWFXtDGyM1kJNz9D5yX6iCLMj5Jzfp3GeC/phBaNBcrU/dBMst/KGom52otrLIg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(8676002)(508600001)(54906003)(6486002)(8936002)(6506007)(1076003)(5660300002)(52116002)(6666004)(44832011)(6512007)(66476007)(2906002)(7416002)(2616005)(66946007)(38100700002)(186003)(86362001)(66556008)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEM2eXpCQWlJV0dEYlQyanVxYTUwcUVBMm1ETUZFemdLMElPSGFPQzByRXh4?=
 =?utf-8?B?STdLTmxaTzB6aTFhL3BNc01MbmJic3YyL0pXVUNXcVJCU0RWTGRCOHJxUTY5?=
 =?utf-8?B?WTlHYlhMam55cUVrY1VjQlhId0U3aFgvYUNrZ1VTVWVoZlBmZXlkdXEwZkFZ?=
 =?utf-8?B?UUVRRU03Y2tiaTRXWC9TU2g3d251anh6alluanBHNHY1bmR6N0ZHWHZBaFZx?=
 =?utf-8?B?OWFPTnYwSVY1dDVCRkZZZjB6M2hEUStYaUpIcGh3Y1JLZWhaVEJwMU9jTHk0?=
 =?utf-8?B?aVFocUxhcTVjbWd4bXV1c1VoVFhpeHNDbVd5R0hYd2FoZU1jTWd0dGZORS83?=
 =?utf-8?B?NjhIZ0Uxd2l5bjFHTVNXbVJCTE9PaHpuUkp2YWhIQ3lBUjB0QVV6dEtnbUgy?=
 =?utf-8?B?alNxTlRmOGRvUmpWRDFZRHoyTFFwUnovbXZNeFZzWjdKMVJxdkZLd3ZhZno1?=
 =?utf-8?B?ZGxBYld1T3NYR1c4dkJSNml0UkEwMGt5NnBaWVAvWE91NHR1RHplQkQ4WUFX?=
 =?utf-8?B?R21jYWVPdDlQNmdUSmF2ME1TOGRNQ0dSb3ZIaDZLR3pERFpmVDkwOXhzUi9l?=
 =?utf-8?B?RnlzVzFLTjVqQ01lc3lRVmgvWXl5dCt2ZXgwOFVFa202TWlIZElMYnJ0MFJu?=
 =?utf-8?B?ZGlUVGRlOHJVL04vZGl4MFovSjJRdUdTc1BUYmNmSXN2MEYvdVNOazlDMkZn?=
 =?utf-8?B?NTUzZWVpaWNNT3RPQ3BOR0Erd250Vk91MmtqMHVvNlo5UnRYUlgzN2lZbVpD?=
 =?utf-8?B?REk4UjB6RWZQY3VvRmNSZTQzdzFBZnNpeVZ0K01COUJsOVhET1dYRXFVcTRW?=
 =?utf-8?B?ZmhnSjl0NExPVHl4U1hpd3QzUVRTODBpNmlXYXlVSk85c1B4SUs3MWFoMGxM?=
 =?utf-8?B?SW85Nm1Vb1U3VndLU201QzZ0dllid3pyM0R0R1hoS25MVE1nRFkycGJXUVFk?=
 =?utf-8?B?U1Mxak56dzMxZmFPVmdPWG1MK0cxZWZ0dGw4Y1VLYnVoNzYxR3UyNElhMVlD?=
 =?utf-8?B?RmltdmZRSldkb0cwdUJpNW5sazZLT1hCbFdOL1lCeHhHZmo4ZFcwMERrekRZ?=
 =?utf-8?B?WnRQS2htN1M2T2xpdm9GL1FjSmw5YnJMMFlLRUxGMTBPdTRGMFRJWHZvMnJB?=
 =?utf-8?B?VlNoTmFTc0F0R2Jpczk3WmpCLzdVM2RuYllubHNYMlBXUmp3Ym96K3VhZ3FR?=
 =?utf-8?B?K2F5YkliUzdOUC9lOGVGZm01emxZYzg0TWpHTVZGaTdGV0VQallSc1BubFdZ?=
 =?utf-8?B?TllvaGRzZnpua2pkaGZZWVhWemt0cCs5OW85MFdDNVRBQ0kyWjhlb2JJbUNH?=
 =?utf-8?B?endtYWZTUEJTR2hMeDJHTlVFTkh1bVg0ODdqdHRQZHl6TjZpeFZLSW1sV2t4?=
 =?utf-8?B?eDFYYjlJdHlsWVNXeWdsS0dHZDQxL3JnUG9kdTRWOFZGckZxL2FuRXYzU1pw?=
 =?utf-8?B?bnU3eDlVQUtGKzl0aFBwaGRBbEl3ZDRDVTY3VmlRbkZ6TGNkelorMnE4czNR?=
 =?utf-8?B?aEprS2Z5c1UybnU1S2M1bCtMRERXVG9aa2trNU1KOGdtamdCK1ZlTzUyNUFu?=
 =?utf-8?B?QldYa2o5Smd0d3I0UTUvcVFQWUFmamlmVzZVWS9YaHBZWkZXZTlnak9vUUFq?=
 =?utf-8?B?dkVYM253QVZCekkzZGNnNUdqT29nQTE4UDVRaTZXZS9aSjA5ME83c2lwSktP?=
 =?utf-8?B?a3NxaHNZV0JVOEVKYXRiVzJxakZNcnErUDhZS29HY013WTdDRGxiYW9LUVZ4?=
 =?utf-8?B?VnZXRmVnNDN5TWs0WGlXeDcwbjBnZWIzamRkQjRUYzNvaVBUQzhuQ1luTWI3?=
 =?utf-8?B?YW4rU1J2dGtRbXBzbHFUVnNyWFM5NnRKeDVMQUNiMWlmT1hob1M0cEFSdnRy?=
 =?utf-8?B?TFBTOWFnZWlYWGpKd1lnOUxrcmVKR1RERUpQY3F6Ym5LeWlaZ2pIWFNLdzRx?=
 =?utf-8?B?anBkWXlTbllWZDhiVlRFTHJLVmpCR3AwNjRBZVpJdWxRN0FZcS83d0E3Sis1?=
 =?utf-8?B?VDFGTllRQU84ZjU5a1FtdWNkMVZ5elp3TnZYWDhadzdMbkVCaHVwQS80a25B?=
 =?utf-8?B?NjdvVTcrKzFSVnloRWQxcE4vMlF1Q21hTHVZbEFxOXFraUhyMzdkK2Z5MjlJ?=
 =?utf-8?B?a2x6UTVZdXozcFU3ODFmcHJsMkFxdjdDcGFzVUVIT2dJaDdrWmdJUzNpY0ho?=
 =?utf-8?B?ZHlpZ0V5MWZFcE9oN1U5QXQwdVlzeXdYek1RU3JCNE5YbjEzU1V0NEJzVnRl?=
 =?utf-8?B?Y3hRVzdnMkdscko1dUpydkZra2tCT3NjN1pjUytYSTROOWwwNHlKb0R4azEv?=
 =?utf-8?Q?q5zieZMU1igXnuyY6J?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a3925e6-9b90-44b9-d058-08d99d0db901
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2021 08:00:51.4964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j9uQ3BhtHT6RXS6CO8rgbLIRvMtKjBwPbEPHXxujxvvsAR2La/mvrC6d9VGM0FeapHyaSUE2gcyNeOY8R6MrEQ==
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

Add new sof dai and config to pass topology file configuration
to SOF firmware running on Mediatek platform DSP core.
Add mediatek audio front end(AFE) to the list of supported sof_dais

Signed-off-by: YC Hung <yc.hung@mediatek.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 include/sound/sof/dai-mediatek.h | 23 +++++++++++++
 include/sound/sof/dai.h          |  3 ++
 sound/soc/sof/pcm.c              | 12 +++++++
 sound/soc/sof/topology.c         | 59 ++++++++++++++++++++++++++++++++
 4 files changed, 97 insertions(+)
 create mode 100644 include/sound/sof/dai-mediatek.h

diff --git a/include/sound/sof/dai-mediatek.h b/include/sound/sof/dai-mediatek.h
new file mode 100644
index 000000000000..62dd4720558d
--- /dev/null
+++ b/include/sound/sof/dai-mediatek.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * Copyright(c) 2021 Mediatek Corporation. All rights reserved.
+ *
+ * Author: Bo Pan <bo.pan@mediatek.com>
+ */
+
+#ifndef __INCLUDE_SOUND_SOF_DAI_MEDIATEK_H__
+#define __INCLUDE_SOUND_SOF_DAI_MEDIATEK_H__
+
+#include <sound/sof/header.h>
+
+struct sof_ipc_dai_mtk_afe_params {
+	struct sof_ipc_hdr hdr;
+	u32 channels;
+	u32 rate;
+	u32 format;
+	u32 stream_id;
+	u32 reserved[4]; /* reserve for future */
+} __packed;
+
+#endif
+
diff --git a/include/sound/sof/dai.h b/include/sound/sof/dai.h
index 3782127a7095..5132bc60f54b 100644
--- a/include/sound/sof/dai.h
+++ b/include/sound/sof/dai.h
@@ -13,6 +13,7 @@
 #include <sound/sof/dai-intel.h>
 #include <sound/sof/dai-imx.h>
 #include <sound/sof/dai-amd.h>
+#include <sound/sof/dai-mediatek.h>
 
 /*
  * DAI Configuration.
@@ -70,6 +71,7 @@ enum sof_ipc_dai_type {
 	SOF_DAI_AMD_BT,			/**< AMD ACP BT*/
 	SOF_DAI_AMD_SP,			/**< AMD ACP SP */
 	SOF_DAI_AMD_DMIC,		/**< AMD ACP DMIC */
+	SOF_DAI_MEDIATEK_AFE,		/**< Mediatek AFE */
 };
 
 /* general purpose DAI configuration */
@@ -97,6 +99,7 @@ struct sof_ipc_dai_config {
 		struct sof_ipc_dai_acp_params acpbt;
 		struct sof_ipc_dai_acp_params acpsp;
 		struct sof_ipc_dai_acp_params acpdmic;
+		struct sof_ipc_dai_mtk_afe_params afe;
 	};
 } __packed;
 
diff --git a/sound/soc/sof/pcm.c b/sound/soc/sof/pcm.c
index e40c2212a999..1bf7e60be772 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -807,6 +807,18 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
 		channels->min = dai->dai_config->esai.tdm_slots;
 		channels->max = dai->dai_config->esai.tdm_slots;
 
+		dev_dbg(component->dev,
+			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
+		dev_dbg(component->dev,
+			"channels_min: %d channels_max: %d\n",
+			channels->min, channels->max);
+		break;
+	case SOF_DAI_MEDIATEK_AFE:
+		rate->min = dai->dai_config->afe.rate;
+		rate->max = dai->dai_config->afe.rate;
+		channels->min = dai->dai_config->afe.channels;
+		channels->max = dai->dai_config->afe.channels;
+
 		dev_dbg(component->dev,
 			"rate_min: %d rate_max: %d\n", rate->min, rate->max);
 		dev_dbg(component->dev,
diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
index 2f2aa63943b2..b3ad3a604918 100644
--- a/sound/soc/sof/topology.c
+++ b/sound/soc/sof/topology.c
@@ -379,6 +379,7 @@ static const struct sof_dai_types sof_dais[] = {
 	{"ACP", SOF_DAI_AMD_BT},
 	{"ACPSP", SOF_DAI_AMD_SP},
 	{"ACPDMIC", SOF_DAI_AMD_DMIC},
+	{"AFE", SOF_DAI_MEDIATEK_AFE},
 };
 
 static enum sof_ipc_dai_type find_dai(const char *name)
@@ -806,6 +807,19 @@ static const struct sof_topology_token led_tokens[] = {
 	 get_token_u32, offsetof(struct snd_sof_led_control, direction), 0},
 };
 
+/* AFE */
+static const struct sof_topology_token afe_tokens[] = {
+	{SOF_TKN_MEDIATEK_AFE_RATE,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_mtk_afe_params, rate), 0},
+	{SOF_TKN_MEDIATEK_AFE_CH,
+		SND_SOC_TPLG_TUPLE_TYPE_WORD, get_token_u32,
+		offsetof(struct sof_ipc_dai_mtk_afe_params, channels), 0},
+	{SOF_TKN_MEDIATEK_AFE_FORMAT,
+		SND_SOC_TPLG_TUPLE_TYPE_STRING, get_token_comp_format,
+		offsetof(struct sof_ipc_dai_mtk_afe_params, format), 0},
+};
+
 static int sof_parse_uuid_tokens(struct snd_soc_component *scomp,
 				 void *object,
 				 const struct sof_topology_token *tokens,
@@ -2991,6 +3005,48 @@ static int sof_link_acp_sp_load(struct snd_soc_component *scomp, int index,
 	return ret;
 }
 
+static int sof_link_afe_load(struct snd_soc_component *scomp, int index,
+			     struct snd_soc_dai_link *link,
+			     struct snd_soc_tplg_link_config *cfg,
+			     struct snd_soc_tplg_hw_config *hw_config,
+			     struct sof_ipc_dai_config *config)
+{
+	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
+	struct snd_soc_tplg_private *private = &cfg->priv;
+	struct snd_soc_dai *dai;
+	u32 size = sizeof(*config);
+	int ret;
+
+	config->hdr.size = size;
+
+	/* get any bespoke DAI tokens */
+	ret = sof_parse_tokens(scomp, &config->afe, afe_tokens,
+			       ARRAY_SIZE(afe_tokens), private->array,
+			       le32_to_cpu(private->size));
+	if (ret != 0) {
+		dev_err(scomp->dev, "parse afe tokens failed %d\n",
+			le32_to_cpu(private->size));
+		return ret;
+	}
+
+	dev_dbg(scomp->dev, "AFE config rate %d channels %d format:%d\n",
+		config->afe.rate, config->afe.channels, config->afe.format);
+
+	dai = snd_soc_find_dai(link->cpus);
+	if (!dai) {
+		dev_err(scomp->dev, "%s: failed to find dai %s", __func__, link->cpus->dai_name);
+		return -EINVAL;
+	}
+
+	config->afe.stream_id = DMA_CHAN_INVALID;
+
+	ret = sof_set_dai_config(sdev, size, link, config);
+	if (ret < 0)
+		dev_err(scomp->dev, "failed to process afe dai link %s", link->name);
+
+	return ret;
+}
+
 static int sof_link_dmic_load(struct snd_soc_component *scomp, int index,
 			      struct snd_soc_dai_link *link,
 			      struct snd_soc_tplg_link_config *cfg,
@@ -3286,6 +3342,9 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
 		ret = sof_link_acp_dmic_load(scomp, index, link, cfg, hw_config + curr_conf,
 					     config);
 		break;
+	case SOF_DAI_MEDIATEK_AFE:
+		ret = sof_link_afe_load(scomp, index, link, cfg, hw_config + curr_conf, config);
+		break;
 	default:
 		dev_err(scomp->dev, "error: invalid DAI type %d\n", common_config.type);
 		ret = -EINVAL;
-- 
2.27.0

