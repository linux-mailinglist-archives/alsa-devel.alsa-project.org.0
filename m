Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8F63CA8CA
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 21:01:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8DAD3167F;
	Thu, 15 Jul 2021 21:00:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8DAD3167F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626375692;
	bh=8LcN4NYxf3HqS9ZbIvWxfRZMOKyqgT2pvPNqxBCkttw=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=c+dykncNy1RF4zbK4RrOfNnFq1JueX4gQO+vYE6ZP6IzAQiuMzp5iAVuZhICGzlAm
	 R8QM9HFTk2CNWI3qZTt5RGgFxtJgmue2VvCBMtPDRnPhFD2gzThg5apn//oVw7ATBK
	 CYTTDl7ltj5/Q4v3mLZ03rHsXsAmmS+cM2pBgqvU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0A9A8F80095;
	Thu, 15 Jul 2021 21:00:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A86B7F80217; Thu, 15 Jul 2021 21:00:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com
 [209.85.166.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCAAFF80095
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 20:59:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCAAFF80095
Received: by mail-il1-f173.google.com with SMTP id e13so5957536ilc.1
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 11:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RiqGFZQ7xuhJIftSUoyXu5zNuFIfnG6U5i6WL5zRw7c=;
 b=an4gWONa1K+cSGV8/EzD3Pn3GiYA1drlo1thWO93HPXSCb9PAeAzlsiTHQYbPAgqnf
 0M42tUHk1VwcJkTY/7nrVPKdFePVVIFQmUZYKCfzAXhmGj3ZPNs35wPsK1rz3yYEV/9/
 XP8ojKeLL110w3qKw0jg/b3hGCKFC7jNwaS5/e/hAmaDcASxp6gAlKsWtxJMurobwDIk
 p6/cxpv8fVPY2trDQ4rfVEmM1S+/uhbnD+vnjZDj1B0q+8Sd1VnZzS9LpA2X75iy8W0+
 IcHtjDuTLrV3G8rLljB4ZET2+c9LS2TQ4MPkPrn4NWQRo55GzAnpV0NkmX1Bk1yxoj9T
 0RFg==
X-Gm-Message-State: AOAM530LM/5afwZ+r7qS10DTBveduJQhIpXS8l226lcBPQBTRpmZATnf
 AEvAhrqKuy2qdPZn4Ao8XQ==
X-Google-Smtp-Source: ABdhPJxcoWlh2NzIThIIFpwH8hyJlQ8bztIdSda2U/1fyLTsdcs9FXHEQN+JvTWBmUmuKzvAe/ckbg==
X-Received: by 2002:a92:db4b:: with SMTP id w11mr3755881ilq.297.1626375594912; 
 Thu, 15 Jul 2021 11:59:54 -0700 (PDT)
Received: from xps15.herring.priv ([64.188.179.248])
 by smtp.googlemail.com with ESMTPSA id c19sm3347150ili.62.2021.07.15.11.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jul 2021 11:59:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: dt-bindings: renesas: rsnd: Fix incorrect 'port' regex
 schema
Date: Thu, 15 Jul 2021 12:59:52 -0600
Message-Id: <20210715185952.1470138-1-robh@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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

A property regex goes under 'patternProperties', not 'properties'
schema. Otherwise, the regex is interpretted as a fixed string.

Fixes: 17c2d247ddd2 ("ASoC: dt-bindings: renesas: rsnd: tidyup properties")
Cc: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
I can take this as I have a few other things for -rc2.

 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index ee936d1aa724..c2930d65728e 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -114,7 +114,7 @@ properties:
 
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
-    properties:
+    patternProperties:
       port(@[0-9a-f]+)?:
         $ref: audio-graph-port.yaml#
         unevaluatedProperties: false
-- 
2.27.0

