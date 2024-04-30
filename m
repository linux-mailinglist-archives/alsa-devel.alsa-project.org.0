Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 454328B7840
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2024 16:06:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F239AE9D;
	Tue, 30 Apr 2024 16:06:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F239AE9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1714485986;
	bh=skJQwkduJ0UqVILLbpIVR8oru+2QUc2pKBYrAAVKHLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hGIFCZDPCfBtDyZfWFo3726wEqalTP76QGOnha9hXn9G8MEJlFX3+1mJMmTVhin/M
	 8pRyJHNIU44xiz+9zn6RmmayisSM2Gv9a7WgFS6IPdokuxy8Y00OGCbr/310ZRSWG8
	 BPE8uWmf0tOrYGScFDWqUfV9zuBYqv6qDMpbuZVw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E1EE9F805B6; Tue, 30 Apr 2024 16:03:46 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 9EDDEF805C2;
	Tue, 30 Apr 2024 16:03:45 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B378FF806F9; Tue, 30 Apr 2024 16:03:35 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2EAEFF8069F
	for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2024 16:03:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2EAEFF8069F
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KwSvPOh0
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-572669fd9f9so4885157a12.0
        for <alsa-devel@alsa-project.org>;
 Tue, 30 Apr 2024 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485802; x=1715090602;
 darn=alsa-project.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yC31R3m8W6wP+grnNVF/H3dyhG6qnKQukTpoDRo2U3E=;
        b=KwSvPOh01truz8wh4DUZ8wbaRVn4alky4FCkoujLWgZFXKKkcsRiBGglFX3/7IZfII
         +y2mSOPHJjnMZ24M2P/G7lSHMcqZDgl/nhfSKX1TS/cZTwSHDFw+DqrEDzQAQsdF1NFf
         1bsDVoudSa55S2pdxwJJ8WQLvyUykUyplT0IrKcdIcBA+VYudyKB9XKWqZQhf16khnha
         xl+qQEZtsUBuWARzeH8lq9WEJLykYNJzbMgcObo4q4Rn2DxflU2GbTacaRC9ewVmHyu+
         rVII09Hn7bSx/Dd113WRBs2hcI1h6A73bm3nU/utHOPH6+QAUxjbcACRMBZkCFS1muPd
         scVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485802; x=1715090602;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yC31R3m8W6wP+grnNVF/H3dyhG6qnKQukTpoDRo2U3E=;
        b=cUilFrUaeMemIEt7ZfGYx5YrthLLYwZgxuuo0LIsA6aAfAv52U9iaVAeaoPipsP5WL
         skpda6JGWI2luGYKpYaJL69CvMNK5fAf9f1sDjFRv1CW7ej+xWopJvMtsfJxEgxYHbrP
         0nKAPkmnxpRMeA4lLwr1zE8CJo5RwnNP1iiRED/3QNOYdyqtYCSUyB1i/01ejxmInF/L
         v7vTw6anT8BthQ2vH0yb0QVImHSsyTQB7rk/k3KTYtPOa4ZBZNlfPDsHe4FoB5QlqLCC
         s18UEmIao8JpCTbMCYiE9uJL2HqOYG95zqfiSED7LYZRNUWE4AmpP4SD3HscAWaYWVSc
         9ohA==
X-Gm-Message-State: AOJu0YxemswyOh/Kgx/WHCQpiE0IxYi9h8dAXc/Sux0p1HGXg34agnfv
	f7pPe5jFZj6QQIk3i1MYAQOdKBN4klJLuMOpWIqXCLXC/Fl8Vsrg4You3A/O5AI=
X-Google-Smtp-Source: 
 AGHT+IHSymzbs0C8MGLs3EVai6AvWaGt9IGpYcAnz/QtQsZ0owRN86WOYk4l43txKHjNaleFCNL96Q==
X-Received: by 2002:a17:906:b78c:b0:a58:ff19:1bd7 with SMTP id
 dt12-20020a170906b78c00b00a58ff191bd7mr4814671ejb.24.1714485802359;
        Tue, 30 Apr 2024 07:03:22 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id
 pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:22 +0200
Subject: [PATCH 13/13] ASoC: sunxi: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-13-6f8a8902b479@linaro.org>
References: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=855;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=skJQwkduJ0UqVILLbpIVR8oru+2QUc2pKBYrAAVKHLI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn42nKdNBa2rMr1pgKaAGhX7w0XUyPtyKW9V
 bUEsOjG4LCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD5+AAKCRDBN2bmhouD
 147DD/4ieg9gyFCb0g9PJBqL29gkEXs/qxtb2TaodG03VYLhq+fFzv2vOzJZhszAb1VOkS8eI0F
 KlbKY9lyGbdzA1h6zSNA0p/UgvlOtsdv4xC+0KT0yy7TXAza83A9DSl1qDnkNTdOFgc42e1+9FU
 eaGGfDloUavMXd6rNB7SRZMQRcm41b47P/mRzEa2cA1bjkAlrlBm6NwPeVLP5A/Kcr3Tb3EZ2pI
 HgLvCY5h27fuJYugwmxUMfqOjXMdWLx9SSAQ5yfhuYZZBgKU100MiFOvcW2nlDlhncmjU0WcU5t
 H7ySW9GYOdqAqEkELNGxb97j0Ov7StcHdE1uz4YmdansE+m8dNQTp3CaZ4LdH2+2TFF/sP4aynu
 H2GUeJKaC1N/Ng+cEI1h0gMDXKbR8qyTg+SjoM6i7+5UP1I2coCVMYrneh2dpEyJOp9MNFOvj5d
 UzzEQMRQeFilQTHwB3xynjKLIUqJbjhqfafH5A0FECh/lb7OoM+PTU7VciDC4L/s1Xl/NOiJCnq
 69WLOXnti2pJsaGzvUMsSHAlokIA+7NRIpUewkiHs/lN9zgB7QfsX/zvrQTookURZBTMehAN/cd
 yW7Vl73L2bSpn6CppvaD8hpkm5+NhqYeNWbMxnKsVdyQiMo84C2YNgI+3cBxRRpVQUYuh98RXgk
 h6j6UQIf5KNOdKQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Message-ID-Hash: UNG6HPXFBJAAIPLILVJ42H6FRGNBP52I
X-Message-ID-Hash: UNG6HPXFBJAAIPLILVJ42H6FRGNBP52I
X-MailFrom: krzysztof.kozlowski@linaro.org
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UNG6HPXFBJAAIPLILVJ42H6FRGNBP52I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/sunxi/sun50i-dmic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index c76628bc86c6..fedfa4fc95fb 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -74,7 +74,7 @@ static const struct dmic_rate dmic_rate_s[] = {
 static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *cpu_dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
 
 	/* only support capture */

-- 
2.43.0

