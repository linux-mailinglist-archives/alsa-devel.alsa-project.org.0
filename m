Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A59E0642812
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Dec 2022 13:08:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2436217DC;
	Mon,  5 Dec 2022 13:07:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2436217DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670242106;
	bh=370FvnMUs6gMTBcpS4OIrn1M9NStu1KS0byTD+s+rWQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XoNro1uT5TuE9uoE8XQ4gMn0KlsGeCSUboOkpRrqFqGdzVFJpxgFNgd1RYD2SYSEJ
	 CkcD9aMz1y/mAEcpxdXzpk5duC8gw/Dso4lRmo91XZYVTzmis5uBeTO4V0SJMZy7+V
	 N8s3qicPIO5kJY1OyiGmNP+M2/YAimbrKmYKL/x4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DE90F80171;
	Mon,  5 Dec 2022 13:07:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B319F804C2; Mon,  5 Dec 2022 13:07:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8c::616])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5BE47F80171;
 Mon,  5 Dec 2022 13:07:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BE47F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="MivUhBi/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PRAOcUca+ER+7YC1M83kpeE7NJNvYULRKz8pX1pLqXIvT/H1+EHiB87RM87PFSAfKEnyZqW7OfKnZRr85hBvwgrtuvTefyEyJcx7UeLl+6bkjST673VMITg22b1+Jy1h6oslyJ7WLKYkaDC8680410kOq6mTpGDxgm6qE7rCwTUuwqKQDAm2Ld/rlI8YPhAbahY1XyjSQCGx+Y5Q0D9aJLFd6GtwbOl8Lz7p8VSEU3nIpvU2L+bT3i4vafyxYOq981ZthLStMdtoOkdtASntHATZayFECyXSgeDuuH3AlHOSX08WJfu2pZvJvpay3apL+mQyXAzKTvQRdB/TEPR8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vF/MdoHxIs/dNMRujRZ1nZS3C4cCmscams5Llrr0zHs=;
 b=bGc79BXOuxhf9xR7k/1aQyeMxeSXaJ8LkuG7MYFa1jW3IPHdtpuCFJBiHF+EpC64fXjNwqtn9OQSSjKAGbJccGIrzD4rl1ypu60a/6joJlrgYelU/2g9UaQ+KqRGrnSQHUJxzLSXuU8ul9VxMC2A0N8tAo69ZMYqX1GJ0POl4moJfTcaTNm9uPEIbPO85qEUeduCPZQJ1tuOCN/Ti+oxwBqK3bKvP130RlEoRPYSn/YBeckF+FP2LAhAQedwUvpu7qSPUplDUq2eK0CPgcRkgwqOl1/WmGveTB3LlGEVab87JyeIlqGWPlrZ1zkSs4U6KNs1wHbLNOIqAmgqYTfJmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vF/MdoHxIs/dNMRujRZ1nZS3C4cCmscams5Llrr0zHs=;
 b=MivUhBi/2dbvloIonxKTymLC+SgxhVEWwctEij/iVYsvmIQhnjpiyA0ZKnAxLQzoW3/KEM0qtBJZV9bDs04f5EGK84Qp5Av5tjM16lrWdtOmsR9lIFF2JA1tdRgNBuvONqwcWSRQSZnrgM5UIdU0jcbD9nmwFM9EshCqXxtlwc8=
Received: from BN7PR06CA0052.namprd06.prod.outlook.com (2603:10b6:408:34::29)
 by DS0PR12MB6533.namprd12.prod.outlook.com (2603:10b6:8:c2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 12:07:10 +0000
Received: from BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::ba) by BN7PR06CA0052.outlook.office365.com
 (2603:10b6:408:34::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Mon, 5 Dec 2022 12:07:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT048.mail.protection.outlook.com (10.13.177.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Mon, 5 Dec 2022 12:07:09 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 06:06:52 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 5 Dec
 2022 06:06:52 -0600
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 5 Dec 2022 06:06:46 -0600
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 1/2] ASoC: SOF: amd: Use poll function instead to read
 ACP_SHA_DSP_FW_QUALIFIER
Date: Mon, 5 Dec 2022 17:36:48 +0530
Message-ID: <20221205120649.1950576-2-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205120649.1950576-1-Vsujithkumar.Reddy@amd.com>
References: <20221205120649.1950576-1-Vsujithkumar.Reddy@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT048:EE_|DS0PR12MB6533:EE_
X-MS-Office365-Filtering-Correlation-Id: 3685515d-02cc-46da-76cd-08dad6b93c93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SXOCcG8NgnTSUSnG5j9Czl/TFlZAi7XnRZFw7kvHT02cfjhHHNMotfsPlDnLzaLGYzyPmldaI0Sf78DYeEFcVzxeC4cbt8+RuXnBuTml7cFUa43zOQhXgXBgF9J49PQVuJED612MKKcY5O0mV+8STk+rrVnkyTpZcaBsb/OS38n1+zXFD3dQXZ3Tt6NHij3aUq+p+OGeHpiSwTQ/TX5vON9ZUk2dluWC7VoBenoTwgpDL6Ex2Txc4VfWxi64QcYOuQoooD/u8ZLgaErXnHvHLygRb85CCnJPRyjcG3KbWBw2wtt/8F5++oJPDjYDnqqena7sJTG1qkrv2aSTmz5SrinTtkWfYxZjjdJJwIEEIxjD3lm7e/5SHaKjnqd2t2E3dFCslbTKOCNsAwRpb/IBHnCYLRTfSoxBfCe73B3P4g5G7z5qFLw15y/ZQMEi9CdRequ1quRVZ5Tegn711iDBgT7ntZh5oK+OHP0wdbSROB8e0CiRcaBwR89+GAnDYjMzd65K1kGsbgL7PlBeaPiCSWt5uy99g8S1GLZwpHMsJLlz1GZooy4fLfXa5M8HslgF4epGIg3MYhTik2fhaYgtIRzSzv8c6+T9BHnJkj9BUqqESp9jV3eKjM2ScppbWG4R6BEXnGEpJosObdzTsT2tA1Tpa+GzVGFuHG9edTSlqDIfOd6pvkrjKR2heTVLWSl9yeoAyXYNSIJHPvqxDfCrX7VpQDlXC5oSZg57pE7evt0=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(40470700004)(36840700001)(46966006)(2906002)(1076003)(41300700001)(7416002)(83380400001)(5660300002)(336012)(8936002)(47076005)(426003)(36860700001)(82310400005)(86362001)(40480700001)(36756003)(40460700003)(82740400003)(356005)(81166007)(26005)(316002)(110136005)(54906003)(7696005)(2616005)(186003)(4326008)(70206006)(70586007)(8676002)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 12:07:09.9468 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3685515d-02cc-46da-76cd-08dad6b93c93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6533
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Sunil-kumar.Dommati@amd.com,
 ssabakar@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 venkataprasad.potturu@amd.com, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 open list <linux-kernel@vger.kernel.org>, "moderated list:SOUND - SOUND OPEN
 FIRMWARE \(SOF\) DRIVERS" <sound-open-firmware@alsa-project.org>
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

From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>

The Skyrim project and Whiterun met error when DSP
loading during device boot.
Ex, error in kernel log,
ERR kernel: [   16.124537] snd_sof_amd_rembrandt
0000:04:00.5: PSP validation failed.

Use the snd_sof_dsp_read_poll_timeout function to successfully
read the FW_QUALIFIER register

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
---
 sound/soc/sof/amd/acp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 47115a77c92c..6bd2888fbb66 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -255,10 +255,12 @@ int configure_and_run_sha_dma(struct acp_dev_data *adata, void *image_addr,
 	if (ret)
 		return ret;
 
-	fw_qualifier = snd_sof_dsp_read(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER);
-	if (!(fw_qualifier & DSP_FW_RUN_ENABLE)) {
+	ret = snd_sof_dsp_read_poll_timeout(sdev, ACP_DSP_BAR, ACP_SHA_DSP_FW_QUALIFIER,
+					    fw_qualifier, fw_qualifier & DSP_FW_RUN_ENABLE,
+					    ACP_REG_POLL_INTERVAL, ACP_DMA_COMPLETE_TIMEOUT_US);
+	if (ret < 0) {
 		dev_err(sdev->dev, "PSP validation failed\n");
-		return -EINVAL;
+		return ret;
 	}
 
 	return 0;
-- 
2.25.1

