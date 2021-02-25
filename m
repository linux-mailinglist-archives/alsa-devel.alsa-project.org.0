Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D452F32552E
	for <lists+alsa-devel@lfdr.de>; Thu, 25 Feb 2021 19:09:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 735FA167F;
	Thu, 25 Feb 2021 19:08:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 735FA167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1614276566;
	bh=epooql0FMpO3WipZpYM8q3+kN511KeDs0sQiMlQLkXY=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UlpEM04gya+2KYw+SHDX0s8ILG+WreOdVCZ6CfDQYhx2WDFxPyOn/577dR2s0GsQl
	 Dj0d6DzKx+jxmBWzu0hZodOURmmkvy+BhF4XsjGKS9OGSjw5sQKYDD5t9W+krB1PKK
	 OIkj0WiAu2I3QjAt2E28WVvDYTpvcHsHNY2+bIxE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 27C50F80159;
	Thu, 25 Feb 2021 19:07:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A055F802E3; Thu, 25 Feb 2021 19:07:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 53C4BF802D2
 for <alsa-devel@alsa-project.org>; Thu, 25 Feb 2021 19:06:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53C4BF802D2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="Qj6u+1Pv"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B6037e7340001>; Thu, 25 Feb 2021 10:06:44 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Feb
 2021 18:06:44 +0000
Received: from audio.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 25 Feb 2021 18:06:41 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <broonie@kernel.org>, <robh@kernel.org>
Subject: [RFC PATCH 3/5] ASoC: audio-graph-card: Add bindings for sysclk and
 pll
Date: Thu, 25 Feb 2021 23:36:02 +0530
Message-ID: <1614276364-13655-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614276364-13655-1-git-send-email-spujar@nvidia.com>
References: <1614276364-13655-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1614276404; bh=9ywFTvkZa5lV3oP3sSlaxK8fYTSk9Azn5gp12WflYbY=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=Qj6u+1PvzAC8CJJTxccDuj8mUtADkD1O1knBKonobjhCb55KhvR6Y4u1SL7K9D9HR
 wga4vy8FOYy5+kqukd/ferK5IYIPCvoX+YgWS/BkqqLgQmgeAkH+hRJFjKoBLZbcrn
 uF/TJl0UmXUKplNpKq9wQVnZF34dQ1s1PbK6h+1hI3QkOWrEG9DL17x+heAnwgTpY1
 DLybd+5UkVt0NzFl7cmHe/5TEKHQDk7X93dGKxAhROS4aM7pa3HshhxwNN85Iu9KQm
 MnLqzxFspfZZiJeQ+FR32RV9xQDzQGQvMq2VMTCLLaTR80arQqdSl+up4shNzfg583
 cnYxLXWFtNvkg==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 kuninori.morimoto.gx@renesas.com, Sameer Pujar <spujar@nvidia.com>,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com
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

ASoC core provides callbacks snd_soc_dai_set_sysclk() and
snd_soc_dai_set_pll() for system clock (sysclk) and pll configurations
respectively. Add bindings for flexible sysclk or pll configurations
which can be driven from CPU/Codec DAI or endpoint subnode from DT.
This in turn helps to avoid hard codings in driver and makes it more
generic.

Also add system-clock related bindings, "system-clock-direction-out"
and "system-clock-frequency", which are already supported.

Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Rob Herring <robh@kernel.org>
Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../bindings/sound/audio-graph-port.yaml           | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
index 766e910..4f50291 100644
--- a/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
+++ b/Documentation/devicetree/bindings/sound/audio-graph-port.yaml
@@ -71,6 +71,77 @@ properties:
             description: CPU to Codec rate channels.
             $ref: /schemas/types.yaml#/definitions/uint32
 
+          system-clock-frequency:
+            description: |
+              Specify system clock (sysclk) frequency for CPU or Codec
+              component. Or if a clock is specified in the CPU or Codec
+              device node and a scaling factor is given with "mclk-fs",
+              sysclk will be calculated as a multiple of stream sample
+              rate and "mclk-fs". The rate is updated when stream starts.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          system-clock-direction-out:
+            description: |
+              Specifies clock direction as "out" on initialization. It
+              is useful for some CPUs with fixed clocks.
+            $ref: /schemas/types.yaml#/definitions/flag
+
+          system-clock-id:
+            description: |
+              CPU or Codec component may have multiple clocks. A specific
+              clock may have to be configured. In such cases the clock
+              ID needs to be specified.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          system-clock-source:
+            description: |
+              CPU or Codec component may have multiple sources for its
+              system clock (sysclk). In such cases the sysclk source
+              needs to be specified.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          pll-id:
+            description: |
+              Specify PLL that needs to be configured. This is useful
+              when the CPU or Codec component has multiple PLLs.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          pll-source:
+            description: |
+              When PLL has multiple reference clock sources, the exact
+              source needs to be specified for the required configuration.
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          pll-input-reference:
+            description: |
+              Specify how to calculate input frequency for the PLL.
+              Depending on the identifier, input frequency can be
+              calculated at runtime. For example if I2S bit clock is used
+              as reference, rate depends on actual PCM parameters (rate,
+              channels and bits) during an audio session. If a fixed rate
+              is used, then "pll-input-frequency" can be used instead.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            const: 2
+
+          pll-input-frequency:
+            description: Specify fixed input frequency
+            $ref: /schemas/types.yaml#/definitions/uint32
+
+          pll-output-reference:
+            description: |
+              Specify how to calculate output frequency for the PLL.
+              Depending on the identifier, output frequency can be
+              calculated at runtime. If output clock is used for MCLK purpose,
+              then it may depend on "mclk-fs" scale factor. In such cases it
+              needs to be calculated at runtime. If a fixed output frequency
+              is needed, then "pll-output-frequency" can be used instead.
+            $ref: /schemas/types.yaml#/definitions/uint32
+            const: 1
+
+          pll-output-frequency:
+            description: Specify fixed output frequency
+            $ref: /schemas/types.yaml#/definitions/uint32
+
   ports:
     description: multi OF-Graph subnode
     type: object
-- 
2.7.4

