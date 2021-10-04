Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C931B4206C4
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Oct 2021 09:42:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 409EB1692;
	Mon,  4 Oct 2021 09:41:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 409EB1692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633333336;
	bh=tz0oGrqUjSB2HkyaONoiD/osLDrrqTLVAlSHd0X7q+g=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FrQyDrDd1dPsEkOg7Kqkkt9PD+Y53u9Pheo3XxDBFDLTmPGtejZ4J0PS/RiKZUN+b
	 8pSt9pRPPrLoj8KRFArqxDLr0hRjG09vbQYSyLgxo4v02E2zwR2bPkQO4+fUPmrWkY
	 gPnind40PmK16MDA+yQWJ/JmUn+E3tFQ3c74Ki34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B9985F800BA;
	Mon,  4 Oct 2021 09:40:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3E0F8F80240; Mon,  4 Oct 2021 09:40:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9402F8010B
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 09:40:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9402F8010B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="0fMgCV4q"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="HJzxu4fl"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 208EE22190
 for <alsa-devel@alsa-project.org>; Mon,  4 Oct 2021 07:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1633333252; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nBjcrRtStCgECb4z3YsFIbOZkdXVIQ6aACXcp6rXOuA=;
 b=0fMgCV4qQkD3XbkUvq9dWwLi+KdWTfjO4EAxIsue6P7Pzzh8ZgbOgyy8YF6++DjOH/PH/b
 NTvTAdURoXaVVikGIS+te8aCQztqquz+BqDAbn2icI987vDXrEKb8deFv2qRnsidwa/VWF
 qavaZotfRnWAloKUp2Dt5wIZWeORJ08=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1633333252;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=nBjcrRtStCgECb4z3YsFIbOZkdXVIQ6aACXcp6rXOuA=;
 b=HJzxu4flQMFZXbOPUYTjElOZA/nTNYGpOot9+WyLXJluM+thfJcAdqdKKJhXft4oz+ARLi
 oNFtaYgnLNW4A/DA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id 10FF8A3B83;
 Mon,  4 Oct 2021 07:40:52 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Enable rate validation for Scarlett devices
Date: Mon,  4 Oct 2021 09:40:50 +0200
Message-Id: <20211004074050.28241-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
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

The Scarlett device series from Focusrite Novation seem requiring the
sample rate validations as we've done for MOTU devices; otherwise the
driver probes invalid audioformat entries that contain the sample
rates that actually don't work, and this may result in an incomplete
setup as reported recently.

This patch adds the needed quirk flag for enabling the sample rate
validation for Focusrite Novation devices.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=214493
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 6ee6d24c847f..889c855addfc 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1900,6 +1900,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_CTL_MSG_DELAY | QUIRK_FLAG_IFACE_DELAY),
 	VENDOR_FLG(0x07fd, /* MOTU */
 		   QUIRK_FLAG_VALIDATE_RATES),
+	VENDOR_FLG(0x1235, /* Focusrite Novation */
+		   QUIRK_FLAG_VALIDATE_RATES),
 	VENDOR_FLG(0x152a, /* Thesycon devices */
 		   QUIRK_FLAG_DSD_RAW),
 	VENDOR_FLG(0x1de7, /* Phoenix Audio */
-- 
2.26.2

