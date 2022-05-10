Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD61521250
	for <lists+alsa-devel@lfdr.de>; Tue, 10 May 2022 12:37:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 80D8A179F;
	Tue, 10 May 2022 12:36:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 80D8A179F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652179059;
	bh=Pgogb1qMoKNWNJV7I+Q2C5/cU3nwPrvNv/K4/25FH0w=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PtQ6QrJKkzyj88M/FcdVjoEnYZHKb+Xxoe9bka0oHuOqLHbt3fogXA15szx7EEU5V
	 md+I2wgvEFU4yaIpZFBNdtIJXZE7Y2Fc6s09MjQPqQEgLXbvMW6MQc3LNQHBk3C+su
	 5kmIsp5uH668FhzmDGigudm/bgEvr6FbtDXsoB8k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F214CF8011C;
	Tue, 10 May 2022 12:36:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18A19F8011C; Tue, 10 May 2022 12:36:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23E22F8011C
 for <alsa-devel@alsa-project.org>; Tue, 10 May 2022 12:36:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E22F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="q8YzfvCv"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="MJ832AJB"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id BF4F121A72;
 Tue, 10 May 2022 10:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1652178990; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=CLED8B3rOnXsLm4mb3S1FvnZGxY+0PwI++XfKlIXdpg=;
 b=q8YzfvCvK8dt/wTN1k9nX9JMboR00c2eKvR6hmToYVHX9J9ZRZ1BpT7zzt3BkrR6WJ45xG
 e8gtCmj27dR8jc5qr4CqjYNXx6xC5bzlGGWO9U9Rmxu1eoUSriHaf10eZ/mACfXd7TwOPv
 eLroyMJcW4ODWqksinkL5cMMGIqBTWY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1652178990;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=CLED8B3rOnXsLm4mb3S1FvnZGxY+0PwI++XfKlIXdpg=;
 b=MJ832AJB069DmgjC2ymyESgCE9zFWdYCOkDvSnHh7TJGBDkqhLZLojmsHtoRdv5C+Yn8g/
 HPSGphPSXRYwP4Aw==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id AD33F2C141;
 Tue, 10 May 2022 10:36:30 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: wavefront: Proper check of get_user() error
Date: Tue, 10 May 2022 12:36:26 +0200
Message-Id: <20220510103626.16635-1-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Linus Torvalds <torvalds@linux-foundation.org>
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

The antient ISA wavefront driver reads its sample patch data (uploaded
over an ioctl) via __get_user() with no good reason; likely just for
some performance optimizations in the past.  Let's change this to the
standard get_user() and the error check for handling the fault case
properly.

Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/wavefront/wavefront_synth.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/isa/wavefront/wavefront_synth.c b/sound/isa/wavefront/wavefront_synth.c
index 69cbc79fbb71..2aaaa6807174 100644
--- a/sound/isa/wavefront/wavefront_synth.c
+++ b/sound/isa/wavefront/wavefront_synth.c
@@ -1094,7 +1094,8 @@ wavefront_send_sample (snd_wavefront_t *dev,
 
 			if (dataptr < data_end) {
 		
-				__get_user (sample_short, dataptr);
+				if (get_user(sample_short, dataptr))
+					return -EFAULT;
 				dataptr += skip;
 		
 				if (data_is_unsigned) { /* GUS ? */
-- 
2.31.1

