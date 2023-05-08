Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 643316FD715
	for <lists+alsa-devel@lfdr.de>; Wed, 10 May 2023 08:34:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E60A0105C;
	Wed, 10 May 2023 08:33:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E60A0105C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1683700454;
	bh=MFTfbBLuPcHDNfZ2MnkBhB/m8oYc/ArheECn8hWby+0=;
	h=To:Subject:Date:In-Reply-To:References:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From:Reply-To:Cc:From;
	b=TB4r0LlGIUs26Ap2FCeNUsYZz3dbFGNkk3mwsQqsbc6E5I0Ycx0VXYQSWA3+7/xl/
	 Oa1WodbljbKIknGbMESnw4mUFlRiF+Dyyyp7zS5eG23aXyA1L0ow9H3e7EnflyLXtt
	 wo/FrwagkvL2zjJF+6RoWYS3Bi1Qh/5Ui1cUxvUw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BDF6CF80570;
	Wed, 10 May 2023 08:32:23 +0200 (CEST)
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 4/7] ASoC: dt-bindings: Add Google Chameleon v3 audio codec
Date: Mon,  8 May 2023 13:30:34 +0200
In-Reply-To: <20230508113037.137627-1-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
X-Mailman-Approved-At: Wed, 10 May 2023 06:32:16 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SV7I5G5NA7CQU7FETNJSXY7RKINL4HGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>
MIME-Version: 1.0
Message-ID: 
 <168370034318.26.12268904270128437386@mailman-core.alsa-project.org>
From: =?utf-8?q?Pawe=C5=82_Anikiel_via_Alsa-devel?=
 <alsa-devel@alsa-project.org>
Reply-To: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Cc: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
Content-Type: message/rfc822
Content-Disposition: inline

Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AE988F80534; Mon,  8 May 2023 13:32:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 60C32F80310
	for <alsa-devel@alsa-project.org>; Mon,  8 May 2023 13:31:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 60C32F80310
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=semihalf.com header.i=@semihalf.com header.a=rsa-sha256
 header.s=google header.b=n8CNxVHO
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4efe8b3f3f7so5006060e87.2
        for <alsa-devel@alsa-project.org>;
 Mon, 08 May 2023 04:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=semihalf.com; s=google; t=1683545458; x=1686137458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shiQSDHxh2e+KlYJCYWsmpEL6ugBkLgWKoLDXET6U5s=;
        b=n8CNxVHOk+38/s0589knvXD81SPym5aqdK0A73K52Br0MOHeFOM9Gr1OdsbbgzcbgP
         CdI1J7TsZjoVcLmoHVrfwtp7KnxCGHSnxbAH9Nin+SFoCizJewq0XFhB4glBWCgP5flD
         Uq6+pxH1hJy/WdI3ksWcwMGf3Zndb1eNYiO5mXQtTGQe/C+VNe30Jje6G9Q5hVsZQLme
         19iNgCeO8LSwrAwfo+zp9FoXx1WRS1e+ZE+2Ls+m9HrnCGJ4XU+Urxkfo4qCBBJAGGfg
         n0QW1h1NoKyf+nGMljdfdfHOhgohcigAgK40Zhwpg5+iNmWFgPoQoMdhpUGVu3xm3cg1
         bDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683545458; x=1686137458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shiQSDHxh2e+KlYJCYWsmpEL6ugBkLgWKoLDXET6U5s=;
        b=PDn+J8lI2I63U0iWt1/mdvSMC4dl/wMBmv+AL+T190Zi4TzOwDSmfAiflt9Sn3ipPi
         DmJAaEY+Myo85C0NfOoUmOE1S0dTXBqNlMT08nKju3jUzjPrrMW0Vz7BBwqlY1AbJK02
         o9OBiiWKsJfgnSD3KdnV5urw4RsgJtOb9cyVWT8H4Uvz7uZs9isgsEpLGgUWACLzasx4
         kTq/UiyEH8/gfNVKcii2KUINL/Htu83XEebVPC2/JR75QSqKAPx3axAUwpXzq4eYkQK0
         1gKDghTQFYCB7SLr24uRmaAw1QtBp6yXQ31Iw8f1rAkEMRTg4AK/264O+clXv4uwlazr
         XJ9w==
X-Gm-Message-State: AC+VfDyMArjemZyRhR0vgU8SYQ9P/EkgOHeZRgYf8tJf3ZzztpGuDfpd
	St/251+c7J2p/6nNfKg/yoehi61BHqsa8eRhQK8=
X-Google-Smtp-Source: 
 ACHHUZ50+PimcUDxTXMGgv4EmguGyZF2tQHBDg+ZcDZGs3SUV4qB2dxtuCHtl09GTLefG4MJiuTaHw==
X-Received: by 2002:ac2:4461:0:b0:4ee:e0c7:434d with SMTP id
 y1-20020ac24461000000b004eee0c7434dmr2134076lfl.51.1683545458729;
        Mon, 08 May 2023 04:30:58 -0700 (PDT)
Received: from panikiel.office.semihalf.net ([83.142.187.84])
        by smtp.gmail.com with ESMTPSA id
 k8-20020a2e2408000000b002a8b9353338sm1144406ljk.117.2023.05.08.04.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:30:58 -0700 (PDT)
From: =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
To: alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH v2 4/7] ASoC: dt-bindings: Add Google Chameleon v3 audio codec
Date: Mon,  8 May 2023 13:30:34 +0200
Message-ID: <20230508113037.137627-5-pan@semihalf.com>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230508113037.137627-1-pan@semihalf.com>
References: <20230508113037.137627-1-pan@semihalf.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: pan@semihalf.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: SV7I5G5NA7CQU7FETNJSXY7RKINL4HGH
X-Message-ID-Hash: SV7I5G5NA7CQU7FETNJSXY7RKINL4HGH
X-Mailman-Approved-At: Wed, 10 May 2023 06:32:16 +0000
CC: tiwai@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 dinguyen@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
 upstream@semihalf.com, amstan@chromium.org,
 =?UTF-8?q?Pawe=C5=82=20Anikiel?= <pan@semihalf.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/SV7I5G5NA7CQU7FETNJSXY7RKINL4HGH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add binding for google,chv3-codec device.

Signed-off-by: Paweł Anikiel <pan@semihalf.com>
---
 .../bindings/sound/google,chv3-codec.yaml     | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/google,chv3-codec.yaml

diff --git a/Documentation/devicetree/bindings/sound/google,chv3-codec.yaml b/Documentation/devicetree/bindings/sound/google,chv3-codec.yaml
new file mode 100644
index 000000000000..5329dc140b1c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/google,chv3-codec.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/google,chv3-codec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Chameleon v3 audio codec
+
+maintainers:
+  - Paweł Anikiel <pan@semihalf.com>
+
+allOf:
+  - $ref: dai-common.yaml#
+
+properties:
+  compatible:
+    const: google,chv3-codec
+
+  "#sound-dai-cells":
+    const: 0
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    audio-codec {
+        compatible = "google,chv3-codec";
+    };
-- 
2.40.1.521.gf1e218fcd8-goog

