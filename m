Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7FD41C05D
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 10:12:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 57A7B1678;
	Wed, 29 Sep 2021 10:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 57A7B1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632903167;
	bh=tv37uYTPyao/uCseyn7tKd5AWnwa+D5aaRNSKQrfMkk=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MXV/d5sAppT2mgBOqGz5O9nbPpdmsBOdJ7sPNg5Dq07DMpdnsNPGnEPHnWb2/+sJY
	 6D91D1OvsANhygLVZKH2u7SiNN4gyaw/+nltN+o1ZhOsiDp3SNBSol4uG6YfjMOA8C
	 U/pCNTx6dThOB6PIn85zaQvL17WWow/ZQoxuyV8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63442F802C4;
	Wed, 29 Sep 2021 10:10:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BC70DF804B0; Wed, 29 Sep 2021 10:10:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 80F27F801F7
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 10:08:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 80F27F801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="miWgVMzi"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="fjEroNJ9"
Received: from relay1.suse.de (relay1.suse.de [149.44.160.133])
 by smtp-out1.suse.de (Postfix) with ESMTP id B1DD42252F
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1632902928; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QyfSjydg6Q65CJx7lb/hj/bcvlvtH0F2Qir8Lvjm7z4=;
 b=miWgVMziRbecqjfgtbrTE5eBheq4j23eNPqc2moA7lJxk5nhdmpPvG3lysp5yjivGjiCY4
 wrqKUPABS5rLyPqNlTrvE20rC4yV+XopC7Q4QnaPcMgLJGcG9g7b8fbahpaqBMAGA+dUWW
 Fz1h1aMxqTp1gaYLz8EGy3cHlrv9qDo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1632902928;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QyfSjydg6Q65CJx7lb/hj/bcvlvtH0F2Qir8Lvjm7z4=;
 b=fjEroNJ9y/v5SoFEqQqInphU2nfsotR9WDzvTUxK4M5EsdiCvjR6cuQcBpWwTdnUj83C/C
 I4z2Pc7zyfBrCoCQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay1.suse.de (Postfix) with ESMTP id A1DBC25D65;
 Wed, 29 Sep 2021 08:08:48 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/9] ALSA: usb-audio: Fix possible race at sync of urb
 completions
Date: Wed, 29 Sep 2021 10:08:37 +0200
Message-Id: <20210929080844.11583-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210929080844.11583-1-tiwai@suse.de>
References: <20210929080844.11583-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

USB-audio driver tries to sync with the clear of all pending URBs in
wait_clear_urbs(), and it waits for all bits in active_mask getting
cleared.  This works fine for the normal operations, but when a stream
is managed in the implicit feedback mode, there is still a very thin
race window: namely, in snd_complete_usb(), the active_mask bit for
the current URB is once cleared before re-submitted in
queue_pending_output_urbs().  If wait_clear_urbs() is called during
that period, it may pass the test and go forward even though there may
be a still pending URB.

For covering it, this patch adds a new counter to each endpoint to
keep the number of in-flight URBs, and changes wait_clear_urbs()
checking this number instead.  The counter is decremented at the end
of URB complete, hence the reference is kept as long as the URB
complete is in process.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/card.h     | 1 +
 sound/usb/endpoint.c | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/usb/card.h b/sound/usb/card.h
index 3329ce710cb9..746a765b2437 100644
--- a/sound/usb/card.h
+++ b/sound/usb/card.h
@@ -97,6 +97,7 @@ struct snd_usb_endpoint {
 	unsigned int nominal_queue_size; /* total buffer sizes in URBs */
 	unsigned long active_mask;	/* bitmask of active urbs */
 	unsigned long unlink_mask;	/* bitmask of unlinked urbs */
+	atomic_t submitted_urbs;	/* currently submitted urbs */
 	char *syncbuf;			/* sync buffer for all sync URBs */
 	dma_addr_t sync_dma;		/* DMA address of syncbuf */
 
diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index 29c4865966f5..06241568abf7 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -451,6 +451,7 @@ static void queue_pending_output_urbs(struct snd_usb_endpoint *ep)
 		}
 
 		set_bit(ctx->index, &ep->active_mask);
+		atomic_inc(&ep->submitted_urbs);
 	}
 }
 
@@ -488,6 +489,7 @@ static void snd_complete_urb(struct urb *urb)
 			clear_bit(ctx->index, &ep->active_mask);
 			spin_unlock_irqrestore(&ep->lock, flags);
 			queue_pending_output_urbs(ep);
+			atomic_dec(&ep->submitted_urbs); /* decrement at last */
 			return;
 		}
 
@@ -513,6 +515,7 @@ static void snd_complete_urb(struct urb *urb)
 
 exit_clear:
 	clear_bit(ctx->index, &ep->active_mask);
+	atomic_dec(&ep->submitted_urbs);
 }
 
 /*
@@ -596,6 +599,7 @@ int snd_usb_add_endpoint(struct snd_usb_audio *chip, int ep_num, int type)
 	ep->type = type;
 	ep->ep_num = ep_num;
 	INIT_LIST_HEAD(&ep->ready_playback_urbs);
+	atomic_set(&ep->submitted_urbs, 0);
 
 	is_playback = ((ep_num & USB_ENDPOINT_DIR_MASK) == USB_DIR_OUT);
 	ep_num &= USB_ENDPOINT_NUMBER_MASK;
@@ -861,7 +865,7 @@ static int wait_clear_urbs(struct snd_usb_endpoint *ep)
 		return 0;
 
 	do {
-		alive = bitmap_weight(&ep->active_mask, ep->nurbs);
+		alive = atomic_read(&ep->submitted_urbs);
 		if (!alive)
 			break;
 
@@ -1441,6 +1445,7 @@ int snd_usb_endpoint_start(struct snd_usb_endpoint *ep)
 			goto __error;
 		}
 		set_bit(i, &ep->active_mask);
+		atomic_inc(&ep->submitted_urbs);
 	}
 
 	usb_audio_dbg(ep->chip, "%d URBs submitted for EP 0x%x\n",
-- 
2.26.2

