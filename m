Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D8E51F2F6
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 05:30:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 76323188F;
	Mon,  9 May 2022 05:29:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 76323188F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652067025;
	bh=0717qfW7EVAqw8vtLJG/gtrCsKzVI/IqtXfZaJ7Uchs=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ldsRo9lLcOstByQNJOSQC8GpfwFLkyyqj8ei6NJWqK1tTG39K3ezS6X7fmvYXyL1h
	 5tbLnE8Mla2sALO8tDm1QjnM8TDVMS7NYy8QFb5laPKN/zCXvzavAMmYP0mZ2l5TpF
	 vE0oFv0nLftKIL8ojk/0x+5DyBLcluSfgEE+IbOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 92FE6F804FF;
	Mon,  9 May 2022 05:28:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0C314F804FF; Mon,  9 May 2022 05:28:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1F7C9F800D3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 05:28:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1F7C9F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="XPCgBzrO"
Received: by mail-io1-xd2d.google.com with SMTP id c125so13989458iof.9
 for <alsa-devel@alsa-project.org>; Sun, 08 May 2022 20:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dDsp62AiGoY6OdXi5OTJclcy9YeOTLXSHY5Eqb8Jm3I=;
 b=XPCgBzrOUQNFOvkqTd3VC/tpbazBH2IhxMKx16VEl5RlxmSdL3IS/y8pH+k3vWPGni
 GInI1XpSmBtSkQDjTT726N8pDnI+O3dNypoZdSONKvJ4PM+vKRtQzwqSz+hXgB/1NBxC
 +BaOv/kzqvMo0go0h8QLl91Nzg4DE/6qBW/tUvqMUi6kxOj6ivkX9hh/aj0XRhtdH4nn
 lkIJ/AkwB4wLAPqwCgjjAwaAoofVI9eoDc2KketKJOrY3sP/Mk6rDQKNQoMYVHNJrnaE
 VXSVvFAl2tQUwLt5O7OJ0O+wwL0I/ZLLQf87faR4XMO7vwZ2DwoyCm1//CYWECmiM4Ed
 TSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dDsp62AiGoY6OdXi5OTJclcy9YeOTLXSHY5Eqb8Jm3I=;
 b=k9lajVI1U716zKgE9FBTC/7u3MfLx6F6YW5K3uikfaVS3iRnsdaEcMtcwUAWKc1dk+
 CgJI/2p6BfaJ5YdYH+GiAI7hFFPiHtJZx6+SWSLZHDTzWMYxjTZncC4sUsyLZ51yyZoS
 Ea9oLcwZhAyQBSr69+LKZXoDiUSTPKxhxYdS7r+c6Pz6Ied7N1jjSrhrhhxfpRjXErSH
 PDDZHF3S83oCic82pewEqiEsfEKJtz+VcCO3KtmrmwcMPeUaW3tucGKXIERFX8qg2ElA
 b3ZrEywNg3vW5ed1pxkSt5Eu2X6voD/XOAirolixyHiI8kpS3dODT5JujppYAh4Ge4Vy
 jlBA==
X-Gm-Message-State: AOAM5300qsn/4+CK8+yksnpVadSLrmfkGSRqsKxOHXrdepWxZKz28rK7
 yB2i8Fubw0bVYDqChjuQ1sM=
X-Google-Smtp-Source: ABdhPJzTLqYs+HpGw07/GlbEBWLKxNGsLzD9iCgNTRj+NCs8blffSq1MuhUcNqY24WG8D5BZMCL+3A==
X-Received: by 2002:a05:6638:4389:b0:32b:7caa:c49f with SMTP id
 bo9-20020a056638438900b0032b7caac49fmr6303614jab.159.1652066924827; 
 Sun, 08 May 2022 20:28:44 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-29-252-111.wi.res.rr.com.
 [65.29.252.111]) by smtp.gmail.com with ESMTPSA id
 a16-20020a92ce50000000b002cde6e352bcsm2869157ilr.6.2022.05.08.20.28.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 20:28:44 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com,
	robh@kernel.org
Subject: [PATCH v6 1/2] dt-bindings: sound: Add generic serial MIDI device
Date: Sun,  8 May 2022 22:28:35 -0500
Message-Id: <20220509032836.1116866-2-kaehndan@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220509032836.1116866-1-kaehndan@gmail.com>
References: <20220509032836.1116866-1-kaehndan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Daniel Kaehn <kaehndan@gmail.com>
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

Adds dt-binding for a Generic MIDI Interface using a serial device.

Signed-off-by: Daniel Kaehn <kaehndan@gmail.com>
---
 .../bindings/sound/serial-midi.yaml           | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/serial-midi.yaml

diff --git a/Documentation/devicetree/bindings/sound/serial-midi.yaml b/Documentation/devicetree/bindings/sound/serial-midi.yaml
new file mode 100644
index 000000000000..74849be01df3
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/serial-midi.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/serial-midi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Serial MIDI Interface
+
+maintainers:
+  - Daniel Kaehn <kaehndan@gmail.com>
+
+description:
+  Generic MIDI interface using a serial device. This denotes that a serial device is
+  dedicated to MIDI communication, either to an external MIDI device through a DIN5
+  or other connector, or to a known hardwired MIDI controller. This device must be a
+  child node of a serial node.
+
+  Can only be set to use standard baud rates corresponding to supported rates of the
+  parent serial device. If the standard MIDI baud of 31.25 kBaud is needed
+  (as would be the case if interfacing with arbitrary external MIDI devices),
+  configure the clocks of the parent serial device so that a requested baud of 38.4 kBaud
+  resuts in the standard MIDI baud rate, and set the 'current-speed' property to 38400 (default)
+
+properties:
+  compatible:
+    const: serial-midi
+
+  current-speed:
+    description: Baudrate to set the serial port to when this MIDI device is opened.
+    default: 38400
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    serial@7e201400 {
+        midi {
+            compatible = "serial-midi";
+        };
+    };
+    serial@7e201600 {
+        midi {
+            compatible = "serial-midi";
+            current-speed = <115200>;
+        };
+    };
-- 
2.33.0

