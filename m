Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B676B382D42
	for <lists+alsa-devel@lfdr.de>; Mon, 17 May 2021 15:20:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 33CCB1686;
	Mon, 17 May 2021 15:19:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 33CCB1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621257624;
	bh=OkiJF+cvs5nGXQM+nJIoIzE/pILaM4xQh3OdEPvR5XQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=T4EIfuFLSef8Np+ztZLSuE14UNQzB2vbQNO1Q/rXz6DqEdjhwqrJho0XoOYJsff49
	 3XhbbMPIkVE0wig9jbxB9A3NQkDRjGS6MovMRmT71LOSydZwB7TW2w96s85tPhZFVC
	 XyevfCDBv+4vqWGRwBZ6qv9U8TCkHjFM0OtB56dw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 801E2F804E7;
	Mon, 17 May 2021 15:16:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E5CDF80169; Mon, 17 May 2021 15:16:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 56368F80425
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 15:15:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 56368F80425
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id B1F8FB224
 for <alsa-devel@alsa-project.org>; Mon, 17 May 2021 13:15:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 09/11] ALSA: usx2y: Don't call free_pages_exact() with NULL
 address
Date: Mon, 17 May 2021 15:15:43 +0200
Message-Id: <20210517131545.27252-10-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210517131545.27252-1-tiwai@suse.de>
References: <20210517131545.27252-1-tiwai@suse.de>
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

Unlike some other functions, we can't pass NULL pointer to
free_pages_exact().  Add a proper NULL check for avoiding possible
Oops.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/usx2y/usb_stream.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/sound/usb/usx2y/usb_stream.c b/sound/usb/usx2y/usb_stream.c
index 820647331aba..9d0e44793896 100644
--- a/sound/usb/usx2y/usb_stream.c
+++ b/sound/usb/usx2y/usb_stream.c
@@ -143,8 +143,11 @@ void usb_stream_free(struct usb_stream_kernel *sk)
 	if (!s)
 		return;
 
-	free_pages_exact(sk->write_page, s->write_size);
-	sk->write_page = NULL;
+	if (sk->write_page) {
+		free_pages_exact(sk->write_page, s->write_size);
+		sk->write_page = NULL;
+	}
+
 	free_pages_exact(s, s->read_size);
 	sk->s = NULL;
 }
-- 
2.26.2

