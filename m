Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0454113AB0C
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jan 2020 14:28:38 +0100 (CET)
Received: from alsa1.perex.cz (unknown [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D42242F94;
	Tue, 14 Jan 2020 12:28:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D42242F94
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C08CBF802DB;
	Tue, 14 Jan 2020 12:23:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 82258F8027C; Tue, 14 Jan 2020 12:23:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mo6-p02-ob.smtp.rzone.de (mo6-p02-ob.smtp.rzone.de
 [IPv6:2a01:238:20a:202:5302::11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83E84F8023E;
 Tue, 14 Jan 2020 12:22:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83E84F8023E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gerhold.net header.i=@gerhold.net
 header.b="XIEG32IJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579000976;
 s=strato-dkim-0002; d=gerhold.net;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=cO79n30r7dHzozUPgz++lM22L44zcrhWHZMtMwLAfLY=;
 b=XIEG32IJ/muG2LlPwX14GeLZFJe48D143Bt39R43QodETmbJp2GXD9l8tcAkk+SzjF
 Ta5uIC8+lwp2CqwI1PRKN+i1kdQ8sSEPSB5YN6GB+A0eZ2G6ycxGSLtkeGDWzD7FM5sb
 7L61p1AShonN+ueWY0Bk3N9vmabEWAHFV7bAgqB43CzgnPLW9PRjBQeIqJF02Lv3w8fy
 UcXF1RlgqvUumOy7Luzq+TPA+sM8LBg2hIJCiP4wvK8QEjUwp3pCpA0EFaaTaxJk+cKs
 axQR/sjC5CE3vbHYnIwCY7h92gRsGLU+Njra5U6P3i5Z/0ZVauplTcJuBQXnlvPAcCvy
 aI8w==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7IOGU5qzCB3a93viaVr"
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain by smtp.strato.de (RZmta 46.1.4 AUTH)
 with ESMTPSA id h048a6w0EBMuULI
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Tue, 14 Jan 2020 12:22:56 +0100 (CET)
From: Stephan Gerhold <stephan@gerhold.net>
To: Jaroslav Kysela <perex@perex.cz>
Date: Tue, 14 Jan 2020 12:21:10 +0100
Message-Id: <20200114112110.51983-8-stephan@gerhold.net>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200114112110.51983-1-stephan@gerhold.net>
References: <20200114112110.51983-1-stephan@gerhold.net>
MIME-Version: 1.0
Cc: alsa-devel@alsa-project.org, patch@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Stephan Gerhold <stephan@gerhold.net>
Subject: [alsa-devel] [PATCH alsa-ucm-conf 7/7] codecs/msm8916-wcd: Add
	ConflictingDevice for capture devices
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

At the moment, all capture devices are configured to go through DEC1,
so there is no way to use more than one of the microphones at a time.

Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 ucm2/codecs/msm8916-wcd/DigitalMic.conf   | 6 ++++++
 ucm2/codecs/msm8916-wcd/HeadsetMic.conf   | 6 ++++++
 ucm2/codecs/msm8916-wcd/PrimaryMic.conf   | 6 ++++++
 ucm2/codecs/msm8916-wcd/SecondaryMic.conf | 6 ++++++
 4 files changed, 24 insertions(+)

diff --git a/ucm2/codecs/msm8916-wcd/DigitalMic.conf b/ucm2/codecs/msm8916-wcd/DigitalMic.conf
index 35dfb1b..3446506 100644
--- a/ucm2/codecs/msm8916-wcd/DigitalMic.conf
+++ b/ucm2/codecs/msm8916-wcd/DigitalMic.conf
@@ -1,6 +1,12 @@
 SectionDevice."DigitalMic" {
 	Comment "Digital Microphone"
 
+	ConflictingDevice [
+		"PrimaryMic"
+		"SecondaryMic"
+		"HeadsetMic"
+	]
+
 	EnableSequence [
 		cset "name='DEC1 MUX' DMIC1"
 		cset "name='CIC1 MUX' DMIC"
diff --git a/ucm2/codecs/msm8916-wcd/HeadsetMic.conf b/ucm2/codecs/msm8916-wcd/HeadsetMic.conf
index 538d895..2a96e49 100644
--- a/ucm2/codecs/msm8916-wcd/HeadsetMic.conf
+++ b/ucm2/codecs/msm8916-wcd/HeadsetMic.conf
@@ -1,6 +1,12 @@
 SectionDevice."HeadsetMic" {
 	Comment "Headset Microphone"
 
+	ConflictingDevice [
+		"PrimaryMic"
+		"SecondaryMic"
+		"DigitalMic"
+	]
+
 	EnableSequence [
 		cset "name='DEC1 MUX' ADC2"
 		cset "name='CIC1 MUX' AMIC"
diff --git a/ucm2/codecs/msm8916-wcd/PrimaryMic.conf b/ucm2/codecs/msm8916-wcd/PrimaryMic.conf
index 6998458..9d549ef 100644
--- a/ucm2/codecs/msm8916-wcd/PrimaryMic.conf
+++ b/ucm2/codecs/msm8916-wcd/PrimaryMic.conf
@@ -1,6 +1,12 @@
 SectionDevice."PrimaryMic" {
 	Comment "Primary Microphone"
 
+	ConflictingDevice [
+		"SecondaryMic"
+		"HeadsetMic"
+		"DigitalMic"
+	]
+
 	EnableSequence [
 		cset "name='DEC1 MUX' ADC1"
 		cset "name='CIC1 MUX' AMIC"
diff --git a/ucm2/codecs/msm8916-wcd/SecondaryMic.conf b/ucm2/codecs/msm8916-wcd/SecondaryMic.conf
index fdc5df8..d81324c 100644
--- a/ucm2/codecs/msm8916-wcd/SecondaryMic.conf
+++ b/ucm2/codecs/msm8916-wcd/SecondaryMic.conf
@@ -1,6 +1,12 @@
 SectionDevice."SecondaryMic" {
 	Comment "Secondary Microphone"
 
+	ConflictingDevice [
+		"PrimaryMic"
+		"HeadsetMic"
+		"DigitalMic"
+	]
+
 	EnableSequence [
 		cset "name='DEC1 MUX' ADC2"
 		cset "name='CIC1 MUX' AMIC"
-- 
2.24.1

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
