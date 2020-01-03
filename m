Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 515CD12F5B5
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jan 2020 09:48:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E41631781;
	Fri,  3 Jan 2020 09:47:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E41631781
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578041316;
	bh=MomDSQ2hMVcteCxp3WbM30zPZhbfyqHHJCgIjKQV6u8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MCpm7Sr1C6UDVXGTxIGmkUofGdiXA6gHEL+jJ0zjF25+kRadoPhXCshGNYameUs1Y
	 fcIvRym9nbLME0QJLucBqw13W71cn4xZWYx58xCjA/BchwLWPv0dhAu1G5t61Gii3n
	 wiBFKCe+wr7JwFGzoALB1iq9csVg/ujQVxrNbhhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FEF3F804D6;
	Fri,  3 Jan 2020 09:19:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C700F803B1; Fri,  3 Jan 2020 09:18:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C9B7F802C4
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 09:17:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C9B7F802C4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C7339B282
 for <alsa-devel@alsa-project.org>; Fri,  3 Jan 2020 08:17:21 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Fri,  3 Jan 2020 09:17:00 +0100
Message-Id: <20200103081714.9560-45-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200103081714.9560-1-tiwai@suse.de>
References: <20200103081714.9560-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 44/58] ALSA: opl3: Constify snd_opl3_drum_voice
	definitions
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

The snd_opl3_drum_voice items are all read-only, hence they can be
declared as const.

There should be no functional changes by this patch.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/drivers/opl3/opl3_drums.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/sound/drivers/opl3/opl3_drums.c b/sound/drivers/opl3/opl3_drums.c
index cc7fb35e521b..318cd8a2ee3a 100644
--- a/sound/drivers/opl3/opl3_drums.c
+++ b/sound/drivers/opl3/opl3_drums.c
@@ -47,25 +47,25 @@ struct snd_opl3_drum_note {
 	unsigned char feedback_connection;
 };
 
-static struct snd_opl3_drum_voice bass_op0 = {6, 0, 0x00, 0x32, 0xf8, 0x66, 0x30, 0x00};
-static struct snd_opl3_drum_voice bass_op1 = {6, 1, 0x00, 0x03, 0xf6, 0x57, 0x30, 0x00};
-static struct snd_opl3_drum_note bass_note = {6, 0x90, 0x09};
+static const struct snd_opl3_drum_voice bass_op0 = {6, 0, 0x00, 0x32, 0xf8, 0x66, 0x30, 0x00};
+static const struct snd_opl3_drum_voice bass_op1 = {6, 1, 0x00, 0x03, 0xf6, 0x57, 0x30, 0x00};
+static const struct snd_opl3_drum_note bass_note = {6, 0x90, 0x09};
 
-static struct snd_opl3_drum_voice hihat = {7, 0, 0x00, 0x03, 0xf0, 0x06, 0x20, 0x00};
+static const struct snd_opl3_drum_voice hihat = {7, 0, 0x00, 0x03, 0xf0, 0x06, 0x20, 0x00};
 
-static struct snd_opl3_drum_voice snare = {7, 1, 0x00, 0x03, 0xf0, 0x07, 0x20, 0x02};
-static struct snd_opl3_drum_note snare_note = {7, 0xf4, 0x0d};
+static const struct snd_opl3_drum_voice snare = {7, 1, 0x00, 0x03, 0xf0, 0x07, 0x20, 0x02};
+static const struct snd_opl3_drum_note snare_note = {7, 0xf4, 0x0d};
 
-static struct snd_opl3_drum_voice tomtom = {8, 0, 0x02, 0x03, 0xf0, 0x06, 0x10, 0x00};
-static struct snd_opl3_drum_note tomtom_note = {8, 0xf4, 0x09};
+static const struct snd_opl3_drum_voice tomtom = {8, 0, 0x02, 0x03, 0xf0, 0x06, 0x10, 0x00};
+static const struct snd_opl3_drum_note tomtom_note = {8, 0xf4, 0x09};
 
-static struct snd_opl3_drum_voice cymbal = {8, 1, 0x04, 0x03, 0xf0, 0x06, 0x10, 0x00};
+static const struct snd_opl3_drum_voice cymbal = {8, 1, 0x04, 0x03, 0xf0, 0x06, 0x10, 0x00};
 
 /*
  * set drum voice characteristics
  */
 static void snd_opl3_drum_voice_set(struct snd_opl3 *opl3,
-				    struct snd_opl3_drum_voice *data)
+				    const struct snd_opl3_drum_voice *data)
 {
 	unsigned char op_offset = snd_opl3_regmap[data->voice][data->op];
 	unsigned char voice_offset = data->voice;
@@ -100,7 +100,7 @@ static void snd_opl3_drum_voice_set(struct snd_opl3 *opl3,
  * Set drum voice pitch
  */
 static void snd_opl3_drum_note_set(struct snd_opl3 *opl3,
-				   struct snd_opl3_drum_note *data)
+				   const struct snd_opl3_drum_note *data)
 {
 	unsigned char voice_offset = data->voice;
 	unsigned short opl3_reg;
@@ -118,7 +118,7 @@ static void snd_opl3_drum_note_set(struct snd_opl3 *opl3,
  * Set drum voice volume and position
  */
 static void snd_opl3_drum_vol_set(struct snd_opl3 *opl3,
-				  struct snd_opl3_drum_voice *data,
+				  const struct snd_opl3_drum_voice *data,
 				  int vel, struct snd_midi_channel *chan)
 {
 	unsigned char op_offset = snd_opl3_regmap[data->voice][data->op];
@@ -170,7 +170,7 @@ void snd_opl3_drum_switch(struct snd_opl3 *opl3, int note, int vel, int on_off,
 			  struct snd_midi_channel *chan)
 {
 	unsigned char drum_mask;
-	struct snd_opl3_drum_voice *drum_voice;
+	const struct snd_opl3_drum_voice *drum_voice;
 
 	if (!(opl3->drum_reg & OPL3_PERCUSSION_ENABLE))
 		return;
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
