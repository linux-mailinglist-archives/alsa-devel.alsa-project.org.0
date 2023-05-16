Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DDE0704976
	for <lists+alsa-devel@lfdr.de>; Tue, 16 May 2023 11:38:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 716B81E2;
	Tue, 16 May 2023 11:37:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 716B81E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684229926;
	bh=Ab7b2aE+4/bPoWZgUzUZmhtvq0/+Q1dhRt9tQ/P1ox8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=a49heq3ItANvcFDLZdpd5Zrq3I30lVCbwTV7vPnBh+nDFipfhZBFsEfgc0LA4jExq
	 qubhdLPYMzGLO1Ciy7QEnyXwuKkx7yQYB9cU7bGjq/1yBgv6xiPWgNKZLx9EpZYQ1B
	 KJsVYFT7SAau/h5bcCdHwOu6g2yQISuJAn7x7OL8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD965F805B4; Tue, 16 May 2023 11:36:40 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CE6EAF80549;
	Tue, 16 May 2023 11:36:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9D430F8025A; Tue, 16 May 2023 11:36:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C7170F8053D
	for <alsa-devel@alsa-project.org>; Tue, 16 May 2023 11:36:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C7170F8053D
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id DD50B2428F;
	Tue, 16 May 2023 05:36:12 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pyr6K-q0M-00; Tue, 16 May 2023 11:36:12 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 6/6] ALSA: emu10k1: factor out
 snd_emu10k1_compose_audigy_sendamounts()
Date: Tue, 16 May 2023 11:36:12 +0200
Message-Id: <20230516093612.3536451-7-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230516093612.3536451-1-oswald.buddenhagen@gmx.de>
References: <20230516093612.3536451-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DAU6QSAEQZQUORIMOIUZDJFVYEO3OWDN
X-Message-ID-Hash: DAU6QSAEQZQUORIMOIUZDJFVYEO3OWDN
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DAU6QSAEQZQUORIMOIUZDJFVYEO3OWDN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Saves a bit of code duplication.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 include/sound/emu10k1.h      | 3 +++
 sound/pci/emu10k1/emumixer.c | 7 ++-----
 sound/pci/emu10k1/emupcm.c   | 5 +----
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/include/sound/emu10k1.h b/include/sound/emu10k1.h
index 5c1e5b123362..456af84735a8 100644
--- a/include/sound/emu10k1.h
+++ b/include/sound/emu10k1.h
@@ -1501,6 +1501,9 @@ struct snd_emu10k1_pcm_mixer {
 #define snd_emu10k1_compose_audigy_fxrt2(route) \
 ((unsigned int)route[4] | ((unsigned int)route[5] << 8) | ((unsigned int)route[6] << 16) | ((unsigned int)route[7] << 24))
 
+#define snd_emu10k1_compose_audigy_sendamounts(vol) \
+(((unsigned int)vol[4] << 24) | ((unsigned int)vol[5] << 16) | ((unsigned int)vol[6] << 8) | (unsigned int)vol[7])
+
 struct snd_emu10k1_memblk {
 	struct snd_util_memblk mem;
 	/* private part */
diff --git a/sound/pci/emu10k1/emumixer.c b/sound/pci/emu10k1/emumixer.c
index e067a4066cda..1ebf161d410e 100644
--- a/sound/pci/emu10k1/emumixer.c
+++ b/sound/pci/emu10k1/emumixer.c
@@ -1196,11 +1196,8 @@ static void update_emu10k1_send_volume(struct snd_emu10k1 *emu, int voice, unsig
 	snd_emu10k1_ptr_write(emu, PSST_FXSENDAMOUNT_C, voice, volume[2]);
 	snd_emu10k1_ptr_write(emu, DSL_FXSENDAMOUNT_D, voice, volume[3]);
 	if (emu->audigy) {
-		unsigned int val = ((unsigned int)volume[4] << 24) |
-			((unsigned int)volume[5] << 16) |
-			((unsigned int)volume[6] << 8) |
-			(unsigned int)volume[7];
-		snd_emu10k1_ptr_write(emu, A_SENDAMOUNTS, voice, val);
+		snd_emu10k1_ptr_write(emu, A_SENDAMOUNTS, voice,
+				      snd_emu10k1_compose_audigy_sendamounts(volume));
 	}
 }
 
diff --git a/sound/pci/emu10k1/emupcm.c b/sound/pci/emu10k1/emupcm.c
index 4ade0ef2cd1b..d669f93d8930 100644
--- a/sound/pci/emu10k1/emupcm.c
+++ b/sound/pci/emu10k1/emupcm.c
@@ -316,10 +316,7 @@ static void snd_emu10k1_pcm_init_voice(struct snd_emu10k1 *emu,
 		snd_emu10k1_ptr_write(emu, A_FXRT2, voice,
 				      snd_emu10k1_compose_audigy_fxrt2(send_routing));
 		snd_emu10k1_ptr_write(emu, A_SENDAMOUNTS, voice,
-				      ((unsigned int)send_amount[4] << 24) |
-				      ((unsigned int)send_amount[5] << 16) |
-				      ((unsigned int)send_amount[6] << 8) |
-				      (unsigned int)send_amount[7]);
+				      snd_emu10k1_compose_audigy_sendamounts(send_amount));
 	} else
 		snd_emu10k1_ptr_write(emu, FXRT, voice,
 				      snd_emu10k1_compose_send_routing(send_routing));
-- 
2.40.0.152.g15d061e6df

