Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 904F918458F
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 12:06:08 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1F2D017D1;
	Fri, 13 Mar 2020 12:05:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1F2D017D1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584097568;
	bh=oqR+a4Zar014tDeUuvEknhmH6oFRqezKR5v08VvoJaU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=n1eUC3yfWTlTmu8fks2q05RwNgDInfSAuYQPDpOdGogOMUuYrXRT6e83QBIljh0WV
	 1VmYiVGBEwOyAmaQIhLciiQ2ML/k82ZxPkoPRMZ1Fsr8TKmukzWzDdxp180u7Jgrpo
	 R9LvmCGR0E6iS9zR5qc498dSPFvC22v9+gVDMvnU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3DFC4F80276;
	Fri, 13 Mar 2020 12:03:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AD73CF801F8; Fri, 13 Mar 2020 12:02:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 149C8F801A3
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 12:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 149C8F801A3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 04:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,548,1574150400"; d="scan'208";a="236926386"
Received: from mgorski-all-series.igk.intel.com ([10.237.149.201])
 by fmsmga008.fm.intel.com with ESMTP; 13 Mar 2020 04:00:05 -0700
From: Mateusz Gorski <mateusz.gorski@linux.intel.com>
To: alsa-devel@alsa-project.org
Subject: [PATCH v2] ucm2: hdadsp: add basic ucm config
Date: Fri, 13 Mar 2020 12:00:18 +0100
Message-Id: <20200313110018.5145-1-mateusz.gorski@linux.intel.com>
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

Basic UCM configuration for Intel Skylake SST HDA DSP generic machine
driver enabling codec playback and capture on both HDA codec and DMIC 
ports.

Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
---

Changes in v2:
- addressed Jaroslav hints about v1 patch
- added HiFi and Hdmi use cases
- adjusted to ucm2 syntax

 ucm2/hdadsp/Hdmi1.conf  | 24 +++++++++++
 ucm2/hdadsp/Hdmi2.conf  | 24 +++++++++++
 ucm2/hdadsp/HiFi.conf   | 88 +++++++++++++++++++++++++++++++++++++++++
 ucm2/hdadsp/hdadsp.conf | 21 ++++++++++
 4 files changed, 157 insertions(+)
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
index 0000000..fe025de
--- /dev/null
+++ b/ucm2/hdadsp/HiFi.conf
@@ -0,0 +1,88 @@
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
+	Value [
+		PlaybackPriority 200
+		PlaybackPCM "hw:${CardId},7"
+		JackControl "Front Headphone Jack"
+		JackHWMute "Speaker"
+	]
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
index 0000000..a90299f
--- /dev/null
+++ b/ucm2/hdadsp/hdadsp.conf
@@ -0,0 +1,21 @@
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
+ValueDefaults {
+        PlaybackChannels "2"
+        CaptureChannels "2"
+}
+
+SectionDefaults [
+	cset "name='Master Playback Switch' 1"
+        cset "name='codec0_out mo media0_in mi Switch' 1"
+        cset "name='media0_out mo codec0_in mi Switch' 1"
+	cset "name='mch_cap_out mo mch_cap_in mi Switch' 1"
+]
-- 
2.17.1

