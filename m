Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B69D3785D1B
	for <lists+alsa-devel@lfdr.de>; Wed, 23 Aug 2023 18:17:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 570C1827;
	Wed, 23 Aug 2023 18:16:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 570C1827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692807452;
	bh=5fZndf6YfK2lqqUxFab3fYI33QfJsRd1Af80UdkdFro=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=euVSf4fdESXTya+akMz94gq0728eXRNbkHpG4wvET9PJxULZxikLxWbFdy3URfYP6
	 NVbW68+D2b94NooHWczJPx87egqdMnYAF7/83Z4xLXa6zR4CNhyzNA8TRAieDFOx/q
	 6p6yhacvsIYcx7DY2JDFa5mbi491w1y5ftApEU2Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0912F8022B; Wed, 23 Aug 2023 18:16:41 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 664B1F800F5;
	Wed, 23 Aug 2023 18:16:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 084B0F80158; Wed, 23 Aug 2023 18:16:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9E410F80022
	for <alsa-devel@alsa-project.org>; Wed, 23 Aug 2023 18:16:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9E410F80022
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=chSJOMxd;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=iKU1PsrG
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id DEBF62093C;
	Wed, 23 Aug 2023 16:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1692807390;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=jgfpwqjllVj65xGIRdayz3qoTsi+aSSPXQvk0I2TEiE=;
	b=chSJOMxdacA1yCUofkeYmfICAXqQxa++L7DheHfKUva9HNvTJYXndwz6ZovupyWjvCNukR
	58lvUpukOvJyfKWk7aOL0minkwZDk93I8fUoGvakOm22QcogEoGkUrsKsDGRaqM9MWicba
	0rHXGSYjqb+JBAf4sStyE29nYYYr1Ak=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1692807390;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=jgfpwqjllVj65xGIRdayz3qoTsi+aSSPXQvk0I2TEiE=;
	b=iKU1PsrGDxh/zzG/jiiyolSiiZht9SovLp//S8sfjqdYfzcAJqySIArxWPh52G0w1NAFey
	YkuaH5bUBl+wFECA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BBBFE13458;
	Wed, 23 Aug 2023 16:16:30 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id MOWcLN4w5mTxPwAAMHmgww
	(envelope-from <tiwai@suse.de>); Wed, 23 Aug 2023 16:16:30 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Yano <takashi.yano@nifty.ne.jp>
Subject: [PATCH] ALSA: ymfpci: Fix the missing snd_card_free() call at probe
 error
Date: Wed, 23 Aug 2023 18:16:25 +0200
Message-Id: <20230823161625.5807-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U52R33DMG5H57W7O3BJVGL4BWP42GRWD
X-Message-ID-Hash: U52R33DMG5H57W7O3BJVGL4BWP42GRWD
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U52R33DMG5H57W7O3BJVGL4BWP42GRWD/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Like a few other drivers, YMFPCI driver needs to clean up with
snd_card_free() call at an error path of the probe; otherwise the
other devres resources are released before the card and it results in
the UAF.

This patch uses the helper for handling the probe error gracefully.

Fixes: f33fc1576757 ("ALSA: ymfpci: Create card with device-managed snd_devm_card_new()")
Cc: <stable@vger.kernel.org>
Reported-and-tested-by: Takashi Yano <takashi.yano@nifty.ne.jp>
Closes: https://lore.kernel.org/r/20230823135846.1812-1-takashi.yano@nifty.ne.jp
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/ymfpci/ymfpci.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/sound/pci/ymfpci/ymfpci.c b/sound/pci/ymfpci/ymfpci.c
index b033bd290940..48444dda44de 100644
--- a/sound/pci/ymfpci/ymfpci.c
+++ b/sound/pci/ymfpci/ymfpci.c
@@ -152,8 +152,8 @@ static inline int snd_ymfpci_create_gameport(struct snd_ymfpci *chip, int dev, i
 void snd_ymfpci_free_gameport(struct snd_ymfpci *chip) { }
 #endif /* SUPPORT_JOYSTICK */
 
-static int snd_card_ymfpci_probe(struct pci_dev *pci,
-				 const struct pci_device_id *pci_id)
+static int __snd_card_ymfpci_probe(struct pci_dev *pci,
+				   const struct pci_device_id *pci_id)
 {
 	static int dev;
 	struct snd_card *card;
@@ -348,6 +348,12 @@ static int snd_card_ymfpci_probe(struct pci_dev *pci,
 	return 0;
 }
 
+static int snd_card_ymfpci_probe(struct pci_dev *pci,
+				 const struct pci_device_id *pci_id)
+{
+	return snd_card_free_on_error(&pci->dev, __snd_card_ymfpci_probe(pci, pci_id));
+}
+
 static struct pci_driver ymfpci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = snd_ymfpci_ids,
-- 
2.35.3

