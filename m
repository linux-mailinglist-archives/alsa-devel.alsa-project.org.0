Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B14130F41A
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 14:45:57 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2F56C16E2;
	Thu,  4 Feb 2021 14:45:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2F56C16E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612446357;
	bh=nJLlJzHOENushJifLgfNJhg8MXOLYc1+wPV2qLgjZEk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NXZ8iVrDw864JbQj+0/RfDXZTaXZym191idsDA3xqqW8RK4enRys4SQxYKWd0KOdv
	 aa6mywyjYRw7OsGkZPJ4Q7FWDaFAmrfvKaBWq+qxXpG573rBn+7KDltSVVuMB+b2Gm
	 ztTP8dQTTvpkSwenCxlIs4T7pyumgBgDiHgORkkk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7DA83F80139;
	Thu,  4 Feb 2021 14:44:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2ED1DF80171; Thu,  4 Feb 2021 14:44:23 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09DB5F80139
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 14:44:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09DB5F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="pLL+20zr"
Received: by mail-wm1-x335.google.com with SMTP id j21so324626wmj.0
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 05:44:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lRYvK8OMCHMkGJ2UxDzBQw4RlWR868ddrnX7Z1FGiaE=;
 b=pLL+20zrB9hl28++h/IR1o2YCSmZmIf5uu53yfbCqmTn/GZq1rYk3NXwhAgyCeDGMz
 R409AufnzRdZR4WCxmB2ee4unGmyIRglDmFztvuGFFiIFt2L3P3F7dOqMkaPRyaUSqab
 Pkw4P1nrlPS7PZsfftUX+MDdPClggErzmSBDWJEtKONddf2Q6uTi1KUC7T3jGFyJZxwF
 Ekm84/ShbsXU9wiR6mhxBnMQJSKkLvzNtOvYfwUbh2KUN0fmGkF1g0hLalY6g9UPZA6B
 U3elBRmhyNZQG3jsNj2V4E4I6Pf+AWCXfsxYQhbq9UFfLfhDoPV3WoV9J649PZa5Wdkc
 Et+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lRYvK8OMCHMkGJ2UxDzBQw4RlWR868ddrnX7Z1FGiaE=;
 b=eZAgXon+Mag7yzBAsPWEnw/aY7jTjl58JAhFkXoqDoYLYRGcdtLzqLSDoYtFHEOCQC
 iC06lOLPrQJ8UZMwgjkFz0+AtqudJZhlC9+uA9rGu0yJZgU2zlZI23UNyPrbxXBI9vg0
 nWVQwaFQifmENGypQ9WHus85nZQ/AcpSXf009Eq2jiILtlsJle1Wd91eiGQF+Xo3r5CL
 XpR8+0d3BF0xNGOd3EC/j8WcOWMXanDODpNrUSnT+lGK1YhC5aRO5yY7ERnaEGcuihTd
 focwJEmZeSTBR9jaJImNWH1i59RjEGJRO+wDrkD1M4bvTiiewRIblxfrBWlDns/YNb5s
 BzyA==
X-Gm-Message-State: AOAM531NrmaejaxLtFpI7UXxEmtz2BEFtBUf9z4cDO0vfwpqZoCq+93t
 p7SwlS60qGPwpSHYBkOBrU9cGg==
X-Google-Smtp-Source: ABdhPJwV2CZpAqZ/stq0i/AuZHm4dX3DgAU4MuOT1GRlwq81uLSdldL7Plrh4nNTmdTSYpm7nIg+uA==
X-Received: by 2002:a1c:46c5:: with SMTP id t188mr7500875wma.170.1612446254671; 
 Thu, 04 Feb 2021 05:44:14 -0800 (PST)
Received: from dell ([91.110.221.188])
 by smtp.gmail.com with ESMTPSA id f7sm7580855wre.78.2021.02.04.05.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 05:44:14 -0800 (PST)
Date: Thu, 4 Feb 2021 13:44:12 +0000
From: Lee Jones <lee.jones@linaro.org>
To: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v4 resend 01/13] mfd: arizona: Drop arizona-extcon cells
Message-ID: <20210204134412.GG2789116@dell>
References: <20210204112502.88362-1-hdegoede@redhat.com>
 <20210204112502.88362-2-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210204112502.88362-2-hdegoede@redhat.com>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Mark Brown <broonie@kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>
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

On Thu, 04 Feb 2021, Hans de Goede wrote:

> The arizona jack-dection handling is being reworked so that the
> codec-child-device drivers directly handle jack-detect themselves,
> so it is no longer necessary to instantiate "arizona-extcon"
> child-devices.
> 
> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Tested-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/mfd/arizona-core.c | 20 --------------------
>  1 file changed, 20 deletions(-)

For my own reference (apply this as-is to your sign-off block):

  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
