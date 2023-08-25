Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB8478A06D
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:08:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 83A42DFA;
	Sun, 27 Aug 2023 19:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 83A42DFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693156097;
	bh=vfJUumv8VGo/i4/7+nwzJ+JRA+oMekpRgE2OGvSEkzY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Npw+/VBeTJ2bdoXwlC2KHkQsd5x8R+P6rI39CiP6AQvJIqufbKa7hZDoYRDHNNms5
	 G3RaQfhZ1LlRjSr6HSGMiYoLUF9jLjsPs6l6sOCFpoFmtFSVDFVbxL5E1+znd9zIAM
	 XtW9Lsu6wydd9Nw+Tr3i5G/QdKjg8X8KlZWq8+es=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 718CFF8063C; Sun, 27 Aug 2023 19:03:26 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2AA3F80638;
	Sun, 27 Aug 2023 19:03:25 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F4065F804DA; Sat, 26 Aug 2023 00:22:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DCC10F80536
	for <alsa-devel@alsa-project.org>; Sat, 26 Aug 2023 00:22:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCC10F80536
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id AED15242B1;
	Fri, 25 Aug 2023 18:21:57 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qZfBl-iTz-00; Sat, 26 Aug 2023 00:21:57 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 2/3] ALSA: emu10k1: more documentation updates
Date: Sat, 26 Aug 2023 00:21:56 +0200
Message-Id: <20230825222157.170978-2-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230825222157.170978-1-oswald.buddenhagen@gmx.de>
References: <20230825222157.170978-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: P3OK22ONOB3MY327F3M5PCHWYKBD6BBI
X-Message-ID-Hash: P3OK22ONOB3MY327F3M5PCHWYKBD6BBI
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:03:09 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/P3OK22ONOB3MY327F3M5PCHWYKBD6BBI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

- Clarify the data flows. For SB Live! I fixed only the most obvious
  point ("from" vs. "for").
- Mention 7.1 side channels on Audigy.
- Be unspecific about the output DACs on Audigy, as lots of variants
  actually exist (see emu_chip_details table).

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 Documentation/sound/cards/audigy-mixer.rst  | 130 ++++++++++----------
 Documentation/sound/cards/sb-live-mixer.rst |  24 ++--
 2 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/Documentation/sound/cards/audigy-mixer.rst b/Documentation/sound/cards/audigy-mixer.rst
index 51cc7ac034ce..7ebaacb6df3d 100644
--- a/Documentation/sound/cards/audigy-mixer.rst
+++ b/Documentation/sound/cards/audigy-mixer.rst
@@ -46,157 +46,158 @@ FX-bus
 
 name='PCM Front Playback Volume',index=0
 ----------------------------------------
-This control is used to attenuate samples for left and right front PCM FX-bus
+This control is used to attenuate samples from left and right front PCM FX-bus
 accumulators. ALSA uses accumulators 8 and 9 for left and right front PCM 
-samples for 5.1 playback. The result samples are forwarded to the front DAC PCM 
-slots of the Philips DAC.
+samples for 5.1 playback. The result samples are forwarded to the front speakers.
 
 name='PCM Surround Playback Volume',index=0
 -------------------------------------------
-This control is used to attenuate samples for left and right surround PCM FX-bus
+This control is used to attenuate samples from left and right surround PCM FX-bus
 accumulators. ALSA uses accumulators 2 and 3 for left and right surround PCM 
-samples for 5.1 playback. The result samples are forwarded to the surround DAC PCM 
-slots of the Philips DAC.
+samples for 5.1 playback. The result samples are forwarded to the surround (rear)
+speakers.
+
+name='PCM Side Playback Volume',index=0
+---------------------------------------
+This control is used to attenuate samples from left and right side PCM FX-bus
+accumulators. ALSA uses accumulators 14 and 15 for left and right side PCM
+samples for 7.1 playback. The result samples are forwarded to the side speakers.
 
 name='PCM Center Playback Volume',index=0
 -----------------------------------------
-This control is used to attenuate samples for center PCM FX-bus accumulator.
-ALSA uses accumulator 6 for center PCM sample for 5.1 playback. The result sample
-is forwarded to the center DAC PCM slot of the Philips DAC.
+This control is used to attenuate samples from center PCM FX-bus accumulator.
+ALSA uses accumulator 6 for center PCM samples for 5.1 playback. The result
+samples are forwarded to the center speaker.
 
 name='PCM LFE Playback Volume',index=0
 --------------------------------------
 This control is used to attenuate sample for LFE PCM FX-bus accumulator. 
-ALSA uses accumulator 7 for LFE PCM sample for 5.1 playback. The result sample 
-is forwarded to the LFE DAC PCM slot of the Philips DAC.
+ALSA uses accumulator 7 for LFE PCM samples for 5.1 playback. The result
+samples are forwarded to the subwoofer.
 
 name='PCM Playback Volume',index=0
 ----------------------------------
-This control is used to attenuate samples for left and right PCM FX-bus
+This control is used to attenuate samples from left and right PCM FX-bus
 accumulators. ALSA uses accumulators 0 and 1 for left and right PCM samples for
-stereo playback. The result samples are forwarded to the front DAC PCM slots 
-of the Philips DAC.
+stereo playback. The result samples are forwarded to the front speakers.
 
 name='PCM Capture Volume',index=0
 ---------------------------------
-This control is used to attenuate samples for left and right PCM FX-bus
-accumulator. ALSA uses accumulators 0 and 1 for left and right PCM.
-The result is forwarded to the ADC capture FIFO (thus to the standard capture
-PCM device).
+This control is used to attenuate samples from left and right PCM FX-bus
+accumulators. ALSA uses accumulators 0 and 1 for left and right PCM samples for
+stereo playback. The result is forwarded to the standard capture PCM device.
 
 name='Music Playback Volume',index=0
 ------------------------------------
-This control is used to attenuate samples for left and right MIDI FX-bus
+This control is used to attenuate samples from left and right MIDI FX-bus
 accumulators. ALSA uses accumulators 4 and 5 for left and right MIDI samples.
-The result samples are forwarded to the front DAC PCM slots of the AC97 codec.
+The result samples are forwarded to the virtual stereo mixer.
 
 name='Music Capture Volume',index=0
 -----------------------------------
-These controls are used to attenuate samples for left and right MIDI FX-bus
-accumulator. ALSA uses accumulators 4 and 5 for left and right PCM.
-The result is forwarded to the ADC capture FIFO (thus to the standard capture
-PCM device).
+These controls are used to attenuate samples from left and right MIDI FX-bus
+accumulator. ALSA uses accumulators 4 and 5 for left and right MIDI samples.
+The result is forwarded to the standard capture PCM device.
 
 name='Mic Playback Volume',index=0
 ----------------------------------
-This control is used to attenuate samples for left and right Mic input.
-For Mic input is used AC97 codec. The result samples are forwarded to 
-the front DAC PCM slots of the Philips DAC. Samples are forwarded to Mic
-capture FIFO (device 1 - 16bit/8KHz mono) too without volume control.
+This control is used to attenuate samples from left and right Mic input of
+the AC97 codec. The result samples are forwarded to the virtual stereo mixer.
 
 name='Mic Capture Volume',index=0
 ---------------------------------
-This control is used to attenuate samples for left and right Mic input.
-The result is forwarded to the ADC capture FIFO (thus to the standard capture
-PCM device).
+This control is used to attenuate samples from left and right Mic input of
+the AC97 codec. The result is forwarded to the standard capture PCM device.
+
+The original samples are also forwarded to the Mic capture PCM device (device 1;
+16bit/8KHz mono) without volume control.
 
 name='Audigy CD Playback Volume',index=0
 ----------------------------------------
 This control is used to attenuate samples from left and right IEC958 TTL
 digital inputs (usually used by a CDROM drive). The result samples are
-forwarded to the front DAC PCM slots of the Philips DAC.
+forwarded to the virtual stereo mixer.
 
 name='Audigy CD Capture Volume',index=0
 ---------------------------------------
 This control is used to attenuate samples from left and right IEC958 TTL
-digital inputs (usually used by a CDROM drive). The result samples are
-forwarded to the ADC capture FIFO (thus to the standard capture PCM device).
+digital inputs (usually used by a CDROM drive). The result is forwarded
+to the standard capture PCM device.
 
 name='IEC958 Optical Playback Volume',index=0
 ---------------------------------------------
 This control is used to attenuate samples from left and right IEC958 optical
-digital input. The result samples are forwarded to the front DAC PCM slots
-of the Philips DAC.
+digital input. The result samples are forwarded to the virtual stereo mixer.
 
 name='IEC958 Optical Capture Volume',index=0
 --------------------------------------------
 This control is used to attenuate samples from left and right IEC958 optical
-digital inputs. The result samples are forwarded to the ADC capture FIFO
-(thus to the standard capture PCM device).
+digital inputs. The result is forwarded to the standard capture PCM device.
 
 name='Line2 Playback Volume',index=0
 ------------------------------------
 This control is used to attenuate samples from left and right I2S ADC
-inputs (on the AudigyDrive). The result samples are forwarded to the front
-DAC PCM slots of the Philips DAC.
+inputs (on the AudigyDrive). The result samples are forwarded to the virtual
+stereo mixer.
 
 name='Line2 Capture Volume',index=1
 -----------------------------------
 This control is used to attenuate samples from left and right I2S ADC
-inputs (on the AudigyDrive). The result samples are forwarded to the ADC
-capture FIFO (thus to the standard capture PCM device).
+inputs (on the AudigyDrive). The result is forwarded to the standard capture
+PCM device.
 
 name='Analog Mix Playback Volume',index=0
 -----------------------------------------
 This control is used to attenuate samples from left and right I2S ADC
-inputs from Philips ADC. The result samples are forwarded to the front
-DAC PCM slots of the Philips DAC. This contains mix from analog sources
-like CD, Line In, Aux, ....
+inputs from Philips ADC. The result samples are forwarded to the virtual
+stereo mixer. This contains mix from analog sources like CD, Line In, Aux, ....
 
 name='Analog Mix Capture Volume',index=1
 ----------------------------------------
 This control is used to attenuate samples from left and right I2S ADC
-inputs Philips ADC. The result samples are forwarded to the ADC
-capture FIFO (thus to the standard capture PCM device).
+inputs Philips ADC. The result is forwarded to the standard capture PCM device.
 
 name='Aux2 Playback Volume',index=0
 -----------------------------------
 This control is used to attenuate samples from left and right I2S ADC
-inputs (on the AudigyDrive). The result samples are forwarded to the front
-DAC PCM slots of the Philips DAC.
+inputs (on the AudigyDrive). The result samples are forwarded to the virtual
+stereo mixer.
 
 name='Aux2 Capture Volume',index=1
 ----------------------------------
 This control is used to attenuate samples from left and right I2S ADC
-inputs (on the AudigyDrive). The result samples are forwarded to the ADC
-capture FIFO (thus to the standard capture PCM device).
+inputs (on the AudigyDrive). The result is forwarded to the standard capture
+PCM device.
 
 name='Front Playback Volume',index=0
 ------------------------------------
-All stereo signals are mixed together and mirrored to surround, center and LFE.
-This control is used to attenuate samples for left and right front speakers of
-this mix.
+This control is used to attenuate samples from the virtual stereo mixer.
+The result samples are forwarded to the front speakers.
 
 name='Surround Playback Volume',index=0
 ---------------------------------------
-All stereo signals are mixed together and mirrored to surround, center and LFE.
-This control is used to attenuate samples for left and right surround speakers of
-this mix.
+This control is used to attenuate samples from the virtual stereo mixer.
+The result samples are forwarded to the surround (rear) speakers.
+
+name='Side Playback Volume',index=0
+-----------------------------------
+This control is used to attenuate samples from the virtual stereo mixer.
+The result samples are forwarded to the side speakers.
 
 name='Center Playback Volume',index=0
 -------------------------------------
-All stereo signals are mixed together and mirrored to surround, center and LFE.
-This control is used to attenuate sample for center speaker of this mix.
+This control is used to attenuate samples from the virtual stereo mixer.
+The result samples are forwarded to the center speaker.
 
 name='LFE Playback Volume',index=0
 ----------------------------------
-All stereo signals are mixed together and mirrored to surround, center and LFE.
-This control is used to attenuate sample for LFE speaker of this mix.
+This control is used to attenuate samples from the virtual stereo mixer.
+The result samples are forwarded to the subwoofer.
 
 name='Tone Control - Switch',index=0
 ------------------------------------
-This control turns the tone control on or off. The samples for front, rear
-and center / LFE outputs are affected.
+This control turns the tone control on or off. The samples forwarded to
+the speaker outputs are affected.
 
 name='Tone Control - Bass',index=0
 ----------------------------------
@@ -212,8 +213,7 @@ The closest value to pure signal is 20.
 
 name='Master Playback Volume',index=0
 -------------------------------------
-This control is used to attenuate samples for front, surround, center and 
-LFE outputs.
+This control is used to attenuate samples forwarded to the speaker outputs.
 
 name='IEC958 Optical Raw Playback Switch',index=0
 -------------------------------------------------
diff --git a/Documentation/sound/cards/sb-live-mixer.rst b/Documentation/sound/cards/sb-live-mixer.rst
index 4dd9bfe01bd8..27667f58aae1 100644
--- a/Documentation/sound/cards/sb-live-mixer.rst
+++ b/Documentation/sound/cards/sb-live-mixer.rst
@@ -61,61 +61,61 @@ FX-bus
 
 ``name='Wave Playback Volume',index=0``
 ---------------------------------------
-This control is used to attenuate samples for left and right PCM FX-bus
+This control is used to attenuate samples from left and right PCM FX-bus
 accumulators. ALSA uses accumulators 0 and 1 for left and right PCM samples.
 The result samples are forwarded to the front DAC PCM slots of the AC97 codec.
 
 ``name='Wave Surround Playback Volume',index=0``
 ------------------------------------------------
-This control is used to attenuate samples for left and right PCM FX-bus
+This control is used to attenuate samples from left and right PCM FX-bus
 accumulators. ALSA uses accumulators 0 and 1 for left and right PCM samples.
 The result samples are forwarded to the rear I2S DACs. These DACs operates
 separately (they are not inside the AC97 codec).
 
 ``name='Wave Center Playback Volume',index=0``
 ----------------------------------------------
-This control is used to attenuate samples for left and right PCM FX-bus
+This control is used to attenuate samples from left and right PCM FX-bus
 accumulators. ALSA uses accumulators 0 and 1 for left and right PCM samples.
 The result is mixed to mono signal (single channel) and forwarded to
 the ??rear?? right DAC PCM slot of the AC97 codec.
 
 ``name='Wave LFE Playback Volume',index=0``
 -------------------------------------------
-This control is used to attenuate samples for left and right PCM FX-bus
+This control is used to attenuate samples from left and right PCM FX-bus
 accumulators. ALSA uses accumulators 0 and 1 for left and right PCM.
 The result is mixed to mono signal (single channel) and forwarded to
 the ??rear?? left DAC PCM slot of the AC97 codec.
 
 ``name='Wave Capture Volume',index=0``, ``name='Wave Capture Switch',index=0``
 ------------------------------------------------------------------------------
-These controls are used to attenuate samples for left and right PCM FX-bus
+These controls are used to attenuate samples from left and right PCM FX-bus
 accumulator. ALSA uses accumulators 0 and 1 for left and right PCM.
 The result is forwarded to the ADC capture FIFO (thus to the standard capture
 PCM device).
 
 ``name='Synth Playback Volume',index=0``
 ----------------------------------------
-This control is used to attenuate samples for left and right MIDI FX-bus
+This control is used to attenuate samples from left and right MIDI FX-bus
 accumulators. ALSA uses accumulators 4 and 5 for left and right MIDI samples.
 The result samples are forwarded to the front DAC PCM slots of the AC97 codec.
 
 ``name='Synth Capture Volume',index=0``, ``name='Synth Capture Switch',index=0``
 --------------------------------------------------------------------------------
-These controls are used to attenuate samples for left and right MIDI FX-bus
-accumulator. ALSA uses accumulators 4 and 5 for left and right PCM.
+These controls are used to attenuate samples from left and right MIDI FX-bus
+accumulator. ALSA uses accumulators 4 and 5 for left and right MIDI samples.
 The result is forwarded to the ADC capture FIFO (thus to the standard capture
 PCM device).
 
 ``name='Surround Playback Volume',index=0``
 -------------------------------------------
-This control is used to attenuate samples for left and right rear PCM FX-bus
+This control is used to attenuate samples from left and right rear PCM FX-bus
 accumulators. ALSA uses accumulators 2 and 3 for left and right rear PCM samples.
 The result samples are forwarded to the rear I2S DACs. These DACs operate
 separately (they are not inside the AC97 codec).
 
 ``name='Surround Capture Volume',index=0``, ``name='Surround Capture Switch',index=0``
 --------------------------------------------------------------------------------------
-These controls are used to attenuate samples for left and right rear PCM FX-bus
+These controls are used to attenuate samples from left and right rear PCM FX-bus
 accumulators. ALSA uses accumulators 2 and 3 for left and right rear PCM samples.
 The result is forwarded to the ADC capture FIFO (thus to the standard capture
 PCM device).
@@ -134,18 +134,18 @@ to the ??rear?? left DAC PCM slot of the AC97 codec.
 
 ``name='AC97 Playback Volume',index=0``
 ---------------------------------------
-This control is used to attenuate samples for left and right front ADC PCM slots
+This control is used to attenuate samples from left and right front ADC PCM slots
 of the AC97 codec. The result samples are forwarded to the front DAC PCM
 slots of the AC97 codec.
 
 .. note::
   This control should be zero for the standard operations, otherwise
   a digital loopback is activated.
 
 
 ``name='AC97 Capture Volume',index=0``
 --------------------------------------
-This control is used to attenuate samples for left and right front ADC PCM slots
+This control is used to attenuate samples from left and right front ADC PCM slots
 of the AC97 codec. The result is forwarded to the ADC capture FIFO (thus to
 the standard capture PCM device).
 
-- 
2.40.0.152.g15d061e6df

