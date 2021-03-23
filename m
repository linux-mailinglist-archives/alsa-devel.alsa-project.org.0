Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAA634697F
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Mar 2021 21:01:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F3EB1674;
	Tue, 23 Mar 2021 21:00:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F3EB1674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1616529704;
	bh=Cdmvjoi2EOCJwvw9N61FEhJIyAFDE9tm2y4H8PHrNPA=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=fPOsjfM7vuugTxx58Vb2ELfp7HzCCOv7eYbYH7z/ZFrnlUBl0DjcoQjPiH8cmO10w
	 SMLE/h+wZ03uRqTFXrDSGPooxUq5mtUImMeDTx7hEa4pVXZPItiLjDv4/f19fFYOhY
	 PZb6ST6oqqzv2pExobHl1zH0Hfz9xIYiy4SBb5/k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EAA6FF80155;
	Tue, 23 Mar 2021 21:00:18 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 20F2DF8025F; Tue, 23 Mar 2021 21:00:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 02553F800EE
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 21:00:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 02553F800EE
Received: by mail-il1-f169.google.com with SMTP id r8so19281669ilo.8
 for <alsa-devel@alsa-project.org>; Tue, 23 Mar 2021 13:00:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2+gwQRwJup3xL0mb4hvSYNYdy7ZwaZULvsFMgTdxQKI=;
 b=I51R1JmSolNprTUNvO7ZPfqfYQB2LwbwduHinhId1Kyf4IgvxoqK9RUK4Plh1G9RH1
 JAT1kbXDXXCNd2Q0+9zCJtWivQmOWBjKVfHp5B7OwdnK3QKzqQKfXul3hlhJ3UrA8nVr
 4ghg5XrVVSb8gwqA75l1xWKnPaSAUVbFYThFABmA5eFGf1Ig/o4IbkEuZ7xumQ2MNgVs
 QHA7FGTMOzr3jdSinm7M8yIp7PH28cpIA1E4gg1pxJ/1YnEdUG+KmkS7mvn6Waue+QBL
 e5m+ReI+e+XfXIWz+sUjHJiteeEkg3loQVU68F+M4J7WxT+KUYvyFS32QlNH9SXMReWx
 ENfA==
X-Gm-Message-State: AOAM532XrEZDHdCL5T2N5oZZYFUXd56Q8dfOST3FI8Vv2lxCe09URPAO
 89JlC7IiPEzaculcNmABDg==
X-Google-Smtp-Source: ABdhPJxWk785Y6kqJD0UsIL60c05TtY//Srf33pd4qaDjuUZKvywgeZNaFjKz60gvS9yXWkKir9BwQ==
X-Received: by 2002:a92:c24c:: with SMTP id k12mr6327880ilo.282.1616529607734; 
 Tue, 23 Mar 2021 13:00:07 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.253])
 by smtp.googlemail.com with ESMTPSA id 13sm9766293ioz.40.2021.03.23.13.00.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 13:00:07 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: dt-bindings: nvidia,
 tegra210-ahub: Add missing child nodes
Date: Tue, 23 Mar 2021 14:00:05 -0600
Message-Id: <20210323200005.1196572-1-robh@kernel.org>
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
This patch ideally should be applied before this series[1].

[1] https://lore.kernel.org/r/20210323163634.877511-1-robh@kernel.org/

 .../bindings/sound/nvidia,tegra210-ahub.yaml         | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
index e568d6c7dddd..d7a5eb77ed4f 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra210-ahub.yaml
@@ -69,6 +69,18 @@ properties:
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
 required:
   - compatible
   - reg
-- 
2.27.0

