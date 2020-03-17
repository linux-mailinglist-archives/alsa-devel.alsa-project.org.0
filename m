Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C1C188279
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 12:49:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AFD371835;
	Tue, 17 Mar 2020 12:48:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AFD371835
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584445745;
	bh=/AuNKfHM3WRjAJxU2nbXNxfzwrwTmVwndGDqUiOXDOQ=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XKpemL00dh+0lkGzRBQlkwd6D23IRiqK0plqzRpYg732g6eHpZq5pLOALmZo1VfOG
	 0tLgGTa3OfDuUaWQCJdXCo2AI0XQC9dKrnoWl08mWh1IULRhtvem/ESuOXMwzKM69A
	 HcKo+4GpKaED339JF5sQStIeYIcv4qRQG/YJdRe4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 63D44F80058;
	Tue, 17 Mar 2020 12:47:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7A85CF8022B; Tue, 17 Mar 2020 12:45:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ADBC3F80058
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 12:45:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ADBC3F80058
IronPort-SDR: kbw9HjrCUjWbds45nHL95cFt2FYEahnFWYOAS1l8IQlupcl1yCtiX+N365g0m6Sdsgpe+b2fUM
 x3f1DwVXiSjA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 04:45:48 -0700
IronPort-SDR: rkyaa6NNDksWzlgs6Lm8SU9IARjUra4+yW45yHzLwhINZeJkfL2Nd/4nXoMTxnBkoSACXgfQyB
 K/Km5JnyHf4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; d="scan'208";a="443729573"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga005.fm.intel.com with ESMTP; 17 Mar 2020 04:45:47 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v3] ucm2: hdadsp: add basic ucm config
Date: Tue, 17 Mar 2020 12:46:07 +0100
Message-Id: <20200317114607.30746-1-mateusz.gorski@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: cezary.rojewski@intel.com, Mateusz Gorski <mateusz.gorski@linux.intel.com>,
 tiwai@suse.com
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

Basic UCM configuration for Intel Skylake SST with HDA DSP generic
machine driver enabling codec playback and capture on both HDA codec
and DMIC ports.

Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
---

Changes in v3:
- fixed error found by UCM Validator
- added volume controls for Speaker and Headphones devices
- removed ValueDefaults section since stereo is the default option
  anyway

 ucm2/hdadsp/Hdmi1.conf  | 24 +++++++++++
 ucm2/hdadsp/Hdmi2.conf  | 24 +++++++++++
 ucm2/hdadsp/HiFi.conf   | 96 +++++++++++++++++++++++++++++++++++++++++
 ucm2/hdadsp/hdadsp.conf | 16 +++++++
 4 files changed, 160 insertions(+)
 create mode 100644 ucm2/hdadsp/Hdmi1.conf
 create mode 100644 ucm2/hdadsp/Hdmi2.conf
 create mode 100644 ucm2/hdadsp/HiFi.conf
 create mode 100644 ucm2/hdadsp/hdadsp.conf

diff --git a/ucm2/hdadsp/Hdmi1.conf b/ucm2/hdadsp/Hdmi1.conf
new file mode 100644
index 0000000..d402dab
--- /dev/null
+++ b/ucm2/hdadsp/Hdmi1.conf
@@ -0,0 +1,24 @@
+# Usecase for device HDMI1/Display Port stereo playback on Intel cAVS platforms
+# For Audio in HDA mode
+
+SectionDevice."HDMI1" {
+        Comment "HDMI/Display Port 1 Stereo"
+
+        Value {
+                PlaybackPriority 300
+                PlaybackPCM "hw:${CardId},10"
+                If.1 {
+                        Condition {
+                                Type ControlExists
+                                Control "iface=CARD,name='HDMI/DP,pcm=17 Jack'"
+                        }
+                        True {
+                                JackControl "HDMI/DP,pcm=17 Jack"
+                        }
+                        False {
+                                JackControl "HDMI/DP, pcm=17 Jack"
+                        }
+                }
+        }
+}
+
diff --git a/ucm2/hdadsp/Hdmi2.conf b/ucm2/hdadsp/Hdmi2.conf
new file mode 100644
index 0000000..153bbe1
--- /dev/null
+++ b/ucm2/hdadsp/Hdmi2.conf
@@ -0,0 +1,24 @@
+# Usecase for device HDMI2/Display Port stereo playback on Intel cAVS platforms
+# For Audio in HDA mode
+
+SectionDevice."HDMI2" {
+        Comment "HDMI/Display Port 2 Stereo"
+
+        Value {
+                PlaybackPriority 400
+                PlaybackPCM "hw:${CardId},11"
+                If.1 {
+                        Condition {
+                                Type ControlExists
+                                Control "iface=CARD,name='HDMI/DP,pcm=18 Jack'"
+                        }
+                        True {
+                                JackControl "HDMI/DP,pcm=18 Jack"
+                        }
+                        False {
+                                JackControl "HDMI/DP, pcm=18 Jack"
+                        }
+                }
+        }
+}
+
diff --git a/ucm2/hdadsp/HiFi.conf b/ucm2/hdadsp/HiFi.conf
new file mode 100644
index 0000000..e90ba32
--- /dev/null
+++ b/ucm2/hdadsp/HiFi.conf
@@ -0,0 +1,96 @@
+# Usecase for stereo playback Speaker and Headset, Recording on DMIC and Headset MIC.
+# For Audio in HDA mode on Intel cAVS platforms
+
+SectionVerb {
+
+	EnableSequence [
+		cset "name='mch_cap_out mo mch_cap_in mi Switch' 1"
+	]
+
+	Value {
+		TQ "HiFi"
+	}
+}
+
+SectionDevice."Headphones" {
+	Comment "Headphones"
+
+	ConflictingDevice [
+		"Speaker"
+	]
+
+	EnableSequence [
+		cset "name='Headphone Playback Switch' 1,1"
+		cset "name='Speaker Playback Switch' 0,0"
+	]
+
+	Value {
+		PlaybackPriority 200
+		PlaybackPCM "hw:${CardId},7"
+		PlaybackMixerElem "Headphone"
+		PlaybackMasterElem "Master"
+		PlaybackVolume "Headphone Playback Volume"
+		PlaybackSwitch "Headphone Playback Switch"
+		JackControl "Front Headphone Jack"
+		JackHWMute "Speaker"
+	}
+}
+
+SectionDevice."Speaker" {
+	Comment "Speaker"
+
+	ConflictingDevice [
+		"Headphones"
+	]
+
+	EnableSequence [
+		cset "name='Headphone Playback Switch' 0,0"
+		cset "name='Speaker Playback Switch' 1,1"
+	]
+
+	Value {
+		PlaybackPriority 100
+		PlaybackPCM "hw:${CardId},7"
+		PlaybackMixerElem "Speaker"
+		PlaybackMasterElem "Master"
+		PlaybackVolume "Speaker Playback Volume"
+		PlaybackSwitch "Speaker Playback Switch"
+	}
+}
+
+SectionDevice."Headset" {
+	Comment "Headset Microphone"
+
+	ConflictingDevice [
+		"Mic"
+	]
+
+	EnableSequence [
+		cset "name='media0_out mo codec0_in mi Switch' 1"
+	]
+
+	Value {
+		CapturePriority 200
+		CapturePCM "hw:${CardId},7"
+	}
+}
+
+SectionDevice."Mic" {
+	Comment "Digital Microphone"
+
+	ConflictingDevice [
+		"Headset"
+	]
+
+	EnableSequence [
+		cset "name='mch_cap_out mo mch_cap_in mi Switch' 1"
+	]
+
+	Value {
+		CapturePriority 100
+		CapturePCM "hw:${CardId},13"
+	}
+}
+
+<hdadsp/Hdmi1.conf>
+<hdadsp/Hdmi2.conf>
diff --git a/ucm2/hdadsp/hdadsp.conf b/ucm2/hdadsp/hdadsp.conf
new file mode 100644
index 0000000..48c07c8
--- /dev/null
+++ b/ucm2/hdadsp/hdadsp.conf
@@ -0,0 +1,16 @@
+# UCM for Intel CAVS platforms
+# For Audio in HDA and DMIC mode
+
+Syntax 2
+
+SectionUseCase."HiFi" {
+        File "HiFi.conf"
+        Comment "Play HiFi quality Music"
+}
+
+SectionDefaults [
+	cset "name='Master Playback Switch' 1"
+	cset "name='codec0_out mo media0_in mi Switch' 1"
+	cset "name='media0_out mo codec0_in mi Switch' 1"
+	cset "name='mch_cap_out mo mch_cap_in mi Switch' 1"
+]
-- 
2.17.1

