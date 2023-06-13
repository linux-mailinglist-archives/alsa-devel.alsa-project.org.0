Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8B272E15D
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Jun 2023 13:23:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 410FB84D;
	Tue, 13 Jun 2023 13:22:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 410FB84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686655420;
	bh=RVB0o1oT1l6+9nQIA3SpC/xS2Ycy8JwZsQTSNH+WKXE=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=FirIx0RkoQIRvNwk7D9HjGCjjFi2+fWJOrYoCyJ2ZaiLIfZWAF+5U34hihPVmjGF+
	 VAepLYYIMUTF0Ffzb3nPteqlmc9WMabzjYEhzyW/A+A/o06t8WTArDoAB3RygZMfdt
	 EwcSnE2nFctvgzBV+w5LM8oKfYbCHSSRB+43dmyk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D2822F80533; Tue, 13 Jun 2023 13:22:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 63D86F80132;
	Tue, 13 Jun 2023 13:22:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7C16DF80149; Tue, 13 Jun 2023 13:22:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2001:67c:2178:6::1d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 1DFE7F80093
	for <alsa-devel@alsa-project.org>; Tue, 13 Jun 2023 13:22:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1DFE7F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=ejablnhw;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=XjSaphVl
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 9611F1FD8F;
	Tue, 13 Jun 2023 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686655362;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=sO60fsV+XdP0/uve4cp5yDDKZqVuceLf/J7QE90gvx4=;
	b=ejablnhwvL4lTGlWKUz3ffv4cDRlSuI9FS31tOH+oWSfCENaycQFl4IN5rPjKR0KWtl2zf
	Qikby3IYbqxRff4+pFPs+hSL0eLCPHC1E0sdMQXoQJ9Os38jX8xHJS4n8mzQ74A+J9Q2QN
	sYQafm6AO/SkpgIm1drAKldyAmshZwk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686655362;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=sO60fsV+XdP0/uve4cp5yDDKZqVuceLf/J7QE90gvx4=;
	b=XjSaphVlBL6b0B4XsnfWafGKd/gGG/alhSDI7S2B9X0E+Jwai6Pwq7wfPwxH1/hBtxsgTG
	HBZ9YplLhokcUeDg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 7109013483;
	Tue, 13 Jun 2023 11:22:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id Lb22GoJRiGS5EAAAMHmgww
	(envelope-from <tiwai@suse.de>); Tue, 13 Jun 2023 11:22:42 +0000
From: Takashi Iwai <tiwai@suse.de>
To: Mark Brown <broonie@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org
Subject: [PATCH v2] regmap: regcache: Don't sync read-only registers
Date: Tue, 13 Jun 2023 13:22:40 +0200
Message-Id: <20230613112240.3361-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YQBAZIJU5NBSGP3N4WGZQ4O535PKBWMI
X-Message-ID-Hash: YQBAZIJU5NBSGP3N4WGZQ4O535PKBWMI
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/YQBAZIJU5NBSGP3N4WGZQ4O535PKBWMI/>
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

This patch adds the writable register check to regcache_sync_val() for
addressing the bug above.

Note that, although we may add the check in the caller side
(regcache_maple_sync()), here we put in regcache_sync_val(), so that a
similar case like this can be avoided in future.

Fixes: f033c26de5a5 ("regmap: Add maple tree based register cache")
Link: https://lore.kernel.org/r/877cs7g6f1.wl-tiwai@suse.de
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/base/regmap/regcache.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 029564695dbb..97c681fcf9f6 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -284,6 +284,9 @@ static bool regcache_reg_needs_sync(struct regmap *map, unsigned int reg,
 {
 	int ret;
 
+	if (!regmap_writeable(map, reg))
+		return false;
+
 	/* If we don't know the chip just got reset, then sync everything. */
 	if (!map->no_sync_defaults)
 		return true;
-- 
2.35.3

