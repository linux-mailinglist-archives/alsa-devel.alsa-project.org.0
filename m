Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B157272DB6F
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 09:46:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C6D28827;
	Tue, 13 Jun 2023 09:45:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C6D28827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686642405;
	bh=luoBhyJX9uFtJUkhqjN20ezdBs42G83sLKbMhjTrvuc=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=OEYC2FJ8Fx6PdNNX94S596/IrU0ag4qTJc8d6UwGe3YBgLZF281alSOavCvA5oz66
	 kM6ELaaKxTncElRyjdEqT2/IMGW4NEMzBTc/0so3pOCKp/PqttUFJ0eno5FQRmBoja
	 ECG6qWUpihglQBgUwmS5TfHO27SlFQrZ9P0JbwBg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10163F80155; Tue, 13 Jun 2023 09:45:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id B843BF80149;
	Tue, 13 Jun 2023 09:45:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D9149F80155; Tue, 13 Jun 2023 09:45:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D2B1CF80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 09:45:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D2B1CF80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=nofkgr7W;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=jQdDjp3X
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 0BC4A1FD76;
	Tue, 13 Jun 2023 07:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686642324;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=dJgC7IJsRwZThDR+MXRBPyItHeIWZPAve8xzVWCL4AA=;
	b=nofkgr7WVYo44MkQhB5D/5stT35GW4ushSOXVFwIwRQcDHwKvjAOuUQeVnwN4aB7FNo8+n
	zOn8MnM+pC6eMxX+nkc0xNi0t3jMwdfDOihU1P9QlzvPGy5IkfcziFXOJb5jTAyg6Kpp7u
	EiuRwJQScu78OWYcvozCSSkg8+vkoqw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686642324;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=dJgC7IJsRwZThDR+MXRBPyItHeIWZPAve8xzVWCL4AA=;
	b=jQdDjp3X+OOoVnKP18S7Wq7otNDIDcV8t+BCIpB9v7+Y6rDausZKiY3Pw2z0q5wUi576Gk
	pXKHhtoTm8imgxAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CC58C13345;
	Tue, 13 Jun 2023 07:45:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id j2niMJMeiGTbHAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 07:45:23 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH] regmap: maple: Don't sync read-only registers
Date: Tue, 13 Jun 2023 09:45:11 +0200
Message-Id: <20230613074511.4476-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NMMLRE2QWBMVCMATVEU65VENFMQXH5B6
X-Message-ID-Hash: NMMLRE2QWBMVCMATVEU65VENFMQXH5B6
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/NMMLRE2QWBMVCMATVEU65VENFMQXH5B6/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

regcache_maple_sync() tries to sync all cached values no matter
whether it's writable or not.  OTOH, regache_sync_val() does care the
wrtability and returns -EIO for a read-only register.  This results in
an error message like:
  snd_hda_codec_realtek hdaudioC0D0: Unable to sync register 0x2f0009. -5
and the sync loop is aborted incompletely.

This patch adds the writable register check in the loop for addressing
the bug.

Fixes: f033c26de5a5 ("regmap: Add maple tree based register cache")
Link: https://lore.kernel.org/r/877cs7g6f1.wl-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/base/regmap/regcache-maple.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/base/regmap/regcache-maple.c b/drivers/base/regmap/regcache-maple.c
index c2e3a0f6c218..d2dad32dd399 100644
--- a/drivers/base/regmap/regcache-maple.c
+++ b/drivers/base/regmap/regcache-maple.c
@@ -203,6 +203,8 @@ static int regcache_maple_sync(struct regmap *map, unsigned int min,
 
 	mas_for_each(&mas, entry, max) {
 		for (r = max(mas.index, lmin); r <= min(mas.last, lmax); r++) {
+			if (!regmap_writeable(map, r))
+				continue;
 			mas_pause(&mas);
 			rcu_read_unlock();
 			ret = regcache_sync_val(map, r, entry[r - mas.index]);
-- 
2.35.3

