Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 963E24C6C2F
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Feb 2022 13:23:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 110AD16E1;
	Mon, 28 Feb 2022 13:22:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 110AD16E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646051014;
	bh=4C2xk5cy9uG01hs3x2Lxl6I8Id0Ah2zG4USoYRIzsV0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hAXLxNSMHLB5WU3dDdUsQs/NZbm5US/P5z+GzdC5dIuf8DtIk6XGYufOHUGWYerr1
	 MtWr4xJkaLUzFzoX2vL+cbpM6j9kIMKAimcOUruVM7JTWkH5U9bhtiX+dYD77sDeGM
	 XR4ji+veUPPRtZtovms2fCvbPUl51AIrtIIbP738=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6215AF80154;
	Mon, 28 Feb 2022 13:22:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A950F8013C; Mon, 28 Feb 2022 13:22:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F40A1F80125
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 13:22:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F40A1F80125
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="QOupENML"
Received: by mail-lf1-x130.google.com with SMTP id u20so21055176lff.2
 for <alsa-devel@alsa-project.org>; Mon, 28 Feb 2022 04:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=sie3nNf/jAApb40IchGRZ6L1UYTkWWr1vGxtznRXmaA=;
 b=QOupENMLKE12JJ6SrDhp+3zRRWOGfyFs8jmnesNAY0oFkUEP6uQYmmGnqk3xdAkzIl
 iT95UYWxl+bOLAIAhLbx4LmY6JmK1ZmfX/GCQZL1RrdfYnH9USfkFjjW77AiS+lQ2ZPe
 NFvZnqRBsGHswtqvj9mb1QLxcreYSVY/834hNMvX4XcfuMoghbpO5jf16xsKZfucfGGx
 wyDC7an5K9g3wQ3FzD3dBEsuc2gZcXKFeoBdEu+WQ1lJNPjLAs32YKf1eMi4ifw11ZLt
 QGa+Egssdb2dKPUoG/Q6O/yemUZQYkS5gt6+O2JA482nPUCe6AFMNxlbVY35pNUVY34a
 UNQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sie3nNf/jAApb40IchGRZ6L1UYTkWWr1vGxtznRXmaA=;
 b=jGY3nGHZJo+HKdksB7CBVt1V60XPtGjxs7ghIKPDYlp4Vo4mxl+eyUKUl4fsO7gZwv
 oirbvMC0BKGuf17/aIuTAbQwqkvQVoMt3RUWvms73EXaT11PYGUaq1NWVjsEZsOSX35F
 3Sfzh3N5wUQpIHtskKi+nz5W3wGq6sPKo26Pjq+Ce9dMthp8rTxijkNLp1fpyEdTjYHL
 7rgnAWGPapGN9VbpMJk0FOnJ5oPYfRRVetfrzaLgogkeCO547OHQhyFrJ2ywUpk3AJpp
 uSNAOFZoekZYq0FzC21JQkHbXfCIXX0hT//FNguT43Jl8z+cI0TmL9cb4Wqn+Go3Mw0+
 D+DA==
X-Gm-Message-State: AOAM533xBQlR/BYshemBnjt5fCJD1YeBzVjsyaYYhP4Sip8qFHgmiuuF
 zbS9NvaHuRJql0AVQ0l9erQ=
X-Google-Smtp-Source: ABdhPJxU3+UEQkwdqCCuUL0OX96/fpIfXlAia4iYFYpUDN08kH2p6RfQV9QvsKFKegmVTskN1On91A==
X-Received: by 2002:ac2:4ac3:0:b0:43f:36e0:5fec with SMTP id
 m3-20020ac24ac3000000b0043f36e05fecmr12440588lfp.10.1646050940512; 
 Mon, 28 Feb 2022 04:22:20 -0800 (PST)
Received: from [10.0.0.127] (91-159-150-230.elisa-laajakaista.fi.
 [91.159.150.230]) by smtp.gmail.com with ESMTPSA id
 n23-20020a19ef17000000b00443ac96e968sm935084lfh.84.2022.02.28.04.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:22:19 -0800 (PST)
Message-ID: <a6dd46f5-c0e7-4972-c45d-d45a87d613c5@gmail.com>
Date: Mon, 28 Feb 2022 14:23:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] ASoC: twl4030: Use modern ASoC DAI format terminology
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
References: <20220223003046.1697784-1-broonie@kernel.org>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
In-Reply-To: <20220223003046.1697784-1-broonie@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org
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



On 23/02/2022 02:30, Mark Brown wrote:
> As part of moving to remove the old style defines for the bus clocks update
> the twl4030 driver to use more modern terminology for clocking.

Thanks Mark!

Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

> 
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  sound/soc/codecs/twl4030.c | 12 +++++-------
>  1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/twl4030.c b/sound/soc/codecs/twl4030.c
> index e059711ff293..0ba3546ef870 100644
> --- a/sound/soc/codecs/twl4030.c
> +++ b/sound/soc/codecs/twl4030.c
> @@ -1840,13 +1840,12 @@ static int twl4030_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
>  	old_format = twl4030_read(component, TWL4030_REG_AUDIO_IF);
>  	format = old_format;
>  
> -	/* set master/slave audio interface */
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_CBP_CFP:
>  		format &= ~(TWL4030_AIF_SLAVE_EN);
>  		format &= ~(TWL4030_CLK256FS_EN);
>  		break;
> -	case SND_SOC_DAIFMT_CBS_CFS:
> +	case SND_SOC_DAIFMT_CBC_CFC:
>  		format |= TWL4030_AIF_SLAVE_EN;
>  		format |= TWL4030_CLK256FS_EN;
>  		break;
> @@ -2038,9 +2037,8 @@ static int twl4030_voice_set_dai_fmt(struct snd_soc_dai *codec_dai,
>  	old_format = twl4030_read(component, TWL4030_REG_VOICE_IF);
>  	format = old_format;
>  
> -	/* set master/slave audio interface */
> -	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
> -	case SND_SOC_DAIFMT_CBM_CFM:
> +	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
> +	case SND_SOC_DAIFMT_CBP_CFP:
>  		format &= ~(TWL4030_VIF_SLAVE_EN);
>  		break;
>  	case SND_SOC_DAIFMT_CBS_CFS:

-- 
Péter
