Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EF3216F4C
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:50:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 24DB51673;
	Tue,  7 Jul 2020 16:49:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 24DB51673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133408;
	bh=SPzt/dr1DdPuOumqXLQ2d5wei2gZx4uoOHgiXVmILGA=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P0SGO+mJV4E/6uI6MqjGLndetawIWwDHjXyGvBXvJhd4u4EGErPDfntaZhNTjyOQn
	 RLwbP9St/nvq/Dd+QXI1WeVcv6EBzriwujDzE2/Ggax59GjIIqWOR6Zjkgqa9ggy+s
	 LbcpluhMCNhUp8GAm5fLIWdWD0V3+i9Ta2R5T7Rg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ED48EF80377;
	Tue,  7 Jul 2020 16:38:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C559BF8034A; Tue,  7 Jul 2020 16:38:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D305FF8031A
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D305FF8031A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="mjsQaDQY"
Received: by mail-wm1-x343.google.com with SMTP id a6so1897318wmm.0
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qvkfvflL72kN7LZNfXrEA+gETlAfB400MfXaywOwHac=;
 b=mjsQaDQYPUXaqe/g2dKsXNXr+7jrGE4gHc1/ZEMmctM17H8epnfpYGpc69ciz9exAt
 vKN8+AkaEx/gn6EHBU4QVRlYPfIlD8sgXTzscKM0wzZM+5oJ66huwErQbKU5PZhbrEah
 Hws2v3v6fr8uOj1dv/ORfJaSw6pYCv0r8IXkBLQpmjRoqokN8O0qao4Jr8+hX/5FYrdb
 V2kE4xzZgYRakwN/LsCwncknbGHnJaFL7XuNqsTN4VXculb3MKfwjPe4956FyA+mGSjl
 QWzBADvD2hhEkushVerjKlac8O1Zwi+91Y/OSC/0qGkTkOO4aBJsUGT+Ta5vxSmLmFWA
 C/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qvkfvflL72kN7LZNfXrEA+gETlAfB400MfXaywOwHac=;
 b=ZQrmdAd3EL2N86c5Y1R0jjEBnv+8PtAnIU91bLLgyQyZ/HgpQAuM9QhxoNGPe4CFFl
 4NIQifK/t616Z9+cRnQmH1s8XuZ3pPrr7WRAfDey48C4TdvPvq6IalCjzWv/1iFqOn2D
 20ZvFhYdZsDXsDlvVzb05K5dSERYdd7SXVNnMQaYoIQP6SeV2y4iCcu7WeUvMEVzU3lA
 S6XM8/oZ4MNHOzFf74/LpYjPlvHBQTMdQpyZD1hP53zKK/mWhuUGDxFMPwPETlTpX0R4
 fMLTzpxO5rtS3EjKt7yWNDqwfhnn2rFqJ8jNARDzh4GL5DJCbT3oMc6rfmcjlCvbID5T
 VpFg==
X-Gm-Message-State: AOAM53159Bn1SDOIeD+opYBp62nqUMBqs9KtXBAhZqEdve7p7dNON1hN
 g2ZeFPt5XOSNZAgkH92GHNGd9w==
X-Google-Smtp-Source: ABdhPJz2nCLsOfgeVFtOafx/HAFdZTbjjaJ2muxDQjix4kEwHujevhKyX7Gcrv0w5cFSyTNdM6S0hA==
X-Received: by 2002:a1c:a7c4:: with SMTP id q187mr4450878wme.0.1594132691332; 
 Tue, 07 Jul 2020 07:38:11 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:10 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 17/28] ASoC: uniphier: aio-core: Fix incorrectly named
 struct property and remove another
Date: Tue,  7 Jul 2020 15:37:31 +0100
Message-Id: <20200707143742.2959960-18-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
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

