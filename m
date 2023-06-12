Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AB75572CA2F
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Jun 2023 17:33:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F3AE182A;
	Mon, 12 Jun 2023 17:32:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F3AE182A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1686583997;
	bh=YOCeZRHZqvMTlmLynbfsUjy5R9B0ftEMm2ePkmva+38=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SStAP5r9kXVbjrG2BR/f2tM+9/guES9xKvoCZ0z0IARHbQuj8KO+pA4zhwRUl3bk1
	 q/kfdsagLpnaGw2ORL1PvxXiF809XjIX55nmCDNgmMMRlqpuyc230r7CdwdyQjZ9i8
	 R9z0Jfe7pSLw4Fz8dQPpNkOb5Clsnq8ODWd0AKNw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 950B9F805A9; Mon, 12 Jun 2023 17:31:29 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 29B5AF805A0;
	Mon, 12 Jun 2023 17:31:29 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 285F1F80548; Mon, 12 Jun 2023 10:13:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=unavailable autolearn_force=no version=3.4.6
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 2AC27F800BA
	for <alsa-devel@alsa-project.org>; Mon, 12 Jun 2023 10:12:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2AC27F800BA
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=TRzCPGz+
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f6d38a140bso29084155e9.1
        for <alsa-devel@alsa-project.org>;
 Mon, 12 Jun 2023 01:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686557572; x=1689149572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Gc+miDzZceXCLueDQlgChLb47zA+DR3zS3KkscEcQ/E=;
        b=TRzCPGz+Dq58XxB3JdEWqYt8+rvlmUpC+39cO6M1Y40MdAkZ7QLtwzQHTtg66aAPIC
         k0VSpTG+VNmvOh0ERZepO44jfP1iLTjuSEUKtnNhB5x3k01TuG0A3CykBRTOzog9+rbz
         HPmDlpujfiOgPajTRfAgS3aviuOIGZreHnEyPL59pXWhbYoePoVYp6cIjgcgsHZ+bNnp
         X1i5xQJfEPL9DSy9CKB6aqHbOkVqc4XvLTpwFUZGSCX0Gohgw5BoIydC7Y0qs1jKyvDw
         rwIarQnRitax1WzUnhRN8ntEbpBWEtk75snkv+3sxEoCMZl6vt9yi5Ywca2Q08w7b6dx
         2qKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686557572; x=1689149572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gc+miDzZceXCLueDQlgChLb47zA+DR3zS3KkscEcQ/E=;
        b=GLuVFIyUneJGJpCTvwG4dlPWG5WB868Xt4lWtEet/W6+KBv3b2Xmo51nfs2RVP1caY
         9c8SBOqej4TwVOkBiQA1JHakuBz0LkcoblVTxJNdlBUtRtjUnVobBRwRQlIB56QlXZIs
         fhD4WM0gVAUquF7K+pBStSDEf6lT+lcYc5NCB4I6TQv70t0yM0zzCxKiGEDfPa+a9T9F
         6OljuTH2qHI1+DvVXkyHg48vRY0PY2Oz2Qi1HwEpEWTq3jJdQ0TZtQe4GcGUFz675Fnm
         hXQ74NnvrDdydqO4dTYyff6rZ7iFPW0s4sVhKEkQE/gbCDmQOJ8DG0BFUeLDh4n/4X4X
         ezCw==
X-Gm-Message-State: AC+VfDyj4lSaaX+PMxXFhbe3duzQkmRZlgqlc/tY00k+UN/5kgtupy23
	i2Yq0anumpQ969Lu7E13+0PgLQ==
X-Google-Smtp-Source: 
 ACHHUZ62clwI1bDc8gob+L8cRFqX7RG2mHcT69nqtEtI1HNgVVz1bnuC3Biqy4NvHzcY8XnVdYQGwQ==
X-Received: by 2002:a1c:7718:0:b0:3f7:e660:cdc5 with SMTP id
 t24-20020a1c7718000000b003f7e660cdc5mr6736284wmi.9.1686557571903;
        Mon, 12 Jun 2023 01:12:51 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 v18-20020adfebd2000000b0030789698eebsm11686312wrn.89.2023.06.12.01.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 01:12:49 -0700 (PDT)
Date: Mon, 12 Jun 2023 11:12:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ricardo Ribalda Delgado <ribalda@chromium.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, stable@kernel.org
Subject: Re: [PATCH] ASoC: mediatek: mt8173: Fix error path
Message-ID: <178ec977-5be3-4b2a-bb24-1286be68baf2@kadam.mountain>
References: <20230612-mt8173-fixup-v1-1-81f5c90316d1@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230612-mt8173-fixup-v1-1-81f5c90316d1@chromium.org>
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: RYFMDX32ZNWEKC53Z5FIKNON4O2DXWP6
X-Message-ID-Hash: RYFMDX32ZNWEKC53Z5FIKNON4O2DXWP6
X-Mailman-Approved-At: Mon, 12 Jun 2023 15:31:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RYFMDX32ZNWEKC53Z5FIKNON4O2DXWP6/>
List-Archive: <>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jun 12, 2023 at 09:49:32AM +0200, Ricardo Ribalda Delgado wrote:
> @@ -1175,14 +1179,11 @@ static int mt8173_afe_pcm_dev_probe(struct platform_device *pdev)
>  	if (ret)
>  		goto err_cleanup_components;
>  
> -	irq_id = platform_get_irq(pdev, 0);
> -	if (irq_id <= 0)
> -		return irq_id < 0 ? irq_id : -ENXIO;
>  	ret = devm_request_irq(afe->dev, irq_id, mt8173_afe_irq_handler,
>  			       0, "Afe_ISR_Handle", (void *)afe);
>  	if (ret) {
>  		dev_err(afe->dev, "could not request_irq\n");
> -		goto err_pm_disable;
> +		goto err_cleanup_components;

Hm...  I hadn't noticed that.  You're right, but I don't think your
patch goes far enough.  I think everything after the first
successful call to snd_soc_add_component() should be goto
err_cleanup_components;

But I am not 100% sure.

regards,
dan carpenter

>  	}
>  

