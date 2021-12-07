Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0816046BF6C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Dec 2021 16:34:47 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9851E24BE;
	Tue,  7 Dec 2021 16:33:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9851E24BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638891286;
	bh=XfPrArQ3cFAaV6hY6A293o4eRe0jvpIGf5rHHhvzbNk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RcORv7/IAmX6euoRlKkWoPBZ4rynBboGoLw6WHPHDVBjN//cpW9+6yGPjyt2E8KkO
	 jsYVoE2n8AeNJ59KDvlBGXgTm0XqMuO4dY+E/dUnrypWLkYnOXMdd51MA2hByQLq4L
	 xeqUb0hG2edXN2FKMQnIPwfwydPl/YGDMPaMj4K0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF91BF80103;
	Tue,  7 Dec 2021 16:33:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AAD1CF8028D; Tue,  7 Dec 2021 16:33:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53D73F80103
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 16:33:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53D73F80103
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="OQgQxnY3"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="5nnVqkIv"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id ED9021FD56
 for <alsa-devel@alsa-project.org>; Tue,  7 Dec 2021 15:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638891203; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SlqntBjEi7e2IwALm6+L0kWvDVFeUXJOtQ/jn40evpY=;
 b=OQgQxnY3A3kzCXWL4ZXvMCZIWiGjzHxuZDASaVRmubgXh0gYhxzQiI4O/1RvcRXhLPQA3v
 DX4xkpEwzVIMA+w6jQpupJJMQRVaKiM5Cz6T8vbG8nSpoHhdMvvUQOgIwmhOICU+vAYWZ/
 wzBCtnKz/pv+xzsq+lL4iOZ2KKSDVwc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638891203;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=SlqntBjEi7e2IwALm6+L0kWvDVFeUXJOtQ/jn40evpY=;
 b=5nnVqkIvGI+G4jdCCeamC5rU+HCa5tnJ0/Bt5CaX8gL2wicCjIuJavz0C1CPPPrYhsDezI
 hVJzcUHIyrIx9EAw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id DC172A3B84;
 Tue,  7 Dec 2021 15:33:23 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: mixart: Add sanity check for timer notify streams
Date: Tue,  7 Dec 2021 16:33:23 +0100
Message-Id: <20211207153323.27098-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
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

The miXart timer notification is a variable length, and if a hardware
is screwed up, we may access over the actual data size.  Let's add a
sanity check and bail out if an invalid value is received.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/mixart/mixart_core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/pci/mixart/mixart_core.c b/sound/pci/mixart/mixart_core.c
index 853083dd4bad..a047ed0f84e9 100644
--- a/sound/pci/mixart/mixart_core.c
+++ b/sound/pci/mixart/mixart_core.c
@@ -443,6 +443,8 @@ irqreturn_t snd_mixart_threaded_irq(int irq, void *dev_id)
 				notify = (struct mixart_timer_notify *)mixart_msg_data;
 
 				BUILD_BUG_ON(sizeof(notify) > sizeof(mixart_msg_data));
+				if (snd_BUG_ON(notify->stream_count > ARRAY_SIZE(notify->streams)))
+					break;
 				for(i=0; i<notify->stream_count; i++) {
 
 					u32 buffer_id = notify->streams[i].buffer_id;
-- 
2.31.1

