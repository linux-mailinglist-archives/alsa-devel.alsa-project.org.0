Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B82030F451
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 14:56:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38FC916F8;
	Thu,  4 Feb 2021 14:56:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38FC916F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612447017;
	bh=xh+EVf8QpMJDaeU2TB+OKcujphlWcmbC4P2bZkaa50w=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cHD6lf/XGjRXElN2o9LLwf2bfYja6eL8ZWzr2Ix3EedAsBEMecJDJZ+0l6pOF9FXS
	 gTZIYLzLFFALUkT52nQz/Tfc9nkYfUJiQGTNgoTwQ2rkneP7flVqVNH/wgv+08g1AE
	 gC1aEJUTkxlKHeKTJWgDl83WkdnspsNtImG+dmZ8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88150F801F7;
	Thu,  4 Feb 2021 14:55:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 42672F80171; Thu,  4 Feb 2021 14:55:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61F52F80152
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 14:55:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 61F52F80152
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="HDJME6Og"
Received: by mail-wr1-x42c.google.com with SMTP id p15so3567341wrq.8
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 05:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Hzfyw7cGPV/6uJGFEu+jTS7JZCswuKZE6330B5/rJRw=;
 b=HDJME6Og8gQPqE8NM81cSx+88PddfmG5gPVNemmtSq3Y8X8suM8zbGaTP9KZzoBKEM
 hRhB0B9ZL1ycoNLqPCiyb3kxYAewRT3Zq5kPQgOx2VQBidV7D8zZKbwvn4eXQYgE+YDY
 cvuHGM8Z9TPcylYKpwXnkfl9+Zu8Y4f/Q1T3aZC/pj2i6+R2T0ZYs2mh4zF/B+dPtN6O
 m7VrYgcxl3IA2oXP9JPvpq3FWQXG0VFueDmfqymKV7wuw+8083nvNMAL9JafODYTdfB3
 iRjYWt0m7/F8hiH9t/dlPsrbhaY4db1+rnd0tZOTNxlY5G8ERYfp8K25YHmHAZViut4v
 0mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Hzfyw7cGPV/6uJGFEu+jTS7JZCswuKZE6330B5/rJRw=;
 b=Fl1wNF1xTmcBR/93diWMoUjQOWp2cDfeq14xwHmJ5zyLR8sp1K5qZZrtGY07T8JXBZ
 A2W5FsnkWrmJq3Kld0PT4wbsBujg3xKJfpY34y97Gyk+fLAMpIJpwfTBFCwkgILJLnT9
 Q4tXNU9J1UigpzaHvGhB6jN33dUEMGEX5XMqsgIrJO/MSpRFX44VartqtX4azCd81AaF
 0KRmci+/BOobJ7L4rUVDAN3TD2ss2jrBYblKPBymBZ6onAEeZY+6Au7etBaBVYyrL2sM
 Zdl/64SJtaVcOo/TWetDx74h9iVQ2hKQ5pldMglJ2dplc1nSCX/LYV1QWnBUefiPrtMG
 Shdw==
X-Gm-Message-State: AOAM530hZEes7UaOgkCzmKXkffY9PaDn5itDPwjYT4LeVCkss2DWfJ7u
 Yj62zZfM/K2fowITOSk1QkMkjQ==
X-Google-Smtp-Source: ABdhPJwVtEgqFoIpPqm9mOUpNe597hHfgmhLCj7nzFG8QdQDBA4AccFnlrQRCr4Ieq2ypY5AazLUsA==
X-Received: by 2002:a5d:53c3:: with SMTP id a3mr9212935wrw.43.1612446915658;
 Thu, 04 Feb 2021 05:55:15 -0800 (PST)
Received: from dell ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id x82sm856894wmg.31.2021.02.04.05.55.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 05:55:15 -0800 (PST)
Date: Thu, 4 Feb 2021 13:55:13 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 2/5] mfd: arizona: Replace arizona_of_get_type() with
 device_get_match_data()
Message-ID: <20210204135513.GI2789116@dell>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <20210120214957.140232-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210120214957.140232-3-hdegoede@redhat.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>
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

On Wed, 20 Jan 2021, Hans de Goede wrote:

> Replace the custom arizona_of_get_type() function with the generic
> device_get_match_data() helper. Besides being a nice cleanup this
> also makes it easier to add support for binding to ACPI enumerated
> devices.
> 
> While at it also fix a possible NULL pointer deref of the id
> argument to the probe functions (this could happen on e.g. manual
> driver binding through sysfs).
> 
> Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
> Changes in v2:
> - New patch in v2 of this patchset
> ---
>  drivers/mfd/arizona-core.c | 11 -----------
>  drivers/mfd/arizona-i2c.c  | 10 ++++++----
>  drivers/mfd/arizona-spi.c  | 10 ++++++----
>  drivers/mfd/arizona.h      |  9 ---------
>  4 files changed, 12 insertions(+), 28 deletions(-)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
