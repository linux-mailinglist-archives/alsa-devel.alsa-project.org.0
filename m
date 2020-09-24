Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 74A702771C2
	for <lists+alsa-devel@lfdr.de>; Thu, 24 Sep 2020 15:03:07 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 296C717C1;
	Thu, 24 Sep 2020 15:02:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 296C717C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600952586;
	bh=ABpMIzJoPlJTkCbe37hQ8hOzA5UBaol56GzmaIMdeos=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ikHj4Z9o/TyKeqHPhEG2FHwGzKWD7epbPUtADRz0TAsWE3JBEnqMKUTL9vqnymZLe
	 z1r/VaJ8jYqEDaj81VpZlEgCfG/mxJOHTXsfF6Q7HZdvKWatDigtTHpBSZXB5lYQE1
	 UkccdeozW3cdQv605xhGshuO62gRhq1K7+3Whi6U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4C872F800DA;
	Thu, 24 Sep 2020 15:01:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07981F80232; Thu, 24 Sep 2020 15:01:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com
 [IPv6:2607:f8b0:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 018C7F8015F
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 15:01:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 018C7F8015F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.b="E9iKMC1w"
Received: by mail-il1-x143.google.com with SMTP id t13so2992985ile.9
 for <alsa-devel@alsa-project.org>; Thu, 24 Sep 2020 06:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zPB7jULHIg1msvTaEkWc/XGqvJfOwCy594X3DY/QjvE=;
 b=E9iKMC1wzBPaarlgtDzjwt1puGwye2dLf3QCw5dE87ph22iQOTFPvbj0p71swE/7Ym
 6GAB/CqYTvqJT5J6Uy810Q+tUnL8PR1GHu3p63aM1gkgjpjxQIlNCiu5n8quNn7oRNSO
 j4AReEHo5TFvAIZagxSwDwEvQjMw41VKGxpy3akkBwFrY4/xC3NBuWKNrAbqYoRed7dC
 7AX2cp0VdRivFRYyECmTKZCDYNbyHKHXsXpt8YL9r36IQMuVAwsSn/MfRCSDjvAP+5Ii
 qZPORrIG9elIZ3xbc1Towl/EgD28MtYgrx1GA2KG3916r/9WPu+rLFIdOaWdUCjuRqoc
 7u8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zPB7jULHIg1msvTaEkWc/XGqvJfOwCy594X3DY/QjvE=;
 b=i6oQzbB4WO5NbZGexSpPzdOnG9gAlbp8Fhl+DWUBp4k/sF7F83ozpXF0RpXnmT+qSR
 koVlMqKj/riS3/cZuQ132K9/QMeEmpwUV2rx1S7tqKcu1QvxS0DS1s/Mv2NVu0B8i0Fo
 ZKVa5pBlKQB2FatRMC5PAyI0WG4UppvaPrqNwczcvdfiAlq+N04choFwA6vs2fByLRjN
 aNxrv99VyH8XBxexz1qCwVMhKuslDP+F+ZmLNFTmgy3ZnK0t7fPUemcJVMi8hHsh8ii8
 YyIS7pMAoB9Sbnh6rjD1KNBq7r1qABovVpNV4/0b53D6rSVRSpnMoJ2PaZWV3AM666CO
 DqpQ==
X-Gm-Message-State: AOAM533pr6ErQy1nWSXoOYUFBwrNDvm36PBRqOqCsFlzvJpj6jrOFSbW
 F7Vpp2ZSuDkGPxjm3AGy60rJSzN8G+4MVQ==
X-Google-Smtp-Source: ABdhPJwKytinnF4jKyr8BsEenwtoJNaAp3EfRWwKAmJYb8V3sOg5GraVPWm16zthU56b8nazxGYZsQ==
X-Received: by 2002:a92:9e0f:: with SMTP id q15mr4093943ili.286.1600952471522; 
 Thu, 24 Sep 2020 06:01:11 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id q5sm1613477ile.63.2020.09.24.06.01.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Sep 2020 06:01:10 -0700 (PDT)
Subject: Re: [greybus-dev] [PATCH 3/3] [PATCH] staging: greybus: __u8 is
 sufficient for snd_ctl_elem_type_t and snd_ctl_elem_iface_t
To: Coiby Xu <coiby.xu@gmail.com>, devel@driverdev.osuosl.org
References: <20200924102039.43895-1-coiby.xu@gmail.com>
 <20200924102039.43895-3-coiby.xu@gmail.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <772d78de-630f-4b0f-16cc-4e67b8f98907@linaro.org>
Date: Thu, 24 Sep 2020 08:01:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200924102039.43895-3-coiby.xu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Alex Elder <elder@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Johan Hovold <johan@kernel.org>
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

On 9/24/20 5:20 AM, Coiby Xu wrote:
> Use __8 to replace int and remove the unnecessary __bitwise type attribute.
> 
> Found by sparse,

Greg's right, don't change the public header.

You could try this in the Greybus code to eliminate the warning,
but I haven't tried it (and for all I know it's not a good idea):

	uinfo->type = (__force snd_ctl_elem_type_t)info->type;

					-Alex

> $ make C=2 drivers/staging/greybus/
> drivers/staging/greybus/audio_topology.c:185:24: warning: cast to restricted snd_ctl_elem_type_t
> drivers/staging/greybus/audio_topology.c:679:14: warning: restricted snd_ctl_elem_iface_t degrades to integer
> drivers/staging/greybus/audio_topology.c:906:14: warning: restricted snd_ctl_elem_iface_t degrades to integer
> 
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
> ---
>  drivers/staging/greybus/audio_topology.c | 2 +-
>  include/uapi/sound/asound.h              | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 56bf1a4f95ad..f6023ff390c2 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -182,7 +182,7 @@ static int gbcodec_mixer_ctl_info(struct snd_kcontrol *kcontrol,
>  	/* update uinfo */
>  	uinfo->access = data->access;
>  	uinfo->count = data->vcount;
> -	uinfo->type = (snd_ctl_elem_type_t)info->type;
> +	uinfo->type = info->type;
>  
>  	switch (info->type) {
>  	case GB_AUDIO_CTL_ELEM_TYPE_BOOLEAN:
> diff --git a/include/uapi/sound/asound.h b/include/uapi/sound/asound.h
> index 535a7229e1d9..8e71a95644ab 100644
> --- a/include/uapi/sound/asound.h
> +++ b/include/uapi/sound/asound.h
> @@ -950,7 +950,7 @@ struct snd_ctl_card_info {
>  	unsigned char components[128];	/* card components / fine identification, delimited with one space (AC97 etc..) */
>  };
>  
> -typedef int __bitwise snd_ctl_elem_type_t;
> +typedef __u8 snd_ctl_elem_type_t;
>  #define	SNDRV_CTL_ELEM_TYPE_NONE	((__force snd_ctl_elem_type_t) 0) /* invalid */
>  #define	SNDRV_CTL_ELEM_TYPE_BOOLEAN	((__force snd_ctl_elem_type_t) 1) /* boolean type */
>  #define	SNDRV_CTL_ELEM_TYPE_INTEGER	((__force snd_ctl_elem_type_t) 2) /* integer type */
> @@ -960,7 +960,7 @@ typedef int __bitwise snd_ctl_elem_type_t;
>  #define	SNDRV_CTL_ELEM_TYPE_INTEGER64	((__force snd_ctl_elem_type_t) 6) /* 64-bit integer type */
>  #define	SNDRV_CTL_ELEM_TYPE_LAST	SNDRV_CTL_ELEM_TYPE_INTEGER64
>  
> -typedef int __bitwise snd_ctl_elem_iface_t;
> +typedef __u8 snd_ctl_elem_iface_t;
>  #define	SNDRV_CTL_ELEM_IFACE_CARD	((__force snd_ctl_elem_iface_t) 0) /* global control */
>  #define	SNDRV_CTL_ELEM_IFACE_HWDEP	((__force snd_ctl_elem_iface_t) 1) /* hardware dependent device */
>  #define	SNDRV_CTL_ELEM_IFACE_MIXER	((__force snd_ctl_elem_iface_t) 2) /* virtual mixer device */
> 

