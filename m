Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7938217FBA
	for <lists+alsa-devel@lfdr.de>; Wed,  8 Jul 2020 08:40:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5FD4B1660;
	Wed,  8 Jul 2020 08:40:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5FD4B1660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594190458;
	bh=qYK4fP8FXabkEY6FQNptFQq7J3EDEgokISDCSqMlyYA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kC0jcqY7uqDns/RDpzrrHBDwsG6SQjx4TMNV0FQY6C9seVFYDgrNCDp/FVaEkvZgY
	 xoS+RYBzsFqBzyzM57O+/RI3Sa4XVvcGlYXGClRErCTQf/cM5EFoGzIqELt1XU1AxC
	 9Y5uEvwuQRVWATN3K2uKuFNeipqBbQnaQovyl310=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A5E7F8015C;
	Wed,  8 Jul 2020 08:39:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 58838F800AE; Wed,  8 Jul 2020 08:39:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48D90F800AE
 for <alsa-devel@alsa-project.org>; Wed,  8 Jul 2020 08:39:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48D90F800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="BYyse/g5"
Received: by mail-wr1-x442.google.com with SMTP id j4so45197680wrp.10
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 23:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=DM8bMgHCqOlGPCjkiDDlA27DKTmodREN5EN2LPmOUhQ=;
 b=BYyse/g5REL3x1rwFZYs1DfnpBcpEQ2fWyyvmpc29kXrcEAcID1If2ljWWHV6bmbVZ
 dC5E6Ipj6vEMeK3ei6fmhrPvKgAIWn9VE7TT7iQsQtFrE/AmkyA1jql1A2qGICiK86Sr
 8bmLmXeDxjC1nrJoosRBho9U/3xugehMAXtYCQ7Nljr/lAQJMwzAkBjvfNzAtQDJxy22
 KSARJ1m2WzNUM2eLtHXw4XrvpIjMkYkfpFcK0/b0TM6U08MifLWb9fofLQtLL9te2XxK
 WHkF3s4oSb0waxNzTKo+4Di+lEfZ5qvj0Q1Jyftzl3bAKl9DZMMa8LScUkTnRHHDK5J8
 lLpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DM8bMgHCqOlGPCjkiDDlA27DKTmodREN5EN2LPmOUhQ=;
 b=JPhuV+Qc7+ZXBR6bfeDYh/ebPV9WWla74MLTkFiou8L8iDKPflLn+GSCRN/oJELaLv
 gM1ItbVyViT8A8T+x6Kkfa6La1MPQgGT03ViWZKaN5exypfo+srUiAeAMrHcpdGZtOFs
 P0gjmdc6a8iDeJcudurUv+V+kfMZOImTg0/P6gOg7NcArwnjtNxDo6UKZzcnEwJAbmfU
 Yek976sVyn9It6ZxjzaNlsQvEEU3HgFb/yEj1SploiKQXGVBNdnWesXQnZMhMC+rG3EK
 dCwiO6FI85zJPLjlOtxFvrO8zBtBcK4OzXal/KEEQRON+F4Cp4dB1/bWS2V32nHMBU1e
 rPZg==
X-Gm-Message-State: AOAM532JewDp3I2s8tHSn6syleTYx1YffkGlu/OPFw6T8zb+oEUMBICu
 THOOhndS63e9HKdxRRluelJ5vA==
X-Google-Smtp-Source: ABdhPJyNXF+hsh42cbFNddNeUsL5c3lyPEbGPOYiI1yHP/QDQEpo70W5hg63NeQUdhxtE4v9yw37Ug==
X-Received: by 2002:a5d:60c7:: with SMTP id x7mr53301104wrt.138.1594190342389; 
 Tue, 07 Jul 2020 23:39:02 -0700 (PDT)
Received: from dell ([2.27.35.206])
 by smtp.gmail.com with ESMTPSA id j15sm4188880wrx.69.2020.07.07.23.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 23:39:01 -0700 (PDT)
Date: Wed, 8 Jul 2020 07:39:00 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v3 00/10] ASoC: =?utf-8?Q?Clean?=
 =?utf-8?Q?-up_W=3D1_build_warnings=E2=80=8B?= - part2
Message-ID: <20200708063900.GJ3500@dell>
References: <20200707191615.98296-1-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200707191615.98296-1-pierre-louis.bossart@linux.intel.com>
Cc: tiwai@suse.de, alsa-devel@alsa-project.org, broonie@kernel.org
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

On Tue, 07 Jul 2020, Pierre-Louis Bossart wrote:

> Both Lee Jones and I submitted separate series, this is the second
> part of the merged result, for which no feedback was provided.
> 
> I picked Lee's patches for rt5659 and ak4458 and added the pxa and
> ux500 that I didn't fix. The rest is largely identical between our
> respective series, with the exception of the sunxi which I documented
> and Lee removed. I don't have any specific preference and will go with
> the flow on this.
> 
> Lee Jones (4):
>   ASoC: pxa: pxa-ssp: Demote seemingly unintentional kerneldoc header
>   ASoC: ux500: ux500_msp_i2s: Remove unused variables 'reg_val_DR' and
>     'reg_val_TSTDR'
>   ASoC: codecs: rt5659: Remove many unused const variables
>   ASoC: codecs: ak4458: Remove set but never checked variable 'ret'
> 
> Pierre-Louis Bossart (6):
>   ASoC: qcom: q6asm: fix kernel-doc
>   ASoC: sunxi: sun4i-i2s: fix kernel-doc
>   ASoC: sunxi: sun4i-spdif: fix kernel-doc
>   ASoC: codecs: rt5631: fix kernel-doc
>   ASoC: codecs: tlv320aic26: fix kernel-doc warning

Would you mind elaborating on "fix kernel-doc".  Some tooling relies
on the fact that subject lines are, at least for the most part, pretty
unique, and if we have to fix another kerneldoc issue in the future
with the same thirst for simpleness, I'm afraid there might be
clashes.

Take a look at my patches, if you require inspiration.

>   ASoC: sti: uniperif: fix 'defined by not used' warning
> 
>  sound/soc/codecs/ak4458.c       |  6 +++---
>  sound/soc/codecs/rt5631.c       |  8 +++++--
>  sound/soc/codecs/rt5659.c       | 37 ---------------------------------
>  sound/soc/codecs/tlv320aic26.c  |  2 +-
>  sound/soc/pxa/pxa-ssp.c         |  2 +-
>  sound/soc/qcom/qdsp6/q6asm.c    |  2 +-
>  sound/soc/sti/uniperif.h        |  2 +-
>  sound/soc/sunxi/sun4i-i2s.c     | 10 ++++++++-
>  sound/soc/sunxi/sun4i-spdif.c   |  2 +-
>  sound/soc/ux500/ux500_msp_i2s.c |  8 +++----
>  10 files changed, 27 insertions(+), 52 deletions(-)
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
