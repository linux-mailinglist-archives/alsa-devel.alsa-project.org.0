Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3935D3CFF3C
	for <lists+alsa-devel@lfdr.de>; Tue, 20 Jul 2021 18:24:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C41D167A;
	Tue, 20 Jul 2021 18:24:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C41D167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626798293;
	bh=T1BxCRUPDy3omBWw57CiZJeGRNL3RsxLNdgs5T8UFQM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Cx3SEhZwPF2XWkqU9NV6S6jlhmpOcWJjGbACvcbF0cBVbvpSYneoFEwTAmnaJp1KS
	 Yv4vbE2ZoUCbU+anU+dDtrflcqCMpnPAT2DhTUeOIKGxGDJqePnektzRvxpZj9i864
	 FlDRY9u2CvE+4KOcZUke8+z+1yYMbTfaPCMU6MJs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9D178F804FF;
	Tue, 20 Jul 2021 18:21:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E730DF8032B; Tue, 20 Jul 2021 18:21:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECF4AF804FF
 for <alsa-devel@alsa-project.org>; Tue, 20 Jul 2021 18:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECF4AF804FF
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="ESzjIW3u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kEYQDgzQklcGzhsQbtIDrN6WGB/rcFT3sOHIjLZEaORqB6YI38GOW3n/YHPGLFvQKILep0bFpDN4p2VMG1xuBYw6VsCpEvo8/+WxrAweUQSUGOhiRHEnN+Vh/m4yoGiK3ndUSFPcH/Kf8WnrfTIoPusKyYeCeiWSwcBMWHCE3GEFtMlTndF7dlVHqU1MTzl4mrvnS5zsy1pC9cpmcqCVjFpBo28RYpARnNN2ilkLPLS8xhlxfZVfZ7PLS6rx/qGrRn2tZb+7Eptpaxal9jMru0NXHNMbg/39C+82dHUXgoH/BR+bO27O3DI4feISXsLwGc5tL7ffU3lF7iiebXErIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VtRxQ02Fx0FKh9CKf1k366gg2aWtjMuWfxEYgCznEk=;
 b=UJCHCGLcUAXZ+jutkZEOdPgzrSD5qjmKi3bMaTU1IEdZ99tREQ1AJ0gBj5WLwOA6Yonz8Zlzp0EvfqFHjmy63cK91Z3dDsJ77eefIQBI7WmUJYTpKxcYrTenRKieZgdSNPp2pf++CosZHzaGpvBOQ8farNcpwEX+CVYbFNR12sqgZu2U8Maob2A9Dkqg6M7AYR30VhZtHKSIy5NhVylu4kRZm958nV/f7dei3w51v4Z2GPBDPNIj/QSFVdaA6Y1MFBCJF9GW70CCV6clLYXHJbCuRGGIL/d7+Hw9jHR5ZZfu/Q8G5OuvHiY0IiFsmfghP/EKKZ9z9biC5QetY/FSDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8VtRxQ02Fx0FKh9CKf1k366gg2aWtjMuWfxEYgCznEk=;
 b=ESzjIW3urduYMqQKPUvrj25imuFGKTBgHUBivqTGnuC6B+Heag0CsLUHelM6pdIMR0gaDd0RjmSpLwY75Lqa6oZmIeKVI+tob1e4L3g3qDOx/jxSWzRyaEX+hauIf8YGlUZn/oiRVYGGiZPTfAS1y9QT8v50yDNst5LUz+3OvH0=
Received: from MWHPR13CA0041.namprd13.prod.outlook.com (2603:10b6:300:95::27)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.24; Tue, 20 Jul
 2021 16:21:38 +0000
Received: from CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:95:cafe::5b) by MWHPR13CA0041.outlook.office365.com
 (2603:10b6:300:95::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.10 via Frontend
 Transport; Tue, 20 Jul 2021 16:21:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT019.mail.protection.outlook.com (10.13.175.57) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Tue, 20 Jul 2021 16:21:38 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:21:37 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Tue, 20 Jul
 2021 11:21:36 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Tue, 20 Jul 2021 11:21:33 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH v4 09/12] ASoC: amd: add vangogh i2s dai driver ops
Date: Tue, 20 Jul 2021 22:07:29 +0530
Message-ID: <20210720163732.23003-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
References: <20210720163732.23003-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88d9b4da-b7d4-4f9b-765b-08d94b9a736d
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-Microsoft-Antispam-PRVS: <MN2PR12MB4142B823B9DBC3AEB34B6CAA97E29@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7gkNh5bDy/eFO7D9UzDt3xB1UQhv19WEB0WrrxHituBRv3zb5ByG3Qdl7U/WcVT8rW+6iI8TG9LXqS1DkWf4I5gqnQQJjc0cLeoDtY3hlrwl8gw9GNHXiQ1q5JBJ0BGayoFUzApWP2B6qDA1RlVPteAAI0odlofW/KPlYIOU0k4N+QqJsVGDxqku9LJgvMUOYyzjZC7OjQ8nz95PdILVSxWcTTAiwYpdSVwgTLcbK4OTwV4T36nfb8xcBzoGfcbyWh4tBlrrpn3dGYPQvFQYJtbj503uLXY1XgyFtgvtY6+0A5pNfW+zcjGPRJ7mBA4ycuWjMIZuKhqplo0Dhia9jfpVNUUEx4tzrZSB7xAX3Lx12BQfvvPNa+1yD93psR0SMzNOK/8uKAI9cnjR4JG2xFsDofGm75wO7q0d26Qhe5OTtwEfo7EoQjb/rQnN+Irk1cgHRNpP5u46PwxXIBfl8+A3jqNJP7wI9LaxB+CTPGx0/PnvP9jRxj1EIc7qND0Ssx5EhZRi4+cqG0MXXF8kbGH5jowUZxf2kEPmQ26+Zj3Z+D/xLPSTuAiTJ3ho1jPGZLDyHp7t9tUzHT5qftHfnHdx/YbCkZPPy4FQOfIgrn3FTvnLakBgXR6euZbEMR7vEjCSexPy1/oIE+tCY6bpxmxtZDGN6Z1WMRpALDFFwHfn9lMhY0/S56avheD0C+4AtV+tRPIU/C7xVdVMnY8XsfrV5QsR9TkZHz8hITFIF/k=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(186003)(1076003)(110136005)(54906003)(2616005)(82740400003)(478600001)(2906002)(36756003)(316002)(83380400001)(426003)(47076005)(336012)(81166007)(356005)(70586007)(5660300002)(8676002)(82310400003)(8936002)(6666004)(70206006)(4326008)(7696005)(36860700001)(86362001)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 16:21:38.1547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d9b4da-b7d4-4f9b-765b-08d94b9a736d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam
 Girdwood <lgirdwood@gmail.com>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, krisman@collabora.com
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

Add Vangogh i2s dai driver ops.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/vangogh/acp5x-i2s.c | 339 ++++++++++++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h     |  22 ++
 2 files changed, 361 insertions(+)

diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index 30b651035042..86b37c93c3d2 100644
--- a/sound/soc/amd/vangogh/acp5x-i2s.c
+++ b/sound/soc/amd/vangogh/acp5x-i2s.c
@@ -17,6 +17,344 @@
 
 #define DRV_NAME "acp5x_i2s_playcap"
 
+static int acp5x_i2s_set_fmt(struct snd_soc_dai *cpu_dai,
+			     unsigned int fmt)
+{
+	struct i2s_dev_data *adata;
+	int mode;
+
+	adata = snd_soc_dai_get_drvdata(cpu_dai);
+	mode = fmt & SND_SOC_DAIFMT_FORMAT_MASK;
+	switch (mode) {
+	case SND_SOC_DAIFMT_I2S:
+		adata->tdm_mode = TDM_DISABLE;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		adata->tdm_mode = TDM_ENABLE;
+		break;
+	default:
+		return -EINVAL;
+	}
+	mode = fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK;
+	switch (mode) {
+	case SND_SOC_DAIFMT_CBC_CFC:
+		adata->master_mode = I2S_MASTER_MODE_ENABLE;
+		break;
+	case SND_SOC_DAIFMT_CBP_CFP:
+		adata->master_mode = I2S_MASTER_MODE_DISABLE;
+		break;
+	}
+	return 0;
+}
+
+static int acp5x_i2s_set_tdm_slot(struct snd_soc_dai *cpu_dai,
+				  u32 tx_mask, u32 rx_mask,
+				  int slots, int slot_width)
+{
+	struct i2s_dev_data *adata;
+	u32 frm_len;
+	u16 slot_len;
+
+	adata = snd_soc_dai_get_drvdata(cpu_dai);
+
+	/* These values are as per Hardware Spec */
+	switch (slot_width) {
+	case SLOT_WIDTH_8:
+		slot_len = 8;
+		break;
+	case SLOT_WIDTH_16:
+		slot_len = 16;
+		break;
+	case SLOT_WIDTH_24:
+		slot_len = 24;
+		break;
+	case SLOT_WIDTH_32:
+		slot_len = 0;
+		break;
+	default:
+		return -EINVAL;
+	}
+	frm_len = FRM_LEN | (slots << 15) | (slot_len << 18);
+	adata->tdm_fmt = frm_len;
+	return 0;
+}
+
+static int acp5x_i2s_hwparams(struct snd_pcm_substream *substream,
+			      struct snd_pcm_hw_params *params,
+			      struct snd_soc_dai *dai)
+{
+	struct i2s_stream_instance *rtd;
+	struct snd_soc_pcm_runtime *prtd;
+	struct snd_soc_card *card;
+	struct acp5x_platform_info *pinfo;
+	struct i2s_dev_data *adata;
+	union acp_i2stdm_mstrclkgen mclkgen;
+
+	u32 val;
+	u32 reg_val, frmt_reg, master_reg;
+	u32 lrclk_div_val, bclk_div_val;
+
+	lrclk_div_val = 0;
+	bclk_div_val = 0;
+	prtd = asoc_substream_to_rtd(substream);
+	rtd = substream->runtime->private_data;
+	card = prtd->card;
+	adata = snd_soc_dai_get_drvdata(dai);
+	pinfo = snd_soc_card_get_drvdata(card);
+	if (pinfo) {
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
+			rtd->i2s_instance = pinfo->play_i2s_instance;
+		else
+			rtd->i2s_instance = pinfo->cap_i2s_instance;
+	}
+
+	/* These values are as per Hardware Spec */
+	switch (params_format(params)) {
+	case SNDRV_PCM_FORMAT_U8:
+	case SNDRV_PCM_FORMAT_S8:
+		rtd->xfer_resolution = 0x0;
+		break;
+	case SNDRV_PCM_FORMAT_S16_LE:
+		rtd->xfer_resolution = 0x02;
+		break;
+	case SNDRV_PCM_FORMAT_S24_LE:
+		rtd->xfer_resolution = 0x04;
+		break;
+	case SNDRV_PCM_FORMAT_S32_LE:
+		rtd->xfer_resolution = 0x05;
+		break;
+	default:
+		return -EINVAL;
+	}
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		switch (rtd->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			reg_val = ACP_HSTDM_ITER;
+			frmt_reg = ACP_HSTDM_TXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = ACP_I2STDM_ITER;
+			frmt_reg = ACP_I2STDM_TXFRMT;
+		}
+	} else {
+		switch (rtd->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			reg_val = ACP_HSTDM_IRER;
+			frmt_reg = ACP_HSTDM_RXFRMT;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			reg_val = ACP_I2STDM_IRER;
+			frmt_reg = ACP_I2STDM_RXFRMT;
+		}
+	}
+	if (adata->tdm_mode) {
+		val = acp_readl(rtd->acp5x_base + reg_val);
+		acp_writel(val | 0x2, rtd->acp5x_base + reg_val);
+		acp_writel(adata->tdm_fmt, rtd->acp5x_base + frmt_reg);
+	}
+	val = acp_readl(rtd->acp5x_base + reg_val);
+	val &= ~ACP5x_ITER_IRER_SAMP_LEN_MASK;
+	val = val | (rtd->xfer_resolution  << 3);
+	acp_writel(val, rtd->acp5x_base + reg_val);
+
+	if (adata->master_mode) {
+		switch (rtd->i2s_instance) {
+		case I2S_HS_INSTANCE:
+			master_reg = ACP_I2STDM2_MSTRCLKGEN;
+			break;
+		case I2S_SP_INSTANCE:
+		default:
+			master_reg = ACP_I2STDM0_MSTRCLKGEN;
+			break;
+		}
+		mclkgen.bits.i2stdm_master_mode = 0x1;
+		if (adata->tdm_mode)
+			mclkgen.bits.i2stdm_format_mode = 0x01;
+		else
+			mclkgen.bits.i2stdm_format_mode = 0x0;
+		switch (params_format(params)) {
+		case SNDRV_PCM_FORMAT_S16_LE:
+			switch (params_rate(params)) {
+			case 8000:
+				bclk_div_val = 768;
+				break;
+			case 16000:
+				bclk_div_val = 384;
+				break;
+			case 24000:
+				bclk_div_val = 256;
+				break;
+			case 32000:
+				bclk_div_val = 192;
+				break;
+			case 44100:
+			case 48000:
+				bclk_div_val = 128;
+				break;
+			case 88200:
+			case 96000:
+				bclk_div_val = 64;
+				break;
+			case 192000:
+				bclk_div_val = 32;
+				break;
+			default:
+				return -EINVAL;
+			}
+			lrclk_div_val = 32;
+			break;
+		case SNDRV_PCM_FORMAT_S32_LE:
+			switch (params_rate(params)) {
+			case 8000:
+				bclk_div_val = 384;
+				break;
+			case 16000:
+				bclk_div_val = 192;
+				break;
+			case 24000:
+				bclk_div_val = 128;
+				break;
+			case 32000:
+				bclk_div_val = 96;
+				break;
+			case 44100:
+			case 48000:
+				bclk_div_val = 64;
+				break;
+			case 88200:
+			case 96000:
+				bclk_div_val = 32;
+				break;
+			case 192000:
+				bclk_div_val = 16;
+				break;
+			default:
+				return -EINVAL;
+			}
+			lrclk_div_val = 64;
+			break;
+		default:
+			return -EINVAL;
+		}
+		mclkgen.bits.i2stdm_bclk_div_val = bclk_div_val;
+		mclkgen.bits.i2stdm_lrclk_div_val = lrclk_div_val;
+		acp_writel(mclkgen.u32_all, rtd->acp5x_base + master_reg);
+	}
+	return 0;
+}
+
+static int acp5x_i2s_trigger(struct snd_pcm_substream *substream,
+			     int cmd, struct snd_soc_dai *dai)
+{
+	struct i2s_stream_instance *rtd;
+	u32 ret, val, period_bytes, reg_val, ier_val, water_val;
+	u32 buf_size, buf_reg;
+
+	rtd = substream->runtime->private_data;
+	period_bytes = frames_to_bytes(substream->runtime,
+				       substream->runtime->period_size);
+	buf_size = frames_to_bytes(substream->runtime,
+				   substream->runtime->buffer_size);
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+	case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
+		rtd->bytescount = acp_get_byte_count(rtd,
+						     substream->stream);
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			switch (rtd->i2s_instance) {
+			case I2S_HS_INSTANCE:
+				water_val =
+					ACP_HS_TX_INTR_WATERMARK_SIZE;
+				reg_val = ACP_HSTDM_ITER;
+				ier_val = ACP_HSTDM_IER;
+				buf_reg = ACP_HS_TX_RINGBUFSIZE;
+				break;
+			case I2S_SP_INSTANCE:
+			default:
+				water_val =
+					ACP_I2S_TX_INTR_WATERMARK_SIZE;
+				reg_val = ACP_I2STDM_ITER;
+				ier_val = ACP_I2STDM_IER;
+				buf_reg = ACP_I2S_TX_RINGBUFSIZE;
+			}
+		} else {
+			switch (rtd->i2s_instance) {
+			case I2S_HS_INSTANCE:
+				water_val =
+					ACP_HS_RX_INTR_WATERMARK_SIZE;
+				reg_val = ACP_HSTDM_IRER;
+				ier_val = ACP_HSTDM_IER;
+				buf_reg = ACP_HS_RX_RINGBUFSIZE;
+				break;
+			case I2S_SP_INSTANCE:
+			default:
+				water_val =
+					ACP_I2S_RX_INTR_WATERMARK_SIZE;
+				reg_val = ACP_I2STDM_IRER;
+				ier_val = ACP_I2STDM_IER;
+				buf_reg = ACP_I2S_RX_RINGBUFSIZE;
+			}
+		}
+		acp_writel(period_bytes, rtd->acp5x_base + water_val);
+		acp_writel(buf_size, rtd->acp5x_base + buf_reg);
+		val = acp_readl(rtd->acp5x_base + reg_val);
+		val = val | BIT(0);
+		acp_writel(val, rtd->acp5x_base + reg_val);
+		acp_writel(1, rtd->acp5x_base + ier_val);
+		ret = 0;
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
+		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+			switch (rtd->i2s_instance) {
+			case I2S_HS_INSTANCE:
+				reg_val = ACP_HSTDM_ITER;
+				break;
+			case I2S_SP_INSTANCE:
+			default:
+				reg_val = ACP_I2STDM_ITER;
+			}
+
+		} else {
+			switch (rtd->i2s_instance) {
+			case I2S_HS_INSTANCE:
+				reg_val = ACP_HSTDM_IRER;
+				break;
+			case I2S_SP_INSTANCE:
+			default:
+				reg_val = ACP_I2STDM_IRER;
+			}
+		}
+		val = acp_readl(rtd->acp5x_base + reg_val);
+		val = val & ~BIT(0);
+		acp_writel(val, rtd->acp5x_base + reg_val);
+
+		if (!(acp_readl(rtd->acp5x_base + ACP_HSTDM_ITER) & BIT(0)) &&
+		    !(acp_readl(rtd->acp5x_base + ACP_HSTDM_IRER) & BIT(0)))
+			acp_writel(0, rtd->acp5x_base + ACP_HSTDM_IER);
+		if (!(acp_readl(rtd->acp5x_base + ACP_I2STDM_ITER) & BIT(0)) &&
+		    !(acp_readl(rtd->acp5x_base + ACP_I2STDM_IRER) & BIT(0)))
+			acp_writel(0, rtd->acp5x_base + ACP_I2STDM_IER);
+		ret = 0;
+		break;
+	default:
+		ret = -EINVAL;
+		break;
+	}
+	return ret;
+}
+
+static struct snd_soc_dai_ops acp5x_i2s_dai_ops = {
+	.hw_params = acp5x_i2s_hwparams,
+	.trigger = acp5x_i2s_trigger,
+	.set_fmt = acp5x_i2s_set_fmt,
+	.set_tdm_slot = acp5x_i2s_set_tdm_slot,
+};
+
 static const struct snd_soc_component_driver acp5x_dai_component = {
 	.name = "acp5x-i2s",
 };
@@ -40,6 +378,7 @@ static struct snd_soc_dai_driver acp5x_i2s_dai = {
 		.rate_min = 8000,
 		.rate_max = 96000,
 	},
+	.ops = &acp5x_i2s_dai_ops,
 };
 
 static int acp5x_dai_probe(struct platform_device *pdev)
diff --git a/sound/soc/amd/vangogh/acp5x.h b/sound/soc/amd/vangogh/acp5x.h
index 2300e63534e7..c94ed8795b9c 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -74,9 +74,20 @@
 #define I2S_MASTER_MODE_ENABLE 0x01
 #define I2S_MASTER_MODE_DISABLE 0x00
 
+#define SLOT_WIDTH_8 0x08
+#define SLOT_WIDTH_16 0x10
+#define SLOT_WIDTH_24 0x18
+#define SLOT_WIDTH_32 0x20
+#define TDM_ENABLE 1
+#define TDM_DISABLE 0
+#define ACP5x_ITER_IRER_SAMP_LEN_MASK	0x38
+
 struct i2s_dev_data {
+	bool tdm_mode;
 	bool master_mode;
 	unsigned int i2s_irq;
+	u16 i2s_instance;
+	u32 tdm_fmt;
 	void __iomem *acp5x_base;
 	struct snd_pcm_substream *play_stream;
 	struct snd_pcm_substream *capture_stream;
@@ -109,6 +120,17 @@ struct acp5x_platform_info {
 	u16 cap_i2s_instance;
 };
 
+union acp_i2stdm_mstrclkgen {
+	struct {
+		u32 i2stdm_master_mode : 1;
+		u32 i2stdm_format_mode : 1;
+		u32 i2stdm_lrclk_div_val : 9;
+		u32 i2stdm_bclk_div_val : 11;
+		u32:10;
+	} bitfields, bits;
+	u32  u32_all;
+};
+
 /* common header file uses exact offset rather than relative
  * offset which requires subtraction logic from base_addr
  * for accessing ACP5x MMIO space registers
-- 
2.17.1

