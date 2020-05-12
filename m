Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFDC1CF175
	for <lists+alsa-devel@lfdr.de>; Tue, 12 May 2020 11:21:43 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D1ED7167F;
	Tue, 12 May 2020 11:20:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D1ED7167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589275302;
	bh=30pDTU3g1xZEmzjpUzhFi/Ygp84Rki/rcq7KOdMQS68=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=iGyRuO1YnsAjr7Ssg9RrnPQBYk7I/wZVKw219TDuWR404GrhfKGsPbL/gT3A7QtrP
	 QKCS28wVZ8y3yOBD/hUwF+twWEEMLeR3E5K3xalW0gEF3cJu8YkjQ7HNaX+hUGBpc2
	 uXcNKRK2+UMnvRXDXMFvJ2MuGYxu2YIgtmgQZhOQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0C3A6F80112;
	Tue, 12 May 2020 11:20:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53176F80112; Tue, 12 May 2020 11:19:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4E309F800AA
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 11:19:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4E309F800AA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Mglqha6z"
Received: by mail-pj1-x1042.google.com with SMTP id a7so9108183pju.2
 for <alsa-devel@alsa-project.org>; Tue, 12 May 2020 02:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=eljqxU5QjvaLul3lBAtBBOmNN4PsgBS7SMSl69Yllas=;
 b=Mglqha6zf4yCyBuN1JhM/UvGpoJccJ0mz+FVC/tYpYCPTiXEuamRf/XY7WUy6QyNfI
 LY1DNTH4E3eV3ddLsU6PxfXjmwgQkXShWdfg6VlQffwoJ/JJv/79gQrLI18ZDZYA9rdA
 t765sebL8CNfI4SlkzDSYOliuKxlDN5vp9SwwNkYSQpQvc1S8u8BnKdikmDu+pjLxa3O
 UonXJq41yRadaD4J7083xLeRG5fbyXy4/FML4a/8cjcSP8+dm7epzTVzNJVR9htmqmSv
 fRLBlj4ZoL/IV6usCtprKQDBb9UpZCyWwecUCazD8CsARM0pGNB1bRki9TfcgNeIVTuF
 GhmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=eljqxU5QjvaLul3lBAtBBOmNN4PsgBS7SMSl69Yllas=;
 b=tIOvxII3lIIzVlkbu2cACQE7ZKSJWbc5A1/qqCj6JK4u3ntevVLwzQM6/ooDQH+u6c
 B2jMDJ4I6CMsn02U+GNRNStnVoUZgIiJV7PQ1NmW+tX1SoW+Aa6fA80PR2sFP93GaozY
 aCb2+2GWTRFCGA9QeHpecTiRrTtBXtIJnYsjrsQHW+PxriaDjsD+eWQSplRMakndzJ6q
 Gb6i0QwVpmJS+iQAF3ilsYn6JHwm24s2Q/8cZd/Wxxp7fBBe5O8z3abtOAG/lKnaBj8B
 68ieEHeAsQv0aniXpnnq2PUDJV1kV9eHRQA8mz6hMnTU/yFmGRva5Zu44XKt/dxP1Z4G
 GopQ==
X-Gm-Message-State: AGi0PuartJrEHkkqpWo9sDAKEwGgDNMInargsihryBnqydRQhnQNQ7Zb
 LaFq592uyJqEFvE4D2TIysg=
X-Google-Smtp-Source: APiQypJ9gTfQbVWhwVvBIvaeS/BnzgA7vFw4SAoPPieKhgGQanQt+xg/c333SFLbyoeyvyjH3AqW4g==
X-Received: by 2002:a17:90a:9295:: with SMTP id
 n21mr26444117pjo.195.1589275189436; 
 Tue, 12 May 2020 02:19:49 -0700 (PDT)
Received: from localhost.localdomain ([2001:2d8:308:9c7a:d5fe:3ea6:5791:c8e8])
 by smtp.gmail.com with ESMTPSA id
 b16sm11546944pfp.89.2020.05.12.02.19.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 May 2020 02:19:48 -0700 (PDT)
From: Steve Lee <steves.lee.maxim@gmail.com>
X-Google-Original-From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [V2 PATCH 1/2] dt-bindings: Added device tree binding for max98390
Date: Tue, 12 May 2020 18:18:46 +0900
Message-Id: <20200512091846.31207-1-steves.lee@maximintegrated.com>
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

