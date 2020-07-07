Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FA3216A37
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:27:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 852A984D;
	Tue,  7 Jul 2020 12:27:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 852A984D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117672;
	bh=SPzt/dr1DdPuOumqXLQ2d5wei2gZx4uoOHgiXVmILGA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=okje3V9YoIvC03FiNBFshEaY9O0WIdYqb4LPcCMV51MIGZ5NpLBse9uksnsaLreFd
	 L8Q7EettMcnkmHQ7hrfDhzMNPwcycASzf9tyZ3D5KIh0QLiTKRnHtobvP0Pj3dYBF7
	 zFeF8qheJEY4DGvx/T0P+i26ST2EJQKNHfg0Pm6I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77E4CF8034E;
	Tue,  7 Jul 2020 12:17:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6469CF80335; Tue,  7 Jul 2020 12:17:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3142FF802EC
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3142FF802EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="uCg08VN2"
Received: by mail-wm1-x344.google.com with SMTP id a6so1414065wmm.0
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qvkfvflL72kN7LZNfXrEA+gETlAfB400MfXaywOwHac=;
 b=uCg08VN2KG7tt0Tx0AckaREPBcmh1YeIiZN5oAjKUDygIZCzkIvg51lyzxafwIyAf4
 pXk2PHOrb083JCm4EbyHGCsuyFFpJg2QOKk11tqTTDZSB7wzNDHdngRCxLwvhh5fvUw1
 LQt1EQ32PAvvFjqfsjatkVitUxHKb+Oltn50+vBxConSiEzzt6Yw0QV1abss/+635/J+
 mUotE25yq7r4tQiY0YspR/OoLPVaZW8wnMxGqUpkPBBhnfzlJPQdxUwG3qPsHNqgqYOf
 g4cXGoim7zhet6+9Fpo3F8/F3GvNynrAUwV60Z2GADKjANPHfrqYPsz+1S/wTZWiJkAE
 DtZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qvkfvflL72kN7LZNfXrEA+gETlAfB400MfXaywOwHac=;
 b=P+d00R46HGK2GmIWkBMwAZKYWP9KeVYKWt2N+mRMivGHkqcvzmahSy4aLL/G7GTnUD
 DfOtsIiNbj+qX4LRBYzCHKsiMbS6eiJoehlMdPqoWbuQnNCE+3mzHvOyFAB5m0Pk/SAn
 H2RbjrREpj4IMxN4PTfyuUdf3NQjDwvTQuwOR/jXjP+18LIR0GYTIf8v80pjZqSO/e+E
 mp+2W7br5CwH1vUQYFFtO3HCqD990L3pd9UbreO7V8tcMPUE+M/0r01lgWr1HUpajem3
 0wdhLzF5+WTqBSiEpjVaShVxt0n9M7gVpShZWsXuyARxKhhmwQSjriuo2MG+ppMxZgKL
 WSqA==
X-Gm-Message-State: AOAM530TZtJtBdi4uyI/BGstw9ME2UdF+yJxyExoxEuieAPHDtFZty4w
 2AnMj9wpREXTZpQfdnuNIRFWyOE+QbA=
X-Google-Smtp-Source: ABdhPJwGVhbK5W+Z5vcbZBvlNHt5B5X22zSccrN72IuuGIypiyRyY/iE9EBTD1QWpJfGc7dtm4tawA==
X-Received: by 2002:a1c:3954:: with SMTP id g81mr3382942wma.73.1594117029172; 
 Tue, 07 Jul 2020 03:17:09 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:08 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 17/28] ASoC: uniphier: aio-core: Fix incorrectly named struct
 property and remove another
Date: Tue,  7 Jul 2020 11:16:31 +0100
Message-Id: <20200707101642.1747944-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 alsa-devel@alsa-project.org, Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

Both issues are likely due to bitrot.  Let's bring them up-to-date.

Fixes the following W=1 kernel build warning(s):

 sound/soc/uniphier/aio-core.c:107: warning: Function parameter or member 'pll_id' not described in 'aio_chip_set_pll'
 sound/soc/uniphier/aio-core.c:107: warning: Excess function parameter 'source' description in 'aio_chip_set_pll'
 sound/soc/uniphier/aio-core.c:279: warning: Excess function parameter 'ch' description in 'aio_port_set_ch'

Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/uniphier/aio-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/sound/soc/uniphier/aio-core.c b/sound/soc/uniphier/aio-core.c
index 9bcba06ba52ea..86eb0915d80ad 100644
--- a/sound/soc/uniphier/aio-core.c
+++ b/sound/soc/uniphier/aio-core.c
@@ -93,9 +93,9 @@ void aio_iecout_set_enable(struct uniphier_aio_chip *chip, bool enable)
 
 /**
  * aio_chip_set_pll - set frequency to audio PLL
- * @chip  : the AIO chip pointer
- * @source: PLL
- * @freq  : frequency in Hz, 0 is ignored
+ * @chip:	the AIO chip pointer
+ * @pll_id:	PLL
+ * @freq:	frequency in Hz, 0 is ignored
  *
  * Sets frequency of audio PLL. This function can be called anytime,
  * but it takes time till PLL is locked.
@@ -267,7 +267,6 @@ void aio_port_reset(struct uniphier_aio_sub *sub)
 /**
  * aio_port_set_ch - set channels of LPCM
  * @sub: the AIO substream pointer, PCM substream only
- * @ch : count of channels
  *
  * Set suitable slot selecting to input/output port block of AIO.
  *
-- 
2.25.1

