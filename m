Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EB21308A5
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:19:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 22AB51810;
	Sun,  5 Jan 2020 16:18:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 22AB51810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578237556;
	bh=CiFByOchg7hcqioGy9UxO260imf7Pzj44IYmWYzyXjU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ZhEB3RpKcXZv3BG+F3mU6bSBd54JE0DoUz78nivznVvSNzqVtg5dXAx8Re2DEPE+S
	 j50uI6svUEsqInEC3dgD95KL8d71+rD+fUP3JM5ZXZ9J2Y0nnxkbFPiH/n2+9nEb4A
	 /PyjjgEw5YzmYSnqs22yz4gcgBbtJMKQa0yoqoSo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8F26EF804D2;
	Sun,  5 Jan 2020 15:50:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7B657F80393; Sun,  5 Jan 2020 15:49:38 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1109DF802BD
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1109DF802BD
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A5124B2BB
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:33 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:57 +0100
Message-Id: <20200105144823.29547-43-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 42/68] ALSA: opl3: More constifications
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

Apply const prefix to the static tables for drum, volume and notes.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/opl3/opl3_drums.c | 2 +-
 sound/drivers/opl3/opl3_midi.c  | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/drivers/opl3/opl3_drums.c b/sound/drivers/opl3/opl3_drums.c
index 318cd8a2ee3a..ccc49f39404d 100644
--- a/sound/drivers/opl3/opl3_drums.c
+++ b/sound/drivers/opl3/opl3_drums.c
@@ -7,7 +7,7 @@
 
 #include "opl3_voice.h"
 
-static char snd_opl3_drum_table[47] =
+static const char snd_opl3_drum_table[47] =
 {
 	OPL3_BASSDRUM_ON,  OPL3_BASSDRUM_ON,  OPL3_HIHAT_ON,	/* 35 - 37 */
 	OPL3_SNAREDRUM_ON, OPL3_HIHAT_ON,     OPL3_SNAREDRUM_ON, /* 38 - 40 */
diff --git a/sound/drivers/opl3/opl3_midi.c b/sound/drivers/opl3/opl3_midi.c
index 280cc79870cf..2f6e8023e05c 100644
--- a/sound/drivers/opl3/opl3_midi.c
+++ b/sound/drivers/opl3/opl3_midi.c
@@ -23,7 +23,7 @@ static void snd_opl3_note_off_unsafe(void *p, int note, int vel,
  * it saves a lot of log() calculations. (Rob Hooft <hooft@chem.ruu.nl>)
  */
 
-static char opl3_volume_table[128] =
+static const char opl3_volume_table[128] =
 {
 	-63, -48, -40, -35, -32, -29, -27, -26,
 	-24, -23, -21, -20, -19, -18, -18, -17,
@@ -69,7 +69,7 @@ void snd_opl3_calc_volume(unsigned char *volbyte, int vel,
 /*
  * Converts the note frequency to block and fnum values for the FM chip
  */
-static short opl3_note_table[16] =
+static const short opl3_note_table[16] =
 {
 	305, 323,	/* for pitch bending, -2 semitones */
 	343, 363, 385, 408, 432, 458, 485, 514, 544, 577, 611, 647,
@@ -266,7 +266,7 @@ static void snd_opl3_start_timer(struct snd_opl3 *opl3)
 /* ------------------------------ */
 
 
-static int snd_opl3_oss_map[MAX_OPL3_VOICES] = {
+static const int snd_opl3_oss_map[MAX_OPL3_VOICES] = {
 	0, 1, 2, 9, 10, 11, 6, 7, 8, 15, 16, 17, 3, 4 ,5, 12, 13, 14
 };
 
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
