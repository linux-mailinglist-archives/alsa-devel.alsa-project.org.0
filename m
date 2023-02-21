Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 055A169E85D
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Feb 2023 20:33:51 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B5F10EAB;
	Tue, 21 Feb 2023 20:32:59 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B5F10EAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1677008029;
	bh=RUgEshj7wTWFoGWXY+GzDTUBNQe5/qlrMmYMeRmMRXg=;
	h=Date:From:To:Subject:References:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=MdHoYjNlMA05SQ49NN1oI1377y6WE+xmv76Oj5hf+xP1riIfiIStkZ5aVrD9BhGcj
	 c95ngobVGWBGd/BWboNo0maKqJRtSZ7VFYp1WycFxqCiVuVYETS9LX9tqx+gRzUW1q
	 AWB+A+0KID53YNLiEy2wCsmvg8GFjJgZW0IcLlDI=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C3538F8025A;
	Tue, 21 Feb 2023 20:32:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A0971F80266; Tue, 21 Feb 2023 20:32:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5BD19F80125
	for <alsa-devel@alsa-project.org>; Tue, 21 Feb 2023 20:32:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5BD19F80125
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VQjwqdLm
Received: by mail-wr1-x434.google.com with SMTP id t15so5729622wrz.7
        for <alsa-devel@alsa-project.org>;
 Tue, 21 Feb 2023 11:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=z1BKzb50vau0QIAXVcTGeHLKNWSnhlGapYli6cdXKzI=;
        b=VQjwqdLmqVCn6kaX2voaXpTvFU81kOgGm15ZqXT792b1eaYJMq0twiAJWUS6oW0cBp
         YrYwSGCjB8a4Pe0m5cXLvsl1WnefnzR2dnUQTg2UhL92ELk4rhWo87Sr0fJIquTrkpcP
         T3ZCTmD2A5hEL1h7/r1yg6aPaZ4D9M0FpyLoEvRbxDcPoMZqrZXn5MNDHElDNgpTLaMH
         lus4Un6rqzqA4naeAHeXdcUolbrqYAtaoGAhPLr03xH5QjnlmeNXSyYBezeeuWXvCsr8
         QsomYq+PX3UznzPmv/BOnxbQw9oHXGTQNiNLUdC11gouh+zuHeK94PtpUEIXCWSgf8IS
         NoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1BKzb50vau0QIAXVcTGeHLKNWSnhlGapYli6cdXKzI=;
        b=owUTdJVSXb81hl3H8r/8xgCAGWayiVzetfl/3K6Pjz9ahSEe7A7fEejd1t8QECjjYB
         Q+3Jkl5tS04DteeYkMSIpbwHzpmywczaJHBvOZltiT/REuTFCrxISMeqkNsYQ+fUc/7t
         6a9+77X8fPu+D/ucf5R93HwZOIcrjtmhUhLN3IORs9l7deYwrYrFm2hH0tVtMgIfobRG
         naiVK70c1H8N3oADWC6NChlfiEaR+qnTYE+8kqwX1S7JoRgLMr5SG0qqkk7Ju0qLjVBn
         lXI12atYIteO2r0DYyELhJ3e9tMyv3N+RnAQQhnhmpsnz5Ffo+Qk6qQ6OCvaa7w8SLHp
         VFWQ==
X-Gm-Message-State: AO0yUKV6K2VN0W/RqmkzPsDtSBwf5N+jwtFMcOksu6jskNbfEvc0RaSl
	rSrY4kOFsZFTP/gpQ5PRcPw=
X-Google-Smtp-Source: 
 AK7set81qqkpf6ljR3tBGipC+kP/rYvPLJGM4XwsvqdTfos+aVHiNmd2lGCE1Z2uiPE+maz3/n5NEw==
X-Received: by 2002:a5d:4a86:0:b0:2c5:6cfe:aab4 with SMTP id
 o6-20020a5d4a86000000b002c56cfeaab4mr4773550wrq.12.1677007968809;
        Tue, 21 Feb 2023 11:32:48 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id
 t13-20020a05600001cd00b002c6d0462163sm4106685wrx.100.2023.02.21.11.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 11:32:48 -0800 (PST)
Date: Tue, 21 Feb 2023 22:32:44 +0300
From: Dan Carpenter <error27@gmail.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Subject: Re: [PATCH v1 04/10] ASoC: tegra: Support RT5631 by machine driver
Message-ID: <Y/UcXNueAmrrhWG0@kadam>
References: <20230221183211.21964-1-clamor95@gmail.com>
 <20230221183211.21964-5-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230221183211.21964-5-clamor95@gmail.com>
Message-ID-Hash: PRB2MNCIEIW4E55LUU6GYZ45SECWQ7RH
X-Message-ID-Hash: PRB2MNCIEIW4E55LUU6GYZ45SECWQ7RH
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Maxim Schwalm <maxim.schwalm@gmail.com>,
 Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PRB2MNCIEIW4E55LUU6GYZ45SECWQ7RH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Feb 21, 2023 at 08:32:05PM +0200, Svyatoslav Ryhel wrote:
> diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
> index 78faa8bcae27..607800ec07a6 100644
> --- a/sound/soc/tegra/tegra_asoc_machine.c
> +++ b/sound/soc/tegra/tegra_asoc_machine.c
> @@ -51,6 +51,17 @@ static struct snd_soc_jack_gpio tegra_machine_headset_jack_gpio = {
>  };
>  
>  /* Mic Jack */

This comment doesn't make sense now.  It was never super useful, though.
Just delete it.

> +static int headset_check(void *data)
> +{
> +	struct tegra_machine *machine = (struct tegra_machine *)data;
> +
> +	/* Detect mic insertion only if 3.5 jack is in */
> +	if (gpiod_get_value_cansleep(machine->gpiod_hp_det) &&
> +	    gpiod_get_value_cansleep(machine->gpiod_mic_det))
> +		return SND_JACK_MICROPHONE;
> +
> +	return 0;
> +}
>  
>  static struct snd_soc_jack tegra_machine_mic_jack;
>  
> @@ -183,8 +194,15 @@ int tegra_asoc_machine_init(struct snd_soc_pcm_runtime *rtd)

regards,
dan carpenter
