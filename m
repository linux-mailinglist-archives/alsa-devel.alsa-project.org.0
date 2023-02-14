Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E28696922
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Feb 2023 17:18:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 68F2586E;
	Tue, 14 Feb 2023 17:18:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 68F2586E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676391533;
	bh=VchhvhX3Fzn+lpKQ+32W3d8wPFXXJZL6OWRPzobNePE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=d6CLGzjy1hrLvfbREZPIr7joR+EAKheKHDGklpOng9tFS0w0rfKrfC4D7M4dbrYF9
	 kny2nuRK0RISUipilTk7vYV3e4WOXf0E63mgQ86e8/TtvSTA11pVnf/3K+bDw9SyDx
	 fQO5zkDCeeEaEmx9kSThsdPqkh/osGbXkORyUBi0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4D4DFF8001E;
	Tue, 14 Feb 2023 17:17:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 735ECF80525; Tue, 14 Feb 2023 17:17:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id BBF47F8001E
	for <alsa-devel@alsa-project.org>; Tue, 14 Feb 2023 17:17:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BBF47F8001E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=microchip.com header.i=@microchip.com
 header.a=rsa-sha256 header.s=mchp header.b=H1noiv+l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1676391431; x=1707927431;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VchhvhX3Fzn+lpKQ+32W3d8wPFXXJZL6OWRPzobNePE=;
  b=H1noiv+lXZH0wjNe3cjou0tJ8dU484LwVqJqZ0iky6cq5w21D0VhmKBi
   YoXQhMCBs6M1oz3YIBSVDaKsOfzOy/JXU3Dlf2j10ziK2EXrDzIm2q2GU
   /zOtY4WvYQrtbZRM9gduo1tEQJ6sz3191Wl/IS4nfEAXSjx6DvdLzS4YI
   4nP0GB+AflOKzwpGk24hXCchLe2v/MbfbWnAYIQ6vg9etPHijw0obUhVa
   ebdZNiECpHswtVUq2/CKRuTtcbVcv2Rc8C22OCQcpbkIYi4mCFgnEwCrZ
   PnAJBwmBAVgp2SijFZf/iV9Lc/8qa9A15uvCu4JVaQI2rAbW8CVQjzYdE
   w==;
X-IronPort-AV: E=Sophos;i="5.97,297,1669100400";
   d="scan'208";a="137145391"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 14 Feb 2023 09:17:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Tue, 14 Feb 2023 09:17:03 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Tue, 14 Feb 2023 09:16:58 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <lars@metafoo.de>, <perex@perex.cz>,
	<tiwai@suse.com>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>
Subject: [PATCH 2/3] ASoC: dt-bindings: sama7g5-pdmc: add
 microchip,startup-delay-us binding
Date: Tue, 14 Feb 2023 18:14:34 +0200
Message-ID: <20230214161435.1088246-3-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230214161435.1088246-1-claudiu.beznea@microchip.com>
References: <20230214161435.1088246-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Message-ID-Hash: PEIRAF6IVILKKJHHXRGM3IIO4CVZ45NL
X-Message-ID-Hash: PEIRAF6IVILKKJHHXRGM3IIO4CVZ45NL
X-MailFrom: Claudiu.Beznea@microchip.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea@microchip.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PEIRAF6IVILKKJHHXRGM3IIO4CVZ45NL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add microchip,startup-delay-us binding to let PDMC users to specify
startup delay.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
---
 .../devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml   | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
index c4cf1e5ab84b..9b40268537cb 100644
--- a/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
+++ b/Documentation/devicetree/bindings/sound/microchip,sama7g5-pdmc.yaml
@@ -67,6 +67,12 @@ properties:
     maxItems: 4
     uniqueItems: true
 
+  microchip,startup-delay-us:
+    description: |
+      Specifies the delay in microseconds that needs to be applied after
+      enabling the PDMC microphones to avoid unwanted noise due to microphones
+      not being ready.
+
 required:
   - compatible
   - reg
-- 
2.34.1

