Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B44EEEF0
	for <lists+alsa-devel@lfdr.de>; Tue, 30 Apr 2019 05:07:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A3351668;
	Tue, 30 Apr 2019 05:06:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A3351668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1556593639;
	bh=84uGBy0qubl1uiZp5guiGcjuEPU5X/QFomKDOn9IzuQ=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TLnPcShN4+eiGzcFj+KYtgcvQSqrrNrc6wA980okmz/PT4EOC6iLIjW4UHFkXZSRK
	 TnpFoctePt/pbupDxNS1ARFXvAcewDXZe1g5H+cq8Dn5SHuL/0TCO8/zvfgs6VORIc
	 OQQvkAlraWHGDr2XwjreVebPXEMB1KMc00+2grVc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8ABB8F896AA;
	Tue, 30 Apr 2019 05:05:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 26F51F896AA; Tue, 30 Apr 2019 05:05:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ECC36F80C0D
 for <alsa-devel@alsa-project.org>; Tue, 30 Apr 2019 05:05:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ECC36F80C0D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="TTYmZcgr"
Received: by mail-ot1-x343.google.com with SMTP id t20so10631086otl.5
 for <alsa-devel@alsa-project.org>; Mon, 29 Apr 2019 20:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IWZIhQH13t7up+A8LAQ0WG0QKdeSgcY1YMpA39miM9M=;
 b=TTYmZcgryWx4jv0IxAfd8fDg3iAVensTO0uOB6gqkA/cTu0G1y0w3soe+/MdVWSty7
 U6DKE5QXP6rk/iQUIuQ/p7FVQ2OvkVPC+WIFwcDg4xxoopsFdmoCu1YW8lBPe+6gbpvF
 0fwk9tgqQqe6RpUb1/IDo2zTL00HxnH31CUwdW3byu5QT8W/b7+ypv6FzI0ZVDw+/cnt
 /aUxVeeadXzieV08coGaZejGHKUVujJ0F36f/8g8z6lRymuYBKS4gzyzhz4t07v91O9E
 cD2EmVztPrT6ZrBfLxM2i14kM7v/o07XXsy5CELZfBaT86I08optmaHLpF3N2NzoRbZg
 I7bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IWZIhQH13t7up+A8LAQ0WG0QKdeSgcY1YMpA39miM9M=;
 b=CvQVSDHAop9GZwd0ewqaqlc5ukVKW0hweT0YmYNrLmNmlnuBisMEs/gk8Jsx1ZxwyI
 nsL1AJKml7UlBds2T1Kt+4OdeCaVU9iV4Wss061yP3tOJTEFtKyANmwIW/goZdQEcJav
 KBQ1YyYExS4DWYF/MGsBqx8FKeVd4uGVXkeNE+cD1v/J24tzfe4wl+hYVabW5F1eGvC+
 xlzEsZv6VQPnN3Jc6pr0Q2140/+Xc85Dp3w3AVX9AtDdqo6chhfTB8IQ3zeDxUEV9HE6
 tDz8+J90ZNdboT6jHtorlDN/4uvnciBmJsXYYqU4s19pARREJMMyeMEH6geSgMulV9gK
 ZNZw==
X-Gm-Message-State: APjAAAVNPpSgf8l75sUDtN1FKba5C/et24akHu8LIxku3Ed+gPWN2Ifd
 GMJTGdZo37GW2+gneqxWQiaNm0aH8iPWeORnDJ5Ko7YUomAOPQ==
X-Google-Smtp-Source: APXvYqxSbr+MgQHT97JlimaGQfOmQJ3pSvxXhgdPQzpWhzrLX4J4I8y1k5W+BBYumzvXcYWqdcOtc8eS+ciBE2sDm20=
X-Received: by 2002:a9d:7ad9:: with SMTP id m25mr41025914otn.75.1556593525418; 
 Mon, 29 Apr 2019 20:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190429123713.64280-1-weiyongjun1@huawei.com>
In-Reply-To: <20190429123713.64280-1-weiyongjun1@huawei.com>
From: Baolin Wang <baolin.wang@linaro.org>
Date: Tue, 30 Apr 2019 11:05:14 +0800
Message-ID: <CAMz4ku+v+DS_7N+6yWzqGQvn3KiW-3ACNbXL1W4YjWSmu3AxwA@mail.gmail.com>
To: Wei Yongjun <weiyongjun1@huawei.com>
Cc: alsa-devel@alsa-project.org, Chunyan Zhang <zhang.lyra@gmail.com>,
 kernel-janitors@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [alsa-devel] [PATCH -next] ASoC: sprd: Fix to use
 list_for_each_entry_safe() when delete items
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

Hi,

On Mon, 29 Apr 2019 at 20:27, Wei Yongjun <weiyongjun1@huawei.com> wrote:
>
> Since we will remove items off the list using list_del() we need
> to use a safe version of the list_for_each_entry() macro aptly named
> list_for_each_entry_safe().
>
> Fixes: d7bff893e04f ("ASoC: sprd: Add Spreadtrum multi-channel data transfer support")
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Yes, thanks for your fixes.
Reviewed-by: Baolin Wang <baolin.wang@linaro.org>

> ---
>  sound/soc/sprd/sprd-mcdt.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
> index 28f5e649733d..df250f7f2b6f 100644
> --- a/sound/soc/sprd/sprd-mcdt.c
> +++ b/sound/soc/sprd/sprd-mcdt.c
> @@ -978,12 +978,12 @@ static int sprd_mcdt_probe(struct platform_device *pdev)
>
>  static int sprd_mcdt_remove(struct platform_device *pdev)
>  {
> -       struct sprd_mcdt_chan *temp;
> +       struct sprd_mcdt_chan *chan, *temp;
>
>         mutex_lock(&sprd_mcdt_list_mutex);
>
> -       list_for_each_entry(temp, &sprd_mcdt_chan_list, list)
> -               list_del(&temp->list);
> +       list_for_each_entry_safe(chan, temp, &sprd_mcdt_chan_list, list)
> +               list_del(&chan->list);
>
>         mutex_unlock(&sprd_mcdt_list_mutex);
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
