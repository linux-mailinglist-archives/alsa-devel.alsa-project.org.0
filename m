Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD80FF890
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Nov 2019 09:55:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D22D1693;
	Sun, 17 Nov 2019 09:55:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D22D1693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573980957;
	bh=UpNUJE2/ZsNJMKCCPgJPxOBx2ZPEPO6pXJngohiiLA0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R/7YytnvIDmU7A12dkSJ82rshfRf1iQU7jOnVYophCY99BejGHLj5upwdER8Au3AY
	 pVlnLgKssRaVdo8pqpR6mV9FDIg4PGCP3avHGK8L8VKWbGyX9uqUNs5CcOZOzE7eXk
	 CqJcxmD0PH1+rxvojFaQqymwwpFrWSlgmXWoDRuQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ECEA7F8013F;
	Sun, 17 Nov 2019 09:53:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 50D47F8013C; Sun, 17 Nov 2019 09:53:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 504EDF80132
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 09:53:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 504EDF80132
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id DD605B1E8
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 08:53:18 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun, 17 Nov 2019 09:53:02 +0100
Message-Id: <20191117085308.23915-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191117085308.23915-1-tiwai@suse.de>
References: <20191117085308.23915-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 2/8] ALSA: docs: Update for managed buffer
	allocation mode
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

Update the documentation for the newly introduced managed buffer
allocation mode accordingly.  The old preallocation is no longer
recommended.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .../sound/kernel-api/writing-an-alsa-driver.rst    | 99 ++++++++++++++--------
 1 file changed, 64 insertions(+), 35 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index dcb7940435d9..1086b35db2af 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -1270,21 +1270,23 @@ shows only the skeleton, how to build up the PCM interfaces.
               /* the hardware-specific codes will be here */
               ....
               return 0;
-
       }
 
       /* hw_params callback */
       static int snd_mychip_pcm_hw_params(struct snd_pcm_substream *substream,
                                    struct snd_pcm_hw_params *hw_params)
       {
-              return snd_pcm_lib_malloc_pages(substream,
-                                         params_buffer_bytes(hw_params));
+              /* the hardware-specific codes will be here */
+              ....
+              return 0;
       }
 
       /* hw_free callback */
       static int snd_mychip_pcm_hw_free(struct snd_pcm_substream *substream)
       {
-              return snd_pcm_lib_free_pages(substream);
+              /* the hardware-specific codes will be here */
+              ....
+              return 0;
       }
 
       /* prepare callback */
@@ -1382,9 +1384,9 @@ shows only the skeleton, how to build up the PCM interfaces.
                               &snd_mychip_capture_ops);
               /* pre-allocation of buffers */
               /* NOTE: this may fail */
-              snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-                                                    &chip->pci->dev,
-                                                    64*1024, 64*1024);
+              snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+                                             &chip->pci->dev,
+                                             64*1024, 64*1024);
               return 0;
       }
 
@@ -1465,13 +1467,14 @@ The operators are defined typically like this:
 All the callbacks are described in the Operators_ subsection.
 
 After setting the operators, you probably will want to pre-allocate the
-buffer. For the pre-allocation, simply call the following:
+buffer and set up the managed allocation mode.
+For that, simply call the following:
 
 ::
 
-  snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-                                        &chip->pci->dev,
-                                        64*1024, 64*1024);
+  snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+                                 &chip->pci->dev,
+                                 64*1024, 64*1024);
 
 It will allocate a buffer up to 64kB as default. Buffer management
 details will be described in the later section `Buffer and Memory
@@ -1621,8 +1624,7 @@ For the operators (callbacks) of each sound driver, most of these
 records are supposed to be read-only. Only the PCM middle-layer changes
 / updates them. The exceptions are the hardware description (hw) DMA
 buffer information and the private data. Besides, if you use the
-standard buffer allocation method via
-:c:func:`snd_pcm_lib_malloc_pages()`, you don't need to set the
+standard managed buffer allocation mode, you don't need to set the
 DMA buffer information by yourself.
 
 In the sections below, important records are explained.
@@ -1776,8 +1778,8 @@ the physical address of the buffer. This field is specified only when
 the buffer is a linear buffer. ``dma_bytes`` holds the size of buffer
 in bytes. ``dma_private`` is used for the ALSA DMA allocator.
 
-If you use a standard ALSA function,
-:c:func:`snd_pcm_lib_malloc_pages()`, for allocating the buffer,
+If you use either the managed buffer allocation mode or the standard
+API function :c:func:`snd_pcm_lib_malloc_pages()` for allocating the buffer,
 these fields are set by the ALSA middle layer, and you should *not*
 change them by yourself. You can read them but not write them. On the
 other hand, if you want to allocate the buffer by yourself, you'll
@@ -1929,8 +1931,12 @@ Many hardware setups should be done in this callback, including the
 allocation of buffers.
 
 Parameters to be initialized are retrieved by
-:c:func:`params_xxx()` macros. To allocate buffer, you can call a
-helper function,
+:c:func:`params_xxx()` macros.
+
+When you set up the managed buffer allocation mode for the substream,
+a buffer is already allocated before this callback gets
+called. Alternatively, you can call a helper function below for
+allocating the buffer, too.
 
 ::
 
@@ -1964,18 +1970,23 @@ hw_free callback
   static int snd_xxx_hw_free(struct snd_pcm_substream *substream);
 
 This is called to release the resources allocated via
-``hw_params``. For example, releasing the buffer via
-:c:func:`snd_pcm_lib_malloc_pages()` is done by calling the
-following:
-
-::
-
-  snd_pcm_lib_free_pages(substream);
+``hw_params``.
 
 This function is always called before the close callback is called.
 Also, the callback may be called multiple times, too. Keep track
 whether the resource was already released.
 
+When you have set up the managed buffer allocation mode for the PCM
+substream, the allocated PCM buffer will be automatically released
+after this callback gets called.  Otherwise you'll have to release the
+buffer manually.  Typically, when the buffer was allocated from the
+pre-allocated pool, you can use the standard API function
+:c:func:`snd_pcm_lib_malloc_pages()` like:
+
+::
+
+  snd_pcm_lib_free_pages(substream);
+
 prepare callback
 ~~~~~~~~~~~~~~~~
 
@@ -3543,6 +3554,25 @@ Once the buffer is pre-allocated, you can use the allocator in the
 
 Note that you have to pre-allocate to use this function.
 
+Most of drivers use, though, rather the newly introduced "managed
+buffer allocation mode" instead of the manual allocation or release.
+This is done by calling :c:func:`snd_pcm_set_managed_buffer_all()`
+instead of :c:func:`snd_pcm_lib_preallocate_pages_for_all()`.
+
+::
+
+  snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV,
+                                 &pci->dev, size, max);
+
+where passed arguments are identical in both functions.
+The difference in the managed mode is that PCM core will call
+:c:func:`snd_pcm_lib_malloc_pages()` internally already before calling
+the PCM ``hw_params`` callback, and call :c:func:`snd_pcm_lib_free_pages()`
+after the PCM ``hw_free`` callback automatically.  So the driver
+doesn't have to call these functions explicitly in its callback any
+longer.  This made many driver code having NULL ``hw_params`` and
+``hw_free`` entries.
+
 External Hardware Buffers
 -------------------------
 
@@ -3697,8 +3727,8 @@ provides an interface for handling SG-buffers. The API is provided in
 ``<sound/pcm.h>``.
 
 For creating the SG-buffer handler, call
-:c:func:`snd_pcm_lib_preallocate_pages()` or
-:c:func:`snd_pcm_lib_preallocate_pages_for_all()` with
+:c:func:`snd_pcm_set_managed_buffer()` or
+:c:func:`snd_pcm_set_managed_buffer_all()` with
 ``SNDRV_DMA_TYPE_DEV_SG`` in the PCM constructor like other PCI
 pre-allocator. You need to pass ``&pci->dev``, where pci is
 the :c:type:`struct pci_dev <pci_dev>` pointer of the chip as
@@ -3706,8 +3736,8 @@ well.
 
 ::
 
-  snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
-                                        &pci->dev, size, max);
+  snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV_SG,
+                                 &pci->dev, size, max);
 
 The ``struct snd_sg_buf`` instance is created as
 ``substream->dma_private`` in turn. You can cast the pointer like:
@@ -3716,8 +3746,7 @@ The ``struct snd_sg_buf`` instance is created as
 
   struct snd_sg_buf *sgbuf = (struct snd_sg_buf *)substream->dma_private;
 
-Then call :c:func:`snd_pcm_lib_malloc_pages()` in the ``hw_params``
-callback as well as in the case of normal PCI buffer. The SG-buffer
+Then in :c:func:`snd_pcm_lib_malloc_pages()` call, the common SG-buffer
 handler will allocate the non-contiguous kernel pages of the given size
 and map them onto the virtually contiguous memory. The virtual pointer
 is addressed in runtime->dma_area. The physical address
@@ -3726,8 +3755,8 @@ physically non-contiguous. The physical address table is set up in
 ``sgbuf->table``. You can get the physical address at a certain offset
 via :c:func:`snd_pcm_sgbuf_get_addr()`.
 
-To release the data, call :c:func:`snd_pcm_lib_free_pages()` in
-the ``hw_free`` callback as usual.
+If you need to release the SG-buffer data explicitly, call the
+standard API function :c:func:`snd_pcm_lib_free_pages()` as usual.
 
 Vmalloc'ed Buffers
 ------------------
@@ -3740,8 +3769,8 @@ buffer preallocation with ``SNDRV_DMA_TYPE_VMALLOC`` type.
 
 ::
 
-  snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
-                                        NULL, 0, 0);
+  snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+                                 NULL, 0, 0);
 
 The NULL is passed to the device pointer argument, which indicates
 that the default pages (GFP_KERNEL and GFP_HIGHMEM) will be
@@ -3758,7 +3787,7 @@ argument.
 
 ::
 
-  snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
+  snd_pcm_set_managed_buffer_all(pcm, SNDRV_DMA_TYPE_VMALLOC,
           snd_dma_continuous_data(GFP_KERNEL | __GFP_DMA32), 0, 0);
 
 Proc Interface
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
