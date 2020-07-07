Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37D216F57
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:51:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34AF482C;
	Tue,  7 Jul 2020 16:50:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34AF482C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133475;
	bh=NdUIilMs2SXOATj0oHtQhlwcLX+HvW1huoZC1yD7qto=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DGh4ihdyWK459MucTX+PVM+x9NtxOF+NgoT2tC36qhJwtSOth51mghb7yM5zXN9Cm
	 cFv5c0Wz7PZK/Ov5P6qXoXk3PlCQHEmL7xaRo0UchK5tLsG4S+L4F0IsyVkVAy9Ev7
	 zzeeZ9RLewYCHqR4NjdENjmWeAsF9XUcTCpJgtlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BCA70F8037F;
	Tue,  7 Jul 2020 16:38:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5100F80361; Tue,  7 Jul 2020 16:38:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7D986F80339
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7D986F80339
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="LShq89WJ"
Received: by mail-wr1-x441.google.com with SMTP id b6so45387811wrs.11
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U3fyU5lC2kiQoR/Tx6i2htjANdo4PmUgTNG8kh6JAhc=;
 b=LShq89WJxb94MrlLI3/486aK65cDtxG0oE+rhlgTmASAYfb/Np7yb+JavN6r2ft9ig
 AwQPAs5kHPqycz2QUKlP4nkN/SKskU0kSdYnqHPC74v0/benUGDSMuVmY2/f9Kipk6RW
 gZmZE9RA44h5S5//yiG8puSQxxYPDXovIrKY8v5f+Mu99NOeUtvlkmdl6/y/m2bq0Eze
 5J3TuNo5qLEoDrceDVnvkr9q/2nSp7tHNv64ApVICS1NVKPt1+GK6szIpP0evAVdgyBt
 S8R/3ZsAgU0rXkkv/pvPnnvYjSwjwm1cv4QUDBxGcUOalIMy5y5VPw2rQ+iAfJLU5D5R
 5AZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U3fyU5lC2kiQoR/Tx6i2htjANdo4PmUgTNG8kh6JAhc=;
 b=uU8UZ3yGbF7Jg2fTjw0MInsywtm7lxZHV9J3gjVIpwvhxrKF40K1UmYEBn+Djv9d33
 MOyPwBOY9/m3jMJtljuDSMxsNf4vYGMl17nZKwy1EaF89A4KpbC7TWwt9h9i96wXxi1k
 dQ8Ae5UbKwizEgjS5kPlybANaEETO1H+cfP95vHWElqBzk9bEgkgSEMTFRiBj/WK+d99
 prUJFRFbqnifuonhdotqo6OHizxO3vtVM/ZvCXyBEWISlGYbRPGq6TQxNTZiknRxI6lm
 e+CZyqII0DXAIDoY+Py/m8j/Wn0WVSWtSp0XeT2nCtcC1Bn4tVM+7FSpUv80PptsHAJZ
 D+JQ==
X-Gm-Message-State: AOAM533JP7wl0XNkZd/3g9j09AwQKDxEskr7D8j1Y/PFiLeeY4g50sLE
 QpM6MBkqgBAxrY4DyexMeFBFAA==
X-Google-Smtp-Source: ABdhPJzqqvWG7oi6hsuXMzqyAR794fl+k3BzyasAa7HE9dNDChNhc30Io0ZzoSOzpgV3OPJPWurV5A==
X-Received: by 2002:a5d:4607:: with SMTP id t7mr58171903wrq.251.1594132698293; 
 Tue, 07 Jul 2020 07:38:18 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:17 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 22/28] ASoC: codecs: da7210: Fix formatting issues in
 da7210_set_dai_pll() header
Date: Tue,  7 Jul 2020 15:37:36 +0100
Message-Id: <20200707143742.2959960-23-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
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

