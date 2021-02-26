Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D303264D9
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 16:43:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADFF81695;
	Fri, 26 Feb 2021 16:42:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADFF81695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614354198;
	bh=t4GRXwpz+QsM5RIrjqipLQFfVIBgOxJgg3lCGEgsv3c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ghwn3WUmyu/Fzcd+qcW41lyDXw5q/EI2exueFxTJfM91KC8nmuJHVygYc6k/q6yI9
	 nQuuN8Y88V4wHr6HNCmVMt5+2vs0K9+OtwNywHmmiD998cRaNpUBQZkoTAzW0k52uS
	 +Bwd0086vM8vMhsBxijyrTBcfRUK9GgBzzRnC5R0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6B0DF802DF;
	Fri, 26 Feb 2021 16:40:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 455A4F802E2; Fri, 26 Feb 2021 16:40:48 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CA882F8016C
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 16:40:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CA882F8016C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="VnRO9IaS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614354034;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=461RKBm0rY9dqbC2WJLQm2UBN2yOxdhctKYoP7EIdUM=;
 b=VnRO9IaSwk50x4YkatB0ZhuDVMSDGBlZcuoDUaNa80yMwx4OARY50R2qe8s0u7H3n3pmJb
 W1jyUUNPO2+tVlXlZWrdcDvVVu9FHg6EXqGeesRGovaZt2aRGrTkMcnw8V2owCUIXLKA58
 g6iZK2e8Xv4vhTUnYBpLrbFc+JY8JyI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-gzld9M5yMv2BqroHNaxE6Q-1; Fri, 26 Feb 2021 10:40:32 -0500
X-MC-Unique: gzld9M5yMv2BqroHNaxE6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 731626D4E3;
 Fri, 26 Feb 2021 15:40:31 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-36.ams2.redhat.com [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 618251050E;
 Fri, 26 Feb 2021 15:40:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 2/8] codecs/rt5640: Cleanup: Initially disable
 all inputs and outputs
Date: Fri, 26 Feb 2021 16:40:19 +0100
Message-Id: <20210226154025.84828-3-hdegoede@redhat.com>
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

Disable all inputs and outputs from the main EnableSequence.

This allows removing some weirdness from the individual input/output
EnableSequences where they were turning controls for other inputs/outputs
then themselves off.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/codecs/rt5640/EnableSeq.conf       | 21 +++++++++++++++++++++
 ucm2/codecs/rt5640/HeadPhones.conf      |  1 -
 ucm2/codecs/rt5640/IN1-InternalMic.conf |  2 --
 ucm2/codecs/rt5640/IN3-InternalMic.conf |  2 --
 ucm2/codecs/rt5640/MonoSpeaker.conf     |  1 -
 ucm2/codecs/rt5640/Speaker.conf         |  1 -
 6 files changed, 21 insertions(+), 7 deletions(-)

diff --git a/ucm2/codecs/rt5640/EnableSeq.conf b/ucm2/codecs/rt5640/EnableSeq.conf
index 4754df7..5dc7092 100644
--- a/ucm2/codecs/rt5640/EnableSeq.conf
+++ b/ucm2/codecs/rt5640/EnableSeq.conf
@@ -48,6 +48,27 @@ EnableSequence [
 	cset "name='IN2 Boost' 1"
 	cset "name='IN3 Boost' 8"
 
+	# Start with all controls which are used by the individual
+	# input/output Enable/DisableSequences off
+
+	cset "name='RECMIXL BST1 Switch' off"
+	cset "name='RECMIXR BST1 Switch' off"
+	cset "name='RECMIXL BST2 Switch' off"
+	cset "name='RECMIXR BST2 Switch' off"
+	cset "name='RECMIXL BST3 Switch' off"
+	cset "name='RECMIXR BST3 Switch' off"
+
+	cset "name='Stereo ADC MIXL ADC1 Switch' off"
+	cset "name='Stereo ADC MIXR ADC1 Switch' off"
+	cset "name='Stereo ADC MIXL ADC2 Switch' off"
+	cset "name='Stereo ADC MIXR ADC2 Switch' off"
+	cset "name='Mono ADC MIXL ADC1 Switch' off"
+	cset "name='Mono ADC MIXR ADC1 Switch' off"
+	cset "name='Mono ADC MIXL ADC2 Switch' off"
+	cset "name='Mono ADC MIXR ADC2 Switch' off"
+
+	cset "name='Speaker Switch' off"
+	cset "name='Headphone Switch' off"
 	cset "name='Internal Mic Switch' off"
 	cset "name='Headset Mic Switch' off"
 ]
diff --git a/ucm2/codecs/rt5640/HeadPhones.conf b/ucm2/codecs/rt5640/HeadPhones.conf
index a9e4d20..1f4316d 100644
--- a/ucm2/codecs/rt5640/HeadPhones.conf
+++ b/ucm2/codecs/rt5640/HeadPhones.conf
@@ -17,7 +17,6 @@ SectionDevice."Headphones" {
  		cset "name='HPO MIX HPVOL Switch'  on"
  		cset "name='Headphone Switch'  on"
 		cset "name='HP Channel Switch' on"
- 		cset "name='Speaker Switch' off"
 		cset "name='HP L Playback Switch' on"
 		cset "name='HP R Playback Switch' on"
 		cset "name='HP Playback Volume' 29"
diff --git a/ucm2/codecs/rt5640/IN1-InternalMic.conf b/ucm2/codecs/rt5640/IN1-InternalMic.conf
index 260df90..d7c419e 100644
--- a/ucm2/codecs/rt5640/IN1-InternalMic.conf
+++ b/ucm2/codecs/rt5640/IN1-InternalMic.conf
@@ -10,8 +10,6 @@ SectionDevice."Mic" {
 
 		cset "name='RECMIXL BST1 Switch' on"
 		cset "name='RECMIXR BST1 Switch' on"
-		cset "name='RECMIXL BST3 Switch' off"
-		cset "name='RECMIXR BST3 Switch' off"
 
 		cset "name='Stereo ADC MIXL ADC1 Switch' on"
 		cset "name='Stereo ADC MIXR ADC1 Switch' on"
diff --git a/ucm2/codecs/rt5640/IN3-InternalMic.conf b/ucm2/codecs/rt5640/IN3-InternalMic.conf
index ebd2b9c..3e330e6 100644
--- a/ucm2/codecs/rt5640/IN3-InternalMic.conf
+++ b/ucm2/codecs/rt5640/IN3-InternalMic.conf
@@ -8,8 +8,6 @@ SectionDevice."Mic" {
 	EnableSequence [
 		cset "name='Internal Mic Switch' on"
 
-		cset "name='RECMIXL BST1 Switch' off"
-		cset "name='RECMIXR BST1 Switch' off"
 		cset "name='RECMIXL BST3 Switch' on"
 		cset "name='RECMIXR BST3 Switch' on"
 
diff --git a/ucm2/codecs/rt5640/MonoSpeaker.conf b/ucm2/codecs/rt5640/MonoSpeaker.conf
index 23cf34c..5035c8d 100644
--- a/ucm2/codecs/rt5640/MonoSpeaker.conf
+++ b/ucm2/codecs/rt5640/MonoSpeaker.conf
@@ -14,7 +14,6 @@ SectionDevice."Speaker" {
 		cset "name='SPOL MIX SPKVOL R Switch' on"
 		cset "name='Speaker Switch' on"
 		cset "name='Speaker Channel Switch' on"
-		cset "name='Headphone Switch' off"
 		cset "name='Speaker L Playback Switch' on"
 		cset "name='Speaker R Playback Switch' on"
 		cset "name='Speaker Playback Volume' 35"
diff --git a/ucm2/codecs/rt5640/Speaker.conf b/ucm2/codecs/rt5640/Speaker.conf
index 422cfdf..fd74994 100644
--- a/ucm2/codecs/rt5640/Speaker.conf
+++ b/ucm2/codecs/rt5640/Speaker.conf
@@ -14,7 +14,6 @@ SectionDevice."Speaker" {
 		cset "name='SPOL MIX SPKVOL R Switch' off"
 		cset "name='Speaker Switch' on"
 		cset "name='Speaker Channel Switch' on"
-		cset "name='Headphone Switch' off"
 		cset "name='Speaker L Playback Switch' on"
 		cset "name='Speaker R Playback Switch' on"
 		cset "name='Speaker Playback Volume' 35"
-- 
2.30.1

