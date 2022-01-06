Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBEA486249
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Jan 2022 10:45:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 06B751849;
	Thu,  6 Jan 2022 10:44:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 06B751849
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1641462326;
	bh=zFUz3QzlgRDPtTcQ5jImxrA6GFaEzqkvnNkFi8XKPSc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CVq7054cxOqdyg84tDAM3n4TCB3IAZdx1jNZ4ORoicUt5JAQ+XGErxfk1egezfYZX
	 w9h4YmpTm0UOBb19GTNqMmjAxrSxWCjqe3HbxsOVmfu9s+ekur/UCKZpNkOVs43LO7
	 s9a6DbgwOwtmAtRZS2jVFOJv7ETFcBpg7+nlt9JA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69DEAF8007E;
	Thu,  6 Jan 2022 10:44:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7B18F8007E; Thu,  6 Jan 2022 10:44:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=KHOP_HELO_FCRDNS, SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
 by alsa1.perex.cz (Postfix) with ESMTP id 1A5AAF800BB
 for <alsa-devel@alsa-project.org>; Thu,  6 Jan 2022 10:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1A5AAF800BB
Received: from localhost.localdomain (unknown [124.16.138.126])
 by APP-05 (Coremail) with SMTP id zQCowAD3_wPjudZht_C1BQ--.61084S2;
 Thu, 06 Jan 2022 17:44:03 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: tiwai@suse.de
Subject: [PATCH v2] ALSA: intel_hdmi: Check for error num after setting mask
Date: Thu,  6 Jan 2022 17:44:02 +0800
Message-Id: <20220106094402.2738082-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAD3_wPjudZht_C1BQ--.61084S2
X-Coremail-Antispam: 1UD129KBjvdXoWruFyDKw1fAr4rXr15tw15CFg_yoWDGFg_tw
 18Ww4kWFy5AFySvw45CrW3Cr92939IvFyYgryrtF17Ga4DJFW7Jw1UGr4fur1fu3yfWry7
 u3ZFqrWSyry7ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
 I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
 4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY02Avz4vE14v_GFWl
 42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJV
 WUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAK
 I48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r
 4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVW8JVWxJwCI
 42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU8KZXUUUUU
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

v1 -> v2

* Change 1. Remove the fixes tag and change the message.
---
 sound/x86/intel_hdmi_audio.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index 33b12aa67cf5..6caea517f07f 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1770,7 +1770,9 @@ static int hdmi_lpe_audio_probe(struct platform_device *pdev)
 	card_ctx->irq = irq;
 
 	/* only 32bit addressable */
-	dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	ret = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(32));
+	if (ret)
+		goto err;
 
 	init_channel_allocations();
 
-- 
2.25.1

