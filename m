Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD342B97A0
	for <lists+alsa-devel@lfdr.de>; Thu, 19 Nov 2020 17:20:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8E671170E;
	Thu, 19 Nov 2020 17:19:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8E671170E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605802837;
	bh=cTvErOiM7LjyY/taW0aQ0rYMas1sv3ZjkHzDZf1S3I0=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=IsWmpYLKFgQOO1tNlOQVMYlSvuJY1BLEPDV5E6k91LqAnTjw/afXIgXHOnpePIAQI
	 Y9fSDubAGCpRzpfQILlCYqvUM1574glGYFEimD70DayTQiruwy7+206q3vNWTe2uP4
	 oCMIQVCAvBRglCOP7QTOg6RNBImMy5V9hY3IMl6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2379DF80169;
	Thu, 19 Nov 2020 17:19:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 33F05F801ED; Thu, 19 Nov 2020 17:19:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-oo1-f65.google.com (mail-oo1-f65.google.com
 [209.85.161.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C2D5F800EE
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 17:18:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C2D5F800EE
Received: by mail-oo1-f65.google.com with SMTP id h10so1473498ooi.10
 for <alsa-devel@alsa-project.org>; Thu, 19 Nov 2020 08:18:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vd3H42jUoSvZxFn/Q1zt8vw781tXojM7bC5Q50c1Fl8=;
 b=ZeKshhhYqhCp/5kDIpgpv4ZyByhDP+TgvieItgA0S6jQaxiTgbqjcqq3lxJSqm6lah
 HKcdcUNLuM2ZeTsMLOAxV99kpJ1wYapd0sq2jjhf0z94TqzSVelTENp1lGXFC7Hpegdi
 ivA5xCC/sxb1tGZXu4uReJSVch2W3RC6PAMOBz1hEaA8eERMiwad2bpZ72M4V+2HNIRr
 6HDQ/e0NhYaEAWjT1wozBvSqCCfjyQB5spC65/sq4bLzF+OKpwp4ZWAsGs0HICJO2r4m
 hvQ/FIUbc1rPzvp9ENK1chmdksVYZZ3qoNKyky82U4pJuO4j1sSNCrpyir3skrM9I+YJ
 axsg==
X-Gm-Message-State: AOAM530hjWckwbD7kMsMhFxHwNz2WLfQXnIXXEWq6Slvszh5fH28Xa+9
 ahTFU1CL7Asv9Pc/vxhTOA==
X-Google-Smtp-Source: ABdhPJy+z6J4cPV6dH7vCvJ98HwBWHFs+6+z4hY/aKmDzuMeNHNL4aMXBGrfY+PwB1Tl7wRWJWYLdQ==
X-Received: by 2002:a4a:96c2:: with SMTP id t2mr10893667ooi.25.1605802729708; 
 Thu, 19 Nov 2020 08:18:49 -0800 (PST)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id c6sm139820oif.48.2020.11.19.08.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 08:18:49 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH] ASoC: dt-bindings: renesas,
 rsnd: Fix duplicate 'allOf' entries
Date: Thu, 19 Nov 2020 10:18:48 -0600
Message-Id: <20201119161848.3379929-1-robh@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>,
 alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
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

Commit e52f3f291152 ("ASoC: audio-graph-card: Refactor schema") added an
'allOf' entry, but one is already present in the schema. Multiple keys
is not valid and results in an error:

ruamel.yaml.constructor.DuplicateKeyError: while constructing a mapping
  in "<unicode string>", line 4, column 1
found duplicate key "allOf" with value "[]" (original value: "[]")
  in "<unicode string>", line 262, column 1

Fixes: e52f3f291152 ("ASoC: audio-graph-card: Refactor schema")
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Sameer Pujar <spujar@nvidia.com>
Cc: alsa-devel@alsa-project.org
Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/renesas,rsnd.yaml | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
index cbfd5914b432..0fd37aa84947 100644
--- a/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
+++ b/Documentation/devicetree/bindings/sound/renesas,rsnd.yaml
@@ -9,10 +9,6 @@ title: Renesas R-Car Sound Driver Device Tree Bindings
 maintainers:
   - Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
-allOf:
-  - $ref: audio-graph.yaml#
-  - $ref: audio-graph-port.yaml#
-
 properties:
 
   compatible:
@@ -260,6 +256,8 @@ required:
   - "#sound-dai-cells"
 
 allOf:
+  - $ref: audio-graph.yaml#
+  - $ref: audio-graph-port.yaml#
   - if:
       properties:
         compatible:
-- 
2.25.1

