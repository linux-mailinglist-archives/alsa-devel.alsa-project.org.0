Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 554FB17A6A4
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:47:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E41AA1666;
	Thu,  5 Mar 2020 14:46:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E41AA1666
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583416043;
	bh=L9cAAeP4cp7Nm6mnA9f3Ni9dgYKI8CBCqYZ3lxTc1dk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=G5aNbc4LOfBECFtXej8nwQfBDSM13+aKQ+2nkiDF+MAyHOTOPOvj0QuAgAx5UUiHA
	 tMn++oiCedaSDHe1oD8f59StiUy0L2h8Y7rPxmE4zB0OJCNWxwBKZ7eYU2rn88mLv3
	 zoq9IQtYqWGVuIW5PFVuIaVEvZQtvfzFDBw+akc8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EE46CF8028D;
	Thu,  5 Mar 2020 14:44:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 16E7EF8027B; Thu,  5 Mar 2020 14:44:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4764F80271
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:44:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4764F80271
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LFPBXZrN"
Received: by mail-wr1-x432.google.com with SMTP id n7so7053919wrt.11
 for <alsa-devel@alsa-project.org>; Thu, 05 Mar 2020 05:44:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3mtYQ2g0Fwnc43AgEkYTiZNvX6sckY67GLcRYXE9tg8=;
 b=LFPBXZrNhYnmPvWAg8AAsNmViD7SvtUABwKX33aEiJew9ip6Piqyw7vSm042p1M575
 HHdeDc7EL7ygVbK2+u51x3SFw2DeZRbHSbW5ATRvD3QsxuWy1CwtgHhy3Su1qi85P1XG
 X+GUMz/VyNVX4RUkx6NUgEcNs5gXkfW5kcX385tGFXT0YpPcgFHdGmEY2WZyKNo8tQ6W
 RZvd1+vB5NLk5g1NKdXXruYw84mup0tXZp2Rz540b9DBj2a+oOsUbj8JcxHQdabFJ7LF
 1ivhhDHQlU+Vw+8/L+Hd/8PLJyH6hrr/RZPIA3UOS9a7AHFSamJoWnyZtToImz7zK4eT
 2QjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3mtYQ2g0Fwnc43AgEkYTiZNvX6sckY67GLcRYXE9tg8=;
 b=PT3tbBrQF8sPlYOM9h1KRu+hNkGxFju2608yI/d6t3ISs1af8RKBEcw8kzDMY7mYqL
 4Xjoa+SRmmMogzn+QbO9med20ZHhoF46n2g9/Yb1VEq5uSfkpm9yfczfk8D59mO5XGjb
 Ex6QlRsNGTpoztpdmxBp6oAUcrWhYvph8WlQctbb8sa2DB7qqvR8WkN/NyngsT3w0ls7
 ACslK8hnqiCo2XWmb6PrWqVubRCMjrhvQMgzViTVGnB2Q0UCGPb7+5aDGwFF3gVjmdRq
 qNyUf+5DxaTn/9dyEukeLjR1jyhmD/d2zuJoJeJpNOOr6rWFt1bLDSMnY3Wwb5E+AUDl
 3JIw==
X-Gm-Message-State: ANhLgQ3UAMXjg0Jl1Q8kxHUEN6O5aKiR0BjBjihLld9rtc8cIQqbIuLA
 WNwK9Nge6HAVVHhxoR99Y9E0bA==
X-Google-Smtp-Source: ADFU+vt7T3Yw7yXFICb89dEAPJht12+DUg4qe9Mb5GR5JTE+VVLO/UTTRDuy/awP5YoDHzVJSayeyg==
X-Received: by 2002:a5d:534c:: with SMTP id t12mr11002558wrv.105.1583415876233; 
 Thu, 05 Mar 2020 05:44:36 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id o9sm46425385wrw.20.2020.03.05.05.44.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:44:35 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: perex@perex.cz
Subject: [PATCH 3/4] ucm2: DB845c: Add ucm for DB845c board
Date: Thu,  5 Mar 2020 13:44:03 +0000
Message-Id: <20200305134404.7690-4-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200305134404.7690-1-srinivas.kandagatla@linaro.org>
References: <20200305134404.7690-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
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

DB845c board by default has two WSA881x speakers and HDMI
audio connections.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 ucm2/DB845c/DB845c.conf | 11 ++++++++++
 ucm2/DB845c/HDMI.conf   | 33 +++++++++++++++++++++++++++++
 ucm2/DB845c/HiFi.conf   | 46 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 ucm2/DB845c/DB845c.conf
 create mode 100644 ucm2/DB845c/HDMI.conf
 create mode 100644 ucm2/DB845c/HiFi.conf

diff --git a/ucm2/DB845c/DB845c.conf b/ucm2/DB845c/DB845c.conf
new file mode 100644
index 0000000..bfd1ee5
--- /dev/null
+++ b/ucm2/DB845c/DB845c.conf
@@ -0,0 +1,11 @@
+Syntax 2
+
+SectionUseCase."HiFi" {
+	File "HiFi.conf"
+	Comment "HiFi quality Music."
+}
+
+SectionUseCase."HDMI" {
+	File "HDMI.conf"
+	Comment "HDMI output."
+}
diff --git a/ucm2/DB845c/HDMI.conf b/ucm2/DB845c/HDMI.conf
new file mode 100644
index 0000000..0a17f68
--- /dev/null
+++ b/ucm2/DB845c/HDMI.conf
@@ -0,0 +1,33 @@
+# Use case configuration for DB845c board.
+# Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+SectionVerb {
+        EnableSequence [
+		cdev "hw:DB845c"
+		cset "name='QUAT_MI2S_RX Audio Mixer MultiMedia1' 1"
+        ]
+
+        DisableSequence [
+		cdev "hw:DB845c"
+		cset "name='QUAT_MI2S_RX Audio Mixer MultiMedia1' 0"
+	]
+       Value {
+                TQ "HiFi"
+                PlaybackPCM "hw:DB845c,0"
+        }
+}
+
+SectionDevice."HDMI-stereo" {
+        #Name "HDMI-stereo"
+        Comment "HDMI Digital Stereo Output"
+
+        EnableSequence [
+        ]
+
+        DisableSequence [
+        ]
+
+        Value {
+                PlaybackChannels "2"
+        }
+}
diff --git a/ucm2/DB845c/HiFi.conf b/ucm2/DB845c/HiFi.conf
new file mode 100644
index 0000000..a169bfd
--- /dev/null
+++ b/ucm2/DB845c/HiFi.conf
@@ -0,0 +1,46 @@
+# Use case configuration for DB845c.
+# Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+SectionVerb {
+
+	EnableSequence [
+		cdev "hw:DB845c"
+		cset "name='SLIMBUS_0_RX Audio Mixer MultiMedia2' 1"
+
+		<codecs/wcd934x/DefaultEnableSeq.conf>
+		<codecs/wsa881x/DefaultEnableSeq.conf>
+	]
+
+	DisableSequence [
+                cdev "hw:DB845c"
+		<codecs/wcd934x/DefaultDisableSeq.conf>
+		cset "name='SLIMBUS_0_RX Audio Mixer MultiMedia2' 0"
+	]
+
+	Value {
+		TQ "HiFi"
+	}
+}
+
+SectionDevice."Speakers" {
+	Comment "Speakers playback"
+
+	EnableSequence [
+		cdev "hw:DB845c"
+		<codecs/wcd934x/SpeakerEnableSeq.conf>
+		<codecs/wsa881x/SpeakerEnableSeq.conf>
+	]
+
+	DisableSequence [
+		cdev "hw:DB845c"
+		<codecs/wsa881x/SpeakerDisableSeq.conf>
+		<codecs/wcd934x/SpeakerDisableSeq.conf>
+	]
+
+	Value {
+		PlaybackPCM "hw:DB845c,1"
+		PlaybackChannels "2"
+                PlaybackVolume "RX1 Digital Volume"
+                PlaybackVolume "RX2 Digital Volume"
+	}
+}
-- 
2.21.0

