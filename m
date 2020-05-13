Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 029801D0A13
	for <lists+alsa-devel@lfdr.de>; Wed, 13 May 2020 09:47:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9493C1614;
	Wed, 13 May 2020 09:46:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9493C1614
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589356024;
	bh=1MXwa+3+RPc+tSG7nAdapt6F8SnxVx0p4j12H1RRblU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LKYLnO2cBoYsDWE9r04PyLQ1ms17im6O4lkk+84QtLHD9rPJCOTFKsU2PaQMIAEO1
	 af7zT+LZFwET4eX74flSDW/+MYbkGy9uphYAod6c8rnL0vE4A1j28ApwZ8hqUff8s6
	 Yx2uVounn56OG/hPATHGqPAKHPxEi5H4EBENZCLE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5656F8022D;
	Wed, 13 May 2020 09:45:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DADB9F80247; Wed, 13 May 2020 09:45:18 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63D0CF800E3
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 09:45:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63D0CF800E3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="G7NxJ5me"
Received: by mail-pg1-x544.google.com with SMTP id 9so1873061pgr.3
 for <alsa-devel@alsa-project.org>; Wed, 13 May 2020 00:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=H65Vxu253kb3zW5OLT3gqxYyLx+OY58AmrFPbg1BtQ4=;
 b=G7NxJ5mehnMYlEkMa3a29ghSVoJRGjhjmf8xIlvmrFbJEIKb3mRhE30cyNyB19m3cw
 XeqIrzewNcYkLpzKPHAp2pHdPUQRm8rV3JdlbpIleIZNk7XmHgdRcq9MTkRPa5KL1Zj/
 bqyKIpWZX+DFYSuGd3kjGWvDD4Oul3E5sLQvSMDljrHiKm7hcY3iL4csf5CpXfSNDPo8
 5GHvjJEPdMEsiYSOmoUCwhAqSOLn8j8ssHto6wstiEf3WwWjaHT26KOqSH7m8zmbsnoq
 82dzbBUe7hJGWPGJaQQic71EMwOk5VB04q47ho9D33b/SDMizL3cZZjVN5FgCJ5U9PHI
 waTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=H65Vxu253kb3zW5OLT3gqxYyLx+OY58AmrFPbg1BtQ4=;
 b=av6f6x4R4ZbE72qQ6z5pqynTHN+A5FmQKESlZ/cRwHlkHm8NPfOMYVoVpp1b1AkRem
 VFcs1IPqXEia1YCF6aXixpxjFA+LHNy/F/+tG4Pjhht+h4FU0WDzd2WSxBqXLerY4gpQ
 s2pyQGlaJkNkZHuZnQdFat8VRmaqxisVuc5ylFQcPH7XUqsuaxu+AYSRnbVuLfquseuX
 0xhCZRuB9SKHq98oGLFSRzQIKAGTrFNUEU1ZHuCrRWUcASSVNUdZNNnQAr9vNOmt91Mr
 a5G+X9id2JPMQbp/8fQh4B4sulMUkH25v4bqDl3JZSXFjXlRptAw3giTssYA+J3rt0Cm
 zD4A==
X-Gm-Message-State: AGi0PuZmhwi9iXE9p+MvGjTandwu9E2O5Q2ZDwv1mQW2zljY7ZJsJHA+
 up8VOJTb4KiLBF+zabzwldM=
X-Google-Smtp-Source: APiQypIER4ye/hOz4oLh6skERHRUkzmMFbigD5b/Te7MST5tFsN6gh4pp6TGiqHg49eP8ruTP9JQCg==
X-Received: by 2002:a63:d64:: with SMTP id 36mr17709173pgn.143.1589355908024; 
 Wed, 13 May 2020 00:45:08 -0700 (PDT)
Received: from localhost.localdomain ([2001:2d8:eb02:505a:d5fe:3ea6:5791:c8e8])
 by smtp.gmail.com with ESMTPSA id v3sm2740091pfv.186.2020.05.13.00.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 00:45:07 -0700 (PDT)
From: Steve Lee <steves.lee.maxim@gmail.com>
X-Google-Original-From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [V3 PATCH 1/2] dt-bindings: Added device tree binding for max98390
Date: Wed, 13 May 2020 16:44:23 +0900
Message-Id: <20200513074423.21034-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
Cc: ryan.lee.maxim@gmail.com, steves.lee@maximintegrated.com,
 ryans.lee@maximintegrated.com, steves.lee.maxim@gmail.com
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

Add documentation for DT binding of max98390 amplifier driver.

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---

Changed since V2:
	* No changes.
Changed since V1:
	* Modified sample text in example

 .../devicetree/bindings/sound/max98390.txt    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/max98390.txt

diff --git a/Documentation/devicetree/bindings/sound/max98390.txt b/Documentation/devicetree/bindings/sound/max98390.txt
new file mode 100644
index 000000000000..0ddd4c6ae55e
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/max98390.txt
@@ -0,0 +1,26 @@
+Maxim Integrated MAX98390 Speaker Amplifier
+
+This device supports I2C.
+
+Required properties:
+
+ - compatible : "maxim,max98390"
+
+ - reg : the I2C address of the device.
+
+Optional properties:
+
+- maxim,temperature_calib
+  u32. The calculated temperature data was measured while doing the calibration. Data : Temp / 100 * 2^12
+
+- maxim,r0_calib
+  u32. This is r0 calibration data which was measured in factory mode.
+
+Example:
+
+codec: max98390@38 {
+	compatible = "maxim,max98390";
+	reg = <0x38>;
+	maxim,temperature_calib = <1024>;
+	maxim,r0_calib = <100232>;
+};
-- 
2.17.1

