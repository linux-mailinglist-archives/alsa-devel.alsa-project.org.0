Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A57CF6EB08A
	for <lists+alsa-devel@lfdr.de>; Fri, 21 Apr 2023 19:27:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6E05DE8D;
	Fri, 21 Apr 2023 19:26:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6E05DE8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1682098044;
	bh=UwB9BerKKhClZk7IPYcgH9+cW+u3zI8f76SJeRAYsvA=;
	h=From:To:Subject:Date:CC:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hCJ7eTrMGIC4HS1VBMxzpKjo2H7XUBv5QCS//kgWhwbogirT7SRarbC2ilr/mjOCC
	 as+W7RKmjFOn6yGrSyTAS8GKxirjrQ4CU7sFhCcWKdGcecGobCWUe7/vdskQeYA7em
	 yxAEf473sqRE+JhOR67oeagf2fSY0YSnEMZ6sO/Q=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CB345F80149;
	Fri, 21 Apr 2023 19:26:33 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44303F8019B; Fri, 21 Apr 2023 19:26:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3924DF80053
	for <alsa-devel@alsa-project.org>; Fri, 21 Apr 2023 19:26:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3924DF80053
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id F2F82240DB;
	Fri, 21 Apr 2023 13:26:23 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1ppuWd-Gcx-00; Fri, 21 Apr 2023 19:26:23 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: emu10k1: fix error codes
Date: Fri, 21 Apr 2023 19:26:23 +0200
Message-Id: <20230421172623.1017222-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BDPSGH2WTCW2DFVAELIAGYQXCOGXHGSR
X-Message-ID-Hash: BDPSGH2WTCW2DFVAELIAGYQXCOGXHGSR
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Takashi Iwai <tiwai@suse.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BDPSGH2WTCW2DFVAELIAGYQXCOGXHGSR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

One might argue that this potentially breaks user space, but a) this is
just one driver among many, so it seems unlikely that someone would
expect (only) the broken codes and b) it seems unlikely that someone
would check these syscalls for particular errors at all, rather than
just logging them (this might be debatable for the voice allocator
calls).

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 sound/pci/emu10k1/emu10k1_callback.c | 2 +-
 sound/pci/emu10k1/emufx.c            | 4 ++--
 sound/pci/emu10k1/io.c               | 2 +-
 sound/pci/emu10k1/voice.c            | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/pci/emu10k1/emu10k1_callback.c b/sound/pci/emu10k1/emu10k1_callback.c
index dba1e9fc2eec..5943747eb7db 100644
--- a/sound/pci/emu10k1/emu10k1_callback.c
+++ b/sound/pci/emu10k1/emu10k1_callback.c
@@ -106,7 +106,7 @@ snd_emu10k1_synth_get_voice(struct snd_emu10k1 *hw)
 	}
 
 	/* not found */
-	return -ENOMEM;
+	return -EBUSY;
 }
 
 
diff --git a/sound/pci/emu10k1/emufx.c b/sound/pci/emu10k1/emufx.c
index 6cf7c8b1de47..267d1bab3ee4 100644
--- a/sound/pci/emu10k1/emufx.c
+++ b/sound/pci/emu10k1/emufx.c
@@ -360,15 +360,15 @@ static int snd_emu10k1_gpr_ctl_put(struct snd_kcontrol *kcontrol, struct snd_ctl
 			break;
 		case EMU10K1_GPR_TRANSLATION_BASS:
 			if ((ctl->count % 5) != 0 || (ctl->count / 5) != ctl->vcount) {
-				change = -EIO;
+				change = -EINVAL;
 				goto __error;
 			}
 			for (j = 0; j < 5; j++)
 				snd_emu10k1_ptr_write(emu, emu->gpr_base + ctl->gpr[j * ctl->vcount + i], 0, bass_table[val][j]);
 			break;
 		case EMU10K1_GPR_TRANSLATION_TREBLE:
 			if ((ctl->count % 5) != 0 || (ctl->count / 5) != ctl->vcount) {
-				change = -EIO;
+				change = -EINVAL;
 				goto __error;
 			}
 			for (j = 0; j < 5; j++)
diff --git a/sound/pci/emu10k1/io.c b/sound/pci/emu10k1/io.c
index e15092ce9848..cfcdb33992bf 100644
--- a/sound/pci/emu10k1/io.c
+++ b/sound/pci/emu10k1/io.c
@@ -226,7 +226,7 @@ int snd_emu10k1_i2c_write(struct snd_emu10k1 *emu,
 		dev_err(emu->card->dev, "status=0x%x, reg=%d, value=%d\n",
 			status, reg, value);
 		/* dump_stack(); */
-		err = -EINVAL;
+		err = -EIO;
 	}
     
 	spin_unlock(&emu->i2c_lock);
diff --git a/sound/pci/emu10k1/voice.c b/sound/pci/emu10k1/voice.c
index cbeb8443492c..a5cb932d525a 100644
--- a/sound/pci/emu10k1/voice.c
+++ b/sound/pci/emu10k1/voice.c
@@ -70,7 +70,7 @@ static int voice_alloc(struct snd_emu10k1 *emu, int type, int number,
 	}
 	
 	if (first_voice == last_voice)
-		return -ENOMEM;
+		return -EBUSY;
 	
 	for (i = 0; i < number; i++) {
 		voice = &emu->voices[(first_voice + i) % NUM_G];
-- 
2.40.0.152.g15d061e6df

