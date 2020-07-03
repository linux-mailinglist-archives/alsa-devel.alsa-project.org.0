Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AE72134E4
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 09:25:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0013116CE;
	Fri,  3 Jul 2020 09:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0013116CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593761156;
	bh=B0x33tXoJrPRUUnaAGsYMRRSt5MbzrCo2cGIQi3Tljk=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=aDG2frF10JV52pZDTiANcjDfTzU9NsbhZr2cmutXCAU3WbsW7NZNv2rr+2U8XGe+U
	 tiuSZgvDevJ/YKJ7d2A2Xv9WsfuqAEbabrZC7hVUvmtyU0t7QVKply1TtGmjaiEgNQ
	 LZRoQv4rrPhWMRI4mIhebR2HS5xSzgjLbe3oIqwg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EBB24F800E0;
	Fri,  3 Jul 2020 09:24:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 748DAF80217; Fri,  3 Jul 2020 09:24:12 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 716B4F800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 09:24:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 716B4F800E0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="CrMpKQn0"
Received: by mail-pj1-x1042.google.com with SMTP id k71so10032252pje.0
 for <alsa-devel@alsa-project.org>; Fri, 03 Jul 2020 00:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z08w30dCEd3i5CcEmTQ6bmApVFZhvp9t4OCAfTP18pI=;
 b=CrMpKQn0zqDgwQpGYD36szdd1r1O9EYIXH/1uPWWtawPcFsq6oqKcIjZW+Pye9+FMl
 i+VfnRWM3UsGETp0f1aQm7c6kbBJbqjXABWgEVnZqiryl9G5fJk42JhZajouxaGJigro
 bkVHAdkAysNol7WPFOu1kAtaovb8K/md2GIjlf6MV6/CbtFpE3jb8PGi7vkxK1XA39K0
 fe4mfG5yJg3m4zkoJWYW0dUOkuqkcaCTmo77qnC0IylOnNcKiWGqntxBtyY0SLdOqNh+
 BM4kWi674/xTBoQI2g96vsUVGPDacDj4O8FYcorjiZuCbxXiu/ZlgxXyYTDkm4200hO2
 NODA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z08w30dCEd3i5CcEmTQ6bmApVFZhvp9t4OCAfTP18pI=;
 b=sQa31eNjMM4+MGHV7ibXlyBZ1ldyg/Qz5Pi2lJhSdvrDUjbEi23DW9DSJeTbV5JkLz
 hdyCSqb8HcFLI6JjGa2zxom5sXH2WYZ80py/T8HPhxjbziWpw9yZY7ibArDQUvtAZ3FC
 aVMTBKbyzPPEPhg7Jqyt6HrA4gFaasqeLqXcxTuXG/oyTXgRC+/0fiQLZc4/2diW6h13
 uiUT/u3DgZS7o8Gnp4jHs3wbnGUtKNwlvInvrQSdBySgOU90HHF7lp/qbDypIkWslh+D
 PJuaYiP9wPRs91Wn2rAAxbolVohXLLXWV88s+C9xqfHB9ryOD7UEsbTefHkVMQWHnwDQ
 2njg==
X-Gm-Message-State: AOAM532VJoObHfYZrhuCHYStRoJ2VTEfByqQw8Eh2N2FjHXhn1wSmZrT
 iTqszptMj8e3fXmcZBRINP74W8B+
X-Google-Smtp-Source: ABdhPJzhm8GoSqTxyuqw9en4lfh01Cqs1cZ/mkbIG2EIDdZG0YsSG+UP+kI+DmRublOTtm5Jsfceiw==
X-Received: by 2002:a17:902:c206:: with SMTP id 6mr6932738pll.30.1593761044822; 
 Fri, 03 Jul 2020 00:24:04 -0700 (PDT)
Received: from f3.nvidia.com (ae055068.dynamic.ppp.asahi-net.or.jp.
 [14.3.55.68])
 by smtp.gmail.com with ESMTPSA id w1sm3901794pfc.55.2020.07.03.00.24.03
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 00:24:03 -0700 (PDT)
From: Benjamin Poirier <benjamin.poirier@gmail.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH RFC alsa-ucm-conf] sof-hda-dsp: Use Master mixer to control
 volume with dual stereo speakers
Date: Fri,  3 Jul 2020 16:23:02 +0900
Message-Id: <20200703072302.16876-1-benjamin.poirier@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The Lenovo ThinkPad X1 Carbon 7th is a laptop with two sets of stereo
speakers driven from a single stereo output. The volume of each set of
speakers can be controlled independently through two separate mixers. In
that case, one of those mixers serves a dual purpose: it also controls
headphone volume.

With the current ucm profile, when outputting to speakers, pulseaudio uses
only the mixer for the front speakers to control volume. This is
ineffective; rear speaker volume must be controlled as well. In order to
control both sets of speakers at once, indicate that the Master mixer
should be used.

Moreover, when switching between speaker and headphone outputs, the level
of the dual purpose mixer should be restored. Since this kind of constraint
cannot be described with ucm, indicate that the Master mixer should be used
to control volume instead when outputting to headphones.

This patch depends on a modification to the snd_hda_codec_realtek kernel
driver used on that system to rename one of the controls.

Signed-off-by: Benjamin Poirier <benjamin.poirier@gmail.com>
---

Note that I plan to submit the related kernel patch upstream shortly, in
the meantime, it is available here:
https://github.com/gobenji/thinkpad-x1-gen7-sound

Also note that this patch is based on commit 38e5906cd1b1 ("sof-hda-dsp:
fix the device order (Hdmi devices)"). While testing with libasound built
from alsa-lib git head 485930ea5dc8 ("ucm: substitution - remove duplicate
allow_empty assignment"), alsa-ucm-conf versions including dcef48f13d4f
("HDA-Intel: add support for AMD acp microphone devices") and newer do not
work for me. I've tested up to current head, ffe0cab5cfce ("sof-hda-dsp:
use sof-hda-dsp/Hdmi.conf").
Looking at the output of `pulseaudio --log-level=debug`, things go wrong
at:
I: [pulseaudio] (alsa-lib)main.c: error: failed to import sof-hda-dsp use case configuration -17


 ucm2/sof-hda-dsp/HiFi.conf | 32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/ucm2/sof-hda-dsp/HiFi.conf b/ucm2/sof-hda-dsp/HiFi.conf
index 62358e2..661a086 100644
--- a/ucm2/sof-hda-dsp/HiFi.conf
+++ b/ucm2/sof-hda-dsp/HiFi.conf
@@ -25,10 +25,22 @@ SectionDevice."Headphones" {
 	Value {
 		PlaybackPriority 200
 		PlaybackPCM "hw:${CardId}"
-		PlaybackMixerElem "Headphone"
 		PlaybackMasterElem "Master"
-		PlaybackVolume "Headphone Playback Volume"
 		PlaybackSwitch "Headphone Playback Switch"
+		If.hpmixer {
+			Condition {
+				Type ControlExists
+				Control "name='Headphone/Bass Speaker Playback Volume'"
+			}
+			True {
+				PlaybackMixerElem "Master"
+				PlaybackVolume "Master Playback Volume"
+			}
+			False {
+				PlaybackMixerElem "Headphone"
+				PlaybackVolume "Headphone Playback Volume"
+			}
+		}
 		If.jack {
 			Condition {
 				Type ControlExists
@@ -77,10 +89,22 @@ SectionDevice."Speaker" {
 	Value {
 		PlaybackPriority 100
 		PlaybackPCM "hw:${CardId}"
-		PlaybackMixerElem "Speaker"
 		PlaybackMasterElem "Master"
-		PlaybackVolume "Speaker Playback Volume"
 		PlaybackSwitch "Speaker Playback Switch"
+		If.spkmixer {
+			Condition {
+				Type ControlExists
+				Control "name='Headphone/Bass Speaker Playback Volume'"
+			}
+			True {
+				PlaybackMixerElem "Master"
+				PlaybackVolume "Master Playback Volume"
+			}
+			False {
+				PlaybackMixerElem "Speaker"
+				PlaybackVolume "Speaker Playback Volume"
+			}
+		}
 	}
 }
 
-- 
2.27.0

