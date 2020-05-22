Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE5B1DE191
	for <lists+alsa-devel@lfdr.de>; Fri, 22 May 2020 10:09:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 216DA186E;
	Fri, 22 May 2020 10:08:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 216DA186E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1590134985;
	bh=IagtkNysS8SZLN9nlw0QfwKfVrnhdCmQxeUODQ1rmtc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sZWFoavTDJPUo/m3245ecj+jvzx8doEWO4wHuMhOZt/K3oXBv4Nfn29Yd6rlEYlPU
	 f8m2acmTrt4D4qRtVHSfSwOjc6tr3/RVl9GO13aA8zSwOouNCqrGkwwXRF+2Gh5dxg
	 dgV1vsNv2sB16vMG8MpgAurgn+xWuCS7jJKtkf6s=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8B201F8028E;
	Fri, 22 May 2020 10:07:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8085CF8027D; Fri, 22 May 2020 10:07:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7E3EAF80216
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 10:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7E3EAF80216
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="G/dNHTQ3"
Received: by mail-wr1-x441.google.com with SMTP id g12so8046972wrw.1
 for <alsa-devel@alsa-project.org>; Fri, 22 May 2020 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=O8d7KRaVnTOYXbysuI91JxBTkFpRwhQV9rw+72hpaS8=;
 b=G/dNHTQ35mXQKHenUhOBnQl4YBjCar5Smta1ZVS05OfG3JnGXyUgOMqTTIFecZ4RpJ
 QVs8IH21VCyyv8jJe05KrL0dOHZToLB/p9dUWi9V4IRoIJaFis5g1Y8G80/oUMzh67wS
 JkZIsiAgncGU8tB3eFwpuqToHAxb4oxryfOjUe+zIXUVeBDVU/MKN2J0Nupve/6mLuXL
 5cNSxXsCHnR+qot00GbqlO+TzdGzgsUpAfQYyjT/VbETx+WawHBJGNm94sRcppuI1tv4
 jy4KjLXauJ951srf059okjvTOFbBHwEP5F1Wa0L/fbL5kefaK75OpkJO3xC2/aNbKQ34
 DBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=O8d7KRaVnTOYXbysuI91JxBTkFpRwhQV9rw+72hpaS8=;
 b=hgRoljA2UUY2sXaL9Crkuwh9t9u8VNcQF2riQb/50+ddvXU9054VjiK42zIXLzr+MR
 EM9EaFehadb0NkLU+HRIWQD0Lu3YZVtkJVYUM0PqW/7KLkcKRQC9WZSIlpmIThtdkC/K
 8+jbeERBcRXdB34cLDRw5x9IpI8a94vz3TUlm20GKzu1oU88T7Bo+aTLYAgCKh0wohn2
 UToDFsFuGHeKDp1fohQsVlA35T4+dn4UcEAGIJ9LO6brYyDc4IyczmLihGDGJNhfSvwB
 nxhJBkDaHmh9HtxPruabtPtGqlRnCiCwLCaXXRSRxTt8lWmYpswf6WO8nY8lcK9FHjYv
 4Ikw==
X-Gm-Message-State: AOAM5337KMZ0K2eyQwkYRIZeeDb6m1e4+X7C5pqn1Z+9i1DA6cZ20qSg
 aj+Gwx5FM4+EezN/Tmyt4PFqDQ==
X-Google-Smtp-Source: ABdhPJzK2pPNBTiomUPCXFOUqiKwd1QeBg43v4ZVNsVsWWhj1zS52qpTGnmcOXW17aVaF5waVx03yA==
X-Received: by 2002:a5d:5449:: with SMTP id w9mr2412511wrv.106.1590134868149; 
 Fri, 22 May 2020 01:07:48 -0700 (PDT)
Received: from dell ([95.149.164.102])
 by smtp.gmail.com with ESMTPSA id s19sm5119770wmj.21.2020.05.22.01.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 May 2020 01:07:47 -0700 (PDT)
Date: Fri, 22 May 2020 09:07:46 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH 3/4] mfd: wm8994: Silence warning about supplies during
 deferred probe
Message-ID: <20200522080746.GT271301@dell>
References: <20200427074832.22134-1-m.szyprowski@samsung.com>
 <CGME20200427074843eucas1p2235840d80cfa81a1e1eee513ed88c794@eucas1p2.samsung.com>
 <20200427074832.22134-4-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200427074832.22134-4-m.szyprowski@samsung.com>
Cc: alsa-devel@alsa-project.org, Charles Keepax <ckeepax@opensource.cirrus.com>,
 patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Mon, 27 Apr 2020, Marek Szyprowski wrote:

> Don't confuse user with meaningless warning about the failure in getting
> supplies in case of deferred probe.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/mfd/wm8994-core.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
