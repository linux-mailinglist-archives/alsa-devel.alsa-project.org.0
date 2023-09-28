Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE047B143B
	for <lists+alsa-devel@lfdr.de>; Thu, 28 Sep 2023 09:11:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1D2CADE5;
	Thu, 28 Sep 2023 09:10:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1D2CADE5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1695885096;
	bh=rFsZo3BG3wzrVnTuPgT+uCKI9lwBtMwEqfGqYWV1i54=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=o+7TllKXOs4uIZAOl8OYbYv5DBv97c1GtZv+CdKu/uU0XZE5PwtYZCvhDO439HVOs
	 xhEXEXgHZiMWITntr3y1DDhvtI+4R6FKz07ODd6auXWnrSPr4xhFsORS6MrGMZCQCj
	 VPEENK3hWiOh620cm/g/+vqP6q8S6aYJdNLt5yhs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9DCD9F805D3; Thu, 28 Sep 2023 09:09:25 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 624CDF805C7;
	Thu, 28 Sep 2023 09:09:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D80BFF8055B; Thu, 28 Sep 2023 09:07:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 28467F800AE
	for <alsa-devel@alsa-project.org>; Thu, 28 Sep 2023 09:07:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 28467F800AE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=b137PEfV
Received: by mail.gandi.net (Postfix) with ESMTPA id 0F20820007;
	Thu, 28 Sep 2023 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1695884846;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p22HMMIKMFQbh6/HiMaCltDimc7HD++LcS5qhfEDNEc=;
	b=b137PEfVWnm5YJSaTUGGHWANWAAtQ922LR7ddbFHv7Jhx3crw9MiAX8zC3Da+l24pRZ5fU
	CpJKeTKhwRmeb5aUWCOltxQeAgjPQcgDVokOuBXo5wylky+/GXTptxBXwIHANUSCwCci1A
	zYWmS5mZYJ79icT/nyh+/cxL1zj7s6fD/7bpuS/iDa513X4q+cjG/MTntSGkDx6gMiR5TE
	kck3Q8xNPb5HECw8ncpYoc3Wh3e4mCTPcCAGoe6zXgUJBfacnwV69OIMFemucAEgW5S52x
	Y8lw1BoyETf4Cq1V5fBTxQa4X3AqN0enBG+nwY79wsR0VdQ9am2jLLutOQqCfg==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org,
	Simon Horman <horms@kernel.org>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v7 06/30] dt-bindings: soc: fsl: cpm_qe: cpm1-scc-qmc: Fix
 example property name
Date: Thu, 28 Sep 2023 09:06:24 +0200
Message-ID: <20230928070652.330429-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928070652.330429-1-herve.codina@bootlin.com>
References: <20230928070652.330429-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
Message-ID-Hash: EAD4POOLWEPXDRKUP7A6PMKN23HOJDGC
X-Message-ID-Hash: EAD4POOLWEPXDRKUP7A6PMKN23HOJDGC
X-MailFrom: herve.codina@bootlin.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EAD4POOLWEPXDRKUP7A6PMKN23HOJDGC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The given example mentions the 'fsl,mode' property whereas the
correct property name, the one described, is 'fsl,operational-mode'.

Fix the example to use the correct property name.

Fixes: a9b121327c93 ("dt-bindings: soc: fsl: cpm_qe: Add QMC controller")
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml           | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
index ec888f48cac8..450a0354cb1d 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,cpm1-scc-qmc.yaml
@@ -137,7 +137,7 @@ examples:
         channel@16 {
             /* Ch16 : First 4 even TS from all routed from TSA */
             reg = <16>;
-            fsl,mode = "transparent";
+            fsl,operational-mode = "transparent";
             fsl,reverse-data;
             fsl,tx-ts-mask = <0x00000000 0x000000aa>;
             fsl,rx-ts-mask = <0x00000000 0x000000aa>;
@@ -146,7 +146,7 @@ examples:
         channel@17 {
             /* Ch17 : First 4 odd TS from all routed from TSA */
             reg = <17>;
-            fsl,mode = "transparent";
+            fsl,operational-mode = "transparent";
             fsl,reverse-data;
             fsl,tx-ts-mask = <0x00000000 0x00000055>;
             fsl,rx-ts-mask = <0x00000000 0x00000055>;
@@ -155,7 +155,7 @@ examples:
         channel@19 {
             /* Ch19 : 8 TS (TS 8..15) from all routed from TSA */
             reg = <19>;
-            fsl,mode = "hdlc";
+            fsl,operational-mode = "hdlc";
             fsl,tx-ts-mask = <0x00000000 0x0000ff00>;
             fsl,rx-ts-mask = <0x00000000 0x0000ff00>;
         };
-- 
2.41.0

