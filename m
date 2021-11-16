Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8E0453258
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 13:43:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 359371671;
	Tue, 16 Nov 2021 13:42:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 359371671
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637066612;
	bh=wCIGl96h8mHbKisbRlPFrjktDU+nWkF2MLaHMrP5S8g=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=HGsdZCd6CWbbsGCco0/rVJZeEYTTYPO5Q0ukKuMo7Tc4xvqeQ5YuFqIFygdTi2ImS
	 DHlnlttEnJsFUJ8ST8kM6rZda+sdtquURg+yp1Och0C3F8Mpp2WUZOVaNOcgDS8ICi
	 8GzcTdilCbQXM5a2Ms373y7XAJBpSOvrrwLy8yBQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BE68BF800FA;
	Tue, 16 Nov 2021 13:42:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2FB6DF80272; Tue, 16 Nov 2021 13:42:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70042.outbound.protection.outlook.com [40.107.7.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F999F800FA
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 13:41:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F999F800FA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="A1RTTXM+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6kQocDWMaChejuaYDJwazkjkDwGXfa+tytOFhXZSZCoqPp2mP/KyOBspsLfyNyrB8jYlQMeWst3TU8r37+VQz359LKNd49Mt04TEHqjw5QOhdDGXUaQgaq/VXEayiiacNXwhU8ulY+rcarKCeW5Lw6VlqBCLST/kymvWD7JBSZ+25NfNkGmTqxFZSvdnzyhVCiJnFCfgMgd+s3aXADZf0fu6TwUo0vIP/eb+aI/zA7+cN7HFgQA9VHV9PY9ev6GLFzIPPNoCjS2m8lhI35/azqyVyMFOArZQRcgXg8mvJRol23rHT6+177YmYTSwwCzV33D9mIQ05JRoO2q6eFBhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uF8VYUKlCXOMIjd0vKb1ydDlfE2KatTZI8ul1KYId8k=;
 b=Xs8e8uzoPqQAqRrYNpfaPW6lWNb555PxS0b2IHuDabYEd8b/pFCWyJVvHCWLftkj68ZoDiSEoYZUeKBahcAKRN7PbHKDpQ+FUzIvcN/h2TxTT7BU9G8yJW+2/xIRMhYPzE9e+YMKj0Q8CYATGIZ2kneTxlIb6OJaufslXgqHDhR+49kpHy/Y8TdX0mm8+/dHlzOf0OmBoTmAhZLoJWpxnzsdEsrEWeZgac6n01HWr0iDW31igzDHpPQ3fD1x2/8BS5YDEEJ9cp7W26cSTQ7J6pSYGkNackY3Y/+eaa2wJxMs7rhtZmkkNLyLDN/OJjT90fPkDmDN5Fl0gq6QdABK2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uF8VYUKlCXOMIjd0vKb1ydDlfE2KatTZI8ul1KYId8k=;
 b=A1RTTXM+NrCczM0BjbXS0dpMPXYvOz//cAzAJyJO3/cmRxH2ze3fSoh4nncaOegwnIiiWApIe3CzjsZ8AFpBDhpS0kvScb61lkHFlQl80jFxqlr+t4DAvCWZeusJLo/WO5zwcO03Sl1KRS1DS3nu+ak65zBFh/DeVHntl+9d6/I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0401MB2479.eurprd04.prod.outlook.com (2603:10a6:800:53::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 16 Nov
 2021 12:41:57 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 12:41:57 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: pierre-louis.bossart@linux.intel.com, broonie@kernel.org,
 alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: SOF: i.MX: simplify Kconfig
Date: Tue, 16 Nov 2021 14:41:31 +0200
Message-Id: <20211116124131.46414-1-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR01CA0160.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::29) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:1e69:ee6:2dad:c9e7)
 by AM0PR01CA0160.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.15 via Frontend
 Transport; Tue, 16 Nov 2021 12:41:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5fd4fbaf-533d-43d9-4816-08d9a8fe79fc
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2479:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0401MB2479C6273FD5953226EB189BB8999@VI1PR0401MB2479.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2VT9NKafqwcs2smyhcrUUTmZ6yh7hfjE9bE72Jv13BhVcEdCbQvqZajQJ4DI9t7Wnp/m0jWZcfCIZSLGda66+A+NJFfi9DwvXU0V34JJddtMxzJxV6u4IcfqpKoTqIuLSuqgo9D+GzmEM8BssrqNp3tIgdPinLkxhUP0XkIZz/iYqy93Rs/hd+cp5az3/Qovq1nU+RZjofvKyAAf63aAQ99zJfsVbVMWLk8NFRjTAVEvMGNKOREW+q/S/kTFBFtL+bM7lFUAwnr4fCFCSpEy4V7qInwxFjvGj4pTfiZ1/8GhY/qdGt2U3VwpR0T5/Su0anh0gvbNe8jJIRTLdyL5vS+DegTWotS7exIikAFMwwMBL4enVDWvLjsQydWIYbUFV4M6+RAoEbaFcbCOlyepcAP7x26zQle79mZeI5d2a8eRuJtWX1YrxIsXXHKDMcbPrA5ZlozP37F/99d6cJUSLNmskJLV5+40FwoI6FholUkpiZUaV/mCg5vvX6cWKMzZth10wDugAg8IjUrq7RitLQVebeOa2vWmqrHVE2m5wh61McJlulYk375r9dCvEAgxSCqM5gctkqlBsU9iNxbqYx2DhkezsexN01Y4mzcgEfDXcc5MvJTVyI4euRa/52EkUfj7B3KIWIGGD+nMeIgTYA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(66476007)(508600001)(6512007)(66946007)(66556008)(6506007)(83380400001)(186003)(8936002)(6486002)(8676002)(1076003)(38100700002)(6666004)(86362001)(52116002)(2616005)(316002)(2906002)(5660300002)(4326008)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?v9sGRRLEiOCDb3FezPeCauZ5VjUz5ctXAJNrWlC4boBdl6NccDwBSQr1UQyE?=
 =?us-ascii?Q?O22ESgodMWe52s759+WMKj3CZYb/UM2SdpfVO2CQgnIvEfpisMjkZL68OTTJ?=
 =?us-ascii?Q?0C4a6LdcfTFl5h/KBYjRQQT6XMieJ7dMWfXEeCCxHZqR/AswvQT//fk4ePwI?=
 =?us-ascii?Q?cV4xv7+Jsgbg36/A6uQ0SmNpUNczoW7wt08DyUgAtYK9TtWxf69MWScYSvM1?=
 =?us-ascii?Q?h0Med9Nj7NWniW7oUDk5iEDQODAElyPjtO+G7gjAwzNGFdYhbmkpQpKoTU1q?=
 =?us-ascii?Q?9R1y9SxeGBSkPw7hd9p6vo1G6FCDvM9AW6dxvs0zZvoe3ox7IwFjJyY2BVqe?=
 =?us-ascii?Q?UY2Rzd4x0BW64l/liOjMAPMjd5t+BgDEKWY85sdgsTvMMFpUJejPERN9RyHb?=
 =?us-ascii?Q?ra4oz77m/l30owMyu1Nd287nlWzKaACfSVKxub2vsPKQAJA8lbLxCYS3tW2r?=
 =?us-ascii?Q?UiW6mFwSKMABiD8ujyKHB9spTzwuPeNU4NoxmwyjOElhRFmykfss6lJM78gu?=
 =?us-ascii?Q?gdW/w+WjrO8sexmFLF+LioJ98efr+m9iZeO8ZQvsndX7sj0LXAD5hreSj9Ig?=
 =?us-ascii?Q?QTBryfrF6rp52r7oVMIvaVbLLTNXfeyuZWCT7n6mxfRDMDuD4NdyQrXq8gMR?=
 =?us-ascii?Q?DTGDKxQHITkSJgmBPkhHy41vzJQmLrdsheN7zNwgkKVZ5VWpeDVs4n3l4F8E?=
 =?us-ascii?Q?16wWtPyJS6o5EJ9P7aXCzbylAROyLCLps5qsbGzABQphuGNc+fLJdDkMXtNM?=
 =?us-ascii?Q?XEXATKgFIEIUZBPflZPJwMKpT5C47Cm+/+Oz6cq1XyLPsZrNRaDOIqn601xe?=
 =?us-ascii?Q?pSreRYmMGqVduxehFK98tsW7sCOnGWt88M/7NLALFqI+MSiQtqgG4prs7QGV?=
 =?us-ascii?Q?BpmMvZqTOI9FnUdRfbN3b0zPHB7Ues0S1WUzOCH/N+IDTkCgRQdBzVwLh+uh?=
 =?us-ascii?Q?RcEgxjJfEMC5OsJ5e2qnvPFKnyKQRGuvnWjhqDXPopNrdtPknQeZJXkSCxYg?=
 =?us-ascii?Q?xbynJ9gT/Igo0zEIypmteaXhgphVcT4qOCn3jsHrAnvVIdaa0hCCzq0nX1YA?=
 =?us-ascii?Q?KPMjQudEouFMD4hwT+JP4IJ8bHGWYJOUoNNPE215UBrhOT2TxYnRl0XOYw4X?=
 =?us-ascii?Q?uonNHyehy0TAyG+dIccgGl8UxecX/0IyVu0Dn099J1zYwxcJcNzq5l84w8MH?=
 =?us-ascii?Q?BU7lWDp0mMzUsetuWrFXLLGXewZIYeMMtv4aPDYd8V3t2oG2CpPaDGZ+FLOk?=
 =?us-ascii?Q?zbXLPcIvNJl2WC6DjLvJ4+/oRQbBu0xbictFzUtQjHTG0O8LSMusYIZy1E/n?=
 =?us-ascii?Q?UoQOMGIA6ZynRxdgKY3ovkXP1iG3td5gq8uGTQzWSHfWDFLBIlStJDa8kUyp?=
 =?us-ascii?Q?ZgSKnGz+NLscnmHTWnFhpE2BQDCo6MsIaOcVmRROp1gr0Nn7Ak0KG1tXHGCL?=
 =?us-ascii?Q?S54Hc0Iw0zPMElIx8RMykIbU3+JwZ1tv8fn+peBZWsRw5ov+N7RrbwL+42m+?=
 =?us-ascii?Q?HLUdqwXrs8zA8yA20VKqX1i3E3DajWcKdEcRp2YBlO9ZVT8qMPk6t+Tj0KhN?=
 =?us-ascii?Q?qzgjmk8p4eEYLKMjcq5Q6bO1RXqoRy76s8rPsIglBp/dGk7Y4XmMqupNdoJm?=
 =?us-ascii?Q?fLlwlmqHqJzs5Hqxet6wo7lT6rWSk4rwM5i7YC9o6+cZyJM7SdCwh+rHwi7k?=
 =?us-ascii?Q?TWo7Vmsp5q2TiulKY8+a2J/abxM=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fd4fbaf-533d-43d9-4816-08d9a8fe79fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 12:41:57.3161 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 91oToABM89Ton2oXF+bXtVeMKlH5hDO8tz/aFJ9l/h51TnMsj3ewHtu3gH97t5PcRQwAEurHgZc8o3FLV7E2FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2479
Cc: daniel.baluta@gmail.com, peter.ujfalusi@linux.intel.com,
 lgirdwood@gmail.com, ranjani.sridharan@linux.intel.com, linux-imx@nxp.com,
 kernel@pengutronix.de, daniel.baluta@nxp.com, linux-kernel@vger.kernel.org
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

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Follow the Intel example and simplify the Kconfig
a) start from the end-product for 'select' chains
b) use 'depends on' to filter out configurations.
c) use snd-sof-of as a common module without any 'select'

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/Kconfig     |  4 +++-
 sound/soc/sof/Makefile    |  2 +-
 sound/soc/sof/imx/Kconfig | 46 +++++++++++----------------------------
 3 files changed, 17 insertions(+), 35 deletions(-)

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 041c54639c4d..b6fa659179b6 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -40,12 +40,14 @@ config SND_SOC_SOF_ACPI_DEV
 config SND_SOC_SOF_OF
 	tristate "SOF OF enumeration support"
 	depends on OF || COMPILE_TEST
-	select SND_SOC_SOF
 	help
 	  This adds support for Device Tree enumeration. This option is
 	  required to enable i.MX8 devices.
 	  Say Y if you need this option. If unsure select "N".
 
+config SND_SOC_SOF_OF_DEV
+	tristate
+
 config SND_SOC_SOF_COMPRESS
 	bool
 	select SND_SOC_COMPRESS
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 06e5f49f7ee8..1dac5cb4dfd6 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -17,7 +17,7 @@ obj-$(CONFIG_SND_SOC_SOF_NOCODEC) += snd-sof-nocodec.o
 
 
 obj-$(CONFIG_SND_SOC_SOF_ACPI_DEV) += snd-sof-acpi.o
-obj-$(CONFIG_SND_SOC_SOF_OF) += snd-sof-of.o
+obj-$(CONFIG_SND_SOC_SOF_OF_DEV) += snd-sof-of.o
 obj-$(CONFIG_SND_SOC_SOF_PCI_DEV) += snd-sof-pci.o
 
 obj-$(CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL) += intel/
diff --git a/sound/soc/sof/imx/Kconfig b/sound/soc/sof/imx/Kconfig
index 34cf228c188f..9b8d5bb1e449 100644
--- a/sound/soc/sof/imx/Kconfig
+++ b/sound/soc/sof/imx/Kconfig
@@ -11,53 +11,33 @@ config SND_SOC_SOF_IMX_TOPLEVEL
 
 if SND_SOC_SOF_IMX_TOPLEVEL
 
-config SND_SOC_SOF_IMX_OF
-	def_tristate SND_SOC_SOF_OF
-	select SND_SOC_SOF_IMX8 if SND_SOC_SOF_IMX8_SUPPORT
-	select SND_SOC_SOF_IMX8M if SND_SOC_SOF_IMX8M_SUPPORT
-	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
-
 config SND_SOC_SOF_IMX_COMMON
 	tristate
+	select SND_SOC_SOF_OF_DEV
+	select SND_SOC_SOF
+	select SND_SOC_SOF_XTENSA
+	select SND_SOC_SOF_COMPRESS
 	help
 	  This option is not user-selectable but automagically handled by
 	  'select' statements at a higher level.
 
-config SND_SOC_SOF_IMX8_SUPPORT
-	bool "SOF support for i.MX8"
-	depends on IMX_SCU=y || IMX_SCU=SND_SOC_SOF_IMX_OF
-	depends on IMX_DSP=y || IMX_DSP=SND_SOC_SOF_IMX_OF
+config SND_SOC_SOF_IMX8
+	tristate "SOF support for i.MX8"
+	depends on IMX_SCU
+	depends on IMX_DSP
+	select SND_SOC_SOF_IMX_COMMON
 	help
 	  This adds support for Sound Open Firmware for NXP i.MX8 platforms.
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
-config SND_SOC_SOF_IMX8
-	tristate
+config SND_SOC_SOF_IMX8M
+	tristate "SOF support for i.MX8M"
+	depends on IMX_DSP
 	select SND_SOC_SOF_IMX_COMMON
-	select SND_SOC_SOF_XTENSA
-	select SND_SOC_SOF_COMPRESS
-	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
-
-config SND_SOC_SOF_IMX8M_SUPPORT
-	bool "SOF support for i.MX8M"
-	depends on IMX_DSP=y || IMX_DSP=SND_SOC_SOF_OF
 	help
 	  This adds support for Sound Open Firmware for NXP i.MX8M platforms.
 	  Say Y if you have such a device.
 	  If unsure select "N".
 
-config SND_SOC_SOF_IMX8M
-	tristate
-	select SND_SOC_SOF_IMX_COMMON
-	select SND_SOC_SOF_XTENSA
-	select SND_SOC_SOF_COMPRESS
-	help
-	  This option is not user-selectable but automagically handled by
-	  'select' statements at a higher level.
-
-endif ## SND_SOC_SOF_IMX_IMX_TOPLEVEL
+endif ## SND_SOC_SOF_IMX_TOPLEVEL
-- 
2.27.0

