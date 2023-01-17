Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEA266DD8F
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 13:28:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0FC56753;
	Tue, 17 Jan 2023 13:27:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0FC56753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673958499;
	bh=fZJdJcp3X0Dh9qSD3/iS5OnHpcKSxcOE2IHgLPdt+dY=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Y42MzXKmYdwBqNGl2dDBSnWORsWUusIk/zVOQ4laS3Ywbqjiyx8Gj+iCCGGuh8lGs
	 Y/Nawiulmwq3Ktw1wfkgGc9/6qLlDC+OVYwoqldE2EMVwgVqMCS0IG7WgJ6MCOd5uk
	 SG9ShhqWUAh3Pn+jZ6TWIILYO3wrrdINOfRYkqi8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 784DAF804DE;
	Tue, 17 Jan 2023 13:26:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16C44F80563; Tue, 17 Jan 2023 13:26:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2083.outbound.protection.outlook.com [40.107.6.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6EFADF804DE
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 13:26:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6EFADF804DE
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=UocqI3AU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBiwzx+mVSeYOvvObkVnaiVXVSQ8/K4BytMqH2WTYl59w4J+0leS65LeMBDZfNydAByBkEkFNRBpAUpPTqPaQBXFV6yWmWYmbyMAXWuZwyeTKnmXaIX9dHJCarSdk8dBARMOgm2fdPHAIJaThYuXVrb94GaauQqS/NIRfkvPhckd/pHmMpeV5hwpBp5/KMiflA+mPC4VQ7JBV3gT4KkDKUg9GWwir4lFDsFKaCuRyC+I+yYZFvKKKKklQFV5jX/PokIJXjWXQ5pd9X3hO3GHWVsuXPTptsNAsp1ES5xdZex9TGM1hxHEWUQy5bI0sMVLtHO4Sb/MfTL9lb5XN3qVHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y+DaoSxUIX2+lsSC2kZZuEkTeYNQ6OHDHZmZVrkchaU=;
 b=UM3DT2pKRFMfvkdR0GXh0r8t2VPcyaF9h5u2rIF+U/Z6lOTgN9kffRUcE2B4PeVaSi8oNtuhkTDm3P3/iC4xoUTNGB6GRvdA0IdYKQGgZrODkKyNN2IZw0g+P3dHK38TVNI/q+6aWoWAONgjdkWszRLGUQRU8ZP8XDZFiVAinDtD0gqGrjr+/0iZKpFrHUO4OstuUN87LAGzUbsuI7W7dHiR0VU+bw1x6rpJL7OIOZmbhHgTzHdIP5bKn6Q/8hfP5w5Pf+lLJr19yRsrDwS5LTE9u3DmkjRTlS+awMX6sA6wi4aiCRp+sE+8Cyjyy4ggCQbjyaNpjV8pv8xyc+nHSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y+DaoSxUIX2+lsSC2kZZuEkTeYNQ6OHDHZmZVrkchaU=;
 b=UocqI3AUhoHzW1uOpj0ezXsjUoopjP/arY54kDMeRZXu0abTjrqGVcj4MVcjv+pGv32gKxAgSLU3zaMduLmdrEu1m222VMdvsK1hsx8SHeHUpt+H4heScHqepkh0u00Rqnj5KW3PO6hvVDwlZDy9A6L4T50KY2tsKS4DVLrkLz8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by DBAPR04MB7240.eurprd04.prod.outlook.com (2603:10a6:10:1af::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 12:26:01 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::b6f0:fe1d:5509:c226%4]) with mapi id 15.20.6002.013; Tue, 17 Jan 2023
 12:26:00 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org
Subject: [PATCH 4/4 v2] ASoC: SOF: compress: Set compress data offset
Date: Tue, 17 Jan 2023 14:25:33 +0200
Message-Id: <20230117122533.201708-5-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230117122533.201708-1-daniel.baluta@oss.nxp.com>
References: <20230117122533.201708-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0133.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::30) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5151:EE_|DBAPR04MB7240:EE_
X-MS-Office365-Filtering-Correlation-Id: 383497cd-5ce4-4a6e-d2a2-08daf885fe09
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8SXBRQ0Cs64WzH+DEriEu32vhNqokiKgjfnrVnkp5OGMXtFwQRsxUJYOtbAoZJuRSbBicexzxQId1yfQg8nLOhdlzzKEuccvdiW+db4S0Jr7XwdUXL53PLf2XY9NiWQLm/qSO9EGm42Y8VW8E3ADTOsTgNHvvdBI4TwQ/d5tZUm4ggJDN/BMD5xTpKBORJiI/sO1a0VP8HMTp6olviOLGDlzKth8frzwTj3T+b+OCOCdCrJKFu80Zv74bKbdoR67PJcWa2zwvhmxB6tr/5hFkjL8mRa6MFYCu//3bAe/re2bbS30JqPiLSq9OK7IauVa5bVu1nhbz5TD1jbUXOVe4OQv33WuKXYrk1RmgUwAH+RVjYsWO2rgiAml/SXnfsAwJ2hrKosQFLRrAOvzgMO7fjOTlnvwACYStpro34GCxGAIWIwJHLVVoAPSMnImz7W1dLrDlbF6YaX7udC0t0a5JwNQw6neILkeAMogG1+tVR7o0cPeMTUSEzpgsbMFdUeZQYac7vtwfU//ZHS2xrAlQVIIjFhrKUpXxjKNWcQq8WDVhHdbJ+ASGTDgLNkOETovC4VsaIhm00JvQTOqKRRjEyZH6BfG7z6yIyvZQ+nPJgGrqmxG2TjhVFceyjMNQQd0hfNL/R+m78+JehVPEcwtkk33/BxulFjVEmtiOmkKKvG5DxP0DSeXS0VPaNvkqrSUh6SLJZMxecqHWaSwhCDRdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(376002)(366004)(136003)(346002)(451199015)(38350700002)(38100700002)(5660300002)(7416002)(8676002)(2906002)(8936002)(4326008)(6916009)(66476007)(66946007)(44832011)(66556008)(41300700001)(6512007)(186003)(6506007)(26005)(2616005)(1076003)(6486002)(316002)(6666004)(52116002)(478600001)(86362001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4nLnpavgwlyG61tnyyfljBNvUIzxx1fSjtfa/Uv4E33UBXH8q+tKh133QHRy?=
 =?us-ascii?Q?PjrhZdxfAGucNBILtd7k35QJ/HHNkIgdwr7fWtV2JaKBqUlbid+7om1AqIYD?=
 =?us-ascii?Q?KYntemzZ2pb2UhoQfF4tQ0BtzLEWV3Z6o41wOS+Pc2SovULhemnWOMVHpX6S?=
 =?us-ascii?Q?NMdMOieNTCi8uDOu8mqNTlNjkuUvdGFTAwj5fNNr7Z0+t76wk7Z/RjlXPxZL?=
 =?us-ascii?Q?fTN0ZupLzXaUEV2A0Wx57wfCa1t0SZm0Vedeb2Y18sgX0FA/6Zuu+ZPTIGf7?=
 =?us-ascii?Q?qSE26fQtET1pFIddsV+5+grjU7V21GvmAo9Pui/oLdS3F9XVLP7/+V8dEzb1?=
 =?us-ascii?Q?zW8QQsPx3fj0b9rP8wbn4CJ8BRZ6dm8bD9sr/YeF8vi7TXMQcIKqnE/ipCtn?=
 =?us-ascii?Q?beRwa4wkks8E6wdOW24Y5HKG8ER990j4+NT5f/R6vdumd3j+lEh0V8AgiASt?=
 =?us-ascii?Q?15Vvg3DkY0CR2JniXufzimuP677aXcnbhRL25lnvYk0ciaORAeDuOw5Kbd8L?=
 =?us-ascii?Q?KUj17hzY7V710XxAszFA4W7aI228fT1OIuh0Dx1QsJGJ6b7GXujYUTF1RyyY?=
 =?us-ascii?Q?mg1ThakFfYQtaonzxM9vnfF5fq4rK/yFMW0EL1QmpkclgXP6P9P64TlhWHB1?=
 =?us-ascii?Q?JnxFiZxLqV+ta+4gE17D7Q1B5X3UvrsjdohKMD+ud2IL28kURdSFoH9mvKa7?=
 =?us-ascii?Q?+rGsign9eewradCucL9Ycqs5bJmrK27yNrAPitRnYdSPgtUcUdylKP3slCSD?=
 =?us-ascii?Q?nUpvVP5tf6XUSRIsXFuBYSphQNkV8R11RPSLAX0LCILINUTqbv7O5e1a68Im?=
 =?us-ascii?Q?DXLa4UQOjoILu8NJxhyVQIGahal175f1BqT5XdIuAqHTPkQ/VDIzbKV2+uTn?=
 =?us-ascii?Q?2Q1Zpuc5IvUPj+HLQg7OQdowlb2BGBJuwJ/8Wx5QVLZL8BkbODWBNr/fsH5+?=
 =?us-ascii?Q?fDK5qoT3fLN7Nd0efnOkoZaBjpvptVroGqlwaUEGNbr0cOPhqcfLsjFHzCUR?=
 =?us-ascii?Q?Z19vZFqkYaItb26y/tmC72bFg0+BIFB3SXXPGH3llro6T5n1Z6URlMSutDTi?=
 =?us-ascii?Q?PsUgKG+ocsZNwHKNZvQw8cKQwOntzMipDmqq+un/JowN4SIjQV4+WB6aYeQi?=
 =?us-ascii?Q?D6aB/PZhLOP/KU/IrQCO0mmzDoXJbYkGmByEOpS/Vn1cYPTfzAea8BW+/EZa?=
 =?us-ascii?Q?Nv88+jAu/Jhp0sTdxYOWqh+7sMPhB0MtF+3sL8Ory9kG363Smxpw6QN/hoIU?=
 =?us-ascii?Q?PK6s7xZF6qUti6oEI+/6vG4H3f+UYJHryZswL92J6moIKOZGk+Vm1w6eVjqT?=
 =?us-ascii?Q?zIuaN1gtAckXh+D0kZUm7OMt+C20BH2SBV57FVYCppkPGKpLJxTZMiImg/R1?=
 =?us-ascii?Q?tbjgTgk4cQbGzX6I7qTFweHeir6WONYH/5SLbJfYc0G7lf/L7xMxM2Iu7dSe?=
 =?us-ascii?Q?/dz7CNguRXNVn5Xw/qVPlC7n8z/iKLMpBd6562sZ4MBrk/THMl6+tGp0G1BA?=
 =?us-ascii?Q?LWix4AaZJB+HWjg9YzzFS49b+cgrfHznPx5K7ybYLI7h0pgEwNk89zQ1RuP2?=
 =?us-ascii?Q?FRVjX8sQCaw8BaRSXhscW2/PwrXPfaRF6WP4aTQb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 383497cd-5ce4-4a6e-d2a2-08daf885fe09
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 12:26:00.4773 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YTCZiUOcigYWnni/Eg4bGHm/yNhlu0UGcWPSWaP7WisiIdnDs5QqVfSEkp9VxTHXj7qM+8uZjNtPiM0Bw7gE0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7240
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: kai.vehmanen@linux.intel.com, alsa-devel@alsa-project.org,
 Allen-KH.Cheng@mediatek.com, AjitKumar.Pandey@amd.com, lgirdwood@gmail.come,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 linux-imx@nxp.com, yc.hung@mediatek.com, Vsujithkumar.Reddy@amd.com,
 peter.ujfalusi@linux.intel.com, angelogioacchino.delregno@collabora.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Daniel Baluta <daniel.baluta@nxp.com>

Because now snd_sof_set_stream_data_offset has compress
support we use it to set posn_offset for compress stream.

Reviewed-by: Paul Olaru <paul.olaru@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/compress.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/sound/soc/sof/compress.c b/sound/soc/sof/compress.c
index 8e1a9ba111ad..8d205eb16d2f 100644
--- a/sound/soc/sof/compress.c
+++ b/sound/soc/sof/compress.c
@@ -10,6 +10,7 @@
 #include "sof-audio.h"
 #include "sof-priv.h"
 #include "sof-utils.h"
+#include "ops.h"
 
 static void sof_set_transferred_bytes(struct sof_compr_stream *sstream,
 				      u64 host_pos, u64 buffer_size)
@@ -237,6 +238,14 @@ static int sof_compr_set_params(struct snd_soc_component *component,
 		goto out;
 	}
 
+	ret = snd_sof_set_stream_data_offset(sdev, &spcm->stream[cstream->direction],
+					     ipc_params_reply.posn_offset);
+	if (ret < 0) {
+		dev_err(component->dev, "Invalid stream data offset for Compr %d\n",
+			spcm->pcm.pcm_id);
+		goto out;
+	}
+
 	sstream->sampling_rate = params->codec.sample_rate;
 	sstream->channels = params->codec.ch_out;
 	sstream->sample_container_bytes = pcm->params.sample_container_bytes;
-- 
2.25.1

