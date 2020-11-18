Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 692102B782B
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Nov 2020 09:09:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F35FC17A8;
	Wed, 18 Nov 2020 09:08:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F35FC17A8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605686970;
	bh=T8Caerc1UfqfbAAoh0bZBJsJ1dpxHPluarQEr0v6mSo=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SMHLgWOAFqSNO+M2imjPd0zEcSOzw939JmT8NVKQIGMtqTHLeVmTWB9OsmGHcIhzp
	 urh7ZE5RuKJO539j3CHlobjgGzVY+GM+2ajx0BZCIKTPt8Kmg9nOZfGTtsp8mVSGhi
	 le+Sdfs2xVNdBoaW5u07+Pz1Qv0avnwd+v1RpUAE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0CABBF804BD;
	Wed, 18 Nov 2020 09:07:08 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8AE8BF804B1; Wed, 18 Nov 2020 09:07:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4465F800EE
 for <alsa-devel@alsa-project.org>; Wed, 18 Nov 2020 09:06:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4465F800EE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="ocKWrZos"
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5fb4d60a0000>; Wed, 18 Nov 2020 00:06:34 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 18 Nov
 2020 08:06:44 +0000
Received: from audio.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 18 Nov 2020 08:06:41 +0000
From: Sameer Pujar <spujar@nvidia.com>
To: <robh+dt@kernel.org>, <thierry.reding@gmail.com>, <broonie@kernel.org>
Subject: [PATCH 3/3] dt-bindings: tegra: Add missing HDA properties
Date: Wed, 18 Nov 2020 13:36:22 +0530
Message-ID: <1605686782-29469-4-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1605686782-29469-1-git-send-email-spujar@nvidia.com>
References: <1605686782-29469-1-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1605686794; bh=g6WzfzkxGm1Rrc/PS9d7uqmNnF/hATJUD1WCAcXHzoM=;
 h=From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
 References:MIME-Version:Content-Type;
 b=ocKWrZosAEr+oXyDNz64JWNL+ytD2HGQ/LePF+SpvAkSsiW/J6h71Mk0PCW3dynV+
 0F2NPhrRYYREh/Cut9/NUBUawQD1+d8d6NV/bbU3MDgt9+c2dLUs+/Il0VviB3T5Cm
 j8dUOdNu9hN31EtsBYd1wiyEfVPikO0LdDkDxOvni+89D6ZTxrEfXV2tgYcSLh/9JI
 K5bxVlTRu+JLPK9aIihxOmBUxiOK7x2Y1Vs89AZoZ6YvVxkyVqMT9/iEDjwYun4p5E
 Kfsp3ZOYQ4inoZPRSU4VeN+v217fRJx4uI++uTzkEgYXRZWMUJw+KBtfwFYv/pULkn
 fPGGDMO/W+auQ==
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Sameer Pujar <spujar@nvidia.com>, linux-kernel@vger.kernel.org,
 jonathanh@nvidia.com, linux-tegra@vger.kernel.org, sharadg@nvidia.com
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

Document the missing properties which are currently required for
Tegra186/Tegra194 DT files.

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
---
 .../devicetree/bindings/sound/nvidia,tegra30-hda.yaml      | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
index 3059bc3..e543a61 100644
--- a/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
+++ b/Documentation/devicetree/bindings/sound/nvidia,tegra30-hda.yaml
@@ -60,6 +60,20 @@ properties:
       - const: hda2hdmi
       - const: hda2codec_2x
 
+  power-domains:
+    maxItems: 1
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: dma-mem
+      - const: write
+
+  iommus:
+    maxItems: 1
+
   nvidia,model:
     $ref: /schemas/types.yaml#/definitions/string
     description: |
-- 
2.7.4

