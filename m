Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E50E520094
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 17:01:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B250318FA;
	Mon,  9 May 2022 17:00:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B250318FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652108480;
	bh=pi/VEgn5+4zxRtZNOd+2PTjfmsVaqSDLK7OLHX/sgbc=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Yhc29PP552xvPQBjxWamaYdiYZNrwuws4v1qnW0BOSU3dCIyblIIE6FFKcFE2Qy/w
	 hRnFAy6A6Sy4xx/QRUnAUcqiHViPZDFmC1CRdmqVqNCl00DaDI3GAcocEmSzN2AOzG
	 xZ8Sndo3GWhiSCN+mKkl/VbX4DqMy9DFhyuBE2vY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D6E8DF804A9;
	Mon,  9 May 2022 16:59:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C46C0F8047B; Mon,  9 May 2022 16:59:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com
 [IPv6:2607:f8b0:4864:20::12c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7EA20F8014C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 16:59:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EA20F8014C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="baK4GQ6M"
Received: by mail-il1-x12c.google.com with SMTP id r17so9453750iln.9
 for <alsa-devel@alsa-project.org>; Mon, 09 May 2022 07:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xCWqExzmXwWnjdQ7B13SNGOPxduy3/5fQccMCg15+0I=;
 b=baK4GQ6Mfz2zIMwGNyc09GXC9h7GScbU32wjeivM6ObuNialUKfwQKQDgdc92WAkdp
 xlfJIsgqxIPoycT4u720rCgPnlriFqiFySIkYVLZq7H6fVGYOKny2PtjsrWMktQGrxjJ
 Z8aKxFl8VpTGRkUQxKC0cgcK6romyXa4JZHP2wQjKy/8njdH9TwHwyaS5PdMSJqcYbv4
 qOndiGRf6t+GwZZfMlGLwruLIJzsBza14NwOggFEkWSRo91LapSHCVmQVvuvj+u7AmEw
 A4mqm9Fck3M12BOzbVRW7IO7liAmlptJHhL9ggsUrAvIkG4HUUw6GtkkGzZXY+n9FuBG
 oZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xCWqExzmXwWnjdQ7B13SNGOPxduy3/5fQccMCg15+0I=;
 b=56Mnm2/5xrvGWlpSGQtUqq8rWSCNIDDbU/8v3hfikTvPsJOMO/F36RRythA4Y++hVZ
 nTtU4wovY1QoCTpQonpgwqqYHD1h3b9otUjrJotb/nZiEDXYritvJeHeBCocoen5ydY1
 G//xUkHikod85Msmpyh4cL7X8FbC4qLjiezO+YiY/xv6CUwdc8SuJYfbQ7UQGjibSSJE
 WHAWdSAXixIAvk6JYM8Y99wJMWJyXdYO7Oyz+xoIJ0D/IfXuYRw4IJT2fFCZuTLCvAzT
 2VMmiKvcXRAp8w89yp0lpcesvKBBmC50lLwJeUun6XBRRGgxnV2ercOpKTRKYqUKZqvg
 KC/g==
X-Gm-Message-State: AOAM531uFD13AnWBWwUnxpmFdijdcHnAyEBwwkiASWiF+Vyytn6eMaSC
 dQjKrLzsQnX4Wx/urSLqf+4=
X-Google-Smtp-Source: ABdhPJyQkdfdx7AtvylBcaBMPx66ygF9/OVth/6zW1asF7juD+04WEyIz9NGNuq6Yro8o/sNbiWkcQ==
X-Received: by 2002:a92:d348:0:b0:2cf:8c5d:2c9a with SMTP id
 a8-20020a92d348000000b002cf8c5d2c9amr5107507ilh.177.1652108382246; 
 Mon, 09 May 2022 07:59:42 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-29-252-111.wi.res.rr.com.
 [65.29.252.111]) by smtp.gmail.com with ESMTPSA id
 p18-20020a02b892000000b0032b3a7817c1sm3664414jam.133.2022.05.09.07.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 07:59:41 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com,
	robh@kernel.org
Subject: [PATCH v7 1/2] dt-bindings: sound: Add generic serial MIDI device
Date: Mon,  9 May 2022 09:59:32 -0500
Message-Id: <20220509145933.1161526-2-kaehndan@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220509145933.1161526-1-kaehndan@gmail.com>
References: <20220509145933.1161526-1-kaehndan@gmail.com>
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
 .../bindings/sound/serial-midi.yaml           | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/serial-midi.yaml

diff --git a/Documentation/devicetree/bindings/sound/serial-midi.yaml b/Documentation/devicetree/bindings/sound/serial-midi.yaml
new file mode 100644
index 000000000000..4afc29376efc
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/serial-midi.yaml
@@ -0,0 +1,51 @@
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
+    serial {
+        midi {
+            compatible = "serial-midi";
+        };
+    };
+  - |
+    serial {
+        midi {
+            compatible = "serial-midi";
+            current-speed = <115200>;
+        };
+    };
-- 
2.33.0

