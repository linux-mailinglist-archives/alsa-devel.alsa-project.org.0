Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 058DA52F95F
	for <lists+alsa-devel@lfdr.de>; Sat, 21 May 2022 08:47:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E9581708;
	Sat, 21 May 2022 08:46:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E9581708
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1653115663;
	bh=cUeRhpXbWjs0i0/99cJiO7H8VfRFZvIrwZ8hyRvY7cQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SZ53LnNOclOWEWt4AGHHH262svvbVMA0VM9k37ZIPl4IzmYHIriEHmjxg3F5vyQY6
	 2d86O5T2mMp0hjZX/AzmQ92qF0xTbmVuRADAeZ8DpNBEVQwdnYtHWuhKowYIUcTyEk
	 IQq38sUOyyUQo1Aj9Kfux9iCs33bL6WZy/MDcyCs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0312F80105;
	Sat, 21 May 2022 08:46:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 132F8F800D2; Sat, 21 May 2022 08:46:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FD3EF80105
 for <alsa-devel@alsa-project.org>; Sat, 21 May 2022 08:46:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FD3EF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="jfTSuYlq"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="DBk85JbV"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id F1DB61F37C;
 Sat, 21 May 2022 06:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1653115592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZssCq7ERY/OODNhJGqkrDrP0ntHDGnXwteRo4euty5U=;
 b=jfTSuYlqGFTX0rHwbVFhKOHKnaa125iZ6KqpsXuQVf+mUs7OVazVRr/1RC6OT88z5KGoHR
 /eMg238NKoUVc5Ht+DeK3QW+I20btPPs/PokJ/IunvQR2bJb+1tMkOv1i++bPIarK833Y7
 axln3tTCypZPxsMRx8o2jQjPuPjkJPU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1653115592;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=ZssCq7ERY/OODNhJGqkrDrP0ntHDGnXwteRo4euty5U=;
 b=DBk85JbV9bSBnabfdltUizKdVk7KtUBIxlDYwtmlKE+0huDJLI7ciM7XhVZcSQbMQSlu8S
 bLcPAiB9/p5lS1Bw==
Received: from valkyrie.site.de (unknown [10.163.18.242])
 by relay2.suse.de (Postfix) with ESMTP id CD3AE2C141;
 Sat, 21 May 2022 06:46:32 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Workaround for clock setup on TEAC devices
Date: Sat, 21 May 2022 08:46:27 +0200
Message-Id: <20220521064627.29292-1-tiwai@suse.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Maris Abele <maris7abele@gmail.com>
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

Maris reported that TEAC UD-501 (0644:8043) doesn't work with the
typical "clock source 41 is not valid, cannot use" errors on the
recent kernels.  The currently known workaround so far is to restore
(partially) what we've done unconditionally at the clock setup;
namely, re-setup the USB interface immediately after the clock is
changed.  This patch re-introduces the behavior conditionally for TEAC
devices.

Further notes:
- The USB interface shall be set later in
  snd_usb_endpoint_configure(), but this seems to be too late.
- Even calling  usb_set_interface() right after
  sne_usb_init_sample_rate() doesn't help; so this must be related
  with the clock validation, too.
- The device may still spew the "clock source 41 is not valid" error
  at the first clock setup.  This seems happening at the very first
  try of clock setup, but it disappears at later attempts.
  The error is likely harmless because the driver retries the clock
  setup (such an error is more or less expected on some devices).

Fixes: bf6313a0ff76 ("ALSA: usb-audio: Refactor endpoint management")
Reported-and-tested-by: Maris Abele <maris7abele@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/clock.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/sound/usb/clock.c b/sound/usb/clock.c
index 4dfe76416794..3c435d379306 100644
--- a/sound/usb/clock.c
+++ b/sound/usb/clock.c
@@ -572,6 +572,13 @@ static int set_sample_rate_v2v3(struct snd_usb_audio *chip,
 		/* continue processing */
 	}
 
+	/* FIXME - TEAC devices require the immediate interface setup */
+	if (rate != prev_rate && USB_ID_VENDOR(chip->usb_id) == 0x0644) {
+		usb_set_interface(chip->dev, fmt->iface, fmt->altsetting);
+		if (chip->quirk_flags & QUIRK_FLAG_IFACE_DELAY)
+			msleep(50);
+	}
+
 validation:
 	/* validate clock after rate change */
 	if (!uac_clock_source_is_valid(chip, fmt, clock))
-- 
2.35.3

