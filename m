Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5582D315687
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Feb 2021 20:10:52 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C284416BF;
	Tue,  9 Feb 2021 20:10:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C284416BF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612897851;
	bh=Pkn76o6EUJgMgVAzkzhMKs8tdbKhabP77kZOLS6F9QM=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RLTWf2kFw/7f9Qhl8tdPnDVXhVLKxZni/ExPnwb690vLoO9vmjEIxqOkV3bIg0/OO
	 7SbsCPfHBkTdvh3hrvGM2HDTvNUdfsdXzoR6qf7+v9TNtRiMDZHr2o94TX/AAy0JJa
	 ysU8BUYoS0EyfC0ulEHRdCB3HIrQuWch49CteCaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2374EF80107;
	Tue,  9 Feb 2021 20:09:20 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0B504F80107; Tue,  9 Feb 2021 20:09:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 615A4F80107
 for <alsa-devel@alsa-project.org>; Tue,  9 Feb 2021 20:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 615A4F80107
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="KblrsFzd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612897749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UsgrL+bzyS0yeXnoNRnsI5qpHU0IkEBAaUHt/3cVbew=;
 b=KblrsFzdlqDBV8zkyAZhT1p9AxTO15yc4Z8n7vNErCBRpQFDxVtyEq0y7FjHYgI2SOG2fN
 KH0w/rdE22lblZjM8K+44AZg93tz0qyfz7LOpa2zJRT0oEA41gs5Bs+L5bRIy/fqFX0LX8
 3O4lAe4RJBnSDJ/6UXjyfGEy2fyTdeM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-cdBOXtO9NZOCOatbyoOajA-1; Tue, 09 Feb 2021 14:09:03 -0500
X-MC-Unique: cdBOXtO9NZOCOatbyoOajA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B0608030C2;
 Tue,  9 Feb 2021 19:09:02 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B2465D9C0;
 Tue,  9 Feb 2021 19:08:59 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf] bytcr-wm5102: Add new UCM profile for BYT
 boards with a WM5102 codec
Date: Tue,  9 Feb 2021 20:08:59 +0100
Message-Id: <20210209190859.70997-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Hans de Goede <hdegoede@redhat.com>, alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

Add new UCM profile for BYT boards with a WM5102 codec. This has been
tested with both the SST and the SOF driver on a
Lenovo Yoga Tablet 2 1051L.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/SOF/HiFi.conf                      |  9 +++++++++
 ucm2/bytcr-wm5102/HiFi.conf             | 27 +++++++++++++++++++++++++
 ucm2/bytcr-wm5102/bytcr-wm5102.conf     |  6 ++++++
 ucm2/codecs/wm5102/EnableSeq.conf       | 16 +++++++++++++++
 ucm2/codecs/wm5102/HeadPhones.conf      | 23 +++++++++++++++++++++
 ucm2/codecs/wm5102/IN1-HeadsetMic.conf  | 24 ++++++++++++++++++++++
 ucm2/codecs/wm5102/IN3-InternalMic.conf | 23 +++++++++++++++++++++
 ucm2/codecs/wm5102/Speaker.conf         | 22 ++++++++++++++++++++
 8 files changed, 150 insertions(+)
 create mode 100644 ucm2/bytcr-wm5102/HiFi.conf
 create mode 100644 ucm2/bytcr-wm5102/bytcr-wm5102.conf
 create mode 100644 ucm2/codecs/wm5102/EnableSeq.conf
 create mode 100644 ucm2/codecs/wm5102/HeadPhones.conf
 create mode 100644 ucm2/codecs/wm5102/IN1-HeadsetMic.conf
 create mode 100644 ucm2/codecs/wm5102/IN3-InternalMic.conf
 create mode 100644 ucm2/codecs/wm5102/Speaker.conf

diff --git a/ucm2/SOF/HiFi.conf b/ucm2/SOF/HiFi.conf
index af0d8c9..adf8cc5 100644
--- a/ucm2/SOF/HiFi.conf
+++ b/ucm2/SOF/HiFi.conf
@@ -79,6 +79,15 @@ If.bytcht_max98090 {
 	True.Include.main.File "/chtmax98090/HiFi.conf"
 }
 
+If.bytcht_wm5102 {
+	Condition {
+		Type String
+		Haystack "${CardName}"
+		Needle "bytcht wm5102"
+	}
+	True.Include.main.File "/bytcr-wm5102/HiFi.conf"
+}
+
 If.bdw_rt286 {
 	Condition {
 		Type String
diff --git a/ucm2/bytcr-wm5102/HiFi.conf b/ucm2/bytcr-wm5102/HiFi.conf
new file mode 100644
index 0000000..1269868
--- /dev/null
+++ b/ucm2/bytcr-wm5102/HiFi.conf
@@ -0,0 +1,27 @@
+SectionVerb {
+
+	Value {
+		TQ "HiFi"
+	}
+
+	Include.e.File "/codecs/wm5102/EnableSeq.conf"
+
+	If.Controls {
+		Condition {
+			Type ControlExists
+			Control "name='media0_in Gain 0 Switch'"
+		}
+		True {
+			Include.pe {
+				File "/platforms/bytcr/PlatformEnableSeq.conf"
+				Before.EnableSequence "0"
+			}
+			Include.pd.File "/platforms/bytcr/PlatformDisableSeq.conf"
+		}
+	}
+}
+
+Include.spk.File "/codecs/wm5102/Speaker.conf"
+Include.hp.File "/codecs/wm5102/HeadPhones.conf"
+Include.mic.File "/codecs/wm5102/IN3-InternalMic.conf"
+Include.headset.File "/codecs/wm5102/IN1-HeadsetMic.conf"
diff --git a/ucm2/bytcr-wm5102/bytcr-wm5102.conf b/ucm2/bytcr-wm5102/bytcr-wm5102.conf
new file mode 100644
index 0000000..af966ef
--- /dev/null
+++ b/ucm2/bytcr-wm5102/bytcr-wm5102.conf
@@ -0,0 +1,6 @@
+Syntax 3
+
+SectionUseCase."HiFi" {
+	File "HiFi.conf"
+	Comment "Play HiFi quality Music"
+}
diff --git a/ucm2/codecs/wm5102/EnableSeq.conf b/ucm2/codecs/wm5102/EnableSeq.conf
new file mode 100644
index 0000000..6a857a2
--- /dev/null
+++ b/ucm2/codecs/wm5102/EnableSeq.conf
@@ -0,0 +1,16 @@
+EnableSequence [
+	# Route AIF1 to the speakers and headphones
+	cset "name='SPKOUTL Input 1' AIF1RX1"
+	cset "name='SPKOUTR Input 1' AIF1RX2"
+	cset "name='HPOUT1L Input 1' AIF1RX1"
+	cset "name='HPOUT1R Input 1' AIF1RX2"
+
+	# Both mics are quite soft by default, boost then
+	cset "name='IN1L Volume' 28"
+	cset "name='IN3L Volume' 28"
+
+	cset "name='Headphone Switch' off"
+	cset "name='Headset Mic Switch' off"
+	cset "name='Internal Mic Switch' off"
+	cset "name='Speaker Switch' off"
+]
diff --git a/ucm2/codecs/wm5102/HeadPhones.conf b/ucm2/codecs/wm5102/HeadPhones.conf
new file mode 100644
index 0000000..cb29347
--- /dev/null
+++ b/ucm2/codecs/wm5102/HeadPhones.conf
@@ -0,0 +1,23 @@
+SectionDevice."Headphones" {
+	Comment "Headphones"
+
+	Value {
+		PlaybackPriority 200
+		PlaybackPCM "hw:${CardId}"
+		JackControl "Headphone Jack"
+	}
+
+	ConflictingDevice [
+		"Speaker"
+	]
+
+	EnableSequence [
+		cset "name='HPOUT1 Digital Switch' on"
+		cset "name='Headphone Switch' on"
+	]
+
+	DisableSequence [
+		cset "name='HPOUT1 Digital Switch' off"
+		cset "name='Headphone Switch' off"
+	]
+}
diff --git a/ucm2/codecs/wm5102/IN1-HeadsetMic.conf b/ucm2/codecs/wm5102/IN1-HeadsetMic.conf
new file mode 100644
index 0000000..a607487
--- /dev/null
+++ b/ucm2/codecs/wm5102/IN1-HeadsetMic.conf
@@ -0,0 +1,24 @@
+SectionDevice."Headset" {
+	Comment "Headset Microphone"
+
+	ConflictingDevice [
+		"Mic"
+	]
+
+	EnableSequence [
+		cset "name='AIF1TX1 Input 1' IN1L"
+		cset "name='AIF1TX2 Input 1' IN1L"
+
+		cset "name='Headset Mic Switch' on"
+	]
+
+	DisableSequence [
+		cset "name='Headset Mic Switch' off"
+	]
+
+	Value {
+		CapturePriority 200
+		CapturePCM "hw:${CardId}"
+		JackControl "Headset Mic Jack"
+	}
+}
diff --git a/ucm2/codecs/wm5102/IN3-InternalMic.conf b/ucm2/codecs/wm5102/IN3-InternalMic.conf
new file mode 100644
index 0000000..3a03ac3
--- /dev/null
+++ b/ucm2/codecs/wm5102/IN3-InternalMic.conf
@@ -0,0 +1,23 @@
+SectionDevice."Mic" {
+	Comment "Internal Microphone"
+
+	ConflictingDevice [
+		"Headset"
+	]
+
+	EnableSequence [
+		cset "name='AIF1TX1 Input 1' IN3L"
+		cset "name='AIF1TX2 Input 1' IN3L"
+
+		cset "name='Internal Mic Switch' on"
+	]
+
+	DisableSequence [
+		cset "name='Internal Mic Switch' off"
+	]
+
+	Value {
+		CapturePriority 100
+		CapturePCM "hw:${CardId}"
+	}
+}
diff --git a/ucm2/codecs/wm5102/Speaker.conf b/ucm2/codecs/wm5102/Speaker.conf
new file mode 100644
index 0000000..9f631f5
--- /dev/null
+++ b/ucm2/codecs/wm5102/Speaker.conf
@@ -0,0 +1,22 @@
+SectionDevice."Speaker" {
+	Comment "Speakers"
+
+	Value {
+		PlaybackPriority 100
+		PlaybackPCM "hw:${CardId}"
+	}
+
+	ConflictingDevice [
+		"Headphones"
+	]
+
+	EnableSequence [
+		cset "name='Speaker Digital Switch' on"
+		cset "name='Speaker Switch' on"
+	]
+
+	DisableSequence [
+		cset "name='Speaker Digital Switch' off"
+		cset "name='Speaker Switch' off"
+	]
+}
-- 
2.30.0

