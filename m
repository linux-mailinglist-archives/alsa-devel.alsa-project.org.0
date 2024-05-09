Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF578C0A19
	for <lists+alsa-devel@lfdr.de>; Thu,  9 May 2024 05:19:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CD300E68;
	Thu,  9 May 2024 05:19:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CD300E68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1715224788;
	bh=qdWhQuPiR2R3ELWu+ak0dDzsK1A/aeOJ72l2vo5xF88=;
	h=From:To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=nc6gSMHboJ/l93ABJO2zBO/gbUtTuzK5mis/cvW/DjKws1NleYArzJkf1Kdl+gZib
	 MOuiEkOLMj8YJkWm6/2a9ycmbSQRlmAEf6CrxU81Yha0V4JY3zgIHZiTIRl7Kp+8DT
	 b9QgqgPGKaF9XzgH6H2HTzQOUrclTaHaHbP+xYOI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id BB901F805D9; Thu,  9 May 2024 05:18:55 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9CB81F805D4;
	Thu,  9 May 2024 05:18:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DDBFF804FB; Thu,  9 May 2024 05:18:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8CBB7F80423
	for <alsa-devel@alsa-project.org>; Thu,  9 May 2024 05:18:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8CBB7F80423
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2FF3F200845;
	Thu,  9 May 2024 05:18:41 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id D8AC42007D5;
	Thu,  9 May 2024 05:18:40 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id B5AC3180222F;
	Thu,  9 May 2024 11:18:38 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	shengjiu.wang@gmail.com,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/4] ASoC: dt-bindings: fsl,xcvr: Add two PLL clock sources
Date: Thu,  9 May 2024 10:57:38 +0800
Message-Id: <1715223460-32662-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
References: <1715223460-32662-1-git-send-email-shengjiu.wang@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Message-ID-Hash: AG6U2XPVNSNPRNXXZCSJQ4TN3PEOZ4FP
X-Message-ID-Hash: AG6U2XPVNSNPRNXXZCSJQ4TN3PEOZ4FP
X-MailFrom: shengjiu.wang@nxp.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/AG6U2XPVNSNPRNXXZCSJQ4TN3PEOZ4FP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add two PLL clock sources, they are the parent clocks of the root clock
one is for 8kHz series rates, named as 'pll8k', another one is for
11kHz series rates, named as 'pll11k'. They are optional clocks,
if there are such clocks, then the driver can switch between them to
support more accurate sample rates.

As 'pll8k' and 'pll11k' are optional, then add 'minItems: 4' for
clocks and clock-names properties.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
index 1c74a32def09..c4660faed404 100644
--- a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
@@ -50,6 +50,9 @@ properties:
       - description: PHY clock
       - description: SPBA clock
       - description: PLL clock
+      - description: PLL clock source for 8kHz series
+      - description: PLL clock source for 11kHz series
+    minItems: 4
 
   clock-names:
     items:
@@ -57,6 +60,9 @@ properties:
       - const: phy
       - const: spba
       - const: pll_ipg
+      - const: pll8k
+      - const: pll11k
+    minItems: 4
 
   dmas:
     items:
-- 
2.34.1

