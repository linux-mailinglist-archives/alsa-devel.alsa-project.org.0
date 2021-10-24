Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD24387A6
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Oct 2021 10:33:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4B3A0166B;
	Sun, 24 Oct 2021 10:32:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4B3A0166B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1635064409;
	bh=UOB5yj5+/U2kDusxmo4YqOcuGUJHpbmQOW/oHsurAtY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZbrXlI8NTEMDtmEEDdsCNFVB0Eg5B0j283kPZCaQYhAm/VgBuvLWvNWoCI8Q73kBJ
	 cQky2o3dGVZyV5suioZUXkBRuYM0gt6UlMjJoUFLjqblGcJqsCfuzn4ClNXLS7zveS
	 LN88yl7JtUXFwqJGQAv/9o2UTmpv5bsXtAgV8jsg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 821A1F80086;
	Sun, 24 Oct 2021 10:32:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9520EF802E7; Sun, 24 Oct 2021 10:32:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1723F80166
 for <alsa-devel@alsa-project.org>; Sun, 24 Oct 2021 10:32:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1723F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="EmHVtcPt"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="ndno4+GU"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 48127A1A3D405;
 Sun, 24 Oct 2021 10:32:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1635064322; bh=UOB5yj5+/U2kDusxmo4YqOcuGUJHpbmQOW/oHsurAtY=;
 h=From:To:Cc:Subject:Date:From;
 b=EmHVtcPttCU10ovJjduS9xUQFz035VYlFtQLkMlvQfqfGaA3EBep5jfW6EThyCFH2
 dKScOXKHcCUvkMpxifInU9roCB4qv2KFV6UGkkD9ANaLDXbDUHhFdeogXQpPVp2O8s
 3B1hE4SjLQ3+6AqeTnX0wxXKq/3TL+pzLLDmUQW8=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KvguibhTrETL; Sun, 24 Oct 2021 10:31:56 +0200 (CEST)
Received: from precision.doma (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 9D706A1A3D403;
 Sun, 24 Oct 2021 10:31:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1635064316; bh=UOB5yj5+/U2kDusxmo4YqOcuGUJHpbmQOW/oHsurAtY=;
 h=From:To:Cc:Subject:Date:From;
 b=ndno4+GUrL/SZRMHHFI9GLX2oOPA4SVpT1OkXnRR0eZ3/NRws5qHoIu5CGM9QGzAh
 NpJ6OsSB9Z6KAc6fUa6G7vK5ej6oL97w4TMDXbXwPRiWXdfCqJtyNUYamsy+D6/GsP
 TtmS0/vRhVOXkX/orkvgetFXTdEuXRKLsN7Z++wA=
From: Pavel Hofman <pavel.hofman@ivitera.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH 1/2] alsaloop: Renamed field capt_pitch to ctl_pitch
Date: Sun, 24 Oct 2021 10:31:54 +0200
Message-Id: <20211024083156.4743-1-pavel.hofman@ivitera.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Pavel Hofman <pavel.hofman@ivitera.com>
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

Renaming capt_pitch to ctl_pitch to respect the naming style of
snd_ctl_elem_value_t fields in loopback_handle. Also making the variable
name suitable for planned support of playback pitch.

Signed-off-by: Pavel Hofman <pavel.hofman@ivitera.com>
---
 alsaloop/alsaloop.h |  2 +-
 alsaloop/pcmjob.c   | 16 ++++++++--------
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/alsaloop/alsaloop.h b/alsaloop/alsaloop.h
index 7a98ef3..a5539ef 100644
--- a/alsaloop/alsaloop.h
+++ b/alsaloop/alsaloop.h
@@ -122,7 +122,7 @@ struct loopback_handle {
 	unsigned int ctl_pollfd_count;
 	snd_ctl_elem_value_t *ctl_notify;
 	snd_ctl_elem_value_t *ctl_rate_shift;
-	snd_ctl_elem_value_t *capt_pitch;
+	snd_ctl_elem_value_t *ctl_pitch;
 	snd_ctl_elem_value_t *ctl_active;
 	snd_ctl_elem_value_t *ctl_format;
 	snd_ctl_elem_value_t *ctl_rate;
diff --git a/alsaloop/pcmjob.c b/alsaloop/pcmjob.c
index 13fa595..7b47c40 100644
--- a/alsaloop/pcmjob.c
+++ b/alsaloop/pcmjob.c
@@ -1063,9 +1063,9 @@ static int set_rate_shift(struct loopback_handle *lhandle, double pitch)
 	if (lhandle->ctl_rate_shift) {
 		snd_ctl_elem_value_set_integer(lhandle->ctl_rate_shift, 0, pitch * 100000);
 		err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_rate_shift);
-	} else if (lhandle->capt_pitch) {
-		snd_ctl_elem_value_set_integer(lhandle->capt_pitch, 0, (1 / pitch) * 1000000);
-		err = snd_ctl_elem_write(lhandle->ctl, lhandle->capt_pitch);
+	} else if (lhandle->ctl_pitch) {
+		snd_ctl_elem_value_set_integer(lhandle->ctl_pitch, 0, (1 / pitch) * 1000000);
+		err = snd_ctl_elem_write(lhandle->ctl, lhandle->ctl_pitch);
 	} else {
 		return 0;
 	}
@@ -1252,7 +1252,7 @@ static int openctl(struct loopback_handle *lhandle, int device, int subdevice)
 	openctl_elem(lhandle, device, subdevice, "PCM Rate Shift 100000",
 			&lhandle->ctl_rate_shift);
 	openctl_elem(lhandle, device, subdevice, "Capture Pitch 1000000",
-			&lhandle->capt_pitch);
+			&lhandle->ctl_pitch);
 	set_rate_shift(lhandle, 1);
 	openctl_elem(lhandle, device, subdevice, "PCM Slave Active",
 			&lhandle->ctl_active);
@@ -1338,9 +1338,9 @@ static int closeit(struct loopback_handle *lhandle)
 	if (lhandle->ctl_rate_shift)
 		snd_ctl_elem_value_free(lhandle->ctl_rate_shift);
 	lhandle->ctl_rate_shift = NULL;
-	if (lhandle->capt_pitch)
-		snd_ctl_elem_value_free(lhandle->capt_pitch);
-	lhandle->capt_pitch = NULL;
+	if (lhandle->ctl_pitch)
+		snd_ctl_elem_value_free(lhandle->ctl_pitch);
+	lhandle->ctl_pitch = NULL;
 	if (lhandle->ctl)
 		err = snd_ctl_close(lhandle->ctl);
 	lhandle->ctl = NULL;
@@ -1386,7 +1386,7 @@ int pcmjob_init(struct loopback *loop)
 	snprintf(id, sizeof(id), "%s/%s", loop->play->id, loop->capt->id);
 	id[sizeof(id)-1] = '\0';
 	loop->id = strdup(id);
-	if (loop->sync == SYNC_TYPE_AUTO && (loop->capt->ctl_rate_shift || loop->capt->capt_pitch))
+	if (loop->sync == SYNC_TYPE_AUTO && (loop->capt->ctl_rate_shift || loop->capt->ctl_pitch))
 		loop->sync = SYNC_TYPE_CAPTRATESHIFT;
 	if (loop->sync == SYNC_TYPE_AUTO && loop->play->ctl_rate_shift)
 		loop->sync = SYNC_TYPE_PLAYRATESHIFT;
-- 
2.25.1

