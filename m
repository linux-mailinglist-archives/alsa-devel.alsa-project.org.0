Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 346F23264DB
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Feb 2021 16:44:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C9755167C;
	Fri, 26 Feb 2021 16:43:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C9755167C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614354248;
	bh=101NkQMZCph4NpKsuUmbGeSzLdg7VzpeaZxNVPTH8CA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RrHq2x8gKrKmXJfU+teheVrSKN+to9M2g3VUkFPUkougV4Z9tXHmu7H7NPJJ5RER2
	 9btKwdyDdYnLGetH1kxGzUGoUmbwFZiFtheonsxTND2JGk9kQ98wY0PX+QfhqpW/+E
	 Vm38fWIuRAdxs2QwXCWSHLIM1vg7lluDjM5eo3oU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2BD62F80430;
	Fri, 26 Feb 2021 16:40:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 889C4F802E2; Fri, 26 Feb 2021 16:40:50 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A0AAF8028D
 for <alsa-devel@alsa-project.org>; Fri, 26 Feb 2021 16:40:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A0AAF8028D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="OFikQoHv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614354041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XK6uQjUKJi6Hk5n+Ju9baSQ/pNmY+koCgGJ6phSdOlc=;
 b=OFikQoHvQ16qqVytXg6JTTzMQylvEpjcpd9HKSxzOUGjGx0acRJdrUw5Y9eYa/PCoshjhX
 BpXYJpqB1UZh7hPGrn/Hb8QiutOcoqfgefutqKgQcJd/dDrYD4PMTUuIvx8ht6LOn1wRfs
 WHYZ4kp3WlUdJJ5Pr8Y1YNXS/wnu4XI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-ZKbW8K8FPFSdImB3_ptsKA-1; Fri, 26 Feb 2021 10:40:39 -0500
X-MC-Unique: ZKbW8K8FPFSdImB3_ptsKA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 689C21868405;
 Fri, 26 Feb 2021 15:40:38 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-36.ams2.redhat.com [10.36.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 56EAE1050E;
 Fri, 26 Feb 2021 15:40:37 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Jaroslav Kysela <perex@perex.cz>
Subject: [PATCH alsa-ucm-conf 7/8] codecs/rt5640: Use the new "aif:%d" part of
 the components string
Date: Fri, 26 Feb 2021 16:40:24 +0100
Message-Id: <20210226154025.84828-8-hdegoede@redhat.com>
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

Newer kernels add "aif:1" or "aif:2" to the components string to let
us know which AIF is being used.

Use this to mute the ADC/DAC master controls on the other AIF. Muting
these is necessary to make mute LED control work properly, because the
snd_ctl_led will only turn on the mute LED if both DAC Volume Switches
are disabled.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 ucm2/bytcr-rt5640/HiFi.conf                   | 46 +++++++++++++++++++
 ucm2/codecs/rt5640/EnableSeq-AIF-unknown.conf |  7 +++
 ucm2/codecs/rt5640/EnableSeq-AIF1.conf        |  7 +++
 ucm2/codecs/rt5640/EnableSeq-AIF2.conf        |  7 +++
 ucm2/codecs/rt5640/EnableSeq.conf             |  4 --
 5 files changed, 67 insertions(+), 4 deletions(-)
 create mode 100644 ucm2/codecs/rt5640/EnableSeq-AIF-unknown.conf
 create mode 100644 ucm2/codecs/rt5640/EnableSeq-AIF1.conf
 create mode 100644 ucm2/codecs/rt5640/EnableSeq-AIF2.conf

diff --git a/ucm2/bytcr-rt5640/HiFi.conf b/ucm2/bytcr-rt5640/HiFi.conf
index a5c05ba..39a9a2b 100644
--- a/ucm2/bytcr-rt5640/HiFi.conf
+++ b/ucm2/bytcr-rt5640/HiFi.conf
@@ -1,8 +1,54 @@
 # Use case Configuration for bytcr-rt5640
 
+Define.HaveAif ""
+Define.HaveAif1 ""
+Define.HaveAif2 ""
+
+If.DefineAif1 {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "aif:1"
+	}
+	True {
+		Define.HaveAif "yes"
+		Define.HaveAif1 "yes"
+	}
+}
+
+If.DefineAif2 {
+	Condition {
+		Type String
+		Haystack "${CardComponents}"
+		Needle "aif:2"
+	}
+	True {
+		Define.HaveAif "yes"
+		Define.HaveAif2 "yes"
+	}
+}
+
 SectionVerb {
 	Include.e.File "/codecs/rt5640/EnableSeq.conf"
 
+	If.Aif1 {
+		Condition { Type String Empty "${var:HaveAif1}" }
+		Before.EnableSequence "0"
+		False.Include.aif1.File "/codecs/rt5640/EnableSeq-AIF1.conf"
+	}
+
+	If.Aif2 {
+		Condition { Type String Empty "${var:HaveAif2}" }
+		Before.EnableSequence "0"
+		False.Include.aif1.File "/codecs/rt5640/EnableSeq-AIF2.conf"
+	}
+
+	If.AifUnknown {
+		Condition { Type String Empty "${var:HaveAif}" }
+		Before.EnableSequence "0"
+		True.Include.aif-unknown.File "/codecs/rt5640/EnableSeq-AIF-unknown.conf"
+	}
+
 	If.Controls {
 		Condition {
 			Type ControlExists
diff --git a/ucm2/codecs/rt5640/EnableSeq-AIF-unknown.conf b/ucm2/codecs/rt5640/EnableSeq-AIF-unknown.conf
new file mode 100644
index 0000000..3160d5c
--- /dev/null
+++ b/ucm2/codecs/rt5640/EnableSeq-AIF-unknown.conf
@@ -0,0 +1,7 @@
+EnableSequence [
+	# When the AIF is unknown enable audio from/to both AIFs
+	# Note kernels which do not advertise the AIF do not have a 'DAC1 Playback Switch'
+	cset "name='DAC2 Playback Switch' on"
+	cset "name='ADC Capture Switch' on"
+	cset "name='Mono ADC Capture Switch' on"
+]
diff --git a/ucm2/codecs/rt5640/EnableSeq-AIF1.conf b/ucm2/codecs/rt5640/EnableSeq-AIF1.conf
new file mode 100644
index 0000000..b31fb7b
--- /dev/null
+++ b/ucm2/codecs/rt5640/EnableSeq-AIF1.conf
@@ -0,0 +1,7 @@
+EnableSequence [
+	cset "name='DAC1 Playback Switch' on"
+	cset "name='ADC Capture Switch' on"
+	# When AIF1 is used, mute the AIF2 ADC/DAC master control
+	cset "name='DAC2 Playback Switch' off"
+	cset "name='Mono ADC Capture Switch' off"
+]
diff --git a/ucm2/codecs/rt5640/EnableSeq-AIF2.conf b/ucm2/codecs/rt5640/EnableSeq-AIF2.conf
new file mode 100644
index 0000000..a1d4d68
--- /dev/null
+++ b/ucm2/codecs/rt5640/EnableSeq-AIF2.conf
@@ -0,0 +1,7 @@
+EnableSequence [
+	cset "name='DAC2 Playback Switch' on"
+	cset "name='Mono ADC Capture Switch' on"
+	# When AIF2 is used, mute the AIF1 ADC/DAC master control
+	cset "name='DAC1 Playback Switch' off"
+	cset "name='ADC Capture Switch' off"
+]
diff --git a/ucm2/codecs/rt5640/EnableSeq.conf b/ucm2/codecs/rt5640/EnableSeq.conf
index 8b30153..572d1a2 100644
--- a/ucm2/codecs/rt5640/EnableSeq.conf
+++ b/ucm2/codecs/rt5640/EnableSeq.conf
@@ -26,18 +26,14 @@ EnableSequence [
 	#cset "name='SDI select' 1"
 	#cset "name='DAI select' 1"
 
-	cset "name='DAC2 Playback Switch' on"
-
 	# Input Configuration
 	cset "name='Stereo ADC1 Mux' ADC"
 	cset "name='Stereo ADC2 Mux' DMIC1"
-	cset "name='ADC Capture Switch' on"
 
 	cset "name='Mono ADC L1 Mux' ADCL"
 	cset "name='Mono ADC R1 Mux' ADCR"
 	cset "name='Mono ADC L2 Mux' DMIC L1"
 	cset "name='Mono ADC R2 Mux' DMIC R1"
-	cset "name='Mono ADC Capture Switch' on"
 
 	# 47=0dB, 0.375 dB/step, set it to 9 dB to help with soft mics
 	cset "name='ADC Capture Volume' 71"
-- 
2.30.1

