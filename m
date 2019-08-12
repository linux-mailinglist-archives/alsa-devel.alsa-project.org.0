Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 965138A2FF
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Aug 2019 18:09:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2211C166D;
	Mon, 12 Aug 2019 18:08:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2211C166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1565626174;
	bh=dqlnkwt3B9lWOl62969X4kApWSlPWcKO94ItDgS4kz8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ng9syEKwzzpg4K+gQZ+SWSnvduFhOdiFlMiE89SIGBcNpmZq01721u2SDaA/QuIV2
	 twSTqjC8oQyQsUotrHilQOQaT6BBr+J1x3m2RZzI8vcHbO9Q7lEIqNvOOfnoFkUmMq
	 ZoGH+Zu8tXBP5+SeheBQ2TRO4YAozPdgTwoHN+ak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E7BADF8048D;
	Mon, 12 Aug 2019 18:08:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D0A4F80268; Mon, 12 Aug 2019 18:08:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CDB0DF8015B
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 18:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CDB0DF8015B
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 6EC1FB63F
 for <alsa-devel@alsa-project.org>; Mon, 12 Aug 2019 16:08:10 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Mon, 12 Aug 2019 18:08:09 +0200
Message-Id: <20190812160809.9097-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
Subject: [alsa-devel] [PATCH] ALSA: hda: Set fifo_size for both playback and
	capture streams
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

Currently we set hdac_stream.fifo_size field only for the playback
stream by some odd reason I forgot, while this field isn't referred in
any places.  Actually this fifo_size field would have been required in
the position report correction for VIA chipset, but due to the lack of
the fifo_size set for capture streams, snd-hda-intel driver fetches
the register by itself.

This patch straightens and simplifies the code by setting the
fifo_size field for both playback and capture streams, and use it in
the HD-audio controller driver.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_stream.c   | 6 +-----
 sound/pci/hda/hda_intel.c | 8 +-------
 2 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/sound/hda/hdac_stream.c b/sound/hda/hdac_stream.c
index fc68d4ce0a37..d8fe7ff0cd58 100644
--- a/sound/hda/hdac_stream.c
+++ b/sound/hda/hdac_stream.c
@@ -229,11 +229,7 @@ int snd_hdac_stream_setup(struct hdac_stream *azx_dev)
 	/* set the interrupt enable bits in the descriptor control register */
 	snd_hdac_stream_updatel(azx_dev, SD_CTL, 0, SD_INT_MASK);
 
-	if (azx_dev->direction == SNDRV_PCM_STREAM_PLAYBACK)
-		azx_dev->fifo_size =
-			snd_hdac_stream_readw(azx_dev, SD_FIFOSIZE) + 1;
-	else
-		azx_dev->fifo_size = 0;
+	azx_dev->fifo_size = snd_hdac_stream_readw(azx_dev, SD_FIFOSIZE) + 1;
 
 	/* when LPIB delay correction gives a small negative value,
 	 * we ignore it; currently set the threshold statically to
diff --git a/sound/pci/hda/hda_intel.c b/sound/pci/hda/hda_intel.c
index 3a209e07d5d8..dc8a83cb7393 100644
--- a/sound/pci/hda/hda_intel.c
+++ b/sound/pci/hda/hda_intel.c
@@ -84,8 +84,6 @@ enum {
 #define INTEL_SCH_HDA_DEVC      0x78
 #define INTEL_SCH_HDA_DEVC_NOSNOOP       (0x1<<11)
 
-/* Define IN stream 0 FIFO size offset in VIA controller */
-#define VIA_IN_STREAM0_FIFO_SIZE_OFFSET	0x90
 /* Define VIA HD Audio Device ID*/
 #define VIA_HDAC_DEVICE_ID		0x3288
 
@@ -811,11 +809,7 @@ static unsigned int azx_via_get_position(struct azx *chip,
 	mod_dma_pos = le32_to_cpu(*azx_dev->core.posbuf);
 	mod_dma_pos %= azx_dev->core.period_bytes;
 
-	/* azx_dev->fifo_size can't get FIFO size of in stream.
-	 * Get from base address + offset.
-	 */
-	fifo_size = readw(azx_bus(chip)->remap_addr +
-			  VIA_IN_STREAM0_FIFO_SIZE_OFFSET);
+	fifo_size = azx_stream(azx_dev)->fifo_size - 1;
 
 	if (azx_dev->insufficient) {
 		/* Link position never gather than FIFO size */
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
