Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7559F1CC95A
	for <lists+alsa-devel@lfdr.de>; Sun, 10 May 2020 10:22:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC12E1607;
	Sun, 10 May 2020 10:21:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC12E1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1589098967;
	bh=T3bGl7uk0kEzPImhPKsUp++pGS5ODQ20e3CLzSNCYjU=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ONk6xAVO64Xr/48IuI6eumwcI8pYQMSJU02MnLL4GuCgcFiQ0gqKCaS5FRZcXj2Eo
	 ASnKjm0dtTStj0hoTuSSjVO+6aZ1c1rIN5nV9bs78nXvNk8S3G49PrbQZ0nHfk9KDU
	 yjjOxvjPNX2xWFTRaeI8cBl+GrAR9ETtjpZrlACQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9A6DF80148;
	Sun, 10 May 2020 10:21:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9BAFF8015F; Sat,  9 May 2020 05:18:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3E0AF800F6
 for <alsa-devel@alsa-project.org>; Sat,  9 May 2020 05:18:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3E0AF800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="njmdmu/o"
Received: by mail-pg1-x541.google.com with SMTP id j21so1800793pgb.7
 for <alsa-devel@alsa-project.org>; Fri, 08 May 2020 20:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=zzJCC69wo4d+308QEV5gjkekcxD2iqQ/9p1JPveRTkA=;
 b=njmdmu/oDmlDhvjpaoG+P9T5eIShCdBkEG0nTzCSLP+xwYW+whiw2yvxZfH5RUAxHP
 uc4+e0Kxj37xj6l6eFhPdkfWS3Hx5geToWAXIH76IcSnGYfwcMPnw/zxnqglqz9sA+Qt
 1AgcwGIVKUMRAyILk5apYTQ5fPf+Qc0UB1dlKIzdEAzdf/GvsgoDySSyyqL5EeopGBjw
 FJ2iLX3VNZvZXgaCY4fpJ+hnoF248TuxXOJwyUQye2hcoAofjJeQKm/CVO73CxVAUFK0
 2iBY7o0xku8/H/hGBNcOZfrmgP0tetYVDF1woW8Ai83qqMOGvRxmlFL7di6v+Tzzi32C
 2oUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=zzJCC69wo4d+308QEV5gjkekcxD2iqQ/9p1JPveRTkA=;
 b=husp9bNLZdueOa/I8I/qf12dxfbxE1ZPNJV7Tw4gUBEVGMXx3rvRoRGStJ727F429y
 bqeS6hM4/tudjmD7eHwZWW1+UQ1me6sS5ym1qhJSL/L+sHGARs215GOzeFXuX2RQ3Dfe
 Yms8CZdf7f5M+uvONmMzCM5Uc1Xhe376B1feL8XCGUdGKD7oWEns9fMydg2Lx3OoCs0f
 /wrqBxmUi79sCvzG9haHv9SdWzzJlfmdVyuVoGMnapGDKa9wynB+urNITpBCLXUzq4cc
 TTYfnoedZ+H+HCrvnABjYlLtO97fhDPsUb5KaIXkkg9nUmAzO1zIn+Xkq0p5pZ/M5FlH
 yD1g==
X-Gm-Message-State: AGi0PuYcm9A8wc1MDHTr19dU9JcfXwTutrROKDmDyoqCrNqLbXbEL7TB
 qVRQSf80OW1i4K78GRhu9FU=
X-Google-Smtp-Source: APiQypJkAC0n3gvoXXV0efJrhOQSNYN+H5GDw3dyc2NlKep//fT8F1LF9A72TusOtQrlbVT+XzlFmQ==
X-Received: by 2002:a63:150:: with SMTP id 77mr4558840pgb.136.1588994292345;
 Fri, 08 May 2020 20:18:12 -0700 (PDT)
Received: from localhost.localdomain ([2001:2d8:eb61:15a8:d5fe:3ea6:5791:c8e8])
 by smtp.gmail.com with ESMTPSA id a22sm2413872pga.28.2020.05.08.20.18.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 20:18:11 -0700 (PDT)
From: Steve Lee <steves.lee.maxim@gmail.com>
X-Google-Original-From: Steve Lee <steves.lee@maximintegrated.com>
To: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: Added device tree binding for max98390
Date: Sat,  9 May 2020 12:17:37 +0900
Message-Id: <20200509031737.8937-1-steves.lee@maximintegrated.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sun, 10 May 2020 10:21:00 +0200
Cc: steves.lee@maximintegrated.com, steves.lee.maxim@gmail.com
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

Signed-off-by: Steve Lee <steves.lee@maximintegrated.com>
---
 .../devicetree/bindings/sound/max98390.txt    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/max98390.txt

diff --git a/Documentation/devicetree/bindings/sound/max98390.txt b/Documentation/devicetree/bindings/sound/max98390.txt
new file mode 100644
index 000000000000..147dfd88cd3b
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
+ - maxim,temperature_calib
+   u32. The calculated temperature data was measured while doing the calibration. Data calibration : Temp / 100 * 2^12
+
+ - maxim,r0_calib
+   u32. This is r0 calibration data which was measured in factory mode.
+
+Example:
+
+codec: max98390@38 {
+   compatible = "maxim,max98390";
+   reg = <0x38>;
+   maxim,temperature_calib = <1024>;
+   maxim,r0_calib = <0x224050>;
+};
-- 
2.17.1

