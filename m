Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1E748702E
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Jan 2022 03:10:22 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 834EA18D4;
	Fri,  7 Jan 2022 03:09:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 834EA18D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641521421;
	bh=b92x/cZV/ccxb19rGXH40wpZl+YUPgJunZ7WV3lzPXg=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=gXVWNkaJR4h1psuFglazUeEzfDh9ooS2HfZvNAh/5JYD204/4eR1Diui4kWcCxgUE
	 w4b3ot7WEziPTFPsB4WBslNgZolZ12xdC64tNkuoLEkVTOxOZ1zfL1q5fDJAVty4GR
	 53Va3Gj8ufdWttb2L9K3x/L74bBgoJak9bwRZGOI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE851F80158;
	Fri,  7 Jan 2022 03:09:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 692E9F80155; Fri,  7 Jan 2022 03:09:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
 by alsa1.perex.cz (Postfix) with ESMTP id 6B1C2F800BB
 for <alsa-devel@alsa-project.org>; Fri,  7 Jan 2022 03:09:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6B1C2F800BB
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-03 (Coremail) with SMTP id rQCowABnby+1oNdhU9M8BQ--.47377S2;
 Fri, 07 Jan 2022 10:08:53 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: tiwai@suse.de
Subject: [PATCH v3] ALSA: intel_hdmi: Check for error num after setting mask
Date: Fri,  7 Jan 2022 10:08:51 +0800
Message-Id: <20220107020851.3095591-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowABnby+1oNdhU9M8BQ--.47377S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFyDKw1fAr4rXr15tw15CFg_yoWDZrg_Xw
 1xWws7WFy5C34Ivw43CrWfAr9a939IvFWqqrn5tF17G34DJFW7Xw1UGr4fur1xua97Wry3
 u3ZrtrWSyryakjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb4xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
 0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
 6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
 0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVAFwVW8
 JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r
 1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij
 64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr
 0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUHWlkUUU
 UU=
X-Originating-IP: [124.16.138.126]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
Cc: alsa-devel@alsa-project.org, leon@kernel.org, linux-kernel@vger.kernel.org,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>, tiwai@suse.com, broonie@kernel.org,
 joe@perches.com
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

To maintain the consistency of the code, it should be better to add the
sanity check after calling dma_set_mask_and_coherent(), like
tegra_pcm_dma_allocate() in `sound/soc/tegra/tegra_pcm.c`.

Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
Changelog

v2 -> v3

* Change 1. Remove the fixes tag and change the message.
* Change 2. Correct the patch to fit the lastest code.
---
 sound/x86/intel_hdmi_audio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 378826312abe..1c94eaff1931 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1750,7 +1750,9 @@ static int hdmi_lpe_audio_probe(struct platform_device *pdev)
 	card_ctx->irq = irq;
 
 	/* only 32bit addressable */
-	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret)
+		return ret;
 
 	init_channel_allocations();
 
-- 
2.25.1

