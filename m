Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 047D33CBCF1
	for <lists+alsa-devel@lfdr.de>; Fri, 16 Jul 2021 21:46:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F08D16E2;
	Fri, 16 Jul 2021 21:46:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F08D16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626464812;
	bh=GtIvEq5EMQPvKcbov5M1xrLnZahrXLOu6IwTZa0lqE0=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kIYaSvqWOII092v3Vowx1neIbU6H4LGhiDZmXXQLxo83rLHmO+NUQcHhwDWk7HILu
	 C+IGgqOWvkiPcSGhy2ZtVHuxHICpOpPUYj/0ugdezEaO7lG4XMb6/masqxC3+SYsO4
	 XKwZJXjVmH3vOMM/AJKGL5mHXVbgP4csmWM2hxMI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D7D8F80508;
	Fri, 16 Jul 2021 21:44:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C5E1AF804E3; Fri, 16 Jul 2021 21:44:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DATE_IN_FUTURE_06_12,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2054.outbound.protection.outlook.com [40.107.101.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9597DF80506
 for <alsa-devel@alsa-project.org>; Fri, 16 Jul 2021 21:43:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9597DF80506
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="PgtOM2o0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrElseCOgxBPYppTMQacIQ0kFFK5rUajosstDoxCaf/mZtdYSF4rtq3UYmkGKvEAI8hhEpZffNOtKVCW8poAbQBSm0OfVOWxNR4oEuswOeH0d7mvhS1jXzCKNuhVkf2H33WgRP0fFUdvvRaLWTVgkWnp2SmGW1W/o1eT790Va48XbYXGLP7vX9iuIKlJXcS4oAi1MsN3K2wsZC7ZvmT9ulP62Rk5abJxj1qS9oJDauiQ/mMZ2Z9EfRVoul9WIZqpLJS8HpnHxVt45qoiRVkHS6N+jOEObyskmp1hwVkrsP+vIH0Dj1RNP8CjNSyab2NnHjFGrrbHh308w94t86pCmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u60Sow3JxJYLWH31WLTmeQ2FlQ8sbYYBoDReu0+LWTk=;
 b=Xhhuvg3OXi/0NmiX/UujrNyGx4GKwqAHbIuvzEio8gjpg5u8Y9LiwCduQlpH6HaGmcddUbct6LeR242vA8l2yFTkv6S2O3iG9TX5xR/KAV6KOmmv5bJyIYqmURoBBkdnju1jvPl9OrgkDBa8IeOc5MFYi08N7J49Vza7jVpwh3J1RIw/4oUEfD/F5lYD5k99Cgyfxy6Tm9F/Re6jraU9P/cck11X0VnZJcZ5OQb2UCQ3Vl00fm5KFUXqHhbemM5ZM0Ktm5a0+nt3ewd1en4aZMjMRY5AZXfxONqDBcdw8BvmtCRwT7IITGMIr39gS/bcL2z8Tp5rBs9Za+iRSE8Pnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u60Sow3JxJYLWH31WLTmeQ2FlQ8sbYYBoDReu0+LWTk=;
 b=PgtOM2o0WvM3JsQnG5BC2AsN4ge0K5xyE9G5fmsyWHal1L69pq1Sy9a+nf8uDFrwMF8flgsYbh7P5WIPsf01Ma+lLfGNY5s9geAqI6V/PEYW7RD6f/i5wX6AWpD1Vnr5M+VZEBGW3zRH0PjQ3f72jNR4R9n9OEojfulNkS1MhlY=
Received: from MWHPR17CA0075.namprd17.prod.outlook.com (2603:10b6:300:c2::13)
 by BN6PR12MB1331.namprd12.prod.outlook.com (2603:10b6:404:17::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Fri, 16 Jul
 2021 19:43:51 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:c2:cafe::a) by MWHPR17CA0075.outlook.office365.com
 (2603:10b6:300:c2::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Fri, 16 Jul 2021 19:43:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Fri, 16 Jul 2021 19:43:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 16 Jul
 2021 14:43:49 -0500
Received: from vijendar-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4
 via Frontend Transport; Fri, 16 Jul 2021 14:43:41 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH RESEND V2 09/12] ASoC: amd: add vangogh i2s dai driver ops
Date: Sat, 17 Jul 2021 09:30:56 +0530
Message-ID: <20210717040059.310410-10-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
References: <20210717040059.310410-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 23a8f3b4-e2b2-47ea-ccf1-08d948920954
X-MS-TrafficTypeDiagnostic: BN6PR12MB1331:
X-Microsoft-Antispam-PRVS: <BN6PR12MB133141D162195E39283A886F97119@BN6PR12MB1331.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:462;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m7bJDVl/L6aLRuDAVFB5RCpQVzUBNikWYixpv12+dZZxZCAK/MLfspIncbNOag0Q/n6SzLVdubXwvJGZ/NXahfkL/UONvV6SUezkojm+uVtZEE9xoTqKygM6gSS2J//kJiyU1y9BmM+01VQ53IZ/kiUkb9OM7REguTTb4AeKJz5G1iAAUTzaMD9yGn1Xd3OOVJhE3IIzIBn55OjPzGAvi5Xsaby6YXfFKGhYppYDWn7vatcB4eTz2BtMefWFO8VKsasULWX0CCsG5ik/+5XR+sNzc85orBPYdNszqRk5z6xnhI7L50N8CwXpFeRLzETYs5+PCvVduOLjk3wJoCR+RiYVLMZcQiUV6oMAsM8z5P3WBwxmBHUD0Z70Jz2oCUns170VNjHkXUtQkkfLy5PrtxvxfUrv1phFQFp9rypW8DcE5YjgHbpCxkfQspOSYIeGNLcPuDaLkHm/OD1mMWkhNYLzkS58hWHy7oxJb2NgUpzvYSLWf2PjWx0ILkxQv1KOPj3CoHa8Mln1eDUGp3TeoSxPkWxhzxZ+g6QIznEvep1Ni+pMEzWci75FJ0CszftDaAc3PFE1wuZmLnSuCCAiYhs0QWzcP8/7oNkvdtrMia4T5Ja6WMJYSgH7qmmfMIq7UQEf9q+iT72+cf5KNkS8zk9IVW8Itvl1rSjgNVPa7JypmnWWxkLcwsM/FamiB7smnIyISx/qVEj+r9fEMEosU4brZ5kiWRtiZ7lvhc19FYA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(39860400002)(36840700001)(46966006)(26005)(54906003)(186003)(7696005)(6666004)(316002)(5660300002)(110136005)(2906002)(70586007)(83380400001)(82740400003)(82310400003)(36860700001)(70206006)(356005)(47076005)(81166007)(86362001)(36756003)(478600001)(2616005)(4326008)(426003)(30864003)(336012)(1076003)(8936002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2021 19:43:50.6974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23a8f3b4-e2b2-47ea-ccf1-08d948920954
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1331
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Vijendar Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 krisman@collabora.com
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

From: Vijendar Mukunda <vijendar.mukunda@amd.com>

Add Vangogh i2s dai driver ops.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
v1 ->v2: use SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK
---
 sound/soc/amd/vangogh/acp5x-i2s.c | 339 ++++++++++++++++++++++++++++++
 sound/soc/amd/vangogh/acp5x.h     |  22 ++
 2 files changed, 361 insertions(+)

diff --git a/sound/soc/amd/vangogh/acp5x-i2s.c b/sound/soc/amd/vangogh/acp5x-i2s.c
index 93fd0372df29..313761df9053 100644
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
index fbd5cdf44cb8..a798f89416af 100644
--- a/sound/soc/amd/vangogh/acp5x.h
+++ b/sound/soc/amd/vangogh/acp5x.h
@@ -73,9 +73,20 @@
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
@@ -108,6 +119,17 @@ struct acp5x_platform_info {
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
  * offset which requires substraction logic from base_addr
  * for accessing ACP5x MMIO space registers
-- 
2.25.1

