Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E5F21D7FEE
	for <lists+alsa-devel@lfdr.de>; Mon, 18 May 2020 19:19:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4AB821745;
	Mon, 18 May 2020 19:18:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4AB821745
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589822385;
	bh=kIJZZLQPHKFKxsSVSv9Vz/0P+arocCSAXjxUwAgcOLE=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=bE+/DOFoGYcgKRu5Oj2WhJVoNIrIYVk2qgwgh3mjY+kJgr/uPVMfYd2UIvwsOpKkC
	 d3Zn+GdzpZcZV+5LtfzjX9gDUUBiDL+MqEHVJvNa5brI8PSXE+Lb9G0df8XULFKyrN
	 J8BLnjTmuQrmpJkUY/UGKt1Wt7pPAuZgh6yOSOuk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AEDDBF80273;
	Mon, 18 May 2020 19:17:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07DB8F80273; Mon, 18 May 2020 19:17:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7AFB7F800C9
 for <alsa-devel@alsa-project.org>; Mon, 18 May 2020 19:17:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7AFB7F800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="2hKhwl/V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Iyn9BC3XX8wPfyIKmusa3RuVN+L/qDQqtvxJTuRzMjqZ5nQjWYIFDPb6q7u2TM+2Qpf8H9GnxARDC+kzcI6TsKgR3N2sjzdmcbVOiSdofhWuw8O8Z0nHgFa/bUVIXlp4suFrsoafO5zxvn2pH1zRw6cFUeqgpOxHDNidOeh+6CM9iM6WIGpUNtFuBtMCZD321yuDk+OLLqm/WQ+bStXxbyhX5F+cQI52JRs5q9Djc7rJdUJ7DdQ346Puxv4KpWt9xPTClt25FrGfdoDap7CNE8X8w2xLtZ0vQjT16HLsn/Xfdxy9duptShL31ztJC5QVlM8tnY+GHkk4WDkLkG+rXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+bNPrgylsB2MuqOlCJaTj98bdnlelAoNKspUdv+bP8=;
 b=EbzybJV6KZ3eD9TY4tNpkOEBxKr8X19QtcKCJ5cjT6JuXAq+45suCMTyQbEh0TYyoM1VHfW3xR4xVtADhZpxKCLkH3NVpQhQgcwy5YF83jQ/P451yZcF2utlaEW2pze/zAYCSXuZnBUTS0pUlMcccKubhcgzYEnTMje7FgUtP+TPzG8Dt2Og5o/jDGz20BmQ65Z1QvKMvRd/9nTp7MGzrHuseOZp+Yd+m/0RPEI4vSqQIjDytpyk0cz4p7wLT3CNTRpWwkYlR0CWunhoL1qvtdVa5sct4s2tzImeZc5V3+TyceJG2EtC7WZ5Lqf6oeJXpVsoIgo+KYr2gfPI/SdUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i+bNPrgylsB2MuqOlCJaTj98bdnlelAoNKspUdv+bP8=;
 b=2hKhwl/VaBTLwkNpHpKn7l+0GlVfx/3hb9FW0BgzbP2Y3ljrG2xSoRafw1PLfU6YH4O9jwXqSAE/HmDUktF/ZPEZmGUTABMamRFBOxJYYCPVtBeFROcHAro38/K/qLkivzdiKcEwSBUbHbcVzOpRKBUsuQw7EsEqAGvNm4MWcaQ=
Received: from DM5PR07CA0093.namprd07.prod.outlook.com (2603:10b6:4:ae::22) by
 MW3PR12MB4442.namprd12.prod.outlook.com (2603:10b6:303:55::14) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3000.26; Mon, 18 May 2020 17:17:10 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ae:cafe::21) by DM5PR07CA0093.outlook.office365.com
 (2603:10b6:4:ae::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3000.20 via Frontend
 Transport; Mon, 18 May 2020 17:17:10 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB01.amd.com (165.204.84.17) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3000.19 via Frontend Transport; Mon, 18 May 2020 17:17:09 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB01.amd.com
 (10.181.40.142) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:09 -0500
Received: from SATLEXMB02.amd.com (10.181.40.143) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Mon, 18 May
 2020 12:17:09 -0500
Received: from atgasia02.amd.com (10.180.168.240) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server id 15.1.1713.5 via Frontend
 Transport; Mon, 18 May 2020 12:17:07 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <alsa-devel@alsa-project.org>, <broonie@kernel.org>, <tiwai@suse.de>
Subject: [PATCH v3 01/14] ASoC: amd: add Renoir ACP3x IP register header
Date: Tue, 19 May 2020 01:16:51 +0800
Message-ID: <20200518171704.24999-2-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
References: <20200518171704.24999-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB01.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFTY:;
 SFS:(4636009)(39860400002)(136003)(376002)(396003)(346002)(46966005)(426003)(82740400003)(47076004)(30864003)(7696005)(86362001)(336012)(2906002)(26005)(6666004)(1076003)(186003)(478600001)(82310400002)(70206006)(54906003)(110136005)(70586007)(36756003)(4326008)(81166007)(8676002)(2616005)(356005)(8936002)(5660300002)(316002)(32563001);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56abcdf3-b16d-4ac5-9210-08d7fb4f4c5e
X-MS-TrafficTypeDiagnostic: MW3PR12MB4442:
X-Microsoft-Antispam-PRVS: <MW3PR12MB44422F4B6D46F945F1819DF597B80@MW3PR12MB4442.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:404;
X-Forefront-PRVS: 04073E895A
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ynQKVwCIe4epruhFMftPf59zagaW+gQ3BRoMPMNG9pOauCsGZjiI9K1ER4QyKU+eCVvK9uE9PoIQqDyQaO/GcMny8TUdPSaATJoC240hPANQc7aEpuL1etznxInLjdiVljJa6nSD1iHuDNFp2SH1kfA5ptnt7RZHOIdjWMx0QKzcwWucEAzL8AmlpHDesGpBRf0wmSbAKSHz2mX4axxCnWAR3Qo+8k4bYH9jU9byfn6UNlslhTst+Rjn5Uc6ijAY/T+hQ1KQo98wMHqWZSBpC1avPt0Xd0+0U9xhKCYe0WYqLjWBJZ3e2Ru8n3DK0MFD1s+CwVrIv5gP/7/DmzvbvN84gI+0KIPg3hSCb3uLucTT1cpqwX2Y+ncQU+NZl99y6pUxk0CNa/jlwfJzm3oTNZj7dDxxjL3RZkQi+gixAHSXemjFjeDNuHL7ThloJ5NRIDCdB6Jb/6a/mMfieyYXGCIUBDsgbMW/9TpDde8QmQvI0o3e/xsWQPZJ8k6xNcs7iFQiaSg4wbawCwf4O+4J9JEVmr52x6mS428OYvtntJA=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2020 17:17:09.7549 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56abcdf3-b16d-4ac5-9210-08d7fb4f4c5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4442
Cc: Alexander.Deucher@amd.com, Vijendar Mukunda <Vijendar.Mukunda@amd.com>
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

Add register header for ACP3x IP in Renoir platform.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/renoir/rn_chip_offset_byte.h | 349 +++++++++++++++++++++
 1 file changed, 349 insertions(+)
 create mode 100644 sound/soc/amd/renoir/rn_chip_offset_byte.h

diff --git a/sound/soc/amd/renoir/rn_chip_offset_byte.h b/sound/soc/amd/renoir/rn_chip_offset_byte.h
new file mode 100644
index 000000000000..d20d967b5ff9
--- /dev/null
+++ b/sound/soc/amd/renoir/rn_chip_offset_byte.h
@@ -0,0 +1,349 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * AMD ACP 3.1 Register Documentation
+ *
+ * Copyright 2020 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _rn_OFFSET_HEADER
+#define _rn_OFFSET_HEADER
+// Registers from ACP_DMA block
+
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
+// Registers from ACP_AXI2AXIATU block
+
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
+// Registers from ACP_CLKRST block
+
+#define ACP_SOFT_RESET                                0x1241000
+#define ACP_CONTROL                                   0x1241004
+#define ACP_STATUS                                    0x1241008
+#define ACP_DYNAMIC_CG_MASTER_CONTROL                 0x1241010
+
+// Registers from ACP_MISC block
+
+#define ACP_EXTERNAL_INTR_ENB                         0x1241800
+#define ACP_EXTERNAL_INTR_CNTL                        0x1241804
+#define ACP_EXTERNAL_INTR_STAT                        0x1241808
+#define ACP_PGMEM_CTRL                                0x12418C0
+#define ACP_ERROR_STATUS                              0x12418C4
+#define ACP_SW_I2S_ERROR_REASON                       0x12418C8
+#define ACP_MEM_PG_STS                                0x12418CC
+
+// Registers from ACP_PGFSM block
+
+#define ACP_I2S_PIN_CONFIG                            0x1241400
+#define ACP_PAD_PULLUP_PULLDOWN_CTRL                  0x1241404
+#define ACP_PAD_DRIVE_STRENGTH_CTRL                   0x1241408
+#define ACP_SW_PAD_KEEPER_EN                          0x124140C
+#define ACP_PGFSM_CONTROL                             0x124141C
+#define ACP_PGFSM_STATUS                              0x1241420
+#define ACP_CLKMUX_SEL                                0x1241424
+#define ACP_DEVICE_STATE                              0x1241428
+#define AZ_DEVICE_STATE                               0x124142C
+#define ACP_INTR_URGENCY_TIMER                        0x1241430
+#define AZ_INTR_URGENCY_TIMER                         0x1241434
+
+// Registers from ACP_SCRATCH block
+
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
+// Registers from ACP_AUDIO_BUFFERS block
+
+#define ACP_I2S_RX_RINGBUFADDR                        0x1242000
+#define ACP_I2S_RX_RINGBUFSIZE                        0x1242004
+#define ACP_I2S_RX_LINKPOSITIONCNTR                   0x1242008
+#define ACP_I2S_RX_FIFOADDR                           0x124200C
+#define ACP_I2S_RX_FIFOSIZE                           0x1242010
+#define ACP_I2S_RX_DMA_SIZE                           0x1242014
+#define ACP_I2S_RX_LINEARPOSITIONCNTR_HIGH            0x1242018
+#define ACP_I2S_RX_LINEARPOSITIONCNTR_LOW             0x124201C
+#define ACP_I2S_RX_INTR_WATERMARK_SIZE                0x1242020
+#define ACP_I2S_TX_RINGBUFADDR                        0x1242024
+#define ACP_I2S_TX_RINGBUFSIZE                        0x1242028
+#define ACP_I2S_TX_LINKPOSITIONCNTR                   0x124202C
+#define ACP_I2S_TX_FIFOADDR                           0x1242030
+#define ACP_I2S_TX_FIFOSIZE                           0x1242034
+#define ACP_I2S_TX_DMA_SIZE                           0x1242038
+#define ACP_I2S_TX_LINEARPOSITIONCNTR_HIGH            0x124203C
+#define ACP_I2S_TX_LINEARPOSITIONCNTR_LOW             0x1242040
+#define ACP_I2S_TX_INTR_WATERMARK_SIZE                0x1242044
+#define ACP_BT_RX_RINGBUFADDR                         0x1242048
+#define ACP_BT_RX_RINGBUFSIZE                         0x124204C
+#define ACP_BT_RX_LINKPOSITIONCNTR                    0x1242050
+#define ACP_BT_RX_FIFOADDR                            0x1242054
+#define ACP_BT_RX_FIFOSIZE                            0x1242058
+#define ACP_BT_RX_DMA_SIZE                            0x124205C
+#define ACP_BT_RX_LINEARPOSITIONCNTR_HIGH             0x1242060
+#define ACP_BT_RX_LINEARPOSITIONCNTR_LOW              0x1242064
+#define ACP_BT_RX_INTR_WATERMARK_SIZE                 0x1242068
+#define ACP_BT_TX_RINGBUFADDR                         0x124206C
+#define ACP_BT_TX_RINGBUFSIZE                         0x1242070
+#define ACP_BT_TX_LINKPOSITIONCNTR                    0x1242074
+#define ACP_BT_TX_FIFOADDR                            0x1242078
+#define ACP_BT_TX_FIFOSIZE                            0x124207C
+#define ACP_BT_TX_DMA_SIZE                            0x1242080
+#define ACP_BT_TX_LINEARPOSITIONCNTR_HIGH             0x1242084
+#define ACP_BT_TX_LINEARPOSITIONCNTR_LOW              0x1242088
+#define ACP_BT_TX_INTR_WATERMARK_SIZE                 0x124208C
+#define ACP_HS_RX_RINGBUFADDR                         0x1242090
+#define ACP_HS_RX_RINGBUFSIZE                         0x1242094
+#define ACP_HS_RX_LINKPOSITIONCNTR                    0x1242098
+#define ACP_HS_RX_FIFOADDR                            0x124209C
+#define ACP_HS_RX_FIFOSIZE                            0x12420A0
+#define ACP_HS_RX_DMA_SIZE                            0x12420A4
+#define ACP_HS_RX_LINEARPOSITIONCNTR_HIGH             0x12420A8
+#define ACP_HS_RX_LINEARPOSITIONCNTR_LOW              0x12420AC
+#define ACP_HS_RX_INTR_WATERMARK_SIZE                 0x12420B0
+#define ACP_HS_TX_RINGBUFADDR                         0x12420B4
+#define ACP_HS_TX_RINGBUFSIZE                         0x12420B8
+#define ACP_HS_TX_LINKPOSITIONCNTR                    0x12420BC
+#define ACP_HS_TX_FIFOADDR                            0x12420C0
+#define ACP_HS_TX_FIFOSIZE                            0x12420C4
+#define ACP_HS_TX_DMA_SIZE                            0x12420C8
+#define ACP_HS_TX_LINEARPOSITIONCNTR_HIGH             0x12420CC
+#define ACP_HS_TX_LINEARPOSITIONCNTR_LOW              0x12420D0
+#define ACP_HS_TX_INTR_WATERMARK_SIZE                 0x12420D4
+
+// Registers from ACP_I2S_TDM block
+
+#define ACP_I2STDM_IER                                0x1242400
+#define ACP_I2STDM_IRER                               0x1242404
+#define ACP_I2STDM_RXFRMT                             0x1242408
+#define ACP_I2STDM_ITER                               0x124240C
+#define ACP_I2STDM_TXFRMT                             0x1242410
+
+// Registers from ACP_BT_TDM block
+
+#define ACP_BTTDM_IER                                 0x1242800
+#define ACP_BTTDM_IRER                                0x1242804
+#define ACP_BTTDM_RXFRMT                              0x1242808
+#define ACP_BTTDM_ITER                                0x124280C
+#define ACP_BTTDM_TXFRMT                              0x1242810
+
+// Registers from ACP_WOV block
+
+#define ACP_WOV_PDM_ENABLE                            0x1242C04
+#define ACP_WOV_PDM_DMA_ENABLE                        0x1242C08
+#define ACP_WOV_RX_RINGBUFADDR                        0x1242C0C
+#define ACP_WOV_RX_RINGBUFSIZE                        0x1242C10
+#define ACP_WOV_RX_LINKPOSITIONCNTR                   0x1242C14
+#define ACP_WOV_RX_LINEARPOSITIONCNTR_HIGH            0x1242C18
+#define ACP_WOV_RX_LINEARPOSITIONCNTR_LOW             0x1242C1C
+#define ACP_WOV_RX_INTR_WATERMARK_SIZE                0x1242C20
+#define ACP_WOV_PDM_FIFO_FLUSH                        0x1242C24
+#define ACP_WOV_PDM_NO_OF_CHANNELS                    0x1242C28
+#define ACP_WOV_PDM_DECIMATION_FACTOR                 0x1242C2C
+#define ACP_WOV_PDM_VAD_CTRL                          0x1242C30
+#define ACP_WOV_BUFFER_STATUS                         0x1242C58
+#define ACP_WOV_MISC_CTRL                             0x1242C5C
+#define ACP_WOV_CLK_CTRL                              0x1242C60
+#define ACP_PDM_VAD_DYNAMIC_CLK_GATING_EN             0x1242C64
+#define ACP_WOV_ERROR_STATUS_REGISTER                 0x1242C68
+#endif
-- 
2.26.2

