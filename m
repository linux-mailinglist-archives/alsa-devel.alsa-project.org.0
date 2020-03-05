Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9EC17A6AA
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:48:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F0B531667;
	Thu,  5 Mar 2020 14:47:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F0B531667
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583416125;
	bh=UOt1H8NP5MaSY+gRxkB1SPaLZLOOSX8oIjCqzzxqi2I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=h2UHYufJ0CsK3hwyEnFbtEbOElEo21o/05X3ykY1AUFy/paJkKvgY+lfHZQSLhwsk
	 F9T8oRiMeIWVXkS86FJH302nJji6RGbbK0EhmuPY8OfshaIT0baYqqdRgfiR0o/5Oa
	 7ph7Qx9lgIFEp06yKgpNWHR7HbQwn8XPJq4eAxP4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4E99EF802A7;
	Thu,  5 Mar 2020 14:45:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5E718F802A2; Thu,  5 Mar 2020 14:45:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F586F80279
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:44:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F586F80279
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="XXe9aI7p"
Received: by mail-wr1-x42c.google.com with SMTP id n15so1742746wrw.13
 for <alsa-devel@alsa-project.org>; Thu, 05 Mar 2020 05:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=of+4vsKlSC3WMQUMuhHUy8sKmlS/zCzuvWW0knTqyT8=;
 b=XXe9aI7ptbSO+7djeLIawTYhBi42YFggkfumbSiHXdQRRyXt0gyuOPDyxFDlSw5Pp1
 OV1aZ4HbYxw+IWfMz653doAl9mMg9Ww5uJPFn+M0mUBHOVlw7HgEtkzpU1zfURY2qR17
 UngKpLJoxhqXG0YWTAQkkHdPQ2HAHfCUrfj8m/yPo63avlkBpifdpTZ9xGGO+v2VOgKW
 UASw5XDVcfBMjYmHBa6REnmFcXtXyIm8PRrNIuYA6Ga15qnc6eXvHinHcEChhS439cQQ
 VcNjeyUcQZDQ5rk9/7JVn9PoqqQXPOi9L80m/on33RB8AnJyrfkqwRQ7BGoAXy0Iag9W
 C0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=of+4vsKlSC3WMQUMuhHUy8sKmlS/zCzuvWW0knTqyT8=;
 b=VqtK7SzR6hD5vB/Uwseg/tc62A0CKfe2kPHgdiMgZVURanTtOfS7f52AfDqBKAo1yY
 2bCEVsOmx4i77iQ5zH2wxCxNlYyci3U+mZwH7JZKAfcQ9Vs64FprECayrfGotuWHgMRQ
 5Q4kFGsrbPdt7+udnPSytRTCLZhN94kB467x1OX13Jz3dteM3HzUi4CTpBsnkMjq7vHB
 Pk8NzSustdVBOP82Y8o6wpkTLFUP3mUJv2aXHGLRowTnszC1m2tF04Z8xZjUYFhbm63h
 +1B3c3P5M4hGK59fbWBetsw7VaOLMxJyFBPZyt0HpXpR8yGvh0sViAoca9N5cg45zWyu
 J7GA==
X-Gm-Message-State: ANhLgQ1IdKFIuen9zoCvY4/w5QhaAdvcqMmZbEOD1phsrv5/dmT932L6
 B6+iVj10dBdNUD31ggSReNSE8g==
X-Google-Smtp-Source: ADFU+vs6VRfk4TRx90SLc4pDewsuplLBJ5mvgzuzT7Bz0mt/SBhqj3eIiKoq53mIImFBidKDp4trKQ==
X-Received: by 2002:a05:6000:1046:: with SMTP id
 c6mr10219033wrx.411.1583415877370; 
 Thu, 05 Mar 2020 05:44:37 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id o9sm46425385wrw.20.2020.03.05.05.44.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:44:36 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: perex@perex.cz
Subject: [PATCH 4/4] ucm2: Add ucm for Lenovo-YOGA-C630-13Q50 laptop
Date: Thu,  5 Mar 2020 13:44:04 +0000
Message-Id: <20200305134404.7690-5-srinivas.kandagatla@linaro.org>
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

This laptop has by 2 WSA Smart speakers over Soundwire and 3.5mm
headset audio connection.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 ucm2/Lenovo-YOGA-C630-13Q50/HiFi.conf         | 98 +++++++++++++++++++
 .../Lenovo-YOGA-C630-13Q50.conf               |  6 ++
 2 files changed, 104 insertions(+)
 create mode 100644 ucm2/Lenovo-YOGA-C630-13Q50/HiFi.conf
 create mode 100644 ucm2/Lenovo-YOGA-C630-13Q50/Lenovo-YOGA-C630-13Q50.conf

diff --git a/ucm2/Lenovo-YOGA-C630-13Q50/HiFi.conf b/ucm2/Lenovo-YOGA-C630-13Q50/HiFi.conf
new file mode 100644
index 0000000..bc4f914
--- /dev/null
+++ b/ucm2/Lenovo-YOGA-C630-13Q50/HiFi.conf
@@ -0,0 +1,98 @@
+# Use case configuration for LenovoYOGAC6301.
+# Author: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+SectionVerb {
+
+	EnableSequence [
+		cdev "hw:LenovoYOGAC6301"
+		cset "name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 1"
+		cset "name='MultiMedia2 Mixer SLIMBUS_0_TX' 1"
+
+		<codecs/wcd934x/DefaultEnableSeq.conf>
+		<codecs/wsa881x/DefaultEnableSeq.conf>
+	]
+
+	DisableSequence [
+                cdev "hw:LenovoYOGAC6301"
+		<codecs/wcd934x/DefaultDisableSeq.conf>
+		cset "name='SLIMBUS_0_RX Audio Mixer MultiMedia1' 0"
+		cset "name='MultiMedia2 Mixer SLIMBUS_0_TX' 0"
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
+	ConflictingDevice [
+		"HeadPhones"
+	]
+
+
+	EnableSequence [
+		cdev "hw:LenovoYOGAC6301"
+		<codecs/wcd934x/SpeakerEnableSeq.conf>
+		<codecs/wsa881x/SpeakerEnableSeq.conf>
+	]
+
+	DisableSequence [
+		cdev "hw:LenovoYOGAC6301"
+		<codecs/wsa881x/SpeakerDisableSeq.conf>
+		<codecs/wcd934x/SpeakerDisableSeq.conf>
+	]
+
+	Value {
+		PlaybackPCM "hw:LenovoYOGAC6301,0"
+		PlaybackChannels "2"
+                PlaybackVolume "RX1 Digital Volume"
+                PlaybackVolume "RX2 Digital Volume"
+	}
+}
+
+SectionDevice."HeadPhones" {
+	Comment "HeadPhones playback"
+
+	ConflictingDevice [
+		"Speakers"
+	]
+
+	EnableSequence [
+		cdev "hw:LenovoYOGAC6301"
+		<codecs/wcd934x/HeadphoneEnableSeq.conf>
+	]
+
+	DisableSequence [
+		cdev "hw:LenovoYOGAC6301"
+		<codecs/wcd934x/HeadphoneDisableSeq.conf>
+	]
+
+	Value {
+		PlaybackPCM "hw:LenovoYOGAC6301,0"
+		PlaybackChannels "2"
+                PlaybackVolume "RX1 Digital Volume"
+                PlaybackVolume "RX2 Digital Volume"
+	}
+}
+
+SectionDevice."HeadPhonesMic" {
+	Comment "HeadPhones Mic"
+
+	EnableSequence [
+		<codecs/wcd934x/HeadphoneMicEnableSeq.conf>
+	]
+
+	DisableSequence [
+		<codecs/wcd934x/HeadphoneMicDisableSeq.conf>
+		cset "name='AMIC MUX0' ZERO"
+                cset "name='ADC2 Volume' 0"
+	]
+	
+	Value {
+		CapturePCM "hw:LenovoYOGAC6301,1"
+		CaptureChannels "2"
+		CaptureVolume "ADC2 Volume"
+	}
+}
diff --git a/ucm2/Lenovo-YOGA-C630-13Q50/Lenovo-YOGA-C630-13Q50.conf b/ucm2/Lenovo-YOGA-C630-13Q50/Lenovo-YOGA-C630-13Q50.conf
new file mode 100644
index 0000000..114466a
--- /dev/null
+++ b/ucm2/Lenovo-YOGA-C630-13Q50/Lenovo-YOGA-C630-13Q50.conf
@@ -0,0 +1,6 @@
+Syntax 2
+
+SectionUseCase."HiFi" {
+	File "HiFi.conf"
+	Comment "HiFi Music."
+}
-- 
2.21.0

