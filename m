Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2ECFF89C
	for <lists+alsa-devel@lfdr.de>; Sun, 17 Nov 2019 10:00:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FB0D168C;
	Sun, 17 Nov 2019 09:59:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FB0D168C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1573981227;
	bh=jIHchUlfVLxaA/kEML5f9+9ciawItvtY7VjNLbgMzig=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JID93zIx5yK2mDkR79yiijbETNgIaUF9zik6J+WNnm18K9mo0frqy1r2tvwbXVEMs
	 3eLvvOqGuZ8TkMyZQis0PEO2OJPKzhGlfJRsBlP31SrHu8TFrYrUpD6O9VKYKHRy8m
	 l6hh0GjfIsRN0VJ5bSTXDY7XalYKLlTtjNX2PAf0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 331B6F80214;
	Sun, 17 Nov 2019 09:53:41 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3622AF80131; Sun, 17 Nov 2019 09:53:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A861EF8013B
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 09:53:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A861EF8013B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 30A60B240
 for <alsa-devel@alsa-project.org>; Sun, 17 Nov 2019 08:53:19 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun, 17 Nov 2019 09:53:08 +0100
Message-Id: <20191117085308.23915-9-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191117085308.23915-1-tiwai@suse.de>
References: <20191117085308.23915-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 8/8] ALSA: docs: Update about the new PCM
	sync_stop ops
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

Add the documentation about the new PCM sync_stop ops and
card->sync_irq field.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 .../sound/kernel-api/writing-an-alsa-driver.rst    | 41 ++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
index 145bf6aad7cb..f169d58ca019 100644
--- a/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
+++ b/Documentation/sound/kernel-api/writing-an-alsa-driver.rst
@@ -805,6 +805,7 @@ destructor and PCI entries. Example code is shown first, below.
                       return -EBUSY;
               }
               chip->irq = pci->irq;
+              card->sync_irq = chip->irq;
 
               /* (2) initialization of the chip hardware */
               .... /*   (not implemented in this document) */
@@ -965,6 +966,15 @@ usually like the following:
           return IRQ_HANDLED;
   }
 
+After requesting the IRQ, you can passed it to ``card->sync_irq``
+field:
+::
+
+          card->irq = chip->irq;
+
+This allows PCM core automatically performing
+:c:func:`synchronize_irq()` at the necessary timing like ``hw_free``.
+See the later section `sync_stop callback`_ for details.
 
 Now let's write the corresponding destructor for the resources above.
 The role of destructor is simple: disable the hardware (if already
@@ -2059,6 +2069,37 @@ flag set, and you cannot call functions which may sleep. The
 triggering the DMA. The other stuff should be initialized
 ``hw_params`` and ``prepare`` callbacks properly beforehand.
 
+sync_stop callback
+~~~~~~~~~~~~~~~~~~
+
+::
+
+  static int snd_xxx_sync_stop(struct snd_pcm_substream *substream);
+
+This callback is optional, and NULL can be passed.  It's called after
+the PCM core stops the stream and changes the stream state
+``prepare``, ``hw_params`` or ``hw_free``.
+Since the IRQ handler might be still pending, we need to wait until
+the pending task finishes before moving to the next step; otherwise it
+might lead to a crash due to resource conflicts or access to the freed
+resources.  A typical behavior is to call a synchronization function
+like :c:func:`synchronize_irq()` here.
+
+For majority of drivers that need only a call of
+:c:func:`synchronize_irq()`, there is a simpler setup, too.
+While keeping NULL to ``sync_stop`` PCM callback, the driver can set
+``card->sync_irq`` field to store the valid interrupt number after
+requesting an IRQ, instead.   Then PCM core will look call
+:c:func:`synchronize_irq()` with the given IRQ appropriately.
+
+If the IRQ handler is released at the card destructor, you don't need
+to clear ``card->sync_irq``, as the card itself is being released.
+So, usually you'll need to add just a single line for assigning
+``card->sync_irq`` in the driver code unless the driver re-acquires
+the IRQ.  When the driver frees and re-acquires the IRQ dynamically
+(e.g. for suspend/resume), it needs to clear and re-set
+``card->sync_irq`` again appropriately.
+
 pointer callback
 ~~~~~~~~~~~~~~~~
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
