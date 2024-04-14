Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C6D89AF13
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Apr 2024 09:20:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F17F1279D;
	Sun,  7 Apr 2024 09:20:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F17F1279D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1712474434;
	bh=YgIbRUy6+1L5DOGVht8whZV1f4NbwbHZHWVmd2UytFc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=oGEmjwnhf7I9WYfFeDQTn+EQBzaESIfAcuTVXGVfuXrU4qbjLI9PD3PyilwvThyEq
	 nmyATDffx6W2tjsfHjTpsrbHXFBbbsNxOhkDrjSay/MsUvAhkYvcE0lc39mIJfOQyA
	 /4Lb/gjrWT/1ty02cMiXF6P4uJv9ArqiFgm03os0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 59B9EF80774; Sun,  7 Apr 2024 09:17:39 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3E7EF8071F;
	Sun,  7 Apr 2024 09:17:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2DA2AF8057A; Tue,  2 Apr 2024 09:13:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 57D52F8055C
	for <alsa-devel@alsa-project.org>; Tue,  2 Apr 2024 09:12:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57D52F8055C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=i6CP8+jV
Received: by mail.gandi.net (Postfix) with ESMTPA id EADE9FF809;
	Tue,  2 Apr 2024 07:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712041954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6hUXRPUn9Ew3xx8mNXSwygNKoR19Gfh8s6NOLyAtqSQ=;
	b=i6CP8+jVSldQ/HJGgUsQdDB4c3KK4OwrJlMLeSshrbCKBa+aV1SQ9ewq1GXO0GxOXbGWXg
	sMPMwvYVigLnAZNXrldko5xJzftmVB1uf7K3OLAIKQt+5IL1ufw+HhjPF7KkNb/ZAKDzxr
	Q3H5eshHRygaEpu1WkXSwKE3wKs93A3P9up6eJm/fsUI7BKE6BrgUfs+xvnP0sUtT5BYOK
	Fb0oncJe+BWsKWv70FbBIAeRtSpRS25w/uSDfD8bSpJXOs+2tIFC1KvFswXvpxZkE3SYcL
	rc8fYgqPQsTfTyiJsACP0Zs6XxC34G4rjRpG1CXISj9WA+Hl4DSDUaNLgzs/yQ==
From: Bastien Curutchet <bastien.curutchet@bootlin.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	herve.codina@bootlin.com,
	christophercordahi@nanometrics.ca
Subject: [PATCH v2 12/13] ASoC: dt-bindings: davinci-mcbsp: Add the
 'ti,T1-framing-{rx/tx}' flags
Date: Tue,  2 Apr 2024 09:12:12 +0200
Message-ID: <20240402071213.11671-13-bastien.curutchet@bootlin.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
References: <20240402071213.11671-1-bastien.curutchet@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: bastien.curutchet@bootlin.com
X-MailFrom: bastien.curutchet@bootlin.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: FIAVRVGVJ6LEKXFMM4S3FGDSSPTP24O5
X-Message-ID-Hash: FIAVRVGVJ6LEKXFMM4S3FGDSSPTP24O5
X-Mailman-Approved-At: Sun, 07 Apr 2024 07:14:48 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/FIAVRVGVJ6LEKXFMM4S3FGDSSPTP24O5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

McBSP's data delay can be configured from 0 to 2 bit clock periods. 0 is
used for DSP_B format, 1 for DSP_A format. A data delay of 2 bit clock
periods can be used to interface to 'T1 framing' devices where data
stream is preceded by a 'framing bit'. This 2 bit clock data delay is
not described in the bindings.

Add two flags 'ti,T1-framing-[rx/tx]' to enable a data delay of 2
bit clock periods in reception or transmission.

Signed-off-by: Bastien Curutchet <bastien.curutchet@bootlin.com>
---
 .../devicetree/bindings/sound/davinci-mcbsp.yaml   | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
index 0c2b1936c6a1..4fa677023827 100644
--- a/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
+++ b/Documentation/devicetree/bindings/sound/davinci-mcbsp.yaml
@@ -67,6 +67,20 @@ properties:
   "#sound-dai-cells":
     const: 0
 
+  ti,T1-framing-tx:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If the property is present, tx data delay is set to 2 bit clock periods.
+      McBSP will insert a blank period (high-impedance period) before the first
+      data bit. This can be used to interface to T1-framing devices.
+
+  ti,T1-framing-rx:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If the property is present, rx data delay is set to 2 bit clock periods.
+      McBSP will discard the bit preceding the data stream (called framing bit).
+      This can be used to interface to T1-framing devices.
+
 required:
   - "#sound-dai-cells"
   - compatible
-- 
2.44.0

