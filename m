Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBAF66D64A
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Jan 2023 07:19:42 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B83F45A02;
	Tue, 17 Jan 2023 07:18:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B83F45A02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673936380;
	bh=yy95o4QApPivuNS0Nej4ZbM+H7/1bk1CWHKkPdzwJuA=;
	h=From:To:Subject:Date:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=Tt4PupHU4DFhBTddNE22je2y5eDGXqH1bpDS+EIiYXcnVsNlv8pVTfqrts1xzZRun
	 jVa0LXpXkBFx2RSzxfj2rABTrmuMvmABUnokZrlHUEPtcCglv7CERg7pnR6RyIbkNP
	 GpmJ74kRAw3F87WP8Ed1LXMAFMLqY+FXtzxEn9gE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5C486F804DE;
	Tue, 17 Jan 2023 07:18:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1801F8047B; Tue, 17 Jan 2023 07:18:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
 SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4B6D8F80083
 for <alsa-devel@alsa-project.org>; Tue, 17 Jan 2023 07:18:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B6D8F80083
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 80631C14;
 Mon, 16 Jan 2023 22:19:12 -0800 (PST)
Received: from R913NWR2.arm.com (unknown [10.162.42.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 26E013F445;
 Mon, 16 Jan 2023 22:18:26 -0800 (PST)
From: Faiz Abbas <faiz.abbas@arm.com>
To: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, broonie@kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: simple-card: Document simple-audio-card, plat
Date: Tue, 17 Jan 2023 11:48:08 +0530
Message-Id: <20230117061808.18422-1-faiz.abbas@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: kuninori.morimoto.gx@renesas.com, faiz.abbas@arm.com, lgirdwood@gmail.com,
 Deepak.Pandey@arm.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Anurag.Koul@arm.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The simple card driver already has support for a simple-audio-card,plat
property but its not reflected in the documentation. Add documentation
for this plat property.

Signed-off-by: Faiz Abbas <faiz.abbas@arm.com>
---
Changes since v1:
1. Updated commit message to indicate the property already exists
2. Removed redundant example
3. Fixed formatting issue found by 'make DT_CHECKER_FLAGS=-m dt_binding_check'

 Documentation/devicetree/bindings/sound/simple-card.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index ed19899bc94b..9abe99f15763 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -205,6 +205,8 @@ patternProperties:
     $ref: "#/definitions/dai"
   "^simple-audio-card,codec(@[0-9a-f]+)?$":
     $ref: "#/definitions/dai"
+  "^simple-audio-card,plat(@[0-9a-f]+)?$":
+    $ref: "#/definitions/dai"
 
   "^simple-audio-card,dai-link(@[0-9a-f]+)?$":
     description: |
-- 
2.25.1

