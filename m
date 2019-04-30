Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D1EEEE6
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 04:57:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A8291668;
	Tue, 30 Apr 2019 04:56:09 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A8291668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556593019;
	bh=AfUoZN5RAiC1drB/NxdqAXt33oYLAPX+TIL4WuYr3Vk=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rghmv2W4vSU3Xd2Ue1kG1CVXIWBbou4uMG45D92xY8tg38O/4q978SdjILjtfOAhU
	 rFC64E3RFtnTdkM1HvAdaA1JWffj7Ald8/NPDMjTPo9ZHYaLc90u/lSmCEtrGxjBgn
	 NVYUSNaCPJ3uT/fE7iG7bha/sw2zYpxPkylKFoWM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D9128F80C0D;
	Tue, 30 Apr 2019 04:55:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DD69FF896AA; Tue, 30 Apr 2019 04:55:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5E537F80C0D
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 04:55:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5E537F80C0D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="jsqMSj9X"
Received: by mail-ot1-x343.google.com with SMTP id 77so4436604otu.13
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 19:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bt+90qKJU51hc2zj+wyErRDhxM+YorzWX9KYuojMxOI=;
 b=jsqMSj9X3fRj0YFL5jSMd0EkQP21EHUJHAXMgNHmoL+P90pUJ5Sx5iIkYBdG9IbkdK
 N/lC8T5N51Scf9+lteOZqHg11GKw1Zw1YYZkwUh0XE6gQntOv49m/ZOnjnkjEK+RW4Qp
 tnmIetz6h7k7KLL9Wdf5/HtGtxljTzrhtdbO7E2Qr9Mg1BxBU+jVuNPahRgP/m8xLeCc
 2KlGk+efpxRx1HbWHj89P8m4xoTFNguyNsVSdGBmDnwIYot26G9zwYgYD2XnarsXbOib
 CPSFjAi1ahzmuZ8yTK+aPPgJIA5DsJa5OdrdOO+TDiwjuJ/0C8poIZNt+ZFf1l7Jiszz
 rgag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bt+90qKJU51hc2zj+wyErRDhxM+YorzWX9KYuojMxOI=;
 b=kqhLj654SVFgqwvxuweI5nxBzL4P//QOQHo4br91czXL0+MJEtMa5pjUOrX5IUE5Cf
 mZm+56o0jtEu18lsSstw3CIyz403LSx1M0f9Zv1x5MDMwdj1RaiAYlczrxWRh5YcRCLB
 6KswKTzyU9l5KiWOyh2DZUTI7cMgD5BxvBIFlQqfg2s9Q7pWQS5LSuMy5wnulTGtvuEV
 OGsXz9l9wQ8FfkqWmsNxJ9/QFfFLLue8tpKKDQj/d1dwcbq+gqNTdxy6oDdxAfPLFaK4
 GMzDVkXyrsN8QdeBoYN0snZM5UzuDr6NiPUTkRGdjB3HjutW28FPlCAEbPZyCwNhkVHY
 VSog==
X-Gm-Message-State: APjAAAVDVejlmKiZ0VWQ51YyrXE/xWNFCfBw3wuXnLB01p+p/w5r7L9L
 kX1BQ0zZJJ1pwYswkDfEN8bayYZ4bZ7b8x/0BsBYpw==
X-Google-Smtp-Source: APXvYqza1fSMSoBvnt0Jo4oJAm75w947jdC8tfEOFgO4J39P16MQxMTnMDONNOU7uqQ8ZQ2JCrF+Y/d3FabU0N0gWDE=
X-Received: by 2002:a05:6830:b:: with SMTP id
 c11mr10056069otp.281.1556592903791; 
 Mon, 29 Apr 2019 19:55:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190429122512.59242-1-weiyongjun1@huawei.com>
In-Reply-To: <20190429122512.59242-1-weiyongjun1@huawei.com>
From: Baolin Wang <baolin.wang@linaro.org>
Date: Tue, 30 Apr 2019 10:54:51 +0800
Message-ID: <CAMz4kuJtMAyjbPR0Yf_FN1fhDwSi5=0WAgD_BNEuTB5GhcTYxQ@mail.gmail.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: alsa-devel@alsa-project.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH -next] ASoC: sprd: Fix return value check
	in sprd_mcdt_probe()
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

On Mon, 29 Apr 2019 at 20:15, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> In case of error, the function devm_ioremap_resource() returns ERR_PTR()
> and never returns NULL. The NULL test in the return value check should
> be replaced with IS_ERR().
>
> Fixes: d7bff893e04f ("ASoC: sprd: Add Spreadtrum multi-channel data transfer support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Thanks for fixing my mistake.
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

> ---
>  sound/soc/sprd/sprd-mcdt.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
> index 28f5e649733d..e9318d7a4810 100644
> --- a/sound/soc/sprd/sprd-mcdt.c
> +++ b/sound/soc/sprd/sprd-mcdt.c
> @@ -951,8 +951,8 @@ static int sprd_mcdt_probe(struct platform_device *pdev)
>
>         res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>         mcdt->base = devm_ioremap_resource(&pdev->dev, res);
> -       if (!mcdt->base)
> -               return -ENOMEM;
> +       if (IS_ERR(mcdt->base))
> +               return PTR_ERR(mcdt->base);
>
>         mcdt->dev = &pdev->dev;
>         spin_lock_init(&mcdt->lock);
>
>
>


-- 
Baolin Wang
Best Regards
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
