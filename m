Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CD583B1DD
	for <lists+alsa-devel@lfdr.de>; Wed, 24 Jan 2024 20:08:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6BAAA826;
	Wed, 24 Jan 2024 20:08:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6BAAA826
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1706123330;
	bh=SwchdVgBg6neJuhnWaXo7T47sqrW4qt3snXZHu9PtNs=;
	h=From:To:Cc:Subject:Date:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=t+y2jfecfIAwDfdb1HSRUmeYMMmcdxoWdTXfAOURgdITLipom2a8seHA/kyvljczl
	 Cr+EVrm8xpCGSKriMHf0PY9F+hkf/RFXO62suBmJiHMnOlUd9VXy7+apAXfL7VCWfy
	 qV6x5jdSc+m1vA8huMgw7l5nWnheAjBugz+Dgpeo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 62A56F8056F; Wed, 24 Jan 2024 20:08:19 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D1922F8057F;
	Wed, 24 Jan 2024 20:08:18 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C373FF8028D; Wed, 24 Jan 2024 20:08:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE430F8022B
	for <alsa-devel@alsa-project.org>; Wed, 24 Jan 2024 20:08:09 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE430F8022B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=P3b1S1bK
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4B90CCE31FE;
	Wed, 24 Jan 2024 19:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604BCC433F1;
	Wed, 24 Jan 2024 19:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706123284;
	bh=SwchdVgBg6neJuhnWaXo7T47sqrW4qt3snXZHu9PtNs=;
	h=From:To:Cc:Subject:Date:From;
	b=P3b1S1bKil47eshjiDtblLxITFGqJFOMDH93eef6oCv3d+NFUujUCkL0m2FYyS7VQ
	 MNtPpYSC592H6rgLxd0In4yIr6Ehok+RZ1BL2CiuvNZ0ymEvL7QJZIWO0AqjDOzuG8
	 QhMtu79DN0UC12HUxGR+Ke2a1lTuJIE+cjEz1FgG8olWAxhU148efsxnNsKUU0eNky
	 4RRayonZbsCsgVP53MAeIKazX5s9xk1JRGqRELC7LjvnSUb9imGt9iYuilkcuY+VHA
	 I3nY9aQBxKNhOvdCaCYE/0oOJSA0C9aowvu/e8QfFBO2aqzxuyhlInM/FDMc7a65cg
	 A2h7xagDTitGw==
From: Rob Herring <robh@kernel.org>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: samsung,tm2: Correct "audio-codec"
 constraints
Date: Wed, 24 Jan 2024 13:07:53 -0600
Message-ID: <20240124190754.1554899-1-robh@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GOXIQFCK2XCCQM7D42RYOFLFVCUF6UO2
X-Message-ID-Hash: GOXIQFCK2XCCQM7D42RYOFLFVCUF6UO2
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GOXIQFCK2XCCQM7D42RYOFLFVCUF6UO2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The "audio-codec" constraints define how many entries(2), but not the
size of each entry. Each entry is a single phandle. Define the size with
an inner 'items' list.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/sound/samsung,tm2.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/samsung,tm2.yaml b/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
index 760592599143..cbc7ba37362a 100644
--- a/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
+++ b/Documentation/devicetree/bindings/sound/samsung,tm2.yaml
@@ -25,8 +25,11 @@ properties:
     description: Phandles to the codecs.
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-      - description: Phandle to the WM5110 audio codec.
-      - description: Phandle to the HDMI transmitter node.
+      - items:
+          - description: Phandle to the WM5110 audio codec.
+      - items:
+          - description: Phandle to the HDMI transmitter node.
+
 
   samsung,audio-routing:
     description: |
-- 
2.43.0

