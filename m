Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4520B4543D7
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:40:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B24F181A;
	Wed, 17 Nov 2021 10:39:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B24F181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142004;
	bh=jWKgpYMiaOH6fXLGXuVgLpAVDTtTjtTw8D5jc5RX8/Q=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n51YSelj5RiXpg61OXxl9DSpH3e9IiyGSyelEIbjOaj1/iE5yXkRhKlQVbkzUr7di
	 4g9Y4ncq3B7eOqo8MfOUTxfrRwhRj7j15jKY/ckon8YRao72NKD56CqsX+49Bui5Rk
	 YwwV/BNZvqSF+NEs5omfLTm8r5OlLjOZvRoGkEAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 37AD6F804BD;
	Wed, 17 Nov 2021 10:38:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E72AAF8016C; Wed, 17 Nov 2021 10:38:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60071.outbound.protection.outlook.com [40.107.6.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BAB72F8016C
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BAB72F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="aplJeNkj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0Injg4CXBpFe2PF8Is6kHdfjxyWqGMRdKOybM1CimYULTl6fmxGwoRHDSSfFvciH1Ed4+8ArOit6hfGJcjdup2iZer43dCWLFQDzATanCmOTzoCUnO84Vaqz/0vTnowO+UPVF5lj1dOQBNl5o6Lq8I+V7qCwpa9o+omQEbySg+dffRjxUIEyV/voKkb1Q98UbCxHxUAcha1paRkYU+3TeBACMK1H9eaY6O485Yv5XER8BZKxOIXGTkV+HmATJHV6WDAz8fZ/qXydk4xEOjawUclJaymKGiH0f2YOalY+YxFU+Rg5B4EasnilMS+3EOrOwqoTJTtv/LOcYoW0bMDog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9dEqdF9hwa7x/KDW80gs2YQr+CaTRcLdaS21fO2N9I=;
 b=UOsbs1cxvVnBpv3XaXZgukwI6JMI8ERN+dn7VEGO3eJr1PaUwnSBAyzf30nYTYCJWQC3KZQli/n4oAvLtg88ZT1BDV8I7n2C8y1ps+ymPAvgixmVkW9/1WMm7BTBkHW/7ccQs+30MCswPQTMAEv91IQWTozR0MIgSgxP0rdS7UzseQCAZMJ+33dvpwfwbOJfZ1LbNIXJnhqd0Kkyj6CBcRDx/eDVkkVJdvAxLf3d2/BnmPRqK9KuqZXIwsru5i9oAP6nclhbpqyvcANcISi5sxb9LvR/y/osldBI0+MP3w/AazO7OMRoajgKQYMjinEEMgwSq4vt+opTdeuO2so8jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9dEqdF9hwa7x/KDW80gs2YQr+CaTRcLdaS21fO2N9I=;
 b=aplJeNkjuwj1Z5eDOIJ6CT/VXGuNTTCkz3KgtBQigopLcg1NaAmVjxVLS5hDndJrBqgOlc0D0A+yuHCXmqyHjjN8tbA3MrqXbAJ1cEwva9yrt3OtkLAXF1K3774VVE7QRjT/kHF/lZ3qizm7jnOfCbXjuY8hYnx9iBQ/eqqCS+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR04MB5807.eurprd04.prod.outlook.com (2603:10a6:803:ec::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 09:38:05 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:05 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 01/21] ASoC: SOF: amd: Add Renoir ACP HW support
Date: Wed, 17 Nov 2021 11:37:14 +0200
Message-Id: <20211117093734.17407-2-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
References: <20211117093734.17407-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM3PR03CA0060.eurprd03.prod.outlook.com
 (2603:10a6:207:5::18) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:22bb:b216:ffff:73e1)
 by AM3PR03CA0060.eurprd03.prod.outlook.com (2603:10a6:207:5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.19 via Frontend
 Transport; Wed, 17 Nov 2021 09:38:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff9a0604-a453-48e9-fa2b-08d9a9adf4fd
X-MS-TrafficTypeDiagnostic: VI1PR04MB5807:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB580782D5D8F513A6F58811C9B89A9@VI1PR04MB5807.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dxml9Vmf4v56KDfNpoFes7F7lCfOwHhzUJaazyu8M43F/r/won6THZrDAFMcy7+lFZrYCd4qsP5kZs0GHCtXCgUCX/vc7SIRHYglxpmmEw3DMVoVVbB4GzRJIdfAYsTASEZvq3O4Ht0Cvq5S0BtDne3Fmx1f/cX6cBBGv5x/W8bSJ6gnomRVSNqmvIw5H/TxTtlfZT7wdh6SJx51m4g76hNfhWEixpT+RWlQxvEpRzQbqiEU9aG6N0ftPLLEIb78cp8jiwHWJxXd2J/zWu2pDY5LS1RPqnxXxDj2ZRGtWVtvYGdwYcL32LecuSmWjTIfY2s8Ri7UgKDXz11BW3LY5ncVA8tX4Msm+LwN0Q4+K/iLn2Ey42DVQnpz1EWxX/ELcIDfkiG2zrOFFd+6ZKj9/8teH36zoj3DXPYEUBhFdph4kt2Xte/wjwHxTPD0lxCLHJ/wI61Qmy5jOHDctZayJ2IulzqR6CyK88MxJkqM2SLCJTRy9O2PD/d4MVqcKKYmGP7dUN62qD8iM7ybstZojyuDPjHUSXcqaH6YEAAuqadrV1I5FDJYP14seqxUuGvvYO6JCzkslWWith9Z337U4Z0ifOuDfOn9wofO/oaSp+Bf38DQ5tCA1c4d62O4xDj84Hr7BemFI+SnRAl99bfh9w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(5660300002)(508600001)(52116002)(86362001)(8676002)(54906003)(8936002)(66946007)(186003)(6512007)(2906002)(6666004)(6486002)(7416002)(6506007)(1076003)(2616005)(66556008)(66476007)(44832011)(83380400001)(38100700002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?MbJ2NAi8KBemEyhOaFdFuyuZkdKcv3nazsRZhVk0ItuAukQJcLFu4MNBtvUO?=
 =?us-ascii?Q?j2Jvyf9xsaLY2L4TM6QLNwTG21ECPk9wwu06wy7GMWNsgy3cB1+8nmuSu4Z7?=
 =?us-ascii?Q?LZU/0HcJllcLuwiCLk051W9OX0S1mnf4dm1Z1ujsd0lFnucYHegOgFIeVFIM?=
 =?us-ascii?Q?LZr3yYFmmvhArcG/6bQnQNclngFLJ6D/2sVu2lvbWxlHiUPm3Gygds9Xu2nR?=
 =?us-ascii?Q?9WFFLq3s5PW3AsZi4X+K/umaJNgfqPYLukVzqAQSxW+/vSEQUTk+k+8D9eNf?=
 =?us-ascii?Q?FqRBM6r3lMlcTdevu7Z+PzBDGg1ADaEzF6mFxy1cBYn/zpLdSQoOHdbbB6L4?=
 =?us-ascii?Q?2EIj+jGTPcHk5FIABlgKehA14032hYyQ3uaUialnVzPHbyv6JQrOhf13eqlL?=
 =?us-ascii?Q?Xw2pJGOoIcsmSGBIALnJ12TEp3WKOYjEIqhtZue/u4pZO5HrgHCfGv2pG3jO?=
 =?us-ascii?Q?G7eeasnU+O6AmunvikvS6IPT+xyK5P7KHdC4laxuC7WY1zboAK/1dNT3Vlwb?=
 =?us-ascii?Q?iZkd1Xw9M0hzewS5kdadjfTCqCnXijX077FU4ewzzRzEJJZuNhP6VxvYiDLN?=
 =?us-ascii?Q?ACV8k+9yGKpohWgImE2gd4xaVnUHF0Ih2SX9ZLD1P/gVROAKz6GQs1KjXMe/?=
 =?us-ascii?Q?70WChpN7B8uM0dxKgeqzaLbd6AMLnrt9q0KmCJqVUnIrfm9gh6oM9YQb6Zyd?=
 =?us-ascii?Q?cZiAyTn0x6jdWJhpT3lFqzMva4J9M+WHyUtQGDTY2AV4LBcIkEElIyL9DnpM?=
 =?us-ascii?Q?AHjdKsXxqi78ov5E0yQLWaaf4QU7inPQOqO+/z3S2QDQp+cHPE52nGNU/aXj?=
 =?us-ascii?Q?HkGlGNH1pmHD0q1MVwsckwLwYNA+yjNgmondcMSacADCmdcLmjeNLCGK+bC2?=
 =?us-ascii?Q?XTAgv77e0Gjra/UpoNbOdKYkT+sMcXehMMCJBtkrCuorDs+dy+TueMLH8HYB?=
 =?us-ascii?Q?af0jQ+KzItATKRLvbYrhOKBUfKe+uvr3u3YWTi8gGIcdfHOR35/HRSK0L1q8?=
 =?us-ascii?Q?oiVoRjrgh4rhf+ZXXcenrQm5sGVevephis3V5TVSHZSQUUe3fIUWk3gbLc3P?=
 =?us-ascii?Q?LFhtcg8HAE2/pji/2SIZ5/FC3BcOdL4WoP63VuY5PVfx+QU2a71IZ2+c8uh2?=
 =?us-ascii?Q?6z8EawcilGHA38V7IDIT5IjZ7kRuMjexvhFjbrNSLuoyDE2h8hgpfZvO6FBD?=
 =?us-ascii?Q?poCkvs6r8nE34salcPNFVeJNX4W8U2U3Ybb+gaaHxrFVI6SoVVqnO5t6eQDI?=
 =?us-ascii?Q?FE2FHQWgFusD9jXKr9WqjJoK2pNDVZmg/MJ5MFMPETuW1bXqq01iW5qrvYlb?=
 =?us-ascii?Q?RBvdHfAqhWlkNj/I5Ci441Z/37fmgAQu/mrpW9Io4lVkLEYnFZvJrRmbHnIN?=
 =?us-ascii?Q?JW+NGU22ytpwLevpPm1tG3jLDrACO+tiYgyttAtB4Er0nrorI7UXoWur5XF2?=
 =?us-ascii?Q?NDedP8wn2H3OvbBH7jf3N6cfaXb3FspyUskadCYvK4L1xq2QKlZhFA03oiaE?=
 =?us-ascii?Q?fl2MTonvLJllQGiE+PoOiy0X4HnzI1wqsdSQFoDMlxCpxVBh3QzF0Efe3qox?=
 =?us-ascii?Q?ngXDZA8DF+b6Evf5IBPi4/FQVDCrjb8GnAiERHOTdck6TlX43wEkIGqGKIUO?=
 =?us-ascii?Q?SM2QSvIL1YRD3mOCe45OUrcCyerjibEJ+VF4lBg3SfAzcujy9WonNQGSlUm4?=
 =?us-ascii?Q?DYTU4TxrSmeN2NA1Kg17seYNI6aLgPzfuaho8zJul9Hdnvm+?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9a0604-a453-48e9-fa2b-08d9a9adf4fd
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:05.6626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wz9th53q6hnyJOK1YE2WaBxx4H95x4doMk47vGXH99lQ1gOx1md4/CsHWwkZz0reE9kAiRPaWcUZQRr/4O1jiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5807
Cc: daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Julian.Schroeder@amd.com, linux-mediatek@lists.infradead.org,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, daniel.baluta@nxp.com,
 Bard Liao <bard.liao@intel.com>
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

From: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>

This patch initializes ACP HW block to support SOF on
AMD Renoir platform.

Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/Kconfig              |   1 +
 sound/soc/sof/Makefile             |   1 +
 sound/soc/sof/amd/Kconfig          |  30 ++++++++
 sound/soc/sof/amd/Makefile         |  11 +++
 sound/soc/sof/amd/acp-dsp-offset.h |  20 +++++
 sound/soc/sof/amd/acp.c            | 118 +++++++++++++++++++++++++++++
 sound/soc/sof/amd/acp.h            |  36 +++++++++
 sound/soc/sof/amd/renoir.c         |  34 +++++++++
 8 files changed, 251 insertions(+)
 create mode 100644 sound/soc/sof/amd/Kconfig
 create mode 100644 sound/soc/sof/amd/Makefile
 create mode 100644 sound/soc/sof/amd/acp-dsp-offset.h
 create mode 100644 sound/soc/sof/amd/acp.c
 create mode 100644 sound/soc/sof/amd/acp.h
 create mode 100644 sound/soc/sof/amd/renoir.c

diff --git a/sound/soc/sof/Kconfig b/sound/soc/sof/Kconfig
index 041c54639c4d..68571bf2585e 100644
--- a/sound/soc/sof/Kconfig
+++ b/sound/soc/sof/Kconfig
@@ -223,6 +223,7 @@ config SND_SOC_SOF_PROBE_WORK_QUEUE
 	  When selected, the probe is handled in two steps, for example to
 	  avoid lockdeps if request_module is used in the probe.
 
+source "sound/soc/sof/amd/Kconfig"
 source "sound/soc/sof/imx/Kconfig"
 source "sound/soc/sof/intel/Kconfig"
 source "sound/soc/sof/xtensa/Kconfig"
diff --git a/sound/soc/sof/Makefile b/sound/soc/sof/Makefile
index 06e5f49f7ee8..011abfa0fd82 100644
--- a/sound/soc/sof/Makefile
+++ b/sound/soc/sof/Makefile
@@ -22,4 +22,5 @@ obj-$(CONFIG_SND_SOC_SOF_PCI_DEV) += snd-sof-pci.o
 
 obj-$(CONFIG_SND_SOC_SOF_INTEL_TOPLEVEL) += intel/
 obj-$(CONFIG_SND_SOC_SOF_IMX_TOPLEVEL) += imx/
+obj-$(CONFIG_SND_SOC_SOF_AMD_TOPLEVEL) += amd/
 obj-$(CONFIG_SND_SOC_SOF_XTENSA) += xtensa/
diff --git a/sound/soc/sof/amd/Kconfig b/sound/soc/sof/amd/Kconfig
new file mode 100644
index 000000000000..400dd5a24ae6
--- /dev/null
+++ b/sound/soc/sof/amd/Kconfig
@@ -0,0 +1,30 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+# This file is provided under a dual BSD/GPLv2 license. When using or
+# redistributing this file, you may do so under either license.
+#
+# Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+
+config SND_SOC_SOF_AMD_TOPLEVEL
+	tristate "SOF support for AMD audio DSPs"
+	depends on X86 || COMPILE_TEST
+	help
+	  This adds support for Sound Open Firmware for AMD platforms.
+	  Say Y if you have such a device.
+	  If unsure select "N".
+
+if SND_SOC_SOF_AMD_TOPLEVEL
+
+config SND_SOC_SOF_AMD_COMMON
+	tristate
+	select SND_SOC_SOF
+	help
+	  This option is not user-selectable but automatically handled by
+	  'select' statements at a higher level
+
+config SND_SOC_SOF_AMD_RENOIR
+	tristate "SOF support for RENOIR"
+	select SND_SOC_SOF_AMD_COMMON
+	help
+	  Select this option for SOF support on AMD Renoir platform
+
+endif
diff --git a/sound/soc/sof/amd/Makefile b/sound/soc/sof/amd/Makefile
new file mode 100644
index 000000000000..ac2ecd21be5f
--- /dev/null
+++ b/sound/soc/sof/amd/Makefile
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+# This file is provided under a dual BSD/GPLv2 license. When using or
+# redistributing this file, you may do so under either license.
+#
+# Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+
+snd-sof-amd-acp-objs := acp.o
+snd-sof-amd-renoir-objs := renoir.o
+
+obj-$(CONFIG_SND_SOC_SOF_AMD_COMMON) += snd-sof-amd-acp.o
+obj-$(CONFIG_SND_SOC_SOF_AMD_RENOIR) +=snd-sof-amd-renoir.o
diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
new file mode 100644
index 000000000000..2cc2a9a842c5
--- /dev/null
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license. When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ * Author: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+ */
+
+#ifndef _ACP_DSP_IP_OFFSET_H
+#define _ACP_DSP_IP_OFFSET_H
+
+#define ACP_SOFT_RESET				0x1000
+
+/* Registers from ACP_PGFSM block */
+#define ACP_PGFSM_CONTROL			0x141C
+#define ACP_PGFSM_STATUS			0x1420
+
+#endif
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
new file mode 100644
index 000000000000..687a67419335
--- /dev/null
+++ b/sound/soc/sof/amd/acp.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+//
+// Authors: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
+//	    Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+
+/*
+ * Hardware interface for generic AMD ACP processor
+ */
+
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+
+#include "../ops.h"
+#include "acp.h"
+#include "acp-dsp-offset.h"
+
+static int acp_power_on(struct snd_sof_dev *sdev)
+{
+	unsigned int val;
+	int ret;
+
+	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_PGFSM_STATUS);
+
+	if (val == ACP_POWERED_ON)
+		return 0;
+
+	if (val & ACP_PGFSM_STATUS_MASK)
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_PGFSM_CONTROL,
+				  ACP_PGFSM_CNTL_POWER_ON_MASK);
+
+	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_PGFSM_STATUS, val, !val,
+					    ACP_REG_POLL_INTERVAL, ACP_REG_POLL_TIMEOUT_US);
+	if (ret < 0)
+		dev_err(sdev->dev, "timeout in ACP_PGFSM_STATUS read\n");
+
+	return ret;
+}
+
+static int acp_reset(struct snd_sof_dev *sdev)
+{
+	unsigned int val;
+	int ret;
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SOFT_RESET, ACP_ASSERT_RESET);
+
+	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SOFT_RESET, val,
+					    val & ACP_SOFT_RESET_DONE_MASK,
+					    ACP_REG_POLL_INTERVAL, ACP_REG_POLL_TIMEOUT_US);
+	if (ret < 0) {
+		dev_err(sdev->dev, "timeout asserting reset\n");
+		return ret;
+	}
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SOFT_RESET, ACP_RELEASE_RESET);
+
+	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SOFT_RESET, val, !val,
+					    ACP_REG_POLL_INTERVAL, ACP_REG_POLL_TIMEOUT_US);
+	if (ret < 0)
+		dev_err(sdev->dev, "timeout in releasing reset\n");
+
+	return ret;
+}
+
+static int acp_init(struct snd_sof_dev *sdev)
+{
+	int ret;
+
+	/* power on */
+	ret = acp_power_on(sdev);
+	if (ret) {
+		dev_err(sdev->dev, "ACP power on failed\n");
+		return ret;
+	}
+	/* Reset */
+	return acp_reset(sdev);
+}
+
+int amd_sof_acp_probe(struct snd_sof_dev *sdev)
+{
+	struct pci_dev *pci = to_pci_dev(sdev->dev);
+	struct acp_dev_data *adata;
+	unsigned int addr;
+
+	adata = devm_kzalloc(sdev->dev, sizeof(struct acp_dev_data),
+			     GFP_KERNEL);
+	if (!adata)
+		return -ENOMEM;
+
+	adata->dev = sdev;
+	addr = pci_resource_start(pci, ACP_DSP_BAR);
+	sdev->bar[ACP_DSP_BAR] = devm_ioremap(sdev->dev, addr, pci_resource_len(pci, ACP_DSP_BAR));
+	if (!sdev->bar[ACP_DSP_BAR]) {
+		dev_err(sdev->dev, "ioremap error\n");
+		return -ENXIO;
+	}
+
+	pci_set_master(pci);
+
+	sdev->pdata->hw_pdata = adata;
+
+	return acp_init(sdev);
+}
+EXPORT_SYMBOL_NS(amd_sof_acp_probe, SND_SOC_SOF_AMD_COMMON);
+
+int amd_sof_acp_remove(struct snd_sof_dev *sdev)
+{
+	return acp_reset(sdev);
+}
+EXPORT_SYMBOL_NS(amd_sof_acp_remove, SND_SOC_SOF_AMD_COMMON);
+
+MODULE_DESCRIPTION("AMD ACP sof driver");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
new file mode 100644
index 000000000000..c7ac8f9941d5
--- /dev/null
+++ b/sound/soc/sof/amd/acp.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause) */
+/*
+ * This file is provided under a dual BSD/GPLv2 license. When using or
+ * redistributing this file, you may do so under either license.
+ *
+ * Copyright(c) 2021 Advanced Micro Devices, Inc. All rights reserved.
+ *
+ * Author: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+ */
+
+#ifndef __SOF_AMD_ACP_H
+#define __SOF_AMD_ACP_H
+
+#define ACP_DSP_BAR	0
+
+#define ACP_REG_POLL_INTERVAL                   500
+#define ACP_REG_POLL_TIMEOUT_US                 2000
+
+#define ACP_PGFSM_CNTL_POWER_ON_MASK		0x01
+#define ACP_PGFSM_STATUS_MASK			0x03
+#define ACP_POWERED_ON				0x00
+#define ACP_ASSERT_RESET			0x01
+#define ACP_RELEASE_RESET			0x00
+#define ACP_SOFT_RESET_DONE_MASK		0x00010001
+
+/* Common device data struct for ACP devices */
+struct acp_dev_data {
+	struct snd_sof_dev  *dev;
+};
+
+/* ACP device probe/remove */
+int amd_sof_acp_probe(struct snd_sof_dev *sdev);
+int amd_sof_acp_remove(struct snd_sof_dev *sdev);
+
+extern const struct snd_sof_dsp_ops sof_renoir_ops;
+#endif
diff --git a/sound/soc/sof/amd/renoir.c b/sound/soc/sof/amd/renoir.c
new file mode 100644
index 000000000000..3d1dc6c2fa9b
--- /dev/null
+++ b/sound/soc/sof/amd/renoir.c
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
+//
+// This file is provided under a dual BSD/GPLv2 license. When using or
+// redistributing this file, you may do so under either license.
+//
+// Copyright(c) 2021 Advanced Micro Devices, Inc.
+//
+// Authors: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
+
+/*
+ * Hardware interface for Audio DSP on Renoir platform
+ */
+
+#include <linux/platform_device.h>
+#include <linux/module.h>
+
+#include "../ops.h"
+#include "acp.h"
+
+/* AMD Renoir DSP ops */
+const struct snd_sof_dsp_ops sof_renoir_ops = {
+	/* probe and remove */
+	.probe			= amd_sof_acp_probe,
+	.remove			= amd_sof_acp_remove,
+
+	/* Register IO */
+	.write			= sof_io_write,
+	.read			= sof_io_read,
+};
+EXPORT_SYMBOL(sof_renoir_ops);
+
+MODULE_IMPORT_NS(SND_SOC_SOF_AMD_COMMON);
+MODULE_DESCRIPTION("RENOIR SOF Driver");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.27.0

