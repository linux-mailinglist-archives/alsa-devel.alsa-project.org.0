Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F487216A42
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:30:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A6961950;
	Tue,  7 Jul 2020 12:29:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A6961950
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117813;
	bh=jVoNhcdJ1bPm+8meHqz22BxhPnJbn/OPJX9JqVrw0Xk=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=enfWTutbM4xgauNiRj7IB4SuCYk78zTo0NhkO/J+jZMHils4JtU64NyOo7rdd+xqP
	 bvNAoQgD90Xj7Xs8nWDJWnKWo20qLMFvGyHlU9eqQykkfo217jXOEuDohfrQk6KqM8
	 UVUqyZ1w+hgwG02C4W/P/R97AreTy+MSLHW0aPT0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 93BC9F80376;
	Tue,  7 Jul 2020 12:17:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 32149F80345; Tue,  7 Jul 2020 12:17:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3D49F80303
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3D49F80303
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="fEqHjWMc"
Received: by mail-wm1-x341.google.com with SMTP id a6so1414100wmm.0
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i3kHcmoqkZhWZ4oxxNqqC7HGSrDg94q7cDYwU1R7wZ0=;
 b=fEqHjWMcV3QH7QNn2Owlf7RTYFuOqYPb28IOEN+o8frgMg6wAk8EIXNIqfXOBqZq/J
 eeNF4yNNT3ZzEc5lsIJ/W04R1U22wzOJwlIgEaSxbcmxd8TAEG0DB9MI6zZ2RgNDZckd
 17shoR7zE9yCtAQjpGYYM0SiDGaB5u/gxtfv3XELzdDRrwTwbclyndNJxB4BZeFnqY1I
 OyjOspkNXEZtkGE0QSucKXF5JuLvxRciMy6CiAGnjOdgV9USRqYyNr2lNLA3NgF7RVh1
 6vqRw2pZ7C5/IkR610hR7hIDqT6R4cHYaecuXnKDtPOQ+LZUCIFg/+NHbIdNw+HgVsiF
 BGsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i3kHcmoqkZhWZ4oxxNqqC7HGSrDg94q7cDYwU1R7wZ0=;
 b=RByK8wRMonZVB+WkVNzksABMMXj/QFr1LZfVy1oMD92Svg7pGk1ZijnhYbctjyA8YA
 7rdbOEOiUDoW6tVFr3+p9GuS9EmdQnG7dyiroBeOV1yVIG8haYSY+LOd0pSBjwEFaeze
 0YIaZRbAZaqZuDK0SN0kcEsA03eVx5T/3q9n4tMRCZRCrpVG6J5r90qZKR8rYCxMICkl
 OPSLFmSaUsggLzljUto4IrYMKbjLVywVsnU2ze5kciGFJ9zSyNYMMOtQ0Jm2DW66YFjk
 wd0iAGqbm4Gt0miZjR6bm3Ck5/6soGbNcFRiSRVPVJW9V9qJFNV2K1b8IU7p25H8L4xb
 C2Gg==
X-Gm-Message-State: AOAM532pKHF5U3Tj4VA3aMxT64ZYGvu6DSAAbcE475cdfW9F28drHJIx
 ITRGK4hG7Takvpna9RMJ3fnk1Q==
X-Google-Smtp-Source: ABdhPJxvtg3nk0eX5HE4sSuL+1NhcMKYEL2lfzfo5OK/+r0EuBSISL2ieYbjgHLSGSKA8gV8c787RA==
X-Received: by 2002:a7b:c0c9:: with SMTP id s9mr3231907wmh.166.1594117030396; 
 Tue, 07 Jul 2020 03:17:10 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:09 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 18/28] ASoC: sunxi: sun4i-spdif: Fix misspelling of
 'reg_dac_txdata'
Date: Tue,  7 Jul 2020 11:16:32 +0100
Message-Id: <20200707101642.1747944-19-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Marcus Cooper <codekipper@gmail.com>,
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
 Andrea Venturi <be17068@iperbole.bo.it>, Chen-Yu Tsai <wens@csie.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
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

Property name descriptions need to match exactly.

Fixes the following W=1 kernel build warning(s):

 sound/soc/sunxi/sun4i-spdif.c:178: warning: Function parameter or member 'reg_dac_txdata' not described in 'sun4i_spdif_quirks'

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrea Venturi <be17068@iperbole.bo.it>
Cc: Marcus Cooper <codekipper@gmail.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/sunxi/sun4i-spdif.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 86779a99df751..326dd45e39dab 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -167,7 +167,7 @@
 /**
  * struct sun4i_spdif_quirks - Differences between SoC variants.
  *
- * @reg_dac_tx_data: TX FIFO offset for DMA config.
+ * @reg_dac_txdata: TX FIFO offset for DMA config.
  * @has_reset: SoC needs reset deasserted.
  * @val_fctl_ftx: TX FIFO flush bitmask.
  */
-- 
2.25.1

