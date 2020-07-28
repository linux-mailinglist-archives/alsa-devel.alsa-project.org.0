Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C80523053A
	for <lists+alsa-devel@lfdr.de>; Tue, 28 Jul 2020 10:22:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E03E16B2;
	Tue, 28 Jul 2020 10:21:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E03E16B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1595924548;
	bh=0VdHajr5ddxBcbsjgeEpdY2Khcpp9DWXXzAZbxCH6aU=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZXspKH5NtXbGiDjLrbIFbCI9Y75Bmkw5HW1E2Mb0atQIPvA1j2sN7qpGBsvteAZHg
	 gcKjiR61LzH4wbLB2dXwiBoe4uh5c6xztjB7HQO06HofyBPEN6VfeytsWqx6WmJZxz
	 rgEfwZQVFP6gO5BuO4giRTOJdr/UJgNtrKuzDeNc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AFC29F80227;
	Tue, 28 Jul 2020 10:20:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1CEC9F8021E; Tue, 28 Jul 2020 10:20:45 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63C5FF800DE
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 10:20:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63C5FF800DE
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 60492AFE8
 for <alsa-devel@alsa-project.org>; Tue, 28 Jul 2020 08:20:45 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: hda/hdmi: Fix keep_power assignment for non-component
 devices
Date: Tue, 28 Jul 2020 10:20:33 +0200
Message-Id: <20200728082033.23933-1-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
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

It's been reported that, when neither nouveau nor Nvidia graphics
driver is used, the screen starts flickering.  And, after comparing
between the working case (stable 4.4.x) and the broken case, it turned
out that the problem comes from the audio component binding.  The
Nvidia and AMD audio binding code clears the bus->keep_power flag
whenever snd_hdac_acomp_init() succeeds.  But this doesn't mean that
the component is actually bound, but it merely indicates that it's
ready for binding.  So, when both nouveau and Nvidia are blacklisted
or not ready, the driver keeps running without the audio component but
also with bus->keep_power = false.  This made the driver runtime PM
kicked in and powering down when unused, which results in flickering
in the graphics side, as it seems.

For fixing the bug, this patch moves the bus->keep_power flag change
into generic_acomp_notifier_set() that is the function called from the
master_bind callback of component ops; i.e. it's guaranteed that the
binding succeeded.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=208609
Fixes: 5a858e79c911 ("ALSA: hda - Disable audio component for legacy Nvidia HDMI codecs")
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/pci/hda/patch_hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
index 41eaa89660c3..cd46247988e4 100644
--- a/sound/pci/hda/patch_hdmi.c
+++ b/sound/pci/hda/patch_hdmi.c
@@ -2440,6 +2440,7 @@ static void generic_acomp_notifier_set(struct drm_audio_component *acomp,
 	mutex_lock(&spec->bind_lock);
 	spec->use_acomp_notifier = use_acomp;
 	spec->codec->relaxed_resume = use_acomp;
+	spec->codec->bus->keep_power = 0;
 	/* reprogram each jack detection logic depending on the notifier */
 	for (i = 0; i < spec->num_pins; i++)
 		reprogram_jack_detect(spec->codec,
@@ -2534,7 +2535,6 @@ static void generic_acomp_init(struct hda_codec *codec,
 	if (!snd_hdac_acomp_init(&codec->bus->core, &spec->drm_audio_ops,
 				 match_bound_vga, 0)) {
 		spec->acomp_registered = true;
-		codec->bus->keep_power = 0;
 	}
 }
 
-- 
2.16.4

