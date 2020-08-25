Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E005251C58
	for <lists+alsa-devel@lfdr.de>; Tue, 25 Aug 2020 17:33:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D15EA167E;
	Tue, 25 Aug 2020 17:32:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D15EA167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598369602;
	bh=4NCAlDp2XBJhynOBjW6vTDzV9h2JHK0NMxpKm48bcrE=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=O8AAZ+VhWF8fqQxDTHvLyC8RA0+EO2rIWd1w4DBqzFhYJmyoBxUl5+lQG2qsxC5cJ
	 fPZvystj0CDa+5PLtU3oVwiu6AA7pQFv/lxvMcMr2gvBhv1//g4RTT/8erXKtP1KH7
	 Kp57mOQ3CSJh8c6tlSH/5jBBZy6qVnlOzW0JLkXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B0F12F80260;
	Tue, 25 Aug 2020 17:31:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8E400F8025A; Tue, 25 Aug 2020 17:31:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from posta.frantovo.cz (czf.frantovo.cz [91.219.244.97])
 (using TLSv1.1 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A97F6F80143
 for <alsa-devel@alsa-project.org>; Tue, 25 Aug 2020 17:31:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A97F6F80143
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=frantovo.cz header.i=@frantovo.cz
 header.b="UPEPlHFI"
Received: from posta.frantovo.cz (localhost [127.0.0.1])
 by posta.frantovo.cz (Postfix) with ESMTP id 21E431A3C5A;
 Tue, 25 Aug 2020 17:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=frantovo.cz;
 s=default; t=1598369473;
 bh=4NCAlDp2XBJhynOBjW6vTDzV9h2JHK0NMxpKm48bcrE=;
 h=From:To:Subject:Date;
 b=UPEPlHFIcXg9ynfE1wPulRPRV37w2jrXWwKQ4DBNpir6M2zvPXwcaJO+Tkp48Ut9g
 7ErMs1hqQBwW28hn3Gto4AeXusevLozLaO1lVntpkuj16knRyshkJkyxfKxe7CsqZC
 R9k2DND0jYMrIijtiuvwLlf/l2ONsyU7PegCj6T8=
From: =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <konference@frantovo.cz>
To: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.de>,
 =?UTF-8?q?Franti=C5=A1ek=20Ku=C4=8Dera?= <franta-linux@frantovo.cz>,
 Dmitry Panchenko <dmitry@d-systems.ee>,
 Fabian Lesniak <fabian@lesniak-it.de>
Subject: [PATCH] Add basic capture support for Pioneer DJ DJM-250MK2
Date: Tue, 25 Aug 2020 17:31:13 +0200
Message-Id: <20200825153113.6352-1-konference@frantovo.cz>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.98.1 at posta
X-Virus-Status: Clean
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

From: František Kučera <franta-linux@frantovo.cz>

This patch extends support for DJM-250MK2 and allows recording.
However, DVS is not possible yet (see the comment in code).

Signed-off-by: František Kučera <franta-linux@frantovo.cz>
---
 sound/usb/pcm.c          |  1 +
 sound/usb/quirks-table.h | 62 ++++++++++++++++++++++++++++++++++------
 sound/usb/quirks.c       |  1 +
 3 files changed, 56 insertions(+), 8 deletions(-)

diff --git a/sound/usb/pcm.c b/sound/usb/pcm.c
index 5600751803cf..f5fa11deea4d 100644
--- a/sound/usb/pcm.c
+++ b/sound/usb/pcm.c
@@ -374,6 +374,7 @@ static int set_sync_ep_implicit_fb_quirk(struct snd_usb_substream *subs,
 		ifnum = 2;
 		goto add_sync_ep_from_ifnum;
 	case USB_ID(0x2b73, 0x000a): /* Pioneer DJ DJM-900NXS2 */
+	case USB_ID(0x2b73, 0x0017): /* Pioneer DJ DJM-250MK2 */
 		ep = 0x82;
 		ifnum = 0;
 		goto add_sync_ep_from_ifnum;
diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index f4fb002e3ef4..c6b2f0b8d3e2 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -3549,14 +3549,40 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 {
 	/*
 	 * Pioneer DJ DJM-250MK2
-	 * PCM is 8 channels out @ 48 fixed (endpoints 0x01).
-	 * The output from computer to the mixer is usable.
-	 *
-	 * The input (phono or line to computer) is not working.
-	 * It should be at endpoint 0x82 and probably also 8 channels,
-	 * but it seems that it works only with Pioneer proprietary software.
-	 * Even on officially supported OS, the Audacity was unable to record
-	 * and Mixxx to recognize the control vinyls.
+	 * PCM is 8 channels out @ 48 fixed (endpoint 0x01)
+	 * and 8 channels in @ 48 fixed (endpoint 0x82).
+	 * 
+	 * Both playback and recording is working, even simultaneously.
+	 * 
+	 * Playback channels could be mapped to:
+	 *  - CH1
+	 *  - CH2
+	 *  - AUX
+	 * 
+	 * Recording channels could be mapped to:
+	 *  - Post CH1 Fader
+	 *  - Post CH2 Fader
+	 *  - Cross Fader A
+	 *  - Cross Fader B
+	 *  - MIC
+	 *  - AUX
+	 *  - REC OUT
+	 * 
+	 * There is remaining problem with recording directly from PHONO/LINE.
+	 * If we map a channel to:
+	 *  - CH1 Control Tone PHONO
+	 *  - CH1 Control Tone LINE
+	 *  - CH2 Control Tone PHONO
+	 *  - CH2 Control Tone LINE
+	 * it is silent.
+	 * There is no signal even on other operating systems with official drivers.
+	 * The signal appears only when a supported application is started.
+	 * This needs to be investigated yet...
+	 * (there is quite a lot communication on the USB in both directions)
+	 * 
+	 * In current version this mixer could be used for playback
+	 * and for recording from vinyls (through Post CH* Fader)
+	 * but not for DVS (Digital Vinyl Systems) like in Mixxx.
 	 */
 	USB_DEVICE_VENDOR_SPEC(0x2b73, 0x0017),
 	.driver_info = (unsigned long) &(const struct snd_usb_audio_quirk) {
@@ -3580,6 +3606,26 @@ AU0828_DEVICE(0x2040, 0x7270, "Hauppauge", "HVR-950Q"),
 					.rate_max = 48000,
 					.nr_rates = 1,
 					.rate_table = (unsigned int[]) { 48000 }
+					}
+			},
+			{
+				.ifnum = 0,
+				.type = QUIRK_AUDIO_FIXED_ENDPOINT,
+				.data = &(const struct audioformat) {
+					.formats = SNDRV_PCM_FMTBIT_S24_3LE,
+					.channels = 8, // inputs
+					.iface = 0,
+					.altsetting = 1,
+					.altset_idx = 1,
+					.endpoint = 0x82,
+					.ep_attr = USB_ENDPOINT_XFER_ISOC|
+						USB_ENDPOINT_SYNC_ASYNC|
+						USB_ENDPOINT_USAGE_IMPLICIT_FB,
+					.rates = SNDRV_PCM_RATE_48000,
+					.rate_min = 48000,
+					.rate_max = 48000,
+					.nr_rates = 1,
+					.rate_table = (unsigned int[]) { 48000 }
 				}
 			},
 			{
diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index abf99b814a0f..6a0be7e7f4fe 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -1493,6 +1493,7 @@ void snd_usb_set_format_quirk(struct snd_usb_substream *subs,
 		set_format_emu_quirk(subs, fmt);
 		break;
 	case USB_ID(0x2b73, 0x000a): /* Pioneer DJ DJM-900NXS2 */
+	case USB_ID(0x2b73, 0x0017): /* Pioneer DJ DJM-250MK2 */
 		pioneer_djm_set_format_quirk(subs);
 		break;
 	case USB_ID(0x534d, 0x2109): /* MacroSilicon MS2109 */
-- 
2.20.1

