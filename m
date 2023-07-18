Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE32757F3F
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:17:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0E0C6201;
	Tue, 18 Jul 2023 16:16:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0E0C6201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689840;
	bh=kGlsNfeBpoCDoyOPY3hvtdbmI8Fc10eOhtkVtytiRCw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TsK0i58nq56EZXYtF5Hcn8jq72/drymEjBizi5CtIuF3NhTfmwAWvD8oW4ZfCldW0
	 nGC9qwTbsbhlFSMAVQsjbpRNlTyyKIwH8iKYx7tovQxJlY1TVI5xgc/Oh60eC0tT8O
	 N/lyBuT+bRyFXsQYfwKbHdHIA5HhdzlW19A/lg6U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 445E4F805F9; Tue, 18 Jul 2023 16:14:04 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 83FACF80548;
	Tue, 18 Jul 2023 16:14:03 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0CF10F805C7; Tue, 18 Jul 2023 16:13:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 35DE8F80549
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 35DE8F80549
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=u9BkKTYh;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Rr3EQJKg
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 373A21FDC0;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689689595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BcDEzrbkRqKzsapxFuOq3yrfLpAupt5MotP4t86n1fg=;
	b=u9BkKTYhFekmE7NtOaU43IGHkQTZEwCsG8M/h7OqlA+p2+Ik88dAFstLBixK43SHo5pA0Q
	GarVLlDZ6NqFETsH2hYGFNamxc7CzgzDcLTPgjcdbWwAmHt3X1qwqA04LCYY1uy5cT/lJB
	2oF/DFB+dy76WQP5Qo5FIyldJOpy+/w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BcDEzrbkRqKzsapxFuOq3yrfLpAupt5MotP4t86n1fg=;
	b=Rr3EQJKgDPW/CjTzuUkvPFAy9EHZdkKkhOgQ70EvDfuqUVPBCuwCdmMZlKpWm8d783k+3l
	6RCE+Qvt83tlgKBg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 0BF51134B0;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id YPsGAvudtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org
Subject: [PATCH 02/11] staging: greybus: audio_helper: Use snd_ctl_remove_id()
Date: Tue, 18 Jul 2023 16:12:55 +0200
Message-Id: <20230718141304.1032-3-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QL6HPIAHVBA4M5ZOMB5CZQPC7KD5IMSE
X-Message-ID-Hash: QL6HPIAHVBA4M5ZOMB5CZQPC7KD5IMSE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QL6HPIAHVBA4M5ZOMB5CZQPC7KD5IMSE/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the standard snd_ctl_remove_id() helper function instead of open
code.  This allows us to reduce the manual card->rwsem lock in the
caller side.

Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/staging/greybus/audio_helper.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 223987616e07..97ce5b9ad7fd 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -149,7 +149,6 @@ static int gbaudio_remove_controls(struct snd_card *card, struct device *dev,
 	for (i = 0; i < num_controls; i++) {
 		const struct snd_kcontrol_new *control = &controls[i];
 		struct snd_ctl_elem_id id;
-		struct snd_kcontrol *kctl;
 
 		if (prefix)
 			snprintf(id.name, sizeof(id.name), "%s %s", prefix,
@@ -161,17 +160,10 @@ static int gbaudio_remove_controls(struct snd_card *card, struct device *dev,
 		id.device = control->device;
 		id.subdevice = control->subdevice;
 		id.index = control->index;
-		kctl = snd_ctl_find_id(card, &id);
-		if (!kctl) {
-			dev_err(dev, "Failed to find %s\n", control->name);
-			continue;
-		}
-		err = snd_ctl_remove(card, kctl);
-		if (err < 0) {
+		err = snd_ctl_remove_id(card, &id);
+		if (err < 0)
 			dev_err(dev, "%d: Failed to remove %s\n", err,
 				control->name);
-			continue;
-		}
 	}
 	return 0;
 }
@@ -181,11 +173,7 @@ int gbaudio_remove_component_controls(struct snd_soc_component *component,
 				      unsigned int num_controls)
 {
 	struct snd_card *card = component->card->snd_card;
-	int err;
 
-	down_write(&card->controls_rwsem);
-	err = gbaudio_remove_controls(card, component->dev, controls,
-				      num_controls, component->name_prefix);
-	up_write(&card->controls_rwsem);
-	return err;
+	return gbaudio_remove_controls(card, component->dev, controls,
+				       num_controls, component->name_prefix);
 }
-- 
2.35.3

