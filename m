Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E244B704AAC
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 12:33:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4619826;
	Tue, 16 May 2023 12:32:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4619826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684233207;
	bh=2Dt9mifmll11KpC/k+Upufju217SuRuTc+65KaQxxAA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=NwKeANbTayA39Pf68qmIhypKv5OTwn+3sHXaTAcF2krA5EQfcIwctnT0mriiLTazd
	 Sf5Wu585touPdo+y+uwjh3N0NNWVOW47+hscdgC/U3NqfkO0NkNqqMgzlvVSvxcio6
	 Mjko+oN/BBWBatyOmKDoLC5xLvW9pzloL49zluZY=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CBC70F805C1; Tue, 16 May 2023 12:31:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3BA80F80431;
	Tue, 16 May 2023 12:31:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D65CF805BD; Tue, 16 May 2023 12:31:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062f.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::62f])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 42179F805B2
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 12:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42179F805B2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=mwMvZgoU
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U1QHeA4iy8mULplswmBxGM/Ih5wlgdtbItsD+IPwlmIkzkwajm9Kupb4tnroX6VGpMDGY2M/1n3q9ktBbF9QAzrtcp8b6JAIB3JOIN2eFbwsDBgGW/vSW7YDxJAkrbsw588juPf3M4kZ8mdF/FelutPm9+nv5+mPuGD7gn+eaGFezddJH03ZBquOBYxs/mD0OKyq5SNcwEhx0lMLATmqAbfPSoD6Y7WxPw8r04TQee68IvcFdwppDzLMcDTi2bUNyXDJILhiMYqqQbkdkilr2W8x4q6BwQ3PzUs6ALaB/KAyAQ0C5Ds9WL2anBhqaHExpPN0xzyMRQeRmzCswzNSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIJPqD8hVBXmxBAtvgwqkMZvWi8fkklQZQZaCeIOebY=;
 b=hAN+GCurO6l9Npi2KZZEQx9yqtBXNIWDDTypaGkA8kjzAmPmr9iH8L67GPIvy4BOAtdHzmcQLzGZwCesr9GigPpZcn/V/nONQfIUljQf8Ytz9KMIWFr/T2YAij/HU+mfQkHIqyM6WNmdELbUZSIMlNcPWte4huAq29vsfNcC6qrFiC5rUsfNrG5GVTpGmjRigUE8C+0Mc8WLW6Ds2bkjgxAe0MecyeaNiXA4+saYKiieHFSiGLYKeenLgHQAV95dU6BivHEpwbUjZtGJ5DjjLCSlhlXLFIQqblXE5QWWUIeuocfLDbgKNkg+DHWXzdRVxt69QlAj8fe63E3WFsHfSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIJPqD8hVBXmxBAtvgwqkMZvWi8fkklQZQZaCeIOebY=;
 b=mwMvZgoUsWZboFdHBfDZsXVgvllzoLRcfTdvjDWCG66NEGz2X5PAU2FU5xEn85BRo7S84PPJVShsZTYej0tgw5NbAqUZlSn5EFdsL631AbAcXlMYFyYG8FXxedIa6z4YoGXuFNnvtr1pP1HvLCA8+pk405xZq3i8ARxlMMWyVDw=
Received: from DM6PR11CA0059.namprd11.prod.outlook.com (2603:10b6:5:14c::36)
 by PH8PR12MB7232.namprd12.prod.outlook.com (2603:10b6:510:224::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.28; Tue, 16 May
 2023 10:31:26 +0000
Received: from DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::31) by DM6PR11CA0059.outlook.office365.com
 (2603:10b6:5:14c::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.33 via Frontend
 Transport; Tue, 16 May 2023 10:31:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT080.mail.protection.outlook.com (10.13.173.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6411.15 via Frontend Transport; Tue, 16 May 2023 10:31:26 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 05:31:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 16 May
 2023 05:31:13 -0500
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 16 May 2023 05:31:09 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <--to=broonie@kernel.org>
CC: <alsa-devel@alsa-project.org>, <Basavaraj.Hiregoudar@amd.com>,
	<Sunil-kumar.Dommati@amd.com>, <Mastan.Katragadda@amd.com>,
	<Arungopal.kondaveeti@amd.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Syed Saba
 Kareem" <Syed.SabaKareem@amd.com>, Mario Limonciello
	<mario.limonciello@amd.com>, open list <linux-kernel@vger.kernel.org>
Subject: [PATCH 5/9] ASoC: amd: ps: add support for Soundwire DMA interrupts
Date: Tue, 16 May 2023 16:05:39 +0530
Message-ID: <20230516103543.2515097-6-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230516103543.2515097-1-Vijendar.Mukunda@amd.com>
References: <20230516103543.2515097-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT080:EE_|PH8PR12MB7232:EE_
X-MS-Office365-Filtering-Correlation-Id: e9551eed-6fe0-4163-d4cd-08db55f8b3e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yi7Ywkn/Cj3l8ynJWFx0n8gLBDo61ChZBMrFgiqMsez+v3qJiDcdyyVrPJz/871Gb72AIggIwuXOu07N8TIV6ybZnglT57U7KgG2f3O0EZQZv+6sVDKQqcfjZOzMshTVIgQQaMdS3O0ArpR6Yf53pRgOooFk9YKupXkaJui+3HphYaJ1M2MScUvj04TCpTl0jDZIlhU5YiRLnFJfq+ZaaKb6RSriZ4l6tGghw4yGU6qGoy0Vi7XcsAb6flDdr65DeWJP/iXnStbZ8WRMi+L9csUaE0pFBEyg7qTlMUdA0Gm19Z/EdXZPO+5hMYQm8rSWt1KZwtFSbSITE1jlfLa2DcEmtMxIYCsbdDCv35TstZnfcpDSEUy9B8brK9KJwpXnXKtZ0gIvYLVUFWlQaSJLfozMhfQBzK0S/MIjzBAA4EhaYQQQcM4Okio/omfYZuU/IekNYxDwsDzv2lOKfVXoMXjSEprUA3qLn1MvZydo6zlN4Tb8wMMqCkGUngU0Fc/4YyUqWPhz2h/kMHaKHHs2mN2GZCFtd193QVvqlSQk2fB464ORlikrOCFIFN28pWGP8buzOQ+Z+Xk2TudVE+UaMryJbic6I5Ki0KY+EBwaC/09Byl7+4eic4UD7nzZZLURdVa0tVX+XxjhExtr6FfrfqXNM5hKVRmGTGbIL+Zhs238gRpvpfFpMZR5/0NgafGnPWOry3bCeHMaTC9P4Wiqp3bZAD0wBrt/m5q6T7ves2P6WCHtppQJ7FYE+07wCOYPgsSZuxdfKbMTkUaFZ/MY3Q==
X-Forefront-Antispam-Report: 
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(40460700003)(4326008)(86362001)(316002)(70586007)(70206006)(478600001)(54906003)(7696005)(36756003)(83380400001)(426003)(47076005)(26005)(2616005)(186003)(1076003)(36860700001)(8676002)(5660300002)(356005)(8936002)(81166007)(6666004)(82310400005)(40480700001)(2906002)(41300700001)(336012)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 10:31:26.0579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e9551eed-6fe0-4163-d4cd-08db55f8b3e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7232
Message-ID-Hash: B73ZHH2365JQOTIXQNPKVQNWPSV3OFKF
X-Message-ID-Hash: B73ZHH2365JQOTIXQNPKVQNWPSV3OFKF
X-MailFrom: Vijendar.Mukunda@amd.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/B73ZHH2365JQOTIXQNPKVQNWPSV3OFKF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Initialize workqueue for Soundwire DMA interrupts handling.
Whenever audio data equal to the Soundwire FIFO watermark level
are produced/consumed, interrupt is generated.
Acknowledge the interrupt and schedule the workqueue.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/ps/acp63.h  | 17 ++++++++
 sound/soc/amd/ps/pci-ps.c | 87 ++++++++++++++++++++++++++++++++++++++-
 2 files changed, 103 insertions(+), 1 deletion(-)

diff --git a/sound/soc/amd/ps/acp63.h b/sound/soc/amd/ps/acp63.h
index 7f8e1c76ba4f..f03a98a0b9e3 100644
--- a/sound/soc/amd/ps/acp63.h
+++ b/sound/soc/amd/ps/acp63.h
@@ -135,6 +135,20 @@ enum acp_pdev_mask {
 	ACP63_SDW_PDM_DEV_MASK,
 };
 
+enum amd_sdw0_channel {
+	ACP_SDW0_AUDIO0_TX = 0,
+	ACP_SDW0_AUDIO1_TX,
+	ACP_SDW0_AUDIO2_TX,
+	ACP_SDW0_AUDIO0_RX,
+	ACP_SDW0_AUDIO1_RX,
+	ACP_SDW0_AUDIO2_RX,
+};
+
+enum amd_sdw1_channel {
+	ACP_SDW1_AUDIO1_TX,
+	ACP_SDW1_AUDIO1_RX,
+};
+
 struct pdm_stream_instance {
 	u16 num_pages;
 	u16 channels;
@@ -217,9 +231,12 @@ struct acp63_dev_data {
 	struct platform_device *pdev[ACP63_DEVS];
 	struct mutex acp_lock; /* protect shared registers */
 	struct fwnode_handle *sdw_fw_node;
+	struct work_struct acp_sdw_dma_work;
 	u16 pdev_mask;
 	u16 pdev_count;
 	u16 pdm_dev_index;
+	u16 sdw0_dma_intr_stat[ACP63_SDW0_DMA_MAX_STREAMS];
+	u16 sdw1_dma_intr_stat[ACP63_SDW1_DMA_MAX_STREAMS];
 	u8 sdw_manager_count;
 	u16 sdw0_dev_index;
 	u16 sdw1_dev_index;
diff --git a/sound/soc/amd/ps/pci-ps.c b/sound/soc/amd/ps/pci-ps.c
index 6566ee14d300..ba8ec8442a6e 100644
--- a/sound/soc/amd/ps/pci-ps.c
+++ b/sound/soc/amd/ps/pci-ps.c
@@ -99,14 +99,44 @@ static int acp63_deinit(void __iomem *acp_base, struct device *dev)
 	return 0;
 }
 
+static void acp63_sdw_dma_workthread(struct work_struct *work)
+{
+	struct acp63_dev_data *adata = container_of(work, struct acp63_dev_data,
+						    acp_sdw_dma_work);
+	struct sdw_dma_dev_data *sdw_dma_data;
+	u32 stream_index;
+	u16 pdev_index;
+
+	pdev_index = adata->sdw_dma_dev_index;
+	sdw_dma_data = dev_get_drvdata(&adata->pdev[pdev_index]->dev);
+
+	for (stream_index = 0; stream_index < ACP63_SDW0_DMA_MAX_STREAMS; stream_index++) {
+		if (adata->sdw0_dma_intr_stat[stream_index]) {
+			if (sdw_dma_data->sdw0_dma_stream[stream_index])
+				snd_pcm_period_elapsed(sdw_dma_data->sdw0_dma_stream[stream_index]);
+			adata->sdw0_dma_intr_stat[stream_index] = 0;
+		}
+	}
+	for (stream_index = 0; stream_index < ACP63_SDW1_DMA_MAX_STREAMS; stream_index++) {
+		if (adata->sdw1_dma_intr_stat[stream_index]) {
+			if (sdw_dma_data->sdw1_dma_stream[stream_index])
+				snd_pcm_period_elapsed(sdw_dma_data->sdw1_dma_stream[stream_index]);
+			adata->sdw1_dma_intr_stat[stream_index] = 0;
+		}
+	}
+}
+
 static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 {
 	struct acp63_dev_data *adata;
 	struct pdm_dev_data *ps_pdm_data;
 	struct amd_sdw_manager *amd_manager;
 	u32 ext_intr_stat, ext_intr_stat1;
+	u32 stream_id = 0;
 	u16 irq_flag = 0;
+	u16 sdw_dma_irq_flag = 0;
 	u16 pdev_index;
+	u16 index;
 
 	adata = dev_id;
 	if (!adata)
@@ -147,7 +177,57 @@ static irqreturn_t acp63_irq_handler(int irq, void *dev_id)
 			snd_pcm_period_elapsed(ps_pdm_data->capture_stream);
 		irq_flag = 1;
 	}
-	if (irq_flag)
+	if (ext_intr_stat & ACP_SDW_DMA_IRQ_MASK) {
+		for (index = ACP_AUDIO2_RX_THRESHOLD; index <= ACP_AUDIO0_TX_THRESHOLD; index++) {
+			if (ext_intr_stat & BIT(index)) {
+				writel(BIT(index), adata->acp63_base + ACP_EXTERNAL_INTR_STAT);
+				switch (index) {
+				case ACP_AUDIO0_TX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO0_TX;
+					break;
+				case ACP_AUDIO1_TX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO1_TX;
+					break;
+				case ACP_AUDIO2_TX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO2_TX;
+					break;
+				case ACP_AUDIO0_RX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO0_RX;
+					break;
+				case ACP_AUDIO1_RX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO1_RX;
+					break;
+				case ACP_AUDIO2_RX_THRESHOLD:
+					stream_id = ACP_SDW0_AUDIO2_RX;
+					break;
+				}
+
+				adata->sdw0_dma_intr_stat[stream_id] = 1;
+				sdw_dma_irq_flag = 1;
+			}
+		}
+	}
+
+	/* SDW1 BT RX */
+	if (ext_intr_stat1 & BIT(ACP_P1_AUDIO1_RX_THRESHOLD)) {
+		writel(BIT(ACP_P1_AUDIO1_RX_THRESHOLD),
+		       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->sdw1_dma_intr_stat[ACP_SDW1_AUDIO1_RX] = 1;
+		sdw_dma_irq_flag = 1;
+	}
+
+	/* SDW1 BT TX*/
+	if (ext_intr_stat1 & BIT(ACP_P1_AUDIO1_TX_THRESHOLD)) {
+		writel(BIT(ACP_P1_AUDIO1_TX_THRESHOLD),
+		       adata->acp63_base + ACP_EXTERNAL_INTR_STAT1);
+		adata->sdw1_dma_intr_stat[ACP_SDW1_AUDIO1_TX] = 1;
+		sdw_dma_irq_flag = 1;
+	}
+
+	if (sdw_dma_irq_flag)
+		schedule_work(&adata->acp_sdw_dma_work);
+
+	if (irq_flag || sdw_dma_irq_flag)
 		return IRQ_HANDLED;
 	else
 		return IRQ_NONE;
@@ -229,6 +309,7 @@ static int get_acp63_device_config(u32 config, struct pci_dev *pci, struct acp63
 	sdw_dev = acpi_find_child_device(ACPI_COMPANION(&pci->dev), ACP63_SDW_ADDR, 0);
 	if (sdw_dev) {
 		acp_data->sdw_fw_node = acpi_fwnode_handle(sdw_dev);
+		INIT_WORK(&acp_data->acp_sdw_dma_work, acp63_sdw_dma_workthread);
 		ret = sdw_amd_scan_controller(&pci->dev);
 		if (!ret)
 			is_sdw_dev = true;
@@ -607,6 +688,10 @@ static void snd_acp63_remove(struct pci_dev *pci)
 	int ret, index;
 
 	adata = pci_get_drvdata(pci);
+
+	if (adata->pdev_mask & ACP63_SDW_DEV_MASK)
+		cancel_work_sync(&adata->acp_sdw_dma_work);
+
 	for (index = 0; index < adata->pdev_count; index++)
 		platform_device_unregister(adata->pdev[index]);
 	ret = acp63_deinit(adata->acp63_base, &pci->dev);
-- 
2.34.1

