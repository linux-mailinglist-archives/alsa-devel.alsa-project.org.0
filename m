Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4561663B4B2
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 23:13:31 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D797B1687;
	Mon, 28 Nov 2022 23:12:40 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D797B1687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669673610;
	bh=2AQvgU8kXDFUJdr3B6ILvQwJW8mT099+cRO8KpuAd0o=;
	h=From:To:Subject:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=moua0K1gOFnQ9D4wmhtmuIAyLkVuyADyTjEAY3Zxws3yn/hIZYU8dvO3mEc/Hu48z
	 9Hj4ZCV7E7wBqLj/LcVPdz84j1WvWhDgNTcXDEPc2M2UB6TreoVF0McCvjZmpNMyyl
	 2ViEgdtVf6pRBHOA81/Vdg0QrwgvyKUFG6d/7D3g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 35C0AF804D8;
	Mon, 28 Nov 2022 23:12:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 39305F8016E; Mon, 28 Nov 2022 23:12:08 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18C6DF8016E
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 23:11:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18C6DF8016E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org
 header.b="Aq1EGgv7"
Received: by mail-il1-x133.google.com with SMTP id x12so2825643ilg.1
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 14:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+K0jgOSLksPF0t4oO6z2n4LjWuWuN8YIQgfQeuzMRF0=;
 b=Aq1EGgv7Yfv518jIs78L4d+GGgWaxs8TyWPdQf0qndrhr8yITjDwgaLKNfQFqQXrZx
 nnPeeSK6X5QcqXNK373SSmHPhq1+zsmZHL9YGSNNtsNpYs5i0Xdpw3alKtVy+Px1De0P
 ZFCNwvc5caUtGJSl+ljr6Hew1e4WTUMRKAaFg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+K0jgOSLksPF0t4oO6z2n4LjWuWuN8YIQgfQeuzMRF0=;
 b=aLckwrnu/tWzY9y3Eo25SDCQ4FS+pll0SuAmpk70t3/SNXYtgVh4awXXkWg5biFtUl
 PIAF/oroS+qprfp/3FL5A3MlGhX6STR3uj3UET730/fvkDxJLl9PYOnrRtYPc8d1B2bc
 w8n2Q9Em5Fg7JsjS2bTytal7F7zI/INjBVg98hRW25MmonQbRhUr+Dvnzb72E3ELvsPk
 dViLCbywAFf2wV52CWb+UTRiHCh5FCRZMk9VIdb2RCT7svm0vREuIO2oUaQSb3Ns2Cns
 7+M4IQJki8R1uibek7G+47cnCE+drxuXeBsSKmTlwTd6tQZyaNwUX4Lsge2ZoX2/7GHa
 vV1g==
X-Gm-Message-State: ANoB5plewpVlIDC/tZgQ12nCDBdMmlJRL4mAt1z2a11/mj9pTes0Dl6f
 SWOYAQh8jiiRg6CBpYRuBs3SqQ==
X-Google-Smtp-Source: AA0mqf6Fo8Uf5/CsFnfNGuV1ojrI2ZNykhxAz1ZxrUuYeIfuTr1RKHtapDjLrNo7xXOLi496j/GAgw==
X-Received: by 2002:a05:6e02:dc1:b0:302:ecb2:179b with SMTP id
 l1-20020a056e020dc100b00302ecb2179bmr10840765ilj.223.1669673518004; 
 Mon, 28 Nov 2022 14:11:58 -0800 (PST)
Received: from localhost (30.23.70.34.bc.googleusercontent.com. [34.70.23.30])
 by smtp.gmail.com with UTF8SMTPSA id
 i14-20020a056e02054e00b003030e36d9bfsm1480355ils.46.2022.11.28.14.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 14:11:57 -0800 (PST)
From: Matthias Kaehlcke <mka@chromium.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Subject: [PATCH 1/2] ASoC: qcom: lpass-sc7180: Drop unnecessary initialization
 in _resume()
Date: Mon, 28 Nov 2022 22:11:54 +0000
Message-Id: <20221128221152.1.Ia805c688ee968fbbec7b93dc10742876fdef8024@changeid>
X-Mailer: git-send-email 2.38.1.584.g0f3c55d4c2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Judy Hsiao <judyhsiao@google.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Matthias Kaehlcke <mka@chromium.org>,
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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

The initialization of the variable 'ret' in sc7180_lpass_dev_resume()
is unnecessary, as it is always assigned a few lines below. Drop the
initialization.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

 sound/soc/qcom/lpass-sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index 9c3365ddc274..7a81e609727c 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -165,7 +165,7 @@ static int sc7180_lpass_exit(struct platform_device *pdev)
 
 static int sc7180_lpass_dev_resume(struct device *dev)
 {
-	int ret = 0;
+	int ret;
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
 
 	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
-- 
2.38.1.584.g0f3c55d4c2-goog

