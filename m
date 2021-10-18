Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7893143213B
	for <lists+alsa-devel@lfdr.de>; Mon, 18 Oct 2021 17:00:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3AF7717C4;
	Mon, 18 Oct 2021 16:59:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3AF7717C4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634569218;
	bh=E7zzuqmhVkMmpTYSxiut22QGDprMbIMhCmwf7BVaWT4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dKbjZ3yH7y6BWW0gLQ2eC47d6oPAsjGmqZwzitg+8lYG/zHJZgasCrqIkhapLrUvH
	 XcH9IbkAypms+Q6QEtidJqtdsHu1dP0rae56gcCWBfb1g9PS2DxJNYwhpb2bBt5h4J
	 7huWT+idUVpLTbboaCjJnNQqmK4taBXoXbdT3ubg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC584F80253;
	Mon, 18 Oct 2021 16:59:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BE226F80253; Mon, 18 Oct 2021 16:59:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7DB95F80111
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 16:59:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7DB95F80111
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="NAE1RUyw"
Received: by mail-ed1-x536.google.com with SMTP id r18so262022edv.12
 for <alsa-devel@alsa-project.org>; Mon, 18 Oct 2021 07:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WehYX/BfdiEXKhaGvq/GoMSkv9C2ieI8FUBxkA42jGQ=;
 b=NAE1RUywfmSkyXk6xtlYeiVgQ3YmaOBs0NIxWLDU3LRdD+1AxGfVlacU9nwVREfJe5
 nOItl2mjVJPwbBoK4En52WbyBFQZLFiswQ8xr9n/T7U5644bUi74aB0C1Yp9+Nn7EEv+
 Q/IRUQqWZOXXr1KfU9y4ow5HG5UQCzRBJn/1MDOzQjCcvPCsR/fYklXb+WmfgKC7ZNYv
 mB8zH2HbaU+ajMx+YNFNe6OHKby8ES7fGwDbtiJH64595uT+gCNzltI8Sm6jT1RgmKQg
 yNIeKPt3ZOCAbgNrtK3HjuphOroi0U0opViW2k7iHmu3VJmPbbnEyldwELIHZkUCtVVf
 RVvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WehYX/BfdiEXKhaGvq/GoMSkv9C2ieI8FUBxkA42jGQ=;
 b=Nzwq3cMwhlT2EPMYOh+m0PoQ6R+iTFDHtbzhru1Ba1WSR14PdHP6Rg2E7YjiMgY37I
 LLN4Pl1YVSYj6+Sd/Pse10Qw2L48PexpVEOV5M7TPtmNH5kkjqJDBSpajPj0g8DDVSr2
 JVASv70VuYQbNTyMILOZVuRk4lQNZX5IZUe85t3BCWyQGFcStdKgJcZ2tVcMqWroQZ0q
 FSdaZDrEuHYHjNkn5HGCJKXqJDTjcXWguX30Jqm8TltG08wkZ92ZPuTnIoKke5fdgZw0
 rVTvHDr3lCsJuYnMSTN9pTOaZ3a1MpHdxIf3uB5iuFEOjpxAf6vDCGgteHCHVezM/o9L
 qUHQ==
X-Gm-Message-State: AOAM530zXfaPgYt0uVYWw6FnvW3aiWqlDiLt+BXbG/L/MrxHOiI8qMHb
 0huz3Kti5jl/lQsvXeMWYtz3QuHlHlW1j7J/LX8=
X-Google-Smtp-Source: ABdhPJw7yRU3C27ninbZ6RYvsA4b+bUz9SKwE96wmHwYQ0r+IM9z4rvD5eWXVEmmLh9ZmczfrPAjwmY8KqtNY5q05uY=
X-Received: by 2002:a17:906:2887:: with SMTP id
 o7mr29518989ejd.425.1634569151170; 
 Mon, 18 Oct 2021 07:59:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211018143324.296961-1-hdegoede@redhat.com>
In-Reply-To: <20211018143324.296961-1-hdegoede@redhat.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 18 Oct 2021 17:58:19 +0300
Message-ID: <CAHp75VePYGsioootWjSEC=VXu8tz3+tv510Otju-O=ugCX+h=Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] ASoC/pdx86/input: Introduce and use soc_intel_is_*()
 helpers
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Gross <markgross@kernel.org>,
 Mark Brown <broonie@kernel.org>, linux-input <linux-input@vger.kernel.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Andy Shevchenko <andy@infradead.org>
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

On Mon, Oct 18, 2021 at 5:33 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi All,
>
> We have been open-coding x86_match_cpu() checks for enabling some
> SoC specific behavior in various places.
>
> The sound/soc/intel drivers used to also open-code this but this was
> cleaned up a while ago introducing a number of soc_intel_is_*() helpers.
>
> This series moves the definition of these helpers to a more public place
> and uses it in a couple of more places outside the sound tree.
>
> Mark, I know we are a bit late in the cycle, but if you can pick up
> patch 1/3 (assuming on one objects) for 5.16, then the rest can be

I suppose s/on one/no-one/ :-)

> applied after 5.16-rc1 is out.

What I like about this series is dropping ugly ifdeffery here and
there and consolidating it in one place.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

P.S. Btw, since you are the maintainer of PDx86 it means either you or
Mark (whoever gives an Ack to the other one) can take at least two
patches that makes visible that the change is not just for a single
user.

> Hans de Goede (3):
>   ASoC: Intel: Move soc_intel_is_foo() helpers to a generic header
>   platform/x86: intel_int0002_vgpio: Use the new soc_intel_is_byt/cht
>     helpers
>   Input: axp20x-pek - Use new soc_intel_is_cht() helper
>
>  drivers/input/misc/axp20x-pek.c            | 26 ++-------
>  drivers/platform/x86/intel/int0002_vgpio.c | 14 +----
>  include/linux/platform_data/x86/soc.h      | 65 ++++++++++++++++++++++
>  sound/soc/intel/common/soc-intel-quirks.h  | 51 +----------------
>  4 files changed, 75 insertions(+), 81 deletions(-)
>  create mode 100644 include/linux/platform_data/x86/soc.h
>
> --
> 2.31.1
>


-- 
With Best Regards,
Andy Shevchenko
