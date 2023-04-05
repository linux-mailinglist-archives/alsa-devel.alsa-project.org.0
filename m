Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A31196D8809
	for <lists+alsa-devel@lfdr.de>; Wed,  5 Apr 2023 22:16:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D3DEE20C;
	Wed,  5 Apr 2023 22:16:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D3DEE20C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1680725815;
	bh=DDUy5jNIWNVz+CPkdlm5M3zI58ma8MsyqIQfvF0N4e8=;
	h=From:To:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=n8cmwWyJ1dpuvXJpk6nmCEwdx/POhVCUQJMy+vpaVopjAf5l4M2x2yth32yIRvhvz
	 FiScLESIc49B+FSOK2e2D5OEaNTVSjIfpQL5mP71Cs1YDchBoo/IG6jtwzM/pcD17O
	 GJY1BLlToKtvh0MuI/77azh8mnYtPPa1qMdamsGs=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 112BBF805AD;
	Wed,  5 Apr 2023 22:13:06 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5B9B4F80588; Wed,  5 Apr 2023 22:12:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org [209.51.188.41])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 439A5F80533
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 22:12:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 439A5F80533
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id 0701624259
	for <alsa-devel@alsa-project.org>; Wed,  5 Apr 2023 16:12:21 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.4, from userid 1000)
	id 1pk9US-Dm2-00
	for <alsa-devel@alsa-project.org>; Wed, 05 Apr 2023 22:12:20 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Subject: [PATCH] ALSA: emu10k1: documentation updates
Date: Wed,  5 Apr 2023 22:12:20 +0200
Message-Id: <20230405201220.2197893-1-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BKX5QM4SPIQII4HZJS2FEA5OU6QZ4FMT
X-Message-ID-Hash: BKX5QM4SPIQII4HZJS2FEA5OU6QZ4FMT
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BKX5QM4SPIQII4HZJS2FEA5OU6QZ4FMT/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

- Less misinformation
- Language and whitespace fixups

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 Documentation/sound/alsa-configuration.rst  |  5 ++--
 Documentation/sound/cards/audigy-mixer.rst  | 27 ++++++++++++---------
 Documentation/sound/cards/sb-live-mixer.rst | 17 +++++++------
 3 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/Documentation/sound/alsa-configuration.rst b/Documentation/sound/alsa-configuration.rst
index 5f31fa5e2435..af71c68f1e4e 100644
--- a/Documentation/sound/alsa-configuration.rst
+++ b/Documentation/sound/alsa-configuration.rst
@@ -723,9 +723,10 @@ Module for EMU10K1/EMU10k2 based PCI sound cards.
 
 * Sound Blaster Live!
 * Sound Blaster PCI 512
-* Emu APS (partially supported)
 * Sound Blaster Audigy
-	
+* E-MU APS (partially supported)
+* E-MU DAS
+
 extin
     bitmap of available external inputs for FX8010 (see below)
 extout
diff --git a/Documentation/sound/cards/audigy-mixer.rst b/Documentation/sound/cards/audigy-mixer.rst
index c506f8d16f2e..aa176451d5b5 100644
--- a/Documentation/sound/cards/audigy-mixer.rst
+++ b/Documentation/sound/cards/audigy-mixer.rst
@@ -19,30 +19,30 @@ Digital mixer controls
 These controls are built using the DSP instructions. They offer extended
 functionality. Only the default built-in code in the ALSA driver is described
 here. Note that the controls work as attenuators: the maximum value is the 
-neutral position leaving the signal unchanged. Note that if the  same destination 
-is mentioned in multiple controls, the signal is accumulated and can be wrapped 
-(set to maximal or minimal value without checking of overflow).
+neutral position leaving the signal unchanged. Note that if the same destination
+is mentioned in multiple controls, the signal is accumulated and can be clipped
+(set to maximal or minimal value without checking for overflow).
 
 
 Explanation of used abbreviations:
 
 DAC
 	digital to analog converter
 ADC
 	analog to digital converter
 I2S
 	one-way three wire serial bus for digital sound by Philips Semiconductors
-        (this standard is used for connecting standalone DAC and ADC converters)
+	(this standard is used for connecting standalone D/A and A/D converters)
 LFE
-	low frequency effects (subwoofer signal)
+	low frequency effects (used as subwoofer signal)
 AC97
-	a chip containing an analog mixer, DAC and ADC converters
+	a chip containing an analog mixer, D/A and A/D converters
 IEC958
 	S/PDIF
 FX-bus
 	the EMU10K2 chip has an effect bus containing 64 accumulators.
-        Each of the synthesizer voices can feed its output to these accumulators
-        and the DSP microcontroller can operate with the resulting sum.
+	Each of the synthesizer voices can feed its output to these accumulators
+	and the DSP microcontroller can operate with the resulting sum.
 
 name='PCM Front Playback Volume',index=0
 ----------------------------------------
@@ -218,8 +218,8 @@ LFE outputs.
 name='IEC958 Optical Raw Playback Switch',index=0
 -------------------------------------------------
 If this switch is on, then the samples for the IEC958 (S/PDIF) digital
-output are taken only from the raw FX8010 PCM, otherwise standard front
-PCM samples are taken.
+output are taken only from the raw iec958 ALSA PCM device (which uses
+accumulators 20 and 21 for left and right PCM by default).
 
 
 PCM stream related controls
@@ -237,8 +237,8 @@ as follows:
 
 name='EMU10K1 PCM Send Routing',index 0-31
 ------------------------------------------
-This control specifies the destination - FX-bus accumulators. There 24
-values with this mapping:
+This control specifies the destination - FX-bus accumulators. There are 24
+values in this mapping:
 
 * 0 -  mono, A destination (FX-bus 0-63), default 0
 * 1 -  mono, B destination (FX-bus 0-63), default 1
@@ -306,6 +306,9 @@ MANUALS/PATENTS
 ftp://opensource.creative.com/pub/doc
 -------------------------------------
 
+Note that the site is defunct, but the documents are available
+from various other locations.
+
 LM4545.pdf
 	AC97 Codec
 
diff --git a/Documentation/sound/cards/sb-live-mixer.rst b/Documentation/sound/cards/sb-live-mixer.rst
index 357fcd619d39..819886634400 100644
--- a/Documentation/sound/cards/sb-live-mixer.rst
+++ b/Documentation/sound/cards/sb-live-mixer.rst
@@ -15,7 +15,7 @@ The ALSA driver programs this portion of chip by default code
 IEC958 (S/PDIF) raw PCM
 =======================
 
-This PCM device (it's the 4th PCM device (index 3!) and first subdevice
+This PCM device (it's the 3rd PCM device (index 2!) and first subdevice
 (index 0) for a given card) allows to forward 48kHz, stereo, 16-bit
 little endian streams without any modifications to the digital output
 (coaxial or optical). The universal interface allows the creation of up
@@ -33,24 +33,24 @@ Digital mixer controls
 These controls are built using the DSP instructions. They offer extended
 functionality. Only the default built-in code in the ALSA driver is described
 here. Note that the controls work as attenuators: the maximum value is the 
-neutral position leaving the signal unchanged. Note that if the  same destination 
-is mentioned in multiple controls, the signal is accumulated and can be wrapped 
-(set to maximal or minimal value without checking of overflow).
+neutral position leaving the signal unchanged. Note that if the same destination
+is mentioned in multiple controls, the signal is accumulated and can be clipped
+(set to maximal or minimal value without checking for overflow).
 
 
 Explanation of used abbreviations:
 
 DAC
 	digital to analog converter
 ADC
 	analog to digital converter
 I2S
 	one-way three wire serial bus for digital sound by Philips Semiconductors
-        (this standard is used for connecting standalone DAC and ADC converters)
+	(this standard is used for connecting standalone D/A and A/D converters)
 LFE
-	low frequency effects (subwoofer signal)
+	low frequency effects (used as subwoofer signal)
 AC97
-	a chip containing an analog mixer, DAC and ADC converters
+	a chip containing an analog mixer, D/A and A/D converters
 IEC958
 	S/PDIF
 FX-bus
@@ -313,6 +313,9 @@ MANUALS/PATENTS
 ftp://opensource.creative.com/pub/doc
 -------------------------------------
 
+Note that the site is defunct, but the documents are available
+from various other locations.
+
 LM4545.pdf
 	AC97 Codec
 m2049.pdf
-- 
2.40.0.152.g15d061e6df

