Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F44F2D386
	for <lists+alsa-devel@lfdr.de>; Wed, 29 May 2019 03:55:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B2CEA1607;
	Wed, 29 May 2019 03:54:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B2CEA1607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1559094926;
	bh=kBZhWVgbYejIAz8NClnuUrYhjcaaG7v1nFBFsSakYx8=;
	h=Date:From:To:Cc:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MlbGTFsOtp5lePZkpIeQ3k/2mU3OvawpCw3QFB4YCeABhk7ANSJL0z+9vDKuHRMlb
	 vo1iH6LE0co6NhHoKmaBbuKtUUuZV8F7LfoERhEqPx/LJTTyD+L3frkbs9IB6i+lpa
	 X9KMMybvDE640fRF+nc1hTG2BMrqHUopZH7wvDQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E58FDF896E0;
	Wed, 29 May 2019 03:53:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ECB9FF806E5; Wed, 29 May 2019 03:53:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS autolearn=disabled version=3.4.0
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 77F34F806E5
 for <alsa-devel@alsa-project.org>; Wed, 29 May 2019 03:53:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 77F34F806E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Gf6uf9ZL"
Received: by mail-pg1-x543.google.com with SMTP id w34so312196pga.12
 for <alsa-devel@alsa-project.org>; Tue, 28 May 2019 18:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :user-agent; bh=GFkfdKcziRNK4G5X1v4GEXAK4KAxWzSyd1rG3iBhpqE=;
 b=Gf6uf9ZLJFdbF2Tz3CtbEi5DpT7zoLEJswQZZlqfv62FlIUi96M62iFykxyCx2RZYV
 C0EWTeRU33+5d03Ow2UeCv+x6g5nqmfFFS8E4ckBgSCnFQSrOu4oHjZQGBLMHlRlk/a0
 xyKzPWHOb8+JXHFfNlpn7S5d70/n4j7ErVcoEuG8pyhICJeF1h7X8ynUwqEOgwNh/+4a
 Wq7GggU3PYOAGWpkYx1bMMRvOAEqjCsY6JuY5zzUnCT1lwpm1+Y3zO1ABgcRm5TxbVBy
 cKPdLbJvHwqb9VyIaVRYrS7ELRu2uxeerFeta0Mb/Mv76DWFRngOse4aSm1ZjdCgnHMW
 fhjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=GFkfdKcziRNK4G5X1v4GEXAK4KAxWzSyd1rG3iBhpqE=;
 b=M8Dqr+a2nd7HGX9X5gOJk6Qh2D+u3bJHy79zJzZDGtQtLIh1IJeWsYJVA4iKTnFtYK
 DnCEu62OaAFZ7eZiYjTFSqc+q8QFdSxXg2iJKO08jbXc5HNjuQVqPUKaTZUPhaNzo3DT
 2WpVXjAV4yG4OCPrCiTVfkueTjyyvxT/T19MOpM4b/wBs7WmwlUEUK+NjP0u7/Myys/c
 Wc74pQCJ84ZqkNDCityTRQG5KvAT0ePkGxA/803cYPT2S4XKwAiC1yrwfIquRGhCtnGO
 /7yKGqG9tg40frHjF5Dpnxm/50uriNGyRcytPPaTEC8qX8SCQzUVpwoygB0m1t5RLg9s
 1N8g==
X-Gm-Message-State: APjAAAWbMuwlCwyiXpnoS2ls9Vl8F5bw78rDxh7IBuZSMlw5udXJ4IJK
 o9gTpX+BTuppzeUhYqdUnGs=
X-Google-Smtp-Source: APXvYqxxWam7KfL/O/GisA3wPveL8l5MJwx68efl0AKePXCW1X8GjrVWOHqomHwq6xiE4jzisBH34g==
X-Received: by 2002:a17:90a:35c1:: with SMTP id
 r59mr2222430pjb.49.1559094809768; 
 Tue, 28 May 2019 18:53:29 -0700 (PDT)
Received: from zhanggen-UX430UQ ([66.42.35.75])
 by smtp.gmail.com with ESMTPSA id l13sm3654097pjq.20.2019.05.28.18.53.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 28 May 2019 18:53:28 -0700 (PDT)
Date: Wed, 29 May 2019 09:53:05 +0800
From: Gen Zhang <blackgod016574@gmail.com>
To: broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz,
 wen.yang99@zte.com.cn
Message-ID: <20190529015305.GA4700@zhanggen-UX430UQ>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: [alsa-devel] [PATCH] wcd9335: fix a incorrect use of kstrndup()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

In wcd9335_codec_enable_dec(), 'widget_name' is allocated by kstrndup().
However, according to doc: "Note: Use kmemdup_nul() instead if the size
is known exactly." So we should use kmemdup_nul() here instead of
kstrndup().

Signed-off-by: Gen Zhang <blackgod016574@gmail.com>
---
diff --git a/sound/soc/codecs/wcd9335.c b/sound/soc/codecs/wcd9335.c
index a04a7ce..85737fe 100644
--- a/sound/soc/codecs/wcd9335.c
+++ b/sound/soc/codecs/wcd9335.c
@@ -2734,7 +2734,7 @@ static int wcd9335_codec_enable_dec(struct snd_soc_dapm_widget *w,
 	char *dec;
 	u8 hpf_coff_freq;
 
-	widget_name = kstrndup(w->name, 15, GFP_KERNEL);
+	widget_name = kmemdup_nul(w->name, 15, GFP_KERNEL);
 	if (!widget_name)
 		return -ENOMEM;
 
---
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
