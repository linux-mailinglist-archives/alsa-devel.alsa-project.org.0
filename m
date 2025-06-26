Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 379CDAEB8F3
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Jun 2025 15:30:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B83516033D;
	Fri, 27 Jun 2025 15:29:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B83516033D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1751030987;
	bh=3voyKilclrJyFpyj0vDLDIuW3RdmQV7SMimX+9MHXPk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Lg/sNNcVesisQax4T1zAI7KUExVzBkmkuLGr2TyZf2vfB8jEGBIcorLlCCoSTS00G
	 81PMcKr/kpUzmsdE4uuMLzu6DaUw4UIa3b2UaI0KXVTyHAfAY+DHsNJhyAsNcjd6xc
	 3OKHd7PfECRTK/eD1ZleFSq7lItuutO/VUsUoAvg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72AA7F896FD; Fri, 27 Jun 2025 15:24:48 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 53057F896EF;
	Fri, 27 Jun 2025 15:24:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85356F8016E; Thu, 26 Jun 2025 20:14:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_PASS,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 90E5BF80124
	for <alsa-devel@alsa-project.org>; Thu, 26 Jun 2025 20:14:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90E5BF80124
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256
 header.s=ti-com-17Q1 header.b=SjbDdLhN
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55QIEMTl1807739;
	Thu, 26 Jun 2025 13:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750961662;
	bh=4aYqEZqvY1R6ptZgQ9lV04nxsm6ZavtlpgfJ9aUmVPs=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=SjbDdLhNEK9udWDTh6omWCm25LncguH+n7s96ajqeMShbRy2OZQyfZxns3htyBWbX
	 5Po4D8ZWQ2nYC/NfYjSRlQnlHS4mCuuYRHvAiKkL6AjmKDl42bO/5Lny/Lm/630oS+
	 1i1zrv/ZXZSq8L0aOrFmUxb4593VJwAvOX6LUTvI=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55QIEMVF3842200
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 26 Jun 2025 13:14:22 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 26
 Jun 2025 13:14:21 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 26 Jun 2025 13:14:22 -0500
Received: from LTPW0EX92E.dhcp.ti.com ([10.249.133.122])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55QIDr6A1713573;
	Thu, 26 Jun 2025 13:14:17 -0500
From: Niranjan H Y <niranjan.hy@ti.com>
To: <broonie@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <andriy.shevchenko@linux.intel.com>, <tiwai@suse.de>,
        <alsa-devel@alsa-project.org>, <baojun.xu@ti.com>,
        <shenghao-ding@ti.com>, <liam.r.girdwood@intel.com>,
        <lgirdwood@gmail.com>, <robh@kernel.org>,
        <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <navada@ti.com>, <v-hampiholi@ti.com>, <niranjan.hy@ti.com>
Subject: [PATCH v3 4/4] dt-bindings: sound: device support list for pcm6240
Date: Thu, 26 Jun 2025 23:43:33 +0530
Message-ID: <20250626181334.1200-5-niranjan.hy@ti.com>
X-Mailer: git-send-email 2.33.0.windows.2
In-Reply-To: <20250626181334.1200-1-niranjan.hy@ti.com>
References: <20250626181334.1200-1-niranjan.hy@ti.com>
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
Message-ID-Hash: M7ETPJIZRETMQDFPKFTSRBTISBLLCPZI
X-Message-ID-Hash: M7ETPJIZRETMQDFPKFTSRBTISBLLCPZI
X-Mailman-Approved-At: Fri, 27 Jun 2025 13:24:44 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M7ETPJIZRETMQDFPKFTSRBTISBLLCPZI/>
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
v3:
- update the subject of the patch file
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

