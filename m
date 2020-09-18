Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3ED26ECFE
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Sep 2020 04:16:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4FEB217E6;
	Fri, 18 Sep 2020 04:16:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4FEB217E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600395417;
	bh=7ijBAKzbzL0P/b4iOpJn8EUDsQXKg0GqQ7+MvRna7d4=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=aJYYgmT6r928GSEn9PBMsa0sJRg+BZE/VPO/gDJBbFD6f12yrMUqkOszWzP6o28Wd
	 dgqXQ0+CsPPeMml9jS2d028vLPy4efEvoY3brgYZUD+tkvS+sOAHVxainAhO0aEO6q
	 FJkNgDOLEhELwlojeDBjmhnT6ei+xoGjNP15qWMQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D49F8F801F7;
	Fri, 18 Sep 2020 04:15:45 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 04811F801F7; Fri, 18 Sep 2020 04:15:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AE4D2F8012D
 for <alsa-devel@alsa-project.org>; Fri, 18 Sep 2020 04:15:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE4D2F8012D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="mid7EQjM"
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6957C23770;
 Fri, 18 Sep 2020 02:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600395335;
 bh=7ijBAKzbzL0P/b4iOpJn8EUDsQXKg0GqQ7+MvRna7d4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mid7EQjMfWFarV4r7xntr8iPo1ewKsLHD2bFwltaKFoV1/W0qy/+2oQu3unDyyyEV
 UFhqFm6IeIr3u0UjHXa36rCRVsPynqNY0Z78hp5ESDy+ecms4dGWjCwPrGK2aQmsgf
 zy8wQhOYxeTeTLzPL2W8nSkSiXfds1ZAb49WNHiw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 32/90] ALSA: hda: Clear RIRB status before reading
 WP
Date: Thu, 17 Sep 2020 22:13:57 -0400
Message-Id: <20200918021455.2067301-32-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918021455.2067301-1-sashal@kernel.org>
References: <20200918021455.2067301-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Cc: Viswanath L <viswanathl@nvidia.com>, Takashi Iwai <tiwai@suse.de>,
 alsa-devel@alsa-project.org, Mohan Kumar <mkumard@nvidia.com>,
 Sasha Levin <sashal@kernel.org>
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

From: Mohan Kumar <mkumard@nvidia.com>

[ Upstream commit 6d011d5057ff88ee556c000ac6fe0be23bdfcd72 ]

RIRB interrupt status getting cleared after the write pointer is read
causes a race condition, where last response(s) into RIRB may remain
unserviced by IRQ, eventually causing azx_rirb_get_response to fall
back to polling mode. Clearing the RIRB interrupt status ahead of
write pointer access ensures that this condition is avoided.

Signed-off-by: Mohan Kumar <mkumard@nvidia.com>
Signed-off-by: Viswanath L <viswanathl@nvidia.com>
Link: https://lore.kernel.org/r/1580983853-351-1-git-send-email-viswanathl@nvidia.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/pci/hda/hda_controller.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_controller.c b/sound/pci/hda/hda_controller.c
index bd0e4710d15d7..79043b481d7b6 100644
--- a/sound/pci/hda/hda_controller.c
+++ b/sound/pci/hda/hda_controller.c
@@ -1158,16 +1158,23 @@ irqreturn_t azx_interrupt(int irq, void *dev_id)
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
2.25.1

