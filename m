Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C95DA90901F
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jun 2024 18:24:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D35B0E66;
	Fri, 14 Jun 2024 18:24:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D35B0E66
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1718382298;
	bh=sS9FsJVE243d0WeteqT/1ZGnFSB10RXVtcZOuky7qhI=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=YT1pfhHe/DNTDJVMIoHmiI/KFvbqtleTB/8Jncc9W/iwI439DNpiPXtcKUEVxutds
	 eABVIpJbCJTCi+NDt2OVEHccX1hHHJ1V8tUenpwyT3wvioX44I7v8UNofFZqUy5p75
	 Zm6PXMIj638sILxA5TBBPZv6AsuYIr3goessj9Qo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1D8AEF805AD; Fri, 14 Jun 2024 18:24:27 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 20509F80496;
	Fri, 14 Jun 2024 18:24:26 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5AFBEF80579; Fri, 14 Jun 2024 18:24:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9F963F800E9
	for <alsa-devel@alsa-project.org>; Fri, 14 Jun 2024 18:24:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F963F800E9
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=H+6HcqaA
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-35f090093d8so1908740f8f.0
        for <alsa-devel@alsa-project.org>;
 Fri, 14 Jun 2024 09:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718382248; x=1718987048;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=put13URUC593SztdFC6LSEgjQ2u1ih6bSw5FHdIqhSg=;
        b=H+6HcqaAP0/4OEXGMEx9HMDtkkrLNBPIHrF1D53+jKt4ksOxZBbjAaTROg3sy8jn7Q
         G9SbUyP2vJfk3vM0YrE95nI4aeaCBG1UDWDwX+w09dJmZsiVldQl9e/Tu+oveWlTrpW5
         h2JlkMtsUD4+3wbCvhkJVci+p2dueK19SO42YdEC0HM2DcRUp2XvIV7lziLAHaFzlBxo
         fPWspeH7TGM8H81D8Y0uk0e8PcVFmMLwz/Z9M5/pFQyAS6tekgdG+BUDuupMEwmTx7aG
         ftBMkhwcrK2mkxCKZo/HpX8NK3J/5XByUnj3wxlZDOXmlRb91FGH+uDqCG1qyJdK6bKI
         PlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718382248; x=1718987048;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=put13URUC593SztdFC6LSEgjQ2u1ih6bSw5FHdIqhSg=;
        b=k4kOL0ESh2ff79vUC7cdeny+YiZTQHa3ORm0GdwZisnyzTq6M90wNRU6ZeAXq8BzfO
         IM6BNXO3y8Kd89ToyU++nnd8/JG3y8o/WWVPCh0us9iGT3n0sBxHm+xZcaAp8hGVy5uz
         SNS37PjBe6WLmXJ5RshZ7nm509bwgLQbgFIQIGw8XKFPKUJ+0umT4EK5EiM2hev2RSyh
         Q12cZ5SQ5njQ4v+p024B3G/zjuIhhJUrTvCNh9Bv8Sxps5bMIw8lcdXnFXeNkMxyovEJ
         sSxur1kb1F8ymIFMOkKJ34RZ8CtJDZl7uT2REar0bsxTH0hOb6uJU2WrIV1RFaFISgs3
         ib5A==
X-Gm-Message-State: AOJu0YyjqhzPP4Ji0lLthyhYsuem1qIuYWsFVrIpiook1UdFtEeBCY0z
	iaNS+b1FXOCVR6hiEZGBLBqLYAVfryu86N01dEcWGDIgVnHj6DGB1hoogzv0wIc=
X-Google-Smtp-Source: 
 AGHT+IGMFRVbIiEZo+RBebjVEl7ueTmXDg735LDtznnpXDovGqgeT6L/jaYzgZuAW+s/dO7labznUg==
X-Received: by 2002:a5d:5187:0:b0:35f:1f23:691d with SMTP id
 ffacd0b85a97d-3607a780dfcmr2520291f8f.61.1718382247778;
        Fri, 14 Jun 2024 09:24:07 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36074e0e5adsm4931165f8f.0.2024.06.14.09.24.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 09:24:07 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH RFC 0/3] ASoC: dt-bindings: amlogic-sound-cards: document
 clocks and clock-names
Date: Fri, 14 Jun 2024 18:24:00 +0200
Message-Id: 
 <20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-v1-0-9f57d9e01834@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKBubGYC/x2MQQrCQAwAv1JyNtAuSw9eBR/gVTysSVwDdrds2
 iKU/t3gaRgYZgeTpmJw7nZosqlpLS7DqQN6p5IFld0h9CH24xBxqbMSpulTs3OdbWmSJnxqYS3
 Z8KVfMUwra0UrjJQaY6AxBiJ2Cvh6bvLv/HyH2/UCj+P4AfjpwlOLAAAA
To: Jerome Brunet <jbrunet@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5357;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=sS9FsJVE243d0WeteqT/1ZGnFSB10RXVtcZOuky7qhI=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmbG6lSLFDzo9pAh0PJ4DgWo/c5jJ2/VmjIS/DLHYZ
 5xoXzd+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZmxupQAKCRB33NvayMhJ0XUiD/
 sFiFA1YgFp0/JZkEYOqbL3rvO5Ws8p5jo26BTDPI3abVKhJ8E2pvYLkHQ7pEsDdSqIZsbRkxYVODd8
 j1k/Nllu1Nil/h53HBA5l7BIAr0GOOy6huIrFZrIFCUI5YMBupf7eenYc1swD1F9ljt/aixxyFFZo+
 iU5iaG6wcY9PEUMC/RATkdnue29TYMTkOwiSAYOOQHhE1wZm2zfGUTlO+MIgXPxsiRbbVIE3M/mF0v
 hcziJDFbG18tEUFoSFbsjY5VUu1pXNp6HwZabdqohCjagdm3jZrRyJX0r2rpeMXhLvGhEIeqliNa/l
 6L9Sn+pRXJ2qONmsd6eo1L//s1F3CC72bpG82oWIpDa1CKYOoQp1nfaAvGesI7czBcTrY2rVxe9tNB
 fLNEhLsbochDN3GrJ5JEBaw8h22vvDzpBp37nXxSD6EMSBh6zQwdFwfmFpvbpxQN9l1z/M8LV3eumf
 kEW99rNM0vUFhVMkeM78RRYjU3xxu5f2nYpBi4paPihxzGxQ2jHqq9f65MyXvJtIf6UClcilYVNXFZ
 5tSP/QSpE9b0syvfZSvfbxS3l2BinUfU0Hq4Dv0IVRoj0O/AJwoimDg45qIIDlnhmR8/Ky9Buyi4Zm
 8JjtT+8HFX0VpoHmIoFx5H0v+UMi7MZxNRY/WCaMfsiojsmLWD5jcWLR5pLg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: VPRBWDAMQYUZZYLVXIM6SOBQB33XNRCN
X-Message-ID-Hash: VPRBWDAMQYUZZYLVXIM6SOBQB33XNRCN
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VPRBWDAMQYUZZYLVXIM6SOBQB33XNRCN/>
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

It has been agreed documenting the clock and clock-names in the sound card
is a better solution than moveing them to a random clock controller
or consumer node which is not related to the actual meaning of those
root frequencies.

The patchset adds the clocks and clocks-names to the bindings and
finally adds the properties to the DT files.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Neil Armstrong (3):
      ASoC: dt-bindings: amlogic,axg-sound-card: document clocks and clock-names
      ASoC: dt-bindings: amlogic,gx-sound-card: document clocks and clock-names
      arm64: dts: amlogic: add clock and clock-names to sound cards

 .../devicetree/bindings/sound/amlogic,axg-sound-card.yaml    | 12 ++++++++++++
 .../devicetree/bindings/sound/amlogic,gx-sound-card.yaml     | 12 ++++++++++++
 arch/arm64/boot/dts/amlogic/meson-axg-s400.dts               |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-fbx8am.dts            |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-radxa-zero.dts        |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-sei510.dts            |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-u200.dts              |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12a-x96-max.dts           |  4 ++++
 .../arm64/boot/dts/amlogic/meson-g12b-bananapi-cm4-cm4io.dts |  4 ++++
 .../boot/dts/amlogic/meson-g12b-bananapi-cm4-mnt-reform2.dts |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-bananapi.dtsi         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gsking-x.dts          |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking-pro.dts        |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-gtking.dts            |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-go-ultra.dts   |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2.dtsi        |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-odroid-n2l.dts        |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-radxa-zero2.dts       |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-g12b-ugoos-am6.dts         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gx-libretech-pc.dtsi       |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gx-p23x-q20x.dtsi          |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-kii-pro.dts           |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nanopi-k2.dts         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-nexbox-a95x.dts       |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-odroidc2.dts          |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p200.dts              |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-p201.dts              |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-vega-s95.dtsi         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-hub.dts         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxbb-wetek-play2.dts       |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-libretech-ac.dts |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s805x-p241.dts         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-khadas-vim.dts   |  4 ++++
 .../boot/dts/amlogic/meson-gxl-s905x-libretech-cc-v2.dts     |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-libretech-cc.dts |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-p212.dts         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxm-khadas-vim2.dts        |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxm-nexbox-a1.dts          |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts           |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-khadas-vim3.dtsi           |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-libretech-cottonwood.dtsi  |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air-gbit.dts    |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-a95xf3-air.dts         |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m2-pro.dts    |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-bananapi-m5.dts        |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-h96-max.dts            |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-odroid.dtsi            |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-sei610.dts             |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air-gbit.dts       |  4 ++++
 arch/arm64/boot/dts/amlogic/meson-sm1-x96-air.dts            |  4 ++++
 50 files changed, 216 insertions(+)
---
base-commit: 2ceb903a0c515872bb0ca0156bc4e568651f1eb4
change-id: 20240614-topic-amlogic-upstream-bindings-fixes-audio-snd-card-2c642ccd2c6e

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

