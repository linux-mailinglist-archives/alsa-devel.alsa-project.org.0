Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB82AD42F6
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Jun 2025 21:35:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2569260203;
	Tue, 10 Jun 2025 21:34:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2569260203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1749584107;
	bh=/r9pwoqHSypc19PvCxVj/r8Ve69yToxx+Vy37CM3NUI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fYLrttgwj5jkbo82xFxksImoiEzlulp5/EsSSby1+pJJO+JP22KFI7dP6NQrp1Ar+
	 2zx0CqXe8xUb9CMa2vjk2QnjY/X437a2WeiGdbRxag2dY6nnI9zLwF0UTQeUqLl/Pk
	 uzBR6nPZoSVG+Q+ugJoApETm8+7dFIwFlr5wcAko=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 268BBF806AC; Tue, 10 Jun 2025 21:33:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F3626F8067C;
	Tue, 10 Jun 2025 21:33:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id ACD29F800F0; Fri,  6 Jun 2025 08:52:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CEC7BF8003A
	for <alsa-devel@alsa-project.org>; Fri,  6 Jun 2025 08:52:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CEC7BF8003A
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=I0lxQSqm
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 5566qXBa1331324;
	Fri, 6 Jun 2025 01:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749192753;
	bh=WWmGvKTM9mfHp7Y8pdnp8aSwGoQqZcaC+mkl9jwP7YU=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=I0lxQSqmVVcn7eTcJaibSeEoy712WMsUgl4gyyqKY/XBuy5Kl3Jwz8oS98Sgq5AQJ
	 AbXoRtnxbNPu6whdyl/Y4nzfXJZFHKS2CbwRZ8vL4epFSebVoNseKh9+9FIgcWeswJ
	 F7zJZXL6oO6wmlyqNLLYIGUqGIfKKfe1j7VU4FVo=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 5566qWeS1386643
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 6 Jun 2025 01:52:33 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 6
 Jun 2025 01:52:32 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 6 Jun 2025 01:52:32 -0500
Received: from LTPW0EX92E.dhcp.ti.com (ltpw0ex92e.dhcp.ti.com
 [172.24.149.200])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 5566q4Oh677113;
	Fri, 6 Jun 2025 01:52:29 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <broonie@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>, <jesse-ji@ti.com>,
        <shenghao-ding@ti.com>, <liam.r.girdwood@intel.com>, <navada@ti.com>,
        <v-hampiholi@ti.com>, <niranjan.hy@ti.com>
Subject: [PATCH v1 4/4] ASoc: pcm6240: dt-bindings device support list update
Date: Fri, 6 Jun 2025 12:21:36 +0530
Message-ID: <20250606065136.1821-5-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250606065136.1821-1-niranjan.hy@ti.com>
References: <20250606065136.1821-1-niranjan.hy@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-MailFrom: niranjan.hy@ti.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: N4V6TH2GLBZFIDQF3UFC6ZLGFMMQTSLZ
X-Message-ID-Hash: N4V6TH2GLBZFIDQF3UFC6ZLGFMMQTSLZ
X-Mailman-Approved-At: Tue, 10 Jun 2025 19:33:03 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N4V6TH2GLBZFIDQF3UFC6ZLGFMMQTSLZ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Removed taa* and tad* device from the support list
as these devices are supported by tac5x1x codec driver

Signed-off-by: Niranjan H Y <niranjan.hy@ti.com>
---
 .../devicetree/bindings/sound/ti,pcm6240.yaml          | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml b/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
index d89b4255b51c..b0d5f57dc0f5 100644
--- a/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
+++ b/Documentation/devicetree/bindings/sound/ti,pcm6240.yaml
@@ -29,8 +29,6 @@ description: |
     https://www.ti.com/lit/gpn/pcm9211
     https://www.ti.com/lit/gpn/pcmd3140
     https://www.ti.com/lit/gpn/pcmd3180
-    https://www.ti.com/lit/gpn/taa5212
-    https://www.ti.com/lit/gpn/tad5212
 
 properties:
   compatible:
@@ -81,10 +79,6 @@ properties:
       ti,pcmd3180: Eight-channel pulse-density-modulation input to TDM or
       I2S output converter.
 
-      ti,taa5212: Low-power high-performance stereo audio ADC with 118-dB
-      dynamic range.
-
-      ti,tad5212: Low-power stereo audio DAC with 120-dB dynamic range.
     oneOf:
       - items:
           - enum:
@@ -98,8 +92,6 @@ properties:
           - enum:
               - ti,pcmd512x
               - ti,pcm9211
-              - ti,taa5212
-              - ti,tad5212
           - const: ti,adc6120
       - items:
           - enum:
@@ -114,8 +106,6 @@ properties:
               - ti,pcmd3140
               - ti,pcmd3180
               - ti,pcm1690
-              - ti,taa5412
-              - ti,tad5412
           - const: ti,pcm6240
       - enum:
           - ti,adc6120
-- 
2.45.2

