Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DDB977E5B
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Sep 2024 13:16:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7117B14F7;
	Fri, 13 Sep 2024 13:16:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7117B14F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1726226204;
	bh=pxFrIVn6pEQLb15VlFTabxWCTw1Qt4vVS/QG6Wt+CK4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SFNcqi0ho4J/VBGsRD/FX1niNQNcNBgFw0KgVA+WDy7ITOSHAgV0fq8G0we2juNij
	 mO7JDh1zrnrT8joM7kq65TPAONX5DDBpvXKYunpUz9O0losDPUowPHqHmVfRVrazcc
	 9jLaunx7T/NqqwMv9AstIcPNSVCQDydfLzBr8mRE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 298EAF805EE; Fri, 13 Sep 2024 13:13:19 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1A715F8067A;
	Fri, 13 Sep 2024 13:13:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E439F801F5; Thu, 12 Sep 2024 09:23:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7279BF80027
	for <alsa-devel@alsa-project.org>; Thu, 12 Sep 2024 09:23:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7279BF80027
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256
 header.s=google header.b=MYEyQsQf
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42cae102702so4821265e9.0
        for <alsa-devel@alsa-project.org>;
 Thu, 12 Sep 2024 00:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1726125793; x=1726730593;
 darn=alsa-project.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Se+s5UNgvZ5UX0EkE1alXu3A7oUHaSh+LEe2hUZbns0=;
        b=MYEyQsQfX+gaCN6vb0aRs3tNiarwyBA527oxfy0weFELbJGZFTf9xdT/IMsjmNwVC+
         Vup6Eq1wG6z43VElnyROkpWya3UdhOXAuIiwVnCXYKaXiG99xGPouYo3KjalZ7/kVxeM
         mboi589yk+1AMcWZ70Jh0zRb07L85VUkPj18W73QSmKST+Lm7H0Qj3eXmCiE0G+NmQRG
         jMJLXMwomPq/icPJTDT1v+GZaY2V1fvJZhDGwylxKGkZbAEhZQBIgSDj74rykOUi+RIC
         PM++o+lNSOcVhS3EPAAJYiXV3CqixTpMwqWitYl7mbYc26+lPV5JMIHQGy3bzXAcWwVc
         wX8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726125793; x=1726730593;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Se+s5UNgvZ5UX0EkE1alXu3A7oUHaSh+LEe2hUZbns0=;
        b=bvKR6swRXiMXDlHR6lFYQ3SI83Pr/OQwWHSP6EpQ+HrXrph7MEn8/6GBG3MLC2tnDA
         dLwQeFx7vDyL8ozM9rzdGzan719Sns44FQAv8KuBExti4vUy1Lzw5cH6p/vD1S9twfv3
         6IgqJbD/pItYgYr7ILrUqDDCldFHsJCeKZ/o3Dgn/ZnERz0c3rl2VtclI3vOpjrDdiro
         2cZGYQyj3aZPhFv5Zvhx4q/XTNug/PNFBHBTQj4H7jdhZGG5gOkIY+aoW+IyvJfUBSNZ
         wMfzFEWpEKsNwJXhFWQQC+1OXuhFnSFTeFSwzfwS97O43ZWhA0Motg+vkDtcl1zEnhh1
         WgOQ==
X-Gm-Message-State: AOJu0YxToLDYIbH0079OOhK7O0RWw/72zShYcCaGhs3iLw1Kleyf3Xpf
	DDEkAGuWVZ8DtO5u917YYJ7EwpNsEAGnhq23/4z/Z+QG6oZrBwqNDGI3OfQmoy4=
X-Google-Smtp-Source: 
 AGHT+IGKdPI8P07xXRLl8xvGf5pgqCsGWmiLe8zHaAA0yZvG0if7fXsZBJ4s6WuRDHxgRoX4h1wjew==
X-Received: by 2002:a05:600c:314e:b0:426:5ef5:bcb1 with SMTP id
 5b1f17b1804b1-42cdb50a8aemr11563415e9.6.1726125792589;
        Thu, 12 Sep 2024 00:23:12 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.24])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956761c6sm13557444f8f.61.2024.09.12.00.23.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 00:23:12 -0700 (PDT)
Message-ID: <ae7a3386-5e11-4d9b-84a5-8e6a79c91c52@tuxon.dev>
Date: Thu, 12 Sep 2024 10:23:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ASoC: atmel: mchp-pdmc: Retain Non-Runtime Controls
Content-Language: en-US
To: Andrei Simion <andrei.simion@microchip.com>, lgirdwood@gmail.com,
 broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com
Cc: alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
References: <20240911122909.133399-1-andrei.simion@microchip.com>
 <20240911122909.133399-4-andrei.simion@microchip.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20240911122909.133399-4-andrei.simion@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: claudiu.beznea@tuxon.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1
Message-ID-Hash: OYQUGOVIIMU5WU2IV6B55QA22SACSREP
X-Message-ID-Hash: OYQUGOVIIMU5WU2IV6B55QA22SACSREP
X-Mailman-Approved-At: Fri, 13 Sep 2024 11:13:16 +0000
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/OYQUGOVIIMU5WU2IV6B55QA22SACSREP/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

Hi, Andrei,

On 11.09.2024 15:29, Andrei Simion wrote:
> From: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> 
> Avoid removing these controls, as doing so can cause issues if the stream
> is initiated from another control. Ensure these controls remain intact when
> the stream is started or finished. Instead of removing them, return an
> -EBUSY error code to indicate that the controller is busy, especially when
> the audio filter and the SINC filter are in use.
> 
> [andrei.simion@microchip.com: Reword the commit title and the commit
> message. Adapt the code from kernel v6.1 -> v6.6 -> latest kernel version.]
> 
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
>  sound/soc/atmel/mchp-pdmc.c | 78 ++++++++++++++++---------------------
>  1 file changed, 34 insertions(+), 44 deletions(-)
> 
> diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
> index d97d153ee375..758b3c550b97 100644
> --- a/sound/soc/atmel/mchp-pdmc.c
> +++ b/sound/soc/atmel/mchp-pdmc.c
> @@ -14,6 +14,7 @@
>  #include <linux/of.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> +#include <linux/spinlock.h>
>  
>  #include <sound/core.h>
>  #include <sound/dmaengine_pcm.h>
> @@ -113,6 +114,7 @@ struct mchp_pdmc_chmap {
>  
>  struct mchp_pdmc {
>  	struct mic_map channel_mic_map[MCHP_PDMC_MAX_CHANNELS];
> +	spinlock_t busy_lock;		/* lock protecting busy */
>  	struct device *dev;
>  	struct snd_dmaengine_dai_dma_data addr;
>  	struct regmap *regmap;
> @@ -124,6 +126,7 @@ struct mchp_pdmc {
>  	int mic_no;
>  	int sinc_order;
>  	bool audio_filter_en;
> +	u8 busy:1;

Can the spinlock and busy flag be replaced by an atomic variable?

>  };
>  
>  static const char *const mchp_pdmc_sinc_filter_order_text[] = {
> @@ -167,10 +170,19 @@ static int mchp_pdmc_sinc_order_put(struct snd_kcontrol *kcontrol,
>  		return -EINVAL;
>  
>  	val = snd_soc_enum_item_to_val(e, item[0]) << e->shift_l;
> -	if (val == dd->sinc_order)
> +
> +	spin_lock(&dd->busy_lock);
> +	if (dd->busy) {
> +		spin_unlock((&dd->busy_lock));

You can remove () around (&dd->busy_lock). Valid for the rest of occurrences.

> +		return -EBUSY;
> +	}
> +	if (val == dd->sinc_order) {
> +		spin_unlock((&dd->busy_lock));
>  		return 0;
> +	}
>  
>  	dd->sinc_order = val;
> +	spin_unlock((&dd->busy_lock));
>  
>  	return 1;
>  }
> @@ -193,10 +205,18 @@ static int mchp_pdmc_af_put(struct snd_kcontrol *kcontrol,
>  	struct mchp_pdmc *dd = snd_soc_component_get_drvdata(component);
>  	bool af = uvalue->value.integer.value[0] ? true : false;
>  
> -	if (dd->audio_filter_en == af)
> +	spin_lock(&dd->busy_lock);
> +	if (dd->busy) {
> +		spin_unlock((&dd->busy_lock));
> +		return -EBUSY;
> +	}
> +	if (dd->audio_filter_en == af) {
> +		spin_unlock((&dd->busy_lock));
>  		return 0;
> +	}
>  
>  	dd->audio_filter_en = af;
> +	spin_unlock((&dd->busy_lock));
>  
>  	return 1;
>  }
> @@ -379,52 +399,10 @@ static const struct snd_kcontrol_new mchp_pdmc_snd_controls[] = {
>  	},
>  };
>  
> -static int mchp_pdmc_close(struct snd_soc_component *component,
> -			   struct snd_pcm_substream *substream)
> -{
> -	return snd_soc_add_component_controls(component, mchp_pdmc_snd_controls,
> -					      ARRAY_SIZE(mchp_pdmc_snd_controls));
> -}
> -
> -static int mchp_pdmc_open(struct snd_soc_component *component,
> -			  struct snd_pcm_substream *substream)
> -{
> -	int i;
> -
> -	/* remove controls that can't be changed at runtime */
> -	for (i = 0; i < ARRAY_SIZE(mchp_pdmc_snd_controls); i++) {
> -		const struct snd_kcontrol_new *control = &mchp_pdmc_snd_controls[i];
> -		struct snd_ctl_elem_id id;
> -		int err;
> -
> -		if (component->name_prefix)
> -			snprintf(id.name, sizeof(id.name), "%s %s", component->name_prefix,
> -				 control->name);
> -		else
> -			strscpy(id.name, control->name, sizeof(id.name));
> -
> -		id.numid = 0;
> -		id.iface = control->iface;
> -		id.device = control->device;
> -		id.subdevice = control->subdevice;
> -		id.index = control->index;
> -		err = snd_ctl_remove_id(component->card->snd_card, &id);
> -		if (err < 0)
> -			dev_err(component->dev, "%d: Failed to remove %s\n", err,
> -				control->name);
> -	}
> -
> -	return 0;
> -}
> -
>  static const struct snd_soc_component_driver mchp_pdmc_dai_component = {
>  	.name = "mchp-pdmc",
>  	.controls = mchp_pdmc_snd_controls,
>  	.num_controls = ARRAY_SIZE(mchp_pdmc_snd_controls),
> -	.open = &mchp_pdmc_open,
> -	.close = &mchp_pdmc_close,
> -	.legacy_dai_naming = 1,
> -	.trigger_start = SND_SOC_TRIGGER_ORDER_LDC,
>  };
>  
>  static const unsigned int mchp_pdmc_1mic[] = {1};
> @@ -587,6 +565,13 @@ static int mchp_pdmc_hw_params(struct snd_pcm_substream *substream,
>  			cfgr_val |= MCHP_PDMC_CFGR_BSSEL(i);
>  	}
>  
> +	/*
> +	 * from these point forward, we consider the controller busy, so the
> +	 * audio filter and SINC order can't be changed
> +	 */
> +	spin_lock(&dd->busy_lock);
> +	dd->busy = 1;
> +	spin_unlock((&dd->busy_lock));
>  	for (osr_start = dd->audio_filter_en ? 64 : 8;
>  	     osr_start <= 256 && best_diff_rate; osr_start *= 2) {
>  		long round_rate;
> @@ -1099,6 +1084,7 @@ static int mchp_pdmc_probe(struct platform_device *pdev)
>  	 */
>  	dd->audio_filter_en = true;
>  	dd->sinc_order = 3;
> +	spin_lock_init(&dd->busy_lock);
>  
>  	dd->addr.addr = (dma_addr_t)res->start + MCHP_PDMC_RHR;
>  	platform_set_drvdata(pdev, dd);
> @@ -1143,6 +1129,10 @@ static void mchp_pdmc_remove(struct platform_device *pdev)
>  {
>  	struct mchp_pdmc *dd = platform_get_drvdata(pdev);
>  
> +	spin_lock(&dd->busy_lock);
> +	dd->busy = 0;
> +	spin_unlock((&dd->busy_lock));
> +
>  	if (!pm_runtime_status_suspended(dd->dev))
>  		mchp_pdmc_runtime_suspend(dd->dev);
>  
