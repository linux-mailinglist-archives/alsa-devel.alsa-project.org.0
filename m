Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 111732C01CA
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Nov 2020 09:58:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9E7AF15E5;
	Mon, 23 Nov 2020 09:57:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9E7AF15E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606121898;
	bh=uvYTtIT6vScUbITlnpwUkyTU/FGHxgp2uU0cbuJfcUU=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=siNZNY11jswRlTRSHeX3sHSiyRWb359PyNDeTZ7s4K5kGlGcTPxuZZT4ktlBPPbEY
	 SIXyWEN/aod1QBpNRRSlFVay9KxJAklLFkvuZ/xc+vDnVsvVIQJSaUgGf7+srvVzN8
	 tx4NZ32/6xfz4ur3m8hGGVj99UgOuQL2hiXQE4Qc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83EFDF80527;
	Mon, 23 Nov 2020 09:54:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 89E09F80517; Mon, 23 Nov 2020 09:54:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08098F80273
 for <alsa-devel@alsa-project.org>; Mon, 23 Nov 2020 09:53:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08098F80273
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5D15EAF98;
 Mon, 23 Nov 2020 08:53:57 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/41] ALSA: usb-audio: Move snd_usb_autoresume() call out of
 setup_hw_info()
Date: Mon, 23 Nov 2020 09:53:15 +0100
Message-Id: <20201123085347.19667-10-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20201123085347.19667-1-tiwai@suse.de>
References: <20201123085347.19667-1-tiwai@suse.de>
Cc: Matwey Kornilov <matwey.kornilov@gmail.com>,
 Dylan Robinson <dylan_robinson@motu.com>,
 Keith Milner <kamilner@superlative.org>
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

This is a preliminary work for the upcoming hw-constraint change for
the implicit feedback mode.

Currently snd_usb_autoresume() is called at the end of
setup_hwinfo().  It's a bit confusing; because of this implicit
refcount usage, the caller side needs to call snd_usb_autosuspend()
later in the error path although it's not seen inside the function.
Instead, it's clearer to call both snd_usb_autoresume() and suspend()
in the very same function.

It's only refactoring and no functional changes.

Tested-by: Keith Milner <kamilner@superlative.org>
Tested-by: Dylan Robinson <dylan_robinson@motu.com>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index fea2764163b4..78933b6571d0 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -1378,7 +1378,7 @@ static int setup_hw_info(struct snd_pcm_runtime *runtime, struct snd_usb_substre
 			return err;
 	}
 
-	return snd_usb_autoresume(subs->stream->chip);
+	return 0;
 }
 
 static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
@@ -1402,11 +1402,14 @@ static int snd_usb_pcm_open(struct snd_pcm_substream *substream)
 	subs->dsd_dop.marker = 1;
 
 	ret = setup_hw_info(runtime, subs);
-	if (ret == 0) {
-		ret = snd_media_stream_init(subs, as->pcm, direction);
-		if (ret)
-			snd_usb_autosuspend(subs->stream->chip);
-	}
+	if (ret < 0)
+		return ret;
+	ret = snd_usb_autoresume(subs->stream->chip);
+	if (ret < 0)
+		return ret;
+	ret = snd_media_stream_init(subs, as->pcm, direction);
+	if (ret < 0)
+		snd_usb_autosuspend(subs->stream->chip);
 	return ret;
 }
 
-- 
2.16.4

