Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E17195A8F
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Mar 2020 17:02:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B3E1216B3;
	Fri, 27 Mar 2020 17:01:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B3E1216B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585324953;
	bh=AfdKi66MUjZYeKT45HUge8eeubCdf+7oDb/Syw8VSuc=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=erJl/fOAP9NLiMDy4hPWcLrTPFefwGSyGcl5aeT/rgrqodVkzyNP8Ih5WjBVAsijx
	 wZ/52KbbZGeCzi8WnncAboqHe7JgoKSvLennEjAACgWsbfJJoCuwKOXAFxPe3djjgJ
	 Bcr5fBtEgYQ7jzpo42N0aN6Zbd8XQmXtfHuy60aI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7A75F80248;
	Fri, 27 Mar 2020 16:57:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC278F80248; Fri, 27 Mar 2020 16:57:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0A80CF801DA
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 16:57:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0A80CF801DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="gOtF8cOt"
Received: by mail-qt1-x844.google.com with SMTP id a5so8917871qtw.10
 for <alsa-devel@alsa-project.org>; Fri, 27 Mar 2020 08:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=MJgmzrT3mOT+iy0/6QFgsKv2QDxpME0Uv8zYggJWeY8=;
 b=gOtF8cOtFG7EY31dkW2qu/WHXxMr29zCI0j8gDupt6lJykRlih49OGKaLo2ZnkORFG
 acneG8dOHa4CKURbTpsGzRIJC7vN+9g1z6ymWgGTrOMSc8ThhVuEKRYyIBFob6OrtBSD
 4c+UicmKBzM7uKnpR9JMR2w1XUZo0JbfAbntWMqBuZ7bkV7aoNLxUiCtGvOUGmJ/BlXh
 BLm1kKuCm4uPCQTYuz0mfPOSyhDvCB4F4hGI+PIw2AnSfgrBpgAWQw/ZEqUX8zcizldu
 4EDxknHdqnOQsl1/aeHmrv1vDtW0AhNhPskZR0dFRpbacuBQArZ72dZfe5na7epIii0F
 AP2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=MJgmzrT3mOT+iy0/6QFgsKv2QDxpME0Uv8zYggJWeY8=;
 b=ik6Mos+3gYvbsFQaz8OQdOZvfgZltXMBMcn4W8JoKDRYQS/20eTYkW/929ukPu5MEH
 t5EzLevRHgJRl1ce2z+vaUfo1T76kEHKpA6+qvDSLj84hWRvNUpLGZ/+gPBkjCFVbyeU
 JpHGjxhsODlVr7mowtkQQuydzAALoCy6TJnOP14IyOHGzseGpxpAJw+IlwLjEbjGBMkU
 WYjRAsfs8dRmxVlULolFPnYhNWKq40vnXg43n9nNOUnnlfNtCTKnHJ8p4/Uei7jEKDKv
 8jcb3rs0ZSkRrW0DcMz0m5KD1WXBGGHpOzpm8NPzWzGuCdlrx262vKN1fX/BxtZYUGAz
 0WOw==
X-Gm-Message-State: ANhLgQ1ZVFCo+hcfSnyY3xx1FCY1suErvQorS1HRJQy4y4e2JPyEqJQd
 /dZX9+btPQQUnC96e517Xd8=
X-Google-Smtp-Source: ADFU+vtrmn9ruMwW6MFirU7I7rcRKH43s6n+pJouD0/cFjfZ4bhBpyGa2v3QZVHYtIj4fqLNCGkq9A==
X-Received: by 2002:ac8:7a63:: with SMTP id w3mr14431356qtt.352.1585324648736; 
 Fri, 27 Mar 2020 08:57:28 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:482:5bb::4])
 by smtp.gmail.com with ESMTPSA id 31sm4090023qta.56.2020.03.27.08.57.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 08:57:28 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: broonie@kernel.org
Subject: [PATCH] dt-bindings: sound: cs42l51: Remove unneeded I2C unit name
Date: Fri, 27 Mar 2020 12:57:21 -0300
Message-Id: <20200327155721.7596-1-festevam@gmail.com>
X-Mailer: git-send-email 2.17.1
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 Fabio Estevam <festevam@gmail.com>, benjamin.gaignard@st.com
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

The following warning is seen with 'make dt_binding_check':

Documentation/devicetree/bindings/sound/cirrus,cs42l51.example.dts:18.15-34.11: Warning (unit_address_vs_reg): /example-0/i2c@0: node has a unit name, but no reg or ranges property

Fix it by removing the unneeded i2c unit name.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
index efce847a3408..83f44f07ac3f 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l51.yaml
@@ -49,7 +49,7 @@ required:
 examples:
   - |
     #include <dt-bindings/gpio/gpio.h>
-    i2c@0 {
+    i2c {
       #address-cells = <1>;
       #size-cells = <0>;
 
-- 
2.17.1

