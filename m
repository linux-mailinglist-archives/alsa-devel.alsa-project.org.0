Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D82592E0543
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Dec 2020 05:08:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 72FC6176A;
	Tue, 22 Dec 2020 05:07:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 72FC6176A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1608610129;
	bh=yLCId4Dm/ftEQOnQHAKChetw58XIgRl3/P7wj6bXWuY=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=CAwQ0RT5gcKs8ihOW9SKC64EVf9Ri9EQ1j1wGFMa/H2oXH+q4ytMW4qMEw2gk7GBR
	 /9IPVtDfx9I1ueZHwsBWapNEGObt3QnYYcxW5/P3crrTuIxvZug8nLFH0B50MooDYA
	 ImYtEHk0+yf0gsyLctkDnuBvqdG6uBoZ0SUm4OBE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D2D07F80232;
	Tue, 22 Dec 2020 05:07:03 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 589A7F80224; Tue, 22 Dec 2020 05:06:57 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 PRX_BODY_13,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 23E04F800BC
 for <alsa-devel@alsa-project.org>; Tue, 22 Dec 2020 05:06:49 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 23E04F800BC
Received: by mail-ot1-f41.google.com with SMTP id j20so10821914otq.5
 for <alsa-devel@alsa-project.org>; Mon, 21 Dec 2020 20:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=q3IkBlOmHE3mDRbIb8lAHBUkpZJ3o80cNN5b/4sEG/I=;
 b=fDqWM/i5krD6jfCDlrioQzb89RuqVL1+uzs8iCWeICvvsXsmDBFmdp3sJ6NrK035j/
 fsY7UDvWBFjaKYfiiiRwBmnkcj2LflwKnbCGA+mQuyUE8JyNISNF2EyGEZwlHrDYz5Kw
 A3yrXqE2KzW68vxDVIi5/dD4bcIst4HxoJKJ8tETVfwNFReer6C8fG2FjqJ31Elk1QGB
 ke0Ip/pWJxt3NGxPfHFpC/sFg/s49G8rUHIwseB2fLKsbcWVUGfE3aQbRnAiUBeSoF8f
 H6P96b+H4G/tESEJux9GkCi4al1B3LQHjtjF3uN6sBMwf2urwVvnkH1nVo/7Ox91q/Rt
 z6bQ==
X-Gm-Message-State: AOAM531LsdYLz2vgE9iNIPd/X2bbPjr8BaQoUUKvYzuJ0NL2YZhOHYr9
 dKfUKQjPQkjAXI9peIT+Yg==
X-Google-Smtp-Source: ABdhPJzc2AcXawDMexyhwX9kljUmHJGpp3yp74aSZqBghugGE4ma17w5UwkOCA62mhIs+ne0II6TKw==
X-Received: by 2002:a05:6830:1189:: with SMTP id
 u9mr14233531otq.70.1608610007879; 
 Mon, 21 Dec 2020 20:06:47 -0800 (PST)
Received: from xps15.herring.priv ([64.188.179.253])
 by smtp.googlemail.com with ESMTPSA id m22sm4261765otr.79.2020.12.21.20.06.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 20:06:47 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: Drop redundant maxItems/items
Date: Mon, 21 Dec 2020 21:06:45 -0700
Message-Id: <20201222040645.1323611-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jassi Brar <jaswinder.singh@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dmaengine@vger.kernel.org
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

'maxItems' equal to the 'items' list length is redundant. 'maxItems' is
preferred for a single entry while greater than 1 should have an 'items'
list.

A meta-schema check for this is pending once these existing cases are
fixed.

Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>
Cc: dri-devel@lists.freedesktop.org
Cc: dmaengine@vger.kernel.org
Cc: alsa-devel@alsa-project.org
Cc: linux-usb@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml    | 1 -
 Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml   | 1 -
 Documentation/devicetree/bindings/mailbox/arm,mhu.yaml         | 1 -
 .../devicetree/bindings/sound/nvidia,tegra30-hda.yaml          | 2 --
 Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml    | 1 -
 Documentation/devicetree/bindings/usb/renesas,usbhs.yaml       | 3 ---
 6 files changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
index 7b9d468c3e52..403d57977ee7 100644
--- a/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
+++ b/Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
@@ -98,7 +98,6 @@ properties:
     maxItems: 1
 
   dmas:
-    maxItems: 4
     items:
       - description: Video layer, plane 0 (RGB or luma)
       - description: Video layer, plane 1 (U/V or U)
diff --git a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml
index b548e4723936..c07eb6f2fc8d 100644
--- a/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml
+++ b/Documentation/devicetree/bindings/dma/renesas,rcar-dmac.yaml
@@ -73,7 +73,6 @@ properties:
     maxItems: 1
 
   clock-names:
-    maxItems: 1
     items:
       - const: fck
 
diff --git a/Documentation/devicetree/bindings/mailbox/arm,mhu.yaml b/Documentation/devicetree/bindings/mailbox/arm,mhu.yaml
index d43791a2dde7..d07eb00b97c8 100644
--- a/Documentation/devicetree/bindings/mailbox/arm,mhu.yaml
+++ b/Documentation/devicetree/bindings/mailbox/arm,mhu.yaml
@@ -61,7 +61,6 @@ properties:
       - description: low-priority non-secure
       - description: high-priority non-secure
       - description: Secure
-    maxItems: 3
 
   clocks:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
index e543a6123792..b55775e21de6 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -44,7 +44,6 @@ properties:
     maxItems: 3
 
   clock-names:
-    maxItems: 3
     items:
       - const: hda
       - const: hda2hdmi
@@ -54,7 +53,6 @@ properties:
     maxItems: 3
 
   reset-names:
-    maxItems: 3
     items:
       - const: hda
       - const: hda2hdmi
diff --git a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
index 0f078bd0a3e5..22603256ddf8 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usb-xhci.yaml
@@ -51,7 +51,6 @@ properties:
     maxItems: 1
 
   phy-names:
-    maxItems: 1
     items:
       - const: usb
 
diff --git a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
index 737c1f47b7de..54c361d4a7af 100644
--- a/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
+++ b/Documentation/devicetree/bindings/usb/renesas,usbhs.yaml
@@ -74,11 +74,8 @@ properties:
 
   phys:
     maxItems: 1
-    items:
-      - description: phandle + phy specifier pair.
 
   phy-names:
-    maxItems: 1
     items:
       - const: usb
 
-- 
2.27.0

