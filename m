Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B4775A90B
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Jul 2023 10:23:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 662A4203;
	Thu, 20 Jul 2023 10:22:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 662A4203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689841381;
	bh=HQlTMk0Z1K9Qkrg1H/Tfhp/RLCfyzJI/kjA7oAgjWiQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AlGp1uA4hv9hY5b/fJvssbFLPoEeZwkcujlOdpIZ/4YHXoj/+ExPILNFkF3P7165H
	 iQGIA2wWe+BwU4Dz1F2atbKg1Bs0i4QbHJLOCIIidDA48vwRcN85k2nSUAFdJ9xndm
	 gC/kV5E6DCb/otCbN1eMNW42gI+G8pDZTFDo1dQU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 685C4F800D2; Thu, 20 Jul 2023 10:21:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id ECCBFF80548;
	Thu, 20 Jul 2023 10:21:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 99B77F8057B; Thu, 20 Jul 2023 10:21:22 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 86C50F80563
	for <alsa-devel@alsa-project.org>; Thu, 20 Jul 2023 10:21:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 86C50F80563
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=c9vjqDTn;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=GxUjEbrM
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EF25620599;
	Thu, 20 Jul 2023 08:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1689841275;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OxGSFeOvASua+zngCw7ZinrgYKEkfs0LHfbTvB1Kl1M=;
	b=c9vjqDTnKd0pFdyhUR5GEkC4wycwwJeI0O/CjG8J37Y5IfZMkpoFbckw9vUMHIyyPSsVfn
	JjWMC0j+gL97l8Hx0nXxdge2Yyx5JT9qy+zutblABJeVTf9xhOlAcQP/v6clarn7a/0ias
	CIoM8Un8MrPQTNRumIEU1Dhj4tX26w8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1689841275;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OxGSFeOvASua+zngCw7ZinrgYKEkfs0LHfbTvB1Kl1M=;
	b=GxUjEbrMIZ8FPn4TQ47f0kUD10YAAyf9B5C2rB5pRRlqxfqKWYmgykMDF10Y0G8dTAybHY
	R3TDjLe03FiptiCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id D07CD13924;
	Thu, 20 Jul 2023 08:21:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id 2KQAMnvuuGQmIgAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 20 Jul 2023 08:21:15 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 03/11] ALSA: cs46xx: Simplify with snd_ctl_find_id_mixer()
Date: Thu, 20 Jul 2023 10:21:00 +0200
Message-Id: <20230720082108.31346-4-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230720082108.31346-1-tiwai@suse.de>
References: <20230720082108.31346-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RB7ASXZTWBMVFCYTHZ4DHEB3XOS34GP3
X-Message-ID-Hash: RB7ASXZTWBMVFCYTHZ4DHEB3XOS34GP3
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RB7ASXZTWBMVFCYTHZ4DHEB3XOS34GP3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Replace an open code with the new snd_ctl_find_id_mixer().
There is no functional change.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/cs46xx/cs46xx_lib.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/sound/pci/cs46xx/cs46xx_lib.c b/sound/pci/cs46xx/cs46xx_lib.c
index 7d882b33d45e..f3a94bb537bd 100644
--- a/sound/pci/cs46xx/cs46xx_lib.c
+++ b/sound/pci/cs46xx/cs46xx_lib.c
@@ -2449,7 +2449,6 @@ static int cs46xx_detect_codec(struct snd_cs46xx *chip, int codec)
 int snd_cs46xx_mixer(struct snd_cs46xx *chip, int spdif_device)
 {
 	struct snd_card *card = chip->card;
-	struct snd_ctl_elem_id id;
 	int err;
 	unsigned int idx;
 	static const struct snd_ac97_bus_ops ops = {
@@ -2490,10 +2489,8 @@ int snd_cs46xx_mixer(struct snd_cs46xx *chip, int spdif_device)
 	}
 
 	/* get EAPD mixer switch (for voyetra hack) */
-	memset(&id, 0, sizeof(id));
-	id.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
-	strcpy(id.name, "External Amplifier");
-	chip->eapd_switch = snd_ctl_find_id(chip->card, &id);
+	chip->eapd_switch = snd_ctl_find_id_mixer(chip->card,
+						  "External Amplifier");
     
 #ifdef CONFIG_SND_CS46XX_NEW_DSP
 	if (chip->nr_ac97_codecs == 1) {
-- 
2.35.3

