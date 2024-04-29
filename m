Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD318B7772
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 15:45:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97164210;
	Tue, 30 Apr 2024 15:45:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97164210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714484728;
	bh=JGOwRwb3wGY35/7bkooHaUwoAyvkcfcIq1Fea0jPVvo=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=qRh7ehn033GaCe6HLpbrBYJBLlEmeD7xmyxHOy/3D+SQroGSI8KUBSu8y6DxoRv7J
	 boWkI9MXHXzFh0q9noaM2eq+vE6awwB6BZMxh+5mp2UsIe/r8CUzyx7eBF+yr5eJep
	 YpzCnzbEKfIZIDyEC/VepQHCLo+Pqza+t0pQWUIw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 81D75F805D3; Tue, 30 Apr 2024 15:44:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B569CF805CA;
	Tue, 30 Apr 2024 15:44:40 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1EDE2F8028D; Mon, 29 Apr 2024 06:24:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B4630F8003C
	for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2024 06:24:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4630F8003C
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowABnbRnkIC9mz_ISAQ--.33589S2;
	Mon, 29 Apr 2024 12:24:05 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: cezary.rojewski@intel.com,
	pierre-louis.bossart@linux.intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	maarten.lankhorst@linux.intel.com,
	amadeuszx.slawinski@linux.intel.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] ASoC: intel: skylake: Add check for dma_set_max_seg_size
Date: Mon, 29 Apr 2024 12:23:20 +0800
Message-Id: <20240429042320.2150567-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: qwCowABnbRnkIC9mz_ISAQ--.33589S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Xry3uF47GrW8Xr4rZr47Jwb_yoWDXrX_Kw
	n5G3s5Wa4UW3yI9wnrKr43CF42qws7ZFyDXFyvq3WfA343GrZ8GFWvqFnruFWku34Fqry0
	v3ZIvrWDC348XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc2xSY4AK67AK6r45MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUj_-BtUUUUU==
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-MailFrom: nichen@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: TSNE4EUN2HN3BGSZZOB5CIVKPTMI4EEK
X-Message-ID-Hash: TSNE4EUN2HN3BGSZZOB5CIVKPTMI4EEK
X-Mailman-Approved-At: Tue, 30 Apr 2024 13:44:33 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/TSNE4EUN2HN3BGSZZOB5CIVKPTMI4EEK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add check for the return value of dma_set_max_seg_size() and return
the error if it fails in order to catch the error.

Fixes: c22a8086b384 ("ASoC: intel: skylake: Set max DMA segment size")
Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 sound/soc/intel/skylake/skl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/intel/skylake/skl.c b/sound/soc/intel/skylake/skl.c
index 117125187793..8edc13795462 100644
--- a/sound/soc/intel/skylake/skl.c
+++ b/sound/soc/intel/skylake/skl.c
@@ -943,7 +943,9 @@ static int skl_first_init(struct hdac_bus *bus)
 	/* allow 64bit DMA address if supported by H/W */
 	if (dma_set_mask_and_coherent(bus->dev, DMA_BIT_MASK(64)))
 		dma_set_mask_and_coherent(bus->dev, DMA_BIT_MASK(32));
-	dma_set_max_seg_size(bus->dev, UINT_MAX);
+	err = dma_set_max_seg_size(bus->dev, UINT_MAX);
+	if (err)
+		return err;
 
 	/* initialize streams */
 	snd_hdac_ext_stream_init_all
-- 
2.25.1

