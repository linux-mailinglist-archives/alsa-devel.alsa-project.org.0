Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BAC34AF96
	for <lists+alsa-devel@lfdr.de>; Fri, 26 Mar 2021 20:51:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B95A1167B;
	Fri, 26 Mar 2021 20:50:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B95A1167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616788306;
	bh=LTiXVpceQNtwSuUiR2PZ8oHN1aHkanMzMat31tiwcK4=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=vgQpXSepxsIlh8cD3HBo7e+ucwfsAUkGGR3yjblGaKecb2xBqwuTGYDVfzuNo08KE
	 RRP6zi1Eu4GrjdDww4QmTp/K9fUYjyqlWjiIEbLcK8TEnPeLeWCK2pspD/bpNyBF0f
	 2yeHdf7By91L6mlABX6wKNLRIU2U/nki5dAogm3Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EC0C0F801D5;
	Fri, 26 Mar 2021 20:50:19 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3C6D3F8016B; Fri, 26 Mar 2021 20:50:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B1756F800D0
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 20:50:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B1756F800D0
Received: by mail-io1-f42.google.com with SMTP id f19so6593078ion.3
 for <alsa-devel@alsa-project.org>; Fri, 26 Mar 2021 12:50:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QMADa3hLSWQ6fsdPZyxglXagkduiht0CfsajenFjEE8=;
 b=aDX4W5GD2g2xmqImdRvWcXsurDB7MIs/MUbHi6lpjOwOy1eGGe6OKF/po8wT1Q7mkG
 Lsd2Ej0cFYX99ceEm0vhuPomU+xHPHK6RgJSlx2lxVBicJM0ISk3ue1o8j+cgpfx0qph
 WzsAZcdrEX717Fa0kUz5MQl+gskWW/T9W7TtZUJ0UsAbl9ckng+Zc1s+MtpSx9yjEdLD
 mpYrk541NKwFkvuvN4+aEq8Muh6ojBQvGEOdgsaJPk63WPmYcaDXVrn3fhsP5eAU+a5x
 XVpB0u0GzkhXQ6mKb7uVXyHvNOLLb3hk288VgmAFZkgDGp78DLk/XBsUm/iaDoH2XTpG
 A0kw==
X-Gm-Message-State: AOAM53014B68bbAlIcNe6UUOKvR8CHUaBOdiHm8jVOlBCub7hkUjcydB
 I90Ib3vOF/DlTm2uYmeQlw==
X-Google-Smtp-Source: ABdhPJx+B5BxlFABLodj85dQF/ZfrrYTvXbR1H6ArMkSNfY0AO+aQiPUFwiyecNqyYOc/2oHUxRoVw==
X-Received: by 2002:a05:6638:2603:: with SMTP id
 m3mr13456452jat.64.1616788205884; 
 Fri, 26 Mar 2021 12:50:05 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
 by smtp.googlemail.com with ESMTPSA id h2sm4645441ioj.30.2021.03.26.12.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 12:50:05 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH v2] ASoC: dt-bindings: nvidia,
 tegra210-ahub: Add missing child nodes
Date: Fri, 26 Mar 2021 13:50:03 -0600
Message-Id: <20210326195003.3756394-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
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

The nvidia,tegra210-ahub binding is missing schema for child nodes. This
results in warnings if 'additionalProperties: false' is set (or when the
tools implement 'unevaluatedProperties' support). Add the child nodes
and reference their schema if one exists.

Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: Sameer Pujar <spujar@nvidia.com>
Cc: alsa-devel@alsa-project.org
Cc: linux-tegra@vger.kernel.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
v2:
 - Also add 'dspk' child node

This patch ideally should be applied before this series[1].

[1] https://lore.kernel.org/r/20210323163634.877511-1-robh@kernel.org/
---
 .../bindings/sound/nvidia,tegra210-ahub.yaml     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index e568d6c7dddd..1118a9488345 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -69,6 +69,22 @@ properties:
         $ref: audio-graph-port.yaml#
         unevaluatedProperties: false
 
+patternProperties:
+  '^i2s@[0-9a-f]+$':
+    type: object
+
+  '^dmic@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra210-dmic.yaml#
+
+  '^admaif@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra210-admaif.yaml#
+
+  '^dspk@[0-9a-f]+$':
+    type: object
+    $ref: nvidia,tegra186-dspk.yaml#
+
 required:
   - compatible
   - reg
-- 
2.27.0

