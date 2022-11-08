Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AEB1621519
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Nov 2022 15:08:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90FAE846;
	Tue,  8 Nov 2022 15:07:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90FAE846
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667916504;
	bh=nvZP2L3mPYmW2Z8PZHVKa3NeKoTZ6BFU/asSlttc6EI=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FHJL3HhBfH051Dg/Ke2/79ysuVaoPCwlmnhUAZMiOTAg7ZBjBg0G+NoFSB23tEDLm
	 aU7xWbtvQ17ApumrBUwiM+7/l+uGAe6vSc4Z7yiCOC1en2LyPCPHSmrG8sz1mZoZM4
	 B0WqoVT1A56m3fdAPKJHCWDenJcf6J4JuXox8lYI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35AE4F8020D;
	Tue,  8 Nov 2022 15:07:29 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFC83F801D8; Tue,  8 Nov 2022 15:07:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06624F8016A
 for <alsa-devel@alsa-project.org>; Tue,  8 Nov 2022 15:07:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06624F8016A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="NyVt8d4V"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="QgkIfQCf"
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C20D1F38C;
 Tue,  8 Nov 2022 14:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1667916444; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=a6OFhhZjWrnTqa9mNcr7iXKvqxi7L0vo0DZ4wLGJw0A=;
 b=NyVt8d4VUAlzDwhGrjrd8GPul8Iuz9VFMoXZCYefHdaEgTrOCC2GSvl4oqsdfp9zw/4HQS
 DUTbQSfMQZmLFyC1NHnFI+LdDhBZLkdvh0WmQHgGCx61AZ3pgd8Xj4s05lu/6WEsxZScRz
 kggmH6BNZnDoYijcnmX+X8kvCiP1ZX8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1667916444;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=a6OFhhZjWrnTqa9mNcr7iXKvqxi7L0vo0DZ4wLGJw0A=;
 b=QgkIfQCfiLeDrU6828f66j4EqztsF7WJRqpLf2kdqlCvDCzomUrCfcdeuk8UQEuCA+FO5S
 uEmxsMYy9BbetIAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 40954139F1;
 Tue,  8 Nov 2022 14:07:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id SUblDpxiamOFHwAAMHmgww
 (envelope-from <tiwai@suse.de>); Tue, 08 Nov 2022 14:07:24 +0000
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add quirk entry for M-Audio Micro
Date: Tue,  8 Nov 2022 15:07:21 +0100
Message-Id: <20221108140721.24248-1-tiwai@suse.de>
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

M-Audio Micro (0762:201a) defines the descriptor as vendor-specific,
while the content seems class-compliant.  Just overriding the probe
makes the device working.

Reported-by: Ash Logan <ash@heyquark.com>
Cc: <stable@vger.kernel.org>
Link: https://lore.kernel.org/r/7ecd4417-d860-4773-c1c1-b07433342390@heyquark.com
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/quirks-table.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 06dfdd45cff8..874fcf245747 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2049,6 +2049,10 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 		}
 	}
 },
+{
+	/* M-Audio Micro */
+	USB_DEVICE_VENDOR_SPEC(0x0763, 0x201a),
+},
 {
 	USB_DEVICE_VENDOR_SPEC(0x0763, 0x2030),
 	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
-- 
2.35.3

