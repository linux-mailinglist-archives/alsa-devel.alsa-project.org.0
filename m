Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF3F781F00
	for <lists+alsa-devel@lfdr.de>; Sun, 20 Aug 2023 19:28:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BBE773E8;
	Sun, 20 Aug 2023 19:27:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BBE773E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692552479;
	bh=E+rG+y3KyQjwb92YcmTkoKd81VxV1fBXQjjzli7dc+Y=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=hSDBdEXHUZbDzx6XJu8qwZWIPYQC2fKp/6ncnCgSrBVulk48a1guRsxK0hFdUG7xH
	 Fvoz231/Jnp1IhiWY8HN7UeovUhw2jMc16JqyncleHyRwIXGWejckAAYgN2BgoJAqn
	 GkXJNTi+JWnTb5YHkenqFP4h2skSzzbfVu8VChUM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 14032F80508; Sun, 20 Aug 2023 19:26:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 81DDFF8016C;
	Sun, 20 Aug 2023 19:26:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F16DF8025E; Sun, 20 Aug 2023 19:26:44 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id A51FFF80027
	for <alsa-devel@alsa-project.org>; Sun, 20 Aug 2023 19:26:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A51FFF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=oQvDLt2s;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=HqLrW5gE
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id CBB3521EA0;
	Sun, 20 Aug 2023 17:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692552398;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=PoZC8rXPlgPkYbuTVDflly5I84x5NCR4lZUzklACRKk=;
	b=oQvDLt2s/aFt9KisfN33bw4vqBq0o1sy6JNWTUJ6Sav/fdQQzeTLP3VnR6JyslHptL4X/L
	1dhkiHiSlSvFB6a2Xp0rjeGOJQdoydJyS1B8sWoxMNi5sXTf10B1lyCWMoXL3jFsPF2Mfp
	dW3nbUc2UCULzFgGf8hlO3nn3OLH7b0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692552398;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=PoZC8rXPlgPkYbuTVDflly5I84x5NCR4lZUzklACRKk=;
	b=HqLrW5gEtMTtjRO1Vf4qAWriO881MLBaPSZMs5wKoqDdsyhDrsPh5VSRf/fMXA7yf8iEUE
	HjHyJPFePjMf58Cw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id A32EF133F7;
	Sun, 20 Aug 2023 17:26:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id bk7UJs5M4mTjZgAAMHmgww
	(envelope-from <tiwai@suse.de>); Sun, 20 Aug 2023 17:26:38 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Shenghao Ding <shenghao-ding@ti.com>
Subject: [PATCH 1/2] ALSA: hda/tas2781: Fix acpi device refcount leak at
 tas2781_read_acpi()
Date: Sun, 20 Aug 2023 19:26:34 +0200
Message-Id: <20230820172635.22236-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DDD5BI4JJ2AEZ5XAVOZSDJ2WXZPZM6V4
X-Message-ID-Hash: DDD5BI4JJ2AEZ5XAVOZSDJ2WXZPZM6V4
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DDD5BI4JJ2AEZ5XAVOZSDJ2WXZPZM6V4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The error path at tas2781_read_acpi() doesn't release the acpi_device
adev but releases another device physdev instead.  This results in a
refcount leak.  Fix it by replacing with the right object.

Fixes: 5be27f1e3ec9 ("ALSA: hda/tas2781: Add tas2781 HDA driver")
Reported-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Closes: https://lore.kernel.org/r/9f910785-e856-1539-e3e4-c9817af5fe67@linux.intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/tas2781_hda_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/tas2781_hda_i2c.c b/sound/pci/hda/tas2781_hda_i2c.c
index 35dafc4aec4f..0968ae915fd0 100644
--- a/sound/pci/hda/tas2781_hda_i2c.c
+++ b/sound/pci/hda/tas2781_hda_i2c.c
@@ -118,7 +118,7 @@ static int tas2781_read_acpi(struct tasdevice_priv *p, const char *hid)
 
 err:
 	dev_err(p->dev, "read acpi error, ret: %d\n", ret);
-	put_device(physdev);
+	acpi_dev_put(adev);
 
 	return ret;
 }
-- 
2.35.3

