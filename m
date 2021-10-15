Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E75E42E734
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Oct 2021 05:25:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A58F7166B;
	Fri, 15 Oct 2021 05:24:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A58F7166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634268329;
	bh=NCTGC8ed9kac3/ufR1lusF4GMfzaRp4+5JTQyJnjD5k=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S2QCl+maduIPgoaoNd6mdkgIC1rRf74XJFl80cZdi8raWx4jXEMXYsnM/08rEqYni
	 Obweu2xLyIv/6pSoXeSLvdpntrFHeGt0cfVxAwo1FgKMNp1p1J/5n/oDl0Ifx4MJY/
	 /sjUkc9pGeD3rHsUEun6xok1dUNO/SSWx7NpV/i0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1D1B8F80167;
	Fri, 15 Oct 2021 05:24:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 06644F80269; Fri, 15 Oct 2021 05:24:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from APC01-HK2-obe.outbound.protection.outlook.com
 (mail-eopbgr1300104.outbound.protection.outlook.com [40.107.130.104])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DE3EAF8012E
 for <alsa-devel@alsa-project.org>; Fri, 15 Oct 2021 05:24:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DE3EAF8012E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=vivo0.onmicrosoft.com
 header.i=@vivo0.onmicrosoft.com header.b="PZ2KfZOG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQVjG54TqkIl+nPelgGPaRmup2RGWY6fvE3ZSDWcwUzgV0jwzuBCbQtBaA3B8qe6K5IVv/ZEwEesQibV4HC2sq2CH1GPAL/PrHqww2+6y1tvjVLoECYC0rbQSMZfn2F0a1uPTTz5MDLMWLX515Orq6VA9wwSNea1d7esfJZDzE1wZGB5obm3LGkZ2DHEC9rCkY1J9dbNa+5TwsQORBcSy6twwlq6poO08BYRMvWIPAgwofNBJWJLW5COxeKSu9UT8eD5uSmD0HvdqS0aeKyISx+24Jz5JS+5cW1Xx3axUZklZ81HGXpaKdMiWXp1OUYUI5UY427jZl0nH4PXz05eEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cW6ax0p1G1cwJsRZpqcEyPuJQ/7WSFdyM0bT0RIOwQc=;
 b=m+N8O51/5T2LnY0X464LHPomGGdzZ+fRRTK97Zc7DhJv18VLn7P5XUWG/7uz5RVFKPReqmFyHmViJsWulHFjgfyjcOueB87+xUndOVFmxf3zSJ72OrYiJoIMXXyWb9ONZ6I5d26RM6Nx/1no9BJga2POwiv9cU2GLLv4JVtHrTiZ2Ji4EqzCE/PGZlB31W3/Wdy/jWCLi7wFTyTmMgvA3RqP+Y43R6S8oNfPOtW6NPz+HZWjLvRIFU7QQxf+1f44sJzQxHz0PbMuJZSGwwtNQR4JXKlGD9sMxKgKC0fN3krGp1TUs2njvFbachkMjYi8wjUsvGCcac6zEV+ZVIZSbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cW6ax0p1G1cwJsRZpqcEyPuJQ/7WSFdyM0bT0RIOwQc=;
 b=PZ2KfZOGwiUCFwYjQtc4DsmaOt4yEVlF7eGZ+KuIYS8PjXffsUZcA3gqs5NiBFDbE2POg0oS7DWOMdUpFiu5ilf1IVKaT8gjugcexppZLTqD8/hwwmx3/O4broEJR1kxuh330VVT2R6CUM2EN8oBefHUQZ2si3hGPb8Sj6Pmj8U=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com (2603:1096:4:78::19) by
 SG2PR06MB2859.apcprd06.prod.outlook.com (2603:1096:4:18::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4587.20; Fri, 15 Oct 2021 03:23:51 +0000
Received: from SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0]) by SG2PR06MB3367.apcprd06.prod.outlook.com
 ([fe80::fc12:4e1b:cc77:6c0%6]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 03:23:51 +0000
From: Wan Jiabing <wanjiabing@vivo.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mikhail Durnev <mikhail_durnev@mentor.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Wan Jiabing <wanjiabing@vivo.com>, Joe Perches <joe@perches.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: rsnd: Add of_node_put() before return
Date: Thu, 14 Oct 2021 23:22:10 -0400
Message-Id: <20211015032305.3771-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.20.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR03CA0028.apcprd03.prod.outlook.com
 (2603:1096:203:c9::15) To SG2PR06MB3367.apcprd06.prod.outlook.com
 (2603:1096:4:78::19)
MIME-Version: 1.0
Received: from localhost.localdomain (203.90.234.87) by
 HKAPR03CA0028.apcprd03.prod.outlook.com (2603:1096:203:c9::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.10 via Frontend Transport; Fri, 15 Oct 2021 03:23:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 861b0a24-afb3-46ed-5d2d-08d98f8b351c
X-MS-TrafficTypeDiagnostic: SG2PR06MB2859:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SG2PR06MB2859677D496D90F9E6BD6DE5ABB99@SG2PR06MB2859.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OUmeqCilvSvIjnAsk6ysjkH6+G8CO+7CDmDOnUceJPUAkbQp8TkediXOaBGzlRX3aAexGcb7qT4G1ODr3zSkOGejgL00FlDs6Q479CkuXXSS2SAQLd7Op/uSNM4gUniW7B+4xafQmTCHRd45Y8tFNbJJVNGPVac5vZwt8t5C5q+T4m1fKPD/Xzr0pgVTTKt/AmkcLBbsn+rgXoayVwvqA4u0bWBcunIfOBRfToHtxWKXVCDsXx37sRu3zZm5ocnLJcBzsNesviXeCxXKhzSRUoPQZNLbkSOSroe/NoA2b46pF5LXQIFikglfOpl8Pop64KV4X7wPpp+aP7/ci/6+jjCLSiLqL8GDTAsXXqnl6h7QFHJcVcoJ6VO9o4KWvN7whFLualtGoK+Fzthn3AWEQHEdyCnRsKv3xR1eC748QXL4hcbyAAxvSiZw9dXZuhS1+aGvkt3djWp6yBzDztSJftb+nlqlUL/RFVxSRvi/3ix8JpHR8C16cFUuBLeE/93LITczrKCCKiR1kRJb4Yw2jitc1zfEE+HQwCuSrznlF8A/PN3kPUgaBJPact7I7b7E4MjR4ovW/AjmUXdnQqZBKbh+vH6rj9Ejw7sFT3uRRH1YFQW9t8gwvqrtDUyWlHjbUE9sfvb3HRtD6SizSZ2mLbhVxRAMtlMiB1DttqV4cAlxHHbRD8mwOFMA9oWY3isO17yBfbDlvrVwdrNbjxZMUA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3367.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(83380400001)(4326008)(956004)(66476007)(38100700002)(38350700002)(2906002)(6666004)(921005)(5660300002)(316002)(6512007)(52116002)(1076003)(66556008)(2616005)(4744005)(36756003)(6506007)(110136005)(8676002)(86362001)(508600001)(8936002)(26005)(66946007)(186003)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OIjxUlV4xYD7xPuwWPpM+EQCt8H8I5M36BDoOPM9QsGe/LP1fCeIxflLoM1H?=
 =?us-ascii?Q?T+NUJvOFdg8Mubds4Uu3JLG870QGp2wxQOtcnxJhnjbodKD+qkP0lD1LrUHC?=
 =?us-ascii?Q?BHv99cwBtLZQ/dVqPT2hDGS7LJzAB2nlUQeEYuz/fM4O5aQvAMO+IyK6kAjF?=
 =?us-ascii?Q?PagRwoNLetnA3DSHiXsTNGTn2T9s/RdR7RkfR5FVSv1VUxcD2qA4kI9xHezK?=
 =?us-ascii?Q?SL3N1q/IOK+sV1YqZ6dS0NtmhFhHuBga6wFYRZUYSOoXWwWxQM2+6VSKkQnf?=
 =?us-ascii?Q?qcLqKI8cN553HYaIlfoO7Le2cLfgfrBBBZPm3AbRoUjOJDdQuq1yOhie7JrL?=
 =?us-ascii?Q?TA0jdPlK1qPqYzu1NO0+XRPo01oSebHyIRytAugicu6XqplVhePYUybCSePD?=
 =?us-ascii?Q?5+kFPkHAoHUFZOqWbBmuNbLJifo/7eRdWtJPLQoCY/elkOf/j5u6y+jJ9nXN?=
 =?us-ascii?Q?PK1ha69KJB5ZOwJcIJtk/qBHSl9/ojlZopnXs49wKldS0a/ccBwxV1ZPEgzw?=
 =?us-ascii?Q?HDN2aCeqMZTyf7l4rxiHnF+x3UkuctSexjC1zebuJRt0Bu97WUQYeshnkzKz?=
 =?us-ascii?Q?Tf8sjZW8wS/36/fOs/BuOC8IJF9LSp4pZl2B761Yn5qBdvLlTvtjvX0pqalJ?=
 =?us-ascii?Q?5woqTvjfAP3jZWRbr5l41r7pnPCnE8Ai3M91p+K2K9BrVniIOdBofo4xHSLr?=
 =?us-ascii?Q?sIri6p1hrgW35axmueDrJAthfSk59nMlorxQDNguTeJRl7WHxU+jY2IT4OtI?=
 =?us-ascii?Q?M/MUUfcG1KZkniCmgQyVcOB1Egiv4qLx/1zszlx6ET815bX2EzdcvLYRJqxg?=
 =?us-ascii?Q?cn0bN+5pkiL8ZHj1L43d2DsLLAftomAg09ZQx5ey21h9EpNtO86bMgiHT3i5?=
 =?us-ascii?Q?Kc9Rn1+SgHH0dSWy16xt6gst7IMiQX/T7PU7Sg5lMSo+pQXmgyX3lZoksP1x?=
 =?us-ascii?Q?3uOoBDyejLl7vcwWy4zFIVFhwD95G9bbqxQHp8D8BC6mE7S8dyNpZ24thzj8?=
 =?us-ascii?Q?F9jbDKBxbXh0FdYMQJcM2v+AzO86aUcTgsQ+rw3gMnK0DzBuGSuYkycFVMsf?=
 =?us-ascii?Q?MXnB9fNMvBQHmrUPVJZwKo7J/qh4ERjcUqtJut/42lGaB8vtzrRzspDvnfCh?=
 =?us-ascii?Q?rlotaQK8IzYpIEm+CLxhE0IhZwl41QVXzAjFIEWqVSL2IkECjcamXAGwgfaU?=
 =?us-ascii?Q?W2Jd6ku0DSqlUOcU0SgiYe7yj/dd5p6i/Tf1zW/EoahKLUrte6TmJD84P5NX?=
 =?us-ascii?Q?wPAfjkkpwzmp9llN0Lu1PsH/IgncMgb0pxJCydGiHGvhyDKd+kh4cRl4IW8J?=
 =?us-ascii?Q?SsZ5uVxHW61/gWVqBzLoxwGa?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 861b0a24-afb3-46ed-5d2d-08d98f8b351c
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3367.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2021 03:23:50.8200 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jnGtCienE34ObXwy7jBDq0pK5DtWWiAmI5gz7NOVp0L7NgFH+p2q2+gC0aSkYjb0E0QabtKTohtF+hCYvzXuOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB2859
Cc: kael_w@yeah.net
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

Fix following coccicheck warning:
./sound/soc/sh/rcar/core.c:1223:1-23: WARNING: Function
for_each_child_of_node should have of_node_put() before return

Early exits from for_each_child_of_node should decrement the
node reference counter.

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 sound/soc/sh/rcar/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 978bd0406729..6a8fe0da7670 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -1225,6 +1225,7 @@ int rsnd_node_count(struct rsnd_priv *priv, struct device_node *node, char *name
 		if (i < 0) {
 			dev_err(dev, "strange node numbering (%s)",
 				of_node_full_name(node));
+			of_node_put(np);
 			return 0;
 		}
 		i++;
-- 
2.20.1

