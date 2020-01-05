Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DE1130876
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 15:55:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 49F8317A6;
	Sun,  5 Jan 2020 15:54:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 49F8317A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236131;
	bh=hytQrdjE2fL6AGuarGStzIdayG+RzaCH5L6ll/1kzhM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UAUU8TfmXkGcwCiiu46oNy36e9imFro8eeP1ya1TOxqjmuIIMLDEzyytR5J12Hj2g
	 Xop1SjbtDcXgklCAAQhvcPatxbfKt/AI7yYYJz4YmvGoZjyF6Ome36qOgpQt3q9JLR
	 ZUF/n3+Lm+cet0+AXGGF2fJD+2oSP5qUKi2W/a2k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F250EF80278;
	Sun,  5 Jan 2020 15:49:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A6522F80329; Sun,  5 Jan 2020 15:48:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AF2EF80214
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AF2EF80214
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DBB7FB181
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:31 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:21 +0100
Message-Id: <20200105144823.29547-7-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 06/68] ALSA: seq: More constifications
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

Apply const prefix to the remaining sequencer code: the static tables
for MIDI macros, RPN/NRPN, and some strings.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/core/seq/oss/seq_oss_init.c | 4 ++--
 sound/core/seq/seq_midi_emul.c    | 6 +++---
 sound/core/seq/seq_midi_event.c   | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/core/seq/oss/seq_oss_init.c b/sound/core/seq/oss/seq_oss_init.c
index 6dc94efc19c9..4534a154b8c8 100644
--- a/sound/core/seq/oss/seq_oss_init.c
+++ b/sound/core/seq/oss/seq_oss_init.c
@@ -460,10 +460,10 @@ enabled_str(int bool)
 	return bool ? "enabled" : "disabled";
 }
 
-static char *
+static const char *
 filemode_str(int val)
 {
-	static char *str[] = {
+	static const char * const str[] = {
 		"none", "read", "write", "read/write",
 	};
 	return str[val & SNDRV_SEQ_OSS_FILE_ACMODE];
diff --git a/sound/core/seq/seq_midi_emul.c b/sound/core/seq/seq_midi_emul.c
index 536ccf48ee72..198f285594e3 100644
--- a/sound/core/seq/seq_midi_emul.c
+++ b/sound/core/seq/seq_midi_emul.c
@@ -479,11 +479,11 @@ sysex(const struct snd_midi_op *ops, void *private, unsigned char *buf, int len,
       struct snd_midi_channel_set *chset)
 {
 	/* GM on */
-	static unsigned char gm_on_macro[] = {
+	static const unsigned char gm_on_macro[] = {
 		0x7e,0x7f,0x09,0x01,
 	};
 	/* XG on */
-	static unsigned char xg_on_macro[] = {
+	static const unsigned char xg_on_macro[] = {
 		0x43,0x10,0x4c,0x00,0x00,0x7e,0x00,
 	};
 	/* GS prefix
@@ -492,7 +492,7 @@ sysex(const struct snd_midi_op *ops, void *private, unsigned char *buf, int len,
 	 * chorus mode: XX=0x01, YY=0x38, ZZ=0-7
 	 * master vol:  XX=0x00, YY=0x04, ZZ=0-127
 	 */
-	static unsigned char gs_pfx_macro[] = {
+	static const unsigned char gs_pfx_macro[] = {
 		0x41,0x10,0x42,0x12,0x40,/*XX,YY,ZZ*/
 	};
 
diff --git a/sound/core/seq/seq_midi_event.c b/sound/core/seq/seq_midi_event.c
index ae0308d4ace3..7511462fe071 100644
--- a/sound/core/seq/seq_midi_event.c
+++ b/sound/core/seq/seq_midi_event.c
@@ -422,12 +422,12 @@ static int extra_decode_xrpn(struct snd_midi_event *dev, unsigned char *buf,
 			     int count, struct snd_seq_event *ev)
 {
 	unsigned char cmd;
-	char *cbytes;
-	static char cbytes_nrpn[4] = { MIDI_CTL_NONREG_PARM_NUM_MSB,
+	const char *cbytes;
+	static const char cbytes_nrpn[4] = { MIDI_CTL_NONREG_PARM_NUM_MSB,
 				       MIDI_CTL_NONREG_PARM_NUM_LSB,
 				       MIDI_CTL_MSB_DATA_ENTRY,
 				       MIDI_CTL_LSB_DATA_ENTRY };
-	static char cbytes_rpn[4] =  { MIDI_CTL_REGIST_PARM_NUM_MSB,
+	static const char cbytes_rpn[4] =  { MIDI_CTL_REGIST_PARM_NUM_MSB,
 				       MIDI_CTL_REGIST_PARM_NUM_LSB,
 				       MIDI_CTL_MSB_DATA_ENTRY,
 				       MIDI_CTL_LSB_DATA_ENTRY };
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
