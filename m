Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2D672C5F5
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 15:29:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7CEF36C1;
	Mon, 12 Jun 2023 15:28:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7CEF36C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686576566;
	bh=ZRE8YMXELZbkXIxKulEAu/J8bd6ASkHalzG0mnFEcLg=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=JNLLmoKsrMzT4spORJF8cwdd7P4R/pEaM8weH2m5Vb5SWREXOXkp0wLhJN3wZoRt+
	 RTPtnAeY1JmOH5kndzIXOleNGCeP+L6AVy4N3IzunggWFI+6r6nUbCCrh1/O9yvqvU
	 rdLBdgpVeHK0VbOXJ6ZaUzA+xphHpTSUa4XL2It8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE8A1F8052E; Mon, 12 Jun 2023 15:28:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 366EAF80130;
	Mon, 12 Jun 2023 15:28:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C6CC1F80132; Mon, 12 Jun 2023 15:28:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 463F3F800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 15:28:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 463F3F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=XLa05f3h;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=ELokCdry
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 685782269E;
	Mon, 12 Jun 2023 13:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_rsa;
	t=1686576500; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=1si6Ew2sISLNKEn9KyW5+4BCH2MJFnemqmY+jL/Fgoo=;
	b=XLa05f3hpW9fir8uI+gexODpvQikE20MzO+zcHHmrRdKG4U8OOxflJpvTDtOXg/LuIkHVJ
	qCTXs66sW68NqC2cYehzzrz/TGnlvu14BMNqkN0+NGB1SgYlkS1JIIn7iw0q3tT7QKUDls
	xDPOWA+1IwMq+5g30NepjeRkF+pPo5k=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1686576500;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:
  content-transfer-encoding:content-transfer-encoding;
	bh=1si6Ew2sISLNKEn9KyW5+4BCH2MJFnemqmY+jL/Fgoo=;
	b=ELokCdryZv3btgYRGygLoGz+FtIitMBXAbGQ3b/035mTIw8F/GFhr1uJnKYdWWRs8x2bKN
	b0AvayLuT1M3FvCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de
 [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4C9DE138EC;
	Mon, 12 Jun 2023 13:28:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id r9vSEXQdh2QYBAAAMHmgww
	(envelope-from <tiwai@suse.de>); Mon, 12 Jun 2023 13:28:20 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix broken resume due to UAC3 power state
Date: Mon, 12 Jun 2023 15:28:18 +0200
Message-Id: <20230612132818.29486-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U5VU4BSHY676VT27NGWBQADTLI6XDDAT
X-Message-ID-Hash: U5VU4BSHY676VT27NGWBQADTLI6XDDAT
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U5VU4BSHY676VT27NGWBQADTLI6XDDAT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

As reported in the bugzilla below, the PM resume of a UAC3 device may
fail due to the incomplete power state change, stuck at D1.  The
reason is that the driver expects the full D0 power state change only
at hw_params, while the normal PCM resume procedure doesn't call
hw_params.

For fixing the bug, we add the same power state update to D0 at the
prepare callback, which is certainly called by the resume procedure.

Note that, with this change, the power state change in the hw_params
becomes almost redundant, since snd_usb_hw_params() doesn't touch the
parameters (at least it tires so).  But dropping it is still a bit
risky (e.g. we have the media-driver binding), so I leave the D0 power
state change in snd_usb_hw_params() as is for now.

Fixes: a0a4959eb4e9 ("ALSA: usb-audio: Operate UAC3 Power Domains in PCM callbacks")
Cc: <stable@vger.kernel.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=217539
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/pcm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index eec5232f9fb2..08bf535ed163 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -650,6 +650,10 @@ static int snd_usb_pcm_prepare(struct snd_pcm_substream *substream)
 		goto unlock;
 	}
 
+	ret = snd_usb_pcm_change_state(subs, UAC3_PD_STATE_D0);
+	if (ret < 0)
+		goto unlock;
+
  again:
 	if (subs->sync_endpoint) {
 		ret = snd_usb_endpoint_prepare(chip, subs->sync_endpoint);
-- 
2.35.3

