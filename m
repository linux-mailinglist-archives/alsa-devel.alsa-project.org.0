Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6682581DC1A
	for <lists+alsa-devel@lfdr.de>; Sun, 24 Dec 2023 20:29:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AF2DBE87;
	Sun, 24 Dec 2023 20:28:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AF2DBE87
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1703446143;
	bh=SafATJ4J06BQ739Wsr5d0KivI7durzQVqhE/HwQbgiE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=urEjBxlLcFLfk8QxF/RyjmlXl89BrXS+O8FCqGRLeMt7b7rLb44543GFxBOo1QvG5
	 ce6/R5Gx/Hab6F1aJBv3sIzZ2yWnuTSeT8Z0jQEyqIdpgKLvvs5MQlfh+AWDYetYnC
	 zk1q/W6VQJtY1I16W1FD1/lYYXDcg16IOf1H2Pmk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5C65CF80621; Sun, 24 Dec 2023 20:28:01 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A655F8060F;
	Sun, 24 Dec 2023 20:28:01 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7ED8EF80600; Sun, 24 Dec 2023 20:27:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from m.b4.vu (m.b4.vu [203.16.231.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5501FF80537
	for <alsa-devel@alsa-project.org>; Sun, 24 Dec 2023 20:27:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5501FF80537
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=b4.vu header.i=@b4.vu header.a=rsa-sha256 header.s=m1
 header.b=bHwT+nGa
Received: by m.b4.vu (Postfix, from userid 1000)
	id 5B893604B9CB; Mon, 25 Dec 2023 05:57:34 +1030 (ACDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 m.b4.vu 5B893604B9CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=b4.vu; s=m1;
	t=1703446054; bh=kQ11xVrvoNcwhwuFNR1E2VAblkB3uYQV1k35Q3b0EgQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bHwT+nGakoU7fIIgAvd1cQ2oz5aJGBtUp+3yGdAA3rNRGnn2h5p4DGn0Iw1zcNp1F
	 FjC7g+GgAzlOcSwigMkWC/QWgJCKs+ZwtvXyVlQ4nNh2tPDd4or3h56WIQtb+UPcLJ
	 +HZurIYgEloKltCrecdws8bd7Nwv/h+4Q1RiiN7WiO0bG5++V7U/d0YyXEl5Le3DuT
	 GoTaPd15ix33fRhFonmEds7bIGqSloNeda/it+mT4AzQgR/3MnyNSCKllGnntZoSKs
	 iXPhpvvqn4PxZecwo3n7AL8ykEfJs/yCsCmCYGujs6kw3V5dXqhees29otqyNJX95S
	 6Ctx1JRx2prjw==
Date: Mon, 25 Dec 2023 05:57:34 +1030
From: "Geoffrey D. Bennett" <g@b4.vu>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 11/23] ALSA: scarlett2: Formatting fixes
Message-ID: <72be568b02eea12621b0c4a96f8e8cc65b0c13c0.1703444932.git.g@b4.vu>
References: <cover.1703444932.git.g@b4.vu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1703444932.git.g@b4.vu>
Message-ID-Hash: FAOH6Z7BDIOCHSRYLTHUGVOHVPJPIQTV
X-Message-ID-Hash: FAOH6Z7BDIOCHSRYLTHUGVOHVPJPIQTV
X-MailFrom: g@b4.vu
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FAOH6Z7BDIOCHSRYLTHUGVOHVPJPIQTV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add missing blank line before comment.

For consistency with other functions that have few parameters, move
the parameters onto the same line as the function name.

Signed-off-by: Geoffrey D. Bennett <g@b4.vu>
---
 sound/usb/mixer_scarlett2.c | 22 ++++++++--------------
 1 file changed, 8 insertions(+), 14 deletions(-)

diff --git a/sound/usb/mixer_scarlett2.c b/sound/usb/mixer_scarlett2.c
index f15ee9e6c2eb..0fd919490cc6 100644
--- a/sound/usb/mixer_scarlett2.c
+++ b/sound/usb/mixer_scarlett2.c
@@ -2149,6 +2149,7 @@ static int scarlett2_add_firmware_version_ctl(
 	return scarlett2_add_new_ctl(mixer, &scarlett2_firmware_version_ctl,
 				     0, 0, "Firmware Version", NULL);
 }
+
 /*** Sync Control ***/
 
 /* Update sync control after receiving notification that the status
@@ -3373,8 +3374,7 @@ static const struct snd_kcontrol_new scarlett2_speaker_switch_enum_ctl = {
 	.put  = scarlett2_speaker_switch_enum_ctl_put,
 };
 
-static int scarlett2_add_speaker_switch_ctl(
-	struct usb_mixer_interface *mixer)
+static int scarlett2_add_speaker_switch_ctl(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
@@ -3542,8 +3542,7 @@ static const struct snd_kcontrol_new scarlett2_talkback_map_ctl = {
 	.put  = scarlett2_talkback_map_ctl_put,
 };
 
-static int scarlett2_add_talkback_ctls(
-	struct usb_mixer_interface *mixer)
+static int scarlett2_add_talkback_ctls(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 	const struct scarlett2_device_info *info = private->info;
@@ -4611,8 +4610,7 @@ static int scarlett2_read_configs(struct usb_mixer_interface *mixer)
 }
 
 /* Notify on sync change */
-static void scarlett2_notify_sync(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_sync(struct usb_mixer_interface *mixer)
 {
 	struct scarlett2_data *private = mixer->private_data;
 
@@ -4623,8 +4621,7 @@ static void scarlett2_notify_sync(
 }
 
 /* Notify on monitor change */
-static void scarlett2_notify_monitor(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_monitor(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
@@ -4650,8 +4647,7 @@ static void scarlett2_notify_monitor(
 }
 
 /* Notify on dim/mute change */
-static void scarlett2_notify_dim_mute(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_dim_mute(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
@@ -4677,8 +4673,7 @@ static void scarlett2_notify_dim_mute(
 }
 
 /* Notify on "input other" change (level/pad/air) */
-static void scarlett2_notify_input_other(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_input_other(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
@@ -4704,8 +4699,7 @@ static void scarlett2_notify_input_other(
 /* Notify on "monitor other" change (direct monitor, speaker
  * switching, talkback)
  */
-static void scarlett2_notify_monitor_other(
-	struct usb_mixer_interface *mixer)
+static void scarlett2_notify_monitor_other(struct usb_mixer_interface *mixer)
 {
 	struct snd_card *card = mixer->chip->card;
 	struct scarlett2_data *private = mixer->private_data;
-- 
2.43.0

