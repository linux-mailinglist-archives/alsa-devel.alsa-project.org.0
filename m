Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E08497A53F
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Jul 2019 11:54:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74E06184C;
	Tue, 30 Jul 2019 11:53:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74E06184C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564480480;
	bh=xRlNmgsdA+5cS0NtCm0MbGEKj9cNmUuBCA1+RCaQ704=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=f50A8QofxV6eq0lzOwKNGGiR1lEo0hKJ8Qml3gH7tYND9DzQI6qjJV4R8EoZ5RnfK
	 el2nE1YB2fPJOIIG9U0mMFNtHoS7l4SuhWP6Sdqs6ioAH8HRegpSD2zc+jRTxihFUK
	 dK9U0PanLm0YkF59b7wnu67kIaZZaDvCCEAiRWjA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22446F80BF3;
	Tue, 30 Jul 2019 11:32:29 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7CD01F8048D; Mon, 29 Jul 2019 14:14:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730042.outbound.protection.outlook.com [40.107.73.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 998C0F800E4
 for <alsa-devel@alsa-project.org>; Mon, 29 Jul 2019 14:14:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 998C0F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="fu9BVBau"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fSEIuwhusDutLGgc026ffhCMkATWTOGT1qX2HJTOCArexyDttoy9L9+XDJwqFaWxF0KOMYH/6/8/CHm0Oi5wJ5//Dm6kQKZsZUdAXWdoiE/gfK5sMSF/2orYIE7/CGSSfeh6uGFrGqcdP70qHW1fAhM50xGwtTPY1kNXL9We/YxAp1Y7zpnnqRnmO/g+h0TaEQScKWzKKFimtGgbRfOGjHkA3a7UoH7Qpi5IXKmpDBwlLBQfOaMhe/uGVdI6CRwG6TZck04s4D0Xms8VEbz2ix7eM4SY67a7FXjGhNC82Fk1jn3HlFQBgzB7I6kNhMg74A8M2d5hdlk6lXCXIK+4GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xt2Z7zJ7v8ihvP1FrZ8G/yzCqlFzNhXpQffDP2sPaLg=;
 b=iZzNcCG86WMldzfd7/aQkPcHZYkpmGBn3wudX9ulUet68zdxPJauYUqucVzpXajUZ/nN9CTcDiFeXZ8nwBojPT47RzD9uUhYIZaUUYp5JA4GcVDW/qZ1uw4ZwX5s4jKGLktqoGPC+S718voyPgramSsWRKdZFLsa11ax1XqJ2jT732yGpu6O1sByJ98CikmJE3YReDDWjvOLgBqF4CN6bznJI1Df+pOWc+iJy96ke2tz8INndDKtSZsTQjHWEiFmGPKBYn92asNSQn3YTB/dIMnPXRuVyuqNnHM+nkHlJCj31nFEpZ6P1SYvXW+9xVcSZkDo2qTfhs7sAwcaXp5fGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=canonical.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xt2Z7zJ7v8ihvP1FrZ8G/yzCqlFzNhXpQffDP2sPaLg=;
 b=fu9BVBauQBH3AENk526qZECivetZ3IQsQ+7GwjVp2xfqOsfBrRkoT1JzhsC6ZUlC0tLQqHPqBvK95bDK2c3imBp3+x8v2yf+SZ4BCVCwTCf4sa7gIHR2otfyb7WjmDoKjKri1xepBvg96yRwzd6gtO3quPqvLHGjSjbahDhgd1w=
Received: from SN1PR12CA0097.namprd12.prod.outlook.com (2603:10b6:802:21::32)
 by DM6PR12MB3514.namprd12.prod.outlook.com (2603:10b6:5:18a::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2115.13; Mon, 29 Jul
 2019 12:14:47 +0000
Received: from DM3NAM03FT010.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::201) by SN1PR12CA0097.outlook.office365.com
 (2603:10b6:802:21::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2094.16 via Frontend
 Transport; Mon, 29 Jul 2019 12:14:46 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; canonical.com; dkim=none (message not signed)
 header.d=none; canonical.com; dmarc=permerror action=none header.from=amd.com; 
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV02.amd.com (165.204.84.17) by
 DM3NAM03FT010.mail.protection.outlook.com (10.152.82.65) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2115.10 via Frontend Transport; Mon, 29 Jul 2019 12:14:46 +0000
Received: from vishnu-All-Series.amd.com (10.34.1.3) by SATLEXCHOV02.amd.com
 (10.181.40.72) with Microsoft SMTP Server id 14.3.389.1; Mon, 29 Jul 2019
 07:14:42 -0500
From: Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>
To: 
Date: Mon, 29 Jul 2019 17:38:29 +0530
Message-ID: <1564402115-5043-1-git-send-email-Vishnuvardhanrao.Ravulapati@amd.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(346002)(136003)(39860400002)(2980300002)(428003)(189003)(199004)(356004)(6666004)(305945005)(70206006)(1671002)(70586007)(50466002)(48376002)(316002)(53416004)(47776003)(4326008)(126002)(54906003)(51416003)(2616005)(7696005)(68736007)(50226002)(36756003)(81156014)(53936002)(486006)(8676002)(8936002)(16586007)(476003)(426003)(336012)(86362001)(2906002)(109986005)(26005)(5660300002)(186003)(478600001)(81166006)(266003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3514; H:SATLEXCHOV02.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; MX:1; A:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: be1d4de8-e5b5-4b28-d902-08d7141e58c8
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:DM6PR12MB3514; 
X-MS-TrafficTypeDiagnostic: DM6PR12MB3514:
X-Microsoft-Antispam-PRVS: <DM6PR12MB351439D5A99D68BE62D31EBCE7DD0@DM6PR12MB3514.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 01136D2D90
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: Y9nPWgL1ZLf6CPi5/48oVV18Pr/f6Irr/hi3u7fd+RwZCztzLYOFmyHtZTgRocmxrWzEfmGjPi2yPer9W9hjEgbY8p54JslgPc8G4wHUUaSiLh4kqFhF4lNPS6TnTR7XYGa4wXkZjrlXqgqFcL1QgEaKkYckiPaBMForhBlNWF87z+swKWaxTUrevwuhRfmbpPb1bj59VE6UrN+dODfHptL6+rx7nA0jjC2+p7hXqYj4jFxKkFQNOx6QdW8IG4Kna6e/KWXp1cdpl3bUZD4dW8I7SvnWymamawHoUdztkyKn105TvfdZhOWQ8nkRam14Shfp+5WG6Rt7nLo22tnKa3WYcY3KoepWpCb3x+SOsabmkTxBqXt+MP/s1tfheqjMBMlXDNdIwn15ExBBuOmd+lyGK5fMAwrkr6EjUjbNIf8=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2019 12:14:46.3303 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be1d4de8-e5b5-4b28-d902-08d7141e58c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV02.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3514
X-Mailman-Approved-At: Tue, 30 Jul 2019 11:31:28 +0200
Cc: "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Maruthi
 Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 open list <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 YueHaibing <yuehaibing@huawei.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, Colin Ian King <colin.king@canonical.com>
Subject: [alsa-devel] [PATCH 1/3] ASoC: amd: use DMA addr rather than CPU pa
	for audio buffer
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

We shouldn't assume CPU physical address we get from page_to_phys()
is same as DMA address we get from dma_alloc_coherent(). On x86_64,
we won't run into any problem with the assumption when dma_ops is
nommu_dma_ops. However, DMA address is IOVA when IOMMU is enabled.
And it's most likely different from CPU physical address when AMD
IOMMU is not in passthrough mode.

Signed-off-by: Vijendar Mukunda <vijendar.mukunda@amd.com>
Tested-by: RAVULAPATI VISHNU VARDHAN RAO <Vishnuvardhanrao.Ravulapati@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index a4ade6b..49c4872 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -31,7 +31,7 @@ struct i2s_stream_instance {
 	u16 num_pages;
 	u16 channels;
 	u32 xfer_resolution;
-	struct page *pg;
+	dma_addr_t dma_addr;
 	u64 bytescount;
 	void __iomem *acp3x_base;
 };
@@ -211,11 +211,13 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 {
 	u16 page_idx;
-	u64 addr;
+	dma_addr_t addr;
 	u32 low, high, val, acp_fifo_addr;
-	struct page *pg = rtd->pg;
 
-	/* 8 scratch registers used to map one 64 bit address */
+	addr = rtd->dma_addr;
+	/* 8 scratch registers used to map one 64 bit address.
+	 * For 2 pages (8192 * 2 bytes), it will be 16 registers.
+	 */
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
 		val = 0;
 	else
@@ -229,7 +231,6 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 
 	for (page_idx = 0; page_idx < rtd->num_pages; page_idx++) {
 		/* Load the low address of page int ACP SRAM through SRBM */
-		addr = page_to_phys(pg);
 		low = lower_32_bits(addr);
 		high = upper_32_bits(addr);
 
@@ -239,7 +240,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 				+ 4);
 		/* Move to next physically contiguos page */
 		val += 8;
-		pg++;
+		addr += PAGE_SIZE;
 	}
 
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -340,10 +341,8 @@ static int acp3x_dma_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params)
 {
 	int status;
-	u64 size;
-	struct page *pg;
-	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct i2s_stream_instance *rtd = runtime->private_data;
+	uint64_t size;
+	struct i2s_stream_instance *rtd = substream->runtime->private_data;
 
 	if (!rtd)
 		return -EINVAL;
@@ -355,8 +354,8 @@ static int acp3x_dma_hw_params(struct snd_pcm_substream *substream,
 
 	memset(substream->runtime->dma_area, 0, params_buffer_bytes(params));
 	pg = virt_to_page(substream->dma_buffer.area);
-	if (pg) {
-		rtd->pg = pg;
+	if (substream->dma_buffer.area) {
+		rtd->dma_addr = substream->dma_buffer.addr;
 		rtd->num_pages = (PAGE_ALIGN(size) >> PAGE_SHIFT);
 		config_acp3x_dma(rtd, substream->stream);
 		status = 0;
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
