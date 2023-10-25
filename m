Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6B57D6FA3
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Oct 2023 16:48:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 48EB9868;
	Wed, 25 Oct 2023 16:47:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 48EB9868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1698245284;
	bh=BJb3NXnYIcyJzT8iGhsCD5K0T53wiU/3E3qgC6c41f4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UYxfR1wXzCIxcxmYST3OYu5Iy9I2LOEaDqgEUqvl2W4IMRHzg/cQlmINGUAJLFnXu
	 b/1sdkSTtTJLgYMXvb+HDv1GyNTk97A8VrCwM67JRC0itqQz2+u2y1UQd0g4oT0Zdu
	 b1FLE6tzGpesQ4IvPoFrxZL33ophAR5Kx6Bmbymk=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 71DC9F8057D; Wed, 25 Oct 2023 16:46:24 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 382C1F80571;
	Wed, 25 Oct 2023 16:46:24 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 16D85F80165; Wed, 25 Oct 2023 16:46:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 67C54F8012B
	for <alsa-devel@alsa-project.org>; Wed, 25 Oct 2023 16:46:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 67C54F8012B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=jjJNLaJr
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-32daeed7771so3806814f8f.3
        for <alsa-devel@alsa-project.org>;
 Wed, 25 Oct 2023 07:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698245173; x=1698849973;
 darn=alsa-project.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NSOu9HyrCio0gozoTkpNTmqH+O6Zq1CFoJPsJwIyKFk=;
        b=jjJNLaJrlyo/uc2zpB2WuNZMGQnu+m2idY5X7Ef3O8nu61wfPWG4yehful8QH++x8h
         k5FfACnKSQlzCpz8ZVXKDnigMtK/0eBS/gF7s7/rVErKzNx1uqyR+gOMbKGysoUDRcWo
         VmxrLjvM9ekIIWUlvwmb5cCuY2wOBt86Kcw2Sh0vUrleD9SMN3QW242mBZVfDhVpMMvt
         o29ctj27OvE/4T1jb5sTGm40YOcx47M8gE/n9qzU5sUCxISC4vCDXXF2mOlqFee5Qoeq
         vneNL9uyrqK+CNSoZ9a9nFkHaHsgwPJHDt+nkx0feMiLH2ieCaW3XIfMvdePXvkfPMcE
         /cBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698245173; x=1698849973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NSOu9HyrCio0gozoTkpNTmqH+O6Zq1CFoJPsJwIyKFk=;
        b=QhtQmfc6zbNAuh/cw3QIR84B97k+//YKK8V8wdV0iTx2YdiAeosvAc4D3S3i3ODcMT
         b5lJf6+plUile28hEhktilRDASTh1Ka+Baqu/tnVjJABGGI0Upme7pQ0cdMaZg+TN3Yj
         45r51F9LK9nxM/UIsw9C0UNRjHJYomBCktfcfFenrFp4sNJbukVeiW/F2c8fOlGJDiGZ
         /AY/7enppcPoM3OmkQVSyetO5JHd6sLuT8NMNeV+eN5S9JNtfKR7yfBjRQOKcts7gnfG
         j5TUODYNMcgA+Gd2Soalj68kBRJ4gHJh2FFtscVhLHTjGcOcWdW4WMPBaIEFjvVcGNM9
         747w==
X-Gm-Message-State: AOJu0YyBas2nFJNjeLWi2KxLjgGAxA2JDHw020InmiRwF5QblgTTYnTI
	DlJzODJFsrDsCAzrP97X6RiTJg==
X-Google-Smtp-Source: 
 AGHT+IEdhXacG3VtzhyUIJTLoFxeWnvtOMaJOeURJsu1+71zwQaYKeffXLMAW2rDPpUPUPrcyoQKDw==
X-Received: by 2002:adf:f711:0:b0:32d:b051:9a2b with SMTP id
 r17-20020adff711000000b0032db0519a2bmr11838769wrp.2.1698245172872;
        Wed, 25 Oct 2023 07:46:12 -0700 (PDT)
Received: from krzk-bin.. ([178.197.218.126])
        by smtp.gmail.com with ESMTPSA id
 i1-20020a05600011c100b0032dcb08bf94sm12267138wrx.60.2023.10.25.07.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 07:46:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Banajit Goswami <bgoswami@quicinc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-arm-msm@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] ASoC: codecs: wsa884x: check if set_stream is called for
 proper bus
Date: Wed, 25 Oct 2023 16:46:01 +0200
Message-Id: <20231025144601.268645-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025144601.268645-1-krzysztof.kozlowski@linaro.org>
References: <20231025144601.268645-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X5ATZ3IV6JE7YZGERP7RGBWWLUN2CE65
X-Message-ID-Hash: X5ATZ3IV6JE7YZGERP7RGBWWLUN2CE65
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X5ATZ3IV6JE7YZGERP7RGBWWLUN2CE65/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

If multiple WSA8840 speakers, from two separate Soundwire buses, are
used in one codec DAI link, the set_stream() should ignore calls for
setting stream from other Soundwire controller.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Co-developed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wsa884x.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index bee6e763c700..91205e8c96f1 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1775,6 +1775,12 @@ static int wsa884x_set_stream(struct snd_soc_dai *dai,
 			      void *stream, int direction)
 {
 	struct wsa884x_priv *wsa884x = dev_get_drvdata(dai->dev);
+	struct sdw_stream_runtime *sruntime = stream;
+	struct sdw_slave *sdw = dev_to_sdw_dev(dai->dev);
+
+	/* Check if this belongs to same bus */
+	if (sdw->bus->dev != sruntime->dev)
+		return 0;
 
 	wsa884x->sruntime = stream;
 
-- 
2.34.1

