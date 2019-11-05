Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E902F0182
	for <lists+alsa-devel@lfdr.de>; Tue,  5 Nov 2019 16:33:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 07B9211C;
	Tue,  5 Nov 2019 16:32:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 07B9211C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572967982;
	bh=ey6RfUTYzgKiiUXd/J+YKFZFC6NyhjNVbpF8C1G/KG8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AMpblRW+zijfJ8VCYIzdvvH0bR/gEV8Tvo6+PWaor97Lqpb+qNsIWgEJnnq30tCw0
	 4BsjOF2BLsKaq6mwJX4DzqKBF4qdc+xOSwSHW1tQpy0CZdMJwzcOKDHNBNvBvRfY9E
	 ae0Pd/RmygOc4lOaaa4atS39CAf6pkhthCQ5jgoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 70989F80771;
	Tue,  5 Nov 2019 16:19:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3179FF80638; Tue,  5 Nov 2019 16:19:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDF98F80611
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 16:19:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDF98F80611
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id D533AB4F3
 for <alsa-devel@alsa-project.org>; Tue,  5 Nov 2019 15:18:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Tue,  5 Nov 2019 16:18:56 +0100
Message-Id: <20191105151856.10785-25-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191105151856.10785-1-tiwai@suse.de>
References: <20191105151856.10785-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 24/24] ALSA: docs: Remove snd_dma_pci_data()
	usage in documentation
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

The macro will be removed soon later, so update the documentation to
reflect that as well.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 Documentation/sound/kernel-api/writing-an-alsa-driver.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index ba008ce28029..3a87311c125e 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -1383,7 +1383,7 @@ shows only the skeleton, how to build up the PCM interfaces.
               /* pre-allocation of buffers */
               /* NOTE: this may fail */
               snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-                                                    snd_dma_pci_data(chip->pci),
+                                                    &chip->pci->dev,
                                                     64*1024, 64*1024);
               return 0;
       }
@@ -1470,7 +1470,7 @@ buffer. For the pre-allocation, simply call the following:
 ::
 
   snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-                                        snd_dma_pci_data(chip->pci),
+                                        &chip->pci->dev,
                                         64*1024, 64*1024);
 
 It will allocate a buffer up to 64kB as default. Buffer management
@@ -3514,7 +3514,7 @@ bus).
 ::
 
   snd_pcm_lib_preallocate_pages_for_all(pcm, SNDRV_DMA_TYPE_DEV,
-                                        snd_dma_pci_data(pci), size, max);
+                                        &pci->dev, size, max);
 
 where ``size`` is the byte size to be pre-allocated and the ``max`` is
 the maximum size to be changed via the ``prealloc`` proc file. The
@@ -3700,7 +3700,7 @@ For creating the SG-buffer handler, call
 :c:func:`snd_pcm_lib_preallocate_pages()` or
 :c:func:`snd_pcm_lib_preallocate_pages_for_all()` with
 ``SNDRV_DMA_TYPE_DEV_SG`` in the PCM constructor like other PCI
-pre-allocator. You need to pass ``snd_dma_pci_data(pci)``, where pci is
+pre-allocator. You need to pass ``&pci->dev``, where pci is
 the :c:type:`struct pci_dev <pci_dev>` pointer of the chip as
 well.
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
