Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 151B0867E53
	for <lists+alsa-devel@lfdr.de>; Mon, 26 Feb 2024 18:24:39 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8B86FE9A;
	Mon, 26 Feb 2024 18:24:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8B86FE9A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1708968278;
	bh=W5BmSshd0oXFwwOasjjhvcfbUwIqu6xmPd/ui1WyGEQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=YRZfzyc07+3NJccolvy89R9ZBWCy3WEx/UNtlPq1zjfeBQ+2D9qrGiVXQZJWJ021C
	 B5IHxdbLv+Vbe+CBay7M0W4EfSTTVU7HndJQbVp7ERG84IxuDtOeB4cIWJz4Kd+s79
	 nL0psY2KSvgsOgn4AgsUrWs/5WXaUVbuujhhL1S8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45D61F8063D; Mon, 26 Feb 2024 18:23:05 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6ABA6F80633;
	Mon, 26 Feb 2024 18:23:05 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1F253F8047D; Fri, 23 Feb 2024 18:27:20 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7BA72F800EE
	for <alsa-devel@alsa-project.org>; Fri, 23 Feb 2024 18:27:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7BA72F800EE
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=QmzfeFaG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1708709237; x=1740245237;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W5BmSshd0oXFwwOasjjhvcfbUwIqu6xmPd/ui1WyGEQ=;
  b=QmzfeFaGksjxW1jfR39OEmzDQaCnhiB4EX05H0q7Hvy7NODNQ/mJDP2q
   z9wpnA2QdRjaaFO1Acy8r0G6blvH4Gi0gHXJYn4P7KuDAMwIzZezmV4+U
   kvXcbJX57CM6jZNrbc2Ljt/BzdSrSTsG2Gm+o8zhpcBQSbA3iOV08Pkgj
   e2HaFddvlS+w9UzICRneQ350rIkT51bgIget/apnXkG2zDztP3/BeuFcG
   S/2Q/+zJe1eAL04Wdhw0NNMS9I524oBX9GAvIKjltlMH/UHlXtwJVCi5H
   79szoN/kWfYkfazjUzFBpnHmY1ReLxeVtrV6kKAngjz4A3/Jsa+PydMGa
   g==;
X-CSE-ConnectionGUID: WGdUDJySTO6s5AHkHy7fsA==
X-CSE-MsgGUID: kYk6deLtTtCG69UPyi3Npw==
X-IronPort-AV: E=Sophos;i="6.06,180,1705388400";
   d="scan'208";a="18276155"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Feb 2024 10:27:13 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 23 Feb 2024 10:27:04 -0700
Received: from che-lt-i67070.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 23 Feb 2024 10:27:00 -0700
From: Varshini Rajendran <varshini.rajendran@microchip.com>
To: <claudiu.beznea@tuxon.dev>, <lgirdwood@gmail.com>, <broonie@kernel.org>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <codrin.ciubotariu@microchip.com>,
	<alsa-devel@alsa-project.org>, <linux-sound@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
CC: <varshini.rajendran@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v4 17/39] ASoC: dt-bindings: microchip: add sam9x7
Date: Fri, 23 Feb 2024 22:56:57 +0530
Message-ID: <20240223172657.672439-1-varshini.rajendran@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223171342.669133-1-varshini.rajendran@microchip.com>
References: <20240223171342.669133-1-varshini.rajendran@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MailFrom: Varshini.Rajendran@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: ACO3MS72HRHE6IWIBAFQWAGE2YHCTGI4
X-Message-ID-Hash: ACO3MS72HRHE6IWIBAFQWAGE2YHCTGI4
X-Mailman-Approved-At: Mon, 26 Feb 2024 17:22:49 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ACO3MS72HRHE6IWIBAFQWAGE2YHCTGI4/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add sam9x7 compatible in the DT documentation.

Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
Changes in v4:
- Updated Acked-by tag
---
 .../bindings/sound/microchip,sama7g5-i2smcc.yaml      | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml
index 651f61c7c25a..fb630a184350 100644
--- a/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml
+++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-i2smcc.yaml
@@ -24,9 +24,14 @@ properties:
     const: 0
 
   compatible:
-    enum:
-      - microchip,sam9x60-i2smcc
-      - microchip,sama7g5-i2smcc
+    oneOf:
+      - enum:
+          - microchip,sam9x60-i2smcc
+          - microchip,sama7g5-i2smcc
+      - items:
+          - enum:
+              - microchip,sam9x7-i2smcc
+          - const: microchip,sam9x60-i2smcc
 
   reg:
     maxItems: 1
-- 
2.25.1

