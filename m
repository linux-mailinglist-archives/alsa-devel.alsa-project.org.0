Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2E013AAB8
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:22:47 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 669872ED5;
	Tue, 14 Jan 2020 12:24:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 669872ED5
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27A62F8014E;
	Tue, 14 Jan 2020 12:23:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B454EF8026A; Tue, 14 Jan 2020 12:23:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mo6-p01-ob.smtp.rzone.de (mo6-p01-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5301::8])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EEBD9F8014D;
 Tue, 14 Jan 2020 12:22:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EEBD9F8014D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="KVd+3A58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579000975;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=9b4rut5pXi4QNHAkPipy/MGbf+b448qzHQmOW9B8bJY=;
 b=KVd+3A58lYxtJ3kO9Vm6+t0PTRVvrxTg0cSidcY1bCEGZMRQCUc3/tP94TPlXEfG1c
 CQx5fw+8Sy7wT2tXF0pdg3c/7DFgMvaODyje5FB2DxAVGWDZnZkxBw+XPUC743V8JnZC
 FfuVR6mucP+5K1amv9wjYXfO40f28J+j/5KR46a5O2B0a47sDULRHn2I0SSMyc9fujUJ
 WAvCYBrgzWCLTyJ1LNsi4pRudTtaZunAiED2jvVqygsHtCIDuJcEyfgrnqMWT4QecE26
 reGA6pTn01tlNC8A97NdzSTalIL9TdNyYBfYM9bMwPY5P0n80EXovcqwDcKUos4lPYX5
 CnIw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7IOGU5qzCB3a93viaVr"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0EBMsULC
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 14 Jan 2020 12:22:54 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Jaroslav Kysela <perex@perex.cz>
Date: Tue, 14 Jan 2020 12:21:05 +0100
Message-Id: <20200114112110.51983-3-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114112110.51983-1-stephan@gerhold.net>
References: <20200114112110.51983-1-stephan@gerhold.net>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, patch@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>
Subject: [alsa-devel] [PATCH alsa-ucm-conf 2/7] DB410c: Split devices into
	re-usable fragments in codecs/msm8916-wcd
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The DB410c use case configuration is also useful for other MSM8916 devices.

However, the available devices usually depend on the exact device model.
For example, DB410c has nothing connected to the Earpiece,
most MSM8916 smartphones do not have a DigitalMic, and some use
a custom speaker amplifier (connected via I2S) instead of the
speaker amplifier provided by PM8916.

Similar differences across devices are handled using re-usable
device fragments in the codecs/ directory. Do the same for msm8916-wcd
and move the device fragments to codecs/msm8916-wcd.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 ucm2/DB410c/HiFi.conf                     | 128 +---------------------
 ucm2/codecs/msm8916-wcd/DigitalMic.conf   |  12 ++
 ucm2/codecs/msm8916-wcd/Earpiece.conf     |   8 ++
 ucm2/codecs/msm8916-wcd/Headphones.conf   |  30 +++++
 ucm2/codecs/msm8916-wcd/HeadsetMic.conf   |  16 +++
 ucm2/codecs/msm8916-wcd/PrimaryMic.conf   |  14 +++
 ucm2/codecs/msm8916-wcd/SecondaryMic.conf |  16 +++
 ucm2/codecs/msm8916-wcd/Speaker.conf      |  20 ++++
 8 files changed, 122 insertions(+), 122 deletions(-)
 create mode 100644 ucm2/codecs/msm8916-wcd/DigitalMic.conf
 create mode 100644 ucm2/codecs/msm8916-wcd/Earpiece.conf
 create mode 100644 ucm2/codecs/msm8916-wcd/Headphones.conf
 create mode 100644 ucm2/codecs/msm8916-wcd/HeadsetMic.conf
 create mode 100644 ucm2/codecs/msm8916-wcd/PrimaryMic.conf
 create mode 100644 ucm2/codecs/msm8916-wcd/SecondaryMic.conf
 create mode 100644 ucm2/codecs/msm8916-wcd/Speaker.conf

diff --git a/ucm2/DB410c/HiFi.conf b/ucm2/DB410c/HiFi.conf
index a0ef42c..4b82fbf 100644
--- a/ucm2/DB410c/HiFi.conf
+++ b/ucm2/DB410c/HiFi.conf
@@ -13,126 +13,10 @@ SectionVerb {
 	}
 }
 
+<codecs/msm8916-wcd/Speaker.conf>
+<codecs/msm8916-wcd/Headphones.conf>
 
-SectionDevice."Speaker" {
-	Comment "Speaker playback"
-
-	ConflictingDevice [
-		"Headphones"
-		"Earpiece"
-	]
-
-	EnableSequence [
-		cset "name='SPK DAC Switch' 1"
-		cset "name='RX3 MIX1 INP1' RX1"
-		## gain to  0dB
-		cset "name='RX3 Digital Volume' 128"
-	]
-
-	DisableSequence [
-		cset "name='SPK DAC Switch' 0"
-		cset "name='RX3 MIX1 INP1' ZERO"
-	]
-}
-
-
-SectionDevice."Headphones" {
-	Comment "Headphones playback"
-
-	ConflictingDevice [
-		"Speaker"
-		"Earpiece"
-	]
-	EnableSequence [
-		cset "name='RX1 MIX1 INP1' RX1"
-		cset "name='RX2 MIX1 INP1' RX2"
-		cset "name='RDAC2 MUX' RX2"
-		cset "name='HPHL' 1"
-		cset "name='HPHR' 1"
-		## gain to  0dB
-		cset "name='RX1 Digital Volume' 128"
-		## gain to  0dB
-		cset "name='RX2 Digital Volume' 128"
-	]
-
-	DisableSequence [
-		cset "name='RX1 Digital Volume' 0"
-		cset "name='RX2 Digital Volume' 0"
-		cset "name='HPHL' 0"
-		cset "name='HPHR' 0"
-		cset "name='RDAC2 MUX' ZERO"
-		cset "name='RX1 MIX1 INP1' ZERO"
-		cset "name='RX2 MIX1 INP1' ZERO"
-	]
-}
-
-SectionDevice."Earpiece" {
-	Comment "Earpiece playback"
-
-	ConflictingDevice [
-		"Speaker"
-		"Headphones"
-	]
-}
-
-SectionDevice."HeadsetMic" {
-	Comment "Headset Microphone"
-
-	EnableSequence [
-		cset "name='DEC1 MUX' ADC2"
-		cset "name='CIC1 MUX' AMIC"
-		cset "name='ADC2 Volume' 8"
-		cset "name='ADC2 MUX' INP2"
-	]
-
-	DisableSequence [
-		cset "name='ADC2 MUX' ZERO"
-		cset "name='ADC2 Volume' 0"
-		cset "name='DEC1 MUX' ZERO"
-	]
-}
-
-SectionDevice."PrimaryMic" {
-	Comment "Primary Microphone"
-
-	EnableSequence [
-		cset "name='DEC1 MUX' ADC1"
-		cset "name='CIC1 MUX' AMIC"
-		cset "name='ADC1 Volume' 8"
-	]
-
-	DisableSequence [
-		cset "name='DEC1 MUX' ZERO"
-		cset "name='ADC1 Volume' 0"
-	]
-}
-
-SectionDevice."SecondaryMic" {
-	Comment "Secondary Microphone"
-
-	EnableSequence [
-		cset "name='DEC1 MUX' ADC2"
-		cset "name='CIC1 MUX' AMIC"
-		cset "name='ADC2 Volume' 8"
-		cset "name='ADC2 MUX' INP2"
-	]
-
-	DisableSequence [
-		cset "name='DEC1 MUX' ZERO"
-		cset "name='ADC2 Volume' 0"
-		cset "name='ADC2 MUX' ZERO"
-	]
-}
-
-SectionDevice."DigitalMic" {
-	Comment "Digital Microphone"
-
-	EnableSequence [
-		cset "name='DEC1 MUX' DMIC1"
-		cset "name='CIC1 MUX' DMIC"
-	]
-
-	DisableSequence [
-		cset "name='DEC1 MUX' ZERO"
-	]
-}
+<codecs/msm8916-wcd/PrimaryMic.conf>
+<codecs/msm8916-wcd/HeadsetMic.conf>
+<codecs/msm8916-wcd/SecondaryMic.conf>
+<codecs/msm8916-wcd/DigitalMic.conf>
diff --git a/ucm2/codecs/msm8916-wcd/DigitalMic.conf b/ucm2/codecs/msm8916-wcd/DigitalMic.conf
new file mode 100644
index 0000000..35dfb1b
--- /dev/null
+++ b/ucm2/codecs/msm8916-wcd/DigitalMic.conf
@@ -0,0 +1,12 @@
+SectionDevice."DigitalMic" {
+	Comment "Digital Microphone"
+
+	EnableSequence [
+		cset "name='DEC1 MUX' DMIC1"
+		cset "name='CIC1 MUX' DMIC"
+	]
+
+	DisableSequence [
+		cset "name='DEC1 MUX' ZERO"
+	]
+}
diff --git a/ucm2/codecs/msm8916-wcd/Earpiece.conf b/ucm2/codecs/msm8916-wcd/Earpiece.conf
new file mode 100644
index 0000000..e9f8b9d
--- /dev/null
+++ b/ucm2/codecs/msm8916-wcd/Earpiece.conf
@@ -0,0 +1,8 @@
+SectionDevice."Earpiece" {
+	Comment "Earpiece playback"
+
+	ConflictingDevice [
+		"Speaker"
+		"Headphones"
+	]
+}
diff --git a/ucm2/codecs/msm8916-wcd/Headphones.conf b/ucm2/codecs/msm8916-wcd/Headphones.conf
new file mode 100644
index 0000000..7a2090e
--- /dev/null
+++ b/ucm2/codecs/msm8916-wcd/Headphones.conf
@@ -0,0 +1,30 @@
+SectionDevice."Headphones" {
+	Comment "Headphones playback"
+
+	ConflictingDevice [
+		"Speaker"
+		"Earpiece"
+	]
+
+	EnableSequence [
+		cset "name='RX1 MIX1 INP1' RX1"
+		cset "name='RX2 MIX1 INP1' RX2"
+		cset "name='RDAC2 MUX' RX2"
+		cset "name='HPHL' 1"
+		cset "name='HPHR' 1"
+		## gain to  0dB
+		cset "name='RX1 Digital Volume' 128"
+		## gain to  0dB
+		cset "name='RX2 Digital Volume' 128"
+	]
+
+	DisableSequence [
+		cset "name='RX1 Digital Volume' 0"
+		cset "name='RX2 Digital Volume' 0"
+		cset "name='HPHL' 0"
+		cset "name='HPHR' 0"
+		cset "name='RDAC2 MUX' ZERO"
+		cset "name='RX1 MIX1 INP1' ZERO"
+		cset "name='RX2 MIX1 INP1' ZERO"
+	]
+}
diff --git a/ucm2/codecs/msm8916-wcd/HeadsetMic.conf b/ucm2/codecs/msm8916-wcd/HeadsetMic.conf
new file mode 100644
index 0000000..538d895
--- /dev/null
+++ b/ucm2/codecs/msm8916-wcd/HeadsetMic.conf
@@ -0,0 +1,16 @@
+SectionDevice."HeadsetMic" {
+	Comment "Headset Microphone"
+
+	EnableSequence [
+		cset "name='DEC1 MUX' ADC2"
+		cset "name='CIC1 MUX' AMIC"
+		cset "name='ADC2 Volume' 8"
+		cset "name='ADC2 MUX' INP2"
+	]
+
+	DisableSequence [
+		cset "name='ADC2 MUX' ZERO"
+		cset "name='ADC2 Volume' 0"
+		cset "name='DEC1 MUX' ZERO"
+	]
+}
diff --git a/ucm2/codecs/msm8916-wcd/PrimaryMic.conf b/ucm2/codecs/msm8916-wcd/PrimaryMic.conf
new file mode 100644
index 0000000..6998458
--- /dev/null
+++ b/ucm2/codecs/msm8916-wcd/PrimaryMic.conf
@@ -0,0 +1,14 @@
+SectionDevice."PrimaryMic" {
+	Comment "Primary Microphone"
+
+	EnableSequence [
+		cset "name='DEC1 MUX' ADC1"
+		cset "name='CIC1 MUX' AMIC"
+		cset "name='ADC1 Volume' 8"
+	]
+
+	DisableSequence [
+		cset "name='DEC1 MUX' ZERO"
+		cset "name='ADC1 Volume' 0"
+	]
+}
diff --git a/ucm2/codecs/msm8916-wcd/SecondaryMic.conf b/ucm2/codecs/msm8916-wcd/SecondaryMic.conf
new file mode 100644
index 0000000..7811509
--- /dev/null
+++ b/ucm2/codecs/msm8916-wcd/SecondaryMic.conf
@@ -0,0 +1,16 @@
+SectionDevice."SecondaryMic" {
+	Comment "Secondary Microphone"
+
+	EnableSequence [
+		cset "name='DEC1 MUX' ADC2"
+		cset "name='CIC1 MUX' AMIC"
+		cset "name='ADC2 Volume' 8"
+		cset "name='ADC2 MUX' INP2"
+	]
+
+	DisableSequence [
+		cset "name='DEC1 MUX' ZERO"
+		cset "name='ADC2 Volume' 0"
+		cset "name='ADC2 MUX' ZERO"
+	]
+}
diff --git a/ucm2/codecs/msm8916-wcd/Speaker.conf b/ucm2/codecs/msm8916-wcd/Speaker.conf
new file mode 100644
index 0000000..2b1dd8a
--- /dev/null
+++ b/ucm2/codecs/msm8916-wcd/Speaker.conf
@@ -0,0 +1,20 @@
+SectionDevice."Speaker" {
+	Comment "Speaker playback"
+
+	ConflictingDevice [
+		"Headphones"
+		"Earpiece"
+	]
+
+	EnableSequence [
+		cset "name='SPK DAC Switch' 1"
+		cset "name='RX3 MIX1 INP1' RX1"
+		## gain to  0dB
+		cset "name='RX3 Digital Volume' 128"
+	]
+
+	DisableSequence [
+		cset "name='SPK DAC Switch' 0"
+		cset "name='RX3 MIX1 INP1' ZERO"
+	]
+}
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
