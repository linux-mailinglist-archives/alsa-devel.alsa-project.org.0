Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C21C263C16
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Sep 2020 06:32:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 092971663;
	Thu, 10 Sep 2020 06:32:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 092971663
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599712373;
	bh=s+Ea/4mCH5oMphDfDYac4q++AKBUESnx/stbdSPLDPI=;
	h=Date:In-Reply-To:References:Subject:From:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M0qyoBUolo2n58+9SVrq2nww9ZSA13o09tim290bp0hk3zAkBqZUxUryC9lWA+1nH
	 E5/Lq0X0ZomfEHnEa83rdSvMEQJTwyuaOCkp46eKvRu/1bd2ClyytVDJItgtJHeJcy
	 W6V36nC8Rh7l9V/sNEbZNHRHcRnzxYaVTEaxrj3U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7C09F802DC;
	Thu, 10 Sep 2020 06:30:23 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4040BF802C2; Thu, 10 Sep 2020 06:30:20 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
 USER_IN_DEF_DKIM_WL autolearn=disabled version=3.4.0
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CFAE5F801F2
 for <alsa-devel@alsa-project.org>; Thu, 10 Sep 2020 06:30:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CFAE5F801F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="a4jjBbSC"
Received: by mail-yb1-xb4a.google.com with SMTP id w38so4261394ybi.20
 for <alsa-devel@alsa-project.org>; Wed, 09 Sep 2020 21:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:in-reply-to:message-id:mime-version:references:subject
 :from:to:cc; bh=kepGzz19JH800nsZ5Euti5avIzl4EmHZn4FGf0VjD0I=;
 b=a4jjBbSCG6hzC2ErZosxqqAHyPPywaECJoeLaT1HI/yFs5GQEsOaYH5RX2KKBpdASu
 GVL37hygz/rtzZ9omz7oLl0coiZi/MvpvxboTk2dBSTvMkPlZJTxdvGEb6czad6PgCf7
 u3HkFP5JiJKelIr27W/CpSCHXgONNIMam9+3c98B1vkZMaxYD3skI+Dih4YISuwq1CEf
 AwX4u9P/Fk3N24sC5dBmrG3eNJeDe3DWuaG7HrY3pNnq39/lQCRYsoGWGk+7kVZ2RSZk
 qf2+UZnLBb3HkgbEhievOCDplaxIZUsrFIpmXi4McFHibldyuXpgfZUce9twKHuFEyZV
 1CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=kepGzz19JH800nsZ5Euti5avIzl4EmHZn4FGf0VjD0I=;
 b=MKcpCFDVbSix8z4dGTLGxZ8BHhwVGqg8myDNj3nu5sg9l/4sFgGSTMLi/FBL61nNcn
 e4cFJs3NkBtLliG3eLo03mKDnPk60NHPCm3NTitwZd1yKBLbgSJmGk8mGYA/ssHiFXH3
 dnr2OpXi6FGIogKFsQIvAoWZvcn1CaGdP+zm5VAsg04Zal//Y84WznsuiOFvvcaBWzsL
 MZfFhLt+ls28cePYHQxnrOnhDjDiV0+BR3gepgXnT+4aAbQaO2slZm/BjdrFH7l2kZAL
 tQRPZapBgeA1/Wru2ZZIaaUH/0GpyTRKeWGwTMgQLwEtrSp/zdDlaHHOr5M5cXjsNwtm
 /VuA==
X-Gm-Message-State: AOAM533irVfJ2wysWFnZ7qwIgCq/2oVgMAt9FWZ4zFV3x6w4NgedEMce
 Eap3FfUnxrBWLw1BR6mTGTobpASw3QXj
X-Google-Smtp-Source: ABdhPJys+fkeh11dPjwpPmPqH/rTvTw3uT5aVrUM/d0OxsBwpPQBGkddJPK6N5Pk2sWR1MvLuUaAS8cb5AOE
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:725a:fff:fe41:c6a5])
 (user=tzungbi job=sendgmr) by 2002:a25:9745:: with SMTP id
 h5mr7742394ybo.104.1599712210456; Wed, 09 Sep 2020 21:30:10 -0700 (PDT)
Date: Thu, 10 Sep 2020 12:29:49 +0800
In-Reply-To: <20200910042949.3795682-1-tzungbi@google.com>
Message-Id: <20200910042949.3795682-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20200910042949.3795682-1-tzungbi@google.com>
X-Mailer: git-send-email 2.28.0.526.ge36021eeef-goog
Subject: [PATCH 2/2] ASoC: dt-bindings: rt1015p: add document
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Cc: jack.yu@realtek.com, alsa-devel@alsa-project.org, tzungbi@google.com
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

Adds DT binding document for rt1015p.

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 .../bindings/sound/realtek,rt1015p.yaml       | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml b/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
new file mode 100644
index 000000000000..def1db298eac
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/realtek,rt1015p.yaml
@@ -0,0 +1,36 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/realtek,rt1015p.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Realtek rt1015p codec devicetree bindings
+
+maintainers:
+  - Tzung-Bi Shih <tzungbi@google.com>
+
+description: |
+  Rt1015p is a rt1015 variant which does not support I2C and
+  only supports S24, 48kHz, 64FS.
+
+properties:
+  compatible:
+    const: realtek,rt1015p
+
+  sdb-gpios:
+    description:
+      GPIO used for shutdown control.
+      0 means shut down; 1 means power on.
+    maxItems: 1
+
+required:
+  - compatible
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    rt1015p: rt1015p {
+        compatible = "realtek,rt1015p";
+        sdb-gpios = <&pio 175 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.28.0.526.ge36021eeef-goog

