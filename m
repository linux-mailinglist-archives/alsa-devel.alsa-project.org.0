Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1E53319FC
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 23:08:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A978A18D9;
	Mon,  8 Mar 2021 23:07:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A978A18D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615241311;
	bh=t4GRXwpz+QsM5RIrjqipLQFfVIBgOxJgg3lCGEgsv3c=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BuF7c00VdWdPTZqg15fx02MepOOU4myxiLc3MNlETXbLJ1P1PD7uS8CGQ1LTbseoW
	 WmmYe4LkoyXl4D1Zub/uPkJQ6cFcCM/nfxJiSMvx4XAmVRSM6ENESnrPZxg3CkRM/2
	 11ceUybvleAqgnGpwXPExXCpZ3qZp08wt4GqAd5U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BF0CF8016C;
	Mon,  8 Mar 2021 23:06:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3471F801D8; Mon,  8 Mar 2021 23:06:10 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E2032F80139
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 23:06:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E2032F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="ThGYfPp7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615241164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=461RKBm0rY9dqbC2WJLQm2UBN2yOxdhctKYoP7EIdUM=;
 b=ThGYfPp7O13p0Q5Tcw7pXxF/hqsdWcPy4V+txjpMecmQ87fTObb4fZlivDsHe1oCZbA0mX
 Bo3RlQuVvOJ3SaW7MsOt6QPHZxWAWUguCr0giWzqf7x0rRNIpfYscJOvYaPL04mXlmY6qL
 YH2X1lAmhTwSe2baOF9omoboOyJb25s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-Di9gsoLVOaeTqk1ZAYtp3w-1; Mon, 08 Mar 2021 17:06:01 -0500
X-MC-Unique: Di9gsoLVOaeTqk1ZAYtp3w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 142E51018F72;
 Mon,  8 Mar 2021 22:06:00 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-220.ams2.redhat.com
 [10.36.114.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6DA35D6D7;
 Mon,  8 Mar 2021 22:05:58 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf v2 2/7] codecs/rt5640: Cleanup: Initially
 disable all inputs and outputs
Date: Mon,  8 Mar 2021 23:05:49 +0100
Message-Id: <20210308220554.76111-3-hdegoede@redhat.com>
In-Reply-To: <20210308220554.76111-1-hdegoede@redhat.com>
References: <20210308220554.76111-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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

