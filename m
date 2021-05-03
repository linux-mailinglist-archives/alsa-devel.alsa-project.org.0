Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E067371405
	for <lists+alsa-devel@lfdr.de>; Mon,  3 May 2021 13:10:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1FB511688;
	Mon,  3 May 2021 13:09:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1FB511688
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620040211;
	bh=acdj9hfxoOXCMr3UckrXGudOCXg7Vu73LmrgeiqN2VU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=p7gjCaLPnFwePk3hvq5BJruo5O+KNK1gEG6rN5yZxWI29v8irsZvR6ZxsNsZneaIh
	 Gh1PEyUWMJdCzauD1PXr+wiCUu2DZGHyXBdErbLzAYOam4GC7HmEEN070Se9tN2taq
	 6tDXF/Sxn4OyVoD6029PuMdvjv4iGO4wTHS+KBZU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88B9FF80268;
	Mon,  3 May 2021 13:08:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C5ABF8025F; Mon,  3 May 2021 13:08:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD1FBF80111
 for <alsa-devel@alsa-project.org>; Mon,  3 May 2021 13:08:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD1FBF80111
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1841CB16A;
 Mon,  3 May 2021 11:08:26 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: Add dB range mapping for Sennheiser
 Communications Headset PC 8
Date: Mon,  3 May 2021 13:08:22 +0200
Message-Id: <20210503110822.10222-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Timo Gurr <timo.gurr@gmail.com>
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

From: Timo Gurr <timo.gurr@gmail.com>

The decibel volume range contains a negative maximum value resulting in
pipewire complaining about the device and effectivly having no sound
output. The wrong values also resulted in the headset sounding muted
already at a mixer level of about ~25%.

PipeWire BugLink: https://gitlab.freedesktop.org/pipewire/pipewire/-/issues/1049

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=212897
Signed-off-by: Timo Gurr <timo.gurr@gmail.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/mixer_maps.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 646deb6244b1..c5794e83fd80 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -337,6 +337,13 @@ static const struct usbmix_name_map bose_companion5_map[] = {
 	{ 0 }	/* terminator */
 };
 
+/* Sennheiser Communications Headset [PC 8], the dB value is reported as -6 negative maximum  */
+static const struct usbmix_dB_map sennheiser_pc8_dB = {-9500, 0};
+static const struct usbmix_name_map sennheiser_pc8_map[] = {
+	{ 9, NULL, .dB = &sennheiser_pc8_dB },
+	{ 0 }   /* terminator */
+};
+
 /*
  * Dell usb dock with ALC4020 codec had a firmware problem where it got
  * screwed up when zero volume is passed; just skip it as a workaround
@@ -593,6 +600,11 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] = {
 		.id = USB_ID(0x17aa, 0x1046),
 		.map = lenovo_p620_rear_map,
 	},
+	{
+		/* Sennheiser Communications Headset [PC 8] */
+		.id = USB_ID(0x1395, 0x0025),
+		.map = sennheiser_pc8_map,
+	},
 	{ 0 } /* terminator */
 };
 
-- 
2.26.2

