Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F58F421F5D
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Oct 2021 09:21:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7F721670;
	Tue,  5 Oct 2021 09:20:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7F721670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633418491;
	bh=uVwGbaw/OWv1+3wEIxNkKRDW9AoxJ984JajcqyveMgk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nLz8l3mtkFlUhYPbb/6LGu6Ur65Q84zpWRkBLSumyg03QDLgxpvYLDOQNB8eWgBEA
	 2a/NYgRpvgxpFmmLBROoDoCkMhEccHhLaNih0KlzAIFulQs3xeZdq29gl4YzB8sJnf
	 lS7+0khHvlIzSWmWwFcmBE7vR/RsWOqJFbzytYQI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03EAEF8010B;
	Tue,  5 Oct 2021 09:20:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 67B2AF8027D; Tue,  5 Oct 2021 09:20:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr10069.outbound.protection.outlook.com [40.107.1.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 772CFF8010B
 for <alsa-devel@alsa-project.org>; Tue,  5 Oct 2021 09:20:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 772CFF8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="kgytQJaJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hf13hbRNWzwHvVs/OKl6QCoaz0ZBz/zW+jCoAjURnDIBR2yH9cOyCX6WzYHJWdYFU1RfVVNxXDADIMRAPfxGQvRnbXkuwIypb/72/x8HJkszguilXu4rNyjNYhSg2GFgmO/NACUT6US3iX33v8xHR8pR3V3uFdsLCTrtyr5/Qrt074eWOUs2J1799YrQYrDkI/gD9eFKH06aj4S56eOL7MCThst4o/TxpFGTX2yTuAuCALR0GG/ItJA7T4ymg4Fkm9JzLye82mnsZSHq2xnMiUWpMYZPydl61v+4Wi/cW3yFYGxWFuW9pa67RAbW/7w2m8XlwRgXwQAv7oAytMLMOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rxiBQHUgK5Ng5D3d27ePwMD63gAscBiwWkcT3+DRaI=;
 b=m2m5R+DOREXEMRzkEuvQe48Lwa64al6pf29wvCA+Ir5nvRUiYX0c/ukEwb/sv63+nE25tBHH8X6dlvwpGbn36T1BUkgMHmG4I7oQGWRIK3gCSCWfu9q4bzaEQmXNyuoLA2lWF+Ryjm5UwOv1RojdEEjgj1igNFxPglsrDRtNByT7o4zmrfOeisvAEKbgpjpBhpHcBGKY+4uxV25ORyT+KW1XJkngXaVumwqyIxqgeX/4F7IHrcWRSAJVLwSOnN5j+x0qa88Jgvxl3liV9J+9N12b24/vzeMBMBV+bpkX1+QlORiNUPpwWVwEbgTFBOiDMJbPbPbaFd/bB6AkVVY2Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8rxiBQHUgK5Ng5D3d27ePwMD63gAscBiwWkcT3+DRaI=;
 b=kgytQJaJga4x0d0EGnCyhekmr5NiDs1nn0ijlSV1veDp174GXjOLV4qT89O4b14wbK3NNbaih+/lortJ7dN/ZTXLrqusUPLhasnt/2z5Nbz3Ar4OTa+KSEcSylASs/qeOvuEgoC7D2dq77zTFavtrZBUm4jzxYyRKTNUd3/z3n4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0402MB3599.eurprd04.prod.outlook.com (2603:10a6:803:2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22; Tue, 5 Oct
 2021 07:20:02 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::9968:6eca:45c5:8af4]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::9968:6eca:45c5:8af4%7]) with mapi id 15.20.4544.026; Tue, 5 Oct 2021
 07:20:02 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: OF: Add fw_path and tplg_path parameters
Date: Tue,  5 Oct 2021 10:19:49 +0300
Message-Id: <20211005071949.1277613-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR09CA0151.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::35) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (5.12.247.65) by
 VI1PR09CA0151.eurprd09.prod.outlook.com (2603:10a6:803:12c::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Tue, 5 Oct 2021 07:20:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 104b5e2b-5bb4-4aa5-b902-08d987d08c19
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3599:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3599565664EF57F9D1095092B8AF9@VI1PR0402MB3599.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1417;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cY37YGfN75CG83UdB6keyAkqyylPHEPJCqwvrowCtW0AmQklHvee4dBfS8Oys0PtY3BLS+t/8ViFHpjf4Uj0U5zkZwKA0dKM/YRDWtRViHi3O6v5cfx5jq2rxO6JHbDVcpfG5dghZm9urZW7huuOsJ9OT5zn7l7dWazNm28Iaft4WyDCz8H+9SzwvkHklFTckuaJKydtCsZ28FSYwdy+P0vRvRIsp5tdoIt8ejHWW6OLjt2RNVy6Cuo+T0UjdhWzyMyl6U8wJupGcl+5d5Aw065z33hSzf3WxNQ/awScxOSIk4yVe534WWL4qZ5bt7ElGMJiiYDMRaGrdPCPB2IUzAoavMG382rISLakI1/X5YUwtnngBUv2/Aml0FH+NkPllBt+RC/zU7V/3f5bvglhR56mhP9mD72Yb0aZpHE/uQazUDLyo3EkAyoceJ1QZZ0yFWgTfoznTiqa/R9M1SjQUb9uHblLCm76KBMBg0WIexd6QVLkev9pwr3QBtCa7mtzcCgZB591d051PNwtWemICWLqIUd9BEBY/Ybt1cUmCcEb1+aCxAn8mfH4eqKjrCEFBBiDRXEFsiTMhVKkWVIN83iNVqHjUsqDQN+7t9ZIBcRjGECb6Uu9LLCouwNL79TU1OgYaBUj65b2EzJzlFR3Gt12LjxfDkuY0LcHoc36YHyeuAKx0uIoFQriqV8UMH6YF22mjB6VI4aGcbym+snT1g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(86362001)(2616005)(6506007)(956004)(508600001)(186003)(52116002)(4326008)(1076003)(2906002)(5660300002)(83380400001)(44832011)(8676002)(8936002)(6666004)(38350700002)(66946007)(66556008)(38100700002)(6512007)(26005)(316002)(6486002)(66476007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mk0jZpI3DNU4VU81pWMFOXPPJTC1003neF5Ema2gFGNS5BhFg9hcDtjbIojf?=
 =?us-ascii?Q?d3QPZR1YwC27FB6vXBrLgfvrA2MJKnVATWtBp/uf2JjXp6n14l9+fSQWZo8U?=
 =?us-ascii?Q?/ZUM1Js6hN9oGadTb2WmDqQ7+o5GWSsabUl3RcWgX//+4u/CB0SmW0E2VaEd?=
 =?us-ascii?Q?/a2wH3OJtBbf+Fq4mI/4RpESPc6ZAfh4lqxGVdhTlsbFJVk1PD1zxNwV29x5?=
 =?us-ascii?Q?3kq+dtx/xSEj8wrZNQwqY4iXHAb1z3xGWDfUgDU8QyKrGwHeu9vaOFvwFYaQ?=
 =?us-ascii?Q?DbAFt2qbz0eJSVhyTA+lmCvWuHe+yUFBl5wXyn0119sqfC+Fq8C7HTg26ZrZ?=
 =?us-ascii?Q?uYxXOUN2ABhZlHsi+1ZqpOy4UM3HvmybfZHxuSDuYhepSKjbOC/RAHXH81mw?=
 =?us-ascii?Q?Piz6oPQismVqiR3adHXUqyjXoQTGQBy0qapAOdQQk16ZoA77olP47bUuVZd0?=
 =?us-ascii?Q?ASiuf9ZZlNV4RsWw7tMfCO5KHgc/DEbSndh6mxqMBQ1LrLkN+p03MXZLx1Zs?=
 =?us-ascii?Q?1jeH4ykW3il0GGZxygYdnXX3mWnqGKYfQ6SNVeVQKXdUqZ0O6dzVurGzAEMs?=
 =?us-ascii?Q?XkaHfkPr5eCe9TdQGCIijLMpZctQ7/kSKDoSY1tK5wUAyDza3MWiELl6YcCy?=
 =?us-ascii?Q?AHZESOn7xFvChegWm22kGX+PKHOR71u8ipPHeM9WR47bp1VshIf7wGDgo705?=
 =?us-ascii?Q?vVMCatPp0MnNl+EtEFeCO5vlKzskeMGteVyEk0ZcxnmJUgHOV/i2f8lPxwV9?=
 =?us-ascii?Q?sdTBKSOTruLxun527sZFb+od13hMKYqGfXRXhe5hHKxA8Kjtyjzl62xTCsQP?=
 =?us-ascii?Q?prss7qwa+QoYjTdIvTZbndY6dHKAK2jCek9ipqk30pNXeNV8GPHu9MI2tVUQ?=
 =?us-ascii?Q?/2ip7UEtPTcK5uh+iZ/6E7ZI8+BwwVR5Lty+tH4nkuMsDg2nXAisdEcLg+9m?=
 =?us-ascii?Q?3uSB99B9Ado3pIxukWWdz2NYRUbtLroDU0lbEoGp65DIJRlxVhkQk5KsK2RP?=
 =?us-ascii?Q?Nw8rJ14H3a4f3JS3D8jm4c/xCEALkSukuzMrSBFYTddYg1n+1ZpKDctHu4Kc?=
 =?us-ascii?Q?osyBHhJsnhXkJeSvUz7PMY3hMdksXeYHpGGYVEnkRkJPwIKbBy6SXZ5Tvtd/?=
 =?us-ascii?Q?pdgK0B+u0LGymfqjkoP8OtyHSN87xgQHzKNjELt1DNhyUBR0hi0vaP+D+qT9?=
 =?us-ascii?Q?naeatLGocuuf/nEknsk6iFKqudot59jOXYm8ZLKVbyotmu1CAkQheFAXIFYo?=
 =?us-ascii?Q?rjE7VUmhFixDtKLG66bhN3fVy8BP1oWm0zLaeeT9zBhaDLHPQPBRGVE23vF0?=
 =?us-ascii?Q?A2D8N2htRBh0t5POXk2Oqsfb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 104b5e2b-5bb4-4aa5-b902-08d987d08c19
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2021 07:20:02.5987 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LC4tOiLTRw8czqw+3QWVMl2KZ9Bxgfmf6cgGAsoi6u8pXlf9EyCR7nO1vwy+wC3HGVHEMrnhuJK2gRHCwAzp1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3599
Cc: pierre-louis.bossart@linux.intel.com, kai.vehmanen@linux.intel.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, Daniel Baluta <daniel.baluta@nxp.com>
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

This allows specifying an alternate path for SOF firmware or
SOF topology.

This is particularly useful for i.MX when running Linux vs Android.

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/sof-of-dev.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/sof-of-dev.c b/sound/soc/sof/sof-of-dev.c
index f0f819a46456..885430a42226 100644
--- a/sound/soc/sof/sof-of-dev.c
+++ b/sound/soc/sof/sof-of-dev.c
@@ -7,12 +7,21 @@
 
 #include <linux/firmware.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/pm_runtime.h>
 #include <sound/sof.h>
 
 #include "ops.h"
 #include "imx/imx-ops.h"
 
+static char *fw_path;
+module_param(fw_path, charp, 0444);
+MODULE_PARM_DESC(fw_path, "alternate path for SOF firmware.");
+
+static char *tplg_path;
+module_param(tplg_path, charp, 0444);
+MODULE_PARM_DESC(tplg_path, "alternate path for SOF topology.");
+
 /* platform specific devices */
 #if IS_ENABLED(CONFIG_SND_SOC_SOF_IMX8)
 static struct sof_dev_desc sof_of_imx8qxp_desc = {
@@ -87,9 +96,15 @@ static int sof_of_probe(struct platform_device *pdev)
 	sof_pdata->dev = &pdev->dev;
 	sof_pdata->fw_filename = desc->default_fw_filename;
 
-	/* TODO: read alternate fw and tplg filenames from DT */
-	sof_pdata->fw_filename_prefix = sof_pdata->desc->default_fw_path;
-	sof_pdata->tplg_filename_prefix = sof_pdata->desc->default_tplg_path;
+	if (fw_path)
+		sof_pdata->fw_filename_prefix = fw_path;
+	else
+		sof_pdata->fw_filename_prefix = sof_pdata->desc->default_fw_path;
+
+	if (tplg_path)
+		sof_pdata->tplg_filename_prefix = tplg_path;
+	else
+		sof_pdata->tplg_filename_prefix = sof_pdata->desc->default_tplg_path;
 
 	/* set callback to be called on successful device probe to enable runtime_pm */
 	sof_pdata->sof_probe_complete = sof_of_probe_complete;
-- 
2.27.0

