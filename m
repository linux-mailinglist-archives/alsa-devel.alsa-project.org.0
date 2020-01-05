Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D5013088B
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Jan 2020 16:07:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C30217DC;
	Sun,  5 Jan 2020 16:06:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C30217DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1578236834;
	bh=5LEn2xb4PPbH/GTZTHH6CkJTRo4dYi953JehT5PlvYs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OTVAkxZXxCnNFZXD0Lir5Lk4XYllgmLJLnqojXwmdIsngdrNCVF7Dk61v2iX8T3ev
	 bLrkP8TP+OjARkQgGUdG7PLn7h9dQYsM1lGkE4UIG0RwVviJ2P+2Yy41OzopzxOTcT
	 OopQPp22XHw9LnYSVUa7kw8xufKUjVADcVKuoY3M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6E322F802EA;
	Sun,  5 Jan 2020 15:49:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 02048F8028B; Sun,  5 Jan 2020 15:49:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 210D0F8028E
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 15:48:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 210D0F8028E
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B51A2B230
 for <alsa-devel@alsa-project.org>; Sun,  5 Jan 2020 14:48:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Date: Sun,  5 Jan 2020 15:47:36 +0100
Message-Id: <20200105144823.29547-22-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200105144823.29547-1-tiwai@suse.de>
References: <20200105144823.29547-1-tiwai@suse.de>
Subject: [alsa-devel] [PATCH 21/68] ALSA: emux: More constifications
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

Apply const prefix to each possible place: the MIDI data definitions,
the static tables for volume parameters, etc.

Just for minor optimization and no functional changes.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/synth/emux/emux_nrpn.c  |  4 ++--
 sound/synth/emux/emux_synth.c | 10 +++++-----
 sound/synth/emux/soundfont.c  |  8 ++++----
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/sound/synth/emux/emux_nrpn.c b/sound/synth/emux/emux_nrpn.c
index 1ac22676d464..7eed5791972c 100644
--- a/sound/synth/emux/emux_nrpn.c
+++ b/sound/synth/emux/emux_nrpn.c
@@ -63,7 +63,7 @@ static int send_converted_effect(const struct nrpn_conv_table *table,
 /* effect sensitivities for GS NRPN:
  *  adjusted for chaos 8MB soundfonts
  */
-static int gs_sense[] = 
+static const int gs_sense[] =
 {
 	DEF_FX_CUTOFF, DEF_FX_RESONANCE, DEF_FX_ATTACK, DEF_FX_RELEASE,
 	DEF_FX_VIBRATE, DEF_FX_VIBDEPTH, DEF_FX_VIBDELAY
@@ -72,7 +72,7 @@ static int gs_sense[] =
 /* effect sensitivies for XG controls:
  * adjusted for chaos 8MB soundfonts
  */
-static int xg_sense[] = 
+static const int xg_sense[] =
 {
 	DEF_FX_CUTOFF, DEF_FX_RESONANCE, DEF_FX_ATTACK, DEF_FX_RELEASE,
 	DEF_FX_VIBRATE, DEF_FX_VIBDEPTH, DEF_FX_VIBDELAY
diff --git a/sound/synth/emux/emux_synth.c b/sound/synth/emux/emux_synth.c
index 7c9eecd4d14e..a5385efcedb6 100644
--- a/sound/synth/emux/emux_synth.c
+++ b/sound/synth/emux/emux_synth.c
@@ -529,7 +529,7 @@ update_voice(struct snd_emux *emu, struct snd_emux_voice *vp, int update)
 
 #if 0 // not used
 /* table for volume target calculation */
-static unsigned short voltarget[16] = { 
+static const unsigned short voltarget[16] = {
 	0xEAC0, 0xE0C8, 0xD740, 0xCE20, 0xC560, 0xBD08, 0xB500, 0xAD58,
 	0xA5F8, 0x9EF0, 0x9830, 0x91C0, 0x8B90, 0x85A8, 0x8000, 0x7A90
 };
@@ -616,7 +616,7 @@ setup_voice(struct snd_emux_voice *vp)
 /*
  * calculate pitch parameter
  */
-static unsigned char pan_volumes[256] = {
+static const unsigned char pan_volumes[256] = {
 0x00,0x03,0x06,0x09,0x0c,0x0f,0x12,0x14,0x17,0x1a,0x1d,0x20,0x22,0x25,0x28,0x2a,
 0x2d,0x30,0x32,0x35,0x37,0x3a,0x3c,0x3f,0x41,0x44,0x46,0x49,0x4b,0x4d,0x50,0x52,
 0x54,0x57,0x59,0x5b,0x5d,0x60,0x62,0x64,0x66,0x68,0x6a,0x6c,0x6f,0x71,0x73,0x75,
@@ -684,7 +684,7 @@ calc_pan(struct snd_emux_voice *vp)
  */
 
 /* tables for volume->attenuation calculation */
-static unsigned char voltab1[128] = {
+static const unsigned char voltab1[128] = {
    0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63, 0x63,
    0x63, 0x2b, 0x29, 0x28, 0x27, 0x26, 0x25, 0x24, 0x23, 0x22,
    0x21, 0x20, 0x1f, 0x1e, 0x1e, 0x1d, 0x1c, 0x1b, 0x1b, 0x1a,
@@ -700,7 +700,7 @@ static unsigned char voltab1[128] = {
    0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
-static unsigned char voltab2[128] = {
+static const unsigned char voltab2[128] = {
    0x32, 0x31, 0x30, 0x2f, 0x2e, 0x2d, 0x2c, 0x2b, 0x2a, 0x2a,
    0x29, 0x28, 0x27, 0x26, 0x25, 0x24, 0x24, 0x23, 0x22, 0x21,
    0x21, 0x20, 0x1f, 0x1e, 0x1e, 0x1d, 0x1c, 0x1c, 0x1b, 0x1a,
@@ -716,7 +716,7 @@ static unsigned char voltab2[128] = {
    0x01, 0x01, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00
 };
 
-static unsigned char expressiontab[128] = {
+static const unsigned char expressiontab[128] = {
    0x7f, 0x6c, 0x62, 0x5a, 0x54, 0x50, 0x4b, 0x48, 0x45, 0x42,
    0x40, 0x3d, 0x3b, 0x39, 0x38, 0x36, 0x34, 0x33, 0x31, 0x30,
    0x2f, 0x2d, 0x2c, 0x2b, 0x2a, 0x29, 0x28, 0x27, 0x26, 0x25,
diff --git a/sound/synth/emux/soundfont.c b/sound/synth/emux/soundfont.c
index dcc6a925a03e..9ebc711afa6b 100644
--- a/sound/synth/emux/soundfont.c
+++ b/sound/synth/emux/soundfont.c
@@ -751,7 +751,7 @@ load_data(struct snd_sf_list *sflist, const void __user *data, long count)
 
 
 /* log2_tbl[i] = log2(i+128) * 0x10000 */
-static int log_tbl[129] = {
+static const int log_tbl[129] = {
 	0x70000, 0x702df, 0x705b9, 0x7088e, 0x70b5d, 0x70e26, 0x710eb, 0x713aa,
 	0x71663, 0x71918, 0x71bc8, 0x71e72, 0x72118, 0x723b9, 0x72655, 0x728ed,
 	0x72b80, 0x72e0e, 0x73098, 0x7331d, 0x7359e, 0x7381b, 0x73a93, 0x73d08,
@@ -857,7 +857,7 @@ calc_gus_envelope_time(int rate, int start, int end)
 /* convert envelope time parameter to soundfont parameters */
 
 /* attack & decay/release time table (msec) */
-static short attack_time_tbl[128] = {
+static const short attack_time_tbl[128] = {
 32767, 32767, 5989, 4235, 2994, 2518, 2117, 1780, 1497, 1373, 1259, 1154, 1058, 970, 890, 816,
 707, 691, 662, 634, 607, 581, 557, 533, 510, 489, 468, 448, 429, 411, 393, 377,
 361, 345, 331, 317, 303, 290, 278, 266, 255, 244, 234, 224, 214, 205, 196, 188,
@@ -868,7 +868,7 @@ static short attack_time_tbl[128] = {
 11, 11, 10, 10, 10, 9, 9, 8, 8, 8, 8, 7, 7, 7, 6, 0,
 };
 
-static short decay_time_tbl[128] = {
+static const short decay_time_tbl[128] = {
 32767, 32767, 22614, 15990, 11307, 9508, 7995, 6723, 5653, 5184, 4754, 4359, 3997, 3665, 3361, 3082,
 2828, 2765, 2648, 2535, 2428, 2325, 2226, 2132, 2042, 1955, 1872, 1793, 1717, 1644, 1574, 1507,
 1443, 1382, 1324, 1267, 1214, 1162, 1113, 1066, 978, 936, 897, 859, 822, 787, 754, 722,
@@ -891,7 +891,7 @@ snd_sf_calc_parm_hold(int msec)
 
 /* search an index for specified time from given time table */
 static int
-calc_parm_search(int msec, short *table)
+calc_parm_search(int msec, const short *table)
 {
 	int left = 1, right = 127, mid;
 	while (left < right) {
-- 
2.16.4

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
