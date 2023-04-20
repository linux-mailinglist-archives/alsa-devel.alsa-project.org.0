Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CE36E8FE6
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Apr 2023 12:18:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B48A1EE9;
	Thu, 20 Apr 2023 12:17:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B48A1EE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681985900;
	bh=PUtIcUv4LpxNF7zx+8orlZy9Ak37MkcNokLi6jIVOf8=;
	h=From:To:Subject:Date:In-Reply-To:References:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=gz1qMU85/uDNdfWRI00be8pQNfeYzhK1MeHoCM7eQNQs/FFp/rL/5CSnV8o648UWF
	 kxtnPbUdlicV2lT4PZnb2yFQWX4KDGj0j7jyjXfjMCTUtF0LnFHrww3YLw/B12YJtU
	 7D8syNYTigVAL/YZ4sObeKSNoAqQMa49G2PxxL6w=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 8332BF8053B;
	Thu, 20 Apr 2023 12:16:41 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 1FDC8F8052E; Thu, 20 Apr 2023 12:16:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DD53EF8019B
	for <alsa-devel@alsa-project.org>; Thu, 20 Apr 2023 12:16:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DD53EF8019B
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ZY7V2Fz3
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9505214c47fso62292566b.1
        for <alsa-devel@alsa-project.org>;
 Thu, 20 Apr 2023 03:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681985787; x=1684577787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lh0gzMHKjXIEM7BMaBHJPBXLjPSxY0yCOjmfp2sB3bs=;
        b=ZY7V2Fz3NbWwq9aEj2mVn5PnKntw3UCQb4JlfiHhYV0ddMHpN+M8YLIYbeYsE+Ffsj
         HAguHowzIfVychuICmyTnPXqrCiMPohkRBiwJ5gFErVFL2Xe0YgYfZ2mlihhIgNvguNc
         WJSMsNFB4dEITw8ED4WVadG5Cg82WotrYQZV/esEjZnrq6uR8DvqTnNdmacy7mSZlxCQ
         dRkhmaqjCEYdd+QWFyqkEGUu1o9bCaNIUC0WDAMjx/nnqTAN2Q4k+sRXaFL1FpwbKdMl
         TEgTNFQY/B73e3xmmRB2a+UxETkMTtLGmrlFCrgs70IhUoPQd7MKs9vDEzegWoAtzQjv
         ynxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985787; x=1684577787;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lh0gzMHKjXIEM7BMaBHJPBXLjPSxY0yCOjmfp2sB3bs=;
        b=JSb3/TekIltrcVYsp2n2jBuRf9cciPiYoUI9Cax/O6I+vzAbK/WQDSQVPzTgCsDycI
         mZEFhL5dVbg4sV5F8hn0pudC6IVK9vzVx//eTWCM6Kum1SBOCTbg1+Pa5l8Yfngbt+Nw
         qDUxv6PtURsKjQ9zrLCvTw/UQMwtcRkI7zFvx9XhAlYvFs+ZGr3yqZ3pwGOVtNBEDTDp
         bLypkthgvmQv7MEjfU44UeljL+dBB+jMzBh+x8MUcIqlLOxQo58e0eCd0tr77EC27O/9
         r9TJRzjnTiIdu2evuitQwzpNegZRGmdW3DTpWzTqW30qKleTpOIYLkXL1fqMhpX5g98M
         qErw==
X-Gm-Message-State: AAQBX9eXlANs6RBdwWZW+OHHjgSPGUcuP31WgQYAdTpb98dpNmloegR6
	XPsukS/M8TvKVcdnoV8ne1ADLg==
X-Google-Smtp-Source: 
 AKy350arZDGHMInHp8GuNY+Ano5ThS/SGyaLKa8v0e+z5Ka6cwm3FR2IPMhl6ymmgxoP66sw2zHKgg==
X-Received: by 2002:aa7:d547:0:b0:506:98e8:7e58 with SMTP id
 u7-20020aa7d547000000b0050698e87e58mr999102edr.34.1681985786794;
        Thu, 20 Apr 2023 03:16:26 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:bcb8:77e6:8f45:4771])
        by smtp.gmail.com with ESMTPSA id
 l22-20020aa7c3d6000000b00506be898998sm588954edr.29.2023.04.20.03.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Apr 2023 03:16:26 -0700 (PDT)
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
Subject: [PATCH 3/6] ASoC: codecs: wcd938x: Check for enumeration before using
 TX device
Date: Thu, 20 Apr 2023 12:16:14 +0200
Message-Id: <20230420101617.142225-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
References: <20230420101617.142225-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XEEQ6263NVAM4USHK6E73HZZKJPRYHCL
X-Message-ID-Hash: XEEQ6263NVAM4USHK6E73HZZKJPRYHCL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XEEQ6263NVAM4USHK6E73HZZKJPRYHCL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Qualcomm WCD938x Soundwire codecs come as two Soundwire devices - TX
and RX - on two Soundwire buses.  In DTS they are represented as three
device nodes: Soundwire TX, Soundwire RX and the platform codec node
(binding to this driver).

Probing (and Soundwire enumeration) of all devices can happen in any
order, but only the Soundwire TX WCD938x device is used for accessing
actual WCD938x registers.  It is possible that component bind() in the
platform driver will be called too early, before the Soundwire TX device
is fully enumerated.  This might work or might not, but we cannot handle
it correctly from the codec driver.  It's job for Soundwire master to
bring up devices in correct order.  At least add some simple warning, so
such condition will not be undetected.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Cc: Patrick Lai <quic_plai@quicinc.com>
---
 sound/soc/codecs/wcd938x.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index 212667a7249c..e8e07e120fa1 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -77,6 +77,8 @@
 #define WCD938X_MBHC_MOISTURE_RREF      R_24_KOHM
 #define WCD_MBHC_HS_V_MAX           1600
 
+#define WCD938X_ENUM_TIMEOUT_MS		500
+
 #define WCD938X_EAR_PA_GAIN_TLV(xname, reg, shift, max, invert, tlv_array) \
 {	.iface = SNDRV_CTL_ELEM_IFACE_MIXER, .name = xname, \
 	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ |\
@@ -4425,6 +4427,15 @@ static int wcd938x_bind(struct device *dev)
 	wcd938x->sdw_priv[AIF1_PB]->slave_irq = wcd938x->virq;
 	wcd938x->sdw_priv[AIF1_CAP]->slave_irq = wcd938x->virq;
 
+	/*
+	 * Before any TX slave regmap usage, be sure the TX slave is actually
+	 * enumerated.
+	 */
+	ret = wait_for_completion_timeout(&wcd938x->tx_sdw_dev->enumeration_complete,
+					  msecs_to_jiffies(WCD938X_ENUM_TIMEOUT_MS));
+	if (!ret)
+		dev_warn(dev, "Enumeration timeout in bind, possible failures in accessing registers\n");
+
 	ret = wcd938x_set_micbias_data(wcd938x);
 	if (ret < 0) {
 		dev_err(dev, "%s: bad micbias pdata\n", __func__);
-- 
2.34.1

