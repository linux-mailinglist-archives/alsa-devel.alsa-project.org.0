Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 387F33AF49E
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Jun 2021 20:14:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BF7E216C8;
	Mon, 21 Jun 2021 20:13:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BF7E216C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624299245;
	bh=pM4smZkk7jxPMmhmAWpp27oEyWu3lDjyGnlsW2a14F4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DzeRd1oS2aebGXMRmrQtlbM8ckFge5tIG7TxsdvK1RT93Sm+vOLdTHREcNaicbqy1
	 AShdqGr1Al5C5ao1v8/E7FiOPF+RzTsAW4BxzyAeMp8+fM6dHkxmjQFeC9w3Q5sz/8
	 NqVrQdSiZa+FYFcF1oX2CebTOrIsJQkYD2ShSV/c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AC14F8051E;
	Mon, 21 Jun 2021 20:09:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BD8C0F80516; Mon, 21 Jun 2021 20:09:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 38229F80507
 for <alsa-devel@alsa-project.org>; Mon, 21 Jun 2021 20:09:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 38229F80507
Received: by m.b4.vu (Postfix, from userid 1000)
 id BCBD461E2871; Tue, 22 Jun 2021 03:39:33 +0930 (ACST)
Date: Tue, 22 Jun 2021 03:39:33 +0930
From: "Geoffrey D. Bennett" <g@b4.vu>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>
Subject: [PATCH 09/31] ALSA: usb-audio: scarlett2: Move info lookup out of
 init function
Message-ID: <c4b6d17708e104503d9a2b88f9b3320bb9904cfa.1624294591.git.g@b4.vu>
References: <cover.1624294591.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1624294591.git.g@b4.vu>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Hin-Tak Leung <htl10@users.sourceforge.net>,
 Vladimir Sadovnikov <sadko4u@gmail.com>
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

The info variable is not used by snd_scarlett_gen2_init() except to
pass it to snd_scarlett_gen2_controls_create(), so move the lookup
into that function.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett_gen2.c | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/sound/usb/mixer_scarlett_gen2.c b/sound/usb/mixer_scarlett_gen2.c
index 481ebdd1a0df..5cc4296944f5 100644
--- a/sound/usb/mixer_scarlett_gen2.c
+++ b/sound/usb/mixer_scarlett_gen2.c
@@ -2249,13 +2249,19 @@ static int scarlett2_init_notify(struct usb_mixer_interface *mixer)
 	return usb_submit_urb(mixer->urb, GFP_KERNEL);
 }
 
-static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer,
-					     const struct scarlett2_device_info *info)
+static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer)
 {
+	const struct scarlett2_device_info **info = scarlett2_devices;
 	int err;
 
+	/* Find device in scarlett2_devices */
+	while (*info && (*info)->usb_id != mixer->chip->usb_id)
+		info++;
+	if (!*info)
+		return -EINVAL;
+
 	/* Initialise private data */
-	err = scarlett2_init_private(mixer, info);
+	err = scarlett2_init_private(mixer, *info);
 	if (err < 0)
 		return err;
 
@@ -2310,19 +2316,12 @@ static int snd_scarlett_gen2_controls_create(struct usb_mixer_interface *mixer,
 int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer)
 {
 	struct snd_usb_audio *chip = mixer->chip;
-	const struct scarlett2_device_info **info = scarlett2_devices;
 	int err;
 
 	/* only use UAC_VERSION_2 */
 	if (!mixer->protocol)
 		return 0;
 
-	/* find device in scarlett2_devices */
-	while (*info && (*info)->usb_id != chip->usb_id)
-		info++;
-	if (!*info)
-		return -EINVAL;
-
 	if (!(chip->setup & SCARLETT2_ENABLE)) {
 		usb_audio_info(chip,
 			"Focusrite Scarlett Gen 2 Mixer Driver disabled; "
@@ -2338,7 +2337,7 @@ int snd_scarlett_gen2_init(struct usb_mixer_interface *mixer)
 		"Focusrite Scarlett Gen 2 Mixer Driver enabled pid=0x%04x",
 		USB_ID_PRODUCT(chip->usb_id));
 
-	err = snd_scarlett_gen2_controls_create(mixer, *info);
+	err = snd_scarlett_gen2_controls_create(mixer);
 	if (err < 0)
 		usb_audio_err(mixer->chip,
 			      "Error initialising Scarlett Mixer Driver: %d",
-- 
2.31.1

