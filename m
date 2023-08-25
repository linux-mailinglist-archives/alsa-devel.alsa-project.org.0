Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F3E78A071
	for <lists+alsa-devel@lfdr.de>; Sun, 27 Aug 2023 19:09:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50FAFE85;
	Sun, 27 Aug 2023 19:08:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50FAFE85
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1693156158;
	bh=fltWRoHfsARBvv5Plkl2Y/ofY05WX6XlsUfbdoGHnAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=PBLw/pA7fpwyiX4E10SlVZp28VC1FIiDupbIRLx3TgPERg9Acpv7AaxZQCeDNT5Mi
	 YrUyMIQc8MRwabvyHkFhFhB4+xeKB7iM96fmBz65kRhagqIouPg7F4DUWCAZvrcSjH
	 ftkppqmwSR4Rs2Ya+moEoG8aF5xqMLcdUMx4kBD0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E60DAF80679; Sun, 27 Aug 2023 19:03:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C53EF80675;
	Sun, 27 Aug 2023 19:03:39 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2589FF800F5; Sat, 26 Aug 2023 00:22:51 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 746DAF8025F
	for <alsa-devel@alsa-project.org>; Sat, 26 Aug 2023 00:22:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 746DAF8025F
Received: from ugly.fritz.box (localhost [127.0.0.1])
	by bluemchen.kde.org (Postfix) with ESMTP id A9931242A8;
	Fri, 25 Aug 2023 18:21:58 -0400 (EDT)
Received: by ugly.fritz.box (masqmail 0.3.6-dev, from userid 1000)
	id 1qZfBm-iVF-00; Sat, 26 Aug 2023 00:21:58 +0200
From: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.de>,
	Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH v5 8/8] ALSA: emu10k1: document E-MU D.A.S. mode
Date: Sat, 26 Aug 2023 00:21:58 +0200
Message-Id: <20230825222158.171007-9-oswald.buddenhagen@gmx.de>
X-Mailer: git-send-email 2.40.0.152.g15d061e6df
In-Reply-To: <20230825222158.171007-1-oswald.buddenhagen@gmx.de>
References: <20230825222158.171007-1-oswald.buddenhagen@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: ossi@kde.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: DWZQJQWHAC7YMLGT2XIDBMEFPRSSOKPQ
X-Message-ID-Hash: DWZQJQWHAC7YMLGT2XIDBMEFPRSSOKPQ
X-Mailman-Approved-At: Sun, 27 Aug 2023 17:03:35 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DWZQJQWHAC7YMLGT2XIDBMEFPRSSOKPQ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Signed-off-by: Oswald Buddenhagen <oswald.buddenhagen@gmx.de>
---
 Documentation/sound/cards/emu-mixer.rst | 59 ++++++++++++++++++++-----
 1 file changed, 49 insertions(+), 10 deletions(-)

diff --git a/Documentation/sound/cards/emu-mixer.rst b/Documentation/sound/cards/emu-mixer.rst
index d87a6338d3d8..f69e552a38d7 100644
--- a/Documentation/sound/cards/emu-mixer.rst
+++ b/Documentation/sound/cards/emu-mixer.rst
@@ -30,15 +30,16 @@ but are otherwise identical) may be less problematic.
 Driver capabilities
 ===================
 
-This driver supports only 16-bit 44.1/48 kHz operation. The multi-channel
-device (see emu10k1-jack.rst) additionally supports 24-bit capture.
+This driver can operate in two modes: Sound Blaster mode (the default)
+and Digital Audio System mode (enabled by the emu_das=1 module option).
 
-A patchset to enhance the driver is available from `a GitHub repository
-<https://github.com/ossilator/linux/tree/ossis-emu10k1>`_.
-Its multi-channel device supports 24-bit for both playback and capture,
-and also supports full 88.2/96/176.4/192 kHz operation.
-It is not going to be upstreamed due to a fundamental disagreement about
-what constitutes a good user experience.
+In Sound Blaster mode, only 16-bit 44.1/48 kHz operation is supported.
+The multi-channel device (see emu10k1-jack.rst) additionally supports
+24-bit capture.
+
+In D.A.S. mode, only the multi-channel device is available (as device 0,
+unlike in SB mode). It supports 24-bit for both playback and capture,
+and full 88.2/96/176.4/192 kHz operation.
 
 
 Digital mixer controls
@@ -64,18 +65,23 @@ FX-bus
 	Each of the synthesizer voices can feed its output to these accumulators
 	and the DSP microcontroller can operate with the resulting sum.
 
+SB and D.A.S. modes
+~~~~~~~~~~~~~~~~~~~
+
 name='Clock Source',index=0
 ---------------------------
 This control allows switching the word clock between interally generated
-44.1 or 48 kHz, or a number of external sources.
+44.1 or 48 kHz (which are subjected to the clock multiplier), or a number
+of external sources (which must be compatible with the clock multiplier).
 
 Note: the sources for the 1616 CardBus card are unclear. Please report your
 findings.
 
 name='Clock Fallback',index=0
 -----------------------------
 This control determines the internal clock which the card switches to when
-the selected external clock source is/becomes invalid.
+the selected external clock source is/becomes invalid or incompatible with
+the clock multiplier.
 
 name='DAC1 0202 14dB PAD',index=0, etc.
 ---------------------------------------
@@ -95,6 +101,38 @@ name='Optical Input Mode',index=0
 Switches the TOSLINK input port between S/PDIF and ADAT.
 Not available on 0404 cards (fixed to S/PDIF).
 
+D.A.S. mode
+~~~~~~~~~~~
+
+In this mode, no attenuation controls are available. It is assumed that these
+are realized in software by the sound server, if necessary.
+
+name='Clock Multiplier',index=0
+-------------------------------
+This control switches the card between 44.1/48 kHz, 88.2/96 kHz, and
+176.4/192 kHz mode by setting the multiplier for the base word clock to
+1x, 2x, and 4x, respectively.
+Changing it also changes the available audio ports, which causes the mixer to
+be reconfigured. This may crash poorly programmed mixer applications running
+at that time (this is the reason why D.A.S. mode support is not going to be
+upstreamed - judge for yourself whether that is a wise trade-off).
+
+name='DAC Left',index=0, etc.
+-----------------------------
+Select the source for the given physical audio output. These may be physical
+inputs, playback channels (PbChn xx), or silence.
+
+name='CpChn xx',index=0
+-----------------------
+Select the source for the given capture channel. Same options as for the
+physical audio outputs.
+
+Note that not all combinations may work due to over-allocation of the
+internal buses; refer to the card's official documentation.
+
+SB mode
+~~~~~~~
+
 name='PCM Front Playback Volume',index=0
 ----------------------------------------
 This control is used to attenuate samples from left and right front PCM FX-bus
@@ -218,6 +256,7 @@ PCM stream related controls
 ===========================
 
 These controls are described in audigy-mixer.rst.
+They are available only in Sound Blaster mode.
 
 
 MANUALS/PATENTS
-- 
2.40.0.152.g15d061e6df

