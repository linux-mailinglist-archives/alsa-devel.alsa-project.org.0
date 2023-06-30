Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBF4743778
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Jun 2023 10:37:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BCB6C84D;
	Fri, 30 Jun 2023 10:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BCB6C84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688114236;
	bh=56dzIQ+5Aqn7S8w5LTFhS8mYasFgP2qsplsua67ecPs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WPb6OaRUFMj78nxlmrB5oGqHCBTSh0TUA/FUf+u8JCNrwKJJ2GErvcgbiDUzO+QNY
	 LU3dBXVZAEv8d4dZI6ekvsjyFHxcGNdMz5B9O5bMNJrNoICIt835KxN6S4cA5fl3Nt
	 gYNGztl01LbcaHOxHFMPJ3Xoazz1PVtwWDdJK+7o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6DD87F805D6; Fri, 30 Jun 2023 10:34:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D7B65F80552;
	Fri, 30 Jun 2023 10:34:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CE9B5F80246; Fri, 30 Jun 2023 09:06:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20612.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A6665F800E3;
	Fri, 30 Jun 2023 09:06:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6665F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=ipWqNu6j
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LD3pKCQ/WeU+gzlmF+5kshEqWiGUqjxtcNOjGm6PjM4ofTA5tAGBHUpCv2SfxyKO8FfjPDpzPAAgbQ6euJz7fgsujLGhv5EH/uMEKNPxnei4jtVbJ3tiUYSPFQ4jVDvHquXsUjDeZzFaPkiIeAs2u1/TkRQPCusNmkpBifC7pXbQIpHb6nmBHy9pDVw/4Whqe035JJ4MHOSC0TsmdC4fQCTo7cWiO4yR/jLC9VOfvyVQ6OGRNccrpU9F90O9Lqly3QBDQRfVE4XewlG6DTkk3U7i5mZKKJVwQTMImSEHX7AUBimAoh6O/RcgTJJNmwoPzHfPXtIGm6y4G0KMTnkskA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kiSTON/LT+DJq1L7PPgM6zWQ7KjeH+GUxRBrqrMWSBc=;
 b=iykWnc0ME487npvQEAhO7xhNpTyLRK5frNVgANr1frC14OWDVMem0tDbCaEYjHBKBrnOv308WCpXWbGl0xlybT62z+Bj6qjSXxtYd/sSMAEFfoxXbB3v9mclYqgwdAM7YcU/IwWKAjZhjCG407pCSS0dKHBjkthIjvptIMqaUuBOxJxvLsDs8ADQauE8aZ3Dww9TF5GFCnusG0M60t0Ko39+qxGorpOgk1eLXXBV2LXk+pD1GvI9Up7vpxoa4yWcVt+NI+uJ5m5uQr8VJvm58w9hLAsw9Dk4vQPqqZpJ2Xj8EakkcKl4dB5bTG6Z2ZR+zm17BaG5+AmRhVuxnTQHwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kiSTON/LT+DJq1L7PPgM6zWQ7KjeH+GUxRBrqrMWSBc=;
 b=ipWqNu6joHcad/OJbM9rAVeOatnNZReJxRCo5qYMG5mjmsKtmKQA/XwAKVxtPf3fJAaAEtG2D/VLVw4dqnVsPj6Vh55aTNg4RwHnN7Oh/ZcLOfUA7Lop9cVNf98YjSWHfWR0I7to7OpV7LFkIrxm+id7Zaebm+llFdNFZ+whLec=
Received: from DS7PR03CA0333.namprd03.prod.outlook.com (2603:10b6:8:55::15) by
 CH0PR12MB5220.namprd12.prod.outlook.com (2603:10b6:610:d3::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.19; Fri, 30 Jun 2023 07:06:40 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:55:cafe::f8) by DS7PR03CA0333.outlook.office365.com
 (2603:10b6:8:55::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.22 via Frontend
 Transport; Fri, 30 Jun 2023 07:06:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6521.43 via Frontend Transport; Fri, 30 Jun 2023 07:06:40 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 02:06:38 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.23; Fri, 30 Jun
 2023 00:06:30 -0700
Received: from mastan.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.23 via Frontend
 Transport; Fri, 30 Jun 2023 02:06:11 -0500
From: Mastan Katragadda <Mastan.Katragadda@amd.com>
To: <broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <vijendar.mukunda@amd.com>,
	<Arungopal.kondaveeti@amd.com>, <vsujithkumar.reddy@amd.com>,
	<venkataprasad.potturu@amd.com>, Mastan Katragadda
	<Mastan.Katragadda@amd.com>, Pierre-Louis Bossart
	<pierre-louis.bossart@linux.intel.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao
	<yung-chuan.liao@linux.intel.com>, Ranjani Sridharan
	<ranjani.sridharan@linux.intel.com>, Daniel Baluta <daniel.baluta@nxp.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Jaroslav Kysela
	<perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, V sujith kumar Reddy
	<Vsujithkumar.Reddy@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>, Ajit Kumar Pandey
	<AjitKumar.Pandey@amd.com>, Paul Olaru <paul.olaru@nxp.com>, "moderated
 list:SOUND - SOUND OPEN FIRMWARE (SOF) DRIVERS"
	<sound-open-firmware@alsa-project.org>, open list
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] ASoC: SOF: amd: refactor PSP smn_read
Date: Fri, 30 Jun 2023 12:35:43 +0530
Message-ID: <20230630070544.2167421-2-Mastan.Katragadda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230630070544.2167421-1-Mastan.Katragadda@amd.com>
References: <20230630070544.2167421-1-Mastan.Katragadda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT053:EE_|CH0PR12MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b7a888b-5bc1-474e-fe32-08db79388dbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Yy7RcAj458X943fDZX5mUkOrouqo6I10snrb9uar+fY+UODQywOzaFtlspO+uIBV3+ZqGh7H1a02Hr8kIKVLEoZjs9fGlHwaUu4ZXGWr1VNIk8s96Z5rSXicrGaw0Z54JzNHevujB1XLT+6Xqn1b5F14IaXKLsTCpTpGd9QGJY3AD05Mv0St1f7unEQWaxc4W6WWylXbmafrgLkUweI5Xlc5dgo6kp1vH8qVghSP1dVutTWRn2Laqoej55gaNB+s4J78Str6lPehC+/Y8ZHR65nwddOhX1PDQE+lQtmXnvIzhcOIPqHLVmMQZBwD4yqqfPZwpdW169eEG3LfN7C5TD/yiTnGGmbqLEfGVO0xb02VuVusv7T3qxS02Zz4Hdi/MsyjqT8IPEDK6VqLMGrA2tlNvQyrckw2X2TnPMn4vPP3ag82+MUV/ztD46p5zBIplQWuxP04HqUB+yBUPLvGLQ2+Rb5RikAYtJqa7gNSOcz+uyJs1iJkwmaTE37L1Xb1r43r3fMwV8XsXOr+BnJQ3uXNd+MQO0lW0GafFIR5ILeTt36zYyQbdOHYHOyvGpJRtwIaltS4VFAcZp/QLCSxU9ONLaOpEBDkKafLpUdaAswWPydB/CPot7+c0aWpzkISAjm6JfQI/o9JzNdI7LLSb87NqON/5xkYJ71bhox+LFJT6pMcn1AGTSSbT7IunOa+GytXECCLy0BTC5bgnhp5QFT2I/C04rJwUAda9OM4DvIwvWHfIs3ui30MfS5Q/q3HRMQGazkO9nS6r1M1mwoelA==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199021)(46966006)(36840700001)(40470700004)(86362001)(54906003)(8936002)(8676002)(5660300002)(82310400005)(7416002)(26005)(1076003)(7696005)(478600001)(6916009)(4326008)(70206006)(70586007)(41300700001)(316002)(6666004)(186003)(2616005)(2906002)(47076005)(40460700003)(83380400001)(336012)(426003)(36860700001)(40480700001)(36756003)(82740400003)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2023 07:06:40.5666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8b7a888b-5bc1-474e-fe32-08db79388dbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5220
X-MailFrom: Mastan.Katragadda@amd.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: PCJWRWUEJKMIDKW36ELSNFJXFXKEVOGB
X-Message-ID-Hash: PCJWRWUEJKMIDKW36ELSNFJXFXKEVOGB
X-Mailman-Approved-At: Fri, 30 Jun 2023 08:34:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PCJWRWUEJKMIDKW36ELSNFJXFXKEVOGB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the read_poll_timeout marco for PSP smn_read calls.

Signed-off-by: Mastan Katragadda <Mastan.Katragadda@amd.com>
---
 sound/soc/sof/amd/acp.c | 34 +++++++++++++++-------------------
 sound/soc/sof/amd/acp.h |  4 ++--
 2 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index afb505461ea1..c450931ae77e 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -28,12 +28,14 @@ static int smn_write(struct pci_dev *dev, u32 smn_addr, u32 data)
 	return 0;
 }
 
-static int smn_read(struct pci_dev *dev, u32 smn_addr, u32 *data)
+static int smn_read(struct pci_dev *dev, u32 smn_addr)
 {
+	u32 data = 0;
+
 	pci_write_config_dword(dev, 0x60, smn_addr);
-	pci_read_config_dword(dev, 0x64, data);
+	pci_read_config_dword(dev, 0x64, &data);
 
-	return 0;
+	return data;
 }
 
 static void init_dma_descriptor(struct acp_dev_data *adata)
@@ -150,15 +152,13 @@ int configure_and_run_dma(struct acp_dev_data *adata, unsigned int src_addr,
 static int psp_mbox_ready(struct acp_dev_data *adata, bool ack)
 {
 	struct snd_sof_dev *sdev = adata->dev;
-	int timeout;
+	int ret;
 	u32 data;
 
-	for (timeout = ACP_PSP_TIMEOUT_COUNTER; timeout > 0; timeout--) {
-		msleep(20);
-		smn_read(adata->smn_dev, MP0_C2PMSG_114_REG, &data);
-		if (data & MBOX_READY_MASK)
-			return 0;
-	}
+	ret = read_poll_timeout(smn_read, data, data & MBOX_READY_MASK, MBOX_DELAY_US,
+				ACP_PSP_TIMEOUT_US, false, adata->smn_dev, MP0_C2PMSG_114_REG);
+	if (!ret)
+		return 0;
 
 	dev_err(sdev->dev, "PSP error status %x\n", data & MBOX_STATUS_MASK);
 
@@ -177,23 +177,19 @@ static int psp_mbox_ready(struct acp_dev_data *adata, bool ack)
 static int psp_send_cmd(struct acp_dev_data *adata, int cmd)
 {
 	struct snd_sof_dev *sdev = adata->dev;
-	int ret, timeout;
+	int ret;
 	u32 data;
 
 	if (!cmd)
 		return -EINVAL;
 
 	/* Get a non-zero Doorbell value from PSP */
-	for (timeout = ACP_PSP_TIMEOUT_COUNTER; timeout > 0; timeout--) {
-		msleep(MBOX_DELAY);
-		smn_read(adata->smn_dev, MP0_C2PMSG_73_REG, &data);
-		if (data)
-			break;
-	}
+	ret = read_poll_timeout(smn_read, data, data, MBOX_DELAY_US, ACP_PSP_TIMEOUT_US, false,
+				adata->smn_dev, MP0_C2PMSG_73_REG);
 
-	if (!timeout) {
+	if (ret) {
 		dev_err(sdev->dev, "Failed to get Doorbell from MBOX %x\n", MP0_C2PMSG_73_REG);
-		return -EINVAL;
+		return ret;
 	}
 
 	/* Check if PSP is ready for new command */
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index dc624f727aa3..c3659dbc3745 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -61,12 +61,12 @@
 #define HOST_BRIDGE_CZN				0x1630
 #define HOST_BRIDGE_RMB				0x14B5
 #define ACP_SHA_STAT				0x8000
-#define ACP_PSP_TIMEOUT_COUNTER			5
+#define ACP_PSP_TIMEOUT_US			1000000
 #define ACP_EXT_INTR_ERROR_STAT			0x20000000
 #define MP0_C2PMSG_114_REG			0x3810AC8
 #define MP0_C2PMSG_73_REG			0x3810A24
 #define MBOX_ACP_SHA_DMA_COMMAND		0x70000
-#define MBOX_DELAY				1000
+#define MBOX_DELAY_US				1000
 #define MBOX_READY_MASK				0x80000000
 #define MBOX_STATUS_MASK			0xFFFF
 
-- 
2.25.1

