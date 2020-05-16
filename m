Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9477E1D5F21
	for <lists+alsa-devel@lfdr.de>; Sat, 16 May 2020 08:31:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB2FA1670;
	Sat, 16 May 2020 08:30:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB2FA1670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589610697;
	bh=HiyzZpXqXimlQdI4oroZckn49dhAP4cYnc2b+eJrXHo=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gGZ1rFfL9DOq17/55iiQPHK24JUN9VhbRUWRblqxrx6aaLOlghTH8owknydxClWcM
	 eZkv0HRE72aKDE52c+fuEH8ZaDJfIVkr0Y/gOGGMvALsCSCvaa91sFo3cOvz9mt+MY
	 cfIm7Ehb5bcTvdSduvA1oZ9ZAT+7UFVa1rH6cG5E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 50EE7F80246;
	Sat, 16 May 2020 08:29:13 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 45914F8014C; Sat, 16 May 2020 08:29:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3EF1EF800E3
 for <alsa-devel@alsa-project.org>; Sat, 16 May 2020 08:28:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3EF1EF800E3
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 133D4AEF9
 for <alsa-devel@alsa-project.org>; Sat, 16 May 2020 06:29:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] ALSA: hda: Drop unused snd_hda_queue_unsol_event()
Date: Sat, 16 May 2020 08:28:53 +0200
Message-Id: <20200516062854.22141-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200516062854.22141-1-tiwai@suse.de>
References: <20200516062854.22141-1-tiwai@suse.de>
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

The inline function is nowhere used.  Drop it.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/hda_codec.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/sound/hda_codec.h b/include/sound/hda_codec.h
index 8a32060e3d8d..d16a4229209b 100644
--- a/include/sound/hda_codec.h
+++ b/include/sound/hda_codec.h
@@ -366,13 +366,6 @@ struct hda_verb {
 void snd_hda_sequence_write(struct hda_codec *codec,
 			    const struct hda_verb *seq);
 
-/* unsolicited event */
-static inline void
-snd_hda_queue_unsol_event(struct hda_bus *bus, u32 res, u32 res_ex)
-{
-	snd_hdac_bus_queue_event(&bus->core, res, res_ex);
-}
-
 /* cached write */
 static inline int
 snd_hda_codec_write_cache(struct hda_codec *codec, hda_nid_t nid,
-- 
2.16.4

