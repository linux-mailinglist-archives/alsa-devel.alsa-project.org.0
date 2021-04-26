Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC8036AC46
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Apr 2021 08:35:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 832B91687;
	Mon, 26 Apr 2021 08:34:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 832B91687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1619418941;
	bh=eoqxIXJGnIxbhj6goBXqsxlETOu3TZw5S6gwiklZXNI=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iXbV/4yq954/RjKIUHCWIw9kZW3F5tB8lhZemn54wGjylKhez9/VvCCZcoHr+voGC
	 odJmRf5aTU/nPHEB+UPexNGT1pqic/1QCak2UgCcLgWK+fukbVbCFP+yUS2F+ceIts
	 N7r5wCAkivGmV4YF82DKw7DxFy4aPTWvjIZymOjo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADEAAF8016C;
	Mon, 26 Apr 2021 08:34:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5765CF8016C; Mon, 26 Apr 2021 08:34:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 15759F800F0
 for <alsa-devel@alsa-project.org>; Mon, 26 Apr 2021 08:33:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 15759F800F0
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0C4B0AC36;
 Mon, 26 Apr 2021 06:33:53 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix implicit sync clearance at stopping
 stream
Date: Mon, 26 Apr 2021 08:33:49 +0200
Message-Id: <20210426063349.18601-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Lucas Endres <jaffa225man@gmail.com>
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

The recent endpoint management change for implicit feedback mode added
a clearance of ep->sync_sink (formerly ep->sync_slave) pointer at
snd_usb_endpoint_stop() to assure no leftover for the feedback from
the already stopped capture stream.  This turned out to cause a
regression, however, when full-duplex streams were running and only a
capture was stopped.  Because of the above clearance of ep->sync_sink
pointer, no more feedback is done, hence the playback will stall.

This patch fixes the ep->sync_sink clearance to be done only after all
endpoints are released, for addressing the regression.

Reported-and-tested-by: Lucas Endres <jaffa225man@gmail.com>
Fixes: bf6313a0ff76 ("ALSA: usb-audio: Refactor endpoint management")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index f4c3d2b38abb..014c43862826 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1443,11 +1443,11 @@ void snd_usb_endpoint_stop(struct snd_usb_endpoint *ep)
 	if (snd_BUG_ON(!atomic_read(&ep->running)))
 		return;
 
-	if (ep->sync_source)
-		WRITE_ONCE(ep->sync_source->sync_sink, NULL);
-
-	if (!atomic_dec_return(&ep->running))
+	if (!atomic_dec_return(&ep->running)) {
+		if (ep->sync_source)
+			WRITE_ONCE(ep->sync_source->sync_sink, NULL);
 		stop_urbs(ep, false);
+	}
 }
 
 /**
-- 
2.26.2

