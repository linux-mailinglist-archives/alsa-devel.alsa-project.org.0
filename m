Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7C796295C
	for <lists+alsa-devel@lfdr.de>; Wed, 28 Aug 2024 15:54:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3296486F;
	Wed, 28 Aug 2024 15:54:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3296486F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1724853283;
	bh=W2qT+nbE+KGIf64JgDj7bPJT7KbQfb1ZNolRePACrmA=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=AT1AwnIAGgAsrqYqHEr8A3QwYJ+JXDq3EQ0nYWweIeMdkIeOtpE7//E8mwA3uaEFP
	 n6KzmTRUl7g1y9zp/ss5UDsKr2nP0AOoz/TmV0uL7Vl86lVp4ERkOLKW2vn7UqhVxQ
	 SwDDWP0PWp0z7f32OTcmFHhGs2YMdNoDi5/Ip9EM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AA883F805AE; Wed, 28 Aug 2024 15:54:11 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9AF7BF805A0;
	Wed, 28 Aug 2024 15:54:10 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6FC76F80528; Wed, 28 Aug 2024 15:54:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 87650F8025E
	for <alsa-devel@alsa-project.org>; Wed, 28 Aug 2024 15:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 87650F8025E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=oGhiyTXU
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3719398eafcso3923573f8f.1
        for <alsa-devel@alsa-project.org>;
 Wed, 28 Aug 2024 06:54:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724853241; x=1725458041;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PsWzKaC8r3z3iwI7ze5w6BhtUaD0ABZEzQQaTYtnZn4=;
        b=oGhiyTXU3yME5VQUKdQLivhUdk1gkoBNwnlMozPeHUe7gfprysUuexRg/4YGVeDXfy
         irirJy1giEbxy+lWFRdKVZB7oppZyHwXvGSHqVTbvDKhAkHPRcd4mREazbFhrxgHmFFm
         UgTJtZRXcKFhFYJMK3CReTI+6T++9pPadgsDKL0oTfsTofRHzhwpOZ4d6gqGDuzXGTJh
         p9zMkq7WLbs3WBu8z60XgNUNCXiMrXk9sPtan8u0752ejZsS30YTO7AeZ8vIfXe+6Gy9
         KbM3rMejAWL7ysg2B3Ffvyt+UPsnOYVus3HgOwB+cZ69Ky23n0rjhzeALuUjQ6I6Fgha
         xgpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724853241; x=1725458041;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PsWzKaC8r3z3iwI7ze5w6BhtUaD0ABZEzQQaTYtnZn4=;
        b=deE5gAPUyauzhvf9CkQ2sb4/NVLj5PokrD3r6KaoSbeHPKPJLLvK4LLLZ9TFoJrLu5
         YtRfqtsw+c9QkW44C4PDAngfhTQ0ABCuzq+6LyT1jKaLpfXn6+V3+DStnJxmiFIQHz28
         NYGimUlhXP2Tg0a/y61wAT+zXoup0XhUVndMUSwidBA7XB1KGGH2WMV1N/1/Dbr+AtUx
         +4twAKfo6ssKj58DgVOyKCDOv1okUiiuuwZXkkn0oOHKZuRHaAkwDywweAxvYzFoaW/S
         XKgNBzd0bhYj0iPJ0iz614sSIEapytyRyG2R/MVmgGId+gK6dmNQJhAIOwNw9xa67WyK
         /qiA==
X-Gm-Message-State: AOJu0YxpBtCtzCea8rEV2Oz7Ago9IjuDQUrzuh6iBIGDFEMJJnNDR8BZ
	79KisMbKsvqusAhisChT8abt7jOpzjdeVfhDxEOA5IGOAwXvjhYVYCyFmSTQWrM=
X-Google-Smtp-Source: 
 AGHT+IGYNhcSsHhA50Pc1ZE3GvXf2OgkY55sS2VidB4C2ZkfpkxCDxWyLcO8SIagveLtAqlTErYVvQ==
X-Received: by 2002:a5d:6111:0:b0:371:a844:d331 with SMTP id
 ffacd0b85a97d-373118fc172mr10240865f8f.62.1724853240598;
        Wed, 28 Aug 2024 06:54:00 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3730813c44asm15613395f8f.34.2024.08.28.06.53.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 06:54:00 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/3] ASoC: dt-bindings: amlogic-sound-cards: document
 clocks property
Date: Wed, 28 Aug 2024 15:53:53 +0200
Message-Id: 
 <20240828-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v2-0-58159abf0779@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPErz2YC/6WOQQ6CMBREr2K69pu2VhRX3sOwqO2n/ARa0g9EQ
 7i7lSu4mrzJZGZWwZgJWdwPq8i4EFOKBfTxIFxnY0AgX1hoqY2slIEpjeTADn0KReeRp4x2gBd
 FTzEwtPRGBjt7SsDRg7PZg3aV0c75oihK9Zhxz5XmZ1O4I55S/uwvFvVz/xxcFEio28vV1yjV7
 WwePUWb0ynlIJpt275XTao2+QAAAA==
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5950;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=W2qT+nbE+KGIf64JgDj7bPJT7KbQfb1ZNolRePACrmA=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmzyv1/ZMuhoHR5pewIyF5Gq+f8UGw7T/m3E0Pig6d
 v47cuCGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs8r9QAKCRB33NvayMhJ0fnGD/
 wLvs8Egp00XPNWKHBIC7q7bcXodhwunPgAOFqpH1cksGb0adPigFWPnTjhBvqwGGGhOJgriDhoRAGb
 1woPAgTxo96yPq4y/rOUeYrDphxqx1JrATxTausbPL90AyGRCD0kUMfk/RrnLy69k5xWohubgGA7fD
 nT+qmhS1Krsub6kIvmu6KMX6AJctbDhBXDxCBY/hEIkmVWSoTlA9uBYBYQw0PVSP5+QuaIwEGAlA3+
 ka0JH8r1kSa4pLYwgrulUHpSS4xtUX49o+krg25UcEbWwr4fVcebHkCILobKPdcs1W1zbK7Okl0c4u
 XrJzhrUcnK6wWuPaLy/NGi1l9+eFP4wSYm+v2t32Q2OzTZruBpI90pTUCpmoAd9RU/zAKctieznRQg
 U8Ss+nck4wPHvbUN84+uY+6mny4pnIfE30uezrObARDrMwHc9Hdl9XDX+kPXGK9zyOXNSAkgpXQmws
 TL4VoO5Hnr7I7SzygZhESUanUjzbwAAVFu3ujUkgUfUworJRpTejrKHjip2S3BUjE1TWq7kkGflz4F
 gMCH9XdPE/ix4Osjkw1SIs/vONUpn5MsV83r5SoaeYX5SFz71RtFuk+RmhioViGTCg66piwhgE1J7H
 AuQTT9amtEy4KQ4/kHU5kwamsatOXJulV86VZ9vNbOpLdsv63fmrqMCDvzVA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: R3TJPE6JSEZ3HSS4WRIT7NHJDCZPTHFO
X-Message-ID-Hash: R3TJPE6JSEZ3HSS4WRIT7NHJDCZPTHFO
X-MailFrom: neil.armstrong@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/R3TJPE6JSEZ3HSS4WRIT7NHJDCZPTHFO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Following an off-list discution with Jerome about fixing the following
DTBs check errors:
    sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
        from schema $id: http://devicetree.org/schemas/sound/amlogic,axg-sound-card.yaml#
    sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
        from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
    sound: 'anyOf' conditional failed, one must be fixed:
        'clocks' is a required property
        '#clock-cells' is a required property
        from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

It has been agreed documenting the clock in the sound card is a better solution
than moving them to a random clock controller or consumer node which is not
related to the actual meaning of those root frequencies.

The patchset adds the clocks proprty to the bindings and finally adds the
properties to the DT files.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- drop clock-names in bindings & commit messages
- fix new boards
- drop RFS
- Link to v1: https://lore.kernel.org/r/20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org

---
Neil Armstrong (3):
      ASoC: dt-bindings: amlogic,axg-sound-card: document clocks property
      ASoC: dt-bindings: amlogic,gx-sound-card: document clocks property
      arm64: dts: amlogic: add clock and clock-names to sound cards

 .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml          | 7 +++++++
 Documentation/devicetree/bindings/sound/amlogic,gx-sound-card.yaml | 7 +++++++
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts                     | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts                  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts              | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts                  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts                    | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts                 | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts      | 4 ++++
 .../arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-dreambox.dtsi               | 6 ++++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts                | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts              | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts                  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts         | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi              | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts              | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts             | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi             | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi                | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts                 | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts             | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts                | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts                    | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts                    | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts             | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts       | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts         | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts    | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts       | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dts             | 5 +++++
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts              | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts                | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts                 | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi                 | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi        | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts          | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts               | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts          | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts              | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts                  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi                  | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts                   | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts             | 4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts                  | 4 ++++
 52 files changed, 217 insertions(+)
---
base-commit: cb2361c78068ec47c3a6222d71f664b67665550e
change-id: 20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-2c642ccd2c6e

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

