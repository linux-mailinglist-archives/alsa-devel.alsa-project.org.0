Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD9C7227E8
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Jun 2023 15:54:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE5CF829;
	Mon,  5 Jun 2023 15:53:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE5CF829
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685973264;
	bh=W1jCt0g71EO+++ay8+gq6YLMZDQgnf3+KltF5E9KjHM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=uKy1l+ppi6erVk97u+aaIFT7YkTQDRmbOW7j75oudPjqIEskKVv2ixMb5fFpRRbhU
	 4lt6RUCFThXZCnkNa3Xm8PBNBvTVioj14KWSC96d+6R8oCiBxo6/cKVKnZt76qcVoP
	 iCRakqxlVc8mcs+ZACI9x0sDEeODsrwmZM7KWfOw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8F648F80558; Mon,  5 Jun 2023 15:52:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4744EF80548;
	Mon,  5 Jun 2023 15:52:46 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 96022F80132; Fri,  2 Jun 2023 11:03:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 97F2DF80132
	for <alsa-devel@alsa-project.org>; Fri,  2 Jun 2023 11:03:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 97F2DF80132
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=pqrs.dk header.i=@pqrs.dk header.a=rsa-sha256
 header.s=google header.b=PsUDUxex
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-97000a039b2so270244766b.2
        for <alsa-devel@alsa-project.org>;
 Fri, 02 Jun 2023 02:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pqrs.dk; s=google; t=1685696624; x=1688288624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lmqqRgiUwINg0zM6iswD1JyF/sKo+vBLZEf0BZFnUDQ=;
        b=PsUDUxexLrW3qJIJMMeH0z/bQvrHVeGXXEVIg6jC84q5cZT/2pA22ihuOt5kr8K32z
         Ce58wDcU3/NbbC6NfAn2EtyPPHo5Zn7rxiAZX5lGNOfrP4b5fjYvUvWXikGAVAM3G/Dm
         GNMbfO1VysCFDsZ4p7szujfKrewggNF76QAes8VQrtNFYr6KnXSoSBepumy6jmSiMVaY
         a/R3IGl5ZLeyrxQ1HmZXYhyxaWsgMa5S33yJBUxJ8gfb8HVSISXiTYJvDkBIZlaMA2OL
         3vzdxjXtcJCM66l8HcBeqsGP4fLMSsjDFKJqgXQwwfUVMzPNMcq18/KSFndgrgThlS89
         pMQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685696624; x=1688288624;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmqqRgiUwINg0zM6iswD1JyF/sKo+vBLZEf0BZFnUDQ=;
        b=Y/6P5GsrH8iD5HS8tuhoMDgSEEsalNVpgRL41O0u/TkbV+5fKzSQ1MdlY07W15IoVG
         hX1gHfPIylTwyIJXUEQrmWcRJntYkYsf1/3S6az7BkhQDVfKQYni43Rz5nsDXy8r9GSw
         5S/b4U1UVnZZ6hkVZbKJFu7gSmYrMuHlSvmdMeY1NZl+3ErlGuksTYjGaTsL1QCDLiYW
         LnHYaJ6tQaPb5nr14947LHgOvmpViHRF8w/oIAdyk65Ev9gqZjMu9AvMJSPwNHWWIZ1p
         J6DdL1YLmx7YiaIQOKn9KPcdAxhchYlzrSu8GOAsVPkBRRoJvt8foGldVwSLRbgaCcci
         NG4w==
X-Gm-Message-State: AC+VfDwkBhmT8EKSeqw7ZDgCYZ78HgPFCXGUirvV1lBZhbBX1fYKJnTu
	0Tl6+lLLg4c172GPC7OQhCENiQ==
X-Google-Smtp-Source: 
 ACHHUZ6FkgH9Pi4zxcCao3h6bU7K54MDeWgSQbT7iAsMjpkVsc6amBOT7zaP+p1lvup38fs0YdmhYw==
X-Received: by 2002:a17:907:9618:b0:953:8249:1834 with SMTP id
 gb24-20020a170907961800b0095382491834mr12522628ejc.16.1685696624649;
        Fri, 02 Jun 2023 02:03:44 -0700 (PDT)
Received: from localhost.localdomain (80.71.142.18.ipv4.parknet.dk.
 [80.71.142.18])
        by smtp.gmail.com with ESMTPSA id
 w23-20020a170906385700b009707fa1c316sm488031ejc.213.2023.06.02.02.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 02:03:44 -0700 (PDT)
From: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin@pqrs.dk>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] ASoC: dt-bindings: document new symmetric-clock-role flag
Date: Fri,  2 Jun 2023 11:03:18 +0200
Message-Id: <20230602090322.1876359-2-alvin@pqrs.dk>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230602090322.1876359-1-alvin@pqrs.dk>
References: <20230602090322.1876359-1-alvin@pqrs.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: alvin@pqrs.dk
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: WHKGHD7TDXFGCNRMQAJSTODTVDQUJSE2
X-Message-ID-Hash: WHKGHD7TDXFGCNRMQAJSTODTVDQUJSE2
X-Mailman-Approved-At: Mon, 05 Jun 2023 13:52:43 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WHKGHD7TDXFGCNRMQAJSTODTVDQUJSE2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Alvin Šipraga <alsi@bang-olufsen.dk>

The new flag specifies that both ends of the dai-link have the same
clock consumer/provider role. This should be used to describe hardware
where e.g. the CPU and codec both receive their bit- and frame-clocks
from an external source.

Signed-off-by: Alvin Šipraga <alsi@bang-olufsen.dk>
---
 .../devicetree/bindings/sound/simple-card.yaml        | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/simple-card.yaml b/Documentation/devicetree/bindings/sound/simple-card.yaml
index b05e05c81cc4..ce738d1a394d 100644
--- a/Documentation/devicetree/bindings/sound/simple-card.yaml
+++ b/Documentation/devicetree/bindings/sound/simple-card.yaml
@@ -27,6 +27,11 @@ definitions:
     description: dai-link uses bit clock inversion
     $ref: /schemas/types.yaml#/definitions/flag
 
+  symmetric-clock-roles:
+    description: |
+    dai-link uses same clock consumer/provider role for both CPU and Codec
+    $ref: /schemas/types.yaml#/definitions/flag
+
   dai-tdm-slot-num:
     description: see tdm-slot.txt.
     $ref: /schemas/types.yaml#/definitions/uint32
@@ -128,6 +133,8 @@ definitions:
         $ref: "#/definitions/frame-inversion"
       bitclock-inversion:
         $ref: "#/definitions/bitclock-inversion"
+      symmetric-clock-roles:
+        $ref: "#/definitions/symmetric-clock-roles"
       frame-master:
         $ref: /schemas/types.yaml#/definitions/flag
       bitclock-master:
@@ -181,6 +188,8 @@ properties:
     $ref: "#/definitions/frame-inversion"
   simple-audio-card,bitclock-inversion:
     $ref: "#/definitions/bitclock-inversion"
+  simple-audio-card,symmetric-clock-roles:
+    $ref: "#/definitions/symmetric-clock-roles"
   simple-audio-card,format:
     $ref: "#/definitions/format"
   simple-audio-card,mclk-fs:
@@ -230,6 +239,8 @@ patternProperties:
         $ref: "#/definitions/frame-inversion"
       bitclock-inversion:
         $ref: "#/definitions/bitclock-inversion"
+      symmetric-clock-roles:
+        $ref: "#/definitions/symmetric-clock-roles"
       format:
         $ref: "#/definitions/format"
       mclk-fs:
-- 
2.40.0

