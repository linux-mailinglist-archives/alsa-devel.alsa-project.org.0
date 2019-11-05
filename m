Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B035EF6CF
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 09:05:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EA631171D;
	Tue,  5 Nov 2019 09:04:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EA631171D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572941117;
	bh=MiO06JzaqDMDcBywQHjVQRimAfU5s3zZu7w5U6AwwPc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lV3bRiSn6ree+wnU0Kt/sUiWtDQy0JtpGRHKeZVe8FzUdHwjZycrL4QNaNs6bXws6
	 8BagLEGM8tT3+2Pcu8Bzm64Sd/KdYIOHv+i7tYqlwp8ZTFh1i/9iWKzgV6zJ1wb4CI
	 Uu03e7idK2/SZcC+9PRVuXK3KwVKWSUu0uS2jUFg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 31F9FF8015B;
	Tue,  5 Nov 2019 09:01:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 626BFF805AE; Tue,  5 Nov 2019 09:01:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 201CDF80535
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 09:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 201CDF80535
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id EEE4EB021
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 08:01:39 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 09:01:35 +0100
Message-Id: <20191105080138.1260-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105080138.1260-1-tiwai@suse.de>
References: <20191105080138.1260-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 1/4] ALSA: memalloc: Allow NULL device for
	SNDRV_DMA_TYPE_CONTINOUS type
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Currently we pass the artificial device pointer to the allocation
helper in the case of SNDRV_DMA_TYPE_CONTINUOUS for passing the GFP
flags.  But all common cases are the allocations with GFP_KERNEL, and
it's messy to put this in each place.

In this patch, the memalloc core helper is changed to accept the NULL
device pointer and it treats as the default mode, GFP_KERNEL, so that
all callers can omit the complex argument but just leave NULL.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/kernel-api/writing-an-alsa-driver.rst | 14 ++++++++------
 sound/core/memalloc.c                                     |  9 ++++++++-
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 132f5eb9b530..5385618fd881 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -3523,12 +3523,14 @@ The second argument (type) and the third argument (device pointer) are
 dependent on the bus. For normal devices, pass the device pointer
 (typically identical as ``card->dev``) to the third argument with
 ``SNDRV_DMA_TYPE_DEV`` type. For the continuous buffer unrelated to the
-bus can be pre-allocated with ``SNDRV_DMA_TYPE_CONTINUOUS`` type and the
-``snd_dma_continuous_data(GFP_KERNEL)`` device pointer, where
-``GFP_KERNEL`` is the kernel allocation flag to use. For the
-scatter-gather buffers, use ``SNDRV_DMA_TYPE_DEV_SG`` with the device
-pointer (see the `Non-Contiguous Buffers`_
-section).
+bus can be pre-allocated with ``SNDRV_DMA_TYPE_CONTINUOUS`` type.
+You can pass NULL to the device pointer in that case, which is the
+default mode implying to allocate with ``GFP_KRENEL`` flag.
+If you need a different GFP flag, you can pass it by encoding the flag
+into the device pointer via a special macro
+:c:func:`snd_dma_continuous_data()`.
+For the scatter-gather buffers, use ``SNDRV_DMA_TYPE_DEV_SG`` with the
+device pointer (see the `Non-Contiguous Buffers`_ section).
 
 Once the buffer is pre-allocated, you can use the allocator in the
 ``hw_params`` callback:
diff --git a/sound/core/memalloc.c b/sound/core/memalloc.c
index 6850d13aa98c..e56f84fbd659 100644
--- a/sound/core/memalloc.c
+++ b/sound/core/memalloc.c
@@ -99,6 +99,13 @@ static void snd_free_dev_iram(struct snd_dma_buffer *dmab)
  *
  */
 
+static inline gfp_t snd_mem_get_gfp_flags(const struct device *dev)
+{
+	if (!dev)
+		return GFP_KRENEL;
+	else
+		return (__force gfp_t)(unsigned long)dev;
+}
 
 /**
  * snd_dma_alloc_pages - allocate the buffer area according to the given type
@@ -129,7 +136,7 @@ int snd_dma_alloc_pages(int type, struct device *device, size_t size,
 	switch (type) {
 	case SNDRV_DMA_TYPE_CONTINUOUS:
 		dmab->area = alloc_pages_exact(size,
-					       (__force gfp_t)(unsigned long)device);
+					       snd_mem_get_gfp_flags(device));
 		dmab->addr = 0;
 		break;
 #ifdef CONFIG_HAS_DMA
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
