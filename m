Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F7D18FAF3
	for <lists+alsa-devel@lfdr.de>; Mon, 23 Mar 2020 18:08:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A9761657;
	Mon, 23 Mar 2020 18:07:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A9761657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584983316;
	bh=HaX0v5NvAshyFiLlcq2y0ISnKWEqwlydqiRdvFnUOy8=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IjVzc60+oZj/8FnMvOELWNaolfensHtenPtgSWbANi3u80WPEzwFHtUV+q8A0FJ28
	 Ei5oCYvQbWDl8p6VhiR8XidtTBry03MOll7oNpGLbzmOEgaDApdIyx67s0mhOfg0bE
	 u6jvFgw/rMERvsYjRWMBOQODSptVK7VcQntCRX3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D553F80147;
	Mon, 23 Mar 2020 18:06:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2367EF8015A; Mon, 23 Mar 2020 18:06:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D0B77F80095
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 18:06:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0B77F80095
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7FFC2ACA4
 for <alsa-devel@alsa-project.org>; Mon, 23 Mar 2020 17:06:47 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH 2/2] ALSA: usb-audio: Avoid shoving a new stream into already
 registered device
Date: Mon, 23 Mar 2020 18:06:43 +0100
Message-Id: <20200323170643.19181-2-tiwai@suse.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200323170643.19181-1-tiwai@suse.de>
References: <20200323170643.19181-1-tiwai@suse.de>
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

USB-audio driver registers the card and its devices at each probe of
USB interface, while trying to append a USB substream into the empty
PCM stream slot.  This works for most cases where the all PCM streams
are declared in the single interface description.  However, when the
device provides multiple individual interfaces, this may up with
pushing a new stream into the existing snd_pcm object that has been
already registered.  From the driver perspective, it's OK, but it
doesn't work for PulseAudio and others because they manage in the card
registration level, hence they'll miss this new device creation.

This patch tries to warn such a too-late-appended stream, and also
tries to put rather into a new snd_pcm object.

If we get a report from a user about this, we may add it to an entry
for snd_usb_registration_quirk().

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 sound/usb/stream.c   | 9 +++++++++
 sound/usb/usbaudio.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/sound/usb/stream.c b/sound/usb/stream.c
index afd5aa574611..6c758af069e6 100644
--- a/sound/usb/stream.c
+++ b/sound/usb/stream.c
@@ -502,6 +502,15 @@ static int __snd_usb_add_audio_stream(struct snd_usb_audio *chip,
 		subs = &as->substream[stream];
 		if (subs->ep_num)
 			continue;
+		if (snd_device_get_state(chip->card, as->pcm) !=
+		    SNDRV_DEV_BUILD) {
+			if (!chip->pcm_devs_warned) {
+				usb_audio_warn(chip, "PCM stream already registered\n");
+				usb_audio_warn(chip, "Please report to upstream for assigning the delayed card registration\n");
+				chip->pcm_devs_warned = true;
+			}
+			continue;
+		}
 		err = snd_pcm_new_stream(as->pcm, stream, 1);
 		if (err < 0)
 			return err;
diff --git a/sound/usb/usbaudio.h b/sound/usb/usbaudio.h
index 6fe3ab582ec6..b2b693eeca91 100644
--- a/sound/usb/usbaudio.h
+++ b/sound/usb/usbaudio.h
@@ -34,6 +34,7 @@ struct snd_usb_audio {
 	unsigned int txfr_quirk:1; /* Subframe boundaries on transfers */
 	unsigned int tx_length_quirk:1; /* Put length specifier in transfers */
 	unsigned int setup_fmt_after_resume_quirk:1; /* setup the format to interface after resume */
+	unsigned int pcm_devs_warned:1; /* warned for delayed PCM registrations */
 	int num_interfaces;
 	int num_suspended_intf;
 	int sample_rate_read_error;
-- 
2.16.4

