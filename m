Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BCD5B46A0
	for <lists+alsa-devel@lfdr.de>; Sat, 10 Sep 2022 16:27:03 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F401168D;
	Sat, 10 Sep 2022 16:26:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F401168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662820022;
	bh=tzxaFwQBnnmKuGqBI65sFgS1xuPJUpMEYb1rpNcVdVk=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p4Lyz/jpBgZFQmkMFoJUx1/h2nhWruUj70+gpWg8pm08tmcDrFE5neHDmfRn511YF
	 blRmVIu/hOv6JoZogHyTgz18HmLVm4Y2Vj1uOCM166Jm/OJkwaGpRSKHe7HsoEtR3q
	 QIAtfEiwLPYLYr5cCV5h4lmXVr3ZyzyWsWS2q2sw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3091F80448;
	Sat, 10 Sep 2022 16:26:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1B24EF8042F; Sat, 10 Sep 2022 16:26:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B7197F8016B
 for <alsa-devel@alsa-project.org>; Sat, 10 Sep 2022 16:25:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B7197F8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="ia5+uMd/"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="UMBGPh6Y"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id DBF46222B1;
 Sat, 10 Sep 2022 14:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1662819952; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YSCrE5xJW9d7cchNNMf7BMZrViK8yXLT6EKSjWfYnOI=;
 b=ia5+uMd/VZPS9QsHgGo2hQVIcKJHIhsf77faw06n1Qndj0cUdFa5VOlwh3ioKrxwhvOAOa
 UOz9K6LXwWCDQnsr8VBXSxGNv6H6AxNyJthBgS/iHb3fTQ1cf06f8XZX0pOm0Yyn+0OLX3
 vM4FEgIC3a0Ztb2t4a7XUUlR0XRrH14=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1662819952;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YSCrE5xJW9d7cchNNMf7BMZrViK8yXLT6EKSjWfYnOI=;
 b=UMBGPh6Y0W3NscelMLOaZjopaLnWKrpW9s6ADJayZhxwcOHiaoSKsE5XM5N2An6cyPkkw+
 TgbJPFoayA0pLQCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id B55FD133B7;
 Sat, 10 Sep 2022 14:25:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id BESyK3CeHGOfUAAAMHmgww
 (envelope-from <tiwai@suse.de>); Sat, 10 Sep 2022 14:25:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda: Fix hang at HD-audio codec unbinding due to
 refcount saturation
Date: Sat, 10 Sep 2022 16:25:50 +0200
Message-Id: <20220910142550.28494-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

We fixed the potential deadlock at dynamic unbinding the HD-audio
codec at the commit 7206998f578d ("ALSA: hda: Fix potential deadlock
at codec unbinding"), but ironically, this caused another potential
deadlock.  The current code uses refcount_dec() and waits for the
pending task with wait_event for dropping the refcount to 0.  This
works fine when PCMs are assigned and actually waiting for the
refcount drop.

Meanwhile, when there was no PCM assigned, the refcount_dec() call
itself was supposed to drop to zero -- alas, it doesn't in reality;
refcount_dec() complains, spews kernel warning and it saturates
instead of dropping to 0, due to the nature of refcount_dec()
implementation.  This eventually blocks the wait_event() wakeup and
the code get stuck there.

For avoiding the problem, we call refcount_dec_and_test() and skips
the sync-wait if it already reaches to zero.

The patch does a slight code reshuffling to make sure to invoke other
disconnect calls before the sync-wait, too.

Fixes: 7206998f578d ("ALSA: hda: Fix potential deadlock at codec unbinding")
Reported-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Tested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/YxtflWQnslMHVlU7@intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/hda_bind.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index cae9a975cbcc..1a868dd9dc4b 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -157,10 +157,10 @@ static int hda_codec_driver_remove(struct device *dev)
 		return codec->bus->core.ext_ops->hdev_detach(&codec->core);
 	}
 
-	refcount_dec(&codec->pcm_ref);
 	snd_hda_codec_disconnect_pcms(codec);
 	snd_hda_jack_tbl_disconnect(codec);
-	wait_event(codec->remove_sleep, !refcount_read(&codec->pcm_ref));
+	if (!refcount_dec_and_test(&codec->pcm_ref))
+		wait_event(codec->remove_sleep, !refcount_read(&codec->pcm_ref));
 	snd_power_sync_ref(codec->bus->card);
 
 	if (codec->patch_ops.free)
-- 
2.35.3

