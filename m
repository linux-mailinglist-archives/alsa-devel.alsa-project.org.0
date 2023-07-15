Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC4C754783
	for <lists+alsa-devel@lfdr.de>; Sat, 15 Jul 2023 10:35:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A2D10DF3;
	Sat, 15 Jul 2023 10:34:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A2D10DF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689410148;
	bh=Yn+auhXJIuQbF35jeSoIihOosEzYCjKYkOL1vbQTFMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=H+d8VBbQryUEfv0DxPX9tIMZ/yQL7kl8q9nqYelk010+nBn4y3sv4TGwPC5iEhYG7
	 C5gpnHhJQyOa9jZY3Yf27ALLZqz3zrSsuN3nVsZI8t0wY8uczDf73qeLdTvXWlL1XO
	 sKJKQ2MITgo4WksCr0Ts3A1ZCKnIhCTucZ0G6Kvs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 21E80F8056F; Sat, 15 Jul 2023 10:34:07 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3091F8055C;
	Sat, 15 Jul 2023 10:34:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AFDB5F80249; Sat, 15 Jul 2023 10:31:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_HI,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from smtpng1.i.mail.ru (smtpng1.i.mail.ru [94.100.181.251])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 414BBF80236
	for <alsa-devel@alsa-project.org>; Sat, 15 Jul 2023 10:31:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 414BBF80236
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=inbox.ru header.i=@inbox.ru header.a=rsa-sha256
 header.s=mail4 header.b=s55kxEHa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru;
 s=mail4;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=nTUV8iWyyAdWf9/HteKPenq7whVZjQj0BUZXDdsYUww=;
	t=1689409885;x=1689499885;
	b=s55kxEHaRiOvX3Epqr/OEz8y9050RmTGZy71GEzhRdefMTWDmWBFMYwR1+lwRce2jiwZyDoTfdRo1sp0+bttDTOLeOfoJO/XiYCTCm8UnXF5bPo1NZEivkjMZ7ICIY5AepMt3EuXE37hWe+fW2cteWLE62UyrNAUWK3y3WGbeasNznbQhJak038KKJmzszraiNhiUEKY7wfg/C7Le3lYX3VRzW2+WGNhSDxunB8BnEU6QrdeBmT30ohAoPZc4X03deWcvI4lfQjbhAB5Jv5tSLHaI7UgiTN4N4mfe+HpJ4cAxUiM9Av56mWU0SuwsFxq3IO5x8HPqYvg3lELk5mxjw==;
Received: by smtpng1.m.smailru.net with esmtpa (envelope-from
 <fido_max@inbox.ru>)
	id 1qKagV-0004Hr-1R; Sat, 15 Jul 2023 11:31:23 +0300
From: Maxim Kochetkov <fido_max@inbox.ru>
To: alsa-devel@alsa-project.org
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Sameer Pujar <spujar@nvidia.com>,
	Astrid Rost <astrid.rost@axis.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Aidan MacDonald <aidanmacdonald.0x0@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ASoC: dt-bindings: simple-card: add triggers properties
Date: Sat, 15 Jul 2023 11:30:43 +0300
Message-Id: <20230715083046.108674-3-fido_max@inbox.ru>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230715083046.108674-1-fido_max@inbox.ru>
References: <20230715083046.108674-1-fido_max@inbox.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtpng1.m.smailru.net;
 auth=pass smtp.auth=fido_max@inbox.ru smtp.mailfrom=fido_max@inbox.ru
X-Mailru-Src: smtp
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 
 4F1203BC0FB41BD9A075ED63965291975FF12524F3FDD82BF1CE581C66542C39182A05F538085040497A2B679F75C10E298F89A9AA7B3332C2AB428A38E121307E705937D85A46C3
X-7FA49CB5: 
 FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE77EB2E345998A721DEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637CF05F7050DCA185A8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8EE9E629E1E985D2A40FD89EEA341FDB66F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE79AE9BAF3542BD4619FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18618001F51B5FD3F9D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BDCBA8CBAA3833548A471835C12D1D977C4224003CC8364762BB6847A3DEAEFB0F43C7A68FF6260569E8FC8737B5C2249EC8D19AE6D49635B68655334FD4449CB9ECD01F8117BC8BEAAAE862A0553A39223F8577A6DFFEA7CB0EC3B1FCAE4A06943847C11F186F3C59DAA53EE0834AAEE
X-C1DE0DAB: 
 0D63561A33F958A52EF64897036BA1BABBA65E42AFBF6689569F4EE9472D15CBF87CCE6106E1FC07E67D4AC08A07B9B062B3BD3CC35DA5889C5DF10A05D560A950611B66E3DA6D700B0A020F03D25A0997E3FB2386030E77
X-C8649E89: 
 1C3962B70DF3F0ADE00A9FD3E00BEEDF3FED46C3ACD6F73ED3581295AF09D3DF87807E0823442EA2ED31085941D9CD0AF7F820E7B07EA4CF5794AB131328BC4954084840F70DCF8BCC9F39E65B9BED622E6AE8BEE6D25458F964158C91B2A10B7BBDB0A562C82D59FB6E383D7E5B7F83A4FA568D272421B0E4EB81C25D25832B4C41F94D744909CEE921556F0E976A29E6EC0772259F8F8F8815B87D7EC76CB9
X-D57D3AED: 
 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojTPX5czuwuGEtQdxCMaPszA==
X-Mailru-Sender: 
 689FA8AB762F73930F533AC2B33E986BA03479BD6AC6EE6815F6676A572F0D5B98CC072019C18A892CA7F8C7C9492E1F2F5E575105D0B01ADBE2EF17B331888EEAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
Message-ID-Hash: U6IJNGH4CP4DS6S6DAI2LAE24HQQV53C
X-Message-ID-Hash: U6IJNGH4CP4DS6S6DAI2LAE24HQQV53C
X-MailFrom: fido_max@inbox.ru
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U6IJNGH4CP4DS6S6DAI2LAE24HQQV53C/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The trigger-start/stop properties allows to specify DAI link
trigger ordering method.

Signed-off-by: Maxim Kochetkov <fido_max@inbox.ru>
---
 .../bindings/sound/simple-card.yaml           | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index 59ac2d1d1ccf..f1878d470d83 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -99,6 +99,28 @@ definitions:
     description: the widget names for which pin switches must be created.
     $ref: /schemas/types.yaml#/definitions/string-array
 
+  trigger-start:
+    description: |-
+      Start trigger ordering method:
+      default: Link->Component->DAI
+      ldc: Link->DAI->Component
+    $ref: /schemas/types.yaml#/definitions/string
+    items:
+      enum:
+        - default
+        - ldc
+
+  trigger-stop:
+    description: |-
+      Stop trigger ordering method:
+      default: DAI->Component->Link
+      ldc: Component->DAI->Link
+    $ref: /schemas/types.yaml#/definitions/string
+    items:
+      enum:
+        - default
+        - ldc
+
   format:
     description: audio format.
     items:
@@ -210,6 +232,10 @@ properties:
     maxItems: 1
   simple-audio-card,mic-det-gpio:
     maxItems: 1
+  simple-audio-card,trigger-start:
+    $ref: "#/definitions/trigger-start"
+  simple-audio-card,trigger-stop:
+    $ref: "#/definitions/trigger-stop"
 
 patternProperties:
   "^simple-audio-card,cpu(@[0-9a-f]+)?$":
@@ -259,6 +285,11 @@ patternProperties:
         maxItems: 1
       mic-det-gpio:
         maxItems: 1
+      trigger-start:
+        $ref: "#/definitions/trigger-start"
+      trigger-stop:
+        $ref: "#/definitions/trigger-stop"
+
 
     patternProperties:
       "^cpu(-[0-9]+)?$":
-- 
2.40.1

