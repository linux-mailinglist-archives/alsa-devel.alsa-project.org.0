Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7967A18E6
	for <lists+alsa-devel@lfdr.de>; Fri, 15 Sep 2023 10:32:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CAFEEE7B;
	Fri, 15 Sep 2023 10:31:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CAFEEE7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694766767;
	bh=wsDbFBMTFz+Lc6ursgVDfsk4MjUoL+2rYGvTHNpFXUI=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=uGkXNqDopsNnE4/HHLF7YiFQVL4505zS9pviZNeuBzxoNo0H0zMka7nvUFlyA3lm2
	 XDByJNCCt1SAe+Mfbu3zUpFRUfiT3gYcfUtUA6WKFkm8J64Uo1gYC0yTwW1IPzyjwz
	 31UXh6ySdJ3teU9LyjHeHAbVJRdWbP4mPPJ6scWc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0F805F80601; Fri, 15 Sep 2023 10:28:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 68957F805FE;
	Fri, 15 Sep 2023 10:28:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8D49BF805BE; Fri, 15 Sep 2023 10:28:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 43B9FF80552
	for <alsa-devel@alsa-project.org>; Fri, 15 Sep 2023 10:28:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 43B9FF80552
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=PIjtLIDW;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=rgE23Ob0
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CDA0621869;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1694766487; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=we74HR7Mko58cH/c/hgpuI4bnG2YbcZX/ozpb+mMKFA=;
	b=PIjtLIDW8fGPp36Kzbhe8qS4zARV03sjlbNZyDis55+2L6sL1djqFtHu5APOeFagllE5PK
	NIWEoBkvJwJfuqJzH0mzlfsHkYYpsjQEhywA98HuIM1TxeoSrGQmueXd7Sb2m5yTU7lSWr
	HD2H/XJ3THbk0P8NYsdV2YYeS9A0wcE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694766487;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=we74HR7Mko58cH/c/hgpuI4bnG2YbcZX/ozpb+mMKFA=;
	b=rgE23Ob05aSgPs6LDal/QStSDRK+uqH9h5LUZp8Qyb7wAr8R5zt8RBiL3aXflxzpfe3/PD
	GbxDiQIaF5bXsVAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B465B13A34;
	Fri, 15 Sep 2023 08:28:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id GOzQKpcVBGVfQQAAMHmgww
	(envelope-from <tiwai@suse.de>); Fri, 15 Sep 2023 08:28:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 10/13] ALSA: firewire: Fix -Wformat-truncation warning for
 longname string
Date: Fri, 15 Sep 2023 10:27:59 +0200
Message-Id: <20230915082802.28684-11-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20230915082802.28684-1-tiwai@suse.de>
References: <20230915082802.28684-1-tiwai@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6VJKTAGBK2LAJK7VQL3YAJ3OIOAHNODN
X-Message-ID-Hash: 6VJKTAGBK2LAJK7VQL3YAJ3OIOAHNODN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6VJKTAGBK2LAJK7VQL3YAJ3OIOAHNODN/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The filling of card->longname can be gracefully truncated, as it's
only informative.  Use scnprintf() and suppress the superfluous
compile warning with -Wformat-truncation.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/firewire/fireworks/fireworks.c | 10 +++++-----
 sound/firewire/oxfw/oxfw.c           | 10 +++++-----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/firewire/fireworks/fireworks.c b/sound/firewire/fireworks/fireworks.c
index dd4298876ac0..e3ed4e094ccd 100644
--- a/sound/firewire/fireworks/fireworks.c
+++ b/sound/firewire/fireworks/fireworks.c
@@ -93,11 +93,11 @@ get_hardware_info(struct snd_efw *efw)
 	strcpy(efw->card->driver, "Fireworks");
 	strcpy(efw->card->shortname, hwinfo->model_name);
 	strcpy(efw->card->mixername, hwinfo->model_name);
-	snprintf(efw->card->longname, sizeof(efw->card->longname),
-		 "%s %s v%s, GUID %08x%08x at %s, S%d",
-		 hwinfo->vendor_name, hwinfo->model_name, version,
-		 hwinfo->guid_hi, hwinfo->guid_lo,
-		 dev_name(&efw->unit->device), 100 << fw_dev->max_speed);
+	scnprintf(efw->card->longname, sizeof(efw->card->longname),
+		  "%s %s v%s, GUID %08x%08x at %s, S%d",
+		  hwinfo->vendor_name, hwinfo->model_name, version,
+		  hwinfo->guid_hi, hwinfo->guid_lo,
+		  dev_name(&efw->unit->device), 100 << fw_dev->max_speed);
 
 	if (hwinfo->flags & BIT(FLAG_RESP_ADDR_CHANGABLE))
 		efw->resp_addr_changable = true;
diff --git a/sound/firewire/oxfw/oxfw.c b/sound/firewire/oxfw/oxfw.c
index 63d40f1a914f..241a697ce26b 100644
--- a/sound/firewire/oxfw/oxfw.c
+++ b/sound/firewire/oxfw/oxfw.c
@@ -108,11 +108,11 @@ static int name_card(struct snd_oxfw *oxfw, const struct ieee1394_device_id *ent
 	strcpy(oxfw->card->mixername, m);
 	strcpy(oxfw->card->shortname, m);
 
-	snprintf(oxfw->card->longname, sizeof(oxfw->card->longname),
-		 "%s %s (OXFW%x %04x), GUID %08x%08x at %s, S%d",
-		 v, m, firmware >> 20, firmware & 0xffff,
-		 fw_dev->config_rom[3], fw_dev->config_rom[4],
-		 dev_name(&oxfw->unit->device), 100 << fw_dev->max_speed);
+	scnprintf(oxfw->card->longname, sizeof(oxfw->card->longname),
+		  "%s %s (OXFW%x %04x), GUID %08x%08x at %s, S%d",
+		  v, m, firmware >> 20, firmware & 0xffff,
+		  fw_dev->config_rom[3], fw_dev->config_rom[4],
+		  dev_name(&oxfw->unit->device), 100 << fw_dev->max_speed);
 end:
 	return err;
 }
-- 
2.35.3

