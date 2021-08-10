Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF113E5730
	for <lists+alsa-devel@lfdr.de>; Tue, 10 Aug 2021 11:38:59 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A7A1F1672;
	Tue, 10 Aug 2021 11:38:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A7A1F1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628588338;
	bh=5px3Cimy4iu/daEeWaHvs6bSF1rCUGuaA7EuEJsWxB4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pdmtSrQaPElaXpBK7uI4rSIHJq4stNrlFekqkr9/8Ycn8ZEZiOKNTnRjce3QKEOxY
	 qDbqBTtQikdwoksTo8lQfKJU78q3rm5seiaxVdfpx6+l5Rb72dz1td3aPS8HFHFTZu
	 bTbJeVbBUnTrRP/5OvFaSfoJZCOLFwU0K7RNCk3s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 129ECF8016B;
	Tue, 10 Aug 2021 11:37:31 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8870F8025D; Tue, 10 Aug 2021 11:37:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-7.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
 autolearn=disabled version=3.4.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1475DF8016B
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 11:37:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1475DF8016B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.b="LuqhlqIX"
Received: by mail-pj1-x102e.google.com with SMTP id
 mq2-20020a17090b3802b0290178911d298bso4432771pjb.1
 for <alsa-devel@alsa-project.org>; Tue, 10 Aug 2021 02:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EooUrttQkSGGKk5aXhKQCqIE40W9rEd6lYvmZbP35ic=;
 b=LuqhlqIXe6YrbxZY2g/8+TVPvMxslVNVuYN5JuyYy2Epm0Woyw8D7Xyaxp3wzPj2h1
 eIosjtsii1KAOL3rqcoUdQLdWx+p2CiecK9ijCZuDFVSRWOD6Mv7zrxutnW3DCWoqqGQ
 RYiYezh4wqlyH1re+kN/F+iG9zLFXy5HgyESTF0ywtx21F/WNYfNmTtxFwPQbJ2pUvXf
 aHX1UbmeXFyikA6j0LhB/gla9voY4g4Q1F2/7Kce63Z+Bpyku8A7zcqIs6vsN844dxed
 3Rlj816YQWf92/yU62Ts5QUUl4Tq7LeemAzK0WR31fN218C+UDm27tOimkDh1RKG4oRk
 r2Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EooUrttQkSGGKk5aXhKQCqIE40W9rEd6lYvmZbP35ic=;
 b=YNZpVfbiKaZP3j5IO/lJJuyuPqbu4gd7fjFjBEjh3Ym3R5Mib3ZT2xL+EDJM4P60Rh
 FQKaf8JnGqlX9IDYw/7XkhjaP08Oxt+hzB6PHxhl4KgP5t19SIC84BvJM+g69JQRvEWL
 jJ/h3VNVHl1aaVZEsQzIvEWFe4k+P7JFaLwAVwXygD3r4JotgHiuen3nDWf2aFyuT9Lk
 hdQ3a/7iVkRyLZActGI2N+1N4UQO/yWU50/eZ4w/E7ucwennI9sUMHVVksjXpVqR0OmF
 RsUKefekk2ZrnJCZrQpS7PGLbxbavI6diLQr+xhE7xOOZHjPh2Uccb9mLylHT1BRhtti
 YNJQ==
X-Gm-Message-State: AOAM533B4ARW1fHTTYGl0iQWyIJ9/LUeMcffC4Dcca0pqN0gyio8yv7J
 h1kplkJ1kYFNUqU1RXo4wYPK8Q==
X-Google-Smtp-Source: ABdhPJxbg0bywfMRwZdah9ui6neKwc4xUTWf2MtdZORDq+EQsFsh6FebcuBxdZYZcjpEzWJM8wJMFQ==
X-Received: by 2002:a62:88c5:0:b029:3c5:77f1:ab71 with SMTP id
 l188-20020a6288c50000b02903c577f1ab71mr22577537pfd.1.1628588235254; 
 Tue, 10 Aug 2021 02:37:15 -0700 (PDT)
Received: from google.com ([2401:fa00:1:10:236:db61:d8af:d151])
 by smtp.gmail.com with ESMTPSA id l18sm18325539pff.24.2021.08.10.02.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Aug 2021 02:37:14 -0700 (PDT)
Date: Tue, 10 Aug 2021 17:37:11 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: Jack Yu <jack.yu@realtek.com>
Subject: Re: [PATCH] ASoC: dt-bindings: rt1015p: fix syntax error in
 dts-binding document
Message-ID: <YRJIx4O4BTybk1gi@google.com>
References: <20210810020834.32414-1-jack.yu@realtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810020834.32414-1-jack.yu@realtek.com>
Cc: oder_chiou@realtek.com, robh@kernel.org, alsa-devel@alsa-project.org,
 lars@metafoo.de, kent_chen@realtek.com, devicetree@vger.kernel.org,
 kenny_chen@realtek.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 broonie@kernel.org, derek.fang@realtek.com, shumingf@realtek.com,
 flove@realtek.com
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

On Tue, Aug 10, 2021 at 10:08:34AM +0800, Jack Yu wrote:
> Signed-off-by: Jack Yu <jack.yu@realtek.com>
Would be better to put the tag:
Fixes: 064478e4877c ("ASoC: dt-bindings: rt1015p: add new compatible id")

>  properties:
>    compatible:
>        oneOf:
> -        const: realtek,rt1015p
> -        const: realtek,rt1019p
> +        - const: realtek,rt1015p
> +        - const: realtek,rt1019p
Not directly related to the fix but the "oneOf" has 2 extra space indent from the upper layer.
