Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E406629266
	for <lists+alsa-devel@lfdr.de>; Tue, 15 Nov 2022 08:22:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E8928163B;
	Tue, 15 Nov 2022 08:21:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E8928163B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1668496920;
	bh=dzLpFVmjbfct/WfRieQjfmGiVYVLvDasmbI0CYOXF8Y=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YV+4RxJA72/UD/eGVnGYjZvh6DinoXo1QwV+J/4rZDljGd5fntONZbpPT/xV1hzCT
	 vkIM0QCcL4GLJwPGHfLQEhDUWDseWu8YY/qPOSNSxm12qdkbiSd6NZLgk8wCWNu8oU
	 1pIj0vkdKMBJPcOuh+6+zOMRA2Xd2wtOGSwKfdVY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6BB32F8055C;
	Tue, 15 Nov 2022 08:20:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA3DEF804DA; Tue, 15 Nov 2022 08:20:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS
 autolearn=disabled version=3.4.0
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20609.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe5a::609])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A96CBF804C2;
 Tue, 15 Nov 2022 08:20:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A96CBF804C2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="S7HOKDw5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JZr92QU9Gaaz/7i03FOuSPorfk+BR/liKbEHzB/exPj16jxaJYNruPOJ7SKGy2b7NliF3/JxrySNLu3tfUOcv8ozJJlrYXL82PoX4uVkHtX7jZ6iqagoN4CSB0Ajz7ZVmuOZ5zHEG884SyBm/+hE5SJfZt96tzZtuMHlXRz8BwHz3NRqyiOrJvOyAg741XPrMWso+4GSAeb/hm3HTqtUc5Rt8hfH6NtJSKciCydU/5O++7KcKODhXUdC1J86D+XgcuQ2qrOIfp5Ud5yTz3/b5cx3E7mkOyFlCQuuStqbx4OlKuP6wfNfHHtv97/LhFSSoIhf8YyVbBMK4hs01ShcqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vCXHXG5BtEYgf/+BYK3iyUAIplq/6UzsISAOKgrXkEU=;
 b=PqWZZjPNdOGT1CnqThp+hG+FLy2xG2dN6J+1e+s6MUUjatRYkAqGgd3j0IKY0VkZ438KT3ByEQ5jKzO6Y+sbNRPq1CO+ZZZRmHY73V97CxXQB8tWfSNiKvnm8L1Ef9+npd0XdpejhqrcV5HxmhMce/3VZfdFSwNvTIzpdCL649NOWvplGcnhJYgaaDvmOZnbg5wZnccyWivUnoPnn4NC/O4PdT1/qScMVAEhu2j26E2RJUDk5HEM2MtE8dzX1JRNmIoZ3RpUygWD6pUqZvuYuJtI8m1ufyurQRtOksbJbbCOnFMoCFZJDRGgO7oEzp/uGE6yUJYEbDc958QOBWTOZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vCXHXG5BtEYgf/+BYK3iyUAIplq/6UzsISAOKgrXkEU=;
 b=S7HOKDw5MkhIvP1BxGNyLn1FzuGMdJuO7Znq/OZhC6/SfsxQkPxpvnzb3PpJfM6qOJVLgnXkEPEh/GNFzAOlZc3I2i0hO7yqHty7unSGjwUMRhbus0+9x8tcjtEU30wU6ByxMh+1TCivykGHOkI0Ay5Sqm/Ikvh9BPv/N0MaOxI=
Received: from BN7PR06CA0062.namprd06.prod.outlook.com (2603:10b6:408:34::39)
 by SJ1PR12MB6266.namprd12.prod.outlook.com (2603:10b6:a03:457::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.18; Tue, 15 Nov
 2022 07:20:34 +0000
Received: from BL02EPF0000EE3E.namprd05.prod.outlook.com
 (2603:10b6:408:34:cafe::fe) by BN7PR06CA0062.outlook.office365.com
 (2603:10b6:408:34::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.17 via Frontend
 Transport; Tue, 15 Nov 2022 07:20:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3E.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.11 via Frontend Transport; Tue, 15 Nov 2022 07:20:34 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 15 Nov
 2022 01:20:00 -0600
Received: from sof-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 15 Nov 2022 01:19:53 -0600
From: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 2/4] ASoC: SOF: amd: Fix for selecting clock source as
 external clock.
Date: Tue, 15 Nov 2022 12:49:54 +0530
Message-ID: <20221115072001.1931617-2-Vsujithkumar.Reddy@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115072001.1931617-1-Vsujithkumar.Reddy@amd.com>
References: <20221115072001.1931617-1-Vsujithkumar.Reddy@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3E:EE_|SJ1PR12MB6266:EE_
X-MS-Office365-Filtering-Correlation-Id: 15bd6ff4-12fc-4a1e-32e9-08dac6d9e2dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v08EEO4kHVKEXndxD3FeTwyFW8puM1jt4NQQQ+NDPItEkrbTLwndMsPzqIArCUFfRXaJjSJGT6UhWdLyi0QeSD4ta079LiOlaeh00tb3acUPbORBZx2M0+0xUMeRw3MDjNqoUDbDKr4ZFOvjBx3IVzdtj2EbE7AV1VxDNLWe/5zYExH3fGFFe8SUBpc5BGArXkCcC3MeKsWFLxF6+QMPgDIETVWPlGSYkkZXXU3tKN5zqGOVYHJD8idEcUQAAUVfFFu/+XX96/zp5xcF3FuW28pJiTaVQG/GN279cP8sqxB/PHpIEK+ccKP6ovkTAGUs/TAKa59XDPmowWsysCw+6poBA8VGTV0H1NHsZRUvlUIxT3uYhQS/4d7WbP6Tgm2eU6FIFeg4oRf3ys9sUdfzokHZq8vlE30E0irw9B4Jd1J0FpUTJrdNSIHZlpAjjPfsgV53IEuMyOxItIsZadb8a5CUAeVEQxKZWkLwInpZNygnSm5EZSg9GcqdBWdZiWxgqVt7zfMFc874wMrCSRRqQ4lheLyYrENhqZ/l/4HdPFj6Q9n9p3Xgok7vw5qSB6w5pThYCG19BtlZq9jDxPrc5Bp1UuATS6NYRCdiL94QtnVl1gd+Ta4Q95+S1BiH2ML++k3M/s+8MEL2LohiOy6fBNdY/B85E3xnS73peVb54jcAlUOo24ldoVXRI21QAPB4iOMu2btBkL1Dv1vhItiVlZv6t3wvBITCAYSPuVNRVK9RxN00rdkjOC4rTeNJz3S8BleJmQbEDjXlxjLxww+Q++rIIWCzqennfUj8wFYVS3rVg0crwlNSdllsJd+frypd
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(346002)(39860400002)(136003)(451199015)(46966006)(36840700001)(40470700004)(82310400005)(40460700003)(36756003)(40480700001)(86362001)(83380400001)(26005)(7696005)(1076003)(2616005)(47076005)(426003)(336012)(186003)(82740400003)(356005)(81166007)(36860700001)(7416002)(8936002)(4326008)(8676002)(5660300002)(41300700001)(2906002)(70206006)(478600001)(70586007)(316002)(54906003)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2022 07:20:34.2162 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15bd6ff4-12fc-4a1e-32e9-08dac6d9e2dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000EE3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6266
Cc: Daniel Baluta <daniel.baluta@nxp.com>,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, Sunil-kumar.Dommati@amd.com,
 ssabakar@amd.com, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 venkataprasad.potturu@amd.com, Bard
 Liao <yung-chuan.liao@linux.intel.com>, Basavaraj.Hiregoudar@amd.com,
 Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Vijendar.Mukunda@amd.com, V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Ajit Kumar
 Pandey <AjitKumar.Pandey@amd.com>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:SOUND - SOUND OPEN
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

By default clock source is selected as internal clock of 96Mhz
which is not configurable. Now we select the clock source to
external clock (ACLK) which can be configurable to different clock
ranges depending on usecase.

Signed-off-by: V sujith kumar Reddy <Vsujithkumar.Reddy@amd.com>
---
 sound/soc/sof/amd/acp.c | 4 +++-
 sound/soc/sof/amd/acp.h | 8 ++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/sound/soc/sof/amd/acp.c b/sound/soc/sof/amd/acp.c
index 36966643e36a..47115a77c92c 100644
--- a/sound/soc/sof/amd/acp.c
+++ b/sound/soc/sof/amd/acp.c
@@ -390,6 +390,7 @@ static int acp_power_on(struct snd_sof_dev *sdev)
 
 static int acp_reset(struct snd_sof_dev *sdev)
 {
+	const struct sof_amd_acp_desc *desc = get_chip_info(sdev->pdata);
 	unsigned int val;
 	int ret;
 
@@ -410,6 +411,7 @@ static int acp_reset(struct snd_sof_dev *sdev)
 	if (ret < 0)
 		dev_err(sdev->dev, "timeout in releasing reset\n");
 
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_clkmux_sel, ACP_CLOCK_ACLK);
 	return ret;
 }
 
@@ -456,7 +458,7 @@ int amd_sof_acp_resume(struct snd_sof_dev *sdev)
 		return ret;
 	}
 
-	snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_clkmux_sel, 0x03);
+	snd_sof_dsp_write(sdev, ACP_DSP_BAR, desc->acp_clkmux_sel, ACP_CLOCK_ACLK);
 
 	ret = acp_memory_init(sdev);
 
diff --git a/sound/soc/sof/amd/acp.h b/sound/soc/sof/amd/acp.h
index 1529c6d9bf9b..76ad963faec1 100644
--- a/sound/soc/sof/amd/acp.h
+++ b/sound/soc/sof/amd/acp.h
@@ -69,6 +69,14 @@
 #define BOX_SIZE_512				0x200
 #define BOX_SIZE_1024				0x400
 
+enum clock_source {
+	ACP_CLOCK_96M = 0,
+	ACP_CLOCK_48M,
+	ACP_CLOCK_24M,
+	ACP_CLOCK_ACLK,
+	ACP_CLOCK_MCLK,
+};
+
 struct  acp_atu_grp_pte {
 	u32 low;
 	u32 high;
-- 
2.25.1

