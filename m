Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B22B3691B2C
	for <lists+alsa-devel@lfdr.de>; Fri, 10 Feb 2023 10:22:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CECA8851;
	Fri, 10 Feb 2023 10:21:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CECA8851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1676020945;
	bh=FDdWYxRQmEn9lqbN9IJIbgkv0wfcIfO4bbvrfnG0Q9c=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=fC6KTlkDHkoDn1GZlo198/0oEDUKOiKpUEIlz4yJSnvD6dnBL+qcBmtX8G+niuCNr
	 IVLPNqs0KueQOVM+AL0UVVa63C1O4Ioi42i1H5Nzgg2CV/ceeHOMCQ3WX51t/NfUhb
	 wkCfCv181Kj55Dsl7HlFMtTu0/LMGAghMrDy+gT4=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 791DEF800B8;
	Fri, 10 Feb 2023 10:21:35 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8AC4FF800B8; Fri, 10 Feb 2023 10:21:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [46.235.227.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 37307F8021D
	for <alsa-devel@alsa-project.org>; Fri, 10 Feb 2023 10:19:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 37307F8021D
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=collabora.com header.i=@collabora.com
 header.a=rsa-sha256 header.s=mail header.b=cHNwTosL
Received: from cryzen.lan (cpc87451-finc19-2-0-cust61.4-2.cable.virginm.net
 [82.11.51.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: tanureal)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 73D28660212A;
	Fri, 10 Feb 2023 09:19:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676020787;
	bh=FDdWYxRQmEn9lqbN9IJIbgkv0wfcIfO4bbvrfnG0Q9c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cHNwTosLSQW427eZrMd2Ls54CeMSGUhlg0WbKrxk/ujzUSmrgLxXkDQ+gt0vT7AZK
	 iu/aLz4D4kLF2W47+gc/a0hpEzh5RDe7XLze/OO+qwUkqDH9RHJ2AgQ+5QulRRU1Vu
	 9EIOZB2SBdeLSZas4GAn7GRkhphSk5EYJsSr0p9Ga7b3M/mEu9uyMRCaAO0VG5I3+H
	 cTG4//HevKZR7GK0jiIurcZUm3Jr8ZWxnRkS37bvUSKQap8Uaxu6Ln066/5PMWRAnB
	 oHqLnvgb7rvO6tkIA8Yrcpa2kndKNGTaLLMrGs28yb0fgU4WEeHOR8dOee2mlGotjb
	 O3p1BmZR1NBlg==
From: Lucas Tanure <lucas.tanure@collabora.com>
To: David Rhodes <david.rhodes@cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH v5 4/4] ASoC: dt-bindings: cirrus,cs35l41: Document CS35l41
 shared boost
Date: Fri, 10 Feb 2023 09:19:42 +0000
Message-Id: <20230210091942.10866-5-lucas.tanure@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210091942.10866-1-lucas.tanure@collabora.com>
References: <20230210091942.10866-1-lucas.tanure@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: G2LGB7QSFF6BSUS7537IDMZI4AOY75LO
X-Message-ID-Hash: G2LGB7QSFF6BSUS7537IDMZI4AOY75LO
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/G2LGB7QSFF6BSUS7537IDMZI4AOY75LO/>
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
index 18fb471aa891..f3c0a66f3474 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs35l41.yaml
@@ -85,11 +85,19 @@ properties:
       boost-cap-microfarad.
       External Boost must have GPIO1 as GPIO output. GPIO1 will be set high to
       enable boost voltage.
+      Shared boost allows two amplifiers to share a single boost circuit by
+      communicating on the MDSYNC bus. The passive amplifier does not control
+      the boost and receives data from the active amplifier. GPIO1 should be
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
2.39.1

