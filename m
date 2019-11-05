Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BD23EF6C9
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 09:04:15 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E623D170B;
	Tue,  5 Nov 2019 09:03:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E623D170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572941055;
	bh=SRmcgsP9Fbn0+3fak25Tlxq/jEzT90naBJMD3rXu2KE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dk5SVNWPcIPF95vOXudD8DDBPS5No3KaUHE33niCLvQRW8tU2OMYwCnErmttpde1F
	 NTIEUpcF7kxc8TAzESlAErIl1omRUimKusjPds8+hohn++MMMkfgcqorWkK+9J/rCy
	 tdHNSo2mXqZ533eAZZ1FDEx+H1Pbk8/RJBDjof1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1F5A3F8049B;
	Tue,  5 Nov 2019 09:01:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 78D2CF805AE; Tue,  5 Nov 2019 09:01:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D6BF0F8015B
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 09:01:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6BF0F8015B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1D364B05D
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 08:01:40 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 09:01:38 +0100
Message-Id: <20191105080138.1260-5-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105080138.1260-1-tiwai@suse.de>
References: <20191105080138.1260-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 4/4] ALSA: docs: Update documentation about SG-
	and vmalloc-buffers
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

The recent changes simplified the required setup for SG- and vmalloc-
buffers.  Update the documentation accordingly.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .../sound/kernel-api/writing-an-alsa-driver.rst    | 66 ++++++++++++----------
 1 file changed, 37 insertions(+), 29 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 5385618fd881..ba008ce28029 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -2095,10 +2095,12 @@ This callback is atomic as default.
 page callback
 ~~~~~~~~~~~~~
 
-This callback is optional too. This callback is used mainly for
-non-contiguous buffers. The mmap calls this callback to get the page
-address. Some examples will be explained in the later section `Buffer
-and Memory Management`_, too.
+This callback is optional too. The mmap calls this callback to get the
+page fault address.
+
+Since the recent changes, you need no special callback any longer for
+the standard SG-buffer or vmalloc-buffer. Hence this callback should
+be rarely used.
 
 mmap calllback
 ~~~~~~~~~~~~~~
@@ -3700,8 +3702,15 @@ For creating the SG-buffer handler, call
 ``SNDRV_DMA_TYPE_DEV_SG`` in the PCM constructor like other PCI
 pre-allocator. You need to pass ``snd_dma_pci_data(pci)``, where pci is
 the :c:type:`struct pci_dev <pci_dev>` pointer of the chip as
-well. The ``struct snd_sg_buf`` instance is created as
-``substream->dma_private``. You can cast the pointer like:
+well.
+
+::
+
+  snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
+                                        snd_dma_pci_data(pci), size, max);
+
+The ``struct snd_sg_buf`` instance is created as
+``substream->dma_private`` in turn. You can cast the pointer like:
 
 ::
 
@@ -3717,10 +3726,6 @@ physically non-contiguous. The physical address table is set up in
 ``sgbuf->table``. You can get the physical address at a certain offset
 via :c:func:`snd_pcm_sgbuf_get_addr()`.
 
-When a SG-handler is used, you need to set
-:c:func:`snd_pcm_sgbuf_ops_page()` as the ``page`` callback. (See
-`page callback`_ section.)
-
 To release the data, call :c:func:`snd_pcm_lib_free_pages()` in
 the ``hw_free`` callback as usual.
 
@@ -3728,30 +3733,33 @@ Vmalloc'ed Buffers
 ------------------
 
 It's possible to use a buffer allocated via :c:func:`vmalloc()`, for
-example, for an intermediate buffer. Since the allocated pages are not
-contiguous, you need to set the ``page`` callback to obtain the physical
-address at every offset.
+example, for an intermediate buffer. In the recent version of kernel,
+you can simply allocate it via standard
+:c:func:`snd_pcm_lib_malloc_pages()` and co after setting up the
+buffer preallocation with ``SNDRV_DMA_TYPE_VMALLOC`` type.
 
-The easiest way to achieve it would be to use
-:c:func:`snd_pcm_lib_alloc_vmalloc_buffer()` for allocating the buffer
-via :c:func:`vmalloc()`, and set :c:func:`snd_pcm_sgbuf_ops_page()` to
-the ``page`` callback.  At release, you need to call
-:c:func:`snd_pcm_lib_free_vmalloc_buffer()`.
+::
 
-If you want to implementation the ``page`` manually, it would be like
-this:
+  snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+                                        NULL, 0, 0);
 
-::
+The NULL is passed to the device pointer argument, which indicates
+that the default pages (GFP_KERNEL and GFP_HIGHMEM) will be
+allocated.
 
-  #include <linux/vmalloc.h>
+Also, note that zero is passed to both the size and the max size
+arguments here.  Since each vmalloc call should succeed at any time,
+we don't need to pre-allocate the buffers like other continuous
+pages.
 
-  /* get the physical page pointer on the given offset */
-  static struct page *mychip_page(struct snd_pcm_substream *substream,
-                                  unsigned long offset)
-  {
-          void *pageptr = substream->runtime->dma_area + offset;
-          return vmalloc_to_page(pageptr);
-  }
+If you need the 32bit DMA allocation, pass the device pointer encoded
+by :c:func:`snd_dma_continuous_data()` with ``GFP_KERNEL|__GFP_DMA32``
+argument.
+
+::
+
+  snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+          snd_dma_continuous_data(GFP_KERNEL | __GFP_DMA32), 0, 0);
 
 Proc Interface
 ==============
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
