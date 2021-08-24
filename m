Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0653F57B3
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Aug 2021 07:48:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5B3E686F;
	Tue, 24 Aug 2021 07:47:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5B3E686F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629784112;
	bh=UaKR34akLOWE1NFu3OC7jlQXCI5W/bTxq2PVki8RT1E=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=tioD8M1oRd7a+RQSWRbzitoAqOFg1E6n2oRZ1IWBOuN4Sw7YmVV2EoDEJAgA6L8BO
	 VuAXO/RrAdcP+DEtdUCA4pckvbFQqu/C4FdkKrjOex5KWs8MByJiAoR5hklO/E3s4K
	 wwNXAdCXlAE5PYKSMHN6SAXg9oG5JsI3hTa/EmZQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F2E79F80087;
	Tue, 24 Aug 2021 07:47:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9DE96F801D8; Tue, 24 Aug 2021 07:47:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 104C7F80087
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 07:47:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 104C7F80087
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="HNqk8WHB"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="4TMzqxS3"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id B7E0F1FD75
 for <alsa-devel@alsa-project.org>; Tue, 24 Aug 2021 05:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629784021; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eeNMn7rzVtUUxUJM6/iAzGmS93utVGr88AJFmzz28KQ=;
 b=HNqk8WHBbudtx7ZWKZH4pav0RT423HCvxJyiVcXo1ozHC7jew0XORwIuP8PdmVwqCu3ZKF
 hVX0flZFl4ZQ0lQSaWRsSjK8CyekkaX8Ubq1j68k9C0nTrNCzUWRXDfsFqZ5ViHQoCF97D
 y7VVFfn7f5XjTRz1yOe5/LLEbafclws=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629784021;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=eeNMn7rzVtUUxUJM6/iAzGmS93utVGr88AJFmzz28KQ=;
 b=4TMzqxS3jSp/7cIGfAlnxUWx4VGaSY7mRgjsr7otPbeF4LyV6u/SYOA7g+GxxyiBr/oED3
 f4NTzu9hVimu8sBg==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id B2912A3B87;
 Tue, 24 Aug 2021 05:47:01 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Fix regression on Sony WALKMAN NW-A45 DAC
Date: Tue, 24 Aug 2021 07:47:00 +0200
Message-Id: <20210824054700.8236-1-tiwai@suse.de>
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

We've got a regression report for USB-audio with Sony WALKMAN NW-A45
DAC device where no sound is audible on recent kernel.  The bisection
resulted in the code change wrt endpoint management, and the further
debug session revealed that it was caused by the order of the USB
audio interface.  In the earlier code, we always set up the USB
interface at first before other setups, but it was changed to be done
at the last for UAC2/3, which is more standard way, while keeping the
old way for UAC1.  OTOH, this device seems requiring the setup of the
interface at first just like UAC1.

This patch works around the regression by applying the interface setup
specifically for the WALKMAN at the beginning of the endpoint setup
procedure.  This change is written straightforwardly to be easily
backported in old kernels.  A further cleanup to move the workaround
into a generic quirk section will follow in a later patch.

Fixes: bf6313a0ff76 ("ALSA: usb-audio: Refactor endpoint management")
Cc: <stable@vger.kernel.org>
BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=214105
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/endpoint.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/usb/endpoint.c b/sound/usb/endpoint.c
index d33685874a6b..e6d58d7674a0 100644
--- a/sound/usb/endpoint.c
+++ b/sound/usb/endpoint.c
@@ -1293,6 +1293,11 @@ int snd_usb_endpoint_configure(struct snd_usb_audio *chip,
 	 * to be set up before parameter setups
 	 */
 	iface_first = ep->cur_audiofmt->protocol == UAC_VERSION_1;
+	/* Workaround for Sony WALKMAN NW-A45 DAC;
+	 * it requires the interface setup at first like UAC1
+	 */
+	if (chip->usb_id == USB_ID(0x054c, 0x0b8c))
+		iface_first = true;
 	if (iface_first) {
 		err = endpoint_set_interface(chip, ep, true);
 		if (err < 0)
-- 
2.31.1

