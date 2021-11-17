Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E5945440C
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Nov 2021 10:43:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 532DC1832;
	Wed, 17 Nov 2021 10:43:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 532DC1832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1637142233;
	bh=PEjLoj2ClAVXXFWnutwtNLa1Er0sO7E8nw4uMz+IvLw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YymjGEmy9MCt9SzHiTYNdS3BVSF1X8jEuf5bXGgyFPUFaNJ56uKwN89S5YomCMXIO
	 qQ+hdj5s4cbMTMLL+dPJnUc7dXAyEhkvxwsZDWkex4sFuRim23W97pGRuyWF6pU/xf
	 WzGmutoM/L1itFCM6vV56lJVyx7+OH7wlUzDxkBw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 01BB4F80568;
	Wed, 17 Nov 2021 10:38:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76538F80515; Wed, 17 Nov 2021 10:38:37 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 MSGID_FROM_MTA_HEADER, SPF_HELO_NONE, SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80073.outbound.protection.outlook.com [40.107.8.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C627BF80506
 for <alsa-devel@alsa-project.org>; Wed, 17 Nov 2021 10:38:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C627BF80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=NXP1.onmicrosoft.com
 header.i=@NXP1.onmicrosoft.com header.b="IHtNgfzT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dedfFeg5LVfA4fxqKHa2bSeDj+RO51mfUJzF/S5qZgjLbBJtVY1Z4GeiyrshIw0PWHaX7HB5v6y0de/NL0UdQQXYXCKuT9hM/xAsG64w82CyQB7m6uSHslNzesM81Y1Dz45wHtVCyUgKMj4zlUvgSosc0+yiKwg7RS5DF23fYAOeVUOtSSq5vd88Oxt4waUhwNNRJ6RVEWgUVvSs78InrhkHDnXLtoaBS4X94bwSsj3t3AjC4GafDYRxSPMuIezwxI5Ro94S9buFAhFeSS5i6xoYr2xN4mKSvemIjOdTd71d+AfjNm2+yt9wu/kzrv6vhwN/mMtjEA9BlY7NICC0oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rdtHZDIv5NASSCwbbXRs5IgvOG61UBHZDcX4eipvbRI=;
 b=KoiGVcZSwElI3L7VVGlzALHvCfSajklzchkVDHZjFZ+41fFefcSnkpIXTfb9kFxmGlUdFJhVe87NzpXWMRBSazjohwVZ3pzVZg4cW8Zlc1HekUM9ZZibHRRo2RdF1I/nr5sodu9atTk3pFU8OaRB3edHulb1S3peqrVSQXPWs0cGafcLK1LJgjNSD4Jq6F8YsY1AEB46R+sDqTJqdteudNDSNxbGav4IuW1Tyt5peB4rMKmigmCGsqD098bvHEssnBM7NEy2Yl5HS1X+dgPWqtnsZPtPVp6mL2mX9DFurS66s6JwNRkH8IuSFftj38fiiAyjf2P8KKEX3cLof3Ph/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rdtHZDIv5NASSCwbbXRs5IgvOG61UBHZDcX4eipvbRI=;
 b=IHtNgfzToBGio2KUE21Z9AGyM1NeItqlaGcOTUK5Q9YwS5gj1DMDOCccCbO8zhGvtIm+9/lExxk+tFGurx6tzucBlQSygWyQ86Vcabj4GPdZtQ5FPpJ7mgxUW2d9oDpC8x4gM+SayRW1vX9/jcwxAjyqOakEJKyPTGIFUiSA9Cg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com (2603:10a6:803:61::28)
 by VE1PR04MB6623.eurprd04.prod.outlook.com (2603:10a6:803:125::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 09:38:28 +0000
Received: from VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f]) by VI1PR04MB5151.eurprd04.prod.outlook.com
 ([fe80::85af:f8be:aa99:ba5f%3]) with mapi id 15.20.4690.027; Wed, 17 Nov 2021
 09:38:27 +0000
From: Daniel Baluta <daniel.baluta@oss.nxp.com>
To: broonie@kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH 13/21] ASoC: SOF: amd: Add support for SOF firmware
 authentication
Date: Wed, 17 Nov 2021 11:37:26 +0200
Message-Id: <20211117093734.17407-14-daniel.baluta@oss.nxp.com>
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
 Transport; Wed, 17 Nov 2021 09:38:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 019c06fe-ee48-4f0c-fc46-08d9a9ae0233
X-MS-TrafficTypeDiagnostic: VE1PR04MB6623:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-Microsoft-Antispam-PRVS: <VE1PR04MB66234B969E60A12B1CEFF27FB89A9@VE1PR04MB6623.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cb6EmpcMBgfA9DQ/8OOWpq4vZBD7x1Uce7AN4HkQQNf9+xisZBXkKFftc/HJSJcb3ZdPQ4qPDa9ChX9a0DClEHGMTI4PZFf3W1WWg2Ug3nRtYH4B0Te6Cf36c1QKQbzp6uiGsFjZ2iZLFq60npfdHlVPzI63VfiizHWnDL1VZKxM8Lwx5+dpACRuIMgF1DT5DtLFdBy3DORTtA0vhHg5ZjlJMGIxkmFc5a0+spkIgfp9htiDi/RKawC0gmSJXLOGbZJK8nRYkXwt71f+tSMK7Qh598dRJIfS0piwEEUq8C7DPxyWQeFSxXLeYjrs3ja3EKJsjC8E5ccBj405X8Y2f9cclsZYYFsCYpgbj7NQokbwD+vB+ZQf2rTkiyAZEbmqaXQgMOZ8AkicF29k601uKE3Wtf/TLbAvJYDzFqDCyaQRVpGi924gyvgjW5P3AHcGY0FuQ5BtA5cIH1vjCs5yPhe3uvj4m4rRNs7oX7T7Yta/ezWg4MeO8pWG+OVTX9S1g0S7Xg4r4UHdAPR1OgVoDyDgIb8kX3aTa3uCs6/IDU7M9Y6rip/M/ClLdMiEfT1CjXezdld8gNP+EtXUHw3wDqG2gNEF07RX9LZREcEVuFdVCUJKev29fO66Ap7zFJaHn0ZoXr5c6oobzNGgphFi5w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR04MB5151.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(1076003)(52116002)(6506007)(5660300002)(54906003)(8676002)(508600001)(186003)(86362001)(2616005)(6512007)(7416002)(83380400001)(44832011)(66556008)(66476007)(4326008)(66946007)(316002)(38100700002)(6486002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1xNlSoOCSHxXtiqracHEaFqUtxPToYrnxFxfhMaKKJvmB/S+yaP31ZaVLOdK?=
 =?us-ascii?Q?IiRYMyfDJtpLnLJ/aZqbQDgpPTi8pOXqE5Gpoi6OVQYtzWBUNs5wccNXAhDl?=
 =?us-ascii?Q?MWQCG8dmqHfi2k8bqa6aQ/DV0HrUIOJIHVhZel6aksjKxy9FAwy1QvTgI6I6?=
 =?us-ascii?Q?/4GXMD/rijR2xqXLfsQ1TVwA6ag5dpIJ/LAjrOnhGbycO1srmqzyX8f9m+3k?=
 =?us-ascii?Q?Wc2sQRkMtWyxg0Y3+5+CfV+aPZqivhW5FeipEafnBofLNxau7tt1IHi0nG0b?=
 =?us-ascii?Q?p6dCOp92jmcIyRhiCq/LUK2Za5M2a98zHHKN/Ow17Sw4xNCTYBv/ti58oKBT?=
 =?us-ascii?Q?qPXnUp/YgwZb+fPvv8PyIN1bt2cKxFQkqqr5GNA9rWrIaIGljk7WsqCeej7m?=
 =?us-ascii?Q?A+TLhLYI8Mbc1h0smONLYiIqqrd2CXK2X7kwGoPJTt4eC614XybYh+RK6AKp?=
 =?us-ascii?Q?gwdfI/qkGbGwtCr4occY0tRYJMV8wKtlh3UavdxX/riQ7CyCahjDeIeHMvCH?=
 =?us-ascii?Q?AI+PPLqYa5sHEc8Nd8WISBdAh6pO+9+wohbrWMbWNoSnXpWMnxPSLrUYaqnO?=
 =?us-ascii?Q?0mYDW00wOxf7NhSA9IviyYT9MC0FsTkL26us8JEWnxkbfiaEIoYMpvvIVdO5?=
 =?us-ascii?Q?inTXS6bc0fZ5FwOyj4C5gVoZRKNYQ5UboWtQNZG6atAval8QUZ+bpytsJ0t3?=
 =?us-ascii?Q?qhnCRgKJrXLQVyaXsPjlCx0Jf74y+cVEW9j3KaeywZOZtFMIyo8vURcFMZPt?=
 =?us-ascii?Q?HZHzsGsuHClEgGJJJqHapNhDTHH7oahZs1GDBjUCjOfnYyZd6KP/I0/3Ozy6?=
 =?us-ascii?Q?B44R2mwcwhaSnStCGbpCl2TXpLNXkfO4kWQXylcYlFkLjk/urV9DWvG0JAcG?=
 =?us-ascii?Q?YwU3+G/1yYW6WJQAYOYrHmC8lfKZ1PPUvspmOaXMk/PiDlbzysmaSzUPNNCb?=
 =?us-ascii?Q?oJf92Uq/4JTIaAffIaagreNKzrCKhAnx3R/t+/54VV3Y18vtYzf2lZXXCAqv?=
 =?us-ascii?Q?8CS4my+KQHofq87ScYV6W2b2avIgbblX67MTXk/FU5aN3Wu4RAW8Q7IBYMaP?=
 =?us-ascii?Q?iYCW5hSYxXnetCrq24631arHUgIFh42hSVaFFOnrFWVV/+fIJzLkpUhFC6ah?=
 =?us-ascii?Q?Unv7iSSWRPcU1X0RJHsd6cjIts563z/9l1o5E6npVZZ0FfQevmssp6UaJnKb?=
 =?us-ascii?Q?6fZERXwMS5ZcYsMUZYG/Yukh4Ou2Lm9SoXAmEEiZtL/z3D0LKRH/alSbEGvT?=
 =?us-ascii?Q?Jdf+F7naOtuvTHmH8KX+zv/b4B8OhaPx2U2fR0BXUapDICfevoUOaJNeayxr?=
 =?us-ascii?Q?vUGBHXBqm+jj61D9LAKV1uVrspwULMXHovRMKS06PDo4Pv1zwpUhg3IiS5DJ?=
 =?us-ascii?Q?fudMKCML1W4T9QX+6P6H7VJAayqrCqvPDw0o1jPyMlWVSLsq0abWaP30xH0A?=
 =?us-ascii?Q?aKYq9cmzjhx6rg88WM2Up1iKIcxR431GEF7q31noojBrCB3F7cmOQzMfFTUh?=
 =?us-ascii?Q?jzoxKIpsbS2j1DI3c1rpyrx3tionGfMyqu0YDJ6cG/XquvLg6AUsmvEjZDpZ?=
 =?us-ascii?Q?FHn7Ljh5eVMTmjQVXxV9e8J83B9hFRvDYLaHP5N9W/tjbYkfyG/+pbhStMHg?=
 =?us-ascii?Q?8DEJh3kgU583uVY+03c8uLbLaZbrxaNwuzaXA/id/rU4/Eixq0ugpubWNCXt?=
 =?us-ascii?Q?qWG3WstAdyQOPmWFsFtkEmb1xTXwgK7XOOhUoQLhFQxfkeYE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 019c06fe-ee48-4f0c-fc46-08d9a9ae0233
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5151.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 09:38:27.8679 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3gzlR7eqxefjJkFPd6FRs13ykwBkSRJpqJ5S6HaDzF0RhOKKn0wG50clvg49kKJEbyLXhPHXRK3T1C9PgzKtg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB6623
Cc: daniel.baluta@gmail.com, AjitKumar.Pandey@amd.com,
 Curtis Malainey <curtis@malainey.com>, linux-kernel@vger.kernel.org,
 pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 Julian.Schroeder@amd.com, linux-mediatek@lists.infradead.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Balakishore.pati@amd.com, yc.hung@mediatek.com,
 vishnuvardhanrao.ravulapati@amd.com, vsreddy@amd.com, daniel.baluta@nxp.com
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

Add callback to notify PSP after loading firmware on DSP. PSP will
validate the loaded firmware and set qualifier bit to run firmware
on secured AMD systems.

Signed-off-by: Julian Schroeder <Julian.Schroeder@amd.com>
Signed-off-by: Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Reviewed-by: Curtis Malainey <curtis@malainey.com>
Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
---
 sound/soc/sof/amd/acp-dsp-offset.h |  4 ++
 sound/soc/sof/amd/acp.c            | 66 +++++++++++++++++++++++++++++-
 sound/soc/sof/amd/acp.h            | 21 ++++++++++
 sound/soc/sof/amd/pci-rn.c         |  5 +++
 4 files changed, 95 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp-dsp-offset.h b/sound/soc/sof/amd/acp-dsp-offset.h
index 1d11e9d69dce..63f13c111b24 100644
--- a/sound/soc/sof/amd/acp-dsp-offset.h
+++ b/sound/soc/sof/amd/acp-dsp-offset.h
@@ -54,6 +54,9 @@
 #define ACP_PGFSM_STATUS			0x1420
 
 /* Registers from ACP_INTR block */
+#define ACP_EXTERNAL_INTR_ENB			0x1800
+#define ACP_EXTERNAL_INTR_CNTL			0x1804
+#define ACP_EXTERNAL_INTR_STAT			0x1808
 #define ACP_DSP_SW_INTR_CNTL			0x1814
 #define ACP_DSP_SW_INTR_STAT                    0x1818
 #define ACP_SW_INTR_TRIG                        0x181C
@@ -68,6 +71,7 @@
 #define ACP_SHA_DMA_CMD_STS			0x1CC0
 #define ACP_SHA_DMA_ERR_STATUS			0x1CC4
 #define ACP_SHA_TRANSFER_BYTE_CNT		0x1CC8
+#define ACP_SHA_PSP_ACK                         0x1C74
 
 #define ACP_SCRATCH_REG_0			0x10000
 
diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 74ede28aa8d8..4c5550e8d364 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -20,6 +20,22 @@
 #include "acp.h"
 #include "acp-dsp-offset.h"
 
+static int smn_write(struct pci_dev *dev, u32 smn_addr, u32 data)
+{
+	pci_write_config_dword(dev, 0x60, smn_addr);
+	pci_write_config_dword(dev, 0x64, data);
+
+	return 0;
+}
+
+static int smn_read(struct pci_dev *dev, u32 smn_addr, u32 *data)
+{
+	pci_write_config_dword(dev, 0x60, smn_addr);
+	pci_read_config_dword(dev, 0x64, data);
+
+	return 0;
+}
+
 static void configure_acp_groupregisters(struct acp_dev_data *adata)
 {
 	struct snd_sof_dev *sdev = adata->dev;
@@ -135,6 +151,25 @@ int configure_and_run_dma(struct acp_dev_data *adata, unsigned int src_addr,
 	return ret;
 }
 
+static int psp_fw_validate(struct acp_dev_data *adata)
+{
+	struct snd_sof_dev *sdev = adata->dev;
+	int timeout;
+	u32 data;
+
+	smn_write(adata->smn_dev, MP0_C2PMSG_26_REG, MBOX_ACP_SHA_DMA_COMMAND);
+
+	for (timeout = ACP_PSP_TIMEOUT_COUNTER; timeout > 0; timeout--) {
+		msleep(20);
+		smn_read(adata->smn_dev, MP0_C2PMSG_26_REG, &data);
+		if (data & MBOX_READY_MASK)
+			return 0;
+	}
+
+	dev_err(sdev->dev, "FW validation timedout: status %x\n", data & MBOX_STATUS_MASK);
+	return -ETIMEDOUT;
+}
+
 int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 			      unsigned int start_addr, unsigned int dest_addr,
 			      unsigned int image_length)
@@ -174,7 +209,9 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 		return ret;
 	}
 
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER, DSP_FW_RUN_ENABLE);
+	ret = psp_fw_validate(adata);
+	if (ret)
+		return ret;
 
 	fw_qualifier = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER);
 	if (!(fw_qualifier & DSP_FW_RUN_ENABLE)) {
@@ -238,6 +275,13 @@ static irqreturn_t acp_irq_thread(int irq, void *context)
 	struct snd_sof_dev *sdev = context;
 	unsigned int val;
 
+	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_EXTERNAL_INTR_STAT);
+	if (val & ACP_SHA_STAT) {
+		/* Clear SHA interrupt raised by PSP */
+		snd_sof_dsp_write(sdev, ACP_DSP_BAR, ACP_EXTERNAL_INTR_STAT, val);
+		return IRQ_HANDLED;
+	}
+
 	val = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_DSP_SW_INTR_STAT);
 	if (val & ACP_DSP_TO_HOST_IRQ) {
 		sof_ops(sdev)->irq_thread(irq, sdev);
@@ -326,6 +370,7 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 {
 	struct pci_dev *pci = to_pci_dev(sdev->dev);
 	struct acp_dev_data *adata;
+	const struct sof_amd_acp_desc *chip;
 	unsigned int addr;
 	int ret;
 
@@ -346,18 +391,32 @@ int amd_sof_acp_probe(struct snd_sof_dev *sdev)
 
 	sdev->pdata->hw_pdata = adata;
 
+	chip = get_chip_info(sdev->pdata);
+	if (!chip) {
+		dev_err(sdev->dev, "no such device supported, chip id:%x\n", pci->device);
+		return -EIO;
+	}
+
+	adata->smn_dev = pci_get_device(PCI_VENDOR_ID_AMD, chip->host_bridge_id, NULL);
+	if (!adata->smn_dev) {
+		dev_err(sdev->dev, "Failed to get host bridge device\n");
+		return -ENODEV;
+	}
+
 	sdev->ipc_irq = pci->irq;
 	ret = request_threaded_irq(sdev->ipc_irq, acp_irq_handler, acp_irq_thread,
 				   IRQF_SHARED, "AudioDSP", sdev);
 	if (ret < 0) {
 		dev_err(sdev->dev, "failed to register IRQ %d\n",
 			sdev->ipc_irq);
+		pci_dev_put(adata->smn_dev);
 		return ret;
 	}
 
 	ret = acp_init(sdev);
 	if (ret < 0) {
 		free_irq(sdev->ipc_irq, sdev);
+		pci_dev_put(adata->smn_dev);
 		return ret;
 	}
 
@@ -371,6 +430,11 @@ EXPORT_SYMBOL_NS(amd_sof_acp_probe, SND_SOC_SOF_AMD_COMMON);
 
 int amd_sof_acp_remove(struct snd_sof_dev *sdev)
 {
+	struct acp_dev_data *adata = sdev->pdata->hw_pdata;
+
+	if (adata->smn_dev)
+		pci_dev_put(adata->smn_dev);
+
 	if (sdev->ipc_irq)
 		free_irq(sdev->ipc_irq, sdev);
 
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index fd923f72a01a..a2f8e4219066 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -52,6 +52,15 @@
 
 #define ACP_DSP_TO_HOST_IRQ			0x04
 
+#define HOST_BRIDGE_CZN				0x1630
+#define ACP_SHA_STAT				0x8000
+#define ACP_PSP_TIMEOUT_COUNTER			5
+#define ACP_EXT_INTR_ERROR_STAT			0x20000000
+#define MP0_C2PMSG_26_REG			0x03810570
+#define MBOX_ACP_SHA_DMA_COMMAND		0x330000
+#define MBOX_READY_MASK				0x80000000
+#define MBOX_STATUS_MASK			0xFFFF
+
 struct  acp_atu_grp_pte {
 	u32 low;
 	u32 high;
@@ -140,6 +149,7 @@ struct acp_dev_data {
 	struct dma_descriptor dscr_info[ACP_MAX_DESC];
 	struct acp_dsp_stream stream_buf[ACP_MAX_STREAM];
 	struct acp_dsp_stream *dtrace_stream;
+	struct pci_dev *smn_dev;
 };
 
 void memcpy_to_scratch(struct snd_sof_dev *sdev, u32 offset, unsigned int *src, size_t bytes);
@@ -202,4 +212,15 @@ int snd_amd_acp_find_config(struct pci_dev *pci);
 /* Trace */
 int acp_sof_trace_init(struct snd_sof_dev *sdev, u32 *stream_tag);
 int acp_sof_trace_release(struct snd_sof_dev *sdev);
+
+struct sof_amd_acp_desc {
+	unsigned int host_bridge_id;
+};
+
+static inline const struct sof_amd_acp_desc *get_chip_info(struct snd_sof_pdata *pdata)
+{
+	const struct sof_dev_desc *desc = pdata->desc;
+
+	return desc->chip_info;
+}
 #endif
diff --git a/sound/soc/sof/amd/pci-rn.c b/sound/soc/sof/amd/pci-rn.c
index 3c379a5ef231..392ffbdf6417 100644
--- a/sound/soc/sof/amd/pci-rn.c
+++ b/sound/soc/sof/amd/pci-rn.c
@@ -43,12 +43,17 @@ static const struct resource renoir_res[] = {
 	},
 };
 
+static const struct sof_amd_acp_desc renoir_chip_info = {
+	.host_bridge_id = HOST_BRIDGE_CZN,
+};
+
 static const struct sof_dev_desc renoir_desc = {
 	.machines		= snd_soc_acpi_amd_sof_machines,
 	.resindex_lpe_base	= 0,
 	.resindex_pcicfg_base	= -1,
 	.resindex_imr_base	= -1,
 	.irqindex_host_ipc	= -1,
+	.chip_info		= &renoir_chip_info,
 	.default_fw_path	= "amd/sof",
 	.default_tplg_path	= "amd/sof-tplg",
 	.default_fw_filename	= "sof-rn.ri",
-- 
2.27.0

