Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A0939F884
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Jun 2021 16:11:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A8F991736;
	Tue,  8 Jun 2021 16:10:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A8F991736
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623161490;
	bh=14jP5jddyB48X39alTroo9ykaGEgrVE8RJlUwv5Z/zw=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=f6Xf9cTdT2y8zST6FduNJrU3MbeQCmGCeplogRFqP/wG9gRlFIZUvQ+YsicydThHl
	 SrL9y0z7Thnip5EHk9WFCxEdSat81OUEc4Bco6hTVx3a32SPZ9E6kcJNjRjFxSNZo6
	 U2iFzAvI3xl50CCARKSbdc1KQQ0FbuFbslSU5iQg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 58F5AF8057D;
	Tue,  8 Jun 2021 16:06:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF056F804C2; Tue,  8 Jun 2021 16:06:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 08FBEF804C1
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 16:05:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 08FBEF804C1
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="FySVDpYg"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="HnZq+Lsm"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 9987C1FD4B
 for <alsa-devel@alsa-project.org>; Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623161142; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zqVC2xuRnBWCO44luoZ+mUvshtShSe+5Y9DTqvWzOYI=;
 b=FySVDpYgC0NEcTTof5UW9oQkOGV+0IIz9dOx9GKfd1FoqCaZbGuw0+6Jg3CyJ+XYx+afMk
 2z9/4YB/KVx9T65Av2i91sZuO5XrCxP4JJUN04rvlwyQYxXTRVX6x9z1VpiRBtCYfay63R
 EsLotxxgqCGr+eFgUm4YEwP8J6XMpwc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623161142;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zqVC2xuRnBWCO44luoZ+mUvshtShSe+5Y9DTqvWzOYI=;
 b=HnZq+LsmUO1KSRzmbZI+CAxJdT7itUIgTeeLgvi3/fOejWeEFMpyzMwRtrhurGESsO9fUb
 ALAOEqdF8NJqVvDQ==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 8A5A7A3B85;
 Tue,  8 Jun 2021 14:05:42 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 02/66] ALSA: sb: Minor coding style fixes
Date: Tue,  8 Jun 2021 16:04:36 +0200
Message-Id: <20210608140540.17885-3-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210608140540.17885-1-tiwai@suse.de>
References: <20210608140540.17885-1-tiwai@suse.de>
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

The handling of snd_ctl_new1() and snd_ctl_add() can be sometimes
tricky, as snd_ctl_add() automatically removes the passed object at
its error path.  The recent fix addressed an overlooked issue that is
relevant with that in SB driver code, and it can be a bit more
simplified by assigning to a temporary variable, i.e. storing to the
struct field only after the creation succeeds.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/isa/sb/emu8000.c  | 10 +++++-----
 sound/isa/sb/sb16_csp.c | 19 +++++++++----------
 2 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/sound/isa/sb/emu8000.c b/sound/isa/sb/emu8000.c
index 896a862a9f9c..5e4187940265 100644
--- a/sound/isa/sb/emu8000.c
+++ b/sound/isa/sb/emu8000.c
@@ -1020,6 +1020,7 @@ static const struct snd_kcontrol_new *mixer_defs[EMU8000_NUM_CONTROLS] = {
 static int
 snd_emu8000_create_mixer(struct snd_card *card, struct snd_emu8000 *emu)
 {
+	struct snd_kcontrol *kctl;
 	int i, err = 0;
 
 	if (snd_BUG_ON(!emu || !card))
@@ -1029,12 +1030,11 @@ snd_emu8000_create_mixer(struct snd_card *card, struct snd_emu8000 *emu)
 
 	memset(emu->controls, 0, sizeof(emu->controls));
 	for (i = 0; i < EMU8000_NUM_CONTROLS; i++) {
-		emu->controls[i] = snd_ctl_new1(mixer_defs[i], emu);
-		err = snd_ctl_add(card, emu->controls[i]);
-		if (err < 0) {
-			emu->controls[i] = NULL;
+		kctl = snd_ctl_new1(mixer_defs[i], emu);
+		err = snd_ctl_add(card, kctl);
+		if (err < 0)
 			goto __error;
-		}
+		emu->controls[i] = kctl;
 	}
 	return 0;
 
diff --git a/sound/isa/sb/sb16_csp.c b/sound/isa/sb/sb16_csp.c
index d6ce6b16421c..dec68ae6b599 100644
--- a/sound/isa/sb/sb16_csp.c
+++ b/sound/isa/sb/sb16_csp.c
@@ -1036,6 +1036,7 @@ static const struct snd_kcontrol_new snd_sb_qsound_space = {
 static int snd_sb_qsound_build(struct snd_sb_csp * p)
 {
 	struct snd_card *card;
+	struct snd_kcontrol *kctl;
 	int err;
 
 	if (snd_BUG_ON(!p))
@@ -1047,18 +1048,16 @@ static int snd_sb_qsound_build(struct snd_sb_csp * p)
 
 	spin_lock_init(&p->q_lock);
 
-	p->qsound_switch = snd_ctl_new1(&snd_sb_qsound_switch, p);
-	err = snd_ctl_add(card, p->qsound_switch);
-	if (err < 0) {
-		p->qsound_switch = NULL;
+	kctl = snd_ctl_new1(&snd_sb_qsound_switch, p);
+	err = snd_ctl_add(card, kctl);
+	if (err < 0)
 		goto __error;
-	}
-	p->qsound_space = snd_ctl_new1(&snd_sb_qsound_space, p);
-	err = snd_ctl_add(card, p->qsound_space);
-	if (err < 0) {
-		p->qsound_space = NULL;
+	p->qsound_switch = kctl;
+	kctl = snd_ctl_new1(&snd_sb_qsound_space, p);
+	err = snd_ctl_add(card, kctl);
+	if (err < 0)
 		goto __error;
-	}
+	p->qsound_space = kctl;
 
 	return 0;
 
-- 
2.26.2

