Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB5E7BB417
	for <lists+alsa-devel@lfdr.de>; Fri,  6 Oct 2023 11:17:31 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7D6F8857;
	Fri,  6 Oct 2023 11:16:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7D6F8857
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1696583851;
	bh=vTC/0JYLxjfofX+MZIfRESrVmoTNJ+9IBorts9QQuvs=;
	h=Date:From:To:Cc:Subject:List-Id:List-Archive:List-Help:List-Owner:
	 List-Post:List-Subscribe:List-Unsubscribe:From;
	b=CLMcUCyEi5cslfl6Ax1K1VYBFbn4BkPNOuOVU87oWJHNu2yL0puVwyofcMqKsTeLZ
	 wsgiMmPl5+ISbWZt8Yx2IdkwDspBb+PXjREuIuMWazq1qHntMcoakZxmvHAkMOipj/
	 qQXvOuz3bsqSz3+snW+JD4+uGOWn7yDGtkK3qbD4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3BCCAF80564; Fri,  6 Oct 2023 11:15:56 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 980FAF80563;
	Fri,  6 Oct 2023 11:15:55 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 709A0F8047D; Thu,  5 Oct 2023 16:00:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D0F09F800C1
	for <alsa-devel@alsa-project.org>; Thu,  5 Oct 2023 16:00:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D0F09F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=bDJ8tffa
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3248e90f032so1039745f8f.1
        for <alsa-devel@alsa-project.org>;
 Thu, 05 Oct 2023 07:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696514428; x=1697119228;
 darn=alsa-project.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bq6Al0uhdqE8dyQRZT83/DywvErgo4yew/KdSq0MhvE=;
        b=bDJ8tffaluBwBxcV7Mo4OP6BkSbKI/B6GiQ/wv2KbbPuljbdv8rH+4eesWo7I3OUjx
         iV+yMu7H3MrOKNHsz1VqaJkU9PvtNV+e6jRWd9AW7LDSiNb/4KQH4Z03OZ84eRonkaHA
         QREu+u5uXo5zyfPgZN8hClAraLaA6jHPSp4VmbGJL2nf7WhvsPMxfUrp6kZlDiGQvv4e
         9QTjOPepoKxhtrvcy68osAXq5/7Gs78xTSjTEK3oEeXKxTL5xLygPT49wYCYnMtc5t45
         CB1GLaBquE91Hw5h9pVodOUVCv0RndvQ3zx+fmUzdTaUNrBJvuEcYUdczsQuZMLQcxvC
         Fk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696514428; x=1697119228;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bq6Al0uhdqE8dyQRZT83/DywvErgo4yew/KdSq0MhvE=;
        b=FbNoeT6M5xP3ygncKLYAy6VcFw9IuGu7UCfhwrYwVOylxShl6H78jGIyLn17UhaK3x
         TmoedHzEczQls4CY0NaTTvgPrZIn62qT5daORZuEtkt+l+wAPE/+p5YTYOifdutParA+
         yAaLVlgf633sLI0/z6Uv/PqZ7MNJ4j4pgsOU0JCLo2q7AyNGm0lV9WuekWc42bl+ofKP
         lDcAHNBE+CaqScDL1q2GyKeMvXRAepLqJBCFMMk/Xu7qdnFID1je19tzfRZIeio3g/4u
         gHrxUzs0nbMJWEHL3WMw31ApH0JkLp8xZ0fbVsNMATWm0PmSdF0EdfTPUtiiKsvmcbKo
         mSlg==
X-Gm-Message-State: AOJu0YzGZ463VPRO/fhIehoiumlMaveLxzFpU9nJESQMJWHmM4Z69qs8
	Ft0pBRcBuOXhjFIVP2S6mBRWqw==
X-Google-Smtp-Source: 
 AGHT+IHwNsl3R2+inwJL9KG2n8GmwjwPTWGIpRhvHpykm2Ag3TFC5h678lIY/dcNTTM8eNFy6XA3Eg==
X-Received: by 2002:a5d:4149:0:b0:31f:eb8d:481f with SMTP id
 c9-20020a5d4149000000b0031feb8d481fmr4870624wrq.29.1696514428084;
        Thu, 05 Oct 2023 07:00:28 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 da4-20020a056000196400b003176c6e87b1sm1856481wrb.81.2023.10.05.07.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 07:00:27 -0700 (PDT)
Date: Thu, 5 Oct 2023 17:00:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Daniel Mack <daniel@zonque.org>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-arm-kernel@lists.infradead.org,
	alsa-devel@alsa-project.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] ASoC: pxa: fix a memory leak in probe()
Message-ID: <84ac2313-1420-471a-b2cb-3269a2e12a7c@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: U4US7MUD6NLYMIEJ4YCUE426HZBTIQ3I
X-Message-ID-Hash: U4US7MUD6NLYMIEJ4YCUE426HZBTIQ3I
X-Mailman-Approved-At: Fri, 06 Oct 2023 09:15:51 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/U4US7MUD6NLYMIEJ4YCUE426HZBTIQ3I/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Free the "priv" pointer before returning the error code.

Fixes: 90eb6b59d311 ("ASoC: pxa-ssp: add support for an external clock in devicetree")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/pxa/pxa-ssp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/pxa/pxa-ssp.c b/sound/soc/pxa/pxa-ssp.c
index b70034c07eee..b8a3cb8b7597 100644
--- a/sound/soc/pxa/pxa-ssp.c
+++ b/sound/soc/pxa/pxa-ssp.c
@@ -773,7 +773,7 @@ static int pxa_ssp_probe(struct snd_soc_dai *dai)
 		if (IS_ERR(priv->extclk)) {
 			ret = PTR_ERR(priv->extclk);
 			if (ret == -EPROBE_DEFER)
-				return ret;
+				goto err_priv;
 
 			priv->extclk = NULL;
 		}
-- 
2.39.2

