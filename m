Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CACE46E8FE5
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 12:18:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC612ED0;
	Thu, 20 Apr 2023 12:17:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC612ED0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681985899;
	bh=hG7tW9YFcXEIJSmnkwqj7hx5DHRCpiFJW+qZg1g8oFE=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ABX/v6LYpYmfUPXrHKwsCfn3s6OfYKyhjZ+kKCr0GOBPYabg0eT7xvSPblpgUCo01
	 nSaoW1gDNmvpQGmQand6hOAaBfMQBgswZVxAmfDABibTIRWi0aDOva7y89jDgWVGVp
	 tuIB3JiFKz/npqTHzH0QJ1bicusS83D8eUdVQTK0=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 00005F8052D;
	Thu, 20 Apr 2023 12:16:38 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B7048F80510; Thu, 20 Apr 2023 12:16:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 0678AF80155
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 12:16:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0678AF80155
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=AmBkVOgl
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-94f32588c13so50307166b.2
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 03:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681985785; x=1684577785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJ7NFOY+m136Tpa7a3Lvd2KVX0E55mkuZub+f9mfMPg=;
        b=AmBkVOglK6tDRnpf5e1CjE9fZ783z5mKL+8fZ2ZovSKfIEaRbZG2hMsl/KZYx0GutP
         I4eilLey7aFQzEn7ekVDO8KmseLtE5PTAZDRLwn2BMgyGrZC7FEDBt/Dp4xCbjrM4nMX
         PExtibBF1phO8lOFATg7A1Vtim0z+UT6NDLufqy2uoALruXfdu+d+TPVALxWzqlWUzA6
         T+GyHuG0AT4R7Gz3SSQotOWrU+a4WRBC/uMDUwxK18phb9KmLz2WNzbTxwMlB5A5NfNH
         Ets4NSbdZxAlxiComw5hFcoxnnqZUExblUbtNFza39VeKttRMXgdMGu3NppRYjhA4g+x
         /fyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985785; x=1684577785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lJ7NFOY+m136Tpa7a3Lvd2KVX0E55mkuZub+f9mfMPg=;
        b=QuHWD70CyLBu7Pzul5cyCaArFTtGn4eSKlT8qBjEXTEprb7NGCFsaHAbjVTvyj9bmy
         RBUQWX7VxhjByrybL5z8nxhKNfDOUWM0WmApNgFs3JZLrI3M6YDym8hPdqG7FTE+6mKc
         xHbR5/2Gv+pEpuAYju63XXj6q0U1DYyTBB/Y0W9hieHvjILNdp25FD98mSU4iVzVYm9A
         9jie8DkD90mt0jjZMPDsFC6g6ngQ8/TCKhroFYsYDqHBkCO8VzchsYy0xR3PjhStPO2u
         GcyZXmNpvdVzt9KgYS5EFMySP7bMgCVnJIvzKcTLem8CmHR46o7prBflh40fjU3p4cmW
         qV/g==
X-Gm-Message-State: AAQBX9dJIfpQ8kxeviLgN9GWin2iu247MFCJHF4gNNgfpV7LKSw0VLTV
	aZQigTdNsZk7L10qCSXZN6nhzQ==
X-Google-Smtp-Source: 
 AKy350a9gCInOAQuMSUpXUGkll+ReqZrf7KjiUJPh73j3eJ9QX2mTKFQOiDbJcquHEnVTHtJWjfuwQ==
X-Received: by 2002:a05:6402:1616:b0:504:9c59:7b8f with SMTP id
 f22-20020a056402161600b005049c597b8fmr1251270edv.36.1681985785537;
        Thu, 20 Apr 2023 03:16:25 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id
 l22-20020aa7c3d6000000b00506be898998sm588954edr.29.2023.04.20.03.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 03:16:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Sanyog Kale <sanyog.r.kale@intel.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/6] ASoC: codecs: wcd938x: Keep device in reset till bind
Date: Thu, 20 Apr 2023 12:16:13 +0200
Message-Id: <20230420101617.142225-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PLNEJ3TQSNKFUNWNSO72VBOAIVMURPXU
X-Message-ID-Hash: PLNEJ3TQSNKFUNWNSO72VBOAIVMURPXU
X-MailFrom: krzysztof.kozlowski@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Patrick Lai <quic_plai@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PLNEJ3TQSNKFUNWNSO72VBOAIVMURPXU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

The Soundwire master expects that bus devices will be kept in reset
state and brought out of it in their Soundwire probe() or bind().
Keeping it in reset state avoids early new Soundwire device interrupts
in the master.  Fix this in WCD938x platform driver by moving the reset
toggle code from platform probe() to component bind().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

I wasn't sure whether this deserves a Fixes tag. It looks like a fix,
but OTOH, I don't think Soundwire master expectation is documented
anywhere.

Cc: Patrick Lai <quic_plai@quicinc.com>
---
 sound/soc/codecs/wcd938x.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 33fd8fdde9fd..212667a7249c 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -4236,7 +4236,8 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
 	struct wcd_mbhc_config *cfg = &wcd938x->mbhc_cfg;
 	int ret;
 
-	wcd938x->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_ASIS);
+	/* Keep device in reset status till wcd938x_bind() */
+	wcd938x->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
 	ret = PTR_ERR_OR_ZERO(wcd938x->reset_gpio);
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to get reset gpio\n");
@@ -4407,6 +4408,8 @@ static int wcd938x_bind(struct device *dev)
 		return -EINVAL;
 	}
 
+	wcd938x_reset(wcd938x);
+
 	wcd938x->regmap = devm_regmap_init_sdw(wcd938x->tx_sdw_dev, &wcd938x_regmap_config);
 	if (IS_ERR(wcd938x->regmap)) {
 		dev_err(dev, "%s: tx csr regmap not found\n", __func__);
@@ -4508,8 +4511,6 @@ static int wcd938x_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	wcd938x_reset(wcd938x);
-
 	ret = component_master_add_with_match(dev, &wcd938x_comp_ops, match);
 	if (ret)
 		return ret;
-- 
2.34.1

