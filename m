Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3EF20C8C1
	for <lists+alsa-devel@lfdr.de>; Sun, 28 Jun 2020 17:42:51 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FA1A168D;
	Sun, 28 Jun 2020 17:42:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FA1A168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593358971;
	bh=DYJiy7CNsF5iTNbcRdMYTAFWeoyPh6wfK4FrZ4OKLX4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XZ/ZZZGRdtJ0Yler0YBvRqcpfI9SvNSejncU2FHaLLAWGLmAUHW+iIZ0NXIut1f8o
	 MJkF2eK+k6r0/uQScdDDbfrB+Iyyh0OqsIQoQSsnxYhUa5v/XlZpn/3H4vgF8Q3fJB
	 htZ3zF9SIPjEz2mmblaMV+euGfshOkjGkAB5r+hs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3E2CF80245;
	Sun, 28 Jun 2020 17:41:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A9519F8022D; Sun, 28 Jun 2020 17:41:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 54AD9F800E8
 for <alsa-devel@alsa-project.org>; Sun, 28 Jun 2020 17:41:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 54AD9F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Wosg1kwg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593358911;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LoRvT8JaWy/3KeYLkfaKCxbXPpI31heAcrWLadeA6qg=;
 b=Wosg1kwg8nA35ugcmijHJT7DBb2Lug47wsdVsRQzMrt/0+8VIYI5B35Aaa6pji8gBBHG+3
 F2gttS1dyv2+jR6L2uJoc3lBwLp7elhB9kcBFjmh3qhpmgH57jIIkEz+YXXjNGBK4hAtYE
 f1WUNJ0RbyGCIMhacNZydAl1rh7eCII=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-k6plUgbTOtuPN7MX-mVFlQ-1; Sun, 28 Jun 2020 11:41:49 -0400
X-MC-Unique: k6plUgbTOtuPN7MX-mVFlQ-1
Received: by mail-wm1-f70.google.com with SMTP id g124so17077548wmg.6
 for <alsa-devel@alsa-project.org>; Sun, 28 Jun 2020 08:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LoRvT8JaWy/3KeYLkfaKCxbXPpI31heAcrWLadeA6qg=;
 b=XbIgnqNK6C+4ynoF8oMFRE96qkaU07s4LnLzLHypPx2+HNXpE+sDeA2YYgAJ5ISMjF
 AUYDamjOc/A5+NHKB3+ll2FauzMwtgp8DmXPG6UYzpxF2PPB8/BTiiuQb33Ko2AMXN02
 0y4vQVid3dR+H3A38TTLg2Xwb8ynYI/wOtj05IoO4/AwY9c2GUiwee7RPzOfyVjQl25x
 ZfHROMijla1JKwy0+bYGWmH4we4DYFC50tXx6GJoxoU3mF4rExy8eKnThEOAv9nbyfmp
 NS0C7hr3qxJYzp7OtGn3SN49E8I4yp7TYPRQP4JhTuwJYpyL6fGxcQ9kQQpFOPEyPXpD
 CTVQ==
X-Gm-Message-State: AOAM5321KPKlhsT7A901gNbgkxfJm5Id12gLd9meR/iMztRydbATX8pa
 FUSgwgNy3IYEH5CWZxKdCaXCGiRXR1CwT37xjvnIJ8qALIPdPHrmrHomxjwt6KXPt1DkPEjfcgc
 Z0J7QhWuerLgWgQLbcQ352m4=
X-Received: by 2002:adf:ff8d:: with SMTP id j13mr12929277wrr.11.1593358908509; 
 Sun, 28 Jun 2020 08:41:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxd00m9kEc5i/k+QpYZ5npUQoWEO5wSjFHKyP9SWvMniWozIH52UBpXqCd+8b/++HU8a1pEwA==
X-Received: by 2002:adf:ff8d:: with SMTP id j13mr12929260wrr.11.1593358908304; 
 Sun, 28 Jun 2020 08:41:48 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id z132sm19665666wmb.21.2020.06.28.08.41.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 28 Jun 2020 08:41:47 -0700 (PDT)
Subject: Re: [PATCH 1/6] ASoC: Intel: cht_bsw_rt5672: Change bus format to I2S
 2 channel
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20200628153933.70538-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <a61c933f-fed6-dc6d-63cc-98c953121e74@redhat.com>
Date: Sun, 28 Jun 2020 17:41:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200628153933.70538-1-hdegoede@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi All,

Oops, I remembered a few seconds into git send-email(ing) these, that Mark
asked me to add a cover-letter to my series last time. So I've control-C-ed
that git send-email and I will resend right away with a cover-letter added.

Regards,

Hans

On 6/28/20 5:39 PM, Hans de Goede wrote:
> The default mode for SSP configuration is TDM 4 slot and so far we were
> using this for the bus format on cht-bsw-rt56732 boards.
> 
> One board, the Lenovo Miix 2 10 uses not 1 but 2 codecs connected to SSP2.
> The second piggy-backed, output-only codec is inside the keyboard-dock
> (which has extra speakers). Unlike the main rt5672 codec, we cannot
> configure this codec, it is hard coded to use 2 channel 24 bit I2S.
> 
> Using 4 channel TDM leads to the dock speakers codec (which listens in on
> the data send from the SSP to the rt5672 codec) emiting horribly distorted
> sound.
> 
> Since we only support 2 channels anyways, there is no need for TDM on any
> cht-bsw-rt5672 designs. So we can simply use I2S 2ch everywhere.
> 
> This commit fixes the Lenovo Miix 2 10 dock speakers issue by changing
> the bus format set in cht_codec_fixup() to I2S 2 channel.
> 
> This change has been tested on the following devices with a rt5672 codec:
> 
> Lenovo Miix 2 10
> Lenovo Thinkpad 8
> Lenovo Thinkpad 10 (gen 1)
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   sound/soc/intel/boards/cht_bsw_rt5672.c | 23 +++++++++++------------
>   1 file changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/cht_bsw_rt5672.c b/sound/soc/intel/boards/cht_bsw_rt5672.c
> index 7a43c70a1378..22e432768edb 100644
> --- a/sound/soc/intel/boards/cht_bsw_rt5672.c
> +++ b/sound/soc/intel/boards/cht_bsw_rt5672.c
> @@ -253,21 +253,20 @@ static int cht_codec_fixup(struct snd_soc_pcm_runtime *rtd,
>   	params_set_format(params, SNDRV_PCM_FORMAT_S24_LE);
>   
>   	/*
> -	 * Default mode for SSP configuration is TDM 4 slot
> +	 * Default mode for SSP configuration is TDM 4 slot. One board/design,
> +	 * the Lenovo Miix 2 10 uses not 1 but 2 codecs connected to SSP2. The
> +	 * second piggy-backed, output-only codec is inside the keyboard-dock
> +	 * (which has extra speakers). Unlike the main rt5672 codec, we cannot
> +	 * configure this codec, it is hard coded to use 2 channel 24 bit I2S.
> +	 * Since we only support 2 channels anyways, there is no need for TDM
> +	 * on any cht-bsw-rt5672 designs. So we simply use I2S 2ch everywhere.
>   	 */
> -	ret = snd_soc_dai_set_fmt(asoc_rtd_to_codec(rtd, 0),
> -				  SND_SOC_DAIFMT_DSP_B |
> -				  SND_SOC_DAIFMT_IB_NF |
> +	ret = snd_soc_dai_set_fmt(asoc_rtd_to_cpu(rtd, 0),
> +				  SND_SOC_DAIFMT_I2S     |
> +				  SND_SOC_DAIFMT_NB_NF   |
>   				  SND_SOC_DAIFMT_CBS_CFS);
>   	if (ret < 0) {
> -		dev_err(rtd->dev, "can't set format to TDM %d\n", ret);
> -		return ret;
> -	}
> -
> -	/* TDM 4 slots 24 bit, set Rx & Tx bitmask to 4 active slots */
> -	ret = snd_soc_dai_set_tdm_slot(asoc_rtd_to_codec(rtd, 0), 0xF, 0xF, 4, 24);
> -	if (ret < 0) {
> -		dev_err(rtd->dev, "can't set codec TDM slot %d\n", ret);
> +		dev_err(rtd->dev, "can't set format to I2S, err %d\n", ret);
>   		return ret;
>   	}
>   
> 

