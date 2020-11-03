Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D972A3AB4
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 03:55:56 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9C8C41752;
	Tue,  3 Nov 2020 03:55:04 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9C8C41752
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604372154;
	bh=8jFFfd5FZlXfJQQ/XS4ynI7hHnjF99N8OxZP9RrXIoA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=H+Mlg8YbIGvjkDatMvgozebzqLp1UysLByPhRm+iW1FSD49jB+2c6zjsfdx56SEtU
	 7dkA+ysR2RkyoJn6ox85pjsVQRFvY9dtOMDQkPcAojfQx8D7AJS07BG+DV2c2l61wH
	 8XRlrJyK3XWHADC+2vjKzL/uJY3RcvF/I6y61O98=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 929ECF802A9;
	Tue,  3 Nov 2020 03:54:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CDEDAF80171; Tue,  3 Nov 2020 03:54:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF0C5F80171
 for <alsa-devel@alsa-project.org>; Tue,  3 Nov 2020 03:54:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF0C5F80171
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="dB2pukbs"
Received: by mail-pf1-x432.google.com with SMTP id j18so12954452pfa.0
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 18:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
 b=dB2pukbsNMZr6KZVfAidMjwc3OoduhL5lmwZfkb91FaoDDkmRNth47SrrahktcKt7k
 i+KEcjV/NbvB4ZuRDRI/+xFdjrSTIp6R3PeJ09yBiNQJJZSK8Odcnmfo/AB7RcbtlX4E
 rlYO4ehQC9ZqfUhW5Mu5mWeh/EiHFUJ+YZ+g5Syv+kdROZScTLf+ZEsfIJH9rFzIHiI5
 JLStT8wkG6qBsLCaxBNlZko8V3aLXqPpZU4W8r2fL6lojMdxISuOOeodqNkbyusbG7Rz
 GzU5vo+DjIkHKywiW7QfWabHyWouxmJioSiORsK+BBsCXSOI+Cz5kAz4W2vy2iL/v4Ak
 QUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mdVPkO/q4ig27b41Ma0ipj3qPAj1LWAThPCU+KMAntY=;
 b=HC02vJjALiw+QG3jkgEzjJ7bLMZJud9w+sAGp7YqvEuuggTKQCJVBh3egUSF0hbcrF
 hc1+dgrRYqrsTnU4amDYFCCYadxIWTCATSBYoULsMdt54HHqzSk4E+5F7ElvoeEmxYvv
 lyCn898LwUKJGxZmEwF51cJkJrU4svtfyFaAhNPsQDttEkW1jGtVOgXccgZmOwPlj5mH
 UAv6pgOeNGInkVJNw3Fa9gRoZi9v2RPoQclC5cDoKZV3+muRrS34wA3a/C8d9LOgl4mk
 Jbl18tj8V/PGAwhAbt/X0HMqSfnDiY6z6IEoG4ZsIFj8jaeRDe2uyX1SwxIJGzcIi6Nj
 YLxA==
X-Gm-Message-State: AOAM533fwVmd7FsbZCBB9EE1bO2u0/I6qYKSrBLeG8eZ/PVZaevWBc+Y
 TUIX40oCxjQLrCfUNQj9JEw=
X-Google-Smtp-Source: ABdhPJwigCQyZXVpZJRNCBT08Fbeo55lCagCxh1R/LyqYJuB7rPcp9zkcGmx63moqL7nZaJrqLGl0w==
X-Received: by 2002:a17:90b:3587:: with SMTP id
 mm7mr1464936pjb.234.1604372046783; 
 Mon, 02 Nov 2020 18:54:06 -0800 (PST)
Received: from localhost (114-34-18-97.HINET-IP.hinet.net. [114.34.18.97])
 by smtp.gmail.com with ESMTPSA id t15sm937012pji.0.2020.11.02.18.54.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 18:54:06 -0800 (PST)
From: Ajye Huang <ajye.huang@gmail.com>
X-Google-Original-From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] ASoC: google: dt-bindings: modify machine bindings for
 two MICs case
Date: Tue,  3 Nov 2020 10:53:46 +0800
Message-Id: <20201103025347.510940-2-ajye_huang@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201103025347.510940-1-ajye_huang@compal.corp-partner.google.com>
References: <20201103025347.510940-1-ajye_huang@compal.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: dianders@chromium.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, Banajit Goswami <bgoswami@codeaurora.org>,
 Srinivasa Rao Mandadapu <srivasam@codeaurora.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-msm@vger.kernel.org,
 Patrick Lai <plai@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Rohit kumar <rohitkr@codeaurora.org>, tzungbi@chromium.org,
 srinivas.kandagatla@linaro.org, linux-arm-kernel@lists.infradead.org,
 cychiang@chromium.org
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

Add a property "dmic-gpios" for switching between two MICs.

Signed-off-by: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
---
 .../bindings/sound/google,sc7180-trogdor.yaml | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
index efc34689d6b5..9e0505467e57 100644
--- a/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
+++ b/Documentation/devicetree/bindings/sound/google,sc7180-trogdor.yaml
@@ -34,6 +34,9 @@ properties:
   "#size-cells":
     const: 0
 
+  dmic-gpios:
+    description: GPIO for switching between DMICs
+
 patternProperties:
   "^dai-link(@[0-9])?$":
     description:
@@ -81,6 +84,7 @@ additionalProperties: false
 examples:
 
   - |
+    //Example 1
     sound {
         compatible = "google,sc7180-trogdor";
         model = "sc7180-rt5682-max98357a-1mic";
@@ -128,3 +132,57 @@ examples:
             };
         };
     };
+
+  - |
+    //Example 2 (2mic case)
+    sound {
+        compatible = "google,sc7180-trogdor";
+        model = "sc7180-rt5682-max98357a-2mic";
+
+        audio-routing =
+                    "Headphone Jack", "HPOL",
+                    "Headphone Jack", "HPOR";
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dmic-gpios = <&tlmm 86 0>;
+
+        dai-link@0 {
+            link-name = "MultiMedia0";
+            reg = <0>;
+            cpu {
+                sound-dai = <&lpass_cpu 0>;
+            };
+
+            codec {
+                sound-dai = <&alc5682 0>;
+            };
+        };
+
+        dai-link@1 {
+            link-name = "MultiMedia1";
+            reg = <1>;
+            cpu {
+                sound-dai = <&lpass_cpu 1>;
+            };
+
+            codec {
+                sound-dai = <&max98357a>;
+            };
+        };
+
+        dai-link@2 {
+            link-name = "MultiMedia2";
+            reg = <2>;
+            cpu {
+                sound-dai = <&lpass_hdmi 0>;
+            };
+
+            codec {
+                sound-dai = <&msm_dp>;
+            };
+        };
+    };
+
+...
-- 
2.25.1

