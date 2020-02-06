Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1848B154395
	for <lists+alsa-devel@lfdr.de>; Thu,  6 Feb 2020 12:56:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF63E1697;
	Thu,  6 Feb 2020 12:55:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF63E1697
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580990165;
	bh=yO2ZofGIJ6qJ2iM3kZn/QSw5tOdoDyVtnEcWFvi3wic=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DII83v9VdryNwjMSI518DlHB6M7aAWZj1JhbEVHz0O4xwF6pLxa59a0SQTp70hdXY
	 c+xf/Gj76bl+Yl8kgq8q1E8SRJDMVj4OjKqlOPRXbK2OEBrmL+1Pc2GPZDrr+86wIJ
	 qdP2htMN1Wi028j/MvIEdIx1MdVFwtkcWYS3BZ1M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B244F80255;
	Thu,  6 Feb 2020 12:54:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 22081F80162; Thu,  6 Feb 2020 11:11:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BC3B9F80059
 for <alsa-devel@alsa-project.org>; Thu,  6 Feb 2020 11:11:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BC3B9F80059
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="LXI/VJlT"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e3be5fb0000>; Thu, 06 Feb 2020 02:10:03 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 06 Feb 2020 02:11:01 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 06 Feb 2020 02:11:01 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 6 Feb
 2020 10:11:01 +0000
Received: from hqnvemgw03.nvidia.com (10.124.88.68) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3 via Frontend
 Transport; Thu, 6 Feb 2020 10:11:01 +0000
Received: from viswanathl-pc.nvidia.com (Not Verified[10.24.34.161]) by
 hqnvemgw03.nvidia.com with Trustwave SEG (v7, 5, 8, 10121)
 id <B5e3be6300014>; Thu, 06 Feb 2020 02:11:00 -0800
From: Viswanath L <viswanathl@nvidia.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <mkumard@nvidia.com>,
 <jonathanh@nvidia.com>
Date: Thu, 6 Feb 2020 15:40:53 +0530
Message-ID: <1580983853-351-1-git-send-email-viswanathl@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580983803; bh=e4WVFXFb11pvmP/iVTw7vCwJBQPl0YB7s5fvN/Yezig=;
 h=X-PGP-Universal:From:To:CC:Subject:Date:Message-ID:X-Mailer:
 MIME-Version:Content-Type;
 b=LXI/VJlTfRMnqKotrPgGFLP7jUgGKNtuPKaFhO8xs+IcYprI8zYs1sTn5GpySaymv
 ddgrweVLLJmAslI1JIDx8VTGguKZxEobTjrRnIz588CL5L5B7q2XjqM45RCvL1Oabi
 6+j1C68e9+suKLkjwal5b8jJNQH7+RpGjiVBSfzpYy5Q+SQTCieCCB5S/YhnLzLWbn
 5f1MX8W8fuK6t3rgUtXjhPR1wrmEGO0DkHrSGB/Rb0pfLzo0+All6i91mnnP29Ol5z
 7438x1vXkfD1NsAMtz+Egy+60lF9/GeLTywRYaY5NVmUfra7md6MLScvJ1MCUwGMpR
 XkzCEsofI0YLQ==
X-Mailman-Approved-At: Thu, 06 Feb 2020 12:54:00 +0100
Cc: kstewart@linuxfoundation.org, Viswanath L <viswanathl@nvidia.com>,
 alsa-devel@alsa-project.org, arnd@arndb.de, baolin.wang@linaro.org,
 rlokhande@nvidia.com, spujar@nvidia.com, linux-kernel@vger.kernel.org,
 atalambedu@nvidia.com, Julia.Lawall@inria.fr, sharadg@nvidia.com,
 tglx@linutronix.de, yung-chuan.liao@linux.intel.com, DRAMESH@nvidia.com
Subject: [alsa-devel] [PATCH] ALSA: hda: Clear RIRB status before reading WP
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Mohan Kumar <mkumard@nvidia.com>

RIRB interrupt status getting cleared after the write pointer is read
causes a race condition, where last response(s) into RIRB may remain
unserviced by IRQ, eventually causing azx_rirb_get_response to fall
back to polling mode. Clearing the RIRB interrupt status ahead of
write pointer access ensures that this condition is avoided.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
Signed-off-by: Viswanath L <viswanathl@nvidia.com>
---
 sound/pci/hda/hda_controller.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index 9757667..2609e39 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -1110,16 +1110,23 @@ irqreturn_t azx_interrupt(int irq, void *dev_id)
 		if (snd_hdac_bus_handle_stream_irq(bus, status, stream_update))
 			active = true;
 
-		/* clear rirb int */
 		status = azx_readb(chip, RIRBSTS);
 		if (status & RIRB_INT_MASK) {
+			/*
+			 * Clearing the interrupt status here ensures that no
+			 * interrupt gets masked after the RIRB wp is read in
+			 * snd_hdac_bus_update_rirb. This avoids a possible
+			 * race condition where codec response in RIRB may
+			 * remain unserviced by IRQ, eventually falling back
+			 * to polling mode in azx_rirb_get_response.
+			 */
+			azx_writeb(chip, RIRBSTS, RIRB_INT_MASK);
 			active = true;
 			if (status & RIRB_INT_RESPONSE) {
 				if (chip->driver_caps & AZX_DCAPS_CTX_WORKAROUND)
 					udelay(80);
 				snd_hdac_bus_update_rirb(bus);
 			}
-			azx_writeb(chip, RIRBSTS, RIRB_INT_MASK);
 		}
 	} while (active && ++repeat < 10);
 
-- 
2.7.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
