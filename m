Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3076450E7BC
	for <lists+alsa-devel@lfdr.de>; Mon, 25 Apr 2022 20:03:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C69F81832;
	Mon, 25 Apr 2022 20:02:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C69F81832
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1650909781;
	bh=AbXGYEFlRBTblefyfIOP4l5sUYFbWKm5TzLhnn3ShkQ=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YtWJkb6NqHVDOWWUcI04TuBGG0Luq1432shbKQZCbNF6r8wlc91zJpWTwMQqd2Trh
	 fin5MEw6gh1U2z7qEUIr1xwFxdmpXn8qBvbajcdnlZRR+aQ2ImnBlRZV88995mHY6J
	 TSNXr3QNe1xtIQ9BnLRJBKKE3bIT0nViEMgd9eCk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12A4BF8050F;
	Mon, 25 Apr 2022 20:01:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5F07F8050F; Mon, 25 Apr 2022 20:01:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7CF31F80152
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 20:01:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7CF31F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="oAPFU3DB"
Received: by mail-il1-x133.google.com with SMTP id g10so1830800ilf.6
 for <alsa-devel@alsa-project.org>; Mon, 25 Apr 2022 11:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oIpXQOczTIQ/O1VLgkg45A/f+SkXi92vGgGc35m3jEE=;
 b=oAPFU3DBgJAYT5Kw1WGNSxLDubdRb4++zYbD2kWMXuoSWMPGOszK+v/C88K7qPDNzr
 8CrU/OYmSjmnMpana2PB/F7n8qljdRt2FBsLOv/K7XBsf2c1TldF9GOrX1RGtlI7VhZA
 kG25H19czK9o4WmdVH5UGNWy6ipv6CGHQYTx6MR07rUke2EETxqqHB9dlfccCIAj3m0I
 0OZ6HzUHCoedSjQxZdN17UPEuAma83JXvh+WjVzePOHn/mvmMj9fCg9Q+AQmoTD+AtbT
 vCAPB5L0N5+MmFPMPU9LsxJK4UlyYo9RtegtnLGBbSaLP9mRiTc3JP5rWqti7hDF5P8G
 M1GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oIpXQOczTIQ/O1VLgkg45A/f+SkXi92vGgGc35m3jEE=;
 b=5oeQ7Rk/n/K5TLKg5Toicib1SoQYe4cQGvgmCRj8f6tiooLq5PIIo35PgXp+2d7Env
 DwReD+ssyCKwLHAUfFol+9MlYiEnbQId15kXgRDE0IWmtqQI6MRvd9b8G0oiSLmza6qK
 NK3bWfLI0M6PuC/saIHe1HKJ5/1HYetay/qp71W8xc+XpRqHzSh2/BaztuvdmCbWZV0G
 ta26gUznYrSm0Fzk9LIy+W8sc2OGKtmlvqs24xd7eeUFMsCVzt3M96rZwrA402VwlJHo
 fU7kNYcH6/Xg3ndtrD0zWCpBMZHvG0Z/Qg9dGM3PXSr0BG/83I6DepR5TNg9Lvs2ww2P
 t+zg==
X-Gm-Message-State: AOAM531eWONqzNfGXxhFtE/4W5xsEj9Qvelvsbnz06qRmtQk8SRFgh3z
 2NCGcLbMQAv00nfU9M2quyg=
X-Google-Smtp-Source: ABdhPJwjGzMpGe/Oh7rEeky35gx80wwE7U7kvkfR9j/U2SLIAaKVcic4KbWBe3cdh0jrvTZ/twI32w==
X-Received: by 2002:a05:6e02:18c8:b0:2cd:8f11:e9ed with SMTP id
 s8-20020a056e0218c800b002cd8f11e9edmr3347082ilu.310.1650909684207; 
 Mon, 25 Apr 2022 11:01:24 -0700 (PDT)
Received: from localhost.localdomain (cpe-65-29-252-111.wi.res.rr.com.
 [65.29.252.111]) by smtp.gmail.com with ESMTPSA id
 a1-20020a923301000000b002cae7560bfesm6447379ilf.62.2022.04.25.11.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 11:01:23 -0700 (PDT)
From: Daniel Kaehn <kaehndan@gmail.com>
To: tiwai@suse.com
Subject: [PATCH v3 1/2] dt-bindings: sound: Add generic serial MIDI device
Date: Mon, 25 Apr 2022 13:01:14 -0500
Message-Id: <20220425180115.757247-2-kaehndan@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220425180115.757247-1-kaehndan@gmail.com>
References: <20220425180115.757247-1-kaehndan@gmail.com>
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

Adds dt-binding for snd-serial-generic serial MIDI driver

Signed-off-by: Daniel Kaehn <kaehndan@gmail.com>
---
 .../devicetree/bindings/sound/serialmidi.yaml | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/serialmidi.yaml

diff --git a/Documentation/devicetree/bindings/sound/serialmidi.yaml b/Documentation/devicetree/bindings/sound/serialmidi.yaml
new file mode 100644
index 000000000000..74f02a9e1190
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/serialmidi.yaml
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/serialmidi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Generic Serial MIDI Device
+
+maintainers:
+  - Daniel Kaehn <kaehndan@gmail.com>
+
+description: |
+  Generic MIDI interface using a serial device. Can only be set to use standard speeds
+  corresponding to supported baud rates of the underlying serial device. If standard MIDI
+  speed of 31.25 kBaud is needed, configure the clocks of the underlying serial device
+  so that a requested speed of 3.840 kBaud resuts in the standard MIDI baud rate.
+
+properties:
+  compatible:
+    const: serialmidi
+
+  speed:
+    maxItems: 1
+    description: |
+      Speed to set the serial port to when the MIDI device is opened.
+      If not specified, the underlying serial device is allowed to use its configured default speed.
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
+            compatible = "serialmidi";
+            speed = <38400>;
+        };
+    };
-- 
2.33.0

