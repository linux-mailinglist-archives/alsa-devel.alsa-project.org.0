Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D674BD9DA
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Feb 2022 14:14:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4CCB16DD;
	Mon, 21 Feb 2022 14:13:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4CCB16DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645449273;
	bh=btdLpXPIP8zOcSYHl6uCbcLtwqYMwyFdk1m7rbd6kMk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PFPQNbu9qSgmSx/Ld5z2cYTezQ+JvP2iexDHMM55SckqOtS3WMy7/NKoP7IT9iaKq
	 8ts+iyoBA5RZOIzKm6kE/dzTucZC1eqROtkPOPK+R7aT91bPVmQMQgLozhdS01cU1G
	 wYjNvGyzsJHRUBE7m0Sd6WM+OTdkO+NQeGtPC22M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EF358F8053B;
	Mon, 21 Feb 2022 14:11:05 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 34E40F80515; Mon, 21 Feb 2022 14:11:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E4736F8051C
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 14:10:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E4736F8051C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mbzV2rMh"
Received: by mail-wr1-x42d.google.com with SMTP id h6so26984010wrb.9
 for <alsa-devel@alsa-project.org>; Mon, 21 Feb 2022 05:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=to/0VQRxET3KlmX/g/6lkGwzP14Y4zFtNFsg8ymenlA=;
 b=mbzV2rMh2TIubzZRZpZTj5cmoESg5T8lu0MMvfc1S98Psy4yiSSn4zn54E+r2mQPJu
 vCSzoIucJ27el+jkSLan/J2VU8veKAGCYUQUEovYVIXeZ8CYklNabYfZILeOtgcfXS8F
 EUMSjGIkqebrpIiIyGifTRr1p2NqmschAolxTVT3np5RVssz03nz3ybbxEDUHzp4ecNu
 2fQerpohucN1tYDjjF89HccRxQHoiYRQmEUhxbSAC7ClcQNrme0R1rEtqsd+p6efDXZE
 qkXvaPwMsBGNEWqdXarP1ItkvdRYcSLf1icCdmNNSJIjnx7SaJ0dYoI4p5YpqxeqHoiY
 bPFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=to/0VQRxET3KlmX/g/6lkGwzP14Y4zFtNFsg8ymenlA=;
 b=ptvx+x2PhHINen5etbgN+D1xWrhNSsqNcvFnV9Z0ltpt4z8Wdr4oah+UCMcfofKqLK
 9YwR8Ss7qYjqr3ARJUEe5x7lo7h5mIpU2cSzWfG2zMmIcJD3oFNTaOyMfpuIQyysXO19
 ebKifzURCxgtZ0NUYhRqkFJK3cK+Ry7SRp3VuFGOof6z79sKYYGtT0mGAnoM2ke8m4Kv
 ZAF6vgpOvNmp4x0q2cxm6yJPjP0DGLQGYKZ7lPUMSJQ5vksZChMYWss7Z4UgLZsNJ/1Y
 9yhZJLQTjG3iU+HZUkyYAm+874d0Lfh/yRpWcSHH5FHbLp75a66p55yu/7itcT7gAC/0
 q7BQ==
X-Gm-Message-State: AOAM532CoN6dfx4iCpbZ0X0KYD0bdH2wBj3wzttF6lZQsBEqYnkbwp2U
 MZ7rWwggjgsdAlnhN/PZHhr/jg==
X-Google-Smtp-Source: ABdhPJwVS2QIlSS1PXWjt7wJwFAbOL6vY5vnL/xglBpqQiKgDeFouZ3MoUiTvK6PusY2cD4HIY5CnA==
X-Received: by 2002:a05:6000:1881:b0:1e8:f75c:591d with SMTP id
 a1-20020a056000188100b001e8f75c591dmr13975498wri.257.1645449050313; 
 Mon, 21 Feb 2022 05:10:50 -0800 (PST)
Received: from srini-hackbox.lan
 (cpc90716-aztw32-2-0-cust825.18-1.cable.virginm.net. [86.26.103.58])
 by smtp.gmail.com with ESMTPSA id 3sm49412801wrz.86.2022.02.21.05.10.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 05:10:49 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: broonie@kernel.org
Subject: [PATCH 08/10] ASoC: codecs: wsa-macro: setup soundwire clks correctly
Date: Mon, 21 Feb 2022 13:10:35 +0000
Message-Id: <20220221131037.8809-9-srinivas.kandagatla@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
References: <20220221131037.8809-1-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 linux-kernel@vger.kernel.org, pierre-louis.bossart@linux.intel.com,
 tiwai@suse.com, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 quic_srivasam@quicinc.com
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

For SoundWire Frame sync to be generated correctly we need both MCLK
and MCLKx2 (npl). Without pm runtime enabled these two clocks will remain on,
however after adding pm runtime support its possible that NPl clock could be
turned off even when SoundWire controller is active.

Fix this by enabling mclk and npl clk when SoundWire clks are enabled.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
---
 sound/soc/codecs/lpass-wsa-macro.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index a8d30f3b3fdf..d51d6acac28b 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2257,6 +2257,7 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 	struct regmap *regmap = wsa->regmap;
 
 	if (enable) {
+		clk_prepare_enable(wsa->clks[2].clk);
 		wsa_macro_mclk_enable(wsa, true);
 
 		/* reset swr ip */
@@ -2281,6 +2282,7 @@ static int wsa_swrm_clock(struct wsa_macro *wsa, bool enable)
 		regmap_update_bits(regmap, CDC_WSA_CLK_RST_CTRL_SWR_CONTROL,
 				   CDC_WSA_SWR_CLK_EN_MASK, 0);
 		wsa_macro_mclk_enable(wsa, false);
+		clk_disable_unprepare(wsa->clks[2].clk);
 	}
 
 	return 0;
@@ -2351,7 +2353,7 @@ static int wsa_macro_register_mclk_output(struct wsa_macro *wsa)
 	struct clk_init_data init;
 	int ret;
 
-	parent_clk_name = __clk_get_name(wsa->clks[2].clk);
+	parent_clk_name = __clk_get_name(wsa->clks[3].clk);
 
 	init.name = clk_name;
 	init.ops = &swclk_gate_ops;
-- 
2.21.0

