Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C3E7A1CC5
	for <lists+alsa-devel@lfdr.de>; Thu, 29 Aug 2019 16:30:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9984C166D;
	Thu, 29 Aug 2019 16:29:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9984C166D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567089012;
	bh=LXmivrzcd5ALh17Poxe/ydS7eHls7mNib0VUzTOQe5c=;
	h=From:To:Date:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=L8vz45FhvhYnlyl5A/+02wbyLnt4q6pccHNyUvmXsKR47NF2T5zw8a5oGzQhe8eV3
	 GoX3sYW7dNSJh2y6KTX+7UFTAEgmPCjTKEChY3QHIDlVgKcQS/tJNeBBEfluRCoLlT
	 fjdeqkD8+XJ7EJbxWy8E+bTWzls4+dWVg85oMKVQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 25007F80863;
	Tue, 27 Aug 2019 23:09:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDC5CF8086C; Tue, 27 Aug 2019 23:09:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.sonarnerd.net (rankki.sonarnerd.net [194.142.149.154])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E186EF80863
 for <alsa-devel@alsa-project.org>; Tue, 27 Aug 2019 23:09:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E186EF80863
Received: from porkkala.uworld (porkkala.uworld [IPv6:fc00::2])
 by mail.sonarnerd.net (Postfix) with ESMTP id 959AC2310E9;
 Wed, 28 Aug 2019 00:09:06 +0300 (EEST)
From: Jussi Laako <jussi@sonarnerd.net>
To: alsa-devel@alsa-project.org
Date: Wed, 28 Aug 2019 00:08:46 +0300
Message-Id: <20190827210847.10306-1-jussi@sonarnerd.net>
X-Mailer: git-send-email 2.17.1
Cc: tiwai@suse.de, Jussi Laako <jussi@sonarnerd.net>
Subject: [alsa-devel] [PATCH 1/2] ALSA: usb-audio: DSD auto-detection for
	Playback Designs
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Add DSD support auto-detection for newer Playback Designs devices. Older
device generations have a different USB interface implementation.

Keep the auto-detection VID whitelist sorted.

Signed-off-by: Jussi Laako <jussi@sonarnerd.net>
---
 sound/usb/quirks.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 7e9735aa7ac9..79fb24843d5b 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1566,7 +1566,8 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	struct usb_interface *iface;
 
 	/* Playback Designs */
-	if (USB_ID_VENDOR(chip->usb_id) == 0x23ba) {
+	if (USB_ID_VENDOR(chip->usb_id) == 0x23ba &&
+	    USB_ID_PRODUCT(chip->usb_id) < 0x0110) {
 		switch (fp->altsetting) {
 		case 1:
 			fp->dsd_dop = true;
@@ -1654,8 +1655,9 @@ u64 snd_usb_interface_dsd_format_quirks(struct snd_usb_audio *chip,
 	 * from XMOS/Thesycon
 	 */
 	switch (USB_ID_VENDOR(chip->usb_id)) {
-	case 0x20b1:  /* XMOS based devices */
 	case 0x152a:  /* Thesycon devices */
+	case 0x20b1:  /* XMOS based devices */
+	case 0x23ba:  /* Playback Designs */
 	case 0x25ce:  /* Mytek devices */
 	case 0x2ab6:  /* T+A devices */
 		if (fp->dsd_raw)
-- 
2.17.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
