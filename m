Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFC97F6203
	for <lists+alsa-devel@lfdr.de>; Thu, 23 Nov 2023 15:49:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 82D3FE88;
	Thu, 23 Nov 2023 15:49:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 82D3FE88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700750994;
	bh=wDiv+hUfqvERKcAmDL70dW3lBiLBoxik56q7RUGIHjg=;
	h=From:Subject:Date:To:Cc:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=dqVt7bwso4KEAydmrJtaVV4uN6QePIN/sHdTjrsOpWII7iDa2iKl1qfbfcjSOMIT0
	 X5m99+t3e2+R+DIQ0YaZQtmVr7t4adg7tY5v4dSQB6vveFxs8IVosjsXdfQU6RNRWx
	 iepKK5BxHADinTJAe/AyCFvqyswiqhH4rmncdwDM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 67CFEF805A1; Thu, 23 Nov 2023 15:49:30 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id AD9E9F80570;
	Thu, 23 Nov 2023 15:49:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 90253F80549; Thu, 23 Nov 2023 15:49:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD401F80166
	for <alsa-devel@alsa-project.org>; Thu, 23 Nov 2023 15:49:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD401F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=cAsn5ZGc
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40842752c6eso6130315e9.1
        for <alsa-devel@alsa-project.org>;
 Thu, 23 Nov 2023 06:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700750960; x=1701355760;
 darn=alsa-project.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7xTsmye+DXprfJGCnT9r6FiE88AZxfuIxgF5Hzt0tR4=;
        b=cAsn5ZGcYehQ4L10/O3Dezb6jXaM88AFtF1h0nLInhJX1+N5CrWWr5BGHDiQXo3fYr
         KdRSBo96RcrzEiwthA5zrTiXiaVi13X4yzp6+vLS6CHPdQvDHq3CYUTtVh3gxx34JZIk
         lIis60YmWgUrH3FhW+ORLmJLy13eo+JH0DsCgqeBlF+9uraeH3JYtizpM878tCQlRVCK
         pQeoWZZyROhjZ2rJ3jVgkgtN49I9b4aWqss9f7DdfeNVlDCQ/hZXoWbIgde6apCOg0z0
         QY5iwAxeozwb+Q31ts6xVsslTbpsFqO9DoQ5UH++4vSMkAoqdRdL1BftWhJcrSBBsTUe
         mzIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700750960; x=1701355760;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7xTsmye+DXprfJGCnT9r6FiE88AZxfuIxgF5Hzt0tR4=;
        b=AWmFSrwxJYkaeJi/FbnHhzNFvRTaf+LH7ZRkWKIXlll3TGiG0YirMW0rY9N4H82mRC
         IkJ2GcTNkQ5iKajsyWtViTiXFk7UfB0+TACul9raKbzUK3LkEoV9kjthWK0deZA1Ac39
         45j7KLE7OpsY2NYv20rtrsgxdHBYbYVTYhLK7T4OKm/++KSsnWAvDKbebttbJbYb93Ss
         J8EhmA6kRUEZjryYWJs+G6MC/65Rys8wuFNCaaYobfwn0n1w8/sVwFUuA0JNH5KUurEY
         nrYykHrUCiIqdXdFnytUdFVH9d8CFt+gPaJBQj06YIMQzreus5Bxshp+Oqk0RNNHgXVl
         EsgA==
X-Gm-Message-State: AOJu0Yz1Bxb6y3Sob6by06uLfp4fCwo0wGBGKc4E8APn3uW6xm8/BOpK
	3bwc/e6u91E9DjaZSjW+k3ouAQ==
X-Google-Smtp-Source: 
 AGHT+IHIQuU7lcwjoAmR6ounCY6gHREfYd9JGY9L5I+XnOs8fFG5UEAokj3e3JJcK+B8DYE2uKQPCA==
X-Received: by 2002:a05:600c:3516:b0:40b:2a06:be27 with SMTP id
 h22-20020a05600c351600b0040b2a06be27mr3993509wmq.35.1700750959826;
        Thu, 23 Nov 2023 06:49:19 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id
 r4-20020a05600c458400b004094d4292aesm2256135wmo.18.2023.11.23.06.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 06:49:19 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/5] ASoC: codecs: add support for WCD939x Codec
Date: Thu, 23 Nov 2023 15:49:10 +0100
Message-Id: 
 <20231123-topic-sm8650-upstream-wcd939x-codec-v1-0-21d4ad9276de@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGZmX2UC/x3NMQ6DMAxA0asgz7VEEhKVXqXqAI5pPUCiGAoS4
 u6NOr7l/xOUi7DCozmh8FdU0lJhbg3QZ1jejBKrwbbWGWMdrikLoc734Fvcsq6Fhxl3ir3rD6Q
 UmZC6MAVrRu9jB7WUC09y/C/P13X9ALSMWhF1AAAA
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
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1950;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=wDiv+hUfqvERKcAmDL70dW3lBiLBoxik56q7RUGIHjg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlX2Zsox7kX+DoRNk5o6Ib/Ll6tKnG7STTtnhN6RMb
 Ltu3eHqJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZV9mbAAKCRB33NvayMhJ0V9UEA
 CODTMh4GaDFLf1EyRVqmsFtLOpaR02kecBIvPV9U7DSq651InGHNxUzRk5iKSDvrMfc9BPsayoSpsl
 Wxj6sQbdvNVTY7rreYl31sHRvw6RpNrp3J9nWUg4spUranQRuFhqO/22cum2hWK/zAdvKtSGYx2R2r
 2eB/uomF8TM66Qs6cfvxjmBTzacx02akdX2BzFSZl27NhHe7AIL8qoZ2x7k1/nTo7XLBwh9xYRmIPs
 MW5/irBg8dFgYTsYi7oIaZItocr3qqkt9/LLVdyhiqkrMyNjE5oMTVqIoHWmKyCKV2apZqrj7HKq4k
 qD57/uZfhQQNrIkGQBHGeZlJE797o+NgNHOixKTlVtohp5tQdWFEWX399l15zo4CesRDVVVFdJ75s+
 emEWAfEpWYafXpjg90IUd3NWmLmZe/5+wkMdCWrbMMMOVRpIRpzeU7S9xoTUzz+QG58gW1ZypqwPLP
 nnPbGkY8xhU6an11Og7HaLAPXWFjwhxF80HAQ445clzZzAKlgeCIO9aCvDALRzVIEcoKZ0+0CKReac
 d1scBj+yWp4CTTS+T55Vda8J8xjU/AuvHsDr4CPM3QXIAHs70pCgsEOomnNTVm2/W2zla7eH6lmPHq
 iqUkrQ5ZrAwHtOzIyqVUxsZ055BXI5w+zdnvxA3WpVckaO/9lquRcMLjD4tw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
Message-ID-Hash: QM6LHFUDHS34NPOWQGVNAB6CSVIXMUCQ
X-Message-ID-Hash: QM6LHFUDHS34NPOWQGVNAB6CSVIXMUCQ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/QM6LHFUDHS34NPOWQGVNAB6CSVIXMUCQ/>
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
Neil Armstrong (5):
      ASoC: dt-bindings: qcom,wcd938x: move out common properties
      ASoC: dt-bindings: document WCD939x Audio Codec
      ASoC: codec: wcd-mbhc-v2: add support when connected behind an USB-C audio mux
      ASoC: codecs: Add WCD939x Soundwire slave driver
      ASoC: codecs: Add WCD939x Codec driver

 .../devicetree/bindings/sound/qcom,wcd938x.yaml    |   81 +-
 .../bindings/sound/qcom,wcd939x-sdw.yaml           |   70 +
 .../devicetree/bindings/sound/qcom,wcd939x.yaml    |   93 +
 .../bindings/sound/qcom,wcd93xx-common.yaml        |   95 +
 sound/soc/codecs/Kconfig                           |   18 +
 sound/soc/codecs/Makefile                          |    7 +
 sound/soc/codecs/wcd-clsh-v2.h                     |    1 +
 sound/soc/codecs/wcd-mbhc-v2.c                     |   95 +-
 sound/soc/codecs/wcd-mbhc-v2.h                     |    3 +
 sound/soc/codecs/wcd939x-sdw.c                     | 1591 +++++++++
 sound/soc/codecs/wcd939x.c                         | 3635 ++++++++++++++++++++
 sound/soc/codecs/wcd939x.h                         |  936 +++++
 12 files changed, 6530 insertions(+), 95 deletions(-)
---
base-commit: 07b677953b9dca02928be323e2db853511305fa9
change-id: 20231123-topic-sm8650-upstream-wcd939x-codec-c46f621b55d4

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

