Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6671611BF8
	for <lists+alsa-devel@lfdr.de>; Fri, 28 Oct 2022 22:57:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 74BE4E0E;
	Fri, 28 Oct 2022 22:56:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 74BE4E0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666990654;
	bh=dgNVES+PG7HYw90A/f6Jhk6U5cFEmEyu1X+wMPSSjEk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=iL+Ny/JZhJrKXVh7XrCul7A8kSFb8n5nDnb2F3lEqTf1ZwZJDYcYnl7XlzPhioBYF
	 M34EkazKdt9ylCYlmTz293JDkmh6nULMaY1Yzya/hXSIKh0ih4wlx2u1EAi38E7DoK
	 7J+YIBFv0+C/EKGNacJzjmAvNlJcKf+awnBSkG5I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 30D93F804DF;
	Fri, 28 Oct 2022 22:56:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66EE3F80553; Fri, 28 Oct 2022 22:55:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3893FF804D0
 for <alsa-devel@alsa-project.org>; Fri, 28 Oct 2022 22:55:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3893FF804D0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com
 header.b="oaRdgjik"
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk
 [167.235.23.81])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: nfraprado)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 511DE6602942;
 Fri, 28 Oct 2022 21:55:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1666990551;
 bh=dgNVES+PG7HYw90A/f6Jhk6U5cFEmEyu1X+wMPSSjEk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oaRdgjikT/hfU/s0FaK1hkwIVF9Y1l3kfEWLM3nrpKFDOtkGCt4iiQhaNF5w0vWVU
 zIdCEi74XlLewBLxA31M+O93kT6m6IHkaOqnJQBYeULCbVEfEui8tcb+9PyppGF/Qf
 SqiT6TbpVrmc/4K1bPbOy33UnzjCgqiEKisZpp6WhYqtPjE3Ojyk/tEewx+fMb2SgK
 QtwcSj+Nc1Pj0FNTvGETnpg2g7ADwR5RT0hg68udxeztOW5gIgbM+oX8TMFZ1xCKLJ
 eBHJAO0I3Ox7tEZ3VT5jxjTUjO2WYyLgBPGRPxHoff+zoCgJLI9eqKtF0NS+Kcqw89
 zfJ+AeGsHwAcQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: Mark Brown <broonie@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH 2/8] ASoC: dt-bindings: realtek,
 rt5682s: Add dbvdd and ldo1-in supplies
Date: Fri, 28 Oct 2022 16:55:34 -0400
Message-Id: <20221028205540.3197304-3-nfraprado@collabora.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221028205540.3197304-1-nfraprado@collabora.com>
References: <20221028205540.3197304-1-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Derek Fang <derek.fang@realtek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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

The rt5682s codec has two additional power supply pins, DBVDD and
LDO1_IN, that aren't currently described in the binding. Add them.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---

 .../devicetree/bindings/sound/realtek,rt5682s.yaml    | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
index b7338bfc0f5a..5b2bbf6f9156 100644
--- a/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
+++ b/Documentation/devicetree/bindings/sound/realtek,rt5682s.yaml
@@ -97,6 +97,13 @@ properties:
     description: Regulator supplying power for the microphone bias through the
       MICVDD pin.
 
+  dbvdd-supply:
+    description: Regulator supplying I/O power through the DBVDD pin.
+
+  ldo1-in-supply:
+    description: Regulator supplying power to the digital core and charge pump
+      through the LDO1_IN pin.
+
 additionalProperties: false
 
 required:
@@ -104,6 +111,8 @@ required:
   - reg
   - AVDD-supply
   - MICVDD-supply
+  - dbvdd-supply
+  - ldo1-in-supply
 
 examples:
   - |
@@ -132,5 +141,7 @@ examples:
 
             AVDD-supply = <&avdd_reg>;
             MICVDD-supply = <&micvdd_reg>;
+            dbvdd-supply = <&dbvdd_reg>;
+            ldo1-in-supply = <&ldo1_in_reg>;
         };
     };
-- 
2.38.1

