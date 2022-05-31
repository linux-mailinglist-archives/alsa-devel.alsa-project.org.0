Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7929B539173
	for <lists+alsa-devel@lfdr.de>; Tue, 31 May 2022 15:08:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0951C1B13;
	Tue, 31 May 2022 15:08:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0951C1B13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1654002539;
	bh=BBKVZ7wpUbA9Wt64B8jqvTMX/ygPWLkdIVpcv+PxZko=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WjocHap8X+iTw2qBMV5RBuTNz97GP5oxpYEj6aV94P8dOZy5xDAJcb5U8RnnA25W1
	 +7+kruYEGsTW8tx5YvXgSq8Uf3Gv1U30bNumoTkAM7MeJEWT/+ofQrRFYS7VbNhB7i
	 ENBM8Tb8pFfS+swBdAD0iJLszL4OzeEGVcKjWbMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 68B6DF8019B;
	Tue, 31 May 2022 15:08:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BCB21F80161; Tue, 31 May 2022 15:07:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AABC4F800DE
 for <alsa-devel@alsa-project.org>; Tue, 31 May 2022 15:07:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AABC4F800DE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="pfvS3wQu"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="zqPrIAxF"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D912B21B46;
 Tue, 31 May 2022 13:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1654002472; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QkK4V5rYWedJCyCMSZfFS+swXMEXLQXCUjsN+sWhD88=;
 b=pfvS3wQuQhGoT1QgFA+x5Yf0ZWEnazmFtDauCIGb4T5QZinGT4SYMDdBxaUvGobRuIKLI6
 vNb5cWBrQwnGGOynOTibIFFzyv6+tuKhzmMKwS9YhHH/f2PaPzIVpSQaTEMkNsXMOJcCEV
 Yg8IOMK1qEMYGdNKXxo5NCiyQnaaIj4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1654002472;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=QkK4V5rYWedJCyCMSZfFS+swXMEXLQXCUjsN+sWhD88=;
 b=zqPrIAxF9aT24HA7yafnjK9DK3bI+fvpVRjp+YsZ5FclEflapPVXEmUR6WxGWHlSDkRs7X
 cRX8RLpaa4bwfmCw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id BC9B913AA2;
 Tue, 31 May 2022 13:07:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id sS07LSgTlmLlBAAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 31 May 2022 13:07:52 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Optimize TEAC clock quirk
Date: Tue, 31 May 2022 15:07:49 +0200
Message-Id: <20220531130749.30357-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Maris found out that the quirk for TEAC devices to work around the
clock setup is needed to apply only when the base clock is changed,
e.g. from 48000-based clocks (48000, 96000, 192000, 384000) to
44100-based clocks (44100, 88200, 176400, 352800), or vice versa,
while switching to another clock with the same base clock doesn't need
the (forcible) interface setup.

This patch implements the optimization for the TEAC clock quirk to
avoid the unnecessary interface re-setup.

Fixes: 5ce0b06ae5e6 ("ALSA: usb-audio: Workaround for clock setup on TEAC devices")
Reported-by: Maris Abele <maris7abele@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/clock.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 3c435d379306..db429320599e 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -573,10 +573,14 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip,
 	}
 
 	/* FIXME - TEAC devices require the immediate interface setup */
-	if (rate != prev_rate && USB_ID_VENDOR(chip->usb_id) == 0x0644) {
-		usb_set_interface(chip->dev, fmt->iface, fmt->altsetting);
-		if (chip->quirk_flags & QUIRK_FLAG_IFACE_DELAY)
-			msleep(50);
+	if (USB_ID_VENDOR(chip->usb_id) == 0x0644) {
+		bool cur_base_48k = (rate % 48000 == 0);
+		bool prev_base_48k = (prev_rate % 48000 == 0);
+		if (cur_base_48k != prev_base_48k) {
+			usb_set_interface(chip->dev, fmt->iface, fmt->altsetting);
+			if (chip->quirk_flags & QUIRK_FLAG_IFACE_DELAY)
+				msleep(50);
+		}
 	}
 
 validation:
-- 
2.35.3

