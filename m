Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DAC7216A45
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:30:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50EC71661;
	Tue,  7 Jul 2020 12:29:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50EC71661
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117846;
	bh=NdUIilMs2SXOATj0oHtQhlwcLX+HvW1huoZC1yD7qto=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cWVcruCRCiSujVJUIsxxBQBnbhFUxpaYSwivTx6BRbyyHQiC9pQ5jbhcxQy/SAaQx
	 wBsaH3hKaE+m7+e6QaGHI9plp+gZ0M5mAto5JJUaZgsEbmZ515cJ7uLIrel0jT177D
	 qyTyjSXBZcH7tEz49jOZhiXvtbtA3DddZQ5TKXSM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6AE0FF80385;
	Tue,  7 Jul 2020 12:17:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F3875F80344; Tue,  7 Jul 2020 12:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4160F80306
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4160F80306
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="kJo1+ouw"
Received: by mail-wr1-x443.google.com with SMTP id f2so16562856wrp.7
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3fyU5lC2kiQoR/Tx6i2htjANdo4PmUgTNG8kh6JAhc=;
 b=kJo1+ouwbe5ipI7BlC5Ic4kTj8wrYnx05NhCanfvRd3nkj5ATUjqLzGEfPRFCp2ulE
 KlBv/4imh5BYzeZCn2F/hHtgC47bvGB4fduIIt+wknpl41OgBzDF+cPpVYzYmTyVMfmn
 fyL0juesSL2d0Mvlsdth1UFm/UcrSurKgPRTyvbJvnMdRe1jh7ljFlsf6qXnrhkrWm4S
 w/kvER9sdviBe2wO7C5yDsga3UBqektYMCTs5TnCXRD398XXHiALQmZCob/PqQRJQo2W
 S9xILBqXWTrhiJbJvgqPcatbuL4E5Gzn5H/TkKAlV4+/nMN2pxueG5HoYl4kOqGmLPMe
 mlww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3fyU5lC2kiQoR/Tx6i2htjANdo4PmUgTNG8kh6JAhc=;
 b=sUgcRrvbmKstb5okEM49eXRsT+zcPlshb2vYxiGG5CX0xyOOd3scpaBEJEXTiO9dhY
 wQuiJdrOvGUSorIbdObyWMUs7CXjFYtszlYUQrZJ34no040g/5QnHJwj7wSfAmjfQsH5
 dcHDqcnMaJOKcfL7HT2LoCooN1chVTTQIMVRgZ1EM9+aVvhyyqzAiIwRm1Eq+lNniCo+
 XVafFP3yfZwNYPIOum8eEvsx7hrlo7MFUdxZtjaO27MQ8Or9S4oG6V4bM8G7X+pVZJF4
 u52JZZkuv2GHmGGoTbC+SR/TVrRJOEJf0XpZKDJgkdVgbFFJOpu9+bsoqdDTycpeKNvn
 Ctfg==
X-Gm-Message-State: AOAM533AQ5bD1YZjaPnN2jRWgVBwxdhO+aMaLUWdDivfCkswQkMVrQFn
 7d28y9mQUFykpiXNH8q5cH4u5w==
X-Google-Smtp-Source: ABdhPJw3IxiVYR6WmuTK9z+sTSUJZ6MQnqXOW88rUyFa86F5H3CyEoVayXplHB7xTuQyEIOgTW+qOg==
X-Received: by 2002:adf:e48f:: with SMTP id i15mr17550261wrm.327.1594117035204; 
 Tue, 07 Jul 2020 03:17:15 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:14 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 22/28] ASoC: codecs: da7210: Fix formatting issues in
 da7210_set_dai_pll() header
Date: Tue,  7 Jul 2020 11:16:36 +0100
Message-Id: <20200707101642.1747944-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org,
 Support Opensource <support.opensource@diasemi.com>,
 linux-kernel@vger.kernel.org, David Chen <Dajun.chen@diasemi.com>,
 Kuninori Morimoto <morimoto.kuninori@renesas.com>,
 Lee Jones <lee.jones@linaro.org>, linux-arm-kernel@lists.infradead.org
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

Kerneldoc expects parameter documentation to be in the format '@.*: '.
If that convention is not followed, the kerneldoc checker gets confused.

Fixes the following W=1 kernel build warning(s):

 sound/soc/codecs/da7210.c:985: warning: Function parameter or member 'codec_dai' not described in 'da7210_set_dai_pll'
 sound/soc/codecs/da7210.c:985: warning: Function parameter or member 'pll_id' not described in 'da7210_set_dai_pll'
 sound/soc/codecs/da7210.c:985: warning: Function parameter or member 'source' not described in 'da7210_set_dai_pll'
 sound/soc/codecs/da7210.c:985: warning: Function parameter or member 'fref' not described in 'da7210_set_dai_pll'
 sound/soc/codecs/da7210.c:985: warning: Function parameter or member 'fout' not described in 'da7210_set_dai_pll'

Cc: Support Opensource <support.opensource@diasemi.com>
Cc: David Chen <Dajun.chen@diasemi.com>
Cc: Kuninori Morimoto <morimoto.kuninori@renesas.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/codecs/da7210.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/da7210.c b/sound/soc/codecs/da7210.c
index 0c99dcf242e42..159b5f0eb7100 100644
--- a/sound/soc/codecs/da7210.c
+++ b/sound/soc/codecs/da7210.c
@@ -971,11 +971,13 @@ static int da7210_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 
 /**
  * da7210_set_dai_pll	:Configure the codec PLL
- * @param codec_dai	: pointer to codec DAI
- * @param pll_id	: da7210 has only one pll, so pll_id is always zero
- * @param fref		: MCLK frequency, should be < 20MHz
- * @param fout		: FsDM value, Refer page 44 & 45 of datasheet
- * @return int		: Zero for success, negative error code for error
+ * @codec_dai:	pointer to codec DAI
+ * @pll_id:	da7210 has only one pll, so pll_id is always zero
+ * @source:	unused
+ * @fref:	MCLK frequency, should be < 20MHz
+ * @fout:	FsDM value, Refer page 44 & 45 of datasheet
+ *
+ * Returns: Zero for success, negative error code for error
  *
  * Note: Supported PLL input frequencies are 12MHz, 13MHz, 13.5MHz, 14.4MHz,
  *       19.2MHz, 19.6MHz and 19.8MHz
-- 
2.25.1

