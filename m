Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 310ED3696A4
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Apr 2021 18:09:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B48B416A8;
	Fri, 23 Apr 2021 18:08:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B48B416A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619194145;
	bh=ZKOYaYxQ6MSSCIPo/uwqOT0SnDvlVjT971MZ38jsvew=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rYDxc810jcRih3IcqEvGBISazmJI0Idb78x6ReFuAI3Q/PNUErkLAaljLYwjEobSa
	 FK8cR+VSxrrjGYprxoj2ttGfq7xHDroHbV/0CnZ9+xe0Cc4plniBWNcdYo03fkwARs
	 xZxHnwza4gz2WRn80jnc/faBx63+j/SZRxUKHjgw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 18555F8019B;
	Fri, 23 Apr 2021 18:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72DDDF80227; Fri, 23 Apr 2021 18:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0681BF800E3
 for <alsa-devel@alsa-project.org>; Fri, 23 Apr 2021 18:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0681BF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com
 header.b="lh6sp0AD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAinTsOADH97i8ogZJfoG7FkEMebf8EluYoATY1ixujvDPOU8XLuDoHMXklfSgaU5HYxRLHDaDSS6IRKMPczhVOb9XK3OZbIUdsTN8CSH1vKXqehDs1L4PwT/rAVhTtooucNATNmtdoJF6WT6q+PwBiLclFws1wGBZ10EkBN+3/LnaJidBfAFG0Uf+TLMkyU0O7NzyiKNScavhhqQEcQuahR2Bgmi6NMd4ZaJPUWUVZ6Ys22raRYN4nYyKfIrVw5EXf1yZj+U/3eNo2XmMebjva2wmHY0/i0h5EFHhl4SfxZL7Kdva6WM0LvSzHJ/j2vChHe95yRg6QL9cQzoo4zMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFTcr2aiTLgrRRHdw3Z+UomMzShRUS+6TzGJ1RQauJc=;
 b=kiv7cKlzXyTl/Od4FpjbrUOJq1ZGtl2TfvbbPShPIQHqRf3NvDozyPRPicBZv7Wwt4PIIvnFTcmw68ZaajaDFqhk8euDDFM6eDGjjskIX6jTwRbMvgJ23X7vCnyoNzazlKGP3cvzMulW3+yK1S6RThSAeq9fK9rSDs+VTQv13ZMgvohNxjwnA0W+qTz+IJJvKWNCysq5jwjIbPc5cEXA6bGKYTH00U1R3Ee4tSn6/rqrYiY7OvpZCrxBpH71DFd7SECH5a9aITuSd3/yLULqGjk4F91EA60yWuWzQZGKlHbB3MrpSRl8VIGfoBc2XfN8tdtAy4ieTydo8VpYBhZZEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=amd.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFTcr2aiTLgrRRHdw3Z+UomMzShRUS+6TzGJ1RQauJc=;
 b=lh6sp0ADi9W01EwpiBZhhG/y7kS13vue/1q94XrUvq+Rn64gqWmwmEhFRf/k7woua8dHy3vyT/qQUB/X4EKKcyP8KI7wJ4D+XdT/kXRIBHHEHQa6vzisyRcAKYnHVPmuAFJtMxM4Uj/X2PHAMFbSkjQPUPOpu95RndkOBfARNzA=
Received: from BN0PR04CA0089.namprd04.prod.outlook.com (2603:10b6:408:ea::34)
 by BL0PR12MB4675.namprd12.prod.outlook.com (2603:10b6:207:35::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Fri, 23 Apr
 2021 16:07:24 +0000
Received: from BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ea:cafe::b) by BN0PR04CA0089.outlook.office365.com
 (2603:10b6:408:ea::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.20 via Frontend
 Transport; Fri, 23 Apr 2021 16:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT025.mail.protection.outlook.com (10.13.177.136) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4065.21 via Frontend Transport; Fri, 23 Apr 2021 16:07:24 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 23 Apr
 2021 11:07:23 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 23 Apr
 2021 11:07:23 -0500
Received: from LinuxHost.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 23 Apr 2021 11:07:19 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>
Subject: [PATCH 1/2] ASoC: dwc: add a quirk DW_I2S_QUIRK_STOP_ON_SHUTDOWN to
 dwc driver
Date: Fri, 23 Apr 2021 21:54:38 +0530
Message-ID: <1619195089-29710-1-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 407aa401-a8f1-4c2c-8b2c-08d90671e1ec
X-MS-TrafficTypeDiagnostic: BL0PR12MB4675:
X-Microsoft-Antispam-PRVS: <BL0PR12MB4675C059F9E23EEF2600512C97459@BL0PR12MB4675.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:901;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mge8opFeGfCZQfg6em36yl3g5BZM5shKnf3EFOtpq5gQll9fPIlvb9qCurWzFrNhW/iVrKqZLNv6FM6R4P5q2osxqqB9XUzf0ZP5yo+jwK+41MCqcazWlP1uce0LlUVfN5vgjfNKVKsTHdvnHYZfQG737/tdZ1NKeasDcoHu44aDtlc3yM9x5lWIiafGUyOE3ySW7WQl7gu3KsdwDLsZS3yLj/nD4BbkBZKO6z1IezCQJstfvvPHcMNBCEcbcGSkVRE3pG4bjVBYEJsMOCZvhX9ewJRXvIl+Wkp36cEeg26zXJZJ0FznxQx5isByaDawXBrBFVQZZ49UCcVqFOkj7gKPuk2m46uJu/J0toBFFL6dI5/04XECqb67dknFyuBOHHJi//Y/eyhYD1r4cF1rIn686RbMyZDV8siceUPG+Y2ICbGsSWAby5eIVcOBYk639b2WCBZbQD5jc3tKFATZvUUOpWjw4V42RXKUMazliGElo6iNjdaiKJJwwyIqfbjfZ3XuRJGyj61qHQgeaRkAsmfHuQxGDq4fSVySp9fL56v7NQPuLGyu1FUg79UhD1KI+ZsdUywo1hcmDg++l2o3Y1EULwweFSHQxJ8H7KayCwkMntyQ1dnwZMm+RW3KiTh+FOwp53tGzu6UI2X9UFwRbg+DhgZoX0LKNjv3VE1mscNkKSbFDrcM0j6L9SDka4mipJwvMg9vSr0ud61X/6lmZFkuoKQgPtCxAZURd7gk4YA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(36840700001)(46966006)(82740400003)(7416002)(86362001)(2906002)(478600001)(7696005)(4326008)(8936002)(8676002)(336012)(82310400003)(6666004)(2616005)(426003)(26005)(186003)(36756003)(356005)(36860700001)(54906003)(316002)(81166007)(110136005)(47076005)(70586007)(70206006)(83380400001)(5660300002)(70780200001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 16:07:24.0652 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 407aa401-a8f1-4c2c-8b2c-08d90671e1ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4675
Cc: Sunil-kumar.Dommati@amd.com, amistry@google.com,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>, Ranjani
 Sridharan <ranjani.sridharan@linux.intel.com>, Vijendar
 Mukunda <Vijendar.Mukunda@amd.com>, Alexander.Deucher@amd.com,
 nartemiev@google.com
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

For CZ/StoneyRidge platforms, ACP DMA between ACP SRAM and
I2S FIFO should be stopped before stopping I2S Controller DMA.

When DMA is progressing and stop request received, while DMA transfer
ongoing between ACP SRAM and I2S FIFO, Stopping I2S DMA prior to ACP DMA
stop resulting DMA Channel stop failure.

This issue can't be fixed in ACP DMA driver due to design constraint.

Add a quirk DW_I2S_QUIRK_STOP_ON_SHUTDOWN in dwc driver to fix DMA stop
failure by invoking i2s_stop() sequence in shutdown() callback.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 include/sound/designware_i2s.h | 1 +
 sound/soc/dwc/dwc-i2s.c        | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/sound/designware_i2s.h b/include/sound/designware_i2s.h
index 80d275b..a700d20 100644
--- a/include/sound/designware_i2s.h
+++ b/include/sound/designware_i2s.h
@@ -34,6 +34,7 @@ struct i2s_platform_data {
 	#define DW_I2S_QUIRK_COMP_REG_OFFSET	(1 << 0)
 	#define DW_I2S_QUIRK_COMP_PARAM1	(1 << 1)
 	#define DW_I2S_QUIRK_16BIT_IDX_OVERRIDE (1 << 2)
+	#define DW_I2S_QUIRK_STOP_ON_SHUTDOWN   (1 << 3)
 	unsigned int quirks;
 	unsigned int i2s_reg_comp1;
 	unsigned int i2s_reg_comp2;
diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index fd41602..f3a681f 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -308,6 +308,10 @@ static int dw_i2s_hw_params(struct snd_pcm_substream *substream,
 static void dw_i2s_shutdown(struct snd_pcm_substream *substream,
 		struct snd_soc_dai *dai)
 {
+	struct dw_i2s_dev *dev = snd_soc_dai_get_drvdata(dai);
+
+	if (dev->quirks & DW_I2S_QUIRK_STOP_ON_SHUTDOWN)
+		i2s_stop(dev, substream);
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
@@ -342,7 +346,8 @@ static int dw_i2s_trigger(struct snd_pcm_substream *substream,
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
 		dev->active--;
-		i2s_stop(dev, substream);
+		if (!(dev->quirks & DW_I2S_QUIRK_STOP_ON_SHUTDOWN))
+			i2s_stop(dev, substream);
 		break;
 	default:
 		ret = -EINVAL;
-- 
2.7.4

