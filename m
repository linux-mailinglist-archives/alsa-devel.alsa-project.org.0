Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E3E78A070
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:09:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2029E9D;
	Sun, 27 Aug 2023 19:08:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2029E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693156147;
	bh=EjXTecGR3uQSQrxjU47NuIZjpITK7k3cibqBR8eQYMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SmX7/Xq3dwi9GVNdPl5JKIPU7hEXwdraqCNfKIbA8XwXtOKwDPCPf4C/sIuqRKBj4
	 YTHPbc6aqlTVdhCAcnocEjdkjMxTJp/7pkIdDPpVbjPhlHCjbirJ+/CaRjLYhGoIZs
	 SKQAvPnhNfM4sxG8Ypv6T52u2oCW7ZB+tVMXsR18=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2FFFBF8065C; Sun, 27 Aug 2023 19:03:34 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 49A4BF805AC;
	Sun, 27 Aug 2023 19:03:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5A1FEF800F5; Sat, 26 Aug 2023 00:22:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=unavailable
	autolearn_force=no version=3.4.6
Received: from bluemchen.kde.org (bluemchen.kde.org
 [IPv6:2001:470:142:8::100])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DB7EAF8023B
	for <alsa-devel@alsa-project.org>; Sat, 26 Aug 2023 00:22:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DB7EAF8023B
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id BBE3D242D5;
	Fri, 25 Aug 2023 18:21:57 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qZfBl-iU5-00; Sat, 26 Aug 2023 00:21:57 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH 3/3] ALSA: emu10k1: add separate documentation for E-MU cards
Date: Sat, 26 Aug 2023 00:21:57 +0200
Message-Id: <20230825222157.170978-3-oswald.buddenhagen@gmx.de>
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
Message-ID-Hash: LHZU5GP2PMIKW3PUOKK7KGT3SEJYDUC3
X-Message-ID-Hash: LHZU5GP2PMIKW3PUOKK7KGT3SEJYDUC3
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:03:09 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LHZU5GP2PMIKW3PUOKK7KGT3SEJYDUC3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

They are sufficiently different from Sound Blasters.

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 Documentation/sound/cards/emu-mixer.rst | 226 ++++++++++++++++++++++++
 Documentation/sound/cards/index.rst     |   1 +
 2 files changed, 227 insertions(+)
 create mode 100644 Documentation/sound/cards/emu-mixer.rst

diff --git a/Documentation/sound/cards/emu-mixer.rst b/Documentation/sound/cards/emu-mixer.rst
new file mode 100644
index 000000000000..d87a6338d3d8
--- /dev/null
+++ b/Documentation/sound/cards/emu-mixer.rst
@@ -0,0 +1,226 @@
+==================================================
+E-MU Digital Audio System mixer / default DSP code
+==================================================
+
+This document covers the E-MU 0404/1010/1212/1616/1820 PCI/PCI-e/CardBus
+cards.
+
+These cards use regular EMU10K2 (SoundBlaster Audigy) chips, but with an
+alternative front-end geared towards semi-professional studio recording.
+
+This document is based on audigy-mixer.rst.
+
+
+Hardware compatibility
+======================
+
+The EMU10K2 chips have a very short capture FIFO, which makes recording
+unreliable if the card's PCI bus requests are not handled with the
+appropriate priority.
+This is the case on more modern motherboards, where the PCI bus is only a
+secondary peripheral, rather than the actual arbiter of device access.
+In particular, I got recording glitches during simultaneous playback on an
+Intel DP55 board (memory controller in the CPU), but had success with an
+Intel DP45 board (memory controller in the north bridge).
+
+The PCI Express variants of these cards (which have a PCI bridge on board,
+but are otherwise identical) may be less problematic.
+
+
+Driver capabilities
+===================
+
+This driver supports only 16-bit 44.1/48 kHz operation. The multi-channel
+device (see emu10k1-jack.rst) additionally supports 24-bit capture.
+
+A patchset to enhance the driver is available from `a GitHub repository
+<https://github.com/ossilator/linux/tree/ossis-emu10k1>`_.
+Its multi-channel device supports 24-bit for both playback and capture,
+and also supports full 88.2/96/176.4/192 kHz operation.
+It is not going to be upstreamed due to a fundamental disagreement about
+what constitutes a good user experience.
+
+
+Digital mixer controls
+======================
+
+Note that the controls work as attenuators: the maximum value is the neutral
+position leaving the signal unchanged. Note that if the same destination is
+mentioned in multiple controls, the signal is accumulated and can be clipped
+(set to maximal or minimal value without checking for overflow).
+
+Explanation of used abbreviations:
+
+DAC
+	digital to analog converter
+ADC
+	analog to digital converter
+LFE
+	low frequency effects (used as subwoofer signal)
+IEC958
+	S/PDIF
+FX-bus
+	the EMU10K2 chip has an effect bus containing 64 accumulators.
+	Each of the synthesizer voices can feed its output to these accumulators
+	and the DSP microcontroller can operate with the resulting sum.
+
+name='Clock Source',index=0
+---------------------------
+This control allows switching the word clock between interally generated
+44.1 or 48 kHz, or a number of external sources.
+
+Note: the sources for the 1616 CardBus card are unclear. Please report your
+findings.
+
+name='Clock Fallback',index=0
+-----------------------------
+This control determines the internal clock which the card switches to when
+the selected external clock source is/becomes invalid.
+
+name='DAC1 0202 14dB PAD',index=0, etc.
+---------------------------------------
+Output attenuation controls. Not available on 0404 cards.
+
+name='ADC1 14dB PAD 0202',index=0, etc.
+---------------------------------------
+Input attenuation controls. Not available on 0404 cards.
+
+name='Optical Output Mode',index=0
+----------------------------------
+Switches the TOSLINK output port between S/PDIF and ADAT.
+Not available on 0404 cards (fixed to S/PDIF).
+
+name='Optical Input Mode',index=0
+---------------------------------
+Switches the TOSLINK input port between S/PDIF and ADAT.
+Not available on 0404 cards (fixed to S/PDIF).
+
+name='PCM Front Playback Volume',index=0
+----------------------------------------
+This control is used to attenuate samples from left and right front PCM FX-bus
+accumulators. ALSA uses accumulators 8 and 9 for left and right front PCM
+samples for 5.1 playback. The result samples are forwarded to the DSP 0 & 1
+playback channels.
+
+name='PCM Surround Playback Volume',index=0
+-------------------------------------------
+This control is used to attenuate samples from left and right surround PCM FX-bus
+accumulators. ALSA uses accumulators 2 and 3 for left and right surround PCM
+samples for 5.1 playback. The result samples are forwarded to the DSP 2 & 3
+playback channels.
+
+name='PCM Side Playback Volume',index=0
+---------------------------------------
+This control is used to attenuate samples from left and right side PCM FX-bus
+accumulators. ALSA uses accumulators 14 and 15 for left and right side PCM
+samples for 7.1 playback. The result samples are forwarded to the DSP 6 & 7
+playback channels.
+
+name='PCM Center Playback Volume',index=0
+-----------------------------------------
+This control is used to attenuate samples from the center PCM FX-bus accumulator.
+ALSA uses accumulator 6 for center PCM samples for 5.1 playback. The result samples
+are forwarded to the DSP 4 playback channel.
+
+name='PCM LFE Playback Volume',index=0
+--------------------------------------
+This control is used to attenuate samples from the LFE PCM FX-bus accumulator.
+ALSA uses accumulator 7 for LFE PCM samples for 5.1 playback. The result samples
+are forwarded to the DSP 5 playback channel.
+
+name='PCM Playback Volume',index=0
+----------------------------------
+This control is used to attenuate samples from left and right PCM FX-bus
+accumulators. ALSA uses accumulators 0 and 1 for left and right PCM samples for
+stereo playback. The result samples are forwarded to the virtual stereo mixer.
+
+name='PCM Capture Volume',index=0
+---------------------------------
+This control is used to attenuate samples from left and right PCM FX-bus
+accumulators. ALSA uses accumulators 0 and 1 for left and right PCM.
+The result is forwarded to the standard capture PCM device.
+
+name='Music Playback Volume',index=0
+------------------------------------
+This control is used to attenuate samples from left and right MIDI FX-bus
+accumulators. ALSA uses accumulators 4 and 5 for left and right MIDI samples.
+The result samples are forwarded to the virtual stereo mixer.
+
+name='Music Capture Volume',index=0
+-----------------------------------
+These controls are used to attenuate samples from left and right MIDI FX-bus
+accumulator. ALSA uses accumulators 4 and 5 for left and right MIDI samples.
+The result is forwarded to the standard capture PCM device.
+
+name='Front Playback Volume',index=0
+------------------------------------
+This control is used to attenuate samples from the virtual stereo mixer.
+The result samples are forwarded to the DSP 0 & 1 playback channels.
+
+name='Surround Playback Volume',index=0
+---------------------------------------
+This control is used to attenuate samples from the virtual stereo mixer.
+The result samples are forwarded to the DSP 2 & 3 playback channels.
+
+name='Side Playback Volume',index=0
+-----------------------------------
+This control is used to attenuate samples from the virtual stereo mixer.
+The result samples are forwarded to the DSP 6 & 7 playback channels.
+
+name='Center Playback Volume',index=0
+-------------------------------------
+This control is used to attenuate samples from the virtual stereo mixer.
+The result samples are forwarded to the DSP 4 playback channel.
+
+name='LFE Playback Volume',index=0
+----------------------------------
+This control is used to attenuate samples from the virtual stereo mixer.
+The result samples are forwarded to the DSP 5 playback channel.
+
+name='Tone Control - Switch',index=0
+------------------------------------
+This control turns the tone control on or off. The samples forwarded to
+the DSP playback channels are affected.
+
+name='Tone Control - Bass',index=0
+----------------------------------
+This control sets the bass intensity. There is no neutral value!!
+When the tone control code is activated, the samples are always modified.
+The closest value to pure signal is 20.
+
+name='Tone Control - Treble',index=0
+------------------------------------
+This control sets the treble intensity. There is no neutral value!!
+When the tone control code is activated, the samples are always modified.
+The closest value to pure signal is 20.
+
+name='Master Playback Volume',index=0
+-------------------------------------
+This control is used to attenuate samples for all DSP playback channels.
+
+name='EMU Capture Volume',index=0
+----------------------------------
+This control is used to attenuate samples from the DSP 0 & 1 capture channels.
+The result is forwarded to the standard capture PCM device.
+
+name='DAC Left',index=0, etc.
+-----------------------------
+Select the source for the given physical audio output. These may be physical
+inputs, playback channels (DSP xx, specified as a decimal number), or silence.
+
+name='DSP x',index=0
+--------------------
+Select the source for the given capture channel (specified as a hexadecimal
+digit). Same options as for the physical audio outputs.
+
+
+PCM stream related controls
+===========================
+
+These controls are described in audigy-mixer.rst.
+
+
+MANUALS/PATENTS
+===============
+
+See sb-live-mixer.rst.
diff --git a/Documentation/sound/cards/index.rst b/Documentation/sound/cards/index.rst
index 49c1f2f688f8..e68bbb13c384 100644
--- a/Documentation/sound/cards/index.rst
+++ b/Documentation/sound/cards/index.rst
@@ -8,6 +8,7 @@ Card-Specific Information
    cmipci
    sb-live-mixer
    audigy-mixer
+   emu-mixer
    emu10k1-jack
    via82xx-mixer
    audiophile-usb
-- 
2.40.0.152.g15d061e6df

