Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AA0757F2D
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:15:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 00678A4D;
	Tue, 18 Jul 2023 16:14:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 00678A4D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689723;
	bh=jMcaqMvtelif2rc0BP/Jg3iyn1T7ZYfxR8k1L++gSIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=T3oGbKz7cXc6XLxk7MKGFXQXtuVnvdhEaJvmE9x2Xw5EFf3Oc55/rflHDcgCb7AjL
	 w4hvaymQ3NOdrpp6LTMfpyFRYbQsYfOvA857Xe1CJynufYeGUIkCMn300F5sEmMA1l
	 E1uN4ijqzUvcfJImrKO3DkfLOE1wudtwNdNQNi00=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BA0EAF805AF; Tue, 18 Jul 2023 16:13:43 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C21CF80520;
	Tue, 18 Jul 2023 16:13:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B1CE8F8057E; Tue, 18 Jul 2023 16:13:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DAC31F80553
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:13:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DAC31F80553
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=BCk5X7H0;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=+R09Rnok
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D3DA82191A;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689689595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nMxjF4QiWmENq+vWzZ8quubwayGSLdwjgpDFbtrSo7Q=;
	b=BCk5X7H0idm78PN1Z81i0BMNGz8zjo9gFjSzcOLjFgKEIdph5sYzWFFN0Q5sqT7EMzV6Zn
	SdXg9Kq/RzIOuwMOOeabtznsC5YYRKoXESefBK7xkUUikCQYnKjTQ4Rj7wB665TcNZEg/l
	2HIBwZFPk50sxHtaf/gGLJkJCebDZZ8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nMxjF4QiWmENq+vWzZ8quubwayGSLdwjgpDFbtrSo7Q=;
	b=+R09Rnokl3uo0KaPsr6dzz6thOpK0VAbtp6zKRpjp/6zHm6mz58w06psDb26YYah5dRpIa
	a1UX5kogvCbFsUAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A0986134B0;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id EH5GJvudtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Lars-Peter Clausen <lars@metafoo.de>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 06/11] ASoC: sigmadsp: Simplify with snd_ctl_activate_id()
Date: Tue, 18 Jul 2023 16:12:59 +0200
Message-Id: <20230718141304.1032-7-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: UHSR4TLFWONUDHZQKHGQMGW5OXPM4WES
X-Message-ID-Hash: UHSR4TLFWONUDHZQKHGQMGW5OXPM4WES
X-MailFrom: tiwai@suse.de
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UHSR4TLFWONUDHZQKHGQMGW5OXPM4WES/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the standard snd_ctl_activate_id() helper instead of an open code
for code simplification.

Cc: Lars-Peter Clausen <lars@metafoo.de>
Cc: "Nuno Sá" <nuno.sa@analog.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/codecs/sigmadsp.c | 25 ++++---------------------
 1 file changed, 4 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index 3047a6fbb380..b93c078a8040 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -669,36 +669,19 @@ static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
 	struct sigmadsp_control *ctrl, unsigned int samplerate_mask)
 {
 	struct snd_card *card = sigmadsp->component->card->snd_card;
-	struct snd_kcontrol_volatile *vd;
-	struct snd_ctl_elem_id id;
 	bool active;
-	bool changed = false;
+	int changed;
 
 	active = sigmadsp_samplerate_valid(ctrl->samplerates, samplerate_mask);
-
-	down_write(&card->controls_rwsem);
-	if (!ctrl->kcontrol) {
-		up_write(&card->controls_rwsem);
+	if (!ctrl->kcontrol)
 		return;
-	}
-
-	id = ctrl->kcontrol->id;
-	vd = &ctrl->kcontrol->vd[0];
-	if (active == (bool)(vd->access & SNDRV_CTL_ELEM_ACCESS_INACTIVE)) {
-		vd->access ^= SNDRV_CTL_ELEM_ACCESS_INACTIVE;
-		changed = true;
-	}
-	up_write(&card->controls_rwsem);
-
-	if (active && changed) {
+	changed = snd_ctl_activate_id(card, &ctrl->kcontrol->id, active);
+	if (active && changed > 0) {
 		mutex_lock(&sigmadsp->lock);
 		if (ctrl->cached)
 			sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
 		mutex_unlock(&sigmadsp->lock);
 	}
-
-	if (changed)
-		snd_ctl_notify(card, SNDRV_CTL_EVENT_MASK_INFO, &id);
 }
 
 /**
-- 
2.35.3

