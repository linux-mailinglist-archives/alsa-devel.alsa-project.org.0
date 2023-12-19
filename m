Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B388187CA
	for <lists+alsa-devel@lfdr.de>; Tue, 19 Dec 2023 13:46:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 79BA7E72;
	Tue, 19 Dec 2023 13:46:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 79BA7E72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1702989988;
	bh=2/6CQOwzdYlAg83zhhFF92wB59IPgOSmY++vmfHgixQ=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=NrOHQn1/wG1QqiUMDAdoIucPh+QBh4rysY5bdn/vBukZMOKMe91JFC656IBWCDjFw
	 JiMExEbLLs7PAbprdEPQYmyVDhHIGTtP1/TdYexkbBlS0Tj0FaqvEQbelEujk+ZnPQ
	 WyTz3bdJqmUV7A4jiynedknWm+cSqRmuFuYyA70o=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 93704F805A8; Tue, 19 Dec 2023 13:45:54 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50C92F80579;
	Tue, 19 Dec 2023 13:45:54 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D5D73F8055A; Tue, 19 Dec 2023 13:45:49 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id F41F1F8016E
	for <alsa-devel@alsa-project.org>; Tue, 19 Dec 2023 13:45:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F41F1F8016E
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jIjkKteT
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-33662243274so1377916f8f.1
        for <alsa-devel@alsa-project.org>;
 Tue, 19 Dec 2023 04:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702989939; x=1703594739;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DQfpKPPltWnEF7uL8FsRCxLxlxGvjxQdYA/zsOKlDMQ=;
        b=jIjkKteTyKGiLNRD/kO8XzmQ47U43ke+C9txHMtS05vtBsYwoXcRc0Wk1bJqJzk78A
         gIZyFRln5c4Bx4wLRk6bqIIEuh/tt16MH0jcqpY4AreSjq6Wa0ISNl9gnm3kTdYoImHn
         ONbecCO926jLBhL5rQjR4O8m8nqkDwvA+5miWDkn0UQDrnrIDs5T0LX5/WdFer66E7Er
         bQbcVMlm9D6zU0qZDddTwRX15VA5naHJTyuBMBPrLRGZU5/T794JLWiI/oTCNPhCfwBj
         hY2vlVV0xL5qtOTngIJDfBriP+I1m49SEfcrFY74V3G9qAleD4TqTIcuaMXV4PkCa9BP
         TlLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702989939; x=1703594739;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DQfpKPPltWnEF7uL8FsRCxLxlxGvjxQdYA/zsOKlDMQ=;
        b=jt+UR86Rm86sxg8eQy9EJ9iwTBUVN/+fFwQpreemtS1UKefplADmfSby0Kp0IcYG64
         9G/wRM8+w6svvORgOH5Fm9lit3lb4xf9+wsiURHdsS6AR0aXccphArZg1jcVVTbdS6TF
         U8KwFUURJMa83JKQXceyMgWhxKrlkfGC4QD0VJI55jAJX8PJha2kMi/9CsqUFVluLy9Y
         Zo3KKjqHG2AL4x4KSPiQmDAQFNeT3ZQP5vHqwmEMP+RYTwfzxDBKqMX6F2WTG1tivTHV
         DsWW12n7yl+IFjLtxMIR/FqcePAHRx7A5dQT4S5x0bx9DfRRbeikY1fVwEtZizSkd092
         PxrQ==
X-Gm-Message-State: AOJu0YxMiMr7sPPB/jnYnWJlWSTjUIT6yk/dxGenwL25O5/AMS7lQ/5A
	MBNRiGpQjaR5zjBfkJW9GpTVNBx1bAl2FAZtb0BOtKrL
X-Google-Smtp-Source: 
 AGHT+IHWUthfQos25jM1DxXW+vQCECdH+wGadNQ4NVKr9pYNDVqDeLKYNKnGQUQLBrMEprA1w5RR3w==
X-Received: by 2002:a5d:438d:0:b0:336:7596:30ec with SMTP id
 i13-20020a5d438d000000b00336759630ecmr332592wrq.20.1702989939059;
        Tue, 19 Dec 2023 04:45:39 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id
 c3-20020adffb43000000b00336673a4153sm5975782wrs.80.2023.12.19.04.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 04:45:38 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v4 0/5] ASoC: codecs: add support for WCD939x Codec
Date: Tue, 19 Dec 2023 13:45:33 +0100
Message-Id: 
 <20231219-topic-sm8650-upstream-wcd939x-codec-v4-0-1c3bbff2d7ab@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG2QgWUC/5XNy27CMBCF4VdBXneqeHxJzIr3qFgYzwQslTiy0
 wBCeXcMm4K6ocv/LL5zFYVz5CLWq6vIPMcS01BDf6xEOPhhzxCptsAGlZSoYEpjDFCOnTUN/Ix
 lyuyPcArklDtDSMQBgra9RbkzhrSo0pi5j+fHy9e29iGWKeXL43SW9/V//iyhAZSkPTlsLfHmO
 w4+p8+U9+J+MOMvio18D8WKOs3USb1D4/0fVD2j7Xuoqqil3pnOcGhD94Iuy3ID63CGO4EBAAA
 =
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
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=5307;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2/6CQOwzdYlAg83zhhFF92wB59IPgOSmY++vmfHgixQ=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlgZBvdoWKHHLVU1xD7eyCCyJsqpoaEVc7+c3HvGNM
 PDatO6eJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZYGQbwAKCRB33NvayMhJ0ZG8D/
 9PDa/OfOBuVmRmw4rb7zInu/5Kk3ctlMN78dzAe0ikzNMp1d+NA2Qt7tqIID99HPZaqIq0FPaOml45
 jRtKbvHg48kpefs2ziy/mFyh5xVDEogSsBV76b2EeTgK1EsppmxkY1e27slkCnn6Uen3wN/UgdRktk
 mCpXU2pG7qqlNx18HDQJBHmy1Vil39qnyfUWBSs2kVuEZJvfhdKVfWYlb3Bb92ECHDsGkhD9WvxiE0
 HPkNNSZPhCKmuKr+fdFoQYe+1dK+5mRd5B8WtRz2CaPW9nyVQffj9SKlSHZyURMeE9pkA/lQebi5Dq
 5GeIJIedvG6L0VtSsVkVTWq5mPcw2bKm7gA/kFXPpio8UBYnPUemNv1q6aIeP9QK/nUfTRuEqczlz5
 Ls6dT+Wf8Mg8wiZfbfmP8f0+Vzamh3HGSUqTrEls910WKId755K48HJV240K7s1HWCYYineEH8Ypmp
 3537VsRpRlVKwzHFGTwClIpqhcKGLZslIH3u21Tfh3nEL3mScyuwCEDJ3eBf2yOIbSaUbFxAdSlxAB
 tDNBfQDvknS6iJH2amkTcwnJ2XAs49GvvzBXFS0Nz9RyVp6H75Q297nwNNEAdgfAc1gvbtTny08hQW
 QQWY15vokG76UldzzNZbYNmfHvUYUmYha8yJVHNi/E0uwp2FvSOGBEp4r3Eg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: M2IRVL5V7BLCKAJFF7VHC7WILRE6ZFNE
X-Message-ID-Hash: M2IRVL5V7BLCKAJFF7VHC7WILRE6ZFNE
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/M2IRVL5V7BLCKAJFF7VHC7WILRE6ZFNE/>
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
Changes in v4:
- Soundwire driver
 - Removed volatile/read-only registers from defaults list
 - Added a wcd939x_readable_register() with read-only + read-write registers, so cache does it's job
 - Added wcd939x_volatile_register() with only volatile registers
 - Fixed a probable but by not using devm_ from probe() otherwise it would be freed in component unbind
 - Fixed lifetime of the soundwire device, by setting it un forced suspend until component it bound
 - Used the component bind/unbind to control the runtime pm, avoiding soundwire callbacks when not bound
 - Added a wcd939x_swr_get_regmap() callback, because dev_get_regmap() would not work anymore without using devm in probe
 - Removed useless pm_runtime_mark_last_busy in resume
- Codec driver
 - Fixed hph_mode setup, returning 0 is already set, checking against all possible values
 - Used CLS_H_NORMAL instead CLS_H_INVALID as it should be in the hph_mode_mux_text list
 - Used wcd939x_swr_get_regmap() to get TX SoundWire device device
 - Fixed a probable uninitialized usage of version variable in probe
- Link to v3: https://lore.kernel.org/r/20231207-topic-sm8650-upstream-wcd939x-codec-v3-0-6df9585ec7c8@linaro.org

Changes in v3:
- Fixed W=1 and smatch warnings reported by lkp & Dan Carpenter
- Fixed dependency on CONFIG_TYPEC and added guards to not build type-c related code when disabled
- Collected review on second bindings patch
- Link to v2: https://lore.kernel.org/r/20231201-topic-sm8650-upstream-wcd939x-codec-v2-0-94ed814b25aa@linaro.org

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
 sound/soc/codecs/Kconfig                           |   19 +
 sound/soc/codecs/Makefile                          |    7 +
 sound/soc/codecs/wcd-clsh-v2.h                     |    1 +
 sound/soc/codecs/wcd-mbhc-v2.c                     |   95 +-
 sound/soc/codecs/wcd-mbhc-v2.h                     |    3 +
 sound/soc/codecs/wcd939x-sdw.c                     | 1551 ++++++++
 sound/soc/codecs/wcd939x.c                         | 3686 ++++++++++++++++++++
 sound/soc/codecs/wcd939x.h                         |  989 ++++++
 12 files changed, 6597 insertions(+), 95 deletions(-)
---
base-commit: 07b677953b9dca02928be323e2db853511305fa9
change-id: 20231123-topic-sm8650-upstream-wcd939x-codec-c46f621b55d4

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

