Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 228E183FB78
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 01:58:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6708174C;
	Mon, 29 Jan 2024 01:58:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6708174C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706489920;
	bh=xdcdHGRLk++9unFrWuwwLTfbcdoE19dV/F07gpyrLXU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WgYc9AFgxRSOPEIUu4Jv+RkM6BIiO8WI1ThxcPBL/wTVQCiBBn3XCznLlxGKdnEol
	 DbvrwTeRMFsTbusTAn8UzAtmxKgumQz1yFQwd7c+QLfTqz6egT0I0W5o4CkXgy8YQM
	 brC2RTa6psPBI3DdOcqGHkCjabFUXfxXIVbZsl0s=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 363A2F80619; Mon, 29 Jan 2024 01:56:51 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4039FF805B1;
	Mon, 29 Jan 2024 01:56:51 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85F4EF80589; Mon, 29 Jan 2024 01:56:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::701])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4A530F805C5
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 01:55:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4A530F805C5
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=pxb8FUFc
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BX0XXft/KTnyn2Mgfn52juWmICVMfjouzoSKBwqNs37mThlhp+/gq0boDIRWxLZJyMQYKW+3Efu4ShqBQNRwsX8YRA3489zVo/gX27idFoPa52Ocrm31pxZIt1VAQ/nCUO65Gn8wqFiJBwtOiSXL5Vnrotakh1iLaH8FEALdTPsJygaS1Z/cl3gX8ZD1zQArjILcrY8Ph8bBNrXy4MwJTOR5yZPH90Ydb2QmCaxokRy/raaFa/TsmWRFZbxuUQ2tkvy0w/hfV+/vAOrrWXcGCLkaWla1A9qMs2QDWywDENp+LBeTF9Rc6vrw7StTQSHMkV5FTD3oI0HTGyEYdnDbHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cq2LsI7iLvumbZjTzkBs4ovB27srv8jhCkhgAMa4bww=;
 b=QVujTdDe9J1rmp8j+rvFTuHUdDguDDVP422TjsBwGzYk3U1/ubOss7Z6fQnOt2Az7eBqHMbYzfZS8usmll4T9ZOUsbw5M7qoZwc0at7nnaCDp3uJ+lzS6svDT/YwxhwHlomNowOU4+K5h53TkeKQEy/ub2jIE5RDk7r+BimGwQpfu8NduGbVesFf7H+k1S+VnggpNMW+Ms/wxIca63Fdln2FV1JwGCWV9Tf76w7z2cqedbuvg21MEWgWvKxrLI5nbK0mEMxQS4xlOIUGwlsSPFBduh4DHFYCuhveT84ZygxTBbCGoaTL9Of7/tudBU1bFJiLTNZ4JBkoYdYwJfz3Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cq2LsI7iLvumbZjTzkBs4ovB27srv8jhCkhgAMa4bww=;
 b=pxb8FUFcoJEPKdNLOio2zmYXZpfnghg8xrOWowJiYGgNeQmKCL20dAK7aarkD22MRoRyAJ/t7pve0JGdXAU3POBJcp/BU/OiHRK2+YD8l4FFaGyhUFd0uXgX1hpgVEiQ5aEFwiiT1fiFEcjzjqmaZMwsjAo0wtQqcsNSCxLpp6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by OS3PR01MB9881.jpnprd01.prod.outlook.com
 (2603:1096:604:1e8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:55:48 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:55:48 +0000
Message-ID: <87y1c9j6uk.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 12/13] fbdev: omapfb: use of_graph_get_next_endpoint_raw()
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
To: =?ISO-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?=
 <u.kleine-koenig@pengutronix.de>,	Daniel Vetter <daniel@ffwll.ch>,	David
 Airlie <airlied@gmail.com>,	Frank Rowand <frowand.list@gmail.com>,	Helge
 Deller <deller@gmx.de>,	Jaroslav Kysela <perex@perex.cz>,	Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>,	Liam Girdwood <lgirdwood@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Mark Brown
 <broonie@kernel.org>,	Mauro Carvalho Chehab <mchehab@kernel.org>,	Maxime
 Ripard <mripard@kernel.org>,	Michal Simek <michal.simek@amd.com>,	Rob
 Herring <robh+dt@kernel.org>,	Saravana Kannan <saravanak@google.com>,
	Takashi Iwai <tiwai@suse.com>,	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-sound@vger.kernel.org
In-Reply-To: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
References: <87fryhklhb.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 29 Jan 2024 00:55:48 +0000
X-ClientProxiedBy: TYCP286CA0089.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:2b3::16) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|OS3PR01MB9881:EE_
X-MS-Office365-Filtering-Correlation-Id: f33cebd0-7a40-4289-4fee-08dc2065086b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+/n4uptVyzYbOYsvBvxFyzB7VqJJ4+DI64H3k6BqdKyJOGoVGMEmrj1JwIkTUfO7wY6H3EEc8n9UoJqKSL2jLFnoQIoHZ6YsAr4LwIH67IDjo2o00LOGL5J7+LTBz69AJZbQFs2JDeBlXvEjV5QqkgrvAeGwlOn9teh08jsPrqro32ryohZJeO1q/RqmPG0FZ5wUezzP+If7+/DPnceINkp1v4rTKk2SZ2NJ/lCY++PbZLJpwZxG9BKgpnXs+mf3EhLFMuqBeyluk0+sf2YB0OKTKbKyZZABHNTymg2ddz373ZoPd2M9SELVnaHqwln3BHMzhh7/43HDhbcRwl+c8puoreNdJAvC2V4yCkIJQi9VnCSgqdkN46e5mifZLwoPN+f015PQIecdb1Wo4m/Domw/MaBnMaylI7Cohy5J19mkF7wducogPokBeKCouFACeycrZz4ZaDCzVcwXCdsyqXPQMSxVxlFcFfefHSGMVguobFunEjZTZIWTDkhv4trRpTmEbUCPQm7u1OGA/jdafkqRaZBH9kIGhphgK08FnxKYKIdAK8i6RKUpkQ6ASkgABrGDIJJZ4xaHpBNctnzRg0WuJDhQ6YNOkR9+4812/lreYVD13oNsBawiywz9DLMk
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(396003)(376002)(39860400002)(346002)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(66556008)(8936002)(8676002)(4326008)(2906002)(7416002)(5660300002)(86362001)(110136005)(66946007)(66476007)(316002)(38350700005)(36756003)(38100700002)(52116002)(6506007)(6512007)(478600001)(6486002)(83380400001)(26005)(2616005)(41300700001)(921011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FXBIYKZ+LO39Xnb8wSBsyRCJBFSkLZAPSgcXSyiUQ6pdAzxfNpsv8veNr1xL?=
 =?us-ascii?Q?yaOeTpjV6iw4fr30rDc8/CosZIKHKYLhuiDLzrijMP/RUw8SuAo4uXvj32Ib?=
 =?us-ascii?Q?WlCwWodYmzBCfa+AHXUrjhWBfDHwNFOrEscgNwDa34WGg687GfnZW3A4DLOK?=
 =?us-ascii?Q?C1KVAnIiGorOCNMHBHQ0Zy7W/vZo7XWds2OfZEYBSg0INiVdGJwzWpKMc2BC?=
 =?us-ascii?Q?LNfd7wF4CAfmTFVGKCmqWJCJ6Twp+Bf5SRcEHMbpYurBlO+8QBuyEgRSPDzt?=
 =?us-ascii?Q?2QgJPRQ8IS6JjtqjN48j4VilKvnlPrPyrmn8v/h3+BhjigKzgIgNW6RvQjfQ?=
 =?us-ascii?Q?uR/stpCw7CIp4O4vgY/ckZ1V7xbJcHDomgkNKvIGkSG383AhUg6GHqXrw0LZ?=
 =?us-ascii?Q?zlYjtR6G/oHEXLWbHRjjwddFoUvv17m9LnKlf5gwAfkzroUP1wkuvMB/BINQ?=
 =?us-ascii?Q?BsqWSsYo9C5imo75syfi45FA2s3+zfFOWk/lSFVEOIUK1Jg7Ny8CEmsdNns5?=
 =?us-ascii?Q?B+UMxeiB25W9UmOJ6T8kGk6gUSbUvt3WLGrfLKGne/QnH4Xel23Yd9QhTvWv?=
 =?us-ascii?Q?mnCgUBsDLk3aDWTMx5c70Egl4jTbYbNEt2SLpDEG115JqZ9COqhxYiTamCMq?=
 =?us-ascii?Q?2NCguUccrhOHVaMndazpBp6WcO0LYAht/eB5shSQRfcIojbOn1cYKNkAPYa3?=
 =?us-ascii?Q?667BCkvnBZxGT5wpUX1ztRy3ksnim4MFwQYpmhXOUyVj72HWFBQs4/2TVIVA?=
 =?us-ascii?Q?1OVSZHohwefztF+IQJ60xa+kTwNiRXt/A7Y8XySw7xE0y71T4KLTOB8dk0g7?=
 =?us-ascii?Q?goSMfemw7556GOyGBZQAqS2RzHkM5a1GqDbPGmWFMIbywQGy9K3WhZD/l8Fy?=
 =?us-ascii?Q?pHiMiMz0N52aSK0zMIZVxZIl8oJgHJCkiq3Bq0UinChUkAOsnlkDZ4kfHxn8?=
 =?us-ascii?Q?n0ekajk7WFB4E3vaGT3L527Qe2ZADh5ls9YBo6VbFeS2c7XjWTBgFoty3q9A?=
 =?us-ascii?Q?7N7JoAqeZxTK6SRb2ydC1W1OUSA+jBEb/L8fdZJVW1PriWXeFpYMZNM5B9tA?=
 =?us-ascii?Q?PMkSfyd/Ev+E1HOYBMhKyYLqqo6UP1JcDm6AziUFxwms9hkuijOxBiVw6hvO?=
 =?us-ascii?Q?OklewE9junckx059B+ep+PLKtjpsWhoDBDJE1rIrpxa1SvDf+T5dMTHBhOp1?=
 =?us-ascii?Q?upMuYLjh2lqdSYa7LNoDY55KVcpAv88Qjf75XIB0tylFxibbO0O39c2PS15B?=
 =?us-ascii?Q?Lo+yG7jfU7rQlFtpeGDTCQS5HvjvhwrzP98oHNaksk/aNYpnLwRAT/fKSptX?=
 =?us-ascii?Q?iiwUikBRB18HOTyrucqPTsSxTKhdqo0lr1pKazTXTm/xvBAqrV8T4rz397R0?=
 =?us-ascii?Q?GoXcwMdUt3JY357/EZFWhrydmDkPiZpvDuQXablI42zrUs27lx/ikeTRJ7rm?=
 =?us-ascii?Q?LRXH3k16MSO9vcTWWxgB7uWMV0YbG02gXfgUyghxKiTZty8UPJi+Hr22FxSD?=
 =?us-ascii?Q?d/BeKtAFbGNxa8nuEMcXJKtZc+MhGahwWPJVcgqpXlVR4x4V+0549fPTrtfl?=
 =?us-ascii?Q?QvU4PNhxOh+zlObmw8pYFKEk85bdtJ/l73XmIsMrAqhFlz/Mivq6eby3iLP8?=
 =?us-ascii?Q?A78bCWx+DLPNcqxOTVyNWZU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f33cebd0-7a40-4289-4fee-08dc2065086b
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:55:48.6240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 v202N+VDBcNo9YjxpJMgl+lyPJKZQ8fe45DmC7VfkfaEOJw2MnW2BXQ1hDW6SkBChADGEJQBcKrbNInzg4zgRyj9YsxdPef+wcMyF55F8BHeb0okDGon8XhuwzIn5j9t
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9881
Message-ID-Hash: ZB7T44PRRYSR2RS4NDZMTNFVSYY6V2NT
X-Message-ID-Hash: ZB7T44PRRYSR2RS4NDZMTNFVSYY6V2NT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZB7T44PRRYSR2RS4NDZMTNFVSYY6V2NT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We can now use of_graph_get_next_endpoint_raw(), let's use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  3 ++-
 drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 22 +------------------
 drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  3 ++-
 include/video/omapfb_dss.h                    |  4 ----
 4 files changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
index 7c1b7d89389a..c42c00850f0c 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
@@ -20,6 +20,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/string.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 
@@ -845,7 +846,7 @@ int dpi_init_port(struct platform_device *pdev, struct device_node *port)
 	if (!dpi)
 		return -ENOMEM;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_endpoint_raw(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
index 321ae18f2747..8aa2bfc2825f 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
@@ -15,26 +15,6 @@
 
 #include "dss.h"
 
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev)
-{
-	struct device_node *ep = NULL;
-
-	if (!parent)
-		return NULL;
-
-	do {
-		ep = of_get_next_child(parent, prev);
-		if (!ep)
-			return NULL;
-		prev = ep;
-	} while (!of_node_name_eq(ep, "endpoint"));
-
-	return ep;
-}
-EXPORT_SYMBOL_GPL(omapdss_of_get_next_endpoint);
-
 struct device_node *dss_of_port_get_parent_device(struct device_node *port)
 {
 	struct device_node *np;
@@ -81,7 +61,7 @@ omapdss_of_get_first_endpoint(const struct device_node *parent)
 	if (!port)
 		return NULL;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_endpoint_raw(port, NULL);
 
 	of_node_put(port);
 
diff --git a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
index d527931b2b16..d25f6575e557 100644
--- a/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
+++ b/drivers/video/fbdev/omap2/omapfb/dss/sdi.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/component.h>
 
 #include <video/omapfb_dss.h>
@@ -405,7 +406,7 @@ int sdi_init_port(struct platform_device *pdev, struct device_node *port)
 	u32 datapairs;
 	int r;
 
-	ep = omapdss_of_get_next_endpoint(port, NULL);
+	ep = of_graph_get_next_endpoint_raw(port, NULL);
 	if (!ep)
 		return 0;
 
diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
index 426d12881132..fc106aaa75bf 100644
--- a/include/video/omapfb_dss.h
+++ b/include/video/omapfb_dss.h
@@ -811,10 +811,6 @@ static inline bool omapdss_device_is_enabled(struct omap_dss_device *dssdev)
 	return dssdev->state == OMAP_DSS_DISPLAY_ACTIVE;
 }
 
-struct device_node *
-omapdss_of_get_next_endpoint(const struct device_node *parent,
-			     struct device_node *prev);
-
 struct device_node *
 omapdss_of_get_first_endpoint(const struct device_node *parent);
 
-- 
2.25.1

