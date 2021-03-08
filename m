Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D22F331A00
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Mar 2021 23:10:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0700E18CD;
	Mon,  8 Mar 2021 23:09:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0700E18CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615241405;
	bh=AoCj2MfxvD/4rvE5UVuBwiQrDDmChsm6kaRt9+H2suI=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Xmpe3IV8/ZqRc6HLTeNLxCij+EeqmJxLaeSCYE4ReOb9kIlk9rAXitlqhz4pyUVOl
	 PInaiC8l/DJoG2SCZO5yYcyfBanaQogNffjzez3yCtksO8qH99dsS0RehOtQldGMf8
	 0lrLn1r8y4Nc/iaTtHMIU941fwUPerS9zBfOFwZM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D41EDF804B4;
	Mon,  8 Mar 2021 23:06:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E0862F802E7; Mon,  8 Mar 2021 23:06:15 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0BF8FF80139
 for <alsa-devel@alsa-project.org>; Mon,  8 Mar 2021 23:06:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0BF8FF80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="g5BW5Mdg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615241168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GptrVlL/IvCa/3+g0IoS03y5KFkwAmZrLf7JXRBN3xQ=;
 b=g5BW5MdgRWhYfgs2f7I6Dz8obMZ/ooL/WQol7FDK/DsBAQ9e4WUvuXDQ7UWGSgyqNAyPuI
 DWlIs3RAtURTfcY2Ok17CxRG2o/MowJ3nSErXvB0pWrspZPcLBt7QNf7obp1VQWePqJuDT
 ujgBGU0/HF8Os3ya5v2jW9XRHdgbkKo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-NuQ8V8YaOtWCmVerCe8V5g-1; Mon, 08 Mar 2021 17:06:06 -0500
X-MC-Unique: NuQ8V8YaOtWCmVerCe8V5g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8EBB71018F74;
 Mon,  8 Mar 2021 22:06:05 +0000 (UTC)
Received: from x1.localdomain.com (ovpn-114-220.ams2.redhat.com
 [10.36.114.220])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C0B25D6D7;
 Mon,  8 Mar 2021 22:06:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf v2 6/7] codecs/rt5640: Add hardware
 volume-control support
Date: Mon,  8 Mar 2021 23:05:53 +0100
Message-Id: <20210308220554.76111-7-hdegoede@redhat.com>
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

Add hardware volume-control support for the rt5640 codec.

Note this commit does not add support for the (digital) master
ADC/DAC Volume / Mute controls. There are 2 of each, and which
one should be used depends on which AIF is being used.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/codecs/rt5640/HeadPhones.conf      | 2 ++
 ucm2/codecs/rt5640/HeadsetMic.conf      | 2 ++
 ucm2/codecs/rt5640/IN1-InternalMic.conf | 2 ++
 ucm2/codecs/rt5640/IN3-InternalMic.conf | 2 ++
 ucm2/codecs/rt5640/MonoSpeaker.conf     | 2 ++
 ucm2/codecs/rt5640/Speaker.conf         | 2 ++
 6 files changed, 12 insertions(+)

diff --git a/ucm2/codecs/rt5640/HeadPhones.conf b/ucm2/codecs/rt5640/HeadPhones.conf
index 1f4316d..5535111 100644
--- a/ucm2/codecs/rt5640/HeadPhones.conf
+++ b/ucm2/codecs/rt5640/HeadPhones.conf
@@ -35,5 +35,7 @@ SectionDevice."Headphones" {
 		PlaybackPriority 300
 		PlaybackPCM "hw:${CardId}"
 		JackControl "Headphone Jack"
+		PlaybackMixerElem "HP"
+		PlaybackVolume "HP Playback Volume"
 	}
 }
diff --git a/ucm2/codecs/rt5640/HeadsetMic.conf b/ucm2/codecs/rt5640/HeadsetMic.conf
index 829e4e6..8479672 100644
--- a/ucm2/codecs/rt5640/HeadsetMic.conf
+++ b/ucm2/codecs/rt5640/HeadsetMic.conf
@@ -41,5 +41,7 @@ SectionDevice."Headset" {
 		CapturePriority 200
 		CapturePCM "hw:${CardId}"
 		JackControl "Headset Mic Jack"
+		CaptureMixerElem "IN2 Boost"
+		CaptureVolume "IN2 Boost"
 	}
 }
diff --git a/ucm2/codecs/rt5640/IN1-InternalMic.conf b/ucm2/codecs/rt5640/IN1-InternalMic.conf
index d7c419e..a317388 100644
--- a/ucm2/codecs/rt5640/IN1-InternalMic.conf
+++ b/ucm2/codecs/rt5640/IN1-InternalMic.conf
@@ -32,5 +32,7 @@ SectionDevice."Mic" {
 	Value {
 		CapturePriority 100
 		CapturePCM "hw:${CardId}"
+		CaptureMixerElem "IN1 Boost"
+		CaptureVolume "IN1 Boost"
 	}
 }
diff --git a/ucm2/codecs/rt5640/IN3-InternalMic.conf b/ucm2/codecs/rt5640/IN3-InternalMic.conf
index 3e330e6..ef4eaba 100644
--- a/ucm2/codecs/rt5640/IN3-InternalMic.conf
+++ b/ucm2/codecs/rt5640/IN3-InternalMic.conf
@@ -32,5 +32,7 @@ SectionDevice."Mic" {
 	Value {
 		CapturePriority 100
 		CapturePCM "hw:${CardId}"
+		CaptureMixerElem "IN3 Boost"
+		CaptureVolume "IN3 Boost"
 	}
 }
diff --git a/ucm2/codecs/rt5640/MonoSpeaker.conf b/ucm2/codecs/rt5640/MonoSpeaker.conf
index 654edc3..3cbeafd 100644
--- a/ucm2/codecs/rt5640/MonoSpeaker.conf
+++ b/ucm2/codecs/rt5640/MonoSpeaker.conf
@@ -29,5 +29,7 @@ SectionDevice."Speaker" {
 	Value {
 		PlaybackPriority 100
 		PlaybackPCM "hw:${CardId}"
+		PlaybackMixerElem "Speaker"
+		PlaybackVolume "Speaker Playback Volume"
 	}
 }
diff --git a/ucm2/codecs/rt5640/Speaker.conf b/ucm2/codecs/rt5640/Speaker.conf
index 3264cc3..0924f9c 100644
--- a/ucm2/codecs/rt5640/Speaker.conf
+++ b/ucm2/codecs/rt5640/Speaker.conf
@@ -29,5 +29,7 @@ SectionDevice."Speaker" {
 	Value {
 		PlaybackPriority 100
 		PlaybackPCM "hw:${CardId}"
+		PlaybackMixerElem "Speaker"
+		PlaybackVolume "Speaker Playback Volume"
 	}
 }
-- 
2.30.1

