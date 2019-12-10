Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB10118A72
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:08:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F65D167B;
	Tue, 10 Dec 2019 15:07:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F65D167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575986899;
	bh=KdaGmnMlwGxv53WGvLsD46zKIAwiGfLotdgba9u2os4=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xcbdn+/1ELpE3XOglsLod5xu+r/ihl9uejzWzYQ8LsJzR2Md7nAYvS/W+jiwo0s/I
	 QujmnC9+GN+mTJnfOScfWyRFCc5lb+epcGXw2VfngFGgtHr4b9Uwmyln6HQWFetLXF
	 AkslXbILBO3AlV3N7R2BU1DWfkCmxA4XHwH2NLL8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2752F802E3;
	Tue, 10 Dec 2019 14:59:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB3F6F80254; Tue, 10 Dec 2019 14:59:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C7274F80255
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 14:59:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7274F80255
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 3668CB1A1;
 Tue, 10 Dec 2019 13:59:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: linux-media@vger.kernel.org
Date: Tue, 10 Dec 2019 14:58:48 +0100
Message-Id: <20191210135849.15607-14-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210135849.15607-1-tiwai@suse.de>
References: <20191210135849.15607-1-tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Andy Walls <awalls@md.metrocast.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [alsa-devel] [PATCH for-5.6 13/14] media: ivtv: Drop superfluous
	ioctl PCM ops
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

snd_ivtv_pcm_ioctl() does nothing but calling the default handler.
Now PCM core accepts NULL as the default ioctl ops, so let's drop
altogether.

Cc: Andy Walls <awalls@md.metrocast.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/media/pci/ivtv/ivtv-alsa-pcm.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/media/pci/ivtv/ivtv-alsa-pcm.c b/drivers/media/pci/ivtv/ivtv-alsa-pcm.c
index cb281ce089f9..8f346d7da9c8 100644
--- a/drivers/media/pci/ivtv/ivtv-alsa-pcm.c
+++ b/drivers/media/pci/ivtv/ivtv-alsa-pcm.c
@@ -204,18 +204,6 @@ static int snd_ivtv_pcm_capture_close(struct snd_pcm_substream *substream)
 	return 0;
 }
 
-static int snd_ivtv_pcm_ioctl(struct snd_pcm_substream *substream,
-		     unsigned int cmd, void *arg)
-{
-	struct snd_ivtv_card *itvsc = snd_pcm_substream_chip(substream);
-	int ret;
-
-	snd_ivtv_lock(itvsc);
-	ret = snd_pcm_lib_ioctl(substream, cmd, arg);
-	snd_ivtv_unlock(itvsc);
-	return ret;
-}
-
 static int snd_ivtv_pcm_prepare(struct snd_pcm_substream *substream)
 {
 	struct snd_ivtv_card *itvsc = snd_pcm_substream_chip(substream);
@@ -248,7 +236,6 @@ snd_pcm_uframes_t snd_ivtv_pcm_pointer(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops snd_ivtv_pcm_capture_ops = {
 	.open		= snd_ivtv_pcm_capture_open,
 	.close		= snd_ivtv_pcm_capture_close,
-	.ioctl		= snd_ivtv_pcm_ioctl,
 	.prepare	= snd_ivtv_pcm_prepare,
 	.trigger	= snd_ivtv_pcm_trigger,
 	.pointer	= snd_ivtv_pcm_pointer,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
