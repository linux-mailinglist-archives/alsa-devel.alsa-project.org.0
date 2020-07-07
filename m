Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B05216AF4
	for <lists+alsa-devel@lfdr.de>; Tue,  7 Jul 2020 13:01:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9422D1685;
	Tue,  7 Jul 2020 13:01:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9422D1685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594119717;
	bh=SPhgPQejzR/07fcEolAXk+aK9D/qqSFwLNJIywwhpVI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QfbdbHy5TI0uCyaOQvMfOFv66MKXulP9iJCRz8kcK0sT7CnBV0y3bP8WD4l7drrKu
	 dUM3pTUsIo8pydEfdTSUj0oPc5/rqGtVNSMCIenlu72w0Y3+7UHXfznoZ3N1nvkh2W
	 SF0wSnaLKZVBcU0FW1aSthocOWFE5ryKtnYZO9A8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 91314F80216;
	Tue,  7 Jul 2020 13:00:46 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4C768F8025A; Tue,  7 Jul 2020 13:00:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_SOFTFAIL,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7035EF801F9
 for <alsa-devel@alsa-project.org>; Tue,  7 Jul 2020 13:00:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7035EF801F9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nifty.com header.i=@nifty.com
 header.b="QhMl2uhf"
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 067B0MAN022858
 for <alsa-devel@alsa-project.org>; Tue, 7 Jul 2020 20:00:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 067B0MAN022858
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1594119623;
 bh=4yu2n3n5C/fRjnuTP126S3/fQ4gXKW38TCxG+vu9Yfo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=QhMl2uhfl8jVzfqfeZAGj4XD2OPl5Z51Y3YdlFy2LpD7O6dm6hk3OPB+nQZhEF2S/
 M4qrJd42cOhz3lhbpQxCeliFSRXJTGQhbi+XbjbC6T9d02Yv/XTkQI01H5hNmAwAxC
 6tFLHux7puahnHIhq42mGspsB1RAtrwEJmJ9ThFdfGNHqOX/WT0jGrxKqxrab86hOp
 NNddFl4hv1tktjJM1sXQK//sNUo5KF4aLF+d7tJzGXppRmc6rWTannpejWzalJWbEN
 9WzY/XmlJI/bcYnDsL4J3Yx9UHY7xYF6A45BhwtuCEEkr6iQLDAryAuwijan0sGwB1
 JbnTxU38gSmHw==
X-Nifty-SrcIP: [209.85.222.44]
Received: by mail-ua1-f44.google.com with SMTP id j21so1199391ual.11
 for <alsa-devel@alsa-project.org>; Tue, 07 Jul 2020 04:00:22 -0700 (PDT)
X-Gm-Message-State: AOAM533hb6sfmhOhlBAb8DrHbjhXaiO0iR0iJsnm6Kjq5dxWvd4oOw4Q
 1t2amCc+1qmZsP3ynRTtt46d5NqU5g+qOTiFrO0=
X-Google-Smtp-Source: ABdhPJymeeoDYkbNlY6GxjialEfi35FAedJEi2UP4hQmNNDZE11PD/TRgqjDOK419vOntfEQFPdcUsPXFEPdhUoJYxQ=
X-Received: by 2002:ab0:5b91:: with SMTP id y17mr38993416uae.95.1594119621316; 
 Tue, 07 Jul 2020 04:00:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200707101642.1747944-1-lee.jones@linaro.org>
 <20200707101642.1747944-18-lee.jones@linaro.org>
In-Reply-To: <20200707101642.1747944-18-lee.jones@linaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 7 Jul 2020 19:59:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQynE+HJDf=qGkw9qxTeHd81DZmiM2iXhODkWHNd9qXig@mail.gmail.com>
Message-ID: <CAK7LNAQynE+HJDf=qGkw9qxTeHd81DZmiM2iXhODkWHNd9qXig@mail.gmail.com>
Subject: Re: [PATCH 17/28] ASoC: uniphier: aio-core: Fix incorrectly named
 struct property and remove another
To: Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Tue, Jul 7, 2020 at 7:18 PM Lee Jones <lee.jones@linaro.org> wrote:
>
> Both issues are likely due to bitrot.  Let's bring them up-to-date.
>
> Fixes the following W=1 kernel build warning(s):
>
>  sound/soc/uniphier/aio-core.c:107: warning: Function parameter or member 'pll_id' not described in 'aio_chip_set_pll'
>  sound/soc/uniphier/aio-core.c:107: warning: Excess function parameter 'source' description in 'aio_chip_set_pll'
>  sound/soc/uniphier/aio-core.c:279: warning: Excess function parameter 'ch' description in 'aio_port_set_ch'
>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>

Reviewed-by: Masahiro Yamada <yamada.masahiro@socionext.com>

but Pierre-Louis Bossart had already sent an equivalent patch.



> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  sound/soc/uniphier/aio-core.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/uniphier/aio-core.c b/sound/soc/uniphier/aio-core.c
> index 9bcba06ba52ea..86eb0915d80ad 100644
> --- a/sound/soc/uniphier/aio-core.c
> +++ b/sound/soc/uniphier/aio-core.c
> @@ -93,9 +93,9 @@ void aio_iecout_set_enable(struct uniphier_aio_chip *chip, bool enable)
>
>  /**
>   * aio_chip_set_pll - set frequency to audio PLL
> - * @chip  : the AIO chip pointer
> - * @source: PLL
> - * @freq  : frequency in Hz, 0 is ignored
> + * @chip:      the AIO chip pointer
> + * @pll_id:    PLL
> + * @freq:      frequency in Hz, 0 is ignored
>   *
>   * Sets frequency of audio PLL. This function can be called anytime,
>   * but it takes time till PLL is locked.
> @@ -267,7 +267,6 @@ void aio_port_reset(struct uniphier_aio_sub *sub)
>  /**
>   * aio_port_set_ch - set channels of LPCM
>   * @sub: the AIO substream pointer, PCM substream only
> - * @ch : count of channels
>   *
>   * Set suitable slot selecting to input/output port block of AIO.
>   *
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
