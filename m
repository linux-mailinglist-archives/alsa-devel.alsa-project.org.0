Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC583FB61
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jan 2024 01:55:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2E79820;
	Mon, 29 Jan 2024 01:55:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2E79820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706489754;
	bh=LNx/Y3XVBWXRP9qbZzJewNGqiMJzZV1/IPJ4MkOJ+mQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Date:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=GwUUyX2HVwAy83YkujONrT5rbzCzhOE4gY221THNm3WK0qg1iJrA5GSpHbul1VeTP
	 ciEtQKYPXApYhTtLkmW7x7MLjxyOyXpVPUPokc1wRJIilKRejIPyIAT9YWyUUWUjBw
	 UZYBpGbRtr5O0K4mVVu5dgfkwKEwgWodcxHC6ce0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A13E0F805C7; Mon, 29 Jan 2024 01:55:07 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFAA7F805E9;
	Mon, 29 Jan 2024 01:55:06 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 06C2FF80431; Mon, 29 Jan 2024 01:55:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on20700.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2019::700])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id EBC2EF8017A
	for <alsa-devel@alsa-project.org>; Mon, 29 Jan 2024 01:54:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EBC2EF8017A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256
 header.s=selector1 header.b=As+k2tb7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFzSTuWUHi3udeBp/KNy3WzOhZBvcc7TA9ghhq7kNOKb9cRuKh5OZJvyvMPNFPiHjnOf8hxvc4BO1Uq7qIA97LeJ2sPSOEAT4ULWj0gr2DabqSJziF9zzz9UKCYKOsB2PjQw6oGD95DBV4YHL0tkH4XYbQOfNSxznOWYBRKX81j9rN5wNP8lmwg9cCGtzZ7X1sWBBa1XWDMH2DJOO0kIjbhTcw52rGbnYOi9HQRCeRmvpuEyfoiRJbOA2slxWLA7LZypK6o6DLWpVBzHW+3kndQ0UnJNqslpyCoi53ZHzaMr2TN7hyFy6q7MKTv9z0NNXSrRRAuOxsufsqQkGBlkMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axjGkc8Pl27E4lkjlasY/HmMl0qJa/xeFIKmgqYuKtU=;
 b=AAexfejaf5e2DJXdVV21Xbk00baT1Ot24tnUbS1GI/tTc7mLBKe6Hk7qOLphhXH7B1Vp6tBuAcN3W+jWudVuFByZhal3FpBpMMLEfYOI+KwmeTB9zqG97lq5ZzBitHbRJ5zdoa3LVQBO9s/GIPxkEilVt6nBjiA9UHpzaQ84dLm867YuY4UW6boyQd/3U/36xQgFsJI1O0vRnJzqBFGEHwfVuxd8GcCq0+6yUNGrtqinLoBlK9dw7hr0mK36p4hlgaGqJ3cdkOwFB/j6ku8kezifo6zi6/P3s7AnsG3AmEu3X+ZJH+jhTeusG6ujUzOW2ZPRECY+rZjkq+RqPNigRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axjGkc8Pl27E4lkjlasY/HmMl0qJa/xeFIKmgqYuKtU=;
 b=As+k2tb7gIuTgJiSwd1A7Zz88l4wOZzOS4v94EsVROBgt2BWkTJpedHVAK5+aIH9LvZlwqeDZwZJiTfULCzGNXbXqhn45bePTbnA7lZ2/jVASDkeZyJb9iHI8v5hK09Km9FbNXwGScAW4DwbOs0WCTbwe+cFbvBRS7weedIMSJQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TYAPR01MB5996.jpnprd01.prod.outlook.com
 (2603:1096:402:34::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.20; Mon, 29 Jan
 2024 00:54:51 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::ce8:8f5e:99a0:aba4%2]) with mapi id 15.20.7249.017; Mon, 29 Jan 2024
 00:54:51 +0000
Message-ID: <87cytlklgl.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 02/13] of: property: use of_graph_get_next_port() on
 of_graph_get_next_endpoint()
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
Date: Mon, 29 Jan 2024 00:54:50 +0000
X-ClientProxiedBy: TYCP286CA0069.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::17) To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TYAPR01MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 5774b662-80cf-46d3-3221-08dc2064e62e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	bRZsteqv6I3csXjKS43LzmZV9G094ONp7YUB2EIk+s7VRN75afSG6yzLvS0cBvPWpR38J+jx0wE0lnaKwn0atcXBIp9d5P2me5LXHsCD7zv332JtIcEH4gLfzWHNkYevqHU8MTz4V74h1iTILvr3CDB0oh7bs2RCnEds73Lx9zTk7ewXc9234gDXGrWed9bNN7ScfWiwHs8W8V5WLMwiQNA8bwNXHhoxozoyFZPyvqoIaBWaZQfcq616fdfG+7Ffj40wENeTnEDtO7M/o2Bsbd//z5ZBjI4FEqOGjLQxoL2+/AJEAyQ0GzvwQY387esfYL24ehlzGNVRCBbeapsGLeXutj/V1CsG22hEwuihSzxyTX1VaGhBIdBLRdJPfsmwfb9EwyNEWF6kWhQCi/Kw0FKKcBh8ocjKzalrBbGae508OOdQffl91tKa8bQEA1hD3r2GMXx0ErPpo90IYfvrWH77R8SC8LOpuPswKiHFreEz9m3gXcbOJna0x/Iiyiu8opxMMwZf6YwqXnvcRwuSr9eKdVgu9QpyzCsVWxjrrotwm8O6yUZ3Fp2AvbhJbmn/1DXL2EcEgKDQwcYAUuqFOJFtiMcEdgG78UHtz1QTmgbbeDX3TIix7kIfKfD8Kqy6
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB10914.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(346002)(396003)(39860400002)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(83380400001)(6512007)(7416002)(6486002)(5660300002)(2616005)(6506007)(52116002)(478600001)(26005)(38100700002)(4326008)(8936002)(8676002)(41300700001)(38350700005)(36756003)(86362001)(2906002)(66946007)(316002)(921011)(66556008)(110136005)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?5r0BsJGiN+VW446Ou1PjZFfFuyyYFWf8gIF/kP3eHJ1DBzCQ7rIJfL/cVb3G?=
 =?us-ascii?Q?G2HaGQ1T63znONxY92EusWbTGfzGpGvtaw2LokDE2uIuypVwa1K+OWBTojSg?=
 =?us-ascii?Q?BFU9k0wsGnW8tt29ECJ63mGwc5KJ8O44s/PosLQqPr1ppzwHgKUPcN9LglsG?=
 =?us-ascii?Q?Dbv5Kabjvj5yX5KN3YNpzaY5/iGZQHwDlXZWzIZDY2XCxOdWrsS3DjXj4xXE?=
 =?us-ascii?Q?ha1J4Y6pMtmSt1thoH2c71uCvvFI5fQ3N6U4d4xx+qhlcSYZAH/h5mw3p2q+?=
 =?us-ascii?Q?ZJKO2Eesd382SYnL3j19wH7XH7mmFAMsfqnkHGjUQkUMSXd+aoQrOOM4cNT1?=
 =?us-ascii?Q?lVSQ7VkizZAPpnFMhEGiSEK+aXOMSu7qinwzJNuDlX070r85xTvogW7kzPxl?=
 =?us-ascii?Q?/iwSAup0TR41TfnVLe5P+ujsPeZx8x/UVI7MTeQVxM2l06mrOSd7ANFVP+PT?=
 =?us-ascii?Q?m8XFashvKYAtD37M+ky2fjVba3ea7IziH6e87kRb/r8cjgkNu85yX3F9gSaY?=
 =?us-ascii?Q?qDlrHfX0jB9fKKXuarQSfjyaSAWkfZzvbAnQsf8JNDszZoTkwZgh7lyI2l7U?=
 =?us-ascii?Q?M5fNAhFZL2O6A8ALTRYZGn3Q9t4XVcthFxE3iitIK4J8fJkiC56FDQc8QAp/?=
 =?us-ascii?Q?pGmhMt4CUYAtnL/3OTAwAygsgZufMFZJ8MtuEqFdP4NYiFdPl2j3uSP0Rc7M?=
 =?us-ascii?Q?Vu6AhuFfsa3Y6lYUNTA1ia+t9IwEJY4tkqaVVz1te1ndDYn3hLk5EjPP7oRr?=
 =?us-ascii?Q?IxypXNcMi0lLohwj+iiqXBkkaw+Snna3bQB5aL0mHhS8ycKGw9wEW6/QapqL?=
 =?us-ascii?Q?akYkrV4a9kPU0MmjjEuvkAusHdyoJ/CCP/haMpFlpScWilprwSUzu0IG/ZbH?=
 =?us-ascii?Q?ckcydANksoWIcDDic0dT8ldeYeAxWCuNMPOCsZ9cnimjcO/CNpInVMe09Kic?=
 =?us-ascii?Q?xNwXCwkbDW2PXjuA8affGo3n5yeRK8ldXRUdE62SGf9+8ccfOPBZQyLezcGp?=
 =?us-ascii?Q?wO4WolQKGiGxqCEm/OZxz2OEMYRzm+AEarIBbXHO6qCfvYqUpNboPgdHTl5/?=
 =?us-ascii?Q?mq6frKgNJaFM/wjnmxHRs3lCC03HHCcGD+qM1mVpUqWCZ33YW+UgsFzKhH8X?=
 =?us-ascii?Q?UYtbvbQ15Uvuw3E+QoRgvIBrGkq5FEqZn9rL2Dm6xJqH+u2MBkA7JAhd/uQ1?=
 =?us-ascii?Q?8f3G2s0y/dxgUu20u/mYS/zBr+QuWht8/jQsk1q+78aRE04G+DgEcB7zAQgU?=
 =?us-ascii?Q?aTSUARbHAL/2MuF5GODB99VFErfzAGHkyCT4y+H4EAk03ZZ7ly82WN0LbfWD?=
 =?us-ascii?Q?S/qlNngEh8mB91/IcYaYj00FTuWPGC6MPbz0n4xtYMQOEXyCQq/QLTaaKn7C?=
 =?us-ascii?Q?nFRSqB1qy3hEkh2/JJoH21HsmCaqn2y5q+ezHk+QxmWXZqWLvJrARNGYCIwA?=
 =?us-ascii?Q?ebbeAno3OEcukS9BBMYFNgVCHOQWQ+cPhUBKgws9RjQUsov8DAXi1PekEoit?=
 =?us-ascii?Q?bYx5FIvWFA/SK+tehIiZmUMK/OufB6vXQa8KsR2yIQaRId85Tsp4pSXOC+3u?=
 =?us-ascii?Q?TyVoXjcqgJ0XN7gdlCac62zrsor1MQPUZdimSqBW6R6zMfvK5GYIoi449X9v?=
 =?us-ascii?Q?YOMdUkkYyc5CvMbkoWtOeew=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 5774b662-80cf-46d3-3221-08dc2064e62e
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2024 00:54:51.1567
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 NdrMwULPldTyR3UpCM9+zWe+Jna7BOIxCtgVIbRADzIJvl8b2VgridhG+/JjJgqLk5kFgDz+hmMm7HIFj+keiSLe3B9pRPoGCwJH42POCGTb+c7mKy1gCmkQQLQctAQ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5996
Message-ID-Hash: FRYEG4UQVZLPDHQKUIVTLVHDU6QA75CE
X-Message-ID-Hash: FRYEG4UQVZLPDHQKUIVTLVHDU6QA75CE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FRYEG4UQVZLPDHQKUIVTLVHDU6QA75CE/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

We have of_graph_get_next_port(), use it on of_graph_get_next_endpoint().

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 drivers/of/property.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 9e670e99dbbb..14ffd199c9b1 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -690,15 +690,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 	 * parent port node.
 	 */
 	if (!prev) {
-		struct device_node *node;
-
-		node = of_get_child_by_name(parent, "ports");
-		if (node)
-			parent = node;
-
-		port = of_get_child_by_name(parent, "port");
-		of_node_put(node);
-
+		port = of_graph_get_next_port(parent, NULL);
 		if (!port) {
 			pr_err("graph: no port node found in %pOF\n", parent);
 			return NULL;
@@ -725,11 +717,9 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
 		/* No more endpoints under this port, try the next one. */
 		prev = NULL;
 
-		do {
-			port = of_get_next_child(parent, port);
-			if (!port)
-				return NULL;
-		} while (!of_node_name_eq(port, "port"));
+		port = of_graph_get_next_port(parent, port);
+		if (!port)
+			return NULL;
 	}
 }
 EXPORT_SYMBOL(of_graph_get_next_endpoint);
-- 
2.25.1

