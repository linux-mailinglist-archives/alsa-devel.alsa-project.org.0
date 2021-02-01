Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 005C830B20B
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 22:24:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F4571753;
	Mon,  1 Feb 2021 22:23:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F4571753
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612214674;
	bh=8J1MaAmEquUJhCBbhy3zZ9xnxBBkYt0MXex7nYRPpMU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=nY0KKrY65udvP1cRFUzg1cQkJIwjoR6xkIabzwvrWpmDf/GVFASc1y6lRKpyEMZzn
	 v0+zXeMVrpioLp6HuO4w5oDulJWmr2PiMYDjcuShELev5dWITMuZJXO6aQd5YTlJkf
	 AMptKc0EOP2Q05DMl9yB0yUBiBCeYlozwWIPq/f0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6092F800E2;
	Mon,  1 Feb 2021 22:23:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AEC0CF80153; Mon,  1 Feb 2021 22:22:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A1BB5F800E9
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 22:22:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1BB5F800E9
Received: from artex.itiv.kit.edu ([46.142.75.5]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MxUjv-1lrDdZ44SX-00xtic; Mon, 01 Feb 2021 22:22:49 +0100
From: Fabian Lesniak <fabian@lesniak-it.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: usb-audio: add mixer quirks for Pioneer DJM-900NXS2
Date: Mon,  1 Feb 2021 22:22:47 +0100
Message-Id: <20210201212248.54364-1-fabian@lesniak-it.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lTDcqdCS8JJSlowWza3F3cLk3PSQkUme8d76N2+3kttS/DFCo6a
 Fk700B/QvzXPjAbyW9stzNiHOjqpEbbHXv8Tch1aU2Ld+LrxlwHPLTj30Csrodk47PxORPc
 9ZQKnMF8FtOBwTmG7Z7sb7dWpYRCQFtHwkiCh3/lrQaFTST5Ezlx+1T7s8PQq9Xy5ox4Ghn
 2HTD6jIBYdkUQqdeH7lkQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9els9EHKYO0=:011KciEtwNwmCEs8uhsU7t
 F77/fdO58dXN3c1UPe7ZTyGE342gsZpsYsH+jfEH0KgDIGy0WnvVN5/Iu/tq3VDD8cLf9XoFf
 Ug1UYw7sNV4ed+WJ2BVGGkCMyv0gysL5jxcg1I2Ghed28JSK+4Ztt//kJHxBjL0ZsYxgGge8S
 LFyevh/9dUHwEdcNDbuL3ESts8X6LYeaYrntK/QDWcx8EPqXFMVBbEFGX2fddhMnBa446fvva
 fhEDZBtwlio9i+iTgmCqriiQPavQrYJtIrVzSKYC6HEYvx+T5I0+AILLQXUB+akV4TKjUx+BC
 S9xYERJNMkMptw+Irdk2wtyuBJqMjBwIiaeE/7tgfcnJxAlH9W2hBWdBnVXM/YzodffiOILaO
 u20vhP/mPjUfZm9acLTcbcMDJtE8bjy/fv8Fl3tT4U+35iGZns31ipVmAetMTzogOfHDyf3IZ
 L9Vlp2gI2g==
Cc: Takashi Iwai <tiwai@suse.de>, Olivia Mackintosh <livvy@base.nu>,
 =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <franta-linux@frantovo.cz>,
 Fabian Lesniak <fabian@lesniak-it.de>
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

This commit adds mixer quirks for the Pioneer DJM-900NXS2 mixer. This
device has 6 capture channels, 5 of them allow setting the signal
source. This adds controls for these, similar to the DJM-250Mk2.
However, playpack channels are not controllable via software like on the
250Mk2, as they can only be set manually on the mixing console.
Read-only controls showing the currently selected playback channels are
omitted.

This patch is built on top of the DJM750 mixer quirk support and
requires it to be applied first.

Signed-off-by: Fabian Lesniak <fabian@lesniak-it.de>
---
 sound/usb/mixer_quirks.c | 73 +++++++++++++++++++++++++++++++++++++++-
 1 file changed, 72 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 10e472feb757..6688a38321a4 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2777,9 +2777,76 @@ static const struct snd_pioneer_djm_option_group snd_pioneer_djm750_option_group
 	snd_pioneer_djm_option_group_item("CH4 Input", djm750_capture_ch4, 0),
 };
 
+
+/* DJM-900NXS2 */
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_djm900nxs2_capture_ch1[] = {
+	{ .name =  "CH1 Control Tone LINE",    .wValue = 0x0100, .wIndex = 0x8002 },
+	{ .name =  "CH1 Control Tone DITITAL", .wValue = 0x0102, .wIndex = 0x8002 },
+	{ .name =  "CH1 Control Tone PHONO",   .wValue = 0x0103, .wIndex = 0x8002 },
+	{ .name =  "Post CH1 Fader",           .wValue = 0x0106, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader A",            .wValue = 0x0107, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader B",            .wValue = 0x0108, .wIndex = 0x8002 },
+	{ .name =  "MIC",                      .wValue = 0x0109, .wIndex = 0x8002 },
+	{ .name =  "REC OUT",                  .wValue = 0x010a, .wIndex = 0x8002 },
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_djm900nxs2_capture_ch2[] = {
+	{ .name =  "CH2 Control Tone LINE",    .wValue = 0x0200, .wIndex = 0x8002 },
+	{ .name =  "CH2 Control Tone DITITAL", .wValue = 0x0202, .wIndex = 0x8002 },
+	{ .name =  "CH2 Control Tone PHONO",   .wValue = 0x0203, .wIndex = 0x8002 },
+	{ .name =  "Post CH2 Fader",           .wValue = 0x0206, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader A",            .wValue = 0x0207, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader B",            .wValue = 0x0208, .wIndex = 0x8002 },
+	{ .name =  "MIC",                      .wValue = 0x0209, .wIndex = 0x8002 },
+	{ .name =  "REC OUT",                  .wValue = 0x020a, .wIndex = 0x8002 },
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_djm900nxs2_capture_ch3[] = {
+	{ .name =  "CH3 Control Tone LINE",    .wValue = 0x0300, .wIndex = 0x8002 },
+	{ .name =  "CH3 Control Tone DITITAL", .wValue = 0x0302, .wIndex = 0x8002 },
+	{ .name =  "CH3 Control Tone PHONO",   .wValue = 0x0303, .wIndex = 0x8002 },
+	{ .name =  "Post CH3 Fader",           .wValue = 0x0306, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader A",            .wValue = 0x0307, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader B",            .wValue = 0x0308, .wIndex = 0x8002 },
+	{ .name =  "MIC",                      .wValue = 0x0309, .wIndex = 0x8002 },
+	{ .name =  "REC OUT",                  .wValue = 0x030a, .wIndex = 0x8002 },
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_djm900nxs2_capture_ch4[] = {
+	{ .name =  "CH4 Control Tone LINE",    .wValue = 0x0400, .wIndex = 0x8002 },
+	{ .name =  "CH4 Control Tone DITITAL", .wValue = 0x0402, .wIndex = 0x8002 },
+	{ .name =  "CH4 Control Tone PHONO",   .wValue = 0x0403, .wIndex = 0x8002 },
+	{ .name =  "Post CH4 Fader",           .wValue = 0x0406, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader A",            .wValue = 0x0407, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader B",            .wValue = 0x0408, .wIndex = 0x8002 },
+	{ .name =  "MIC",                      .wValue = 0x0409, .wIndex = 0x8002 },
+	{ .name =  "REC OUT",                  .wValue = 0x040a, .wIndex = 0x8002 },
+};
+
+static const struct snd_pioneer_djm_option snd_pioneer_djm_options_djm900nxs2_capture_ch5[] = {
+	{ .name =  "Cross Fader A",            .wValue = 0x0507, .wIndex = 0x8002 },
+	{ .name =  "Cross Fader B",            .wValue = 0x0508, .wIndex = 0x8002 },
+	{ .name =  "MIC",                      .wValue = 0x0509, .wIndex = 0x8002 },
+	{ .name =  "REC OUT",                  .wValue = 0x050a, .wIndex = 0x8002 },
+	{ .name =  "Post Fader A",             .wValue = 0x050b, .wIndex = 0x8002 },
+	{ .name =  "Post Fader B",             .wValue = 0x050c, .wIndex = 0x8002 },
+	{ .name =  "Post Fader C",             .wValue = 0x050d, .wIndex = 0x8002 },
+	{ .name =  "Post Fader D",             .wValue = 0x050e, .wIndex = 0x8002 },
+};
+
+static const struct snd_pioneer_djm_option_group snd_pioneer_djm900nxs2_option_groups[] = {
+	snd_pioneer_djm_option_group_item("Capture Level", capture_level, 0),
+	snd_pioneer_djm_option_group_item("CH1 Input", djm900nxs2_capture_ch1, 2),
+	snd_pioneer_djm_option_group_item("CH2 Input", djm900nxs2_capture_ch2, 2),
+	snd_pioneer_djm_option_group_item("CH3 Input", djm900nxs2_capture_ch3, 2),
+	snd_pioneer_djm_option_group_item("CH4 Input", djm900nxs2_capture_ch4, 2),
+	snd_pioneer_djm_option_group_item("CH5 Input", djm900nxs2_capture_ch5, 3),
+};
+
 static const struct snd_pioneer_djm_device snd_pioneer_djm_devices[] = {
 	{ .name = "DJM-250Mk2", .controls = snd_pioneer_djm250mk2_option_groups, .ncontrols = 7},
-	{ .name = "DJM-750", .controls = snd_pioneer_djm750_option_groups, .ncontrols = 5}
+	{ .name = "DJM-750", .controls = snd_pioneer_djm750_option_groups, .ncontrols = 5},
+	{ .name = "DJM-900NXS2", .controls = snd_pioneer_djm900nxs2_option_groups, .ncontrols = 6}
 };
 
 // layout of the kcontrol->private_value:
@@ -3020,6 +3087,10 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x08e4, 0x017f): /* Pioneer DJ DJM-750 */
 		err = snd_pioneer_djm_controls_create(mixer, 0x01);
 		break;
+	case USB_ID(0x2b73, 0x000a): /* Pioneer DJ DJM-900NXS2 */
+		err = snd_pioneer_djm_controls_create(mixer, 0x02);
+		break;
+
 	}
 
 	return err;
-- 
2.30.0

