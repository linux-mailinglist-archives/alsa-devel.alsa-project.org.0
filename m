Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7250A30F456
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 14:57:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11B501744;
	Thu,  4 Feb 2021 14:57:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11B501744
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612447077;
	bh=+xe5Jr00Of6yahPnuYIf36CpJWtkDfDBntJmywOWIDQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=J+/SRIFRmjiA/HVc7UCjQFFRi/02esXCEx6eLHrwI26bC5wiPXQh6ICU4+D6IalWq
	 6wx+Z5hHfLn+NSjw8Zoh2cn61W8hsTYTjnRVVsxJy7Op74GKgE/bPGO97qL/IMni1N
	 nTblCy9u2ts7z5OPy22calfr91ADKzWK88dHn/ds=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 81318F80152;
	Thu,  4 Feb 2021 14:56:27 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id ED3B2F8026B; Thu,  4 Feb 2021 14:56:25 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1BD66F80254
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 14:56:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1BD66F80254
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="Kj+oZgHx"
Received: by mail-wr1-x432.google.com with SMTP id d16so3547095wro.11
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 05:56:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=TnVWEPnb0tC+CtpGZvtAeAVG6+q+gfP9B49rEWDxFOc=;
 b=Kj+oZgHxKT6VUnhZC/8QMwgtWDqE6mef8gshXFGyDiZc86ORD77MSog6/pW0o1Kiq7
 PZUtBLL8fr1/9YO+ybmdbnIO7R0zGOD93OP/5/wTeE4s+y4fSu0x+QFXfzthojyF1Jv5
 wj9LtWz82ML+sF3/O14E8fxjbKOEagsq/caQIBXjERXhZxIRPz5Rzrf9oQ29f+UU/SvF
 ckNuBInpHdm0hjdJkwmMChWeGdlQPgoZ9FwgnjTQP+7PDXzm4dKTGZfHAnDpBU2XdPQS
 Mj8s3Z28AkL2Qmkv9WlU0jbQeNSvPbZ2Vk+ubSvfU6HYJs5KIgWZS4aK0s1k8jVIbGLW
 4ngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=TnVWEPnb0tC+CtpGZvtAeAVG6+q+gfP9B49rEWDxFOc=;
 b=cPKZBAvh1EvkiK0H3gXM+seaS4DqC6jW4NKDrDhqY4oQ1xUoWadnYB9KgwRxY73tCz
 jEuc9ray7pZfKTc6RC8gwUgDSSN+se5ke88Sd3rMTfJ8YTVpF0pOJVNuKHyXNBphOsSZ
 aMD2yCxKCUf4B0TYq2neofFYdR5inPOK9KL9tBQwduL6P51LaTCzbiWX2YaNiSU8ursm
 +ATpEWMR0Z5gwV2HNWArl/x6QEWlr1hhmw6UwW0lEPTqmrxyMDBMl9nZhVYkk8BwXmZR
 9w4w6LG4btdRSUuVy54nIhV+Q+iOYrZOxKwPP9PI1d3wFyNlBjP7Xu0lsN8eBLkOJsyK
 HWIA==
X-Gm-Message-State: AOAM5303/VtAb54iEN9N5a5sxxUG+r3L3Mm/Lot9g+uIA3xMvYedcw1C
 MQduV8+JfW+VMFLZo5i0Fg3ing==
X-Google-Smtp-Source: ABdhPJyR7lU5JUv1D0hoTJ/+0NgUT+/CPRKHhUXCPjJF+cttjIovyhDVjfJQG/ZjTvGd9SKcvOyPTA==
X-Received: by 2002:adf:83a6:: with SMTP id 35mr9420796wre.274.1612446978467; 
 Thu, 04 Feb 2021 05:56:18 -0800 (PST)
Received: from dell ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id m18sm8326823wrx.17.2021.02.04.05.56.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 05:56:17 -0800 (PST)
Date: Thu, 4 Feb 2021 13:56:16 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 4/5] ASoC: Intel: Add DMI quirk table to
 soc_intel_is_byt_cr()
Message-ID: <20210204135616.GL2789116@dell>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <20210120214957.140232-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210120214957.140232-5-hdegoede@redhat.com>
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

> Some Bay Trail systems:
> 1. Use a non CR version of the Bay Trail SoC
> 2. Contain at least 6 interrupt resources so that the
>    platform_get_resource(pdev, IORESOURCE_IRQ, 5) check to workaround
>    non CR systems which list their IPC IRQ at index 0 despite being
>    non CR does not work
> 3. Despite 1. and 2. still have their IPC IRQ at index 0 rather then 5
> 
> Add a DMI quirk table to check for the few known models with this issue,
> so that the right IPC IRQ index is used on these systems.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  sound/soc/intel/common/soc-intel-quirks.h | 25 +++++++++++++++++++++++
>  1 file changed, 25 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
