Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C2141C16A
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 11:15:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 387C216A6;
	Wed, 29 Sep 2021 11:14:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 387C216A6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632906906;
	bh=HGS3YFWpHSuhjtTgyPFOkFF3LGuROor0KZjtcd37nkQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XupxbLS1uE8EAOLy8fjlwdfcMaumwqvV2ggWWb8tMgq9QUMSwJobWOaXhsA3Rd/Na
	 dnYE7C8wgFGQ7JdNA/eJ4mtfUOSl9uLOltvjtuldAEmgWu8IIg5TludndsbnbvmKAl
	 MZ/EI/imrUhc/oKBjbD+OpOn9eikl4mrvpQ0I0Zs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A5C2F80507;
	Wed, 29 Sep 2021 11:12:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8955BF804FB; Wed, 29 Sep 2021 11:12:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0326FF801F7
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 11:12:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0326FF801F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="TA4Z2pJD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632906718;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q5oy8hxiFubYnv6e5sRdew79DAEht5I2ckhI7wo9x0Y=;
 b=TA4Z2pJDUvD56ER9xXgrudZrB36MN+Borv7wr8Of5G3Yor2DAMg3J4LL5QPsnSZaf9VhhV
 q/D4E5qSit/TIL/PYP01EcjB7NzWhrgy2nRAvnJJw5WOvsNi7nIVhnAVkYLDMOG82S0LWq
 JY/44qAjHEcZCZu2/i6JWJmPE6QiR4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-494-u9TjTN9CPnG5m_nc-AGaoA-1; Wed, 29 Sep 2021 05:11:56 -0400
X-MC-Unique: u9TjTN9CPnG5m_nc-AGaoA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81AA619057A2;
 Wed, 29 Sep 2021 09:11:55 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 710F5100164A;
 Wed, 29 Sep 2021 09:11:54 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 5/5] bytcr-rt5640: Add support for a second
 headset input
Date: Wed, 29 Sep 2021 11:11:44 +0200
Message-Id: <20210929091144.4778-6-hdegoede@redhat.com>
In-Reply-To: <20210929091144.4778-1-hdegoede@redhat.com>
References: <20210929091144.4778-1-hdegoede@redhat.com>
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

Some devices (HP Elitepad 1000 G2) have a second headphones output
(1 on the dock, 2nd on the tablet itself) the headset mic input of
this second headset is connected to IN1, add support for this.

BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=213415
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/bytcr-rt5640/HiFi-Components.conf  |  9 +++++
 ucm2/bytcr-rt5640/HiFi.conf             | 22 +++++++++++
 ucm2/codecs/rt5640/HeadsetMic2-IN1.conf | 52 +++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 ucm2/codecs/rt5640/HeadsetMic2-IN1.conf

diff --git a/ucm2/bytcr-rt5640/HiFi-Components.conf b/ucm2/bytcr-rt5640/HiFi-Components.conf
index 3f941ac..ae5fd05 100644
--- a/ucm2/bytcr-rt5640/HiFi-Components.conf
+++ b/ucm2/bytcr-rt5640/HiFi-Components.conf
@@ -66,3 +66,12 @@ If.in3 {
 	}
 	True.Define.HaveInternalMic "in3"
 }
+
+If.hs2 {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-hs2:in1"
+	}
+	True.Define.HaveHeadsetMic2 "in1"
+}
diff --git a/ucm2/bytcr-rt5640/HiFi.conf b/ucm2/bytcr-rt5640/HiFi.conf
index 2e099bd..f758507 100644
--- a/ucm2/bytcr-rt5640/HiFi.conf
+++ b/ucm2/bytcr-rt5640/HiFi.conf
@@ -5,6 +5,7 @@ Define.HaveSpeaker ""
 Define.HaveHeadPhones2 ""
 Define.HaveInternalMic ""
 Define.HaveHeadsetMic "yes"
+Define.HaveHeadsetMic2 ""
 Define.StereoADC2Mux "DMIC1"
 
 If.DefineAif1 {
@@ -213,3 +214,24 @@ If.hsmic {
 		}
 	}
 }
+
+If.hsmic2 {
+	Condition {
+		Type String
+		Haystack "${var:HaveHeadsetMic2}"
+		Needle "in1"
+	}
+	True {
+		Include.hsmic.File "/codecs/rt5640/HeadsetMic2-IN1.conf"
+
+		SectionDevice."Headset2" {
+			EnableSequence [
+				cset "name='Headset Mic 2 Switch' on"
+			]
+
+			DisableSequence [
+				cset "name='Headset Mic 2 Switch' off"
+			]
+		}
+	}
+}
diff --git a/ucm2/codecs/rt5640/HeadsetMic2-IN1.conf b/ucm2/codecs/rt5640/HeadsetMic2-IN1.conf
new file mode 100644
index 0000000..ff05f82
--- /dev/null
+++ b/ucm2/codecs/rt5640/HeadsetMic2-IN1.conf
@@ -0,0 +1,52 @@
+SectionDevice."Headset2" {
+	Comment "Headset Microphone 2"
+
+	ConflictingDevice [
+		"Mic"
+		"Headset"
+	]
+
+	EnableSequence [
+		cset "name='RECMIXL BST1 Switch' on"
+		cset "name='RECMIXR BST1 Switch' on"
+
+		cset "name='Stereo ADC MIXL ADC1 Switch' on"
+		cset "name='Stereo ADC MIXR ADC1 Switch' on"
+		cset "name='Mono ADC MIXL ADC1 Switch' on"
+		cset "name='Mono ADC MIXR ADC1 Switch' on"
+	]
+
+	DisableSequence [
+		cset "name='Stereo ADC MIXL ADC1 Switch' off"
+		cset "name='Stereo ADC MIXR ADC1 Switch' off"
+		cset "name='Mono ADC MIXL ADC1 Switch' off"
+		cset "name='Mono ADC MIXR ADC1 Switch' off"
+
+		cset "name='RECMIXL BST1 Switch' off"
+		cset "name='RECMIXR BST1 Switch' off"
+	]
+
+	Value {
+		CapturePriority 300
+		CapturePCM "hw:${CardId}"
+		JackControl "Headset Mic 2 Jack"
+		CaptureMixerElem "IN1 Boost"
+		CaptureVolume "IN1 Boost"
+		If.In1Aif1 {
+			Condition {
+				Type String
+				String1 "${var:HaveAif}"
+				String2 "1"
+			}
+			True.CaptureMasterElem "ADC"
+		}
+		If.In1Aif2 {
+			Condition {
+				Type String
+				String1 "${var:HaveAif}"
+				String2 "2"
+			}
+			True.CaptureMasterElem "Mono ADC"
+		}
+	}
+}
-- 
2.31.1

