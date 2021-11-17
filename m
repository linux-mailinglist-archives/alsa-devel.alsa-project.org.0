Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 924FB4543FE
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:42:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33DFF181A;
	Wed, 17 Nov 2021 10:41:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33DFF181A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142123;
	bh=vdJXIMFkU91ICNZKTNxzkogR+aDvfMVePg4KrqoycUM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=X6TsnT3EHvjbYZsUeg+zkLNkqYQskTH4j0nReNlqhh0sAF7XTFjoFmRrUFP+UBq6S
	 khJVDc8CUEuLy39GQOUzTgm71rFtNAAM2sdBijXdstVnjSM4EEWJ3hXXEfX4dGm1ik
	 usdnjRxGbs9RFoJbfFvUZagQUphZOFs0fERtYVw0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5CF64F8052E;
	Wed, 17 Nov 2021 10:38:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9596F804EC; Wed, 17 Nov 2021 10:38:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7041FF8027D
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7041FF8027D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="l95fOrk6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j0+SXI7hiGuw256reNr3hQaeFOZGHGm+BN/GWDKLGU3LF0JHwVClobS40bOFwjvknZM3hVik1tShhwDL414c5ocrwEeO/2toJ8DErjtijRKXNMNEqhdodT/he4Bg6gAo67r0W/ZU9Ob06IPcwl0ujVT7ioXM8zkEUMXTwb0KnhMqfReF+McmO0q7xzdbhcZOzIaJq2dbd1cskdWZFB2thZEFQl/kKNaTZTlE6iwkxzM7eSeNcct72Y4cKZ8eMZXmNZvOziD+GKh3h7CRo7OqxB797kmWTxO5/VcJ3QuYdMjbzEgtKE+RLazP9k5ZxpdXIsO/Z+bzdDslQghDG3DYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FhQ3Xjm9LYLed451PnZa7lr7pWQBC1GLGS66r+lkId4=;
 b=dYDtdXXvD0TKGfwSOzk2kZBxlnT78kgL26d7y/LySlG9TiW6n7urU5XM+nP9ShnukILRwUMJvg6HATabdCbEgc/oj5xQ0s85iS+ogLzm/Ug0vBxHgHvuxlB6KSAHVkcPvxp7Wn7sHciBPa/48GDguVSZhX1vUZSyItVKUNEfbmWygFETcn88s6CAoiiBJVZ4JDlbcjNayTjAdUc2FKvxfneNH69uQz32SCQl7QNPjT5JZzpq9MIIlibai4ZApGAcXjYhyz7ErbPP/BX0bZBKvPCMFzu84ZHbhsc6wckc+qAFUHEwhgsrkRYtj4dxXm/g225hlPpI0AScraxr9lKC/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FhQ3Xjm9LYLed451PnZa7lr7pWQBC1GLGS66r+lkId4=;
 b=l95fOrk6JJL+oYpA9ed+YnhokDMXyV+AS1NbxnWvjjCDKoaYbHFYpv4TABggZwAfTU4R90xTX37TrFwecpq4kyI4Vn4nNT/En5TxT6tb0NHlfFrnIuxSYSva8LFTvl2UYiAmcf5cYQheXoanZHv2eEeentzF8Y+yYPO/cMVaPHM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB6623.eurprd04.prod.outlook.com (2603:10a6:803:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 09:38:07 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:07 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 02/21] ASoC: SOF: amd: Add helper callbacks for ACP's DMA
 configuration
Date: Wed, 17 Nov 2021 11:37:15 +0200
Message-Id: <20211117093734.17407-3-daniel.baluta@oss.nxp.com>
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
 Transport; Wed, 17 Nov 2021 09:38:05 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19584666-a9da-4fc7-a4c3-08d9a9adf620
X-MS-TrafficTypeDiagnostic: VE1PR04MB6623:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB6623334A84CA3A7B618AA5AFB89A9@VE1PR04MB6623.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/mj5wzt+6Y5NaWpUY+HhS/ubRvy8lD/ecFfLBlzhMQPOlKUlD/om7EeGwOk9zPanXZ0nsRCZBpQ+Ti42/kAYlWHEOvlGXo26neou6vJ7PDnUvmOTiANfvcLKHA9L5XgUmpqcSNMceyORWxN3AG0pMtzMjueBNPk3ZS/hLuEwXX9Hc0gfHHIoLJmvCrQzEVs5Reb2K9VKomJyo4A9nFvqnjLPKp2vSkI9mscFZSO5gqurdmfaeVcbirDpjlO+MYfpkVy1FNdjTUiRi/LvlFPy+sS5zMOWxvchT8b35D7gdlfkN0MwkGlLDhJGCeLfjKhid50aG38AnYaHCsy7SOYwRYXyIXvwN3PE5zQb/JLofMZiALglZ8qCCFxn0PPci6gclU/T58v5Ft5mQYg62RgkxPndhxutK/lW4dLKIXRMHr1MIOhgdOMf3mDSUjHX24wMxQmtHwY7W3p61Kto0wlwC7OMquKukf2QwSLMf0OafeBY+XVtmjeepAQQSe/cb7cvz97u5ZOo1etAxQug8Eh4gFHofq1lfA+DsbYfQw8JnRCGzdaho2/i5X6GS1dYy85mu/uZA0O/8lHeNZluGvh7jXnc+QIN4DrUyiNQp+8Bp6l1XyzrujqgklINHDJ+4PZEi7GCRVaDfQjJTG5X2PJmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(30864003)(1076003)(52116002)(6506007)(5660300002)(54906003)(8676002)(508600001)(186003)(86362001)(6666004)(2616005)(6512007)(7416002)(83380400001)(44832011)(66556008)(66476007)(4326008)(66946007)(316002)(38100700002)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KqpNn7N1/fqjr692djbLRU8/438g6C6ZVqTZR1uKy7Za3m679dBBB75ozQEj?=
 =?us-ascii?Q?d7vx6dVYd+jSZJW1BYdbpAMXuqwunvloHo2k75ZELm6PEQxVy/BCAFYynJzY?=
 =?us-ascii?Q?Ymdu8VDIffZmMyc8VB+8eOWTzRSTaRIfdvc95lW7RsOI3cnqp068stG4QOrK?=
 =?us-ascii?Q?r+0W+g2jS09UxIag+kNJO81a5fPW+k9VOoAHYxARYfItHJKiuXMqqh3AIvW3?=
 =?us-ascii?Q?DR1KJztUm8x06xweikF9RBzoYpZ9y/srWJckVfV7STTu7MYvPfjAw/jzFJ51?=
 =?us-ascii?Q?sMPBjBI306WCATrVj5JyoeQXESTs8ldVQw/18hLwIkZxLtH2iwVneUfkGd0Q?=
 =?us-ascii?Q?yd4dQQZzcaVSJ0JQfMXKmzCBIkLWHrtc3op7J/j/appw38mijusM7u0MdQZV?=
 =?us-ascii?Q?1NZ4TShuDzSHi0O/Ds9TzRXK3NXpsuLb8YC6GTfv/W1PMa8UvDletayXJdLX?=
 =?us-ascii?Q?ppukhRxxuSH5sTF01RDrB+ifk7LgUi5qwAZOzTkWtGKJ/7xvbMkqfreBlAms?=
 =?us-ascii?Q?NSc+l747pdcFPNYTybCb54tG9uuhzr0I8TJhm/DzsRvb+zLQpCiXAA6Ky/f6?=
 =?us-ascii?Q?HHBsitClA0kBaDpkGym5qtXms2PLbbyigUhrinmuZUix3Bfp9vue4JbZIsMM?=
 =?us-ascii?Q?EA0A1YQowaPhkTTfQrp+kelRJ2JGbh1WQOFf6XtQwMW/HgAx73yAGeB9joXI?=
 =?us-ascii?Q?TqnLWM7KwFHd/0riJOW+PKgWU+SI8/UeD9WeP3GL/u9BGGqvQb81E1qFaVFg?=
 =?us-ascii?Q?8m0QYa9hpZ1FA3RaLXrlCw+mikccz9yB2+v7gLFaC819oV7if2qV5dPh+A8w?=
 =?us-ascii?Q?fnRVKSSYSS7hJ0IpMLngJvgDwteu5990FVhCXeJ0oAxhSX1aNSLiLaTe4168?=
 =?us-ascii?Q?XyuypvJxw0Ak1MTlbfOHHht8Ar8j0nNFuADTqYUlWzcUaA92eWy+JsPLQR/V?=
 =?us-ascii?Q?6y/SooWYlDsfVhvF1XILtyx3SSevYEAZotA4Jhd2LcJ/nuVTmkZxTmH+FSvU?=
 =?us-ascii?Q?rPtp7wmasI5Ddh23qdaaK/O3ef/N0mlERtvVFKdvSOkVV2YltraW0xvvYeB1?=
 =?us-ascii?Q?sV7wuR1syJwcGmh820h24Jzo7V6SU5bGlUfcUwKgGMTR9VkfzOUfpiER6wk3?=
 =?us-ascii?Q?nGjiaTHAVn1I5ik1W/FRAse2mN0A5ZwHH1HN+d35Z0FJBr1+5lYDW91VQeH8?=
 =?us-ascii?Q?ycirjU/ILhDrGiL3kzJHem9qFeLguiC8WkD6fzrShNr928gwWVes+D2KH3fW?=
 =?us-ascii?Q?FB6Ah2NeU1LcS3BeU+/GmRecdgqpyfXiTYvj5YIqH/8l2+B3pVYd27IzhyRi?=
 =?us-ascii?Q?4WAxt59py2LgHKvXSBSHOX/7cf3JtnvUJti0wnJtAbfqrwpgoZcziVYKdFUV?=
 =?us-ascii?Q?epbzGg8J/DOXyCIrT7OKaFqCNzxtjQHOQwjrQgwGHSJyCDn00kSJEngLZ19M?=
 =?us-ascii?Q?YbGrUgEqKKqg0Gev8K/D5OsqLf+vOgRubzlaS/FgX/AeaTu1pHOaZc+i6Kbj?=
 =?us-ascii?Q?fzoO5RBx32fVtql8fJDd6jW7ZEKWz3SvAaOctYdQL+WP13L8TG15CBN0xUPf?=
 =?us-ascii?Q?Xp9AABmFNayTiNSEY0M8wQKYWAMuV7YpSGc98oMBD+Vgp2OoIuFRyMqWHi08?=
 =?us-ascii?Q?MDY+3Qs8DOxY3q9t6H/N6a0PMMpz3N7t8wa/GdxHq5shsDgrToVehT0Zn9na?=
 =?us-ascii?Q?NwPUbxo7Bs+qYcVUeUKHWG9Yb8kaxcnebD/in5/bFkQ3RUu9?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19584666-a9da-4fc7-a4c3-08d9a9adf620
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:07.5155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hJpw3uMeIxsyUo+3c0YoYNIFSG2LotvAvsCzXtzFjZ91vtshI35kUqxT0U4vDh9CVjPHJ5j6jZDW2d2HKmCRAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6623
Cc: daniel.baluta@gmail.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 AjitKumar.Pandey@amd.com, linux-kernel@vger.kernel.org,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
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

ACP DMA is used for loading SOF firmware into DSP memory and data
transfer from system memory to DSP memory. Add helper callbacks to
initialize and configure ACP DMA block for fw loading.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Bard Liao <bard.liao@intel.com>
Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/amd/acp-dsp-offset.h |  47 ++++++
 sound/soc/sof/amd/acp.c            | 222 ++++++++++++++++++++++++++++-
 sound/soc/sof/amd/acp.h            |  91 ++++++++++++
 3 files changed, 359 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index 2cc2a9a842c5..bfb02390b414 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -11,10 +11,57 @@
 #ifndef _ACP_DSP_IP_OFFSET_H
 #define _ACP_DSP_IP_OFFSET_H
 
+/* Registers from ACP_DMA_0 block */
+#define ACP_DMA_CNTL_0				0x00
+#define ACP_DMA_DSCR_STRT_IDX_0			0x20
+#define ACP_DMA_DSCR_CNT_0			0x40
+#define ACP_DMA_PRIO_0				0x60
+#define ACP_DMA_CUR_DSCR_0			0x80
+#define ACP_DMA_ERR_STS_0			0xC0
+#define ACP_DMA_DESC_BASE_ADDR			0xE0
+#define ACP_DMA_DESC_MAX_NUM_DSCR		0xE4
+#define ACP_DMA_CH_STS				0xE8
+#define ACP_DMA_CH_GROUP			0xEC
+#define ACP_DMA_CH_RST_STS			0xF0
+
+/* Registers from ACP_AXI2AXIATU block */
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1		0xC00
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_1		0xC04
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_2		0xC08
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_2		0xC0C
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_3		0xC10
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_3		0xC14
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_4		0xC18
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_4		0xC1C
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5		0xC20
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_5		0xC24
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_6		0xC28
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_6		0xC2C
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_7		0xC30
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_7		0xC34
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_8		0xC38
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_8		0xC3C
+#define ACPAXI2AXI_ATU_CTRL			0xC40
 #define ACP_SOFT_RESET				0x1000
 
 /* Registers from ACP_PGFSM block */
 #define ACP_PGFSM_CONTROL			0x141C
 #define ACP_PGFSM_STATUS			0x1420
 
+/* Registers from ACP_INTR block */
+#define ACP_DSP_SW_INTR_CNTL			0x1814
+#define ACP_ERROR_STATUS			0x18C4
+
+/* Registers from ACP_SHA block */
+#define ACP_SHA_DSP_FW_QUALIFIER		0x1C70
+#define ACP_SHA_DMA_CMD				0x1CB0
+#define ACP_SHA_MSG_LENGTH			0x1CB4
+#define ACP_SHA_DMA_STRT_ADDR			0x1CB8
+#define ACP_SHA_DMA_DESTINATION_ADDR		0x1CBC
+#define ACP_SHA_DMA_CMD_STS			0x1CC0
+#define ACP_SHA_DMA_ERR_STATUS			0x1CC4
+#define ACP_SHA_TRANSFER_BYTE_CNT		0x1CC8
+
+#define ACP_SCRATCH_REG_0			0x10000
+
 #endif
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 687a67419335..3778f781f16a 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -20,6 +20,219 @@
 #include "acp.h"
 #include "acp-dsp-offset.h"
 
+static void configure_acp_groupregisters(struct acp_dev_data *adata)
+{
+	struct snd_sof_dev *sdev = adata->dev;
+
+	/* Group Enable */
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACPAXI2AXI_ATU_BASE_ADDR_GRP_1,
+			  ACP_SRAM_PTE_OFFSET | BIT(31));
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1,
+			  PAGE_SIZE_4K_ENABLE);
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACPAXI2AXI_ATU_CTRL, ACP_ATU_CACHE_INVALID);
+}
+
+static void init_dma_descriptor(struct acp_dev_data *adata)
+{
+	struct snd_sof_dev *sdev = adata->dev;
+	unsigned int addr;
+
+	addr = ACP_SRAM_PTE_OFFSET + offsetof(struct scratch_reg_conf, dma_desc);
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_DESC_BASE_ADDR, addr);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_DESC_MAX_NUM_DSCR, ACP_MAX_DESC_CNT);
+}
+
+static void configure_dma_descriptor(struct acp_dev_data *adata, unsigned short idx,
+				     struct dma_descriptor *dscr_info)
+{
+	struct snd_sof_dev *sdev = adata->dev;
+	unsigned int offset;
+
+	offset = ACP_SCRATCH_REG_0 + offsetof(struct scratch_reg_conf, dma_desc) +
+		 idx * sizeof(struct dma_descriptor);
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, offset, dscr_info->src_addr);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, offset + 0x4, dscr_info->dest_addr);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, offset + 0x8, dscr_info->tx_cnt.u32_all);
+}
+
+static int config_dma_channel(struct acp_dev_data *adata, unsigned int ch,
+			      unsigned int idx, unsigned int dscr_count)
+{
+	struct snd_sof_dev *sdev = adata->dev;
+	unsigned int val, status;
+	int ret;
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_CNTL_0 + ch * sizeof(u32),
+			  ACP_DMA_CH_RST | ACP_DMA_CH_GRACEFUL_RST_EN);
+
+	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_DMA_CH_RST_STS, val,
+					    val & (1 << ch), ACP_REG_POLL_INTERVAL,
+					    ACP_REG_POLL_TIMEOUT_US);
+	if (ret < 0) {
+		status = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_ERROR_STATUS);
+		val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DMA_ERR_STS_0 + ch * sizeof(u32));
+
+		dev_err(sdev->dev, "ACP_DMA_ERR_STS :0x%x ACP_ERROR_STATUS :0x%x\n", val, status);
+		return ret;
+	}
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, (ACP_DMA_CNTL_0 + ch * sizeof(u32)), 0);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_DSCR_CNT_0 + ch * sizeof(u32), dscr_count);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_DSCR_STRT_IDX_0 + ch * sizeof(u32), idx);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_PRIO_0 + ch * sizeof(u32), 0);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_DMA_CNTL_0 + ch * sizeof(u32), ACP_DMA_CH_RUN);
+
+	return ret;
+}
+
+static int acpbus_dma_start(struct acp_dev_data *adata, unsigned int ch,
+			    unsigned int dscr_count, struct dma_descriptor *dscr_info)
+{
+	struct snd_sof_dev *sdev = adata->dev;
+	int ret;
+	u16 dscr;
+
+	if (!dscr_info || !dscr_count)
+		return -EINVAL;
+
+	for (dscr = 0; dscr < dscr_count; dscr++)
+		configure_dma_descriptor(adata, dscr, dscr_info++);
+
+	ret = config_dma_channel(adata, ch, 0, dscr_count);
+	if (ret < 0)
+		dev_err(sdev->dev, "config dma ch failed:%d\n", ret);
+
+	return ret;
+}
+
+int configure_and_run_dma(struct acp_dev_data *adata, unsigned int src_addr,
+			  unsigned int dest_addr, int dsp_data_size)
+{
+	struct snd_sof_dev *sdev = adata->dev;
+	unsigned int desc_count, index;
+	int ret;
+
+	for (desc_count = 0; desc_count < ACP_MAX_DESC && dsp_data_size >= 0;
+	     desc_count++, dsp_data_size -= ACP_PAGE_SIZE) {
+		adata->dscr_info[desc_count].src_addr = src_addr + desc_count * ACP_PAGE_SIZE;
+		adata->dscr_info[desc_count].dest_addr = dest_addr + desc_count * ACP_PAGE_SIZE;
+		adata->dscr_info[desc_count].tx_cnt.bits.count = ACP_PAGE_SIZE;
+		if (dsp_data_size < ACP_PAGE_SIZE)
+			adata->dscr_info[desc_count].tx_cnt.bits.count = dsp_data_size;
+	}
+
+	ret = acpbus_dma_start(adata, 0, desc_count, adata->dscr_info);
+	if (ret)
+		dev_err(sdev->dev, "acpbus_dma_start failed\n");
+
+	/* Clear descriptor array */
+	for (index = 0; index < desc_count; index++)
+		memset(&adata->dscr_info[index], 0x00, sizeof(struct dma_descriptor));
+
+	return ret;
+}
+
+int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
+			      unsigned int start_addr, unsigned int dest_addr,
+			      unsigned int image_length)
+{
+	struct snd_sof_dev *sdev = adata->dev;
+	unsigned int tx_count, fw_qualifier, val;
+	int ret;
+
+	if (!image_addr) {
+		dev_err(sdev->dev, "SHA DMA image address is NULL\n");
+		return -EINVAL;
+	}
+
+	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD);
+	if (val & ACP_SHA_RUN) {
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD, ACP_SHA_RESET);
+		ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD_STS,
+						    val, val & ACP_SHA_RESET,
+						    ACP_REG_POLL_INTERVAL,
+						    ACP_REG_POLL_TIMEOUT_US);
+		if (ret < 0) {
+			dev_err(sdev->dev, "SHA DMA Failed to Reset\n");
+			return ret;
+		}
+	}
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_STRT_ADDR, start_addr);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_DESTINATION_ADDR, dest_addr);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_MSG_LENGTH, image_length);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DMA_CMD, ACP_SHA_RUN);
+
+	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_TRANSFER_BYTE_CNT,
+					    tx_count, tx_count == image_length,
+					    ACP_REG_POLL_INTERVAL, ACP_DMA_COMPLETE_TIMEOUT_US);
+	if (ret < 0) {
+		dev_err(sdev->dev, "SHA DMA Failed to Transfer Length %x\n", tx_count);
+		return ret;
+	}
+
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER, DSP_FW_RUN_ENABLE);
+
+	fw_qualifier = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER);
+	if (!(fw_qualifier & DSP_FW_RUN_ENABLE)) {
+		dev_err(sdev->dev, "PSP validation failed\n");
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+int acp_dma_status(struct acp_dev_data *adata, unsigned char ch)
+{
+	struct snd_sof_dev *sdev = adata->dev;
+	unsigned int val;
+	int ret = 0;
+
+	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DMA_CNTL_0 + ch * sizeof(u32));
+	if (val & ACP_DMA_CH_RUN) {
+		ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_DMA_CH_STS, val, !val,
+						    ACP_REG_POLL_INTERVAL,
+						    ACP_DMA_COMPLETE_TIMEOUT_US);
+		if (ret < 0)
+			dev_err(sdev->dev, "DMA_CHANNEL %d status timeout\n", ch);
+	}
+
+	return ret;
+}
+
+void memcpy_from_scratch(struct snd_sof_dev *sdev, u32 offset, unsigned int *dst, size_t bytes)
+{
+	unsigned int reg_offset = offset + ACP_SCRATCH_REG_0;
+	int i, j;
+
+	for (i = 0, j = 0; i < bytes; i = i + 4, j++)
+		dst[j] = snd_sof_dsp_read(sdev, ACP_DSP_BAR, reg_offset + i);
+}
+
+void memcpy_to_scratch(struct snd_sof_dev *sdev, u32 offset, unsigned int *src, size_t bytes)
+{
+	unsigned int reg_offset = offset + ACP_SCRATCH_REG_0;
+	int i, j;
+
+	for (i = 0, j = 0; i < bytes; i = i + 4, j++)
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, reg_offset + i, src[j]);
+}
+
+static int acp_memory_init(struct snd_sof_dev *sdev)
+{
+	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
+
+	snd_sof_dsp_update_bits(sdev, ACP_DSP_BAR, ACP_DSP_SW_INTR_CNTL,
+				ACP_DSP_INTR_EN_MASK, ACP_DSP_INTR_EN_MASK);
+	configure_acp_groupregisters(adata);
+	init_dma_descriptor(adata);
+
+	return 0;
+}
+
 static int acp_power_on(struct snd_sof_dev *sdev)
 {
 	unsigned int val;
@@ -86,6 +299,7 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	struct acp_dev_data *adata;
 	unsigned int addr;
+	int ret;
 
 	adata = devm_kzalloc(sdev->dev, sizeof(struct acp_dev_data),
 			     GFP_KERNEL);
@@ -104,7 +318,13 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 
 	sdev->pdata->hw_pdata = adata;
 
-	return acp_init(sdev);
+	ret = acp_init(sdev);
+	if (ret < 0)
+		return ret;
+
+	acp_memory_init(sdev);
+
+	return 0;
 }
 EXPORT_SYMBOL_NS(amd_sof_acp_probe, SND_SOC_SOF_AMD_COMMON);
 
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index c7ac8f9941d5..ff01d0ef67ef 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -15,6 +15,7 @@
 
 #define ACP_REG_POLL_INTERVAL                   500
 #define ACP_REG_POLL_TIMEOUT_US                 2000
+#define ACP_DMA_COMPLETE_TIMEOUT_US		5000
 
 #define ACP_PGFSM_CNTL_POWER_ON_MASK		0x01
 #define ACP_PGFSM_STATUS_MASK			0x03
@@ -23,11 +24,101 @@
 #define ACP_RELEASE_RESET			0x00
 #define ACP_SOFT_RESET_DONE_MASK		0x00010001
 
+#define ACP_DSP_INTR_EN_MASK			0x00000001
+#define ACP_SRAM_PTE_OFFSET			0x02050000
+#define PAGE_SIZE_4K_ENABLE			0x2
+#define ACP_PAGE_SIZE				0x1000
+#define ACP_DMA_CH_RUN				0x02
+#define ACP_MAX_DESC_CNT			0x02
+#define DSP_FW_RUN_ENABLE			0x01
+#define ACP_SHA_RUN				0x01
+#define ACP_SHA_RESET				0x02
+#define ACP_DMA_CH_RST				0x01
+#define ACP_DMA_CH_GRACEFUL_RST_EN		0x10
+#define ACP_ATU_CACHE_INVALID			0x01
+#define ACP_MAX_DESC				128
+#define ACPBUS_REG_BASE_OFFSET			ACP_DMA_CNTL_0
+
+struct  acp_atu_grp_pte {
+	u32 low;
+	u32 high;
+};
+
+union dma_tx_cnt {
+	struct {
+		unsigned int count : 19;
+		unsigned int reserved : 12;
+		unsigned ioc : 1;
+	} bitfields, bits;
+	unsigned int u32_all;
+	signed int i32_all;
+};
+
+struct dma_descriptor {
+	unsigned int src_addr;
+	unsigned int dest_addr;
+	union dma_tx_cnt tx_cnt;
+	unsigned int reserved;
+};
+
+/* Scratch memory structure for communication b/w host and dsp */
+struct  scratch_ipc_conf {
+	/* DSP mailbox */
+	u8 sof_out_box[512];
+	/* Host mailbox */
+	u8 sof_in_box[512];
+	/* Debug memory */
+	u8 sof_debug_box[1024];
+	/* Exception memory*/
+	u8 sof_except_box[1024];
+	/* Stream buffer */
+	u8 sof_stream_box[1024];
+	/* Trace buffer */
+	u8 sof_trace_box[1024];
+	/* Host msg flag */
+	u32 sof_host_msg_write;
+	/* Host ack flag*/
+	u32 sof_host_ack_write;
+	/* DSP msg flag */
+	u32 sof_dsp_msg_write;
+	/* Dsp ack flag */
+	u32 sof_dsp_ack_write;
+};
+
+struct  scratch_reg_conf {
+	struct scratch_ipc_conf info;
+	struct acp_atu_grp_pte grp1_pte[16];
+	struct acp_atu_grp_pte grp2_pte[16];
+	struct acp_atu_grp_pte grp3_pte[16];
+	struct acp_atu_grp_pte grp4_pte[16];
+	struct acp_atu_grp_pte grp5_pte[16];
+	struct acp_atu_grp_pte grp6_pte[16];
+	struct acp_atu_grp_pte grp7_pte[16];
+	struct acp_atu_grp_pte grp8_pte[16];
+	struct dma_descriptor dma_desc[64];
+	unsigned int reg_offset[8];
+	unsigned int buf_size[8];
+	u8 acp_tx_fifo_buf[256];
+	u8 acp_rx_fifo_buf[256];
+	unsigned int    reserve[];
+};
+
 /* Common device data struct for ACP devices */
 struct acp_dev_data {
 	struct snd_sof_dev  *dev;
+	struct dma_descriptor dscr_info[ACP_MAX_DESC];
 };
 
+void memcpy_to_scratch(struct snd_sof_dev *sdev, u32 offset, unsigned int *src, size_t bytes);
+void memcpy_from_scratch(struct snd_sof_dev *sdev, u32 offset, unsigned int *dst, size_t bytes);
+
+int acp_dma_status(struct acp_dev_data *adata, unsigned char ch);
+int configure_and_run_dma(struct acp_dev_data *adata, unsigned int src_addr,
+			  unsigned int dest_addr, int dsp_data_size);
+int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
+			      unsigned int start_addr, unsigned int dest_addr,
+			      unsigned int image_length);
+
 /* ACP device probe/remove */
 int amd_sof_acp_probe(struct snd_sof_dev *sdev);
 int amd_sof_acp_remove(struct snd_sof_dev *sdev);
-- 
2.27.0

