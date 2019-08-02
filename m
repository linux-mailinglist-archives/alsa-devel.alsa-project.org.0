Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D32957FB66
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Aug 2019 15:45:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5BACE1747;
	Fri,  2 Aug 2019 15:44:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5BACE1747
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564753533;
	bh=47IS5CmSji3OMJLt9OunEIsKFDZkJzHZ8D4ynIOuqg8=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EnBPUl7TAUSuuEH7PgUs9VBUCCpu8FZ4ebQqZ6c+NVbEqpsoYzBwmJ6VR+TXd7w2A
	 uAROHyijaSiaX15t0mxGBbSxzB75l1h3mfc7971z0inRfpFD9WWmh7rrBCUmQBB3De
	 348Kayrv0G9OCaBD9+DhL+7xYm0vK8pIba4DPBcE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 33B31F80507;
	Fri,  2 Aug 2019 15:43:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EF5B0F80508; Fri,  2 Aug 2019 15:43:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 PRX_BODY_30,SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720059.outbound.protection.outlook.com [40.107.72.59])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C09D9F80114
 for <alsa-devel@alsa-project.org>; Fri,  2 Aug 2019 15:43:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C09D9F80114
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=amdcloud.onmicrosoft.com
 header.i=@amdcloud.onmicrosoft.com header.b="gWSUrlTQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RhrvtyuaBTpUZlUMInca7B+JS+x0n2iSHXMiAkwuzHdQocvPQuyEPx/YCR587Ijh/r+4aNfC9zph56OC2OijDLtzq5mx/+Ri7DN3KvMOCtz2M5A8AKNvS4SDEdmKAh+kvxH/bKwiUPaJKe4gPC8suWw3CuObm+NixMQuM2ZWmrJ4o1xf3N6bibot7mGfDl1GF5dn+cPSjIUDslDln/qboCg3NhxkSSuO8dybG5Bu+uG+GxLE5kDhNf4mOySvtnlAMmK6c2xw/mNUOzVsuw4fkCW29XF27dsACWx7GdWVFeva4TENMI/uhAHAiaiAard51nLR2GQaCav5xbgXFJ7JKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEwUf1kttizLlLXuRiXzVZnNSjtUsOnTr1jDG1TvPcw=;
 b=JUx91Apvz6qvMuxuPl4HVsZa1VTnsUW5685s77J/iLuCJV9ymYU/iBlPiDmb9Ib4bHQyOb5NsY3NSV4bd0f4isS8gIkW5sYuHfmTfrKja1URrz8vf3hMrG0aj9PcKEvST8J2qFo8JvAXx3h/rzhsmYZmS2pe2Yo+9fipDvTuKuR7QhUIGHjgquc9t8tUUV5mNDlVAKHWNpEFuCNSwLXGcnhsSk69BhvbOjCGdF04o7r2iWj/Fsa6uRIiFtCGkfsg9MTQUOMRYWccX6dAtIOrs2sY6m3OoLg3kLa97xGUKDBtamHvwmmdNWuPoxRytNEi74rz41pyQ+5XmozNgB+6ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=none (sender ip is
 165.204.84.17) smtp.rcpttodomain=embeddedor.com
 smtp.mailfrom=amd.com;dmarc=permerror action=none
 header.from=amd.com;dkim=none (message not signed);arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEwUf1kttizLlLXuRiXzVZnNSjtUsOnTr1jDG1TvPcw=;
 b=gWSUrlTQOVyRYH97F1F9n314dZDZLqZA5T+JMFdSoxCGaAOV2FxndykoBllpmXLJQeNYxfa3/YAdUiQCxDdiZFzrgWPcKD/Rjzash1aF33At95UgI79kNEGj5Dnic9LigCNDAQo9Y8DiUNOSCX5ugmnU/0i1K+jTJGmL5LKdoB8=
Received: from DM3PR12CA0136.namprd12.prod.outlook.com (2603:10b6:0:51::32) by
 BYAPR12MB3479.namprd12.prod.outlook.com (2603:10b6:a03:ad::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2136.12; Fri, 2 Aug 2019 13:43:10 +0000
Received: from DM3NAM03FT043.eop-NAM03.prod.protection.outlook.com
 (2a01:111:f400:7e49::202) by DM3PR12CA0136.outlook.office365.com
 (2603:10b6:0:51::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2136.16 via Frontend
 Transport; Fri, 2 Aug 2019 13:43:10 +0000
Authentication-Results: spf=none (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; embeddedor.com; dkim=none (message not signed)
 header.d=none;embeddedor.com; dmarc=permerror action=none
 header.from=amd.com;
Received-SPF: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
Received: from SATLEXCHOV01.amd.com (165.204.84.17) by
 DM3NAM03FT043.mail.protection.outlook.com (10.152.83.227) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2136.14 via Frontend Transport; Fri, 2 Aug 2019 13:43:10 +0000
Received: from LinuxHost.amd.com (10.34.1.3) by SATLEXCHOV01.amd.com
 (10.181.40.71) with Microsoft SMTP Server id 14.3.389.1; Fri, 2 Aug 2019
 08:43:08 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: 
Date: Fri, 2 Aug 2019 19:21:24 +0530
Message-ID: <1564753899-17124-2-git-send-email-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564753899-17124-1-git-send-email-Vijendar.Mukunda@amd.com>
References: <1564753899-17124-1-git-send-email-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:165.204.84.17; IPV:NLI; CTRY:US; EFV:NLI;
 SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(39860400002)(376002)(346002)(396003)(2980300002)(428003)(199004)(189003)(50466002)(48376002)(36756003)(356004)(2616005)(476003)(86362001)(426003)(68736007)(336012)(486006)(186003)(126002)(7696005)(446003)(76176011)(6666004)(51416003)(109986005)(26005)(316002)(81156014)(81166006)(2906002)(50226002)(8936002)(8676002)(16586007)(53936002)(11346002)(4326008)(70586007)(70206006)(1671002)(478600001)(47776003)(53416004)(54906003)(5660300002)(305945005)(42413003)(266003)(32563001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3479; H:SATLEXCHOV01.amd.com; FPR:;
 SPF:None; LANG:en; PTR:InfoDomainNonexistent; A:1; MX:1; 
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2afc14ff-ee42-416b-2a3e-08d7174f5bc4
X-Microsoft-Antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328);
 SRVR:BYAPR12MB3479; 
X-MS-TrafficTypeDiagnostic: BYAPR12MB3479:
X-Microsoft-Antispam-PRVS: <BYAPR12MB3479C9F21839B4C560DB4E2897D90@BYAPR12MB3479.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-Forefront-PRVS: 011787B9DD
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: vVHjSopCqUrpuehlS8/EjDP1KkFBRIbrud9g+HXiF/j9Ufk+UmCE7bf7v/DugmJ3jyjdeVUtQqTe878r9y2hMsYv/togIIMSQ0g1XzGClwGNZDEtX2W6uUCg5ToLKG4mWbdMZcnpCB/LwWGZJK6snZQfvuoRHqIeIIB7cSLiFxlztZ5ayBtvZb0Ga4s9FSahxqoaubKDzo9KAXhyZ148A616NgPUK6ucY8tU1hpQVumE6jC4CuGcQMQaoGduK7H+y5MRyIp/vZ/kadPEA0nTLEYZuCeoHwCyaqi2PkGLkGxzl8fTJqsMVVIB8xYr+zbHFayB6prZK8jIi93E7VYYrDK+nIHMBCtveT+4Ph3ACIlOnOa8MPXp2COl2i12XReU6T1SS2DW3vmFc/+EKU19vogLyJfN2VDIkS+QCOjTx5I=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2019 13:43:10.1539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2afc14ff-ee42-416b-2a3e-08d7174f5bc4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXCHOV01.amd.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3479
Cc: "moderated list:SOUND - SOC
 LAYER / DYNAMIC AUDIO POWER MANAGEM..." <alsa-devel@alsa-project.org>,
 Maruthi Bayyavarapu <maruthi.bayyavarapu@amd.com>,
 Liam Girdwood <lgirdwood@gmail.com>, open list <linux-kernel@vger.kernel.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 YueHaibing <yuehaibing@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Ravulapati Vishnu vardhan rao <Vishnuvardhanrao.Ravulapati@amd.com>,
 Mark Brown <broonie@kernel.org>, Vijendar Mukunda <vijendar.mukunda@amd.com>,
 Alexander.Deucher@amd.com
Subject: [alsa-devel] [PATCH 2/2] ASoC: amd: acp3x: use dma address for
	acp3x dma driver
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

This patch fixes page faults when IOMMU is enabled.

Signed-off-by: Vijendar Mukunda <vijendar.mukunda@amd.com>
---
 sound/soc/amd/raven/acp3x-pcm-dma.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 905ed2f..bc4dfaf 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -31,8 +31,8 @@ struct i2s_stream_instance {
 	u16 num_pages;
 	u16 channels;
 	u32 xfer_resolution;
-	struct page *pg;
 	u64 bytescount;
+	dma_addr_t dma_addr;
 	void __iomem *acp3x_base;
 };
 
@@ -211,9 +211,8 @@ static irqreturn_t i2s_irq_handler(int irq, void *dev_id)
 static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 {
 	u16 page_idx;
-	u64 addr;
 	u32 low, high, val, acp_fifo_addr;
-	struct page *pg = rtd->pg;
+	dma_addr_t addr = rtd->dma_addr;
 
 	/* 8 scratch registers used to map one 64 bit address */
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK)
@@ -229,7 +228,6 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 
 	for (page_idx = 0; page_idx < rtd->num_pages; page_idx++) {
 		/* Load the low address of page int ACP SRAM through SRBM */
-		addr = page_to_phys(pg);
 		low = lower_32_bits(addr);
 		high = upper_32_bits(addr);
 
@@ -239,7 +237,7 @@ static void config_acp3x_dma(struct i2s_stream_instance *rtd, int direction)
 				+ 4);
 		/* Move to next physically contiguos page */
 		val += 8;
-		pg++;
+		addr += PAGE_SIZE;
 	}
 
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -341,7 +339,6 @@ static int acp3x_dma_hw_params(struct snd_pcm_substream *substream,
 {
 	int status;
 	u64 size;
-	struct page *pg;
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct i2s_stream_instance *rtd = runtime->private_data;
 
@@ -354,9 +351,8 @@ static int acp3x_dma_hw_params(struct snd_pcm_substream *substream,
 		return status;
 
 	memset(substream->runtime->dma_area, 0, params_buffer_bytes(params));
-	pg = virt_to_page(substream->dma_buffer.area);
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
