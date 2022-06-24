Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BBA559829
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jun 2022 12:49:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 81C1218A1;
	Fri, 24 Jun 2022 12:48:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 81C1218A1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656067764;
	bh=Kkk/85OkEaUuxlqSwYtKeEnayjcgoahYQMQVVwVkBVw=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QUAjYkK/uBdviDrVWIW3+xurzJjOVH/DV3XyMyMlWkQZw2WamdOwbk9bzaSdM3zzh
	 owsM5ML3daPU1Psbkpc8rxSdHbMPcD0HL6Q3yPwmZ+9o6XOxtNBUTElvZGP1e9FDjc
	 Cg1I3Ie8V63IEc0IJVxdoLsMq+QmGP4uTWMYiJd4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B8427F800CB;
	Fri, 24 Jun 2022 12:48:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F4188F800CB; Fri, 24 Jun 2022 12:47:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
 by alsa1.perex.cz (Postfix) with ESMTP id 9FA9EF80107
 for <alsa-devel@alsa-project.org>; Fri, 24 Jun 2022 12:47:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FA9EF80107
Received: from hq-00021.holoplot.net (unknown [176.126.217.202])
 by mail.bugwerft.de (Postfix) with ESMTPSA id D3B84504573;
 Fri, 24 Jun 2022 10:47:23 +0000 (UTC)
From: Daniel Mack <daniel@zonque.org>
To: broonie@kernel.org,
	ryan.lee.analog@gmail.com
Subject: [PATCH 3/8] ASoC: dt-bindings: max98396: Document adi,bypass-slot-no
Date: Fri, 24 Jun 2022 12:47:07 +0200
Message-Id: <20220624104712.1934484-4-daniel@zonque.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624104712.1934484-1-daniel@zonque.org>
References: <20220624104712.1934484-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 Daniel Mack <daniel@zonque.org>
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

This property allows to select the PCM data input channel that is
routed to the speaker audio processing bypass path.

The driver already implements this property.

While at it, fix the default value for adi,imon-slot-no.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../devicetree/bindings/sound/adi,max98396.yaml       | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/adi,max98396.yaml b/Documentation/devicetree/bindings/sound/adi,max98396.yaml
index 8887e74b7ea5..c848397a7248 100644
--- a/Documentation/devicetree/bindings/sound/adi,max98396.yaml
+++ b/Documentation/devicetree/bindings/sound/adi,max98396.yaml
@@ -51,13 +51,22 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/uint32"
     minimum: 0
     maximum: 15
-    default: 0
+    default: 1
 
   adi,spkfb-slot-no:
     description: slot number of speaker DSP monitor
     $ref: "/schemas/types.yaml#/definitions/uint32"
     minimum: 0
     maximum: 15
+    default: 2
+
+  adi,bypass-slot-no:
+    description:
+      Selects the PCM data input channel that is routed to the speaker
+      audio processing bypass path.
+    $ref: "/schemas/types.yaml#/definitions/uint32"
+    minimum: 0
+    maximum: 15
     default: 0
 
   adi,interleave-mode:
-- 
2.36.1

