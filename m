Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC452F03B1
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Jan 2021 22:05:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DE7331738;
	Sat,  9 Jan 2021 22:04:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DE7331738
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1610226323;
	bh=5rHgmABDVYRM8Sn3j30imK+YfbsEJoN8nOuAgBQMxe8=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TId1zJWgTGnnk7QQLxmdKJ3VhLDz/3iMzUwwJ0HqW6ZUSqtHmWgHCv9+m6xTXnFJC
	 XUAdrn02qY8FqjG/QtvRPyoAop+I4JUJhvlZj7L9Hn9Cm6Ymr/vBiyCwwLSLC2PdIL
	 tvx/MD8EcexNCVUwPEO+45e7n3BVYwPPdm/m7bns=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 76820F800E9;
	Sat,  9 Jan 2021 22:04:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8028CF80268; Sat,  9 Jan 2021 22:04:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 60C2EF802C4
 for <alsa-devel@alsa-project.org>; Sat,  9 Jan 2021 22:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C2EF802C4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="YymnYgxq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610226180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Fc5fhyA/boTVqAlQc0bhR74rtZYWxvvjSG/aHNzHShs=;
 b=YymnYgxqF2VPYy6kw0d3joE1aV+R9l+ZqOI7eC3SmoNFkfJFMY3VC5FpJRD75/8VCAoOrO
 qCsopSFrJhWZkL4xmZgzL7eBiJaMV9xDlgqyGRJXZwGsVKekMmWzmWE8VaTjaLy9eaPYdI
 Tu4fetPxeKhP1BxE0dRPAZxHAjDAyTk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-GkoYnDLSPeWvEFkOzio40A-1; Sat, 09 Jan 2021 16:02:56 -0500
X-MC-Unique: GkoYnDLSPeWvEFkOzio40A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 30CBD107ACE3;
 Sat,  9 Jan 2021 21:02:55 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-11.ams2.redhat.com [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D59660C5B;
 Sat,  9 Jan 2021 21:02:53 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 1/2] bytcr-rt5640: Add support for devices
 without speakers and/or an internal mic
Date: Sat,  9 Jan 2021 22:02:51 +0100
Message-Id: <20210109210252.159162-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Cc: Rasmus Porsager <rasmus@beat.dk>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org,
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

There are kernel patches pending upstream for the bytcr-rt5640 machine-driver
to support devices without speakers and/or an internal mic.

Since the UCM profile already conditionally loads the speaker and
internal-mic codec include files, these will simply get skipped in this
case, so this almost works with the current UCM profile without changes.

The only troublesome part is the ConflictingDevice sections in the codec
HeadPhones.conf and HeadsetMic.conf files, which refer to resp. a "Speaker"
and a "Mic" device. Without any of the speaker or mic codec conf files
being included there will not by any "Speaker" / "Mic" devices leading
to an error while parsing the HeadPhones.conf / HeadsetMic.conf files.

This commit makes the ConflictingDevice section conditional, fixing this.

Cc: Rasmus Porsager <rasmus@beat.dk>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/bytcr-rt5640/HiFi-Components.conf | 28 +++++++++++++++++++++-----
 ucm2/bytcr-rt5640/HiFi-LongName.conf   | 28 +++++++++++++++++++++-----
 ucm2/codecs/rt5640/HeadPhones.conf     | 14 ++++++++++---
 ucm2/codecs/rt5640/HeadsetMic.conf     | 14 ++++++++++---
 4 files changed, 68 insertions(+), 16 deletions(-)

diff --git a/ucm2/bytcr-rt5640/HiFi-Components.conf b/ucm2/bytcr-rt5640/HiFi-Components.conf
index 2ce4f59..a76b42d 100644
--- a/ucm2/bytcr-rt5640/HiFi-Components.conf
+++ b/ucm2/bytcr-rt5640/HiFi-Components.conf
@@ -1,10 +1,16 @@
+Define.HaveSpeaker ""
+Define.HaveInternalMic ""
+
 If.spk {
 	Condition {
 		Type String
 		Haystack "${CardComponents}"
 		Needle "cfg-spk:2"
 	}
-	True.Include.spk.File "/codecs/rt5640/Speaker.conf"
+	True {
+		Include.spk.File "/codecs/rt5640/Speaker.conf"
+		Define.HaveSpeaker "yes"
+	}
 }
 
 If.mono {
@@ -13,7 +19,10 @@ If.mono {
 		Haystack "${CardComponents}"
 		Needle "cfg-spk:1"
 	}
-	True.Include.mspk.File "/codecs/rt5640/MonoSpeaker.conf"
+	True {
+		Include.mspk.File "/codecs/rt5640/MonoSpeaker.conf"
+		Define.HaveSpeaker "yes"
+	}
 }
 
 Include.hs.File "/codecs/rt5640/HeadPhones.conf"
@@ -24,7 +33,10 @@ If.dmic1 {
 		Haystack "${CardComponents}"
 		Needle "cfg-mic:dmic1"
 	}
-	True.Include.dmic.File "/codecs/rt5640/DigitalMics.conf"
+	True {
+		Include.dmic.File "/codecs/rt5640/DigitalMics.conf"
+		Define.HaveInternalMic "yes"
+	}
 }
 
 If.in1 {
@@ -33,7 +45,10 @@ If.in1 {
 		Haystack "${CardComponents}"
 		Needle "cfg-mic:in1"
 	}
-	True.Include.mic1.File "/codecs/rt5640/IN1-InternalMic.conf"
+	True {
+		Include.mic1.File "/codecs/rt5640/IN1-InternalMic.conf"
+		Define.HaveInternalMic "yes"
+	}
 }
 
 If.in3 {
@@ -42,7 +57,10 @@ If.in3 {
 		Haystack "${CardComponents}"
 		Needle "cfg-mic:in3"
 	}
-	True.Include.mic3.File "/codecs/rt5640/IN3-InternalMic.conf"
+	True {
+		Include.mic3.File "/codecs/rt5640/IN3-InternalMic.conf"
+		Define.HaveInternalMic "yes"
+	}
 }
 
 Include.hsmic.File "/codecs/rt5640/HeadsetMic.conf"
diff --git a/ucm2/bytcr-rt5640/HiFi-LongName.conf b/ucm2/bytcr-rt5640/HiFi-LongName.conf
index c07f153..6cb5556 100644
--- a/ucm2/bytcr-rt5640/HiFi-LongName.conf
+++ b/ucm2/bytcr-rt5640/HiFi-LongName.conf
@@ -1,10 +1,16 @@
+Define.HaveSpeaker ""
+Define.HaveInternalMic ""
+
 If.spk {
 	Condition {
 		Type String
 		Haystack "${CardLongName}"
 		Needle "-stereo-spk"
 	}
-	True.Include.spk.File "/codecs/rt5640/Speaker.conf"
+	True {
+		Include.spk.File "/codecs/rt5640/Speaker.conf"
+		Define.HaveSpeaker "yes"
+	}
 }
 
 If.mono {
@@ -13,7 +19,10 @@ If.mono {
 		Haystack "${CardLongName}"
 		Needle "-mono-spk"
 	}
-	True.Include.mspk.File "/codecs/rt5640/MonoSpeaker.conf"
+	True {
+		Include.mspk.File "/codecs/rt5640/MonoSpeaker.conf"
+		Define.HaveSpeaker "yes"
+	}
 }
 
 Include.hs.File "/codecs/rt5640/HeadPhones.conf"
@@ -24,7 +33,10 @@ If.dmic1 {
 		Haystack "${CardLongName}"
 		Needle "-dmic1-mic"
 	}
-	True.Include.dmic.File "/codecs/rt5640/DigitalMics.conf"
+	True {
+		Include.dmic.File "/codecs/rt5640/DigitalMics.conf"
+		Define.HaveInternalMic "yes"
+	}
 }
 
 If.in1 {
@@ -33,7 +45,10 @@ If.in1 {
 		Haystack "${CardLongName}"
 		Needle "-in1-mic"
 	}
-	True.Include.mic1.File "/codecs/rt5640/IN1-InternalMic.conf"
+	True {
+		Include.mic1.File "/codecs/rt5640/IN1-InternalMic.conf"
+		Define.HaveInternalMic "yes"
+	}
 }
 
 If.in3 {
@@ -42,7 +57,10 @@ If.in3 {
 		Haystack "${CardLongName}"
 		Needle "-in3-mic"
 	}
-	True.Include.mic3.File "/codecs/rt5640/IN3-InternalMic.conf"
+	True {
+		Include.mic3.File "/codecs/rt5640/IN3-InternalMic.conf"
+		Define.HaveInternalMic "yes"
+	}
 }
 
 Include.hsmic.File "/codecs/rt5640/HeadsetMic.conf"
diff --git a/ucm2/codecs/rt5640/HeadPhones.conf b/ucm2/codecs/rt5640/HeadPhones.conf
index 42151d6..b7707e5 100644
--- a/ucm2/codecs/rt5640/HeadPhones.conf
+++ b/ucm2/codecs/rt5640/HeadPhones.conf
@@ -1,9 +1,17 @@
 SectionDevice."Headphones" {
 	Comment "Headphones"
 
-	ConflictingDevice [
-		"Speaker"
-	]
+	If.have-spk {
+		Condition {
+			Type String
+			Empty "${var:HaveSpeaker}"
+		}
+		False {
+			ConflictingDevice [
+				"Speaker"
+			]
+		}
+	}
 
 	EnableSequence [
  		cset "name='DAC MIXL INF1 Switch'  on"
diff --git a/ucm2/codecs/rt5640/HeadsetMic.conf b/ucm2/codecs/rt5640/HeadsetMic.conf
index 7a8dfb8..f88b611 100644
--- a/ucm2/codecs/rt5640/HeadsetMic.conf
+++ b/ucm2/codecs/rt5640/HeadsetMic.conf
@@ -1,9 +1,17 @@
 SectionDevice."Headset" {
 	Comment "Headset Microphone"
 
-	ConflictingDevice [
-		"Mic"
-	]
+	If.have-mic {
+		Condition {
+			Type String
+			Empty "${var:HaveInternalMic}"
+		}
+		False {
+			ConflictingDevice [
+				"Mic"
+			]
+		}
+	}
 
 	EnableSequence [
 		cset "name='Headset Mic Switch' on"
-- 
2.28.0

