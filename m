Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7063CB916
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 16:52:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00CD9169D;
	Fri, 16 Jul 2021 16:51:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00CD9169D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626447142;
	bh=yggAO1eq1wRpczQJJffdivbFvxSbSMaW91txVBhFSZc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ip/E9ZN55j2Rreg68oCE+e0wIHZy/Q1eIO8wi+StZ9hWC25XU1Nnt1I0CdKV1wmQl
	 GrJfaURrwL2NyQIiV/nXaZ8x8pp23LB0Dlk2mRAWRllk0HIiHYCZ4y9wpa8AL2BJ1p
	 dJAMcnZH0Rm7jsC6Z8QGQSsrvVeD7ymn0bRotrE4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDE41F802E0;
	Fri, 16 Jul 2021 16:51:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09AAFF8026D; Fri, 16 Jul 2021 16:51:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2066.outbound.protection.outlook.com [40.107.212.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B648AF800FE
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 16:51:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B648AF800FE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="PT8P+Jps"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OhmQFqhgicq+YuCgHhO2phAGxU8Jb97BKeHRsoSQdX8uyEMXVL6GeipIz5GwW4AsWF/cJjFQUV/v/BMbh65YEMvYtuEczQvQklJl4mkYZ5Kg7ERgWFZBk+NoQosIBGRtc20Nf5dYYqv2R/5id2cIj8sitDiwKzd3PZCpuWY9T1rbRFa2nqeq6G7+jJ63qAR7nwh24yJwgQpvh44i5BLw2s46c9ibWDzdJgjqK/z7vKDfAtZ/VzL+xOpcaHOngZNwSU0znGr5HjsKMb85AIrCruSSxEJI+2HKJp+lXd9CgqXAK+NWvd1o6waZH5XTn/78R6yadsjacbIE16d40tmCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZo0hjcW8Hf641fmLAgLQ2XLjpwm64N0nxRUH7NHiyg=;
 b=VNI+6Ox/DQjiPeymqtUvk7wt+x3GCRNNJopfWrPk0f9NtlNhYyZXumSyacAzF3qof2dxxB1/X8HH+r1eqq4Yvh5cKUyvFikdAsG2uJiOwOhqaOWP4gGRoJ7HI0vumlbD7nuukDDFvY22UFZ1BwKnj+ntHFlhiNedgd6zx9C0IvNVK4kszP2aZYamK3N9crVJLOwiepoBtRrZuX6lY2Shmm3Z4ArqaCRrxfpheadsbBqZKVPpaJjKrifUpwWYqoVkJ0VF7vzWgc8N7EB5+xGdIsK/0P2/Gr77zLQ29MNwcsZSeqi9BokM3Z9zcRwMM1O95X6QWDSGAmqyZJ4yLlfoZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SZo0hjcW8Hf641fmLAgLQ2XLjpwm64N0nxRUH7NHiyg=;
 b=PT8P+Jpsalnk637ePsTDXqj4O6grKksc157UbdqlZaUaP2lYuSs9rU2w+0ASNfecC5nKFKBq/B0MuFFXj9rJq4WWbNjB/0lBR+ycmtFixN62MUIzz3DjJ+8RPKYYcqIrqRrPiMgC1y6CifAbjamDI+dXzP3yA0vSdKe3hOHLY3Y=
Received: from CO2PR04CA0149.namprd04.prod.outlook.com (2603:10b6:104::27) by
 DM6PR12MB3322.namprd12.prod.outlook.com (2603:10b6:5:119::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21; Fri, 16 Jul 2021 14:51:08 +0000
Received: from CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:0:cafe::39) by CO2PR04CA0149.outlook.office365.com
 (2603:10b6:104::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 14:51:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT058.mail.protection.outlook.com (10.13.174.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 14:51:07 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 09:51:06 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 07:51:06 -0700
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 16 Jul 2021 09:51:03 -0500
From: Vijendar Mukunda <vijendar.mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 01/12] ASoC: amd: add Vangogh ACP5x IP register header
Date: Fri, 16 Jul 2021 20:37:58 +0530
Message-ID: <20210716150809.21450-2-vijendar.mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210716150809.21450-1-vijendar.mukunda@amd.com>
References: <20210716150809.21450-1-vijendar.mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e72ee9e4-74d4-408f-8a77-08d948692508
X-MS-TrafficTypeDiagnostic: DM6PR12MB3322:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3322C0FE993DB2671DDD375497119@DM6PR12MB3322.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:46;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7vrzLwOWlkMUUR8hMJTlofCax3TrRx5R/lcdQs7cAbZkdsAbN66DgpmkBGrVsdbyL9oST4iPp02x2Cjxtjwi6IGQ072KzchIrw/bi4knMJFhF6mw3zBN90nDlGGyRnlnCHxt6whkVdGXHqaJTzuD3mL3mbEmHFq8WJ8Nt7dDE0L7L1T6g7Su39ths/txCT51E5ub44cJLMlKV2t0Noywz1OmCj28jopf/7/9dETc4cxp+wxL6XK+Mnxd5XVO9hacCfAG2T5FWqD88bC92NKC5+cVHdaOUyccrIbliG2daIyWr1zUW8HlPSW/buhMau7lumM5EMjwYpeusRGXmyi0p/wCpm8ZQYlD0ppdDritOfQfOAnMo0KJulE7bzS/NyxCQXFgUGqt+Vk9yMD5gMSGTVUaxDM0wd5SYg0/uB2F0cAm+lPwIZ3f7iJJESSTeQmgBgOKxxKC+ET2xliPd81NM3gEJ/nOvrt7SH9Dlcj1XBrPEyxymYikzs6w5Zuek5JHINdZ+ManfMLE4KHtdbVcYEPZ9I6+akk/ujD/rbahZao8sowyzzno+IOA0AaXo9rCJdcagGV4eHaCJpXjsCHUv9KgNBh3Cr76nYBaqVSYGohuo7H6hmU9DDiXmnbJG77w2w6zXjevPDahzZ8Y+WuW2stxeYnSppzHsyNmmAO3Y30w8G4a975V534L/+1MCYv9HpJFd3wycwUxCv+gCLvY8ZCHEttKKn/gcudloxIS7Ah6SKD8x6Q61KOJywafBM8Q
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(376002)(136003)(39860400002)(346002)(36840700001)(46966006)(316002)(7696005)(6666004)(186003)(26005)(36860700001)(110136005)(54906003)(86362001)(82740400003)(2906002)(83380400001)(70206006)(70586007)(47076005)(356005)(82310400003)(36756003)(81166007)(5660300002)(426003)(44832011)(4326008)(1076003)(30864003)(2616005)(336012)(478600001)(8936002)(8676002)(32563001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 14:51:07.8049 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e72ee9e4-74d4-408f-8a77-08d948692508
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3322
Cc: Sunil-kumar.Dommati@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com
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

From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Add register header for ACP5x IP in Vangogh platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/vg_chip_offset_byte.h | 337 ++++++++++++++++++++
 1 file changed, 337 insertions(+)
 create mode 100644 sound/soc/amd/vangogh/vg_chip_offset_byte.h

diff --git a/sound/soc/amd/vangogh/vg_chip_offset_byte.h b/sound/soc/amd/vangogh/vg_chip_offset_byte.h
new file mode 100644
index 000000000000..b1165ae142b7
--- /dev/null
+++ b/sound/soc/amd/vangogh/vg_chip_offset_byte.h
@@ -0,0 +1,337 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * AMD ACP 5.x Register Documentation
+ *
+ * Copyright 2021 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _acp_ip_OFFSET_HEADER
+#define _acp_ip_OFFSET_HEADER
+
+/* Registers from ACP_DMA block */
+#define ACP_DMA_CNTL_0                                0x1240000
+#define ACP_DMA_CNTL_1                                0x1240004
+#define ACP_DMA_CNTL_2                                0x1240008
+#define ACP_DMA_CNTL_3                                0x124000C
+#define ACP_DMA_CNTL_4                                0x1240010
+#define ACP_DMA_CNTL_5                                0x1240014
+#define ACP_DMA_CNTL_6                                0x1240018
+#define ACP_DMA_CNTL_7                                0x124001C
+#define ACP_DMA_DSCR_STRT_IDX_0                       0x1240020
+#define ACP_DMA_DSCR_STRT_IDX_1                       0x1240024
+#define ACP_DMA_DSCR_STRT_IDX_2                       0x1240028
+#define ACP_DMA_DSCR_STRT_IDX_3                       0x124002C
+#define ACP_DMA_DSCR_STRT_IDX_4                       0x1240030
+#define ACP_DMA_DSCR_STRT_IDX_5                       0x1240034
+#define ACP_DMA_DSCR_STRT_IDX_6                       0x1240038
+#define ACP_DMA_DSCR_STRT_IDX_7                       0x124003C
+#define ACP_DMA_DSCR_CNT_0                            0x1240040
+#define ACP_DMA_DSCR_CNT_1                            0x1240044
+#define ACP_DMA_DSCR_CNT_2                            0x1240048
+#define ACP_DMA_DSCR_CNT_3                            0x124004C
+#define ACP_DMA_DSCR_CNT_4                            0x1240050
+#define ACP_DMA_DSCR_CNT_5                            0x1240054
+#define ACP_DMA_DSCR_CNT_6                            0x1240058
+#define ACP_DMA_DSCR_CNT_7                            0x124005C
+#define ACP_DMA_PRIO_0                                0x1240060
+#define ACP_DMA_PRIO_1                                0x1240064
+#define ACP_DMA_PRIO_2                                0x1240068
+#define ACP_DMA_PRIO_3                                0x124006C
+#define ACP_DMA_PRIO_4                                0x1240070
+#define ACP_DMA_PRIO_5                                0x1240074
+#define ACP_DMA_PRIO_6                                0x1240078
+#define ACP_DMA_PRIO_7                                0x124007C
+#define ACP_DMA_CUR_DSCR_0                            0x1240080
+#define ACP_DMA_CUR_DSCR_1                            0x1240084
+#define ACP_DMA_CUR_DSCR_2                            0x1240088
+#define ACP_DMA_CUR_DSCR_3                            0x124008C
+#define ACP_DMA_CUR_DSCR_4                            0x1240090
+#define ACP_DMA_CUR_DSCR_5                            0x1240094
+#define ACP_DMA_CUR_DSCR_6                            0x1240098
+#define ACP_DMA_CUR_DSCR_7                            0x124009C
+#define ACP_DMA_CUR_TRANS_CNT_0                       0x12400A0
+#define ACP_DMA_CUR_TRANS_CNT_1                       0x12400A4
+#define ACP_DMA_CUR_TRANS_CNT_2                       0x12400A8
+#define ACP_DMA_CUR_TRANS_CNT_3                       0x12400AC
+#define ACP_DMA_CUR_TRANS_CNT_4                       0x12400B0
+#define ACP_DMA_CUR_TRANS_CNT_5                       0x12400B4
+#define ACP_DMA_CUR_TRANS_CNT_6                       0x12400B8
+#define ACP_DMA_CUR_TRANS_CNT_7                       0x12400BC
+#define ACP_DMA_ERR_STS_0                             0x12400C0
+#define ACP_DMA_ERR_STS_1                             0x12400C4
+#define ACP_DMA_ERR_STS_2                             0x12400C8
+#define ACP_DMA_ERR_STS_3                             0x12400CC
+#define ACP_DMA_ERR_STS_4                             0x12400D0
+#define ACP_DMA_ERR_STS_5                             0x12400D4
+#define ACP_DMA_ERR_STS_6                             0x12400D8
+#define ACP_DMA_ERR_STS_7                             0x12400DC
+#define ACP_DMA_DESC_BASE_ADDR                        0x12400E0
+#define ACP_DMA_DESC_MAX_NUM_DSCR                     0x12400E4
+#define ACP_DMA_CH_STS                                0x12400E8
+#define ACP_DMA_CH_GROUP                              0x12400EC
+#define ACP_DMA_CH_RST_STS                            0x12400F0
+
+/* Registers from ACP_AXI2AXIATU block */
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_1                0x1240C00
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_1                0x1240C04
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_2                0x1240C08
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_2                0x1240C0C
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_3                0x1240C10
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_3                0x1240C14
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_4                0x1240C18
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_4                0x1240C1C
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_5                0x1240C20
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_5                0x1240C24
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_6                0x1240C28
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_6                0x1240C2C
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_7                0x1240C30
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_7                0x1240C34
+#define ACPAXI2AXI_ATU_PAGE_SIZE_GRP_8                0x1240C38
+#define ACPAXI2AXI_ATU_BASE_ADDR_GRP_8                0x1240C3C
+#define ACPAXI2AXI_ATU_CTRL                           0x1240C40
+
+/*  Registers from ACP_CLKRST block */
+#define ACP_SOFT_RESET                                0x1241000
+#define ACP_CONTROL                                   0x1241004
+#define ACP_STATUS                                    0x1241008
+#define ACP_DYNAMIC_CG_MASTER_CONTROL                 0x1241010
+
+/* Registers from ACP_MISC block */
+#define ACP_EXTERNAL_INTR_ENB                         0x1241800
+#define ACP_EXTERNAL_INTR_CNTL                        0x1241804
+#define ACP_EXTERNAL_INTR_STAT                        0x1241808
+#define ACP_ERROR_STATUS                              0x12418C4
+#define ACP_SW_I2S_ERROR_REASON                       0x12418C8
+#define ACP_MEM_PG_STS                                0x12418CC
+#define ACP_PGMEM_DEEP_SLEEP_CTRL                     0x12418D0
+#define ACP_PGMEM_SHUT_DOWN_CTRL                      0x12418D4
+
+/* Registers from ACP_PGFSM block */
+#define ACP_PIN_CONFIG                                0x1241400
+#define ACP_PAD_PULLUP_CTRL                           0x1241404
+#define ACP_PAD_PULLDOWN_CTRL                         0x1241408
+#define ACP_PAD_DRIVE_STRENGTH_CTRL                   0x124140C
+#define ACP_PAD_SCHMEN_CTRL                           0x1241410
+#define ACP_SW_PAD_KEEPER_EN                          0x1241414
+#define ACP_SW_WAKE_EN                                0x1241418
+#define ACP_I2S_WAKE_EN                               0x124141C
+#define ACP_PME_EN                                    0x1241420
+#define ACP_PGFSM_CONTROL                             0x1241424
+#define ACP_PGFSM_STATUS                              0x1241428
+#define ACP_CLKMUX_SEL                                0x124142C
+#define ACP_DEVICE_STATE                              0x1241430
+#define AZ_DEVICE_STATE                               0x1241434
+#define ACP_INTR_URGENCY_TIMER                        0x1241438
+#define AZ_INTR_URGENCY_TIMER                         0x124143C
+#define ACP_AON_SW_INTR_TRIG                          0x1241440
+
+/* Registers from ACP_SCRATCH block */
+#define ACP_SCRATCH_REG_0                             0x1250000
+#define ACP_SCRATCH_REG_1                             0x1250004
+#define ACP_SCRATCH_REG_2                             0x1250008
+#define ACP_SCRATCH_REG_3                             0x125000C
+#define ACP_SCRATCH_REG_4                             0x1250010
+#define ACP_SCRATCH_REG_5                             0x1250014
+#define ACP_SCRATCH_REG_6                             0x1250018
+#define ACP_SCRATCH_REG_7                             0x125001C
+#define ACP_SCRATCH_REG_8                             0x1250020
+#define ACP_SCRATCH_REG_9                             0x1250024
+#define ACP_SCRATCH_REG_10                            0x1250028
+#define ACP_SCRATCH_REG_11                            0x125002C
+#define ACP_SCRATCH_REG_12                            0x1250030
+#define ACP_SCRATCH_REG_13                            0x1250034
+#define ACP_SCRATCH_REG_14                            0x1250038
+#define ACP_SCRATCH_REG_15                            0x125003C
+#define ACP_SCRATCH_REG_16                            0x1250040
+#define ACP_SCRATCH_REG_17                            0x1250044
+#define ACP_SCRATCH_REG_18                            0x1250048
+#define ACP_SCRATCH_REG_19                            0x125004C
+#define ACP_SCRATCH_REG_20                            0x1250050
+#define ACP_SCRATCH_REG_21                            0x1250054
+#define ACP_SCRATCH_REG_22                            0x1250058
+#define ACP_SCRATCH_REG_23                            0x125005C
+#define ACP_SCRATCH_REG_24                            0x1250060
+#define ACP_SCRATCH_REG_25                            0x1250064
+#define ACP_SCRATCH_REG_26                            0x1250068
+#define ACP_SCRATCH_REG_27                            0x125006C
+#define ACP_SCRATCH_REG_28                            0x1250070
+#define ACP_SCRATCH_REG_29                            0x1250074
+#define ACP_SCRATCH_REG_30                            0x1250078
+#define ACP_SCRATCH_REG_31                            0x125007C
+#define ACP_SCRATCH_REG_32                            0x1250080
+#define ACP_SCRATCH_REG_33                            0x1250084
+#define ACP_SCRATCH_REG_34                            0x1250088
+#define ACP_SCRATCH_REG_35                            0x125008C
+#define ACP_SCRATCH_REG_36                            0x1250090
+#define ACP_SCRATCH_REG_37                            0x1250094
+#define ACP_SCRATCH_REG_38                            0x1250098
+#define ACP_SCRATCH_REG_39                            0x125009C
+#define ACP_SCRATCH_REG_40                            0x12500A0
+#define ACP_SCRATCH_REG_41                            0x12500A4
+#define ACP_SCRATCH_REG_42                            0x12500A8
+#define ACP_SCRATCH_REG_43                            0x12500AC
+#define ACP_SCRATCH_REG_44                            0x12500B0
+#define ACP_SCRATCH_REG_45                            0x12500B4
+#define ACP_SCRATCH_REG_46                            0x12500B8
+#define ACP_SCRATCH_REG_47                            0x12500BC
+#define ACP_SCRATCH_REG_48                            0x12500C0
+#define ACP_SCRATCH_REG_49                            0x12500C4
+#define ACP_SCRATCH_REG_50                            0x12500C8
+#define ACP_SCRATCH_REG_51                            0x12500CC
+#define ACP_SCRATCH_REG_52                            0x12500D0
+#define ACP_SCRATCH_REG_53                            0x12500D4
+#define ACP_SCRATCH_REG_54                            0x12500D8
+#define ACP_SCRATCH_REG_55                            0x12500DC
+#define ACP_SCRATCH_REG_56                            0x12500E0
+#define ACP_SCRATCH_REG_57                            0x12500E4
+#define ACP_SCRATCH_REG_58                            0x12500E8
+#define ACP_SCRATCH_REG_59                            0x12500EC
+#define ACP_SCRATCH_REG_60                            0x12500F0
+#define ACP_SCRATCH_REG_61                            0x12500F4
+#define ACP_SCRATCH_REG_62                            0x12500F8
+#define ACP_SCRATCH_REG_63                            0x12500FC
+#define ACP_SCRATCH_REG_64                            0x1250100
+#define ACP_SCRATCH_REG_65                            0x1250104
+#define ACP_SCRATCH_REG_66                            0x1250108
+#define ACP_SCRATCH_REG_67                            0x125010C
+#define ACP_SCRATCH_REG_68                            0x1250110
+#define ACP_SCRATCH_REG_69                            0x1250114
+#define ACP_SCRATCH_REG_70                            0x1250118
+#define ACP_SCRATCH_REG_71                            0x125011C
+#define ACP_SCRATCH_REG_72                            0x1250120
+#define ACP_SCRATCH_REG_73                            0x1250124
+#define ACP_SCRATCH_REG_74                            0x1250128
+#define ACP_SCRATCH_REG_75                            0x125012C
+#define ACP_SCRATCH_REG_76                            0x1250130
+#define ACP_SCRATCH_REG_77                            0x1250134
+#define ACP_SCRATCH_REG_78                            0x1250138
+#define ACP_SCRATCH_REG_79                            0x125013C
+#define ACP_SCRATCH_REG_80                            0x1250140
+#define ACP_SCRATCH_REG_81                            0x1250144
+#define ACP_SCRATCH_REG_82                            0x1250148
+#define ACP_SCRATCH_REG_83                            0x125014C
+#define ACP_SCRATCH_REG_84                            0x1250150
+#define ACP_SCRATCH_REG_85                            0x1250154
+#define ACP_SCRATCH_REG_86                            0x1250158
+#define ACP_SCRATCH_REG_87                            0x125015C
+#define ACP_SCRATCH_REG_88                            0x1250160
+#define ACP_SCRATCH_REG_89                            0x1250164
+#define ACP_SCRATCH_REG_90                            0x1250168
+#define ACP_SCRATCH_REG_91                            0x125016C
+#define ACP_SCRATCH_REG_92                            0x1250170
+#define ACP_SCRATCH_REG_93                            0x1250174
+#define ACP_SCRATCH_REG_94                            0x1250178
+#define ACP_SCRATCH_REG_95                            0x125017C
+#define ACP_SCRATCH_REG_96                            0x1250180
+#define ACP_SCRATCH_REG_97                            0x1250184
+#define ACP_SCRATCH_REG_98                            0x1250188
+#define ACP_SCRATCH_REG_99                            0x125018C
+#define ACP_SCRATCH_REG_100                           0x1250190
+#define ACP_SCRATCH_REG_101                           0x1250194
+#define ACP_SCRATCH_REG_102                           0x1250198
+#define ACP_SCRATCH_REG_103                           0x125019C
+#define ACP_SCRATCH_REG_104                           0x12501A0
+#define ACP_SCRATCH_REG_105                           0x12501A4
+#define ACP_SCRATCH_REG_106                           0x12501A8
+#define ACP_SCRATCH_REG_107                           0x12501AC
+#define ACP_SCRATCH_REG_108                           0x12501B0
+#define ACP_SCRATCH_REG_109                           0x12501B4
+#define ACP_SCRATCH_REG_110                           0x12501B8
+#define ACP_SCRATCH_REG_111                           0x12501BC
+#define ACP_SCRATCH_REG_112                           0x12501C0
+#define ACP_SCRATCH_REG_113                           0x12501C4
+#define ACP_SCRATCH_REG_114                           0x12501C8
+#define ACP_SCRATCH_REG_115                           0x12501CC
+#define ACP_SCRATCH_REG_116                           0x12501D0
+#define ACP_SCRATCH_REG_117                           0x12501D4
+#define ACP_SCRATCH_REG_118                           0x12501D8
+#define ACP_SCRATCH_REG_119                           0x12501DC
+#define ACP_SCRATCH_REG_120                           0x12501E0
+#define ACP_SCRATCH_REG_121                           0x12501E4
+#define ACP_SCRATCH_REG_122                           0x12501E8
+#define ACP_SCRATCH_REG_123                           0x12501EC
+#define ACP_SCRATCH_REG_124                           0x12501F0
+#define ACP_SCRATCH_REG_125                           0x12501F4
+#define ACP_SCRATCH_REG_126                           0x12501F8
+#define ACP_SCRATCH_REG_127                           0x12501FC
+#define ACP_SCRATCH_REG_128                           0x1250200
+
+/* Registers from ACP_AUDIO_BUFFERS block */
+#define ACP_I2S_RX_RINGBUFADDR                        0x1242000
+#define ACP_I2S_RX_RINGBUFSIZE                        0x1242004
+#define ACP_I2S_RX_LINKPOSITIONCNTR                   0x1242008
+#define ACP_I2S_RX_FIFOADDR                           0x124200C
+#define ACP_I2S_RX_FIFOSIZE                           0x1242010
+#define ACP_I2S_RX_DMA_SIZE                           0x1242014
+#define ACP_I2S_RX_LINEARPOSCNTR_HIGH                 0x1242018
+#define ACP_I2S_RX_LINEARPOSCNTR_LOW                  0x124201C
+#define ACP_I2S_RX_INTR_WATERMARK_SIZE                0x1242020
+#define ACP_I2S_TX_RINGBUFADDR                        0x1242024
+#define ACP_I2S_TX_RINGBUFSIZE                        0x1242028
+#define ACP_I2S_TX_LINKPOSITIONCNTR                   0x124202C
+#define ACP_I2S_TX_FIFOADDR                           0x1242030
+#define ACP_I2S_TX_FIFOSIZE                           0x1242034
+#define ACP_I2S_TX_DMA_SIZE                           0x1242038
+#define ACP_I2S_TX_LINEARPOSCNTR_HIGH                 0x124203C
+#define ACP_I2S_TX_LINEARPOSCNTR_LOW                  0x1242040
+#define ACP_I2S_TX_INTR_WATERMARK_SIZE                0x1242044
+#define ACP_BT_RX_RINGBUFADDR                         0x1242048
+#define ACP_BT_RX_RINGBUFSIZE                         0x124204C
+#define ACP_BT_RX_LINKPOSITIONCNTR                    0x1242050
+#define ACP_BT_RX_FIFOADDR                            0x1242054
+#define ACP_BT_RX_FIFOSIZE                            0x1242058
+#define ACP_BT_RX_DMA_SIZE                            0x124205C
+#define ACP_BT_RX_LINEARPOSCNTR_HIGH                  0x1242060
+#define ACP_BT_RX_LINEARPOSCNTR_LOW                   0x1242064
+#define ACP_BT_RX_INTR_WATERMARK_SIZE                 0x1242068
+#define ACP_BT_TX_RINGBUFADDR                         0x124206C
+#define ACP_BT_TX_RINGBUFSIZE                         0x1242070
+#define ACP_BT_TX_LINKPOSITIONCNTR                    0x1242074
+#define ACP_BT_TX_FIFOADDR                            0x1242078
+#define ACP_BT_TX_FIFOSIZE                            0x124207C
+#define ACP_BT_TX_DMA_SIZE                            0x1242080
+#define ACP_BT_TX_LINEARPOSCNTR_HIGH                  0x1242084
+#define ACP_BT_TX_LINEARPOSCNTR_LOW                   0x1242088
+#define ACP_BT_TX_INTR_WATERMARK_SIZE                 0x124208C
+#define ACP_HS_RX_RINGBUFADDR                         0x1242090
+#define ACP_HS_RX_RINGBUFSIZE                         0x1242094
+#define ACP_HS_RX_LINKPOSITIONCNTR                    0x1242098
+#define ACP_HS_RX_FIFOADDR                            0x124209C
+#define ACP_HS_RX_FIFOSIZE                            0x12420A0
+#define ACP_HS_RX_DMA_SIZE                            0x12420A4
+#define ACP_HS_RX_LINEARPOSCNTR_HIGH	              0x12420A8
+#define ACP_HS_RX_LINEARPOSCNTR_LOW                   0x12420AC
+#define ACP_HS_RX_INTR_WATERMARK_SIZE                 0x12420B0
+#define ACP_HS_TX_RINGBUFADDR                         0x12420B4
+#define ACP_HS_TX_RINGBUFSIZE                         0x12420B8
+#define ACP_HS_TX_LINKPOSITIONCNTR                    0x12420BC
+#define ACP_HS_TX_FIFOADDR                            0x12420C0
+#define ACP_HS_TX_FIFOSIZE                            0x12420C4
+#define ACP_HS_TX_DMA_SIZE                            0x12420C8
+#define ACP_HS_TX_LINEARPOSCNTR_HIGH                  0x12420CC
+#define ACP_HS_TX_LINEARPOSCNTR_LOW                   0x12420D0
+#define ACP_HS_TX_INTR_WATERMARK_SIZE                 0x12420D4
+
+/* Registers from ACP_I2S_TDM block */
+#define ACP_I2STDM_IER                                0x1242400
+#define ACP_I2STDM_IRER                               0x1242404
+#define ACP_I2STDM_RXFRMT                             0x1242408
+#define ACP_I2STDM_ITER                               0x124240C
+#define ACP_I2STDM_TXFRMT                             0x1242410
+#define ACP_I2STDM0_MSTRCLKGEN                        0x1242414
+#define ACP_I2STDM1_MSTRCLKGEN                        0x1242418
+#define ACP_I2STDM2_MSTRCLKGEN                        0x124241C
+#define ACP_I2STDM_REFCLKGEN                          0x1242420
+
+/* Registers from ACP_BT_TDM block */
+#define ACP_BTTDM_IER                                 0x1242800
+#define ACP_BTTDM_IRER                                0x1242804
+#define ACP_BTTDM_RXFRMT                              0x1242808
+#define ACP_BTTDM_ITER                                0x124280C
+#define ACP_BTTDM_TXFRMT                              0x1242810
+#define ACP_HSTDM_IER                                 0x1242814
+#define ACP_HSTDM_IRER                                0x1242818
+#define ACP_HSTDM_RXFRMT                              0x124281C
+#define ACP_HSTDM_ITER                                0x1242820
+#define ACP_HSTDM_TXFRMT                              0x1242824
+#endif
-- 
2.17.1

