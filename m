Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DE230F454
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 14:57:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9DA9D1715;
	Thu,  4 Feb 2021 14:56:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9DA9D1715
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612447028;
	bh=Mni2cD/zwfmwYm+ILfIfmROIbpS56ZuBHnWjWaNelfc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=lwLT0zcjJSay/gLaQXDmPJmtKXfD+Ns+45r5bl7J32dotB0lHXQ7GAkhB7sHmMk4O
	 uv7edsLRPOa4vlaJ61pNOAIf67hJ9CLp3IJi9jwI+TblVzrdXQAXgHzJfg+d/a+Bt6
	 TMEyMT46W1OeIt/3Qt5qW5LXUOc4AuBWsyyQs1FQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2E061F8023E;
	Thu,  4 Feb 2021 14:55:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 86A80F8023C; Thu,  4 Feb 2021 14:55:32 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 57EC8F80155
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 14:55:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57EC8F80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="m7Ec2oye"
Received: by mail-wm1-x333.google.com with SMTP id m1so3071079wml.2
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 05:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=+zWXPoMWro9z8YmAH2sD5hl0vnIUc9rVzm7BOffQpxc=;
 b=m7Ec2oyeRYSUEI0DX38UiaNVijd0iI1QiTiChQCQm5Xvcwptz40gsINlaEFJi+0RWp
 0Quw5xqzhOJ7ifiayJlOJWMmHIaL3Q0jwjXl/VvvCPrZeEDEObSiUgMBcQjnmVW0wWrN
 Ub07GT5giot2k5sR9hxkYjycUjCNi0+rV4dUQm1rJJ2iVRiejiapEAPkcAnJ3S2ZFMxi
 uLBkNbq79CWniMwmOjryIutYK79xFxIRIVwlcvUEhvGEbb35yOnFvIhhaswc4g/m7cjx
 CLON7I3WIXU7Qy2thvi7X+mPKgkNSGAKuUYYyrNFjyKcRSFyrDOirMRi+izqaUMuPmec
 FpPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=+zWXPoMWro9z8YmAH2sD5hl0vnIUc9rVzm7BOffQpxc=;
 b=BxYyX3TkzrDJZOQBPoCgkAvuHvJaq3rMLGNdSQQkbABIfqtUH3K51GAGQXvVMrqSl+
 99YLPP3xBRZkK89L00019ahUDtX6EIjngE6Tr6TG5In3JRQl61CSM4OrMgPfXkSmyEZ4
 gtpcdqhfbiUv90zKTAe27j2Y9u68cRuz8pHwshXQgafXIsCwmctTp9KGBgbU7u/e2FGi
 GqY2tdo8NLzjbPOrkSnfZo3ENaqNVz1nAKumX4RZzxQCVO2iDlNvocLieLSPk3B3w0A6
 CgMgwACvuMEpbo9xzb2R3Qpe8aspAQpPyDWtPyuSAhQW0rJn6h5glzuGKCZQ6jiPYzvt
 IWig==
X-Gm-Message-State: AOAM530eSkf5ckLNtUKF8QXLQCeNt3A1X4zN1VvUgfTpI7zJCBMTT5nG
 ToBV2e6aOxRa3tcc0ltV2OGlCw==
X-Google-Smtp-Source: ABdhPJzcQL5JyoVR8CeS1RAcBqswo1ZPxXP5b1mnWO7335qavWdyOdHHkdriZYbHAmaSLHb6abh7PA==
X-Received: by 2002:a1c:9c01:: with SMTP id f1mr7325353wme.159.1612446927456; 
 Thu, 04 Feb 2021 05:55:27 -0800 (PST)
Received: from dell ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id 13sm5464521wmj.11.2021.02.04.05.55.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 05:55:26 -0800 (PST)
Date: Thu, 4 Feb 2021 13:55:25 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 1/5] mfd: arizona: Add MODULE_SOFTDEP("pre:
 arizona_ldo1")
Message-ID: <20210204135525.GJ2789116@dell>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <20210120214957.140232-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210120214957.140232-2-hdegoede@redhat.com>
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

> The (shared) probing code of the arizona-i2c and arizona-spi modules
> takes the following steps during init:
> 
> 1. Call mfd_add_devices() for a set of early child-devices, this
> includes the arizona_ldo1 device which provides one of the
> core-regulators.
> 
> 2. Bulk enable the core-regulators.
> 
> 3. Read the device id.
> 
> 4. Call mfd_add_devices() for the other child-devices.
> 
> This sequence depends on 1. leading to not only the child-device
> being created, but also the driver for the child-device binding
> to it and registering its regulator.
> 
> This requires the arizona_ldo1 driver to be loaded before the
> shared probing code runs. Add a softdep for this to both modules to
> ensure that this requirement is met.
> 
> Note this mirrors the existing MODULE_SOFTDEP("pre: wm8994_regulator")
> in the wm8994 code, which has a similar init sequence.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/mfd/arizona-i2c.c | 1 +
>  drivers/mfd/arizona-spi.c | 1 +
>  2 files changed, 2 insertions(+)

Applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
