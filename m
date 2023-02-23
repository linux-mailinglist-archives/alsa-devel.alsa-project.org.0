Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A29A6A0422
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Feb 2023 09:47:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C150E850;
	Thu, 23 Feb 2023 09:46:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C150E850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677142069;
	bh=ULUS8juqT9D663UOmoNu1JrQcrXe/fPV+74I8cFGkeE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=twL86wiiOLG7+2V49/WSfVfZC7eoPASSNYGVzxhS80EvnE0e34d6tP6Xh2MbEUW8D
	 HkutHCGfdL41iEVkrGPrqKywar90gX0vyGlHeTPC6FhpLf2/JFENs5FurAdw8FbtrZ
	 pN7GBASm80nz76tnfXUP6lctt1q2H00eVAWAgtDg=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 956F5F8052D;
	Thu, 23 Feb 2023 09:45:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 30250F80266; Thu, 23 Feb 2023 09:45:42 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 007E2F802DB
	for <alsa-devel@alsa-project.org>; Thu, 23 Feb 2023 09:43:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 007E2F802DB
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=TENpdt+t
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E638666021FF;
	Thu, 23 Feb 2023 08:43:28 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677141809;
	bh=ULUS8juqT9D663UOmoNu1JrQcrXe/fPV+74I8cFGkeE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TENpdt+t0Yvr5vcNTBdb6dDKeDJ1cVNmxMmvwatqCMDmgbo25cy72ILeeU5hSW525
	 UdO1JjXjA6SXeIwMeeD0QrWD6nSWlEAVObTOnXWV50MFnAgpQ/q0ImuichQYL0AXl6
	 HwVZu2KMUupiqgZlyd3dHBZNOEEA59IfH22ssoGaCtgPFI+Ugdu8Gk6O+pnZdwI+FX
	 o+n6hV6ZvJswdbmOnJah4jmbKB8GEYJDowjmwAHydmPCAbuNstj3lrWozHRyjEk/Sg
	 uS8dQ1apLrWMaquTiI0VriBwMbUI38JCohGXhfYHTNBrzum33KLTDIaPI1Se254LxX
	 k4R3KaPvHXpJQ==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v7 4/4] ASoC: dt-bindings: cirrus,cs35l41: Document CS35l41
 shared boost
Date: Thu, 23 Feb 2023 08:43:24 +0000
Message-Id: <20230223084324.9076-5-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223084324.9076-1-lucas.tanure@collabora.com>
References: <20230223084324.9076-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6HT5YRL4OCRI26MKY3XGC2GMETE47KQP
X-Message-ID-Hash: 6HT5YRL4OCRI26MKY3XGC2GMETE47KQP
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Lucas Tanure <lucas.tanure@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6HT5YRL4OCRI26MKY3XGC2GMETE47KQP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Describe the properties used for shared boost configuration.
Based on David Rhodes shared boost patches.

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/cirrus,cs35l41.yaml      | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
index 18fb471aa891..14dea1feefc5 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
@@ -85,11 +85,19 @@ properties:
       boost-cap-microfarad.
       External Boost must have GPIO1 as GPIO output. GPIO1 will be set high to
       enable boost voltage.
+      Shared boost allows two amplifiers to share a single boost circuit by
+      communicating on the MDSYNC bus. The active amplifier controls the boost
+      circuit using combined data from both amplifiers. GPIO1 should be
+      configured for Sync when shared boost is used. Shared boost is not
+      compatible with External boost. Active amplifier requires
+      boost-peak-milliamp, boost-ind-nanohenry and boost-cap-microfarad.
       0 = Internal Boost
       1 = External Boost
+      2 = Shared Boost Active
+      3 = Shared Boost Passive
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
-    maximum: 1
+    maximum: 3
 
   cirrus,gpio1-polarity-invert:
     description:
-- 
2.39.2

