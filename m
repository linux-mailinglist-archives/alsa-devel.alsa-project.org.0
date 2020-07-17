Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C4B223B15
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Jul 2020 14:04:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED2A71661;
	Fri, 17 Jul 2020 14:03:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED2A71661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594987458;
	bh=hnfgoxXELokVIBOU6Yk9wrMZ6yPHZP7whW1Z1bPSBMw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=WXgKpRmTzkor4rOYww9t/5Yga3EqWqcs2l44SNH5O/L6gVG7Q0pncJMLoXPoL2Xsd
	 TWDNtGWkvfjhW8VmQP/IjurFcbn2dTIs9RU4Q/jTDvaxUHCb606EHGQ54xo0M4GcSQ
	 1k+neZzKd63OFXFbd1Db0a10nS3uo2ieZ+68byco=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1DF65F8014E;
	Fri, 17 Jul 2020 14:02:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CCF8CF80217; Fri, 17 Jul 2020 14:02:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7B489F8014E
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 14:02:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7B489F8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Fiq88mJG"
Received: by mail-pj1-x1041.google.com with SMTP id md7so6272363pjb.1
 for <alsa-devel@alsa-project.org>; Fri, 17 Jul 2020 05:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L3pqPBmqTtCeYXo5oFQYdRCBTjDx4yuoNDp8LIqBhrc=;
 b=Fiq88mJGxvol+DfakU3u1Vx74pRzPYj7T7rmvxTYQ0R6XbPjlDyufuGXHO11rL4Aqu
 cxkaKvAndUauNZlZy+N01asDPJLjTFxRqEo+fYpTFPtizdn6V5RKvdsdvaukmq4Y5Wfg
 WhBvEwK69Z286KKGEqm/S0i9dtloZWeu2N070=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L3pqPBmqTtCeYXo5oFQYdRCBTjDx4yuoNDp8LIqBhrc=;
 b=pjK4r/2E2msiebINB0W+10j3XLtWJ6pB/IqEQiwvs+GhZebWr57bxXx0LDURiyAk20
 /xUILrftN1ZamrbUdMh4HU2nhYgxFPYRWAwf/ujwgo3AJSlIFN+HfEDZpf/dff1YB5QT
 Rn1mkOGx49/chhFxRmhcAGOjwLK6w44zR9uo3VShJCmEfGFiMRz+thnSoXMrHbHwJXNY
 4Aara7B0bWvxzlm+NgF4rY12vlqMYY8kdnZrLuE2GAixLFE5lHJxZN5JHkkVfqVvTdEY
 Q7O9x2hfiAgA8tnzs2UBGBJaojIxU2i53MxeVpOUBUS3Gk8WRspr2J1oBOYnF7rO6Y2E
 gVQQ==
X-Gm-Message-State: AOAM533xwTPUrRt43SzB++iFw8o5GyU0rzD+7HIYD91+EdZ5dXAmflA+
 Lc4iUOa4kSPdoeqK1LOh5ixusg==
X-Google-Smtp-Source: ABdhPJzC5HAlXulCQHydsosvZqKgOL2r1Sq7g4jGNcgmX3dlnIzS0V0GhWvXYW2BuiohLAxnovDWvg==
X-Received: by 2002:a17:90a:1748:: with SMTP id
 8mr9068453pjm.131.1594987342798; 
 Fri, 17 Jul 2020 05:02:22 -0700 (PDT)
Received: from localhost ([2401:fa00:1:10:de4a:3eff:fe7d:d39c])
 by smtp.gmail.com with ESMTPSA id c188sm7770179pfc.143.2020.07.17.05.02.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 05:02:21 -0700 (PDT)
From: Cheng-Yi Chiang <cychiang@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] ASoC: qcom: dt-bindings: Add sc7180 machine bindings
Date: Fri, 17 Jul 2020 20:02:06 +0800
Message-Id: <20200717120207.3471030-1-cychiang@chromium.org>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Taniya Das <tdas@codeaurora.org>, devicetree@vger.kernel.org,
 tzungbi@chromium.org, Banajit Goswami <bgoswami@codeaurora.org>,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, Mark Brown <broonie@kernel.org>,
 dianders@chromium.org, dgreid@chromium.org,
 linux-arm-kernel@lists.infradead.org, Cheng-Yi Chiang <cychiang@chromium.org>
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

Add devicetree bindings documentation file for sc7180 sound card.

Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
---
 .../bindings/sound/qcom,sc7180.yaml           | 123 ++++++++++++++++++
 1 file changed, 123 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml

diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
new file mode 100644
index 000000000000..d60d2880d991
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
@@ -0,0 +1,123 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
+
+maintainers:
+  - Rohit kumar <rohitkr@codeaurora.org>
+  - Cheng-Yi Chiang <cychiang@chromium.org>
+
+description: |
+  This binding describes the SC7180 sound card, which uses LPASS for audio.
+
+definitions:
+
+  link-name:
+    description: Indicates dai-link name and PCM stream name.
+    $ref: /schemas/types.yaml#/definitions/string
+    maxItems: 1
+
+  dai:
+    type: object
+    properties:
+      sound-dai:
+        maxItems: 1
+        $ref: /schemas/types.yaml#/definitions/phandle-array
+        description: phandle array of the codec or CPU DAI
+
+    required:
+      - sound-dai
+
+  unidirectional:
+    description: Specify direction of unidirectional dai link.
+                 0 for playback only. 1 for capture only.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
+properties:
+  compatible:
+    contains:
+      enum:
+        - qcom,sc7180-sndcard
+
+  audio-routing:
+    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
+    description: |-
+      A list of the connections between audio components. Each entry is a
+      pair of strings, the first being the connection's sink, the second
+      being the connection's source.
+
+  model:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: User specified audio sound card name
+
+patternProperties:
+  "^dai-link-[0-9]+$":
+    description: |
+      Each subnode represents a dai link. Subnodes of each dai links would be
+      cpu/codec dais.
+
+    type: object
+
+    properties:
+      link-name:
+        $ref: "#/definitions/link-name"
+
+      unidirectional:
+        $ref: "#/definitions/unidirectional"
+
+      cpu:
+        $ref: "#/definitions/dai"
+
+      codec:
+        $ref: "#/definitions/dai"
+
+    required:
+      - link-name
+      - cpu
+      - codec
+
+    additionalProperties: false
+
+examples:
+
+  - |
+    snd {
+        compatible = "qcom,sc7180-sndcard";
+        model = "sc7180-snd-card";
+
+        pinctrl-names = "default";
+        pinctrl-0 = <&sec_mi2s_active &sec_mi2s_dout_active
+                     &sec_mi2s_ws_active &pri_mi2s_active
+                     &pri_mi2s_dout_active &pri_mi2s_ws_active
+                     &pri_mi2s_din_active &pri_mi2s_mclk_active>;
+
+        audio-routing =
+                    "Headphone Jack", "HPOL",
+                    "Headphone Jack", "HPOR";
+
+        dai-link-0 {
+            link-name = "MultiMedia0";
+            cpu {
+                sound-dai = <&lpass_cpu 0>;
+            };
+
+            codec {
+                sound-dai = <&alc5682 0>;
+            };
+        };
+
+        dai-link-1 {
+            link-name = "MultiMedia1";
+            unidirectional = <0>;
+            cpu {
+                sound-dai = <&lpass_cpu 1>;
+            };
+
+            codec {
+                sound-dai = <&max98357a>;
+            };
+        };
+    };
-- 
2.28.0.rc0.105.gf9edc3c819-goog

