Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 243FE3113EF
	for <lists+alsa-devel@lfdr.de>; Fri,  5 Feb 2021 22:53:16 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 280F6167F;
	Fri,  5 Feb 2021 22:52:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 280F6167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612561995;
	bh=roRwl5iM2h8zwbhexG7aGor4JFLqz2q68j3zoWU9KOg=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pZxAtBwrLytriFG9L2s3FsypIgVrOmCP+uCF9ZtsWoZUjWJlj/PAjq9q7uPMZ8Suh
	 kfwXfHB4mAaAFPUoD0/HLWIHWLwnGoJM07w6Q7FZX1qicHrUVJ9fgKEJXgg/NyDURZ
	 +IaXzMgndhndTXU0E5MiSrDKsI8lHDEMVQAfJJ4o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E0A96F80224;
	Fri,  5 Feb 2021 22:51:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 483AAF8015A; Fri,  5 Feb 2021 22:51:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 58858F800C0
 for <alsa-devel@alsa-project.org>; Fri,  5 Feb 2021 22:51:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 58858F800C0
Received: from artex.itiv.kit.edu ([89.244.177.100]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MgNpJ-1lZkaY2ClT-00hso7; Fri, 05 Feb 2021 22:51:17 +0100
From: Fabian Lesniak <fabian@lesniak-it.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2 1/1] ALSA: usb-audio: add mixer quirks for Pioneer
 DJM-900NXS2
Date: Fri,  5 Feb 2021 22:51:16 +0100
Message-Id: <20210205215116.258724-2-fabian@lesniak-it.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210205215116.258724-1-fabian@lesniak-it.de>
References: <s5h1rdyfz3f.wl-tiwai@suse.de>
 <20210205215116.258724-1-fabian@lesniak-it.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rGDflf8NOljT8SmEqpn4XI2YSRi1ISoGwNvYFTei3sN0g4Vqgj5
 dKhcGZB5qdiYC+GtKn5yZ+yln8I7eRSKbHtQIPVLhW11xA0I/QwdEl3cBLpSmNWKOLhgOHL
 Y+67w/GiDM2U0wpE2y8WNXGdndcTDQB8Vv8CvkmX2cL4TzAABVI1yOS2IM0MgYmMARD1byp
 gu9Ztg9HlwYWKwnpaQfew==
X-UI-Out-Filterresults: notjunk:1;V03:K0:RpXS25mTvWY=:XS4gkbSHtRPeN/oC1DN3gn
 T0rQsApTzZ9qlycSekcffrequ4m/YEFraTc6Ba/wbKyl5haY2OZ0mYAyIlcKXprNa4f9M+e7+
 6WOZQK+NgjqN044KFlLTzPhFuXwHwQGTGvNMl9EbP6qJJ9ho2hFFh4nga3SxCvay1hLwOClLX
 9w7kmtgDXxV8DV3683xnp48vWNf1SF4QfzGKeNz1B2L606qXmceBWHB3cGzR/Cl4shtlyaJbh
 ASchdwBrdit61pYLsxuXrGHWBzqsqWf0UmalVoQXKelDW5tq0DT5AjNeMf5bnGYcxRePO8e7i
 gAOTCSEKDOlkvOFXxi6Ps+VTOlovde7HxthpsU4cXT674cZTmLJz1OFiI+nSimUkH0ndSuAZi
 M6qdEhaHNiWOC49twB6id9zss1yiil3FuZ5yI4f2uhtgTX8C84fAD46fOtack2KshWogueD3O
 0TwhMxMxdw==
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

Signed-off-by: Fabian Lesniak <fabian@lesniak-it.de>
---
 sound/usb/mixer_quirks.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 9d0ac2aa9044..08873d2afe4d 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -2618,6 +2618,7 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
 // Capture types
 #define SND_DJM_CAP_LINE	0x00
 #define SND_DJM_CAP_CDLINE	0x01
+#define SND_DJM_CAP_DIGITAL	0x02
 #define SND_DJM_CAP_PHONO	0x03
 #define SND_DJM_CAP_PFADER	0x06
 #define SND_DJM_CAP_XFADERA	0x07
@@ -2628,6 +2629,8 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
 #define SND_DJM_CAP_NONE	0x0f
 #define SND_DJM_CAP_CH1PFADER	0x11
 #define SND_DJM_CAP_CH2PFADER	0x12
+#define SND_DJM_CAP_CH3PFADER	0x13
+#define SND_DJM_CAP_CH4PFADER	0x14
 
 // Playback types
 #define SND_DJM_PB_CH1		0x00
@@ -2648,6 +2651,7 @@ static int snd_bbfpro_controls_create(struct usb_mixer_interface *mixer)
 // device table index
 #define SND_DJM_250MK2_IDX	0x0
 #define SND_DJM_750_IDX		0x1
+#define SND_DJM_900NXS2_IDX	0x2
 
 
 #define SND_DJM_CTL(_name, suffix, _default_value, _windex) { \
@@ -2692,6 +2696,7 @@ static const char *snd_djm_get_label_cap(u16 wvalue)
 	switch (wvalue & 0x00ff) {
 	case SND_DJM_CAP_LINE:		return "Control Tone LINE";
 	case SND_DJM_CAP_CDLINE:	return "Control Tone CD/LINE";
+	case SND_DJM_CAP_DIGITAL:	return "Control Tone DIGITAL";
 	case SND_DJM_CAP_PHONO:		return "Control Tone PHONO";
 	case SND_DJM_CAP_PFADER:	return "Post Fader";
 	case SND_DJM_CAP_XFADERA:	return "Cross Fader A";
@@ -2702,6 +2707,8 @@ static const char *snd_djm_get_label_cap(u16 wvalue)
 	case SND_DJM_CAP_NONE:		return "None";
 	case SND_DJM_CAP_CH1PFADER:	return "Post Fader Ch1";
 	case SND_DJM_CAP_CH2PFADER:	return "Post Fader Ch2";
+	case SND_DJM_CAP_CH3PFADER:	return "Post Fader Ch3";
+	case SND_DJM_CAP_CH4PFADER:	return "Post Fader Ch4";
 	default:			return NULL;
 	}
 };
@@ -2774,9 +2781,32 @@ static const struct snd_djm_ctl snd_djm_ctls_750[] = {
 };
 
 
+// DJM-900NXS2
+static const u16 snd_djm_opts_900nxs2_cap1[] = {
+	0x0100, 0x0102, 0x0103, 0x0106, 0x0107, 0x0108, 0x0109, 0x010a };
+static const u16 snd_djm_opts_900nxs2_cap2[] = {
+	0x0200, 0x0202, 0x0203, 0x0206, 0x0207, 0x0208, 0x0209, 0x020a };
+static const u16 snd_djm_opts_900nxs2_cap3[] = {
+	0x0300, 0x0302, 0x0303, 0x0306, 0x0307, 0x0308, 0x0309, 0x030a };
+static const u16 snd_djm_opts_900nxs2_cap4[] = {
+	0x0400, 0x0402, 0x0403, 0x0406, 0x0407, 0x0408, 0x0409, 0x040a };
+static const u16 snd_djm_opts_900nxs2_cap5[] = {
+	0x0507, 0x0508, 0x0509, 0x050a, 0x0511, 0x0512, 0x0513, 0x0514 };
+
+static const struct snd_djm_ctl snd_djm_ctls_900nxs2[] = {
+	SND_DJM_CTL("Capture Level", cap_level, 0, SND_DJM_WINDEX_CAPLVL),
+	SND_DJM_CTL("Ch1 Input",   900nxs2_cap1, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch2 Input",   900nxs2_cap2, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch3 Input",   900nxs2_cap3, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch4 Input",   900nxs2_cap4, 2, SND_DJM_WINDEX_CAP),
+	SND_DJM_CTL("Ch5 Input",   900nxs2_cap5, 3, SND_DJM_WINDEX_CAP)
+};
+
+
 static const struct snd_djm_device snd_djm_devices[] = {
 	SND_DJM_DEVICE(250mk2),
-	SND_DJM_DEVICE(750)
+	SND_DJM_DEVICE(750),
+	SND_DJM_DEVICE(900nxs2)
 };
 
 
@@ -3015,6 +3045,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x08e4, 0x017f): /* Pioneer DJ DJM-750 */
 		err = snd_djm_controls_create(mixer, SND_DJM_750_IDX);
 		break;
+	case USB_ID(0x2b73, 0x000a): /* Pioneer DJ DJM-900NXS2 */
+		err = snd_djm_controls_create(mixer, SND_DJM_900NXS2_IDX);
+		break;
 	}
 
 	return err;
-- 
2.30.0

