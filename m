Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D11F341C166
	for <lists+alsa-devel@lfdr.de>; Wed, 29 Sep 2021 11:14:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 69EDC16B8;
	Wed, 29 Sep 2021 11:13:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 69EDC16B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1632906842;
	bh=Nw1BSfUowj+8Ut6mAh9wfBGJzYZZ/J4x1Je01RWNQTM=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VCimNJahbP75Py4Z95dzOHMi4WRGc6lXAvTM+npdFwqbgNLPuVXRwzIRRX384CM6u
	 gkZQAPve9GK0VLwE5seAKC0oZjXa3TLM5Opp/9LBRz5ulYs/3PwbX2+cMUst9MxEKE
	 JvR14asvj8yCf7fi3XkKPA/1C8jFn7hWyFuo9hW4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADE26F804ED;
	Wed, 29 Sep 2021 11:12:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7E655F804EC; Wed, 29 Sep 2021 11:12:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8A6E5F8026D
 for <alsa-devel@alsa-project.org>; Wed, 29 Sep 2021 11:11:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8A6E5F8026D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="eNTTT3Hj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632906715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2vprD5cTkm2v92SpX30TeiSyM3V+bq3JIPBys4LBqco=;
 b=eNTTT3Hj2lLq5mTzG6hcQtWnCNnPTcAJnAVJPZBmOcJIwp0EABOo5ne5TeCbunE6vg9aMH
 2TtnIlkaJ0sjRpU0E1+0J7SLUflKe265NPbZqGLVtEYUid/IGnEskuGxRpoA1gnejjCglF
 TL+04E0W5NXsM1Z0ZwvjsxxkqHN7SKk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-Baun6-tNPl6j_cpLm7rXCA-1; Wed, 29 Sep 2021 05:11:53 -0400
X-MC-Unique: Baun6-tNPl6j_cpLm7rXCA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8BF1A835DE0;
 Wed, 29 Sep 2021 09:11:52 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.194.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE6CA10016F4;
 Wed, 29 Sep 2021 09:11:50 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 3/5] bytcr-rt5640: Add support for devices using
 the DMIC2 input for their internal mic(s)
Date: Wed, 29 Sep 2021 11:11:42 +0200
Message-Id: <20210929091144.4778-4-hdegoede@redhat.com>
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
Cc: Dmitry Osipenko <digetx@gmail.com>, Hans de Goede <hdegoede@redhat.com>,
 alsa-devel@alsa-project.org,
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

Add support for devices using the DMIC2 input for their internal mic(s),
this has been tested on a HP Elitepad 1000 G2.

Cc: Dmitry Osipenko <digetx@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/Tegra/rt5640/Google-Nexus-7-HiFi.conf |  3 ++-
 ucm2/bytcr-rt5640/HiFi-Components.conf     | 17 ++++++++++++++++-
 ucm2/bytcr-rt5640/HiFi-LongName.conf       |  5 ++++-
 ucm2/bytcr-rt5640/HiFi.conf                |  5 +++--
 ucm2/codecs/rt5640/DigitalMics.conf        |  1 +
 ucm2/codecs/rt5640/EnableSeq.conf          |  1 -
 6 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/ucm2/Tegra/rt5640/Google-Nexus-7-HiFi.conf b/ucm2/Tegra/rt5640/Google-Nexus-7-HiFi.conf
index 8156006..0cc5f4c 100644
--- a/ucm2/Tegra/rt5640/Google-Nexus-7-HiFi.conf
+++ b/ucm2/Tegra/rt5640/Google-Nexus-7-HiFi.conf
@@ -3,7 +3,8 @@
 Define.HaveAif "1"
 Define.HaveSpeaker "2"
 Define.HaveHeadsetMic ""
-Define.HaveInternalMic "dmic1"
+Define.HaveInternalMic "dmic"
+Define.StereoADC2Mux "DMIC1"
 
 Include.hp.File "/codecs/rt5640/HeadPhones.conf"
 Include.mspk.File "/codecs/rt5640/Speaker.conf"
diff --git a/ucm2/bytcr-rt5640/HiFi-Components.conf b/ucm2/bytcr-rt5640/HiFi-Components.conf
index 729b2b6..39c7f36 100644
--- a/ucm2/bytcr-rt5640/HiFi-Components.conf
+++ b/ucm2/bytcr-rt5640/HiFi-Components.conf
@@ -22,7 +22,22 @@ If.dmic1 {
 		Haystack "${CardComponents}"
 		Needle "cfg-mic:dmic1"
 	}
-	True.Define.HaveInternalMic "dmic1"
+	True {
+		Define.HaveInternalMic "dmic"
+		Define.StereoADC2Mux "DMIC1"
+	}
+}
+
+If.dmic2 {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "cfg-mic:dmic2"
+	}
+	True {
+		Define.HaveInternalMic "dmic"
+		Define.StereoADC2Mux "DMIC2"
+	}
 }
 
 If.in1 {
diff --git a/ucm2/bytcr-rt5640/HiFi-LongName.conf b/ucm2/bytcr-rt5640/HiFi-LongName.conf
index 7af2d4a..b2fb471 100644
--- a/ucm2/bytcr-rt5640/HiFi-LongName.conf
+++ b/ucm2/bytcr-rt5640/HiFi-LongName.conf
@@ -22,7 +22,10 @@ If.dmic1 {
 		Haystack "${CardLongName}"
 		Needle "-dmic1-mic"
 	}
-	True.Define.HaveInternalMic "dmic1"
+	True {
+		Define.HaveInternalMic "dmic"
+		Define.StereoADC2Mux "DMIC1"
+	}
 }
 
 If.in1 {
diff --git a/ucm2/bytcr-rt5640/HiFi.conf b/ucm2/bytcr-rt5640/HiFi.conf
index 08127e0..604e7d9 100644
--- a/ucm2/bytcr-rt5640/HiFi.conf
+++ b/ucm2/bytcr-rt5640/HiFi.conf
@@ -4,6 +4,7 @@ Define.HaveAif ""
 Define.HaveSpeaker ""
 Define.HaveInternalMic ""
 Define.HaveHeadsetMic "yes"
+Define.StereoADC2Mux "DMIC1"
 
 If.DefineAif1 {
 	Condition {
@@ -115,11 +116,11 @@ If.hp {
 	}
 }
 
-If.dmic1 {
+If.dmic {
 	Condition {
 		Type String
 		Haystack "${var:HaveInternalMic}"
-		Needle "dmic1"
+		Needle "dmic"
 	}
 	True {
 		Include.dmic.File "/codecs/rt5640/DigitalMics.conf"
diff --git a/ucm2/codecs/rt5640/DigitalMics.conf b/ucm2/codecs/rt5640/DigitalMics.conf
index b4d01ae..188df0a 100644
--- a/ucm2/codecs/rt5640/DigitalMics.conf
+++ b/ucm2/codecs/rt5640/DigitalMics.conf
@@ -14,6 +14,7 @@ SectionDevice."Mic" {
 	}
 
 	EnableSequence [
+		cset "name='Stereo ADC2 Mux' ${var:StereoADC2Mux}"
 		cset "name='Mono ADC MIXL ADC2 Switch' on"
 		cset "name='Mono ADC MIXR ADC2 Switch' on"
 		cset "name='Stereo ADC MIXL ADC2 Switch' on"
diff --git a/ucm2/codecs/rt5640/EnableSeq.conf b/ucm2/codecs/rt5640/EnableSeq.conf
index 4e9a6c0..d9d536c 100644
--- a/ucm2/codecs/rt5640/EnableSeq.conf
+++ b/ucm2/codecs/rt5640/EnableSeq.conf
@@ -30,7 +30,6 @@ EnableSequence [
 
 	# Input Configuration
 	cset "name='Stereo ADC1 Mux' ADC"
-	cset "name='Stereo ADC2 Mux' DMIC1"
 	cset "name='ADC Capture Switch' on"
 
 	cset "name='Mono ADC L1 Mux' ADCL"
-- 
2.31.1

