Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DA3118AA9
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Dec 2019 15:20:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DBD961687;
	Tue, 10 Dec 2019 15:19:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DBD961687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1575987622;
	bh=yZXH5VZ4cvDflKehFLX0aBoagS1kyGxWasHxUuMQ3/0=;
	h=From:To:Date:In-Reply-To:References:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ucufspQ+h0Zg0ny58LKoG3JjL4kgNmM7dveQcPn9T0roQO3U7rxMU36kChpRYIjID
	 XKOHfJRz/nm8HDncw3bu88Of6+B3XCvwRKMOR4tEciqEZRdsV589OJtBWhRExb8F5w
	 CdAEO1YQkswQGecMe5iaN1ZHvnIfc0KieWPOipZY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 51E1AF801D8;
	Tue, 10 Dec 2019 15:18:40 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CAE93F80217; Tue, 10 Dec 2019 15:18:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2F13DF80248
 for <alsa-devel@alsa-project.org>; Tue, 10 Dec 2019 15:18:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2F13DF80248
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id C0094B1FA;
 Tue, 10 Dec 2019 14:18:29 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Felipe Balbi <balbi@kernel.org>
Date: Tue, 10 Dec 2019 15:18:22 +0100
Message-Id: <20191210141822.18705-3-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20191210141822.18705-1-tiwai@suse.de>
References: <20191210141822.18705-1-tiwai@suse.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 alsa-devel@alsa-project.org, linux-usb@vger.kernel.org
Subject: [alsa-devel] [PATCH for-5.6 2/2] usb: gadget: u_audio: Drop
	superfluous ioctl PCM ops
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

PCM core deals the empty ioctl field now as default.
Let's kill the redundant lines.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/usb/gadget/function/u_audio.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/gadget/function/u_audio.c b/drivers/usb/gadget/function/u_audio.c
index 67c4c85433d1..cf4f2358889b 100644
--- a/drivers/usb/gadget/function/u_audio.c
+++ b/drivers/usb/gadget/function/u_audio.c
@@ -314,7 +314,6 @@ static int uac_pcm_null(struct snd_pcm_substream *substream)
 static const struct snd_pcm_ops uac_pcm_ops = {
 	.open = uac_pcm_open,
 	.close = uac_pcm_null,
-	.ioctl = snd_pcm_lib_ioctl,
 	.trigger = uac_pcm_trigger,
 	.pointer = uac_pcm_pointer,
 	.prepare = uac_pcm_null,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
