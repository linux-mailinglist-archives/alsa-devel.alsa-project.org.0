Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 923FD655312
	for <lists+alsa-devel@lfdr.de>; Fri, 23 Dec 2022 18:06:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2869584F4;
	Fri, 23 Dec 2022 18:05:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2869584F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671815185;
	bh=/v0ZzyeLbg7Wkvx4I0D+61INQZAwyhfMUVclgVe+PYA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KQonrBy79DRFaPV9KL7KJMv9BuF6PS/jGkRCJc9KTxzP68rpmyVL2qK8YFVCrX7j5
	 HuMY64MsO5u8Aawz7dlaJFHAzWOdQI2CYjGn5TuUp5Ge0euzJlsdusiAgfDrY+rcqN
	 hUWIMivPV1NFCPXBglpPWOZPVr+ueIUaBMUNq088=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C316FF8052F;
	Fri, 23 Dec 2022 18:05:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 73F39F80535; Fri, 23 Dec 2022 18:05:07 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from smtp-out-12.comm2000.it (smtp-out-12.comm2000.it [212.97.32.82])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1FD1F804B2
 for <alsa-devel@alsa-project.org>; Fri, 23 Dec 2022 18:05:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1FD1F804B2
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=mailserver.it header.i=@mailserver.it
 header.a=rsa-sha256 header.s=mailsrv header.b=N9gGz1k+
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: francesco@dolcini.it)
 by smtp-out-12.comm2000.it (Postfix) with ESMTPSA id 5B87EBA1B6F;
 Fri, 23 Dec 2022 18:04:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailserver.it;
 s=mailsrv; t=1671815096;
 bh=/v0ZzyeLbg7Wkvx4I0D+61INQZAwyhfMUVclgVe+PYA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=N9gGz1k+BzKiJrKgHd4u2DYniK1Pnu2rRQLot0EoWxY3785omL/voOcQuSgRaisvt
 7GPq/VSNlypVbqJyY384kkbgzCuYyDbj0eF7KY1X7i3VMI2/Qu7L+2BGbBgQNiPy5v
 nj/Ds5ibWBp0joXvfGGx6cipUusu1AhOE5ZymWBiyAfy0dW956nrLePuzh6knIw3IM
 albX3XbnW2K+EHSVk9rPu23AOhTpsaE78idoV+kowIMKXn3MAmSVO1nLnzlKaAopDM
 xy+ubljDfo8MbNV9R2VNJq4Xi8bXi+38Fa/XkssCd9A6e3sXm2BdpVDfdhB02jicuj
 YprxvQzhqZO4w==
From: Francesco Dolcini <francesco@dolcini.it>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 2/3] ASoC: dt-bindings: nau8822: add nuvoton,
 spk-btl property to dtschema
Date: Fri, 23 Dec 2022 18:04:03 +0100
Message-Id: <20221223170404.210603-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221223170404.210603-1-francesco@dolcini.it>
References: <20221223170404.210603-1-francesco@dolcini.it>
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
Cc: wtli@nuvoton.com, Takashi Iwai <tiwai@suse.com>, kchsu0@nuvoton.com,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Benjamin Marty <info@benjaminmarty.ch>, Mark Brown <broonie@kernel.org>,
 David Lin <CTLIN0@nuvoton.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Add nuvoton,spk-btl to configure the two loudspeaker outputs
as Bridge Tied Load

Cc: David Lin <CTLIN0@nuvoton.com>
Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../devicetree/bindings/sound/nuvoton,nau8822.yaml          | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
index 10464170a98f..700c57698133 100644
--- a/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
+++ b/Documentation/devicetree/bindings/sound/nuvoton,nau8822.yaml
@@ -21,6 +21,12 @@ properties:
   reg:
     maxItems: 1
 
+  nuvoton,spk-btl:
+    description:
+      If set, configure the two loudspeaker outputs as a Bridge Tied Load output
+      to drive a high power external loudspeaker.
+    $ref: /schemas/types.yaml#/definitions/flag
+
 additionalProperties: false
 
 required:
-- 
2.25.1

