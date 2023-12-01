Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C340C800E21
	for <lists+alsa-devel@lfdr.de>; Fri,  1 Dec 2023 16:10:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B076828;
	Fri,  1 Dec 2023 16:10:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B076828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1701443413;
	bh=38wj4TRML2NmpVWHDGWZ7lyYIsFw7bWFSFPePEL0QD4=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=oGkYbvdbiXFNWFH+F4w/EjFaB5RIDzeDgnzmEsCMS/HZZgB+Q1w/Fyq+bpcNjZ3K7
	 UxHECHCNgDyfMEWrarvORlVPLfZKKv8khzB8Kw9CnVCbm8R2kpfw13cvEZpaR+51Ww
	 TaGXuaA9phaLixk3DQ3qwBveYWP+iPZPJbmhm8TA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 97C9FF805C3; Fri,  1 Dec 2023 16:09:23 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B04BF805BF;
	Fri,  1 Dec 2023 16:09:22 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 57739F80254; Fri,  1 Dec 2023 16:09:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9D6ACF80114
	for <alsa-devel@alsa-project.org>; Fri,  1 Dec 2023 16:09:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D6ACF80114
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=U/jFevHx
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40b4c2ef58aso22332805e9.0
        for <alsa-devel@alsa-project.org>;
 Fri, 01 Dec 2023 07:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701443339; x=1702048139;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gNZ7R4MQGFffrobU6ni4L3zapKkTqgLoMNn8PZTR5i0=;
        b=U/jFevHxYmsKHCqvN3HFSLEd/uEkcv8ji+Twag7lxH5aT3VJ4ZekPBYTvoXLbwi00W
         7tOLGC/qnVDG8B0tuJ6q4c/YiifEHVfkz6xGCkLp6eIGjhzQj+oEIlVwKOdPWp1usMbS
         ccFtwrgEJ42YHUuWFjxsXUQgox4iaIIJyQbL/fi+KSG1n1ZPNPhKmSGHYPrGuIihYid4
         a+6BuUrku3VApA9LLjjgjQSfZC/y2BSX2zYsYeJb6GI9RfdRK6ZLdWdKCjJz/245mjCd
         T1audaQWmimasHBgky/g/tzdkE8bFAQpP6welWOFOa1OsrXLa2a+BHdjfK9yjG5FCU5m
         LMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701443339; x=1702048139;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gNZ7R4MQGFffrobU6ni4L3zapKkTqgLoMNn8PZTR5i0=;
        b=Ez0YTPZWZIr54g6HgMC9cvC+jGcsu37qoRow32wLtPSb8TlVcblrY8TISZNkvUcCDC
         Ipe7uvakbMreDAC4p1EQjs1KQ9MGw2Y62lza1ep/dbdv/DVuB3y8hg62LkVN1vQ+GIxD
         k6Kx7hRhywtIvN+eaySb1ghrGFwDaFjrnR+Tv6ARnTGm2osvOd/HlpB+8wsmgCT2Yyug
         60LcV0IBVPL6B8LfvVMNZdfoCdpGKIY6ihswEfeWmxRDu5MFqbSFgPK3g9RJwchgTciq
         KFgeVcOuW4Js0fIToSVJ0A/SENW7wN2VRVnEyOCTNZrlDkeLR9CnEH/NRLOQ460Vtqab
         WpHw==
X-Gm-Message-State: AOJu0Yztct4mzt/oLC7YOweDoiM0LWPxifqvp80Yji3Lj03ziOgFNQ0X
	HrObxmrm70N5k3ibM9l4WJ/zMA==
X-Google-Smtp-Source: 
 AGHT+IFsi7k0cOV2CTRev6zhLhejCpJuKEr2xRKSS7XaIC1GAnoHZJlhes2/zkILjlrM0IT/88e2rw==
X-Received: by 2002:a1c:4c08:0:b0:40b:5e59:f70e with SMTP id
 z8-20020a1c4c08000000b0040b5e59f70emr273807wmf.128.1701443339595;
        Fri, 01 Dec 2023 07:08:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 fs20-20020a05600c3f9400b0040b5517ae31sm8569539wmb.6.2023.12.01.07.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 07:08:59 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/5] ASoC: codecs: add support for WCD939x Codec
Date: Fri, 01 Dec 2023 16:08:53 +0100
Message-Id: 
 <20231201-topic-sm8650-upstream-wcd939x-codec-v2-0-94ed814b25aa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAX3aWUC/5WNQQ6CMBAAv0J6dg1doIon/2E41O4CmyglLSKG8
 HcrP/A4c5hZVeQgHNUlW1XgWaL4IQEeMuV6O3QMQokV5lhojQVMfhQH8Xk2VQ6vMU6B7RPejuq
 iXsB5YgeuNK1Bfa8qKlUqjYFbWfbLrUncS5x8+OzTWf/sf/1ZQw6oqbRU48kQXx8y2OCPPnSq2
 bbtCy7L4JHXAAAA
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3757;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=38wj4TRML2NmpVWHDGWZ7lyYIsFw7bWFSFPePEL0QD4=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlafcI7JbVO734mB4tTMVAtImtrBrBrmo6qM/8Odho
 ZjHTfjuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZWn3CAAKCRB33NvayMhJ0U/UEA
 C8tw+QSmBj0o4fhv+oL9yLD5m+bFeoziZDnIipCce2w/ww24ga5Fkwm6PUYW9KPYeFERzIs7w6EkjM
 Dsbka2UyO8UI195/MxiU4zYpPtjHik3fTsGKSS7J3Crh7ECZRHpXj9FjPPgyD1lXw4bMYW6iozc33A
 88KiVor6oxDHA5cJJAKjy5v5zQzQw8giP4vpQ1R74LCxpQgSJ9CKvyt4L0ri2iojmzbF+9h+BM3UoT
 X1zRH0RldvIGzFx/GOtUMxu0XRRFo8t1s1mmxdLJ42Myk+wn8X8J7abf5VhrA5u69KUTI11hmaEcLo
 CC1bzjotRh4ZJ5HACBLgXM8N2Sseqj/rab2getI1Rzwo2RZIFvxM7V0UjsAt9Pz/StpTW1jVkM+ABE
 ng+Ve7/Nz5+1ub3k7pBkuRI3upQJz++SjGTxTeBsbw7KazeeEesEhTpvgv3bdGY5MhOig18CX2I5aQ
 zse7mFAEgb38xDOK2O4Q/sXIqmTX4BU9/OkT2MM1jC9fbLk0ostLz41Twn55v9mUW3S1zBumCZJkM9
 TyJle2hymBlbzvCNIt9EM4xp40tWq84vRyVrDZ6eIToupvW+5oF3zm55xJBPF8J3YyaCva8njiME9y
 YJ5vpw3ifN/1lNrp9X5EhKvHxkYB+2xLc//So+bVjOzciiOSt6ot25HSQ0Kw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: ONE62UIQQBFE3ECYGZMFJEXE4PN6QS5J
X-Message-ID-Hash: ONE62UIQQBFE3ECYGZMFJEXE4PN6QS5J
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/ONE62UIQQBFE3ECYGZMFJEXE4PN6QS5J/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Add the main WCD9390/WCD9395 Audio Codec driver to support:
- 4 ADC inputs for up to 5 Analog Microphones
- 4 DMIC inputs for up to 8 Digital Microphones
- 4 Microphone BIAS
- Stereo Headphone output
- Mono EAR output
- MBHC engine for Headset Detection

This adds:
- bindings
- MBHC changes to support Type-C muc
- Soundwire Slave driver
- Code driver

The USB Mux subsystem support will be submitted separalety
since it's a functionally separate subsystem connected over
I2C with it's own reset signal.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v2:
- Bindings:
  - Dropped all references to "Slave" or "Host" terminology when possible
  - Collected review for first patch
  - Added wcd9395 as fallback of wcd9390
  - Fixes typos errors
- MBHC:
  - Dropped all references to "Slave" or "Host" terminology when possible
  - Fixed EXPORT_SYMBOL into EXPORT_SYMBOL_GPL
  - Fixed typo in commit message
- Soundwire Devices driver
  - Dropped all references to "Slave" or "Host" terminology when possible
  - Dropped comments and unused code
  - Reworked wcd939x_swr_get_current_bank()
  - Added comments to wcd9390_interrupt_callback()
  - Reworked regmap's wcd939x_readonly/volatile_register checks
  - Added comments explaining while bind/unbind are empty
  - Added comment on SDW_SLAVE_ENTRY meaning
  - Added more register fields defines
  - Style fixes
- Codec driver
  - Dropped all references to "Slave" or "Host" terminology when possible
  - Added MICB_BIAS_ values enum and used them in the code
  - Moved zdet_param to the top
  - Added TLV data for ear_pa_gain and used it
  - Defined as much as possible every bit field used on/from register
  - Replaced 1/0 to true/false when writing to single bit fields
  - Replaced for loop on all bits with ffs(), simplified code
  - Simplified MICB fields handling code
  - Reworked and simplified wcd939x_get/set_compander and other kcontrol get/setters
  - Reworked and simplified MHGC impedance/zdet/qval code, dropped dead code
  - Added comments on wcd939x_wd_handle_irq() utility
  - Added comment on the interrupt handling architecture
- I've not moved common code yet, I'll probably do later since it would alter wcd939x code
- Link to v1: https://lore.kernel.org/r/20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org

---
Neil Armstrong (5):
      ASoC: dt-bindings: qcom,wcd938x: move out common properties
      ASoC: dt-bindings: document WCD939x Audio Codec
      ASoC: codec: wcd-mbhc-v2: add support when connected behind an USB-C audio mux
      ASoC: codecs: Add WCD939x Soundwire devices driver
      ASoC: codecs: Add WCD939x Codec driver

 .../devicetree/bindings/sound/qcom,wcd938x.yaml    |   81 +-
 .../bindings/sound/qcom,wcd939x-sdw.yaml           |   69 +
 .../devicetree/bindings/sound/qcom,wcd939x.yaml    |   96 +
 .../bindings/sound/qcom,wcd93xx-common.yaml        |   95 +
 sound/soc/codecs/Kconfig                           |   18 +
 sound/soc/codecs/Makefile                          |    7 +
 sound/soc/codecs/wcd-clsh-v2.h                     |    1 +
 sound/soc/codecs/wcd-mbhc-v2.c                     |   95 +-
 sound/soc/codecs/wcd-mbhc-v2.h                     |    3 +
 sound/soc/codecs/wcd939x-sdw.c                     | 1584 +++++++++
 sound/soc/codecs/wcd939x.c                         | 3655 ++++++++++++++++++++
 sound/soc/codecs/wcd939x.h                         |  983 ++++++
 12 files changed, 6592 insertions(+), 95 deletions(-)
---
base-commit: 07b677953b9dca02928be323e2db853511305fa9
change-id: 20231123-topic-sm8650-upstream-wcd939x-codec-c46f621b55d4

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

