Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA0312F595
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:39:00 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3D187176D;
	Fri,  3 Jan 2020 09:38:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3D187176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040740;
	bh=eu6weXSOr97qIQt5rhiVQHFLC980dIbjNtbyUB5nVcM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZSjdKPvmNFFvnMzNqMELPDWnibndBBhDMuBz7lsqn+ZpdATB0TGvuxqHfL1L0HZvE
	 mI3czozjgKvMqqf3dxeYTOONQmJjMrVnK7PYGC0ZYUWoJKAyMxEny8LXgBLSbbv89g
	 0f3hoZ7UWho57QW/tj4EPLuxpjN4/3ngRikCOW9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCAE6F803EB;
	Fri,  3 Jan 2020 09:19:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5316CF802C2; Fri,  3 Jan 2020 09:18:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E411F8028A
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E411F8028A
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 29FA8B273
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:47 +0100
Message-Id: <20200103081714.9560-32-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 31/58] ALSA: mixer: oss: Constify
	snd_mixer_oss_assign_table definition
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

The snd_mixer_oss_assign_table is read-only, and can it be declared as
const.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/oss/mixer_oss.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/sound/core/oss/mixer_oss.c b/sound/core/oss/mixer_oss.c
index 7eb54df5556d..26502294f7d8 100644
--- a/sound/core/oss/mixer_oss.c
+++ b/sound/core/oss/mixer_oss.c
@@ -486,7 +486,7 @@ struct slot {
 	unsigned int channels;
 	unsigned int numid[SNDRV_MIXER_OSS_ITEM_COUNT];
 	unsigned int capture_item;
-	struct snd_mixer_oss_assign_table *assigned;
+	const struct snd_mixer_oss_assign_table *assigned;
 	unsigned int allocated: 1;
 };
 
@@ -934,8 +934,8 @@ static void snd_mixer_oss_slot_free(struct snd_mixer_oss_slot *chn)
 	struct slot *p = chn->private_data;
 	if (p) {
 		if (p->allocated && p->assigned) {
-			kfree(p->assigned->name);
-			kfree(p->assigned);
+			kfree_const(p->assigned->name);
+			kfree_const(p->assigned);
 		}
 		kfree(p);
 	}
@@ -953,7 +953,7 @@ static void mixer_slot_clear(struct snd_mixer_oss_slot *rslot)
 /* In a separate function to keep gcc 3.2 happy - do NOT merge this in
    snd_mixer_oss_build_input! */
 static int snd_mixer_oss_build_test_all(struct snd_mixer_oss *mixer,
-					struct snd_mixer_oss_assign_table *ptr,
+					const struct snd_mixer_oss_assign_table *ptr,
 					struct slot *slot)
 {
 	char str[64];
@@ -1017,7 +1017,9 @@ static int snd_mixer_oss_build_test_all(struct snd_mixer_oss *mixer,
  * ptr_allocated means the entry is dynamically allocated (change via proc file).
  * when replace_old = 1, the old entry is replaced with the new one.
  */
-static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer, struct snd_mixer_oss_assign_table *ptr, int ptr_allocated, int replace_old)
+static int snd_mixer_oss_build_input(struct snd_mixer_oss *mixer,
+				     const struct snd_mixer_oss_assign_table *ptr,
+				     int ptr_allocated, int replace_old)
 {
 	struct slot slot;
 	struct slot *pslot;
@@ -1255,7 +1257,7 @@ static void snd_mixer_oss_proc_done(struct snd_mixer_oss *mixer)
 
 static void snd_mixer_oss_build(struct snd_mixer_oss *mixer)
 {
-	static struct snd_mixer_oss_assign_table table[] = {
+	static const struct snd_mixer_oss_assign_table table[] = {
 		{ SOUND_MIXER_VOLUME, 	"Master",		0 },
 		{ SOUND_MIXER_VOLUME, 	"Front",		0 }, /* fallback */
 		{ SOUND_MIXER_BASS,	"Tone Control - Bass",	0 },
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
