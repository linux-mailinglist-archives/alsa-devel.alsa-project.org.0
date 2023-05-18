Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD47707F86
	for <lists+alsa-devel@lfdr.de>; Thu, 18 May 2023 13:36:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 660311FC;
	Thu, 18 May 2023 13:35:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 660311FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1684409796;
	bh=p6PARSnMdN+UWVhSRjG/Tgv7CPxTBGT9c/3LcRpTdSU=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=ok0HHMtM2BliOFdoOHiCcM1uUSXupuWk5wr1Z5MzXVIiTOWCceDtvDTysj49WXTRF
	 oxlFt4TGfqpsIO6J75ch3wpUgxantvDUothp0XBpGf59Sgs7lMgtCqltCrCUv7KAez
	 ZgnzzazITt6oQhrnC3YSE+Uie3K/9RGAPCvMkWNE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B8B0CF8025A; Thu, 18 May 2023 13:35:45 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 51610F8016D;
	Thu, 18 May 2023 13:35:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E197F8025A; Thu, 18 May 2023 13:35:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 66CD5F80087
	for <alsa-devel@alsa-project.org>; Thu, 18 May 2023 13:35:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 66CD5F80087
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=AHwW7rFN;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=pk/imkMn
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id DF0532257C;
	Thu, 18 May 2023 11:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1684409731;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mWMLj8sia/uQ58kY3nWU7AbK19MIe+WyGo4FE1ik5zo=;
	b=AHwW7rFNuIElxiGJDaZGGowdeVl5Cw9ZcSY5yCRv8vv6he2sknbntlWa5e4T/siv2hFtH8
	IO1M2PV+NB2y2esmGKtAbA+Q/0ynpLRvELfhnpJISwfjff0DlFxQbAkBYUgVa/tsBv7Tzf
	i3YtfsTKBHlHjq6RK70HqhywXn9IchU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1684409731;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mWMLj8sia/uQ58kY3nWU7AbK19MIe+WyGo4FE1ik5zo=;
	b=pk/imkMnb5oZ75PtaWBIZiPSdOtSX8rico6JkBmo0aGHATG6Qjoqq/ieBW7qMYBIS3HhXY
	Utd3v3l79kY8K0Dw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B9820138F5;
	Thu, 18 May 2023 11:35:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id +V4ELIMNZmQREAAAMHmgww
	(envelope-from <tiwai@suse.de>); Thu, 18 May 2023 11:35:31 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Cc: =?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] ALSA: hda: Fix unhandled register update during auto-suspend
 period
Date: Thu, 18 May 2023 13:35:20 +0200
Message-Id: <20230518113520.15213-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I3ZL6QSMNP5DI7BUOCHGCBRMEB6ZGVBK
X-Message-ID-Hash: I3ZL6QSMNP5DI7BUOCHGCBRMEB6ZGVBK
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3ZL6QSMNP5DI7BUOCHGCBRMEB6ZGVBK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

It's reported that the recording started right after the driver probe
doesn't work properly, and it turned out that this is related with the
codec auto-suspend.  Namely, after the probe phase, the usage count
goes zero, and the auto-suspend is programmed, but the codec is kept
still active until the auto-suspend expiration.  When an application
(e.g. alsactl) updates the mixer values at this moment, the values are
cached but not actually written.  Then, starting arecord thereafter
also results in the silence because of the missing unmute.

The root cause is the handling of "lazy update" mode; when a mixer
value is updated *after* the suspend, it should update only the cache
and exits.  At the resume, the cached value is written to the device,
in turn.  The problem is that the current code misinterprets the state
of auto-suspend as if it were already suspended.

Although we can add the check of the actual device state after
pm_runtime_get_if_in_use() for catching the missing state, this won't
suffice; the second call of regmap_update_bits_check() will skip
writing the register because the cache has been already updated by the
first call.  So we'd need fixes in two different places.

OTOH, a simpler fix is to replace pm_runtime_get_if_in_use() with
pm_runtime_get_if_active() (with ign_usage_count=true).  This change
implies that the driver takes the pm refcount if the device is still
in ACTIVE state and continues the processing.  A small caveat is that
this will leave the auto-suspend timer.  But, since the timer callback
itself checks the device state and aborts gracefully when it's active,
this won't be any substantial problem.

Long story short: we address the missing register-write problem just
by replacing the pm_runtime_*() call in snd_hda_keep_power_up().

Fixes: fc4f000bf8c0 ("ALSA: hda - Fix unexpected resume through regmap code path")
Reported-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Closes: https://lore.kernel.org/r/a7478636-af11-92ab-731c-9b13c582a70d@linux.intel.com
Suggested-by: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/hda/hdac_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/hda/hdac_device.c b/sound/hda/hdac_device.c
index accc9d279ce5..6c043fbd606f 100644
--- a/sound/hda/hdac_device.c
+++ b/sound/hda/hdac_device.c
@@ -611,7 +611,7 @@ EXPORT_SYMBOL_GPL(snd_hdac_power_up_pm);
 int snd_hdac_keep_power_up(struct hdac_device *codec)
 {
 	if (!atomic_inc_not_zero(&codec->in_pm)) {
-		int ret = pm_runtime_get_if_in_use(&codec->dev);
+		int ret = pm_runtime_get_if_active(&codec->dev, true);
 		if (!ret)
 			return -1;
 		if (ret < 0)
-- 
2.35.3

