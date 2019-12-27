Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E378A12B4A5
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Dec 2019 13:56:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7181C1718;
	Fri, 27 Dec 2019 13:55:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7181C1718
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1577451380;
	bh=TPuccQSKXww/V3UrTblnBGG9S9LfBiqpSFMW9MI2el8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZWfhimRPMKDAaTx9eU3GcIPqk8nMTI3WdG7nhlpsEMSnovCRRhV/Rdxa85+prgEg1
	 iccxRMX9CtxD2SeqDeEhYe2kahivob6o6hoX6xugbqSc/mJ0CkzGHXn3d0g4qPwkas
	 F2mMxx+ItOYKXC2ECxxy1mJKxFQdWwZz64zgPlrs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82C0FF80278;
	Fri, 27 Dec 2019 13:53:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21AAEF80276; Fri, 27 Dec 2019 13:53:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 FORGED_SPF_HELO,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM02-BL2-obe.outbound.protection.outlook.com
 (mail-eopbgr750089.outbound.protection.outlook.com [40.107.75.89])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C6965F800CD
 for <alsa-devel@alsa-project.org>; Fri, 27 Dec 2019 13:53:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C6965F800CD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="j9Xjhia7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iTc6LtlX/K5825MdOxEy/AATHxOEaU91cfZ2Hc9fkzAkv3TQkhDMtVJsbvTH0dxLCzw67IRDyeIOiNyQ+HAc6vFMjT66NapaBt1G4wl5Rxr/OgsIw9I7xc1koat/8J70v/bdXSYhvsxnbgrz1buOYbSDTARN6/TZWo7PE5TxFMxBKDRc5MlUhmXc9NIpzStHSQ/Pbjs3iy59+6+c72iJmbHJEisZUFMmiih/nPSsFqg9n10h++8ngI5JXyCTt8ZiFbkIDHWdMOQVw+EbT+4LbFzjz/LpEJkVryovu2pgru8aLonw5pt3KgpwLZBHPRa6MfX1xDazbbMQUsbcrdBcCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mdgek00TsSnoMxIS21IWGmJHkoCuyKMVtdhq/coqliQ=;
 b=eovRetw6cv78k3JyGgqs6qXPjaNYsqyLuKBsXlHn91G2NczGPah71+9tJafH6fehbgYE0VdMCsxbHQ5C8Dfaha9jUWP57aTEBBG0xAh0UUi/K0H2uXDP9i8pwHEiaNWGg4z261BDIoi+pHYJr7ylaC87O6UArXdLkiLpZDyCwARsMv2NpQFotXPHekGdb5PKOKOiyx6cyPKarMAj63n4Un7i7+Ve7Bgg5hyCehWc26K7ixIB/F/GOnKAZrU3fgrDs0KnPWz5tu7k6tAJ4ncx9cbJ35nve/qZ6UDiJOMWdJGgXJTkxOn5K7JQ3hKEOndlwy8L77WBG7dU/5LLXnqpZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=google.com smtp.mailfrom=amd.com;
 dmarc=permerror action=none header.from=amd.com; dkim=none (message not
 signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mdgek00TsSnoMxIS21IWGmJHkoCuyKMVtdhq/coqliQ=;
 b=j9Xjhia7+0jUa7BkGf6QAA7s095NyFV/uzf/kJkKqzhOmzxlfJYZxgpUuM4K4VJv+tDh597CEh6qCKhtnkxb6vhihdCbKDJFT7/epA8/lM7MbIXziu9QoTRFSlyNrO9ugemRNwyLV7T+JwazqIu8jC3hviGQLz316604c2QyHFo=
Received: from CY4PR1201CA0004.namprd12.prod.outlook.com
 (2603:10b6:910:16::14) by DM6PR12MB3323.namprd12.prod.outlook.com
 (2603:10b6:5:11f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.11; Fri, 27 Dec
 2019 12:53:11 +0000
Received: from CO1NAM11FT026.eop-nam11.prod.protection.outlook.com
 (2a01:111:f400:7eab::202) by CY4PR1201CA0004.outlook.office365.com
 (2603:10b6:910:16::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2581.12 via Frontend
 Transport; Fri, 27 Dec 2019 12:53:11 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; google.com; dkim=none (message not signed)
 header.d=none;google.com; dmarc=permerror action=none header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXMB02.amd.com (165.204.84.17) by
 CO1NAM11FT026.mail.protection.outlook.com (10.13.175.67) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.2581.11 via Frontend Transport; Fri, 27 Dec 2019 12:53:11 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB02.amd.com
 (10.181.40.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 27 Dec
 2019 06:53:10 -0600
Received: from SATLEXMB01.amd.com (10.181.40.142) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5; Fri, 27 Dec
 2019 06:53:10 -0600
Received: from vishnu-All-Series.amd.com (10.180.168.240) by
 SATLEXMB01.amd.com (10.181.40.142) with Microsoft SMTP Server id 15.1.1713.5
 via Frontend Transport; Fri, 27 Dec 2019 06:53:07 -0600
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Fri, 27 Dec 2019 18:20:52 +0530
Message-ID: <1577451055-9182-4-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577451055-9182-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
References: <1577451055-9182-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(136003)(346002)(376002)(396003)(428003)(189003)(199004)(5660300002)(36756003)(478600001)(26005)(2906002)(70206006)(70586007)(86362001)(6666004)(356004)(8936002)(7696005)(2616005)(4326008)(336012)(426003)(8676002)(81166006)(81156014)(316002)(54906003)(109986005)(186003)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3323; H:SATLEXMB02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 840095a9-3532-4872-d5e6-08d78acbbad7
X-MS-TrafficTypeDiagnostic: DM6PR12MB3323:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3323E167DE1224DE381EBB5DE72A0@DM6PR12MB3323.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2512;
X-Forefront-PRVS: 0264FEA5C3
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yB2qeoqhdm2tjnKgFq+L5o/Hn6BX4AdgXE1hZfUsoKQrpun9BEUx3XixvKsMM5/LcOmuolCbQHKGT6fwxwasjhW4eXtFPchF7VP0RnBFBUaHJhX/leGUPHld+/GwQTa5vCY3kLzxivSC/uzdHhzDi5ntnr0ZtZbkOEUQ+LCH1XWnhuYmpynOdqxNHRXZvIBPsOQCg9zXyxI45Y2EW5MMH3+1sJkwQCcxSf7JK9JY5zdTUqNQd7d1uyPEjFq70ZH/Z2PRcIxPTMpFA8/RJwjrgXTOgE25nsv+BF+zRwdmzt/4u8+EMel15kSKKqHJc+RA9lXzPyp7WR7utVmQy9iKQPhe1BAstSrHIL1jAhHpJKQJQKHqVfwI2tDcRFJVCWBoPz9CZ7nfb1CYh1XG63s3xMRYlIctSeLwX9Ca/idGjrdw/Sc0w+dAllYtxONABdFFUh9DXxZSr8sST4pGsF46c7JKoRIMJ/S2wAq+UMuQxG0je1rq7AaGiVIYlIu3f0QU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2019 12:53:11.2313 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 840095a9-3532-4872-d5e6-08d78acbbad7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3323
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, pierre-louis.bossart@linux.intel.com,
 Liam Girdwood <lgirdwood@gmail.com>, Ravulapati
 Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>, broonie@kernel.org,
 djkurtz@google.com, Alexander.Deucher@amd.com,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [alsa-devel] [PATCH 3/6] ASoC: amd: add ACP3x TDM mode support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

ACP3x I2S (CPU DAI) can act in normal I2S and TDM modes. Added support
for TDM mode. Desired mode can be selected from ASoC machine driver.

Signed-off-by: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-i2s.c | 28 ++++++++++++++++++++++------
 sound/soc/amd/raven/acp3x.h     |  1 +
 2 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-i2s.c b/sound/soc/amd/raven/acp3x-i2s.c
index 7f05782..0856e0c 100644
--- a/sound/soc/amd/raven/acp3x-i2s.c
+++ b/sound/soc/amd/raven/acp3x-i2s.c
@@ -43,7 +43,7 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,
 		u32 tx_mask, u32 rx_mask, int slots, int slot_width)
 {
 	struct i2s_dev_data *adata;
-	u32 val, reg_val, frmt_val, frm_len;
+	u32 val, reg_val, frmt_reg, frm_len;
 	u16 slot_len;
 
 	adata = snd_soc_dai_get_drvdata(cpu_dai);
@@ -70,15 +70,31 @@ static int acp3x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,
 
 	frm_len = FRM_LEN | (slots << 15) | (slot_len << 18);
 	if (adata->substream_type == SNDRV_PCM_STREAM_PLAYBACK) {
-		reg_val = mmACP_BTTDM_ITER;
-		frmt_val = mmACP_BTTDM_TXFRMT;
+		switch (adata->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			reg_val = mmACP_BTTDM_ITER;
+			frmt_reg = mmACP_BTTDM_TXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = mmACP_I2STDM_ITER;
+			frmt_reg = mmACP_I2STDM_TXFRMT;
+		}
 	} else {
-		reg_val = mmACP_BTTDM_IRER;
-		frmt_val = mmACP_BTTDM_RXFRMT;
+		switch (adata->i2s_instance) {
+		case I2S_BT_INSTANCE:
+			reg_val = mmACP_BTTDM_IRER;
+			frmt_reg = mmACP_BTTDM_RXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = mmACP_I2STDM_IRER;
+			frmt_reg = mmACP_I2STDM_RXFRMT;
+		}
 	}
 	val = rv_readl(adata->acp3x_base + reg_val);
 	rv_writel(val | 0x2, adata->acp3x_base + reg_val);
-	rv_writel(frm_len, adata->acp3x_base + frmt_val);
+	rv_writel(frm_len, adata->acp3x_base + frmt_reg);
 	adata->tdm_fmt = frm_len;
 	return 0;
 }
diff --git a/sound/soc/amd/raven/acp3x.h b/sound/soc/amd/raven/acp3x.h
index a1cdc4e..43213ae 100644
--- a/sound/soc/amd/raven/acp3x.h
+++ b/sound/soc/amd/raven/acp3x.h
@@ -78,6 +78,7 @@ struct acp3x_platform_info {
 struct i2s_dev_data {
 	bool tdm_mode;
 	unsigned int i2s_irq;
+	u16 i2s_instance;
 	u32 tdm_fmt;
 	u32 substream_type;
 	void __iomem *acp3x_base;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
