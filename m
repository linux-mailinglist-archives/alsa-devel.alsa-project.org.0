Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9464216F58
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 16:51:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7A2F81660;
	Tue,  7 Jul 2020 16:50:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7A2F81660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594133505;
	bh=0oTipXMewJaCzbJ8wtWE1Ge+lrrvI+OTYhKQy+wqT8I=;
	h=From:To:Subject:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NVE+pTmjJhj1/1ad308QQB93LpaKv2kMNliXD7aUvHHOB7cyeTGcgWjD1d+QMwP2M
	 YhGlgVYWLW3oSPNFy41Ar0Chz2PDyJx6NsZ8VjBibhdGwHrNZDrTwfkQI8yECHgrm6
	 x7iCR5tuj5IfB3GHLudD1julJotADob86IAnj6pk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4B16F80384;
	Tue,  7 Jul 2020 16:38:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 08AA5F80360; Tue,  7 Jul 2020 16:38:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D487F80329
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 16:38:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D487F80329
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="C+DvgwtI"
Received: by mail-wr1-x444.google.com with SMTP id o11so45442114wrv.9
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 07:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wlcleqYJY5jQ1OZcMa4GgQUjEFsprvthMn+zX7CdCH0=;
 b=C+DvgwtImCJiiCVNxFwI9tT6IRQA5rXY9b0UMNq/qhCDZJquNaMLx1Q027QICk1xw6
 GOcMf0ZeJzxE16mOIP1eh8YHcFNXeCt6BMeMYGeSxEzmXLFRTkUS20lyaPihXAlgOo7n
 3wNkADF2GRmNbauV/DltdxYgl0GoSQPwvkmZyKXUOpKKk3ipTlo7/NkL4p8cA6Z6ECdJ
 ZR4HMK2QM2YJBpGt8wfV72UC6VNVFCCY4ahwb+tPnvIGzY3H8OnSZTNZYWvHp9e/gjvg
 cX0wPlpkVMbw3sBrQkauQHX6xvWLsYdN2dMTjhVYzzzbh/g01qqPoVl3KyHSgRAuL6R8
 1IXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wlcleqYJY5jQ1OZcMa4GgQUjEFsprvthMn+zX7CdCH0=;
 b=P/IeS/6uP35pmM7Q6n9IA51325WhVpfNWVKESp7zPqd4+rAZf9bCfctED3GdQQgjwv
 NnjMMSNUuNeNApXmBt6vMLCGh7iTCan6NsxW2hf3l/rlwIpSv8m4ZfyukZiwuQtBe8G1
 bKqA080nXygVA9QL3X2CiUONC6qhIPn+lW/Fn6Dr+hnVqmej82GNEfgjVj+c4lLss+MI
 UH1csUZR6VveXfdxN9Y0FU5WyOvHniS+4D55MVF2dUIWPz3ih+tm1ckYVUe2QVag3G+E
 JfDZA9ejIgWtSvI6yeE8P5MfYTAGuuTpNXC//tS3K+CcdykHlx37c6brSRc+Lo4Qt88n
 +i/w==
X-Gm-Message-State: AOAM533DSCbQfKtNHY+KqI0IcsB0+FCplsKFxl/jfEAbXFKdsD76iPM8
 /w1g6ITB/FcEgmFjfUS24A0aCA==
X-Google-Smtp-Source: ABdhPJwKOPKcRllwzqIDBY+TgIWIRPSnExaAAvyTfdJWtFOiySyUOdAS4Vf5gq6RLSb6KEqnudtfkg==
X-Received: by 2002:adf:f10a:: with SMTP id r10mr23439173wro.406.1594132697074; 
 Tue, 07 Jul 2020 07:38:17 -0700 (PDT)
Received: from localhost.localdomain ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id y16sm1276131wro.71.2020.07.07.07.38.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 07:38:16 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH v2 21/28] ASoC: ti: omap-mcbsp-st: Remove set,
 but unused variable 'w'
Date: Tue,  7 Jul 2020 15:37:35 +0100
Message-Id: <20200707143742.2959960-22-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200707143742.2959960-1-lee.jones@linaro.org>
References: <20200707143742.2959960-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Samuel Ortiz <samuel.ortiz@nokia.com>,
 linux-kernel@vger.kernel.org, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, Jarkko Nikula <jarkko.nikula@bitmer.com>
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

Looks like 'w' has remained unchecked since the driver's inception.

Fixes the following W=1 kernel build warning(s):

 sound/soc/ti/omap-mcbsp-st.c: In function ‘omap_mcbsp_st_chgain’:
 sound/soc/ti/omap-mcbsp-st.c:145:6: warning: variable ‘w’ set but not used [-Wunused-but-set-variable]

Peter suggested that the whole read can be removed, so that's
been done too.

Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: Jarkko Nikula <jarkko.nikula@bitmer.com>
Cc: Samuel Ortiz <samuel.ortiz@nokia.com>
Cc: linux-omap@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 sound/soc/ti/omap-mcbsp-st.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
index 5a32b54bbf3bb..0bc7d26c660aa 100644
--- a/sound/soc/ti/omap-mcbsp-st.c
+++ b/sound/soc/ti/omap-mcbsp-st.c
@@ -142,11 +142,8 @@ static void omap_mcbsp_st_fir_write(struct omap_mcbsp *mcbsp, s16 *fir)
 
 static void omap_mcbsp_st_chgain(struct omap_mcbsp *mcbsp)
 {
-	u16 w;
 	struct omap_mcbsp_st_data *st_data = mcbsp->st_data;
 
-	w = MCBSP_ST_READ(mcbsp, SSELCR);
-
 	MCBSP_ST_WRITE(mcbsp, SGAINCR, ST_CH0GAIN(st_data->ch0gain) |
 		       ST_CH1GAIN(st_data->ch1gain));
 }
-- 
2.25.1

