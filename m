Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1EBD5F1AB4
	for <lists+alsa-devel@lfdr.de>; Sat,  1 Oct 2022 09:52:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 344BA16E5;
	Sat,  1 Oct 2022 09:51:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 344BA16E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1664610727;
	bh=wP7AHeGlSbV2OB4PxStn9bnT7cUm7ZX5p2KiXCBdIm4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Z2/zDqzGQXB/6/pcDZxWcDciUhnNllozA/Oie1UuFOLtVqZRV2jeHTEFnLVQZaIwc
	 JuqoJt0jAggEGR3KIP1q4vZEvS7fKfZJ7F+DkhrWNSpEhbdfH+KtdS3/Gs5uL6epQk
	 fF2Gnj7yDFoLWB/NdjRgOJNq7W6ycFdkoY2cUFvk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AAC3F800A7;
	Sat,  1 Oct 2022 09:51:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 282FFF80171; Sat,  1 Oct 2022 09:51:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, RCVD_IN_DNSWL_NONE, SPF_HELO_NONE, SPF_PASS,
 T_SCC_BODY_TEXT_LINE, 
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0062DF800A7
 for <alsa-devel@alsa-project.org>; Sat,  1 Oct 2022 09:50:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0062DF800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="XNKCUhGv"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="uS0wl2sZ"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 16EA3218FB;
 Sat,  1 Oct 2022 07:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1664610608; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=US9Oqkz0WEzA0v66Vq3vlYghm/kZ4nk39PIkt/JoSgM=;
 b=XNKCUhGv8APLmXMwNCiZ7/B2wQLhY/Il76HGR/D+i3+shyYWuU0ncE2hwttBKyBPllDEQT
 /dHBWA72Pzb5ZJvsxd+Ry6hr9eVNLNNS27J1KpsPTB4aTengT8Obf2c7iuEEvmo5QwjI+q
 hX5+kGypHwCnTBmtiLlir6KExJA58DU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1664610608;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=US9Oqkz0WEzA0v66Vq3vlYghm/kZ4nk39PIkt/JoSgM=;
 b=uS0wl2sZoS5SrI4K3iephmdlu8oHLXnN5DRtXOcT7RSs7U2lS/Niy5AiICsg82TMOhtSjO
 qMqE6SUaxJbWa3Ag==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id F0F1A13A7F;
 Sat,  1 Oct 2022 07:50:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id IkEnOi/xN2N5JAAAMHmgww
 (envelope-from <tiwai@suse.de>); Sat, 01 Oct 2022 07:50:07 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/hdmi: Don't skip notification handling during PM
 operation
Date: Sat,  1 Oct 2022 09:48:10 +0200
Message-Id: <20221001074809.7461-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Brent Lu <brent.lu@intel.com>
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

The HDMI driver skips the notification handling from the graphics
driver when the codec driver is being in the PM operation.  This
behavior was introduced by the commit eb399d3c99d8 ("ALSA: hda - Skip
ELD notification during PM process").  This skip may cause a problem,
as we may miss the ELD update when the connection/disconnection
happens right at the runtime-PM operation of the audio codec.

Although this workaround was valid at that time, it's no longer true;
the fix was required just because the ELD update procedure needed to
wake up the audio codec, which had lead to a runtime-resume during a
runtime-suspend.  Meanwhile, the ELD update procedure doesn't need a
codec wake up any longer since the commit 788d441a164c ("ALSA: hda -
Use component ops for i915 HDMI/DP audio jack handling"); i.e. there
is no much reason for skipping the notification.

Let's drop those checks for addressing the missing notification.

Fixes: 788d441a164c ("ALSA: hda - Use component ops for i915 HDMI/DP audio jack handling")
Reported-by: Brent Lu <brent.lu@intel.com>
Link: https://lore.kernel.org/r/20220927135807.4097052-1-brent.lu@intel.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index c172640c8a41..21edf7a619f0 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2666,9 +2666,6 @@ static void generic_acomp_pin_eld_notify(void *audio_ptr, int port, int dev_id)
 	 */
 	if (codec->core.dev.power.power_state.event == PM_EVENT_SUSPEND)
 		return;
-	/* ditto during suspend/resume process itself */
-	if (snd_hdac_is_in_pm(&codec->core))
-		return;
 
 	check_presence_and_report(codec, pin_nid, dev_id);
 }
@@ -2852,9 +2849,6 @@ static void intel_pin_eld_notify(void *audio_ptr, int port, int pipe)
 	 */
 	if (codec->core.dev.power.power_state.event == PM_EVENT_SUSPEND)
 		return;
-	/* ditto during suspend/resume process itself */
-	if (snd_hdac_is_in_pm(&codec->core))
-		return;
 
 	snd_hdac_i915_set_bclk(&codec->bus->core);
 	check_presence_and_report(codec, pin_nid, dev_id);
-- 
2.35.3

