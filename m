Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D32E1B14D6
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Apr 2020 20:39:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D0D71689;
	Mon, 20 Apr 2020 20:38:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D0D71689
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587407960;
	bh=kua5xXhNkpIPEbGkqTJxyr1cIQCLlipCOX0kMhOvPnc=;
	h=From:Subject:To:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WzpwI1qcWVnrphXmBdIc1PHRP9MgJh3C+vgX0jXD5Lq6aoiQOFmP6ZUCURxBfDshC
	 HFozUOKlBhnzy/uT2o/xKLYVOFMSFuSNGVNcIaBcif6Mkcuj48xAx9PJqHaQz5CTNw
	 qoQpCNF0ypN/FeW4IQS8j+HeoK4BDkWB1ft6meb4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0A80F80278;
	Mon, 20 Apr 2020 20:36:53 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3980AF8012F; Mon, 20 Apr 2020 20:36:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_13,RDNS_NONE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from pegase1.c-s.fr (unknown [93.17.236.30])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 708AAF8020C
 for <alsa-devel@alsa-project.org>; Mon, 20 Apr 2020 20:36:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 708AAF8020C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=c-s.fr header.i=@c-s.fr header.b="E+DWEZwJ"
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 495b4z3MXVz9v1w9;
 Mon, 20 Apr 2020 20:36:35 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=E+DWEZwJ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id L4mwlUXAK_-i; Mon, 20 Apr 2020 20:36:35 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 495b4z2JLhz9v95f;
 Mon, 20 Apr 2020 20:36:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1587407795; bh=0fa57ddsyHEgiUKKkj3rA4MemZZkyaFbgYjKejGShaM=;
 h=From:Subject:To:Cc:Date:From;
 b=E+DWEZwJhz6Y/xgde33hxmuD3rGUtiRxeI/8EM0ccVSx3KfiQ4f7G5tlyiclyZlTv
 G3EZfX0BGGT6pW9WIfnMkWEKqCSDbnWxGkJCDbptk9jvRRwxinuBROxEoLLsiTAxU+
 2fc5X+q61AH6lsZ6C9gAPrkXh1oIdYDt+A1N76WQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F6AA8B78A;
 Mon, 20 Apr 2020 20:36:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7Voh0XE4aIU2; Mon, 20 Apr 2020 20:36:35 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EFABD8B77E;
 Mon, 20 Apr 2020 20:36:34 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B0D97657AE; Mon, 20 Apr 2020 18:36:34 +0000 (UTC)
Message-Id: <a5945463f86c984151962a475a3ee56a2893e85d.1587407777.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 1/5] drivers/powerpc: Replace _ALIGN_UP() by ALIGN()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 20 Apr 2020 18:36:34 +0000 (UTC)
Cc: alsa-devel@alsa-project.org, kvm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
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

_ALIGN_UP() is specific to powerpc
ALIGN() is generic and does the same

Replace _ALIGN_UP() by ALIGN()

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 drivers/ps3/ps3-lpm.c               | 6 +++---
 drivers/vfio/pci/vfio_pci_nvlink2.c | 2 +-
 drivers/video/fbdev/ps3fb.c         | 4 ++--
 sound/ppc/snd_ps3.c                 | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/ps3/ps3-lpm.c b/drivers/ps3/ps3-lpm.c
index 83c45659bc9d..064b5884ba13 100644
--- a/drivers/ps3/ps3-lpm.c
+++ b/drivers/ps3/ps3-lpm.c
@@ -1096,8 +1096,8 @@ int ps3_lpm_open(enum ps3_lpm_tb_type tb_type, void *tb_cache,
 		lpm_priv->tb_cache_internal = NULL;
 		lpm_priv->tb_cache = NULL;
 	} else if (tb_cache) {
-		if (tb_cache != (void *)_ALIGN_UP((unsigned long)tb_cache, 128)
-			|| tb_cache_size != _ALIGN_UP(tb_cache_size, 128)) {
+		if (tb_cache != (void *)ALIGN((unsigned long)tb_cache, 128)
+			|| tb_cache_size != ALIGN(tb_cache_size, 128)) {
 			dev_err(sbd_core(), "%s:%u: unaligned tb_cache\n",
 				__func__, __LINE__);
 			result = -EINVAL;
@@ -1116,7 +1116,7 @@ int ps3_lpm_open(enum ps3_lpm_tb_type tb_type, void *tb_cache,
 			result = -ENOMEM;
 			goto fail_malloc;
 		}
-		lpm_priv->tb_cache = (void *)_ALIGN_UP(
+		lpm_priv->tb_cache = (void *)ALIGN(
 			(unsigned long)lpm_priv->tb_cache_internal, 128);
 	}
 
diff --git a/drivers/vfio/pci/vfio_pci_nvlink2.c b/drivers/vfio/pci/vfio_pci_nvlink2.c
index ed20d73cc27c..65c61710c0e9 100644
--- a/drivers/vfio/pci/vfio_pci_nvlink2.c
+++ b/drivers/vfio/pci/vfio_pci_nvlink2.c
@@ -67,7 +67,7 @@ static size_t vfio_pci_nvgpu_rw(struct vfio_pci_device *vdev,
 	 *
 	 * This is not fast path anyway.
 	 */
-	sizealigned = _ALIGN_UP(posoff + count, PAGE_SIZE);
+	sizealigned = ALIGN(posoff + count, PAGE_SIZE);
 	ptr = ioremap_cache(data->gpu_hpa + posaligned, sizealigned);
 	if (!ptr)
 		return -EFAULT;
diff --git a/drivers/video/fbdev/ps3fb.c b/drivers/video/fbdev/ps3fb.c
index 834f63edf700..9df78fb77267 100644
--- a/drivers/video/fbdev/ps3fb.c
+++ b/drivers/video/fbdev/ps3fb.c
@@ -44,7 +44,7 @@
 #define GPU_CMD_BUF_SIZE			(2 * 1024 * 1024)
 #define GPU_FB_START				(64 * 1024)
 #define GPU_IOIF				(0x0d000000UL)
-#define GPU_ALIGN_UP(x)				_ALIGN_UP((x), 64)
+#define GPU_ALIGN_UP(x)				ALIGN((x), 64)
 #define GPU_MAX_LINE_LENGTH			(65536 - 64)
 
 #define GPU_INTR_STATUS_VSYNC_0			0	/* vsync on head A */
@@ -1015,7 +1015,7 @@ static int ps3fb_probe(struct ps3_system_bus_device *dev)
 	}
 #endif
 
-	max_ps3fb_size = _ALIGN_UP(GPU_IOIF, 256*1024*1024) - GPU_IOIF;
+	max_ps3fb_size = ALIGN(GPU_IOIF, 256*1024*1024) - GPU_IOIF;
 	if (ps3fb_videomemory.size > max_ps3fb_size) {
 		dev_info(&dev->core, "Limiting ps3fb mem size to %lu bytes\n",
 			 max_ps3fb_size);
diff --git a/sound/ppc/snd_ps3.c b/sound/ppc/snd_ps3.c
index 6d2a33b8faa0..b8161a08f2ca 100644
--- a/sound/ppc/snd_ps3.c
+++ b/sound/ppc/snd_ps3.c
@@ -926,7 +926,7 @@ static int snd_ps3_driver_probe(struct ps3_system_bus_device *dev)
 			    PAGE_SHIFT, /* use system page size */
 			    0, /* dma type; not used */
 			    NULL,
-			    _ALIGN_UP(SND_PS3_DMA_REGION_SIZE, PAGE_SIZE));
+			    ALIGN(SND_PS3_DMA_REGION_SIZE, PAGE_SIZE));
 	dev->d_region->ioid = PS3_AUDIO_IOID;
 
 	ret = ps3_dma_region_create(dev->d_region);
-- 
2.25.0

