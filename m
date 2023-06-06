Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 630EF723912
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Jun 2023 09:32:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 696F574C;
	Tue,  6 Jun 2023 09:31:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 696F574C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686036758;
	bh=pnk+J89QyyLyRpXwEpwkJMg5QXlI37KK5cJBeGoYbCE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=UQ0kpY2J3tpJKA2SJwUkk6qyxwLhkn/HUnoo/kTxvEcBta91ZFJW7cW8yxEtCfLqZ
	 v6gKV7SK6qECtC2Qc8UyxPCzxNkPR7acHYc6/PoxO+S0y1MV07ZSQPexci5oj6Odwt
	 ITOYl8g2PHfDNFSha61DEvccWteg8uIB4Lq4sc58=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A3E80F8016C; Tue,  6 Jun 2023 09:31:47 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 36BFCF8016C;
	Tue,  6 Jun 2023 09:31:47 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5BD8F80199; Tue,  6 Jun 2023 09:31:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 375F8F80155
	for <alsa-devel@alsa-project.org>; Tue,  6 Jun 2023 09:31:38 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
	by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id F0CDF11D5;
	Tue,  6 Jun 2023 09:31:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz F0CDF11D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
	t=1686036698; bh=8VveHbqQMbyf8zZ0BzVRyXQgM22C9L7YcuHFCnwePrU=;
	h=From:To:Cc:Subject:Date:From;
	b=Rzy6M2Sng8VXb1W7lQDZ37NuRs2LzqifHl16fVLGSxHSh+yKY7eH4FJWaRLk4vEOn
	 AX51DlQ05VnHRJGLtGJ9uRD6c+3x6CMpRZ5c8h0k3TkTBEdBKxjNla5qzblFsueIeQ
	 XZlzcgeZ1qkfFSt6eNaHnR1G/pVNBEF6aFuCCLGU=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: perex)
	by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
	Tue,  6 Jun 2023 09:31:32 +0200 (CEST)
From: Jaroslav Kysela <perex@perex.cz>
To: ALSA development <alsa-devel@alsa-project.org>
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>,
	stable@kernel.org,
	Martin Zidek <zidek@master.cz>
Subject: [PATCH] ALSA: ice1712,ice1724: fix the kcontrol->id initialization
Date: Tue,  6 Jun 2023 09:31:22 +0200
Message-Id: <20230606073122.597491-1-perex@perex.cz>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7VKM56UJC2ON7QHGU7A6EBUMSTPYDXUX
X-Message-ID-Hash: 7VKM56UJC2ON7QHGU7A6EBUMSTPYDXUX
X-MailFrom: perex@perex.cz
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7VKM56UJC2ON7QHGU7A6EBUMSTPYDXUX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The new xarray lookup code requires to know complete kcontrol->id before
snd_ctl_add() call. Reorder the code to make the initialization properly.

Cc: stable@kernel.org # v5.19+
Reported-by: Martin Zidek <zidek@master.cz>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
---
 sound/pci/ice1712/aureon.c  |  7 ++++---
 sound/pci/ice1712/ice1712.c | 14 +++++++++-----
 sound/pci/ice1712/ice1724.c | 16 ++++++++++------
 3 files changed, 23 insertions(+), 14 deletions(-)

diff --git a/sound/pci/ice1712/aureon.c b/sound/pci/ice1712/aureon.c
index 24b978234000..027849329c1b 100644
--- a/sound/pci/ice1712/aureon.c
+++ b/sound/pci/ice1712/aureon.c
@@ -1899,11 +1899,12 @@ static int aureon_add_controls(struct snd_ice1712 *ice)
 		else {
 			for (i = 0; i < ARRAY_SIZE(cs8415_controls); i++) {
 				struct snd_kcontrol *kctl;
-				err = snd_ctl_add(ice->card, (kctl = snd_ctl_new1(&cs8415_controls[i], ice)));
-				if (err < 0)
-					return err;
+				kctl = snd_ctl_new1(&cs8415_controls[i], ice);
 				if (i > 1)
 					kctl->id.device = ice->pcm->device;
+				err = snd_ctl_add(ice->card, kctl);
+				if (err < 0)
+					return err;
 			}
 		}
 	}
diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index a5241a287851..3b0c3e70987b 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2371,22 +2371,26 @@ int snd_ice1712_spdif_build_controls(struct snd_ice1712 *ice)
 
 	if (snd_BUG_ON(!ice->pcm_pro))
 		return -EIO;
-	err = snd_ctl_add(ice->card, kctl = snd_ctl_new1(&snd_ice1712_spdif_default, ice));
+	kctl = snd_ctl_new1(&snd_ice1712_spdif_default, ice);
+	kctl->id.device = ice->pcm_pro->device;
+	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
 		return err;
+	kctl = snd_ctl_new1(&snd_ice1712_spdif_maskc, ice);
 	kctl->id.device = ice->pcm_pro->device;
-	err = snd_ctl_add(ice->card, kctl = snd_ctl_new1(&snd_ice1712_spdif_maskc, ice));
+	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
 		return err;
+	kctl = snd_ctl_new1(&snd_ice1712_spdif_maskp, ice);
 	kctl->id.device = ice->pcm_pro->device;
-	err = snd_ctl_add(ice->card, kctl = snd_ctl_new1(&snd_ice1712_spdif_maskp, ice));
+	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
 		return err;
+	kctl = snd_ctl_new1(&snd_ice1712_spdif_stream, ice);
 	kctl->id.device = ice->pcm_pro->device;
-	err = snd_ctl_add(ice->card, kctl = snd_ctl_new1(&snd_ice1712_spdif_stream, ice));
+	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
 		return err;
-	kctl->id.device = ice->pcm_pro->device;
 	ice->spdif.stream_ctl = kctl;
 	return 0;
 }
diff --git a/sound/pci/ice1712/ice1724.c b/sound/pci/ice1712/ice1724.c
index 6fab2ad85bbe..1dc776acd637 100644
--- a/sound/pci/ice1712/ice1724.c
+++ b/sound/pci/ice1712/ice1724.c
@@ -2392,23 +2392,27 @@ static int snd_vt1724_spdif_build_controls(struct snd_ice1712 *ice)
 	if (err < 0)
 		return err;
 
-	err = snd_ctl_add(ice->card, kctl = snd_ctl_new1(&snd_vt1724_spdif_default, ice));
+	kctl = snd_ctl_new1(&snd_vt1724_spdif_default, ice);
+	kctl->id.device = ice->pcm->device;
+	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
 		return err;
+	kctl = snd_ctl_new1(&snd_vt1724_spdif_maskc, ice);
 	kctl->id.device = ice->pcm->device;
-	err = snd_ctl_add(ice->card, kctl = snd_ctl_new1(&snd_vt1724_spdif_maskc, ice));
+	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
 		return err;
+	kctl = snd_ctl_new1(&snd_vt1724_spdif_maskp, ice);
 	kctl->id.device = ice->pcm->device;
-	err = snd_ctl_add(ice->card, kctl = snd_ctl_new1(&snd_vt1724_spdif_maskp, ice));
+	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
 		return err;
-	kctl->id.device = ice->pcm->device;
 #if 0 /* use default only */
-	err = snd_ctl_add(ice->card, kctl = snd_ctl_new1(&snd_vt1724_spdif_stream, ice));
+	kctl = snd_ctl_new1(&snd_vt1724_spdif_stream, ice);
+	kctl->id.device = ice->pcm->device;
+	err = snd_ctl_add(ice->card, kctl);
 	if (err < 0)
 		return err;
-	kctl->id.device = ice->pcm->device;
 	ice->spdif.stream_ctl = kctl;
 #endif
 	return 0;
-- 
2.39.2

