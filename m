Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ED94FD88A
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Apr 2022 12:36:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C3FED1A24;
	Tue, 12 Apr 2022 12:35:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C3FED1A24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1649759808;
	bh=MsY1aGfooyq3028Mm7Y+OwSl9586oxokQLZ9hQSyoFM=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RQ0ftE+dTyW7i9TzNMvW/1QD98VglnU0tPNbi1m8z4YPVwqHyhAIvd9jc4j9ZFVIQ
	 WImzkvPpNhPThqisUUjthG3EKrtujTDvVp7WfXnu0zRn/heZ+OrbwYPSv2QeVg1Ds1
	 yAk2NbupxbfjJpb+tZAyr9NtGxHofDwiSlrbhowk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C82CBF805FD;
	Tue, 12 Apr 2022 12:27:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5625EF805C9; Tue, 12 Apr 2022 12:27:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D484FF80538
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 12:26:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D484FF80538
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de
 header.b="N+By8BmN"; 
 dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de
 header.b="eotnhOee"
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A655B1FD10
 for <alsa-devel@alsa-project.org>; Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1649759204; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ds/OLCQRsKzgyeWzoj0D/srGcquzUMGCV9IFeD2ReEc=;
 b=N+By8BmNXyaY0M3g0IOMGWyth6majiU7HlJQrNIoT/nuhdU+k7I5dW4lQugsW13AUIXW5H
 N5nLPMHR6CpQ5H6LL+ZShr65hz3ThOURvYhUK6qx/oI6csszFh+tjtck1tbx0eoJx0XVrw
 4PhXJxLG3kJk569n3O6OKqBiAcrseIo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1649759204;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ds/OLCQRsKzgyeWzoj0D/srGcquzUMGCV9IFeD2ReEc=;
 b=eotnhOeeXcyqqACO6IlQUquqtfXa6PT2Jjo0fCBUfEDV31bIfmBd3JzxuFfZz5NNwa7WPJ
 Jise2LKNyuwbtLCA==
Received: from alsa1.nue.suse.com (alsa1.suse.de [10.160.4.42])
 by relay2.suse.de (Postfix) with ESMTP id A2A51A3B83;
 Tue, 12 Apr 2022 10:26:44 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 26/39] ALSA: intel_hdmi: Fix the missing snd_card_free() call
 at probe error
Date: Tue, 12 Apr 2022 12:26:23 +0200
Message-Id: <20220412102636.16000-27-tiwai@suse.de>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220412102636.16000-1-tiwai@suse.de>
References: <20220412102636.16000-1-tiwai@suse.de>
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

The previous cleanup with devres may lead to the incorrect release
orders at the probe error handling due to the devres's nature.  Until
we register the card, snd_card_free() has to be called at first for
releasing the stuff properly when the driver tries to manage and
release the stuff via card->private_free().

This patch fixes it by calling snd_card_free() on the error from the
probe callback using a new helper function.

Fixes: 854577ac2aea ("ALSA: x86: Allocate resources with device-managed APIs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/x86/intel_hdmi_audio.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/sound/x86/intel_hdmi_audio.c b/sound/x86/intel_hdmi_audio.c
index b00634663346..0d828e35b401 100644
--- a/sound/x86/intel_hdmi_audio.c
+++ b/sound/x86/intel_hdmi_audio.c
@@ -1652,7 +1652,7 @@ static void hdmi_lpe_audio_free(struct snd_card *card)
  * This function is called when the i915 driver creates the
  * hdmi-lpe-audio platform device.
  */
-static int hdmi_lpe_audio_probe(struct platform_device *pdev)
+static int __hdmi_lpe_audio_probe(struct platform_device *pdev)
 {
 	struct snd_card *card;
 	struct snd_intelhad_card *card_ctx;
@@ -1815,6 +1815,11 @@ static int hdmi_lpe_audio_probe(struct platform_device *pdev)
 	return 0;
 }
 
+static int hdmi_lpe_audio_probe(struct platform_device *pdev)
+{
+	return snd_card_free_on_error(&pdev->dev, __hdmi_lpe_audio_probe(pdev));
+}
+
 static const struct dev_pm_ops hdmi_lpe_audio_pm = {
 	SET_SYSTEM_SLEEP_PM_OPS(hdmi_lpe_audio_suspend, hdmi_lpe_audio_resume)
 };
-- 
2.31.1

