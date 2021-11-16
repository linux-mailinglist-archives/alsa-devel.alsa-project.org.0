Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DD4A6453653
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Nov 2021 16:48:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24FC916A2;
	Tue, 16 Nov 2021 16:47:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24FC916A2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637077703;
	bh=Q68hKuTbHoZ/Lx7YWAgHjvatLLrLX/X74bd+Z6qiZQ0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zw8aKLi8ZGAzjPTJpFunrTiL9PHgsutcOqmhyJQb3bqVMvzZRGqbNRI2pe1g6ZWRE
	 4rstILGtWBWR5jGzMKCJFBhWa5B/jGwoHRmbLPEMauLKUD4u908qUBJnHuxUjyyCdz
	 ot0nYnox7lb7CWiKcptbfYWED0nXF6b4q+oSrPlI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18469F804EB;
	Tue, 16 Nov 2021 16:46:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5DDDF804C1; Tue, 16 Nov 2021 16:46:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60073.outbound.protection.outlook.com [40.107.6.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 848ABF80089
 for <alsa-devel@alsa-project.org>; Tue, 16 Nov 2021 16:46:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 848ABF80089
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="iHvo53Ws"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OyyHIE7tQG3N/DuB9TDiXCpC09Uc66zsiYHE2bM6vrUWZsXGBYUgzds0+prDdWI/+wihIM6LCRw7uKUAa67iiUbs3jru1jkSuiSQTeevN5Avn7TFcPJwkpnwD8wDzc5eUWwhYcQc9zMz0Pyw0oQ5vqhRfKK+HCb82CpynRIAMtnXHRIp/RFop4nZwU1eZDASA8BpJGs8JVRQx4Bt7bsqGiN4z3jBtkxolvHrJt5HBVwq8xsFbofmuV6Jfd4J0gbbWy3elKkU2MpTIC2wzDGYueweh2RfNAYSZElUE+pJtBEAmjqOWakuf+6O9KTNMV7nGW0WDk7C3Ihnp0jiLiIQJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeiXOMZ1lW1CcWDJMxc9X5sgHb6Ep25ieGa9wcv755o=;
 b=Rfu5NCFZQJ2PoR6r4O8o0EDnJPkq2Sh5yXF0R0rngcGfWE+tcmix68YoKC4MFNve6QxT1XbulYutpUoniDMgABoru4Wqob4PAbHOLE2ck+B0xb9B3jC7FdT5vPSg38nNoD9ri172CNZNB4SbNcXZ6pLjaNl8f0rxnCLqLpBlwXUp0Py96nLsheVkjVQQZdBnW/BAXpkMxTvVdUuHwfQLQ1C7XjxrcUN9VgbYRFGuiiWv3SsWWE/2tOXnKeTCjXiMvoC1PX8Z9xG3VYfG3aXUZjWVBCIXIjWVHbenEI057qK6y1pmtt/V4rKSnFtlksqw+6/j8rdydgx1swz6JxmXlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeiXOMZ1lW1CcWDJMxc9X5sgHb6Ep25ieGa9wcv755o=;
 b=iHvo53WsKVRlZmwEJ1XqKqDx69o3jZmfAZcMmaAX2idskPzR7byjW1Ad6RnkJAjHZJxTW9mnUSnL5xcP0vDC7U2C645p2zQAUPO5J+tXnmgqRdp3noysTjgAcS9kvbysEmAgDeiRFlRg00LtjHpjT9zwb76c4ZqHYab3DLI/KOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VI1PR0402MB3824.eurprd04.prod.outlook.com (2603:10a6:803:22::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Tue, 16 Nov
 2021 15:46:31 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Tue, 16 Nov 2021
 15:46:31 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 1/5] ASoC: SOF: imx: Add code to manage DSP related clocks
Date: Tue, 16 Nov 2021 17:46:09 +0200
Message-Id: <20211116154613.57122-2-daniel.baluta@oss.nxp.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211116154613.57122-1-daniel.baluta@oss.nxp.com>
References: <20211116154613.57122-1-daniel.baluta@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0076.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::17) To VI1PR04MB5151.eurprd04.prod.outlook.com
 (2603:10a6:803:61::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (2a02:2f08:5706:b700:1e69:ee6:2dad:c9e7)
 by AM0PR06CA0076.eurprd06.prod.outlook.com (2603:10a6:208:fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16 via Frontend
 Transport; Tue, 16 Nov 2021 15:46:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: afa97390-4737-4820-839d-08d9a91842a4
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3824:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3824BEAC9ACF0FC0FF3F922DB8999@VI1PR0402MB3824.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Uk2tH8LTTiO+QGnzqEnF1IyHd5kf5PqhPkXYkttLVWApqjd+8pTpXja3Dacypam5nhZf2Pg3D49bViJ6gTvlncL+c7+6i945QOnK7WFcjNUftPPOdc3lj/vH/EJ56locJjVRUGGnp4vclAbqukjUnjkKiKMI3IyEBX+GnJaePyiZ2lfR+q6OdGyLmL4snAhiq5mWd5chVs6ALzt91U3M2Fdt0h5/BBo3beCikPoeX0LUY8MraY4dAFjhULdy2RuA+b3AjrXhltQN+TSPyFrIcW5RGGuGDon75iqdpb1hUi5BSVOcaD7DQJHtXE0cophKUpDPHI7Xp6ny9CTRTectJ5Fqeu6UYrxQKXotZAWAxC3XfWAEtqicHuQgM6qBjD6mLfSre8sgMtDIjBBKSVFn7wOxkSxyO48m2wcIRZUBULZU50JNVeEskYQAL39QUk8byczv88pH9WbQn5deZ2ZIaC3Tde1nYwRzWzTshWP/mMIJ3uRb4i5/qC2Ywlt1rr3m5yYKrpGeYPR3S0oNzjb8Hr1OAiL1tAGhp5bdZppT9XNkInV59/l5P5bpFA4yZDYjBLoT3W/9X34uV5mNNrTK7M/sisEujzsilGoaFIS367ljiT2xd821piyFbOCtBhxk5JeaBYWROeALNk3cG3JTeA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(186003)(5660300002)(1076003)(8936002)(38100700002)(66946007)(66556008)(66476007)(7416002)(86362001)(44832011)(6506007)(316002)(2906002)(83380400001)(6512007)(54906003)(6666004)(4326008)(508600001)(8676002)(2616005)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cq5OInA/J5+FKpAxfa8ToOqqDJ9GdNDWO9I6yMHQ3iekcWnjl52JT5yuLT54?=
 =?us-ascii?Q?3HUrbYijnMNn0atH8B2+1v1C3pMJ0BCJgjyeuI/Cdmhg2MX6eMdOpMLI6zLI?=
 =?us-ascii?Q?2659kZj9dA0NUNGHd2OlSq8LJZ25Gv9lL42e2B7DJLPs2b2jmrvtvNvFwEFh?=
 =?us-ascii?Q?O8AZoc/shmxZ/10DGIbEwdqzymrwT+f/zPvCRlsi1/JGpRl9EcvoBuVOwq5k?=
 =?us-ascii?Q?bYsjdoj0nPhPv67j+d4qt3sKN1FvVLrnwPJWJqkcL2s1x/KaqsuhXDAah3JN?=
 =?us-ascii?Q?K8jO/a4sV0Em0zQ7+IMsJnfrIn1PWedZcOcEupeWUtYa40fwxOjLwjEmD+xq?=
 =?us-ascii?Q?gRzyzbWR8eeFszN34PO3iSr8c+0nhci1Spq9PfMeZldyIEbS9B+JgB+H5UBj?=
 =?us-ascii?Q?q9RB3IAac7UhvTkjGzkDeV51xA3NFfYvaqGzYcH7Z/4d6T8HbpF/RXotKJS7?=
 =?us-ascii?Q?mWzejdxMZFP5h7cEejwV/eu7975NrrBZvH7kMVYa0wiAIaUJe9H9lbzN8c7p?=
 =?us-ascii?Q?tXy7+r+DQYaVBmAvyLZa/t21bkPZsR4b6wDILac0VAi4HmIvwADYmHJCjVHB?=
 =?us-ascii?Q?ce8NBIBlJBdn4uGdE9xOmdp54to2onO5ikg8c4HM1m5K5qQXwqJe2tM4UCC7?=
 =?us-ascii?Q?D4LI9tI6j2VQzk/yAuqkHaWnjvdsoe9iu3FkpJ7HNNWClaNMEL42ECXnv+EE?=
 =?us-ascii?Q?ZR1nR8BuanRqxqqXV58s8mvBSLreyK57ZqzDxnrq1o4QxBmdyaffX3petV6g?=
 =?us-ascii?Q?xnOIRtJC4sicguc7Ra/cnPdM2wR6CEH/p8QepOX+4Zb0+Uv2iYgTfxxtqS1L?=
 =?us-ascii?Q?1IzEfRs+CHiePeviOPYOS6ZtmzHo2KUFpSATYdseTDRqGe+yNoSOcN5EmHGd?=
 =?us-ascii?Q?lGfDqfAknd2ly8Nf7dlaAlnkehrPTDqXgPGjIlM+aaXJSw6ghyaj2LL0Zr6y?=
 =?us-ascii?Q?/kh6Znglw5Nz5vg8fchLkIf4cR6vO36noz3GHFcbaewqFFuyxY/xx1BOw6MK?=
 =?us-ascii?Q?qyu/3mBagTQ/wWTUMMoNaoQIP/vjzhFxgRhv/oGhO29tlwxuhSoPmoOWBY1f?=
 =?us-ascii?Q?SY6JjHIqSIjrCaZ4UyseABXr5oUmtH8b1ALGvH2sR7ufmgi895erbdLjD4ye?=
 =?us-ascii?Q?9GIBNAkWs0huTxBSvmB1ODvFdOYwfY9G8X0FJZmmLtLksxA/LnbrYmcLcik/?=
 =?us-ascii?Q?7dcInexM6AKsHncHE8wU6IV8VZSKlCw6aLrPZYm70S+2GnSgTIDrVmMuqi30?=
 =?us-ascii?Q?wTUywVh1i09haNB98zBnmc/bR6/XA/nejijwKNmAJ/SNETkf+o9EBZF54qyP?=
 =?us-ascii?Q?lXcvfESHu7/zTpiJj7iuqt3aJ1TwkMBcDmvObAtp7St1F545YETPLn3WJh3K?=
 =?us-ascii?Q?8BqqadhiyV3vQ5lQbZSSoamliudvOZvbChzy6o+ZWzNRJwcEuy1ima3CJdPd?=
 =?us-ascii?Q?aLoCF+gLDIO8fa8iNCFI1UgWyIkCipOJZas5lCW6CSleT1gI5wnAy3xjywsF?=
 =?us-ascii?Q?xSW5EcFgKwByN03grQB0xWzbog6ZZ1J4uarw8hMtge/jnPJu0nAfEPbLPpEC?=
 =?us-ascii?Q?10NdKQASD4f/x5lS9T4xpK0iSpzJ4iTetmXlQQFdL/KGx27/AS1cjjjvxikO?=
 =?us-ascii?Q?a175MsDMQmlNf/shsWZZFWvREg4nulOD9eVQYD/JTor/9KLME9K/FdUhyinJ?=
 =?us-ascii?Q?rm42JGyV72HpNGR8zuedEx8cv0QmbFMOGezosCuAPms3aAo1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa97390-4737-4820-839d-08d9a91842a4
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2021 15:46:31.3831 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MywTi4VxCdJRPF2U/s6hATKctLdnbj+mogTTXSAB1Xquno0ilcsQ61yyyqLBp8Q+SG6ttIK8V88igyTwfeiL9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3824
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 guennadi.liakhovetski@linux.intel.com, daniel.baluta@gmail.com,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 pierre-louis.bossart@linux.intel.com, linux-imx@nxp.com,
 Paul Olaru <paul.olaru@oss.nxp.com>, peter.ujfalusi@linux.intel.com
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

We need at least 3 clocks in order to power up and access
DSP core registers found on i.MX8QM, i.MX8QXP and i.MX8MP
platforms.

Add code to request these clocks and enable them at probe. Next
patches will add PM support which will only activate clocks when
DSP is used.

DSP clocks are already documented in
Documentation/devicetree/bindings/dsp/fsl,dsp.yaml

We choose to add:
	* imx8_parse_clocks
	* imx8_enable_clocks
	* imx8_disable_clocks

wrappers because in the future DSP will need to take care about the
clocks of other related Audio IPs (e.g SAI, ESAI).

Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
Reviewed-by: Paul Olaru <paul.olaru@oss.nxp.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 sound/soc/sof/imx/imx-common.c | 24 ++++++++++++++++++++++++
 sound/soc/sof/imx/imx-common.h | 11 +++++++++++
 sound/soc/sof/imx/imx8.c       | 23 +++++++++++++++++++++++
 sound/soc/sof/imx/imx8m.c      | 23 +++++++++++++++++++++++
 4 files changed, 81 insertions(+)

diff --git a/sound/soc/sof/imx/imx-common.c b/sound/soc/sof/imx/imx-common.c
index 8826ef94f04a..9371e9062cb1 100644
--- a/sound/soc/sof/imx/imx-common.c
+++ b/sound/soc/sof/imx/imx-common.c
@@ -74,4 +74,28 @@ void imx8_dump(struct snd_sof_dev *sdev, u32 flags)
 }
 EXPORT_SYMBOL(imx8_dump);
 
+int imx8_parse_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks)
+{
+	int ret;
+
+	ret = devm_clk_bulk_get(sdev->dev, clks->num_dsp_clks, clks->dsp_clks);
+	if (ret)
+		dev_err(sdev->dev, "Failed to request DSP clocks\n");
+
+	return ret;
+}
+EXPORT_SYMBOL(imx8_parse_clocks);
+
+int imx8_enable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks)
+{
+	return clk_bulk_prepare_enable(clks->num_dsp_clks, clks->dsp_clks);
+}
+EXPORT_SYMBOL(imx8_enable_clocks);
+
+void imx8_disable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks)
+{
+	clk_bulk_disable_unprepare(clks->num_dsp_clks, clks->dsp_clks);
+}
+EXPORT_SYMBOL(imx8_disable_clocks);
+
 MODULE_LICENSE("Dual BSD/GPL");
diff --git a/sound/soc/sof/imx/imx-common.h b/sound/soc/sof/imx/imx-common.h
index 1cc7d6704182..ec4b3a5c7496 100644
--- a/sound/soc/sof/imx/imx-common.h
+++ b/sound/soc/sof/imx/imx-common.h
@@ -3,6 +3,8 @@
 #ifndef __IMX_COMMON_H__
 #define __IMX_COMMON_H__
 
+#include <linux/clk.h>
+
 #define EXCEPT_MAX_HDR_SIZE	0x400
 #define IMX8_STACK_DUMP_SIZE 32
 
@@ -13,4 +15,13 @@ void imx8_get_registers(struct snd_sof_dev *sdev,
 
 void imx8_dump(struct snd_sof_dev *sdev, u32 flags);
 
+struct imx_clocks {
+	struct clk_bulk_data *dsp_clks;
+	int num_dsp_clks;
+};
+
+int imx8_parse_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks);
+int imx8_enable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks);
+void imx8_disable_clocks(struct snd_sof_dev *sdev, struct imx_clocks *clks);
+
 #endif
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 0aeb44d0acc7..32f852cbba30 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -41,6 +41,13 @@
 #define MBOX_OFFSET	0x800000
 #define MBOX_SIZE	0x1000
 
+/* DSP clocks */
+static struct clk_bulk_data imx8_dsp_clks[] = {
+	{ .id = "ipg" },
+	{ .id = "ocram" },
+	{ .id = "core" },
+};
+
 struct imx8_priv {
 	struct device *dev;
 	struct snd_sof_dev *sdev;
@@ -57,6 +64,7 @@ struct imx8_priv {
 	struct device **pd_dev;
 	struct device_link **link;
 
+	struct imx_clocks *clks;
 };
 
 static int imx8_get_mailbox_offset(struct snd_sof_dev *sdev)
@@ -188,6 +196,10 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->clks = devm_kzalloc(&pdev->dev, sizeof(*priv->clks), GFP_KERNEL);
+	if (!priv->clks)
+		return -ENOMEM;
+
 	sdev->pdata->hw_pdata = priv;
 	priv->dev = sdev->dev;
 	priv->sdev = sdev;
@@ -300,6 +312,16 @@ static int imx8_probe(struct snd_sof_dev *sdev)
 	/* set default mailbox offset for FW ready message */
 	sdev->dsp_box.offset = MBOX_OFFSET;
 
+	/* init clocks info */
+	priv->clks->dsp_clks = imx8_dsp_clks;
+	priv->clks->num_dsp_clks = ARRAY_SIZE(imx8_dsp_clks);
+
+	ret = imx8_parse_clocks(sdev, priv->clks);
+	if (ret < 0)
+		goto exit_pdev_unregister;
+
+	imx8_enable_clocks(sdev, priv->clks);
+
 	return 0;
 
 exit_pdev_unregister:
@@ -318,6 +340,7 @@ static int imx8_remove(struct snd_sof_dev *sdev)
 	struct imx8_priv *priv = sdev->pdata->hw_pdata;
 	int i;
 
+	imx8_disable_clocks(sdev, priv->clks);
 	platform_device_unregister(priv->ipc_dev);
 
 	for (i = 0; i < priv->num_domains; i++) {
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index f454a5d0a87e..ab40c0bdf796 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -23,6 +23,12 @@
 #define MBOX_OFFSET	0x800000
 #define MBOX_SIZE	0x1000
 
+static struct clk_bulk_data imx8m_dsp_clks[] = {
+	{ .id = "ipg" },
+	{ .id = "ocram" },
+	{ .id = "core" },
+};
+
 struct imx8m_priv {
 	struct device *dev;
 	struct snd_sof_dev *sdev;
@@ -30,6 +36,8 @@ struct imx8m_priv {
 	/* DSP IPC handler */
 	struct imx_dsp_ipc *dsp_ipc;
 	struct platform_device *ipc_dev;
+
+	struct imx_clocks *clks;
 };
 
 static int imx8m_get_mailbox_offset(struct snd_sof_dev *sdev)
@@ -108,6 +116,10 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 	if (!priv)
 		return -ENOMEM;
 
+	priv->clks = devm_kzalloc(&pdev->dev, sizeof(*priv->clks), GFP_KERNEL);
+	if (!priv->clks)
+		return -ENOMEM;
+
 	sdev->pdata->hw_pdata = priv;
 	priv->dev = sdev->dev;
 	priv->sdev = sdev;
@@ -175,6 +187,16 @@ static int imx8m_probe(struct snd_sof_dev *sdev)
 	/* set default mailbox offset for FW ready message */
 	sdev->dsp_box.offset = MBOX_OFFSET;
 
+	/* init clocks info */
+	priv->clks->dsp_clks = imx8m_dsp_clks;
+	priv->clks->num_dsp_clks = ARRAY_SIZE(imx8m_dsp_clks);
+
+	ret = imx8_parse_clocks(sdev, priv->clks);
+	if (ret < 0)
+		goto exit_pdev_unregister;
+
+	imx8_enable_clocks(sdev, priv->clks);
+
 	return 0;
 
 exit_pdev_unregister:
@@ -186,6 +208,7 @@ static int imx8m_remove(struct snd_sof_dev *sdev)
 {
 	struct imx8m_priv *priv = sdev->pdata->hw_pdata;
 
+	imx8_disable_clocks(sdev, priv->clks);
 	platform_device_unregister(priv->ipc_dev);
 
 	return 0;
-- 
2.27.0

