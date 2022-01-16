Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1E348FA3C
	for <lists+alsa-devel@lfdr.de>; Sun, 16 Jan 2022 03:05:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B21B9180F;
	Sun, 16 Jan 2022 03:04:34 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B21B9180F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1642298724;
	bh=LVtSDqhTlMd0ZeB3E3M0q97IgjB8OzIC/ElHh/a3NIo=;
	h=In-Reply-To:References:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TTxFVBFHhN8cwXiOhSZ3H+KqimnhXPCea9xmSMceuara2BMP+6lWqsMk187xbfGSA
	 BpkDj9v0QTIELWDJcUzF7AMkcODkAow+R79FqpOYnbzgKYGUHzkXvO+ap6X9hgh5bI
	 7UW0KaZCn3JpRum2cw2trE6X+IvoPH7Y2V8N0j6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D3E9DF80516;
	Sun, 16 Jan 2022 03:03:50 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3D813F80515; Sun, 16 Jan 2022 03:03:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07931F800B0
 for <alsa-devel@alsa-project.org>; Sun, 16 Jan 2022 03:03:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07931F800B0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=igorinstitute-com.20210112.gappssmtp.com
 header.i=@igorinstitute-com.20210112.gappssmtp.com header.b="ChDGSDgE"
Received: by mail-pl1-x633.google.com with SMTP id a7so13878481plh.1
 for <alsa-devel@alsa-project.org>; Sat, 15 Jan 2022 18:03:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igorinstitute-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:in-reply-to:references:from:date:subject:to:cc;
 bh=ff4sAy6O0hQSoqvnQZ8q3cMuMe1q1w8oq5fvcMe7gHk=;
 b=ChDGSDgE0vp41yRuvawLLum8LS9T59WSDYXqaBpAQu3fsgcmtQKdjnnuQx7CtY1/AQ
 BP9a4WfSRt2u8JJ33ysVu5VR5Yxuo+1dlXQjhxk7bidcnSB5QsY4vHxhlxmfMICWi46b
 Tykhn4D6yP7CBpC0Wo2LlQd3sylpxjlvIxppQ9Eg0kVBr+fHOB0odXUzFyXIoqpgyvIL
 MkiNEQ9PCU+FswnK4DBaIwdXVrIxpDvfJ0DY2Hq3PUmqYAFkQP9Ekhwy+y8p00Grdwwt
 urajfZjzEJB61H+jbwfCDQuqW6oTbpd76aeFSQ3Si4RkTDPa9JYqh+Ol7fSwsKX6oRST
 /pOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:in-reply-to:references:from:date
 :subject:to:cc;
 bh=ff4sAy6O0hQSoqvnQZ8q3cMuMe1q1w8oq5fvcMe7gHk=;
 b=bUZKLceC36xgMXvl2Ay1s6+jVin1eiPiAkQeWpyeTM0LEWO8zjXOAvdm3NyaLxTEF3
 sVFP+maCJo/atNyBMyshzKKwzyNb5UxHY6+8hIMaPmd9+ZMzr7HLn0tq6sRzyJtkY2Nk
 fsuZF7RULrEdxoP5vrqP0O+o4CmYZoCdaRqDYGnK58URUug2aZp0ztRYt4tdxVSegHx7
 O3nbZ7XKWb7Ia8IkvuF+07BVssYu+td5b6ZI2/1XckiTc0pn/aV6y15txWnXV43j8q6i
 Ecgbu5+4cUsL5P7lSROjYQ0pZ0OljACKjxkRhrrid9xdppa7Om0ttfbF77eUxOypZx2m
 BUKg==
X-Gm-Message-State: AOAM531I4x+rgBd4tCdx7TXlNAij5csFKX0eNP/xNM2JaOlSCvNATONS
 KeZ08pJ5ieehMuZRfTzsF+sOv1qP/eEdHsml
X-Google-Smtp-Source: ABdhPJzJakvgX8A54M9pAxRgPqmDQvVbSfYjsv0RiB6ep12cXjXHZvw+0XXkdoxHtYXPjvAXfeXA5w==
X-Received: by 2002:a17:90a:d184:: with SMTP id
 fu4mr27984577pjb.26.1642298620091; 
 Sat, 15 Jan 2022 18:03:40 -0800 (PST)
Received: from localhost ([121.99.145.49])
 by smtp.gmail.com with ESMTPSA id h1sm9404858pfi.109.2022.01.15.18.03.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 18:03:39 -0800 (PST)
Message-Id: <e271d381dcf1c6036a2a22bab6ab72654455aa58.1642298336.git.daniel.beer@igorinstitute.com>
In-Reply-To: <cover.1642298336.git.daniel.beer@igorinstitute.com>
References: <cover.1642298336.git.daniel.beer@igorinstitute.com>
From: Daniel Beer <daniel.beer@igorinstitute.com>
Date: Sun, 16 Jan 2022 14:56:27 +1300
Subject: [PATCH v3 2/2] ASoC: dt-bindings: add bindings for TI TAS5805M.
To: alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: Daniel Beer <daniel.beer@igorinstitute.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Andy Liu <andy-liu@ti.com>, Mark Brown <broonie@kernel.org>,
 Derek Simkowiak <derek.simkowiak@igorinstitute.com>
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

The TAS5805M is a class D speaker amplifier with integrated DSP.
Configuration must be generated by TI's PPC3 tool and supplied as a
firmware image.

Signed-off-by: Daniel Beer <daniel.beer@igorinstitute.com>
---
 .../devicetree/bindings/sound/tas5805m.yaml   | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/tas5805m.yaml

diff --git a/Documentation/devicetree/bindings/sound/tas5805m.yaml b/Documentation/devicetree/bindings/sound/tas5805m.yaml
new file mode 100644
index 000000000000..3aade02d8a96
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/tas5805m.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/tas5805m.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TAS5805M audio amplifier
+
+maintainers:
+  - Daniel Beer <daniel.beer@igorinstitute.com>
+
+description: |
+  The TAS5805M is a class D audio amplifier with a built-in DSP.
+
+properties:
+  compatible:
+    enum:
+      - ti,tas5805m
+
+  reg:
+    maxItems: 1
+    description: |
+      I2C address of the amplifier. See the datasheet for possible values.
+
+  pvdd-supply:
+    description: |
+      Regulator for audio power supply (PVDD in the datasheet).
+
+  pdn-gpios:
+    description: |
+      Power-down control GPIO (PDN pin in the datasheet).
+
+  ti,dsp-config-name:
+    description: |
+      The name of the DSP configuration that should be loaded for this
+      instance. Configuration blobs are sequences of register writes
+      generated from TI's PPC3 tool.
+    $ref: /schemas/types.yaml#/definitions/string
+
+examples:
+  - |
+    i2c0 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        tas5805m: tas5805m@2c {
+                reg = <0x2c>;
+                compatible = "ti,tas5805m";
+
+                pvdd-supply = <&audiopwr>;
+                pdn-gpios = <&tlmm 160 0>;
+
+                ti,dsp-config-name = "mono_pbtl_48khz";
+        };
+    };
+
+additionalProperties: true
-- 
2.30.2

