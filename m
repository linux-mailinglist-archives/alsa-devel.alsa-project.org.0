Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7C182ED6E
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Jan 2024 12:11:25 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 837FF1FC;
	Tue, 16 Jan 2024 12:11:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 837FF1FC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1705403484;
	bh=SEMbf8H5+E8qdn97ZHIS9/5lOCwBvSsPs/DsXKR11UU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=Rv3EA8G2gvU/yqKkD6cJkkLoQRjhrs4/DVtdm5yIVKBpctX7pTiVEIU3b/llMkKqa
	 mA3CPpw9nLMhTmF/GtJoEa6UBeaRLFEfUC8LZTH/H1lIeA/2jqKArT+Fg1yzOdEqIg
	 +H71IGbOWHuly4mHFvyACiRAfGpkTZG4zBCeBFX8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3FDFBF804F1; Tue, 16 Jan 2024 12:10:52 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 86BD5F80571;
	Tue, 16 Jan 2024 12:10:52 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0DF4DF801F5; Tue, 16 Jan 2024 12:10:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,
	SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 33C9EF800C1
	for <alsa-devel@alsa-project.org>; Tue, 16 Jan 2024 12:10:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 33C9EF800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=frCVInnt
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e80046264so14617995e9.0
        for <alsa-devel@alsa-project.org>;
 Tue, 16 Jan 2024 03:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1705403424; x=1706008224;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dJJy6fD6/lLKmXLx1a8nLqcyCrMSlt89VNd+fRBzGBo=;
        b=frCVInntunWGbczVxRZHQAC9ZVbp2Z0YdjXjznIjuo1h8tQ2suf+B5LyBcuHka7/Ay
         2DWwRNJ87t8GtUINqY4bd33eGSq43mkB9L78+mSCmkh539qaI/jsaz6qS1k1zwt0bluc
         StGTeneghfLNBg7PRxo8waMmi9ovMXrryCPgIhLjXVvzAVrwrIRnhUM3AdZPGPZl7r6h
         0rGIOse3m5r130/VCljCsnncVHkj7D7DhOFRAbEzFLDeaqo/FgVCkxlhQginHwM7zjKj
         7dzfeu1cm4KmzWa8FBrTLHCoaZ3A6sXGfrU3zaopsYhve/ZLNunxCNU1J8jFhC9LFSjV
         itrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705403424; x=1706008224;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dJJy6fD6/lLKmXLx1a8nLqcyCrMSlt89VNd+fRBzGBo=;
        b=uv3e28QpiAswkT8cB6His6QgQ+QACeY3dFrOUy5+M8gHIBgiq00efEmbmtoyzZ2WUV
         TycecBCujozJBxi4xhyDDSAU7+2YVe4gEVQsyKxGV1waKWGXooVhkq1/KC2lTF7iSWCO
         +mwLgE29KIje/W3DJ6nMLPc2XqNMhYSyIuk3p4ZOfaW4U2r9VZTed1Nt8EPQ04ODeVMC
         Osw+urTzjGcbqLEOFtJA05ewHsvOussAArAXe8KKdGmGZ5wxnQtMMqfD2Xrl6WFtrXt/
         9wVTjFzcMuvCeoDQvVPmPH/7MCk0kwdLqs9Qz5Mpdj+MS36kvG2vZHXlSdL+65RCJeMV
         bIWQ==
X-Gm-Message-State: AOJu0Yxi5ULW+JKsqjsP+lhInww1CUV8mhe1XeAbxbbeTCTn7VD5X2Hg
	JpHWhHZyzbKA0npRYGU1oiEuhmod5IohIQ==
X-Google-Smtp-Source: 
 AGHT+IEEkCSG4k8XHy6r0V/74OqUmJeKY1nvqmtsrCsVsxsyDA1c5yy/u7DZ68mrLYvI6MgazVKOrw==
X-Received: by 2002:a05:600c:4d95:b0:40e:5577:17e with SMTP id
 v21-20020a05600c4d9500b0040e5577017emr4116191wmp.57.1705403423647;
        Tue, 16 Jan 2024 03:10:23 -0800 (PST)
Received: from [192.168.1.195] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id
 iw7-20020a05600c54c700b0040d604dea3bsm18593723wmb.4.2024.01.16.03.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jan 2024 03:10:22 -0800 (PST)
Message-ID: <8bb1cad6-6a85-444a-b881-c03ab0051009@linaro.org>
Date: Tue, 16 Jan 2024 11:10:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/7] ASoC: codecs: lpass-wsa-macro: fix compander volume
 hack
To: Johan Hovold <johan+linaro@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: Banajit Goswami <bgoswami@quicinc.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20240116093903.19403-1-johan+linaro@kernel.org>
 <20240116093903.19403-3-johan+linaro@kernel.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240116093903.19403-3-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WZQ6R3FBF5Q2N7XNOSTESQM7VOIGSVEX
X-Message-ID-Hash: WZQ6R3FBF5Q2N7XNOSTESQM7VOIGSVEX
X-MailFrom: srinivas.kandagatla@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WZQ6R3FBF5Q2N7XNOSTESQM7VOIGSVEX/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Thanks Johan for this patch,

On 16/01/2024 09:38, Johan Hovold wrote:
> The LPASS WSA macro codec driver is updating the digital gain settings
> behind the back of user space on DAPM events if companding has been
> enabled.
> 
> As compander control is exported to user space, this can result in the
> digital gain setting being incremented (or decremented) every time the
> sound server is started and the codec suspended depending on what the
> UCM configuration looks like.
> 
> Soon enough playback will become distorted (or too quiet).
> 
> This is specifically a problem on the Lenovo ThinkPad X13s as this
> bypasses the limit for the digital gain setting that has been set by the
> machine driver.
> 
> Fix this by simply dropping the compander gain hack. If someone cares
> about modelling the impact of the compander setting this can possibly be
> done by exporting it as a volume control later.
> 
This is not a hack, wsa codec requires gain to be programmed after the 
clk is enabled for that particular interpolator.

However I agree with you on programming the gain that is different to 
what user set it.

This is because of unimplemented or half baked implementation of half-db 
feature of gain control in this codec.

We can clean that half baked implementation for now and still continue 
to program the gain values after the clks are enabled.

lets remove spkr_gain_offset and associated code paths in this codec, 
which should fix the issue that you have reported and still do the right 
thing of programming gain after clks are enabled.

thanks,
Srini


> Fixes: 2c4066e5d428 ("ASoC: codecs: lpass-wsa-macro: add dapm widgets and route")
> Cc: stable@vger.kernel.org      # 5.11
> Cc: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>   sound/soc/codecs/lpass-wsa-macro.c | 10 ----------
>   1 file changed, 10 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 7e21cec3c2fb..7de221464d47 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -1583,8 +1583,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>   	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
>   	u16 gain_reg;
>   	u16 reg;
> -	int val;
> -	int offset_val = 0;
>   	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
>   
>   	if (w->shift == WSA_MACRO_COMP1) {
> @@ -1623,11 +1621,7 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>   					CDC_WSA_RX1_RX_PATH_MIX_SEC0,
>   					CDC_WSA_RX_PGA_HALF_DB_MASK,
>   					CDC_WSA_RX_PGA_HALF_DB_ENABLE);
> -			offset_val = -2;
>   		}
> -		val = snd_soc_component_read(component, gain_reg);
> -		val += offset_val;
> -		snd_soc_component_write(component, gain_reg, val);
>   		wsa_macro_config_ear_spkr_gain(component, wsa,
>   						event, gain_reg);
>   		break;
> @@ -1654,10 +1648,6 @@ static int wsa_macro_enable_interpolator(struct snd_soc_dapm_widget *w,
>   					CDC_WSA_RX1_RX_PATH_MIX_SEC0,
>   					CDC_WSA_RX_PGA_HALF_DB_MASK,
>   					CDC_WSA_RX_PGA_HALF_DB_DISABLE);
> -			offset_val = 2;
> -			val = snd_soc_component_read(component, gain_reg);
> -			val += offset_val;
> -			snd_soc_component_write(component, gain_reg, val);
>   		}
>   		wsa_macro_config_ear_spkr_gain(component, wsa,
>   						event, gain_reg);
