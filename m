Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C9A330469
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 21:05:53 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B53801911;
	Sun,  7 Mar 2021 21:05:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B53801911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615147552;
	bh=/jh/5HZKOj0zNybnfm6P14vh9jzh92JaFk30KVDcEPA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g86spTWkaEgKNP1Qe2mrZvFp12jLHOOBaDkKdyrElLBu3I0+5UFVSRXIXuxVSkB/U
	 +3JszsI3EF7BVwBpgh7iZFXN/jtNWxHdn93mFxUqyPvNrm2mvEZwgIv9wSjbZ987fm
	 D2V7q63Po/pplKoSh36R1oBtVuYoBfePfnoaarpM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3F7CF8032B;
	Sun,  7 Mar 2021 21:03:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74B1DF8028B; Sun,  7 Mar 2021 21:03:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 691DAF8019B
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 21:03:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 691DAF8019B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="dQZIUnls"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615147399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8VyDX/KeJgAQ1xNKZErNIMtv7nhbK+Qfv5+D8jX1NfM=;
 b=dQZIUnls6YvHlHnUsfK9JDIxW0rVWanloNdopstHmqHt+4djW7UBuvyD6aYlUylBtWm8xb
 rxdGAad29xZQVAiiguAVv86fyQ3zwbuf/QOXz+BIejbvIBp7VkX3zlld2Nzij7DCbys69N
 ZbKpoFz2ki8nDySzDAHgIt5oALuZQG4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-DKqqjZWsOmOqVymeD7VLKg-1; Sun, 07 Mar 2021 15:03:16 -0500
X-MC-Unique: DKqqjZWsOmOqVymeD7VLKg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 00CD087A826;
 Sun,  7 Mar 2021 20:03:15 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-90.ams2.redhat.com [10.36.112.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E06AC1009962;
 Sun,  7 Mar 2021 20:03:13 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 3/3] codecs/es8316: Add hardware volume-control
 support
Date: Sun,  7 Mar 2021 21:03:08 +0100
Message-Id: <20210307200308.136385-3-hdegoede@redhat.com>
In-Reply-To: <20210307200308.136385-1-hdegoede@redhat.com>
References: <20210307200308.136385-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

Add hardware volume-control support for the es8316 codec.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/codecs/es8316/HeadPhones.conf      | 2 ++
 ucm2/codecs/es8316/IN1-HeadsetMic.conf  | 2 ++
 ucm2/codecs/es8316/IN1-InternalMic.conf | 2 ++
 ucm2/codecs/es8316/IN2-HeadsetMic.conf  | 2 ++
 ucm2/codecs/es8316/IN2-InternalMic.conf | 2 ++
 ucm2/codecs/es8316/MonoSpeaker.conf     | 4 ++++
 ucm2/codecs/es8316/Speaker.conf         | 4 ++++
 7 files changed, 18 insertions(+)

diff --git a/ucm2/codecs/es8316/HeadPhones.conf b/ucm2/codecs/es8316/HeadPhones.conf
index b68569a..57bd448 100644
--- a/ucm2/codecs/es8316/HeadPhones.conf
+++ b/ucm2/codecs/es8316/HeadPhones.conf
@@ -16,6 +16,8 @@ SectionDevice."Headphones" {
 	Value {
 		PlaybackPriority 200
 		PlaybackPCM "hw:${CardId}"
+		PlaybackMixerElem "Headphone Mixer"
+		PlaybackMasterElem "DAC"
 		JackControl "Headphone Jack"
 		JackHWMute "Speaker"
 	}
diff --git a/ucm2/codecs/es8316/IN1-HeadsetMic.conf b/ucm2/codecs/es8316/IN1-HeadsetMic.conf
index a76b275..53958ba 100644
--- a/ucm2/codecs/es8316/IN1-HeadsetMic.conf
+++ b/ucm2/codecs/es8316/IN1-HeadsetMic.conf
@@ -17,6 +17,8 @@ SectionDevice."Headset" {
 	Value {
 		CapturePriority 200
 		CapturePCM "hw:${CardId}"
+		CaptureMixerElem "ADC PGA Gain"
+		CaptureMasterElem "ADC"
 		JackControl "Headset Mic Jack"
 	}
 }
diff --git a/ucm2/codecs/es8316/IN1-InternalMic.conf b/ucm2/codecs/es8316/IN1-InternalMic.conf
index ede0a8c..7e7f75f 100644
--- a/ucm2/codecs/es8316/IN1-InternalMic.conf
+++ b/ucm2/codecs/es8316/IN1-InternalMic.conf
@@ -17,5 +17,7 @@ SectionDevice."Mic" {
 	Value {
 		CapturePriority 100
 		CapturePCM "hw:${CardId}"
+		CaptureMixerElem "ADC PGA Gain"
+		CaptureMasterElem "ADC"
 	}
 }
diff --git a/ucm2/codecs/es8316/IN2-HeadsetMic.conf b/ucm2/codecs/es8316/IN2-HeadsetMic.conf
index b114c86..9221b24 100644
--- a/ucm2/codecs/es8316/IN2-HeadsetMic.conf
+++ b/ucm2/codecs/es8316/IN2-HeadsetMic.conf
@@ -17,6 +17,8 @@ SectionDevice."Headset" {
 	Value {
 		CapturePriority 200
 		CapturePCM "hw:${CardId}"
+		CaptureMixerElem "ADC PGA Gain"
+		CaptureMasterElem "ADC"
 		JackControl "Headset Mic Jack"
 	}
 }
diff --git a/ucm2/codecs/es8316/IN2-InternalMic.conf b/ucm2/codecs/es8316/IN2-InternalMic.conf
index c8fce62..8b73da4 100644
--- a/ucm2/codecs/es8316/IN2-InternalMic.conf
+++ b/ucm2/codecs/es8316/IN2-InternalMic.conf
@@ -17,5 +17,7 @@ SectionDevice."Mic" {
 	Value {
 		CapturePriority 100
 		CapturePCM "hw:${CardId}"
+		CaptureMixerElem "ADC PGA Gain"
+		CaptureMasterElem "ADC"
 	}
 }
diff --git a/ucm2/codecs/es8316/MonoSpeaker.conf b/ucm2/codecs/es8316/MonoSpeaker.conf
index f5f4273..2d76413 100644
--- a/ucm2/codecs/es8316/MonoSpeaker.conf
+++ b/ucm2/codecs/es8316/MonoSpeaker.conf
@@ -33,5 +33,9 @@ SectionDevice."Speaker" {
 	Value {
 		PlaybackPriority 100
 		PlaybackPCM "hw:${CardId}"
+		# The es8316 only has a HP-amp which is muxed to the speaker
+		# or to the headpones output
+		PlaybackMixerElem "Headphone Mixer"
+		PlaybackMasterElem "DAC"
 	}
 }
diff --git a/ucm2/codecs/es8316/Speaker.conf b/ucm2/codecs/es8316/Speaker.conf
index 03c21b3..4e97772 100644
--- a/ucm2/codecs/es8316/Speaker.conf
+++ b/ucm2/codecs/es8316/Speaker.conf
@@ -16,5 +16,9 @@ SectionDevice."Speaker" {
 	Value {
 		PlaybackPriority 100
 		PlaybackPCM "hw:${CardId}"
+		# The es8316 only has a HP-amp which is muxed to the speaker
+		# or to the headpones output
+		PlaybackMixerElem "Headphone Mixer"
+		PlaybackMasterElem "DAC"
 	}
 }
-- 
2.30.1

