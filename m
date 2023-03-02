Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 812226ACACF
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Mar 2023 18:40:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C64181141;
	Mon,  6 Mar 2023 18:39:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C64181141
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678124427;
	bh=PBHQ2YaiO+Kb0G+Zsb50BNzMNdU9/0QHXu2V4sDcIzM=;
	h=From:Date:Subject:References:In-Reply-To:To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AtuwPwAuK/88qqltwzRnhdt5dLC4BhRdjwxo18rQsO9BTzPLDCWFWsH/XqSkvEEz+
	 SiJvSRM5E29/1XpOBvgIjG8EKIV2EB+SjU7Flwf1JfS6nlLSE1RQeStVLfqJzae7hC
	 cEzvAZ0TnsCkPhBa/nbUU7CUlASfpWQVK9IFPMJI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 15EDBF804B1;
	Mon,  6 Mar 2023 18:38:48 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4C792F80310; Thu,  2 Mar 2023 12:57:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from out-18.mta1.migadu.com (out-18.mta1.migadu.com
 [IPv6:2001:41d0:203:375::12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 85CDCF8049C
	for <alsa-devel@alsa-project.org>; Thu,  2 Mar 2023 12:57:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 85CDCF8049C
Authentication-Results: alsa1.perex.cz;
	dkim=pass (1024-bit key,
 unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256
 header.s=key1 header.b=xEL5Mwbq
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1677758241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AR5vfcbTzXg9GS9xts3Lxqv5/GJy7ozqxusymEf3afo=;
	b=xEL5MwbqhEW/vkHHggpCjUihFiwwscme7Ym7cn7njoh9i5up9Qq5IN3roJUWuLzSrwAafy
	6nuRb4mUGB2rYjivL9tVTqWqY5tLYIXPLoUSW9Vz2vB7CDL6bQzXpkO3bkIBiZEbAM1xoJ
	yA+F9n/NbDz/Uhp8IWXq03+Y4rYqF+M=
From: richard.leitner@linux.dev
Date: Thu, 02 Mar 2023 12:55:02 +0100
Subject: [PATCH 2/3] ASoC: dt-bindings: maxim,max9867: add "mclk" property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230302-max9867-v1-2-aa9f7f25db5e@skidata.com>
References: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
In-Reply-To: <20230302-max9867-v1-0-aa9f7f25db5e@skidata.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Ladislav Michl <ladis@linux-mips.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Benjamin Bara <benjamin.bara@skidata.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153;
 i=richard.leitner@skidata.com; h=from:subject:message-id;
 bh=bMNg7GqHmP3qmoCg4huIjZzqkxCE2jKo6J6fNpJ+8ks=;
 b=owGbwMvMwCX2R2KahkXN7wuMp9WSGFIY+uUZl4XzaBlcvvyYkbF0S63p1x1bTl9f5Xlnb0Dkcb27
 GZ9+dJSyMIhxMciKKbLYG3O1u+eWva9U1MmFmcPKBDKEgYtTACYiu47hv/fyK+tYfm98tmiN8OOAnI
 qsGz/bv/7fPXeyr52E2+cH6rqMDGt92Cs2bOXVTyg35Ih2NQlPrZJ1vR6+MKpgV/9tVg45DgA=
X-Developer-Key: i=richard.leitner@skidata.com; a=openpgp;
 fpr=3F330A87476D76EF79212C6DFC189628387CFBD0
X-Migadu-Flow: FLOW_OUT
X-MailFrom: richard.leitner@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SURX7CTGPJGS6HR4HQOATYRXNTSXIA6J
X-Message-ID-Hash: SURX7CTGPJGS6HR4HQOATYRXNTSXIA6J
X-Mailman-Approved-At: Mon, 06 Mar 2023 17:38:43 +0000
CC: alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Richard Leitner <richard.leitner@skidata.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SURX7CTGPJGS6HR4HQOATYRXNTSXIA6J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Richard Leitner <richard.leitner@skidata.com>

Add clocks and clock-names properties to require a "mclk" definition for
the maxim,max9867 codec.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 Documentation/devicetree/bindings/sound/maxim,max9867.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/maxim,max9867.yaml b/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
index cefa43c3d34e..152340fe9cc7 100644
--- a/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
+++ b/Documentation/devicetree/bindings/sound/maxim,max9867.yaml
@@ -35,9 +35,17 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    const: "mclk"
+
 required:
   - compatible
   - reg
+  - clocks
+  - clock-names
 
 examples:
   - |
@@ -46,6 +54,8 @@ examples:
                     compatible = "maxim,max9867";
                     #sound-dai-cells = <0>;
                     reg = <0x18>;
+                    clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI3_MCLK1>;
+                    clock-names = "mclk";
             };
     };
 ...

-- 
2.39.2

