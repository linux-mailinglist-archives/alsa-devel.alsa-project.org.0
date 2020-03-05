Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC917A6A2
	for <lists+alsa-devel@lfdr.de>; Thu,  5 Mar 2020 14:47:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D7F991669;
	Thu,  5 Mar 2020 14:46:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D7F991669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583416023;
	bh=xWE+O0nW/2cUBX6HD1hidlw/xsOZ4Dth7pc/BpAIx28=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hQ+rTEz9P0TTsp7pawrGSjlX6seiGO3AUvgErbhkmaCZ2sYUkt85MFCy9a9O0bpXC
	 0ToDRQhC/UtfiHvdaAZIVEWGInsFLbD1+fwYO+IEQXPHXM6t10G0qIijIsTr6wIF4p
	 a+0mjHQunXpJ7Fz7D2Vp7rPSeGxCm66PvcQ+Qba8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DA5C1F80245;
	Thu,  5 Mar 2020 14:44:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 74DB8F80126; Thu,  5 Mar 2020 14:44:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83FFAF80126
 for <alsa-devel@alsa-project.org>; Thu,  5 Mar 2020 14:44:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83FFAF80126
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="cMgpk3pp"
Received: by mail-wr1-x42d.google.com with SMTP id v4so7083048wrs.8
 for <alsa-devel@alsa-project.org>; Thu, 05 Mar 2020 05:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tkkdkuj2nMIqRYSUpJgIISztIjHhGG24T2FE65a4WvI=;
 b=cMgpk3pps/kLc7FO2rFNJQa09CAaneKjKetzaJa/BuX2MES2mW/d6QS/zXTMyON30D
 wy0DqGPeYIlBVmFiMDzTf3/KdSqYbrmmh5hGSTeTXy5BqheONbNvb4WOmkOj/6qi2mSe
 Pog89Cp85VjxFxrADjxjIKl3036gQ1HrZO4bc0px2BFHJvQAoE6kIoxB/ts7SmQpKgjR
 +iCsrymHUesisHPDfny73L5+k6Lrzh7OQT/ZqOQUZ0PoHL7lhl9rUMZxG3vR63X2y1sF
 SSnk+aARsQgxWuq/U8Wu3dfXmmBOM4Wbrq11229xE8jLLbpHEyeO/IILeF/OZ2wqVzTn
 R1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkkdkuj2nMIqRYSUpJgIISztIjHhGG24T2FE65a4WvI=;
 b=b2NHYxgi9As5NBH2OHL0b8qHPdchJC/aaqBnIBseoSzpxLs4Wf3r2x3KIkh1LCNfWb
 ss2cn/1TjXZL8rN6ucdpB/XG0w+fcxscdoBpT/Dxvb2H3EjhyUNTDlk3TgBDCWGkQ+qe
 LNCCCChPk6L9f2uZ76yz2e7CalW5PiNXdI+iWfG24VGN0/qhnr5AnG8mWINR1uXxhba3
 hxhDI54EQ9Pp3zdAf+kbkCRCgvtHcumvNaQBybsD5Bn8L6CeU6gvHSQ+Xs8o3PdYMEPm
 Uuc3BedJHdRlUlkiqQi6JJTe/WrThM/mrsBv3PcURSY702OEoNPAIkhNmUOLZToW6sRH
 Ch/g==
X-Gm-Message-State: ANhLgQ1OYVWMDLx+gPdK5qrA8UQo7oT4VsrjHMOJNvRcTjCM6UW6vdnh
 L5BLVwjEQIJv3eILYtJG3TPmgA==
X-Google-Smtp-Source: ADFU+vuvKskKTBdQ1yL8h+kiMzqWUIvCVnh5PzwGM2oCe76SKtCt9bddLJp0G6cNPoSSziSJqKbsgQ==
X-Received: by 2002:adf:e803:: with SMTP id o3mr9965035wrm.110.1583415873508; 
 Thu, 05 Mar 2020 05:44:33 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc89974-aztw32-2-0-cust43.18-1.cable.virginm.net. [86.30.250.44])
 by smtp.gmail.com with ESMTPSA id o9sm46425385wrw.20.2020.03.05.05.44.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2020 05:44:32 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: perex@perex.cz
Subject: [PATCH 1/4] ucm2: codecs: wcd934x: Add Codec sequences.
Date: Thu,  5 Mar 2020 13:44:01 +0000
Message-Id: <20200305134404.7690-2-srinivas.kandagatla@linaro.org>
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

Add WCD934x codec sequences to be used by other platforms like DB845c
and Lenovo YOGA C630

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 ucm2/codecs/wcd934x/DefaultDisableSeq.conf      |  5 +++++
 ucm2/codecs/wcd934x/DefaultEnableSeq.conf       | 14 ++++++++++++++
 ucm2/codecs/wcd934x/HeadphoneDisableSeq.conf    |  6 ++++++
 ucm2/codecs/wcd934x/HeadphoneEnableSeq.conf     |  6 ++++++
 ucm2/codecs/wcd934x/HeadphoneMicDisableSeq.conf |  2 ++
 ucm2/codecs/wcd934x/HeadphoneMicEnableSeq.conf  |  3 +++
 ucm2/codecs/wcd934x/SpeakerDisableSeq.conf      |  4 ++++
 ucm2/codecs/wcd934x/SpeakerEnableSeq.conf       |  4 ++++
 8 files changed, 44 insertions(+)
 create mode 100644 ucm2/codecs/wcd934x/DefaultDisableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/DefaultEnableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/HeadphoneDisableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/HeadphoneEnableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/HeadphoneMicDisableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/HeadphoneMicEnableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/SpeakerDisableSeq.conf
 create mode 100644 ucm2/codecs/wcd934x/SpeakerEnableSeq.conf

diff --git a/ucm2/codecs/wcd934x/DefaultDisableSeq.conf b/ucm2/codecs/wcd934x/DefaultDisableSeq.conf
new file mode 100644
index 0000000..88d82a3
--- /dev/null
+++ b/ucm2/codecs/wcd934x/DefaultDisableSeq.conf
@@ -0,0 +1,5 @@
+cset "name='RX INT7_1 MIX1 INP0' ZERO"
+cset "name='RX INT8_1 MIX1 INP0' ZERO"
+cset "name='RX INT1_2 MUX' ZERO"
+cset "name='RX INT2_2 MUX' ZERO"
+cset "name='CDC_IF TX0 MUX' ZERO"
diff --git a/ucm2/codecs/wcd934x/DefaultEnableSeq.conf b/ucm2/codecs/wcd934x/DefaultEnableSeq.conf
new file mode 100644
index 0000000..e5bdbbd
--- /dev/null
+++ b/ucm2/codecs/wcd934x/DefaultEnableSeq.conf
@@ -0,0 +1,14 @@
+cset "name='SLIM RX1 MUX' AIF1_PB"
+cset "name='SLIM RX2 MUX' AIF1_PB"
+cset "name='SLIM RX6 MUX' ZERO"
+cset "name='SLIM RX7 MUX' ZERO"
+cset "name='SLIM RX3 MUX' ZERO"
+cset "name='SLIM RX4 MUX' ZERO"
+cset "name='SLIM RX5 MUX' ZERO"
+cset "name='AIF1_CAP Mixer SLIM TX0' 1"
+
+cset "name='RX INT7_1 MIX1 INP0' RX1"
+cset "name='RX INT8_1 MIX1 INP0' RX2"
+cset "name='RX INT1_2 MUX' RX1"
+cset "name='RX INT2_2 MUX' RX2"
+cset "name='CDC_IF TX0 MUX' DEC0"
diff --git a/ucm2/codecs/wcd934x/HeadphoneDisableSeq.conf b/ucm2/codecs/wcd934x/HeadphoneDisableSeq.conf
new file mode 100644
index 0000000..0206e87
--- /dev/null
+++ b/ucm2/codecs/wcd934x/HeadphoneDisableSeq.conf
@@ -0,0 +1,6 @@
+cset "name='COMP1 Switch' 0"
+cset "name='COMP2 Switch' 0"
+cset "name='RX1 Digital Volume' 0"
+cset "name='RX2 Digital Volume' 0"
+cset "name='RX INT1 DEM MUX' ZERO"
+cset "name='RX INT2 DEM MUX' ZERO"
diff --git a/ucm2/codecs/wcd934x/HeadphoneEnableSeq.conf b/ucm2/codecs/wcd934x/HeadphoneEnableSeq.conf
new file mode 100644
index 0000000..5ce7950
--- /dev/null
+++ b/ucm2/codecs/wcd934x/HeadphoneEnableSeq.conf
@@ -0,0 +1,6 @@
+cset "name='COMP1 Switch' 1"
+cset "name='COMP2 Switch' 1"
+cset "name='RX INT1 DEM MUX' CLSH_DSM_OUT"
+cset "name='RX INT2 DEM MUX' CLSH_DSM_OUT"
+cset "name='RX1 Digital Volume' 68"
+cset "name='RX2 Digital Volume' 68"
diff --git a/ucm2/codecs/wcd934x/HeadphoneMicDisableSeq.conf b/ucm2/codecs/wcd934x/HeadphoneMicDisableSeq.conf
new file mode 100644
index 0000000..5558446
--- /dev/null
+++ b/ucm2/codecs/wcd934x/HeadphoneMicDisableSeq.conf
@@ -0,0 +1,2 @@
+cset "name='AMIC MUX0' ZERO"
+cset "name='ADC2 Volume' 0"
diff --git a/ucm2/codecs/wcd934x/HeadphoneMicEnableSeq.conf b/ucm2/codecs/wcd934x/HeadphoneMicEnableSeq.conf
new file mode 100644
index 0000000..ad43830
--- /dev/null
+++ b/ucm2/codecs/wcd934x/HeadphoneMicEnableSeq.conf
@@ -0,0 +1,3 @@
+cset "name='AMIC MUX0' ADC2"
+cset "name='ADC2 Volume' 12"
+cset "name='ADC MUX0' AMIC"
diff --git a/ucm2/codecs/wcd934x/SpeakerDisableSeq.conf b/ucm2/codecs/wcd934x/SpeakerDisableSeq.conf
new file mode 100644
index 0000000..3c977c8
--- /dev/null
+++ b/ucm2/codecs/wcd934x/SpeakerDisableSeq.conf
@@ -0,0 +1,4 @@
+cset "name='RX7 Digital Volume' 0"
+cset "name='RX8 Digital Volume' 0"
+cset "name='COMP7 Switch' 0"
+cset "name='COMP8 Switch' 0"
diff --git a/ucm2/codecs/wcd934x/SpeakerEnableSeq.conf b/ucm2/codecs/wcd934x/SpeakerEnableSeq.conf
new file mode 100644
index 0000000..2d9a3d8
--- /dev/null
+++ b/ucm2/codecs/wcd934x/SpeakerEnableSeq.conf
@@ -0,0 +1,4 @@
+cset "name='COMP7 Switch' 1"
+cset "name='COMP8 Switch' 1"
+cset "name='RX7 Digital Volume' 80"
+cset "name='RX8 Digital Volume' 80"
-- 
2.21.0

