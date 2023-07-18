Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A33E9757F27
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Jul 2023 16:14:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2D1AC7F4;
	Tue, 18 Jul 2023 16:13:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2D1AC7F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689689676;
	bh=lLp7LLXFq7MRazfH9fG1dA+xE5w2ax3Wk7zQovIODms=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uyyKcrSM55FHBFzujgyrYO8rchJQX6qK0Lyn6NU4LQv9CD63FjIh+u/q1FkFL7TPg
	 fLBU2I0Z12DoEfvwbP6pi2QCyN6ZWiIZudjhRfZJtmtueYTon6DGWZrYkv9COkSHnx
	 +QYHfXs6WfWbx6NLYabVKYNpK4f/NRJPNPv+Vuw0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DC8F7F80563; Tue, 18 Jul 2023 16:13:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 102B5F80579;
	Tue, 18 Jul 2023 16:13:28 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C7E83F80563; Tue, 18 Jul 2023 16:13:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 06B2AF80544
	for <alsa-devel@alsa-project.org>; Tue, 18 Jul 2023 16:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06B2AF80544
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=bMf2eveH;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UdOYBKAD
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5C6C41FDC3;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689689595;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=On66QN7Earu9wC0sV3IhAtvpUbvW9S11tlof5z9D4OU=;
	b=bMf2eveHsTmUD/itk5ZPI5t7XHqBl6BxLeqyTSXb6ZjLQll4Wjm3ms8FUp17pgO9zFf7PP
	FT5rGM1qLREEAcBq5UQH/pciKK0BqyQQddQByXgoqipJ+mdafuE7vdLZGFUF6wwqBDm/GG
	qUflubi/WhDpFortfe1rO9bHRpkROTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689689595;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=On66QN7Earu9wC0sV3IhAtvpUbvW9S11tlof5z9D4OU=;
	b=UdOYBKADpaM/zb9aVlBJv+lYdvj084nGxe1XMhdrz7ntCsycrnlbb8vl3cewwj2WvMWBde
	cgnoFVDIXtrw71Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3AA62138EC;
	Tue, 18 Jul 2023 14:13:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id yHZ3DfudtmQ8AQAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 18 Jul 2023 14:13:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH 03/11] ASoC: atmel: mchp-pdmc: Use snd_ctl_remove_id()
Date: Tue, 18 Jul 2023 16:12:56 +0200
Message-Id: <20230718141304.1032-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230718141304.1032-1-tiwai@suse.de>
References: <20230718141304.1032-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DHU4CE6TUAVX64ER3E544GEWM5VLURX2
X-Message-ID-Hash: DHU4CE6TUAVX64ER3E544GEWM5VLURX2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DHU4CE6TUAVX64ER3E544GEWM5VLURX2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Use the standard snd_ctl_remove_id() helper instead of open code for
removing a kctl.  This helps for avoiding possible races.

Cc: Claudiu Beznea <claudiu.beznea@microchip.com>
Cc: Mark Brown <broonie@kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/soc/atmel/mchp-pdmc.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index c79c73e6791e..1a069f4cdcda 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -386,7 +386,6 @@ static int mchp_pdmc_open(struct snd_soc_component *component,
 	for (i = 0; i < ARRAY_SIZE(mchp_pdmc_snd_controls); i++) {
 		const struct snd_kcontrol_new *control = &mchp_pdmc_snd_controls[i];
 		struct snd_ctl_elem_id id;
-		struct snd_kcontrol *kctl;
 		int err;
 
 		if (component->name_prefix)
@@ -400,17 +399,10 @@ static int mchp_pdmc_open(struct snd_soc_component *component,
 		id.device = control->device;
 		id.subdevice = control->subdevice;
 		id.index = control->index;
-		kctl = snd_ctl_find_id(component->card->snd_card, &id);
-		if (!kctl) {
-			dev_err(component->dev, "Failed to find %s\n", control->name);
-			continue;
-		}
-		err = snd_ctl_remove(component->card->snd_card, kctl);
-		if (err < 0) {
+		err = snd_ctl_remove_id(component->card->snd_card, &id);
+		if (err < 0)
 			dev_err(component->dev, "%d: Failed to remove %s\n", err,
 				control->name);
-			continue;
-		}
 	}
 
 	return 0;
-- 
2.35.3

