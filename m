Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F99368E473
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Feb 2023 00:33:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56EBD843;
	Wed,  8 Feb 2023 00:32:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56EBD843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1675812803;
	bh=HOrC+xKoDbYva3mi7kNRHfK88vh1PiAgWULb+aXfcI8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UGNzjdngK77MCAP4QB20PM1kOV7N2Ecs68k41Ob4SgZB1S+BGqeG0iD/NvzVK9szw
	 WcOBJz+HBgMenGqs5brm7qg6wq+LN6r0KOVEgvOBjEcKEM4nYKX9vywKdtc+hjVy8d
	 aOoQYOX3sYr0/eOClZtboE9PuHa7bSGOPlLWe0EI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A69F1F8052D;
	Wed,  8 Feb 2023 00:31:44 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 64B64F8051F; Wed,  8 Feb 2023 00:31:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8952CF80224
	for <alsa-devel@alsa-project.org>; Wed,  8 Feb 2023 00:31:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8952CF80224
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=i5F9gkSN
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 29C3E66020E8;
	Tue,  7 Feb 2023 16:25:39 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675787139;
	bh=HOrC+xKoDbYva3mi7kNRHfK88vh1PiAgWULb+aXfcI8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i5F9gkSN0PTfhpMPj6BBMRxWK14vLVR6Up5CF2yPvbptxFGrxnApAmPNx7cB8ttzZ
	 eLtTAiSMe+3zf1Mxm1apv+4umlAqO9Zie6Sicjxzgfi9LuOFROHsj3ppa1G4okLuho
	 gnBpTQbJwUOcsLO3mW4eQZf/9FNIGe9BQBWfzeZAboMmxLE9qLsptLDPuDpElryVNa
	 3C+ych2kZy3yaMq1ZproHJlpKpVpFaH5Ihptu6bp4V0XxTP8MULWNSjHKXXPMcwVuZ
	 X/JO+Tcxyj9W6QpoDJ+9ANb/ZHErq3zaBUT8ccgToUv0kXmlWd6RslmlNQzMBVdvmM
	 j2Hc+az8NxlLQ==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v2 5/5] ASoC: cs35l41: Document CS35l41 shared boost
Date: Tue,  7 Feb 2023 16:25:26 +0000
Message-Id: <20230207162526.1024286-6-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207162526.1024286-1-lucas.tanure@collabora.com>
References: <20230207162526.1024286-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZQJ5SI67TGV426NQTJMHK3JULSQ77XT5
X-Message-ID-Hash: ZQJ5SI67TGV426NQTJMHK3JULSQ77XT5
X-MailFrom: lucas.tanure@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 kernel@collabora.com, Lucas Tanure <lucas.tanure@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ZQJ5SI67TGV426NQTJMHK3JULSQ77XT5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Describe the properties used for shared boost
configuration.
Based on David Rhodes shared boost patches.

Signed-off-by: Lucas Tanure <lucas.tanure@collabora.com>
---
 .../devicetree/bindings/sound/cirrus,cs35l41.yaml      | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
index 8465623bbd96..54f769159ce4 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
@@ -86,12 +86,20 @@ properties:
       External Boost must have GPIO1 as GPIO output. GPIO1 will be set high to
       enable boost voltage.
       External Boost without GPIO1 as VSPK switch is no longer supported.
+      Shared boost allows two amplifiers to share a single boost circuit by
+      communicating on the MDSYNC bus. The passive amplifier does not control
+      the boost and receives data from the active amplifier. GPIO1 should be
+      configured for Sync when shared boost is used. Shared boost is not
+      compatible with External boost. Active amplifier requires
+      boost-peak-milliamp, boost-ind-nanohenry and boost-cap-microfarad.
       0 = Internal Boost
       1 = External Boost
       2 = External Boost without VPSK switch (Do not use in new systems)
+      3 = Shared Boost Active
+      4 = Shared Boost Passive
     $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
-    maximum: 2
+    maximum: 4
 
   cirrus,gpio1-polarity-invert:
     description:
-- 
2.39.1

