Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5655A216A35
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 12:27:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E475682A;
	Tue,  7 Jul 2020 12:26:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E475682A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594117640;
	bh=KKrFoWs3r1t/bqw5NbBtb/IrinF8OVTLZaCMpSn0t6A=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fg5AWoOpF/2Bl9T9tIEsBQe9Dyp4tzZYyWFRvBeq3tz5h8y6BlXDhl+M/yGHA1Huh
	 frLZA672cm+gEhd9Fo4LKhaItXZI0NvUQm1jcEeCFXiufl7np2mvRLgOLRbMyxKf3V
	 WxQ+KAp3YPAmgNFg7zXNPbr8qggaruFuCUtV2c6E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A1B92F8034D;
	Tue,  7 Jul 2020 12:17:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E941BF80335; Tue,  7 Jul 2020 12:17:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 51641F802EB
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 12:17:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 51641F802EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="odgYUcrj"
Received: by mail-wm1-x341.google.com with SMTP id l2so44399010wmf.0
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 03:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GCffUQZ+pBFslq04fueNayccH0ricdllCgVoeeuKMEc=;
 b=odgYUcrjBkWubGoKGvf/V/V80vy17B/RnX7fHgsFMRUIpPOJcrJt9dv+tXTEr3zxIH
 4VsYldSNIBGB1DSkbFXTHBa0geEKra9/qralT48dvdSWtNZ7chRn9zar3CUhzrZOp7Hw
 zr8dgtoNbIXHH9at4ApTG7Uu7k0aeDOo2fUnOoFyAotLj2PlDySDbWPhpKQPJFvKG4lz
 gxmvNUMXPop7hY3KcqWMubpQ/jwBvQEy/Rxb55ZVJnbhlrqw/63qx6GNenP/HQK0xkXf
 9RKzqvQVpNRpV1pdZFlvCD7F+DoL0i/coqsXs47ThIYQhKcOL4zpWvIXNMbG3+/omqZj
 tVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GCffUQZ+pBFslq04fueNayccH0ricdllCgVoeeuKMEc=;
 b=ReHxejaP3/3ESsMItC38Z9LtvrjMP0nKxW1ntSa7msbl5GJ230G59O4cZbtZB8aHYd
 Lbdx09uibCvtk4GoY2IHjdfTWjd9+vfDiVd2O61y/tCN28wlnyYMNddeXIdxVFcygac3
 MX4TrYUgKCpx+UdcWrQusjUxq2/SyXvnH7E2PkGsZK+kBPiKC450F40DMf5M1KyBEhUi
 ObfCqXVJBbl9y1HlNetsrvJEzoKMTDq7z1d2p/elLa9Qxx/C7R6Ftmlt6X3cNMPhcCh7
 Ni/G79bIWnSSYNQNtwdkLUk1vesL0WKbG1AUEgRce2rUVd49cyaZCx5ZCL/wssy51957
 uDYQ==
X-Gm-Message-State: AOAM531GvSMwHdKGZIluV3plYqw+33V/5G2xtwdsYYrTmEEaQca0yj0r
 uQaYM7rzB8wSnze9D7IzRNxavw==
X-Google-Smtp-Source: ABdhPJwTGPinkE3kiIv2EohNfkljh6vRj8hjjmX611oqnzrxQA4XinO205+FsY+R+JHSOtM4FcmiIQ==
X-Received: by 2002:a1c:2109:: with SMTP id h9mr3331083wmh.174.1594117027926; 
 Tue, 07 Jul 2020 03:17:07 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id z8sm469409wmg.39.2020.07.07.03.17.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 03:17:07 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH 16/28] ASoC: sunxi: sun4i-i2s: Demote half-documented
 kerneldoc header
Date: Tue,  7 Jul 2020 11:16:30 +0100
Message-Id: <20200707101642.1747944-17-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707101642.1747944-1-lee.jones@linaro.org>
References: <20200707101642.1747944-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Andrea Venturi <be17068@iperbole.bo.it>,
 Chen-Yu Tsai <wens@csie.org>, Philipp Zabel <p.zabel@pengutronix.de>,
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

Ideally the author or someone 'in the know' should come back and
provide the remainder of the documentation.  Until the kerneldoc
checkers have been satisfied, let's just demote the header to a
standard comment block.

Fixes the following W=1 kernel build warning(s):

 sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member 'bclk_dividers' not described in 'sun4i_i2s_quirks'
 sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member 'num_bclk_dividers' not described in 'sun4i_i2s_quirks'
 sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member 'mclk_dividers' not described in 'sun4i_i2s_quirks'
 sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member 'num_mclk_dividers' not described in 'sun4i_i2s_quirks'
 sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member 'get_bclk_parent_rate' not described in 'sun4i_i2s_quirks'
 sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member 'get_sr' not described in 'sun4i_i2s_quirks'
 sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member 'get_wss' not described in 'sun4i_i2s_quirks'
 sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member 'set_chan_cfg' not described in 'sun4i_i2s_quirks'
 sound/soc/sunxi/sun4i-i2s.c:160: warning: Function parameter or member 'set_fmt' not described in 'sun4i_i2s_quirks'

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Andrea Venturi <be17068@iperbole.bo.it>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/sunxi/sun4i-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index d0a8d5810c0a5..34c24e3cedc78 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -126,7 +126,7 @@
 
 struct sun4i_i2s;
 
-/**
+/*
  * struct sun4i_i2s_quirks - Differences between SoC variants.
  *
  * @has_reset: SoC needs reset deasserted.
-- 
2.25.1

