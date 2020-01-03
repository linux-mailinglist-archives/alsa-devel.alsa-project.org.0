Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 160CD12F597
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:40:17 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A40911762;
	Fri,  3 Jan 2020 09:39:26 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A40911762
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578040816;
	bh=KS8kVIuzZkUNz+hs2qne/xRUy5d5r9jFFd6OPItyLhI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fc1Yb6D3od4kZMT4OHc5Ye4x3fxwnZn6RckgraqHtxYmazMK7Xi0lJslc5dL22Y8F
	 qQxnuiGFQ9JEIabqyAAnRqHod0uvJGUPdYCZVlLnJdq3dm99tDOTQC7l/gfGIBVfoQ
	 QtYtkJhb/kYwHrpDetDv0VYiqeSbpF/Bkc80+Jik=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12DC4F803FE;
	Fri,  3 Jan 2020 09:19:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 59CE0F8028F; Fri,  3 Jan 2020 09:18:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 64684F80290
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 64684F80290
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0CC71B271
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:16:45 +0100
Message-Id: <20200103081714.9560-30-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 29/58] ALSA: seq: Constify struct snd_midi_op
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

Change the argument of snd_midi_process_event() to receive a const
snd_midi_op pointer and its callers respectively.  This allows further
optimizations.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 include/sound/seq_midi_emul.h   |  3 ++-
 sound/core/seq/seq_midi_emul.c  | 37 ++++++++++++++++++++++---------------
 sound/drivers/opl3/opl3_seq.c   |  2 +-
 sound/drivers/opl3/opl3_voice.h |  2 +-
 sound/drivers/opl4/opl4_seq.c   |  2 +-
 sound/synth/emux/emux_seq.c     |  2 +-
 6 files changed, 28 insertions(+), 20 deletions(-)

diff --git a/include/sound/seq_midi_emul.h b/include/sound/seq_midi_emul.h
index d6b74059b4b1..88799d1e1f53 100644
--- a/include/sound/seq_midi_emul.h
+++ b/include/sound/seq_midi_emul.h
@@ -174,7 +174,8 @@ enum {
 };
 
 /* Prototypes for midi_process.c */
-void snd_midi_process_event(struct snd_midi_op *ops, struct snd_seq_event *ev,
+void snd_midi_process_event(const struct snd_midi_op *ops,
+			    struct snd_seq_event *ev,
 			    struct snd_midi_channel_set *chanset);
 void snd_midi_channel_set_clear(struct snd_midi_channel_set *chset);
 struct snd_midi_channel_set *snd_midi_channel_alloc_set(int n);
diff --git a/sound/core/seq/seq_midi_emul.c b/sound/core/seq/seq_midi_emul.c
index 770d3f4eee7c..536ccf48ee72 100644
--- a/sound/core/seq/seq_midi_emul.c
+++ b/sound/core/seq/seq_midi_emul.c
@@ -30,22 +30,25 @@ MODULE_DESCRIPTION("Advanced Linux Sound Architecture sequencer MIDI emulation."
 MODULE_LICENSE("GPL");
 
 /* Prototypes for static functions */
-static void note_off(struct snd_midi_op *ops, void *drv,
+static void note_off(const struct snd_midi_op *ops, void *drv,
 		     struct snd_midi_channel *chan,
 		     int note, int vel);
-static void do_control(struct snd_midi_op *ops, void *private,
+static void do_control(const struct snd_midi_op *ops, void *private,
 		       struct snd_midi_channel_set *chset,
 		       struct snd_midi_channel *chan,
 		       int control, int value);
-static void rpn(struct snd_midi_op *ops, void *drv, struct snd_midi_channel *chan,
+static void rpn(const struct snd_midi_op *ops, void *drv,
+		struct snd_midi_channel *chan,
 		struct snd_midi_channel_set *chset);
-static void nrpn(struct snd_midi_op *ops, void *drv, struct snd_midi_channel *chan,
+static void nrpn(const struct snd_midi_op *ops, void *drv,
+		 struct snd_midi_channel *chan,
 		 struct snd_midi_channel_set *chset);
-static void sysex(struct snd_midi_op *ops, void *private, unsigned char *sysex,
+static void sysex(const struct snd_midi_op *ops, void *private,
+		  unsigned char *sysex,
 		  int len, struct snd_midi_channel_set *chset);
-static void all_sounds_off(struct snd_midi_op *ops, void *private,
+static void all_sounds_off(const struct snd_midi_op *ops, void *private,
 			   struct snd_midi_channel *chan);
-static void all_notes_off(struct snd_midi_op *ops, void *private,
+static void all_notes_off(const struct snd_midi_op *ops, void *private,
 			  struct snd_midi_channel *chan);
 static void snd_midi_reset_controllers(struct snd_midi_channel *chan);
 static void reset_all_channels(struct snd_midi_channel_set *chset);
@@ -66,7 +69,7 @@ static void reset_all_channels(struct snd_midi_channel_set *chset);
  *        be interpreted.
  */
 void
-snd_midi_process_event(struct snd_midi_op *ops,
+snd_midi_process_event(const struct snd_midi_op *ops,
 		       struct snd_seq_event *ev,
 		       struct snd_midi_channel_set *chanset)
 {
@@ -229,7 +232,8 @@ EXPORT_SYMBOL(snd_midi_process_event);
  * release note
  */
 static void
-note_off(struct snd_midi_op *ops, void *drv, struct snd_midi_channel *chan,
+note_off(const struct snd_midi_op *ops, void *drv,
+	 struct snd_midi_channel *chan,
 	 int note, int vel)
 {
 	if (chan->gm_hold) {
@@ -251,7 +255,8 @@ note_off(struct snd_midi_op *ops, void *drv, struct snd_midi_channel *chan,
  * events that need to take place immediately to the driver.
  */
 static void
-do_control(struct snd_midi_op *ops, void *drv, struct snd_midi_channel_set *chset,
+do_control(const struct snd_midi_op *ops, void *drv,
+	   struct snd_midi_channel_set *chset,
 	   struct snd_midi_channel *chan, int control, int value)
 {
 	int  i;
@@ -402,7 +407,7 @@ EXPORT_SYMBOL(snd_midi_channel_set_clear);
  * Process a rpn message.
  */
 static void
-rpn(struct snd_midi_op *ops, void *drv, struct snd_midi_channel *chan,
+rpn(const struct snd_midi_op *ops, void *drv, struct snd_midi_channel *chan,
     struct snd_midi_channel_set *chset)
 {
 	int type;
@@ -442,7 +447,7 @@ rpn(struct snd_midi_op *ops, void *drv, struct snd_midi_channel *chan,
  * Process an nrpn message.
  */
 static void
-nrpn(struct snd_midi_op *ops, void *drv, struct snd_midi_channel *chan,
+nrpn(const struct snd_midi_op *ops, void *drv, struct snd_midi_channel *chan,
      struct snd_midi_channel_set *chset)
 {
 	/* parse XG NRPNs here if possible */
@@ -470,7 +475,7 @@ get_channel(unsigned char cmd)
  * Process a sysex message.
  */
 static void
-sysex(struct snd_midi_op *ops, void *private, unsigned char *buf, int len,
+sysex(const struct snd_midi_op *ops, void *private, unsigned char *buf, int len,
       struct snd_midi_channel_set *chset)
 {
 	/* GM on */
@@ -584,7 +589,8 @@ sysex(struct snd_midi_op *ops, void *private, unsigned char *buf, int len,
  * all sound off
  */
 static void
-all_sounds_off(struct snd_midi_op *ops, void *drv, struct snd_midi_channel *chan)
+all_sounds_off(const struct snd_midi_op *ops, void *drv,
+	       struct snd_midi_channel *chan)
 {
 	int n;
 
@@ -602,7 +608,8 @@ all_sounds_off(struct snd_midi_op *ops, void *drv, struct snd_midi_channel *chan
  * all notes off
  */
 static void
-all_notes_off(struct snd_midi_op *ops, void *drv, struct snd_midi_channel *chan)
+all_notes_off(const struct snd_midi_op *ops, void *drv,
+	      struct snd_midi_channel *chan)
 {
 	int n;
 
diff --git a/sound/drivers/opl3/opl3_seq.c b/sound/drivers/opl3/opl3_seq.c
index 20f2f5125394..cd2a01b5e2e1 100644
--- a/sound/drivers/opl3/opl3_seq.c
+++ b/sound/drivers/opl3/opl3_seq.c
@@ -128,7 +128,7 @@ static int snd_opl3_synth_unuse(void *private_data, struct snd_seq_port_subscrib
 /*
  * MIDI emulation operators
  */
-struct snd_midi_op opl3_ops = {
+const struct snd_midi_op opl3_ops = {
 	.note_on =		snd_opl3_note_on,
 	.note_off =		snd_opl3_note_off,
 	.key_press =		snd_opl3_key_press,
diff --git a/sound/drivers/opl3/opl3_voice.h b/sound/drivers/opl3/opl3_voice.h
index dc0626a2dd61..be9ccca2d952 100644
--- a/sound/drivers/opl3/opl3_voice.h
+++ b/sound/drivers/opl3/opl3_voice.h
@@ -41,6 +41,6 @@ void snd_opl3_free_seq_oss(struct snd_opl3 *opl3);
 
 extern char snd_opl3_regmap[MAX_OPL2_VOICES][4];
 extern bool use_internal_drums;
-extern struct snd_midi_op opl3_ops;
+extern const struct snd_midi_op opl3_ops;
 
 #endif
diff --git a/sound/drivers/opl4/opl4_seq.c b/sound/drivers/opl4/opl4_seq.c
index 03d6202f4829..f59ca660c616 100644
--- a/sound/drivers/opl4/opl4_seq.c
+++ b/sound/drivers/opl4/opl4_seq.c
@@ -100,7 +100,7 @@ static int snd_opl4_seq_unuse(void *private_data, struct snd_seq_port_subscribe
 	return 0;
 }
 
-static struct snd_midi_op opl4_ops = {
+static const struct snd_midi_op opl4_ops = {
 	.note_on =		snd_opl4_note_on,
 	.note_off =		snd_opl4_note_off,
 	.note_terminate =	snd_opl4_terminate_note,
diff --git a/sound/synth/emux/emux_seq.c b/sound/synth/emux/emux_seq.c
index 9d8a69f1a644..b227c7e0bc2a 100644
--- a/sound/synth/emux/emux_seq.c
+++ b/sound/synth/emux/emux_seq.c
@@ -19,7 +19,7 @@ static int snd_emux_unuse(void *private_data, struct snd_seq_port_subscribe *inf
 /*
  * MIDI emulation operators
  */
-static struct snd_midi_op emux_ops = {
+static const struct snd_midi_op emux_ops = {
 	.note_on = snd_emux_note_on,
 	.note_off = snd_emux_note_off,
 	.key_press = snd_emux_key_press,
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
