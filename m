Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BEE5FAC16
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 08:04:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1222336AE;
	Tue, 11 Oct 2022 08:03:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1222336AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665468270;
	bh=DdQzqcAUN/d2vHacg64tJ/6p8M71K0jId1YwpCa89D0=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mK03YKSdv7eZgPyHgz9/2qdSyzBX3e2nnFbQ81WlOs+OgYRkHu6yMoNi/bSHezrQE
	 wkj8ieHyOuw41JIakDY8l0gHAlNZcRUyKIvTWaF7z20T+kQXv39tnNbVGPxXWhY7Oj
	 i8JezyltcYB5NB1iBb4J2q0/aqKrHSxuqUfjdSm8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBA87F80552;
	Tue, 11 Oct 2022 08:02:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D2FBF80310; Sun,  9 Oct 2022 02:49:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9281DF8012B
 for <alsa-devel@alsa-project.org>; Sun,  9 Oct 2022 02:48:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9281DF8012B
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="FnUB16h8"
Received: by mail-il1-x12e.google.com with SMTP id i9so4198216ilv.9
 for <alsa-devel@alsa-project.org>; Sat, 08 Oct 2022 17:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P5HaFroFXHgbxThoT0RIR6rsbRVYC8ZGOScKtFyRa64=;
 b=FnUB16h8kIXSKk8rS8AZG3S1iJ1AU1VMvwgRkl5zRkeyT+qG6TW9bpQDZ0bqlWLK54
 KKZvD9wPHUExyUaVu4rj7wRNyIjW/U2Qywofk7FIDZlbNrA0aHGMX6nrLnom08JS1geJ
 1wHiW9QVTYZSNCxr2bvPlDc0Lbib/s1sjqY1d5/7lopTTQu5cLaIbAu6TD90l9OQy/KD
 4pRMoyHNjywJaUamq91j6Bzzgh04fXOCcR1Yqy2J4kov055d8QcazOs+ipUNwFetbutJ
 yo6MVQ4Ed2AonUgIIIQFuSx0Ad8uJ10B8RFLzE+nCuDPe4JOTY19rYIHTpH+me3ghe0D
 t2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P5HaFroFXHgbxThoT0RIR6rsbRVYC8ZGOScKtFyRa64=;
 b=a29FxquTpZkZNkLRgwSdKJrnPt2GbZR4+2Fcorb4munzJTWVpFFBSkpO3C2Hq3VMDX
 j0CvzLFGKiGId+3pcKzHmY6iytmbQX1qOau80sA55tDuLGZx0yHAcQwUUGu9kf6/Lyhj
 s3Q1j8cVfK6gtpfNlDG6T6C7FjHPVTd3yKLiOxtJ6dKGPtkkXrFex8AQJ5UVzjAvR+Tv
 I4JYXfkaS4hkI4f8E10UzDFt8HuRNagFbtMqofFyGbAH9QWNakx4A+rPIOw1METmgiPD
 kXMtL/IwMHiesMbCyAQtWlauYWmeKesWNXF1H4pJXLniscGPa8TCF3tGU3TQ3Dq9E3C5
 TGlg==
X-Gm-Message-State: ACrzQf0hRqWVgSggG67LugOHKT0kcqUxtZyUu9SJepIB7CRL4A/tvECH
 MbgjTfPKR2NxywRQUfhAUKY=
X-Google-Smtp-Source: AMsMyM7qM3gqM9HPQdOkSys+xwBl/2X+WibEuPYH38zUCJH+qBIXkC5OkQVZc5p0Wn6UqZN2D2DOKQ==
X-Received: by 2002:a05:6e02:1bc7:b0:2fa:876e:95a7 with SMTP id
 x7-20020a056e021bc700b002fa876e95a7mr5798035ilv.240.1665276533543; 
 Sat, 08 Oct 2022 17:48:53 -0700 (PDT)
Received: from ?IPV6:2604:2d80:4d87:cd00:9f51:32d7:1177:67d?
 ([2604:2d80:4d87:cd00:9f51:32d7:1177:67d])
 by smtp.gmail.com with ESMTPSA id
 t22-20020a026416000000b00349c45fd3a8sm2546894jac.29.2022.10.08.17.48.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 08 Oct 2022 17:48:53 -0700 (PDT)
Message-ID: <36657a31-2d34-e5eb-f7c4-ffcf86481c9d@gmail.com>
Date: Sat, 8 Oct 2022 19:48:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2] sound: soc: codecs: wcd-mbhc-v2: expose ALSA control
 for jack
Content-Language: en-US
To: Dylan Van Assche <me@dylanvanassche.be>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org
References: <20221007155716.10594-1-me@dylanvanassche.be>
From: Joel Selvaraj <joelselvaraj.oss@gmail.com>
In-Reply-To: <20221007155716.10594-1-me@dylanvanassche.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 11 Oct 2022 08:02:21 +0200
Cc: linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
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

Can confirm that this is required for Pulseaudio to pick up the
headphones properly. I tested this in my Xiaomi Poco F1 running
postmarketOS (Phosh Mobile Desktop Environment). You can check the
following pulseaudio issue for some more info.

Link: https://gitlab.freedesktop.org/pulseaudio/pulseaudio/-/issues/1377

Tested-by: Joel Selvaraj <joelselvaraj.oss@gmail.com>

On 07/10/22 10:57, Dylan Van Assche wrote:
> Jack detection is currently fully functional via the input
> interface together with multimedia buttons, but is not exposed
> as an ALSA control. Therefore, ALSA clients such as PulseAudio
> do not pick up the jack detection events as they only support
> one of the possible interface (ALSA control or input interface,
> but not both). Expose the jack events as an ALSA control and input
> interface to provide ALSA clients both interfaces.
> 
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> ---
>  sound/soc/codecs/wcd-mbhc-v2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/sound/soc/codecs/wcd-mbhc-v2.c b/sound/soc/codecs/wcd-mbhc-v2.c
> index 1911750f7445..1b75f49b2858 100644
> --- a/sound/soc/codecs/wcd-mbhc-v2.c
> +++ b/sound/soc/codecs/wcd-mbhc-v2.c
> @@ -725,6 +725,10 @@ static int wcd_mbhc_initialise(struct wcd_mbhc *mbhc)
>  
>  	mutex_lock(&mbhc->lock);
>  
> +	ret = snd_jack_add_new_kctl(mbhc->jack->jack, "Headset Jack", WCD_MBHC_JACK_MASK);
> +	if (ret)
> +		dev_warn(component->dev, "failed creating Headset Jack kctl with err: %d\n", ret);
> +
>  	/* enable HS detection */
>  	if (mbhc->mbhc_cb->hph_pull_up_control_v2)
>  		mbhc->mbhc_cb->hph_pull_up_control_v2(component,
