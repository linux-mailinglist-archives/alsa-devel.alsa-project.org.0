Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D44AA4558AD
	for <lists+alsa-devel@lfdr.de>; Thu, 18 Nov 2021 11:11:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 53A5518B5;
	Thu, 18 Nov 2021 11:10:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 53A5518B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637230270;
	bh=s27WKQAzY76Gi67Cd9Uo7yOykv1oZbEFy7cbeF4S8B8=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OmwwmJ5zjcu82hcl70unpN2/IwDlz2woyAdwgkCURQZ+YtuWo9AbgkMorfMJK2XbJ
	 gBcWyGul7z0p32HPvdz77pI1kkbwuT3JJIr/NY9QYciGkJx3RmOLGmA8hsl/qVJehC
	 zG8LpHDfZBQcUxvabqMI9eZBvTvgP0HuSk3zYMrQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C687F80508;
	Thu, 18 Nov 2021 11:08:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 088C0F804FE; Thu, 18 Nov 2021 11:08:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::62c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B139F80272
 for <alsa-devel@alsa-project.org>; Thu, 18 Nov 2021 11:08:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B139F80272
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="iTkZuRmp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKBCBPU0r/NTHkzP9DRyIB0XSFE8vXvkLVs2O9kfbnWAEHM1vsKHmKdRk8QemoUx9M58YdrXZ8LNqVmHZ3ltwRbQErvXLcm+5q0R43+THmWvcQYjFeoH2+wQYukjApeSSAlTmvGtBGozTguPQb2Qwhg17ekQiu1mAuNccMXH+1x+UyhfYyVAGRnhwI2DjD2EWAbjSiCnQfz0raI3ETm/iKgLd8CzpUAvZluE+oMENsqwQ8e55HylhHKnag051JL8jAmHX19n5idUQGQmOlbWkI7mA6X62W++FJNm4Ld+DyLfYK2aZW7yFtdQcc8gx48aIPd1TpSllw1Vx3DBuEWB/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcbOQalXySIAbgXzXcklFelsLSCQ8XryxySoOXJvAdo=;
 b=B3dv/1mHTeJNt+XQuapJASGDbgCzZeSbXqzmHfD5PuI/eTCHIBwciuFsNnlH+x4oB2bFhZdce6HJvby6OSLsP8zkj4r8tPYorPc54mhO/FGbI2AcX1Ys+TFG1dKBBHMLBqAuLXT9pqugg8Ug3fu4Xq3Kx6XjdsOovTC9i9KygmgmXM/6+ktreL49DxoyBsNEvw056DE9fdeFsdHJq/dKpsFBNhAz4KNCNSji26+T654ZxldPDO6u8GW1Ek0D8mcjDfedLX+ucKZn1Lfx6J0M34dKn9oOj+i/D9hpv1Z+8iw11IaYjNkrwFB7DoQgB5Qx5ucp2hJfREEoq+/BBQhwrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcbOQalXySIAbgXzXcklFelsLSCQ8XryxySoOXJvAdo=;
 b=iTkZuRmpx0lH8YmuR2awohdmVz6mtnDduyQFkJDr4QeLljFldobpNqtv8I8Tk7YFXOL0uuI5yo98CzJZhr398tux54TDD5AaPJ1XA8H+FsByELQO9G0eKFr+Y7u520x3wmpaJCGG0xgtMX9RwGDkbSPjh2ojlq3PEdGBJarFz/M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB4285.eurprd04.prod.outlook.com (2603:10a6:803:4a::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Thu, 18 Nov
 2021 10:08:13 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 10:08:13 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2 3/8] ASoC: SOF: topology: Add support for Mediatek AFE DAI
Date: Thu, 18 Nov 2021 12:07:44 +0200
Message-Id: <20211118100749.54628-4-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
References: <20211118100749.54628-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0902CA0008.eurprd09.prod.outlook.com
 (2603:10a6:200:9b::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:863d:d4f3:969f:6fa)
 by AM4PR0902CA0008.eurprd09.prod.outlook.com (2603:10a6:200:9b::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 10:08:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d1d97e4-97f4-4dc8-329a-08d9aa7b54b0
X-MS-TrafficTypeDiagnostic: VI1PR04MB4285:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB428577CFF2CB5433EB99E347B89B9@VI1PR04MB4285.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aGD0ckE2eko+mChns2xRwfqscLNSXz1hDoRVt7zxxsNfkKRfDC5ae6MUSZzA+N+Ptl0GUhyE57wJrLtXH/iHAwH/Yw6H5r2t6iVhxhZCRVu/aPtDS7rTssI3yymf5vr/xk1ksMdBbybGqHAAQaev99bZTwnKR9HubDn4ggXWJOHJuOLdTGPlqlIllOtt32khaofzE/p+6OWXLdR96t40lRhpQ5WoWgSDQ7ZFiri+GXd3cADMspZk9Qmr9kesfimjVYFwIwdCrCgHxw8eRr7X8hWW3s5c2fYdH0Fa2enuGxVkubkrQ81QVAGX/kKOT2H6pkKP3Qv6icFlx0Uw/9e/DEcofeOOb22o1trNmRfaD4q0Q/4MvpVPWLcCX5NOHMdpLXmWq/m1Ehp4hji+tqOG6lGegv07vUHFUtKvTCa22bGsWWJLZFNqeRco6V+9IkovfGXsr0wh7nTKvfJne+OShnTw5r3aFL4c2/Ea0MhrpOFb0XVNU6EJsmltLT+vUr/sxuZ2GW1ighxZ+huozJFHlHXbqovSLD4t9eujbEXRcj/lWOoP+JRK/0LlHsNXyb+KdLHspzK6V9AiwkwXiPo6luEoTlA3wN76QYtFdANGCwLpxyXLGumyzF8H1F+Rbz1UnHnW/jrzvtsWumjaxGkfIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(186003)(54906003)(8676002)(2616005)(4326008)(44832011)(86362001)(7416002)(38100700002)(316002)(508600001)(2906002)(52116002)(6506007)(6486002)(1076003)(6666004)(66556008)(8936002)(66946007)(66476007)(5660300002)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VUFmVDhaZHlSMk83VmJqMHdVd2tMdXRSTnRuSGkyUkx5Vy9udE5kcWdrZTZm?=
 =?utf-8?B?bjcyUkJLMy9IdDkrT2ZSdk53dWZVNXdZeWpZYkw1NzU4WUpNbHRZUlBrVmUy?=
 =?utf-8?B?QVducE9lNDQxYWRKMWlnMjVpNFdqVSt3MG9XeEpYSHFKWTNyQVcxbGw3NVFn?=
 =?utf-8?B?b3Nua1VvU1JmT3RoczFMelhVODRyMDcwQXF0ZTZmS2wxOUtISFZrR2wwMDNU?=
 =?utf-8?B?Qk5RYjF1ejdKMUZoWVdybXJZOTV4SVhPQW9GeEEvUkFJMkcvOUJFcDlPTDdH?=
 =?utf-8?B?TE9TVTh5c2J4cTRpdVpvSTEwSTUzc09FclFnMXpZSkg2MDVZYkdIZDFJUjdY?=
 =?utf-8?B?RVFsZU5aL0dNWjR2clZXRnJiUWR0ajlOT2JqUmQwNUpIcjRhZ2xoaTllWnRB?=
 =?utf-8?B?Ly9aRGYyTTk5d2prei92MVl2KzVjTEl4elJ3V3NXWUVReU5pLy90RE9UNUpB?=
 =?utf-8?B?Z0tCVmQxR2N4Y3V3by9ORFhwWTdCT3o2WTQ5WEJPcENwdnkybFYrTFVyMDE2?=
 =?utf-8?B?VW5BVEcrMkJ6Z2RGZ1pMQ2hBNFlnYmQyeWw5V1B2Z3JBSHpaWGErejZYL2N4?=
 =?utf-8?B?aDZrNnVNdVVtZXlmTldUeGlqMVBGb2VicjAvQWpCbnBpL3RtcUR1ZVpSeUhz?=
 =?utf-8?B?Q01ldkw5NERLbnB0bm1qR0F1OWlsUEVSRTVZWnFaNE9XQldQN2w2UjZHdEw4?=
 =?utf-8?B?cERvN1lUUTlRbUhhUEhoWDdqMWV4L1lzVDNhdVNJQURDaDFCR2dtbVQxSVNz?=
 =?utf-8?B?eFE0cVlYUndCQklYekdqTHBKN1NRL1FqVllHbXc1RUZSbWxmMEFrcEFSZno3?=
 =?utf-8?B?MEttQ0RTMCtMQjJNaU5Gbk52TEpHVE1qY1UzQWFycUZNd3BEVTI1S1hManJZ?=
 =?utf-8?B?Qk5DQlNzQ2RPbWl5QzlpS3hwc1hlbUl5SUpPQWtvTEd0REkvakNiQlVRUCtG?=
 =?utf-8?B?Z0EzeEV0eTZVVGd3cDdHQ2dGaHZoVHNVNTB1TmQ3RlhsM05zeE94Mm5iMFpm?=
 =?utf-8?B?TXZaNWVMbEFqVkx3NitsWnBPalZUT1NIN0haV056dE5hVWVuM0huaFhETGM2?=
 =?utf-8?B?YzEvZjJGbnpIWFBBSTJyVGNOcERrL2VuNVhEL1BoZ2Q4eUtXaG1rTGM5QWhE?=
 =?utf-8?B?dE41NTFlVzFLbE1PdHVDZytLRFhwMUtsYytZTTA3TjlHblgycXB6UTg2SXYv?=
 =?utf-8?B?T0djMTFPMjJQQTRSbFREcCt2Z1BKb1prK3gzR3RqeE1zRDMxemdZVmUzOHBn?=
 =?utf-8?B?YUFTK1dDY3Nzdy9kOEFQTTYxYVBRWmsxRkNCb1FUSXlFYWdmV3k4TVlLNG9F?=
 =?utf-8?B?SWd6MGpKQk9qalppZm0rb2RWTEtnR3p1R1ZoSlIyS3pUR21HblVRZSt6Y01R?=
 =?utf-8?B?cEtWOS9hWnRuWHpGWE92cXZXNFdab2xPZ2ltMUNsM3VsQlB5Qks0QmZQa2Vl?=
 =?utf-8?B?N3dTL3hwK0RIZTZOdU9oMUJhaXEwVW5CSGdWQXVqK1publJVOTlRR0Q1dFBn?=
 =?utf-8?B?d2pLdE80akZwWU01YWZhRTJYb210eWpLa3JDL0lqdkRiWXpIRXBKZldiMmI1?=
 =?utf-8?B?RUc5a3lPaGtXMVU3cTR3RldXVXNybTQ4SDQ3TjJZK0hnenlWT0Rkb2o4NUZz?=
 =?utf-8?B?TGNvWWFNWEJKU1ZpeHY2bFFJRUI1Uk1EeHJOdWZhVFdTa1NteFRrMDFPT0lE?=
 =?utf-8?B?OWpQMXhJdndGdGdRWGdHeDFMTWFpdWJoQldjTkhwWjBFdDFTaGVvdlJ1QUVu?=
 =?utf-8?B?V0lvaFhjSXFNSnJQOUhDYkkwY3ZVTVRPVmVNS3ljQlEwdnJwWlUwQ3ArWDh2?=
 =?utf-8?B?QmhtdzJUM2ZOd1JYTEtZRy9oK0V4Uk9JbnNOcHRYUUk5bzZLTm5qblhtVTM5?=
 =?utf-8?B?VjdGQVBnUHVKRWpDSHFxeHZnaG9LNFNXblg1anVuKzVRU3VONEk0T0RJVGNh?=
 =?utf-8?B?ZGxZcXdYd24xZGt0WnFXODNmVFgreWkva0ZXWm9HSU1vKzlqNHppWVVQdlJI?=
 =?utf-8?B?MHlQdW84b0pRS0h6aTdtNWhDNDFzbGwyY2ozMzk4dHdNY29WL1FWNC8zMUkr?=
 =?utf-8?B?VUg0djVXM09XZ1B0YThZMjZIcC9GRkRUTXFrcXp5UUE2ZTBJektjYlNMc20z?=
 =?utf-8?B?dCtIbjR6VUJ6OWsrVzJVK2pJTm11VFh5a1llMHBQTm1HcG9sOWFPMUtvLzM0?=
 =?utf-8?B?b25IcndyWG11SmdpbDNQU0ZZQ1cvT2Uzb0lTMGw2a0hzU3V4cEJ1REtWU1F0?=
 =?utf-8?Q?F1CI/Ppe0ddl0WcNhXFGVDypYE+rHWxpDsV6A7sP5E=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d1d97e4-97f4-4dc8-329a-08d9aa7b54b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 10:08:13.5764 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64eiMknWr7u0SjoUbpDdOE4FsiArEX/tzl6l9CJXMjPpcvs9zL+rMdpCx2VVMGbccfmT3xWLTQsA/Swj/9T+lA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4285
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 lgirdwood@gmail.com,
 =?UTF-8?q?P=C3=A9ter=20Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, yc.hung@mediatek.com,
 daniel.baluta@nxp.com
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
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
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
index 8d313c9862cb..31dd79b794f1 100644
--- a/sound/soc/sof/pcm.c
+++ b/sound/soc/sof/pcm.c
@@ -808,6 +808,18 @@ int sof_pcm_dai_link_fixup(struct snd_soc_pcm_runtime *rtd, struct snd_pcm_hw_pa
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
index 72e671c15a34..10caf2b1a33c 100644
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
@@ -3091,6 +3105,48 @@ static int sof_link_acp_sp_load(struct snd_soc_component *scomp, int index,
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
@@ -3386,6 +3442,9 @@ static int sof_link_load(struct snd_soc_component *scomp, int index,
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

