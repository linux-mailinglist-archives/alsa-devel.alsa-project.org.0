Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEDF118A54
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:03:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E2C11694;
	Tue, 10 Dec 2019 15:02:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E2C11694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575986608;
	bh=6qGraDYb1k7thof7CMXeHCOTKiA32wEvxJMD0JDOfKY=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cFbE80oAx+8HiVg1sjfTFws4+gLSGbDbmrDzGcjV+U9JexqsTXUVPLwrCDo4w6k86
	 FgogeN4SrgWn72Jq0DGCZtpqGQBTgCl9Eiv/vEVpqwmmV85Xyjq2uxqoDSyD3Z8t+T
	 Omss7Aeb2Xwo9AGtS7Rkf/CLhtSC0RGNqnW+AvJQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 15A39F80277;
	Tue, 10 Dec 2019 14:59:23 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 96E89F80273; Tue, 10 Dec 2019 14:59:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 35E2AF801D8
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:59:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35E2AF801D8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E45FDAD2C;
 Tue, 10 Dec 2019 13:58:59 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: linux-media@vger.kernel.org
Date: Tue, 10 Dec 2019 14:58:36 +0100
Message-Id: <20191210135849.15607-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210135849.15607-1-tiwai@suse.de>
References: <20191210135849.15607-1-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Takashi Iwai <tiwai@suse.de>, Andrey Utkin <andrey.utkin@corp.bluecherry.net>,
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
 Anton Sviridenko <anton@corp.bluecherry.net>,
 Ismael Luceno <ismael@iodev.co.uk>
Subject: [alsa-devel] [PATCH for-5.6 01/14] media: solo6x10: Use managed
	buffer allocation
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

Clean up the driver with the new managed buffer allocation API.
The hw_params and hw_free callbacks became superfluous and dropped.

Cc: Bluecherry Maintainers <maintainers@bluecherrydvr.com>
Cc: Anton Sviridenko <anton@corp.bluecherry.net>
Cc: Andrey Utkin <andrey.utkin@corp.bluecherry.net>
Cc: Ismael Luceno <ismael@iodev.co.uk>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/solo6x10/solo6x10-g723.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-g723.c b/drivers/media/pci/solo6x10/solo6x10-g723.c
index eaa57d835ea8..ca349d447610 100644
--- a/drivers/media/pci/solo6x10/solo6x10-g723.c
+++ b/drivers/media/pci/solo6x10/solo6x10-g723.c
@@ -97,17 +97,6 @@ void solo_g723_isr(struct solo_dev *solo_dev)
 	}
 }
 
-static int snd_solo_hw_params(struct snd_pcm_substream *ss,
-			      struct snd_pcm_hw_params *hw_params)
-{
-	return snd_pcm_lib_malloc_pages(ss, params_buffer_bytes(hw_params));
-}
-
-static int snd_solo_hw_free(struct snd_pcm_substream *ss)
-{
-	return snd_pcm_lib_free_pages(ss);
-}
-
 static const struct snd_pcm_hardware snd_solo_pcm_hw = {
 	.info			= (SNDRV_PCM_INFO_MMAP |
 				   SNDRV_PCM_INFO_INTERLEAVED |
@@ -271,8 +260,6 @@ static const struct snd_pcm_ops snd_solo_pcm_ops = {
 	.open = snd_solo_pcm_open,
 	.close = snd_solo_pcm_close,
 	.ioctl = snd_pcm_lib_ioctl,
-	.hw_params = snd_solo_hw_params,
-	.hw_free = snd_solo_hw_free,
 	.prepare = snd_solo_pcm_prepare,
 	.trigger = snd_solo_pcm_trigger,
 	.pointer = snd_solo_pcm_pointer,
@@ -351,11 +338,11 @@ static int solo_snd_pcm_init(struct solo_dev *solo_dev)
 	     ss; ss = ss->next, i++)
 		sprintf(ss->name, "Camera #%d Audio", i);
 
-	snd_pcm_lib_preallocate_pages_for_all(pcm,
-					SNDRV_DMA_TYPE_CONTINUOUS,
-					NULL,
-					G723_PERIOD_BYTES * PERIODS,
-					G723_PERIOD_BYTES * PERIODS);
+	snd_pcm_set_managed_buffer_all(pcm,
+				       SNDRV_DMA_TYPE_CONTINUOUS,
+				       NULL,
+				       G723_PERIOD_BYTES * PERIODS,
+				       G723_PERIOD_BYTES * PERIODS);
 
 	solo_dev->snd_pcm = pcm;
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
