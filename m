Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF7F3264D7
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 16:42:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 403861679;
	Fri, 26 Feb 2021 16:41:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 403861679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614354147;
	bh=HA3P4xrS0JfNmmEZ39L+clx5ppNcAH9l8RmdOgvCWAA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Adiz9R334/Jg/8OtgeQb/DLUuHfwNgojMetnQoX0zAbSKxUaIa1qiDRnGzXpWAdrn
	 B/aohcsO3B5PzoDr/QbqFli1Oh3E+IIFzcdyWl4tlTGcAwgw1mH29iirckm7oVXLXz
	 BBkwlo949otwutpp1p6afaWWqUv73rjs/61UUPns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9B69FF802CA;
	Fri, 26 Feb 2021 16:40:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 65D61F80276; Fri, 26 Feb 2021 16:40:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6318BF80154
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 16:40:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6318BF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="OGsqKA0s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614354033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jxY8B4qTKDcHaRcAhEwhGpo5FXKEPrhaW4WxzNJwna0=;
 b=OGsqKA0sNXEQJtNduAUdMtS0epBmLMTM3ZyY4+cBE5ukbpgqkhi8mbLoh8MCNYc0CSLu+1
 Nk5zPknl/BF/+3bd7jh15oGgxM/df3s89/tg7L3FuCPIjrpr/TDPytf8WzAfgS4BYLBMc1
 TmXf5WRPsOjN7TKJmt+jjpmqvyBMkwU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-274-3_xm-V4APPiHrOjske4BQA-1; Fri, 26 Feb 2021 10:40:31 -0500
X-MC-Unique: 3_xm-V4APPiHrOjske4BQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1AD5680402E;
 Fri, 26 Feb 2021 15:40:30 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-36.ams2.redhat.com [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E2935131D8;
 Fri, 26 Feb 2021 15:40:28 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 1/8] codecs/rt5640: Cleanup: unify Stereo / Mono
 ADC handling
Date: Fri, 26 Feb 2021 16:40:18 +0100
Message-Id: <20210226154025.84828-2-hdegoede@redhat.com>
In-Reply-To: <20210226154025.84828-1-hdegoede@redhat.com>
References: <20210226154025.84828-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Bard Liao <bard.liao@intel.com>
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

Cleanup: no functional changes intended.

The rt5640 codec is sometimes used with AIF1 connected to the SoC
and sometimes with AIF2 connected to the SoC.

The rt5640 UCM configuration deals with this by accepting input from
and sending output to both AIFs, relying on the kernels DAPM framework to
disable parts of the graph which are connected to the unconnected AIF.

On the output side we solve this by enabling both the IF1_DAC and
IF2_DAC data inputs to the digital 'Stereo DAC MIX' mixer.

On the input side handling this is somewhat more complicated, the
"Digital Mixer Path" leading to the IF1_ADC and IF2_ADC outputs
are entirely separate paths. To solve this we enable the active
input (DMIC or ADC) in both the Stereo ADC (connected to IF1_ADC)
and the Mono ADC (IF2_ADC) paths.

So far we've not been entirely consistent in our handling of
the Stereo ADC vs Mono ADC paths, this commit cleans this up:

1. Set the 'Mono ADC Capture Switch' to on once from EnableSeq.conf,
   like we do for the 'ADC Capture Switch' instead of toggling it on/off
   from the individual input Enable/Disable sequences.

2. Group all the 'Mono ADC ...' mixer cset calls together with their
   stereo ADC counterparts.

3. Explicitly select DMIC L/R 1 for the Mono ADC L/R 2 Mux input, instead
   of relying on this being the default.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/codecs/rt5640/DigitalMics.conf     |  2 --
 ucm2/codecs/rt5640/EnableSeq.conf       | 10 +++++++---
 ucm2/codecs/rt5640/HeadsetMic.conf      | 10 ++--------
 ucm2/codecs/rt5640/IN1-InternalMic.conf | 11 ++---------
 ucm2/codecs/rt5640/IN3-InternalMic.conf | 11 ++---------
 5 files changed, 13 insertions(+), 31 deletions(-)

diff --git a/ucm2/codecs/rt5640/DigitalMics.conf b/ucm2/codecs/rt5640/DigitalMics.conf
index fdd412f..157c544 100644
--- a/ucm2/codecs/rt5640/DigitalMics.conf
+++ b/ucm2/codecs/rt5640/DigitalMics.conf
@@ -8,7 +8,6 @@ SectionDevice."Mic" {
 	EnableSequence [
 		cset "name='Mono ADC MIXL ADC2 Switch' on"
 		cset "name='Mono ADC MIXR ADC2 Switch' on"
-		cset "name='Mono ADC Capture Switch' on"
 		cset "name='Stereo ADC MIXL ADC2 Switch' on"
 		cset "name='Stereo ADC MIXR ADC2 Switch' on"
 		cset "name='Internal Mic Switch' on"
@@ -18,7 +17,6 @@ SectionDevice."Mic" {
 	DisableSequence [
 		cset "name='Mono ADC MIXL ADC2 Switch' off"
 		cset "name='Mono ADC MIXR ADC2 Switch' off"
-		cset "name='Mono ADC Capture Switch' off"
 		cset "name='Stereo ADC MIXL ADC2 Switch' off"
 		cset "name='Stereo ADC MIXR ADC2 Switch' off"
 		cset "name='Internal Mic Switch' off"
diff --git a/ucm2/codecs/rt5640/EnableSeq.conf b/ucm2/codecs/rt5640/EnableSeq.conf
index 145a23b..4754df7 100644
--- a/ucm2/codecs/rt5640/EnableSeq.conf
+++ b/ucm2/codecs/rt5640/EnableSeq.conf
@@ -30,8 +30,13 @@ EnableSequence [
 	# Input Configuration
 	cset "name='Stereo ADC1 Mux' ADC"
 	cset "name='Stereo ADC2 Mux' DMIC1"
-	cset "name='Mono ADC L1 Mux' 1"
-	cset "name='Mono ADC R1 Mux' 1"
+	cset "name='ADC Capture Switch' on"
+
+	cset "name='Mono ADC L1 Mux' ADCL"
+	cset "name='Mono ADC R1 Mux' ADCR"
+	cset "name='Mono ADC L2 Mux' DMIC L1"
+	cset "name='Mono ADC R2 Mux' DMIC R1"
+	cset "name='Mono ADC Capture Switch' on"
 
 	# 47=0dB, 0.375 dB/step, set it to 6 dB to help with soft mics
 	cset "name='ADC Capture Volume' 63"
@@ -45,5 +50,4 @@ EnableSequence [
 
 	cset "name='Internal Mic Switch' off"
 	cset "name='Headset Mic Switch' off"
-	cset "name='ADC Capture Switch' on"
 ]
diff --git a/ucm2/codecs/rt5640/HeadsetMic.conf b/ucm2/codecs/rt5640/HeadsetMic.conf
index f88b611..829e4e6 100644
--- a/ucm2/codecs/rt5640/HeadsetMic.conf
+++ b/ucm2/codecs/rt5640/HeadsetMic.conf
@@ -21,26 +21,20 @@ SectionDevice."Headset" {
 
 		cset "name='Stereo ADC MIXL ADC1 Switch' on"
 		cset "name='Stereo ADC MIXR ADC1 Switch' on"
-
 		cset "name='Mono ADC MIXL ADC1 Switch' on"
 		cset "name='Mono ADC MIXR ADC1 Switch' on"
-
-		cset "name='Mono ADC Capture Switch' on"
 	]
 
 	DisableSequence [
 		cset "name='Stereo ADC MIXL ADC1 Switch' off"
 		cset "name='Stereo ADC MIXR ADC1 Switch' off"
+		cset "name='Mono ADC MIXL ADC1 Switch' off"
+		cset "name='Mono ADC MIXR ADC1 Switch' off"
 
 		cset "name='RECMIXL BST2 Switch' off"
 		cset "name='RECMIXR BST2 Switch' off"
 
 		cset "name='Headset Mic Switch' off"
-
-		cset "name='Mono ADC MIXL ADC1 Switch' off"
-		cset "name='Mono ADC MIXR ADC1 Switch' off"
-
-		cset "name='Mono ADC Capture Switch' off"
 	]
 
 	Value {
diff --git a/ucm2/codecs/rt5640/IN1-InternalMic.conf b/ucm2/codecs/rt5640/IN1-InternalMic.conf
index ebb5b6d..260df90 100644
--- a/ucm2/codecs/rt5640/IN1-InternalMic.conf
+++ b/ucm2/codecs/rt5640/IN1-InternalMic.conf
@@ -15,27 +15,20 @@ SectionDevice."Mic" {
 
 		cset "name='Stereo ADC MIXL ADC1 Switch' on"
 		cset "name='Stereo ADC MIXR ADC1 Switch' on"
-
 		cset "name='Mono ADC MIXL ADC1 Switch' on"
 		cset "name='Mono ADC MIXR ADC1 Switch' on"
-
-		cset "name='Mono ADC Capture Switch' on"
 	]
 
 	DisableSequence [
 		cset "name='Stereo ADC MIXL ADC1 Switch' off"
 		cset "name='Stereo ADC MIXR ADC1 Switch' off"
+		cset "name='Mono ADC MIXL ADC1 Switch' off"
+		cset "name='Mono ADC MIXR ADC1 Switch' off"
 
 		cset "name='RECMIXL BST1 Switch' off"
 		cset "name='RECMIXR BST1 Switch' off"
 
 		cset "name='Internal Mic Switch' off"
-
-		cset "name='Mono ADC MIXL ADC1 Switch' off"
-		cset "name='Mono ADC MIXR ADC1 Switch' off"
-
-		cset "name='Mono ADC Capture Switch' off"
-
 	]
 
 	Value {
diff --git a/ucm2/codecs/rt5640/IN3-InternalMic.conf b/ucm2/codecs/rt5640/IN3-InternalMic.conf
index 172d909..ebd2b9c 100644
--- a/ucm2/codecs/rt5640/IN3-InternalMic.conf
+++ b/ucm2/codecs/rt5640/IN3-InternalMic.conf
@@ -15,27 +15,20 @@ SectionDevice."Mic" {
 
 		cset "name='Stereo ADC MIXL ADC1 Switch' on"
 		cset "name='Stereo ADC MIXR ADC1 Switch' on"
-
 		cset "name='Mono ADC MIXL ADC1 Switch' on"
 		cset "name='Mono ADC MIXR ADC1 Switch' on"
-
-		cset "name='Mono ADC Capture Switch' on"
-
 	]
 
 	DisableSequence [
 		cset "name='Stereo ADC MIXL ADC1 Switch' off"
 		cset "name='Stereo ADC MIXR ADC1 Switch' off"
+		cset "name='Mono ADC MIXL ADC1 Switch' off"
+		cset "name='Mono ADC MIXR ADC1 Switch' off"
 
 		cset "name='RECMIXL BST3 Switch' off"
 		cset "name='RECMIXR BST3 Switch' off"
 
 		cset "name='Internal Mic Switch' off"
-
-		cset "name='Mono ADC MIXL ADC1 Switch' off"
-		cset "name='Mono ADC MIXR ADC1 Switch' off"
-
-		cset "name='Mono ADC Capture Switch' off"
 	]
 
 	Value {
-- 
2.30.1

