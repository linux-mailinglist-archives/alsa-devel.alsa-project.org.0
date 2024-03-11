Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BDD878AB9
	for <lists+alsa-devel@lfdr.de>; Mon, 11 Mar 2024 23:26:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2241B65;
	Mon, 11 Mar 2024 23:26:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2241B65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1710196011;
	bh=nhbB7KN+EHCiAICcRdHdrKjxV/CnwlXVj5krZi1VAOQ=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=m8UlYK0Gr+oYSG3YCb8hstLj5DzFAuiUkOqrGSFHdFEjujIS2NE6XA2AXwArBti56
	 kP/ALSXwhf8Oua76zviGAdhfWq4hMdeoUJbxSEvuQ7uBeRoZj9Z5YDkfFQNdJKGHNX
	 rdKKkHii0wBtOUGXsjvIomUmyFRZSddy/m1nY2TA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 17162F80589; Mon, 11 Mar 2024 23:26:18 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AFF1FF8057F;
	Mon, 11 Mar 2024 23:26:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 66AFFF8028D; Mon, 11 Mar 2024 23:26:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AF28FF800E4
	for <alsa-devel@alsa-project.org>; Mon, 11 Mar 2024 23:26:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF28FF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MKZv1lzc
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3ABF0CE0919;
	Mon, 11 Mar 2024 22:26:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 400DFC433C7;
	Mon, 11 Mar 2024 22:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710195961;
	bh=nhbB7KN+EHCiAICcRdHdrKjxV/CnwlXVj5krZi1VAOQ=;
	h=From:To:Cc:Subject:Date:From;
	b=MKZv1lzcp4zTGpiciqj1xnbftzR2jp2AXkT8WSfbmufh6zCz8WjOAL5tnN5+e/eTX
	 x2sGXpz94n+SSI7tbH9T0Qps+spePhN9uSbrDLcDd41dDnWPH758lRTaPeUJ+fau8W
	 g8prQJGzGthmOm5s6Q3wbVGtMZzwtSt1hWqtpj3eWeU2ya8+/qCECr8/an5ltZlZnP
	 1AIZ9NpEBiCGOMI9dAfjM15ApZg7qCGGRwmKK+Kj6e/w4dtEkiuWBG33lIwIdLSTOm
	 df0b1aq9zGmcjql9igxmucTZ1QnozoYCOAFMVIaw7U24YhBa3GpAXTeHZEiaF2Lg/R
	 zBBizEmcRIMiA==
From: Rob Herring <robh@kernel.org>
To: James Schulman <james.schulman@cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	patches@opensource.cirrus.com
Cc: alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: cirrus,cs42l43: Fix 'gpio-ranges' schema
Date: Mon, 11 Mar 2024 16:25:53 -0600
Message-ID: <20240311222554.1940567-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EB5DRJXHUTQ5M53RBNBIB3XAPGWFLYDH
X-Message-ID-Hash: EB5DRJXHUTQ5M53RBNBIB3XAPGWFLYDH
X-MailFrom: robh@kernel.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EB5DRJXHUTQ5M53RBNBIB3XAPGWFLYDH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

'gpio-ranges' is a phandle-array which is really a matrix. The schema in
cirrus,cs42l43 is incomplete as it doesn't define there's only a single
entry. Add the outer array constraints that there is a single entry.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/sound/cirrus,cs42l43.yaml     | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
index 7f9d8c7a635a..99a536601cc7 100644
--- a/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
+++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l43.yaml
@@ -185,11 +185,12 @@ properties:
 
       gpio-ranges:
         items:
-          - description: A phandle to the CODEC pinctrl node
-            minimum: 0
-          - const: 0
-          - const: 0
-          - const: 3
+          - items:
+              - description: A phandle to the CODEC pinctrl node
+                minimum: 0
+              - const: 0
+              - const: 0
+              - const: 3
 
     patternProperties:
       "-state$":
-- 
2.43.0

