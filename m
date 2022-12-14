Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CF38564C5CB
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 10:23:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 815D521B1;
	Wed, 14 Dec 2022 10:22:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 815D521B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671009811;
	bh=M/JF1Ns5GFmL8K6D30mPz7jcYfiGIIGYV3AbLPTTHU0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PtJ1S/jx3RKTQo3/qklEDN1OB/S3V2yTXEUSImdkVabxgoAf4EOGx3wo+VeqlgdEB
	 JXfpdEEqtUdfff8D9kvcIiI7/kAlYIB6HWlcuRqFGP/Q2KmoTUtYK+I1Ikb/KeB0ov
	 /oV9w7HHqtGMw342Q6uuoVEzSan2H6Sk1X3WwRMU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1AC7BF80141;
	Wed, 14 Dec 2022 10:22:34 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CF60CF804D7; Wed, 14 Dec 2022 10:22:31 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AEE4FF801D5
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 10:22:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AEE4FF801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Yr3UWp5f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671009746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nJA8KaJmqguWsbBtP1OTbaZFHL8G72b0y+LC80FABnI=;
 b=Yr3UWp5fBDphVVLcYES40ROfYFI/TB8gT5m61c2TVOuYarxEZJLexYvBopMRexZXGa1v7Q
 8fZZytvZfs94t2I9whUqIgWV5dM2uSce73UuL/NjrS1ktaSbIzDUhb9MTYthbu88A9xCH/
 Iy6jPfc3ym3lgcp+mg0u0fgZrgCe5+A=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-435-_7D3Mt55PxyjZpYtnP0lcg-1; Wed, 14 Dec 2022 04:22:23 -0500
X-MC-Unique: _7D3Mt55PxyjZpYtnP0lcg-1
Received: by mail-ej1-f69.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso10984871ejb.5
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 01:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nJA8KaJmqguWsbBtP1OTbaZFHL8G72b0y+LC80FABnI=;
 b=RPH869qKT5tFFBxhOTDy5voklkfk3cJUDsYXUAqMqBfsvtmwpYeyqnUgqrnRhMZXG7
 ZKhApVCk4qWJGQ81hWhtq3QryoD5xqaxsBEl8QLCKqaFKYeQyKczzlq3XYLsfgSWj1YH
 HeoHpauPJEGHudZJEW4yrKYsgTVILLyuNKmUu5w5r1UED1rD4teOCo2U7CETm4+K/sYi
 Ls2/Gr4IqM+y82mzBigH1T0mEOjg5I0i3SHoAI47AqaS0dI26DlNsR56zN+nuT7Fo8JG
 eY4TLQIrBUITNMnl8SkV8lZGLnKOkfnPl18FmEhoqjqEeeYNq/oWrhZg1NMD7ccDU5gC
 HknA==
X-Gm-Message-State: ANoB5pkXP4JYz0+5DNHVZl/WcB6g6xomKYgwUiii0qDLLaw+kf/1rSdG
 YCHhdEK2EnlxiN6SPfmAjz9hOhu84Jve0jGUUFxgYkUTDA4a3xnHiI7h3ibzDWdVpmMVewhJ15X
 WFSx1eZbLVMrIiMU9zTA4xH4=
X-Received: by 2002:a17:907:c295:b0:78d:f455:c398 with SMTP id
 tk21-20020a170907c29500b0078df455c398mr8937697ejc.62.1671009742254; 
 Wed, 14 Dec 2022 01:22:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf55pRMSkg7vndNUAyVDFqiXwmly2aKwf0IOJCjfqzW8uBYez/RUVRYofeA9A7gOSbPQnwSPCw==
X-Received: by 2002:a17:907:c295:b0:78d:f455:c398 with SMTP id
 tk21-20020a170907c29500b0078df455c398mr8937684ejc.62.1671009742098; 
 Wed, 14 Dec 2022 01:22:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 bq19-20020a170906d0d300b007bf5250b515sm5580443ejb.29.2022.12.14.01.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 01:22:21 -0800 (PST)
Message-ID: <278b0d08-967d-527e-7d29-58126ef906d4@redhat.com>
Date: Wed, 14 Dec 2022 10:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] Add HP Stream 8 to bytcr_rt5640.c
To: Moises Cardona <moisesmcardona@gmail.com>, cezary.rojewski@intel.com
References: <20221213173550.1567875-1-moisesmcardona@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221213173550.1567875-1-moisesmcardona@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, peter.ujfalusi@linux.intel.com, tiwai@suse.com,
 pierre-louis.bossart@linux.intel.com, ranjani.sridharan@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org, akihiko.odaki@gmail.com,
 yung-chuan.liao@linux.intel.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hello Moises,

On 12/13/22 18:35, Moises Cardona wrote:
> The HP Stream 8 tablet is identical to the HP Stream 7 in terms of the PCB,
> with the exception of the added SIM Card Slot. 
> Therefore, I'm submitting this patch which properly initializes the audio 
> and enables the headphone jack to work, just like it does in the 
> HP Stream 7.
> 
> Signed-off-by: Moises Cardona <moisesmcardona@gmail.com>

Thank you for your patch.

According to this review:

http://techlife101.com/hp-stream-8-review/

The Stream 8 has 2 speakers, so you should drop the
BYT_RT5640_MONO_SPEAKER part so that both speakers
will be used.

Regards,

Hans



> ---
>  sound/soc/intel/boards/bytcr_rt5640.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index fb9d9e271845..1d964b1ceff4 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -796,6 +796,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>  					BYT_RT5640_SSP0_AIF1 |
>  					BYT_RT5640_MCLK_EN),
>  	},
> +	{	/* HP Stream 8 */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "HP Stream 8 Tablet"),
> +		},
> +		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
> +					BYT_RT5640_MONO_SPEAKER |
> +					BYT_RT5640_JD_NOT_INV |
> +					BYT_RT5640_SSP0_AIF1 |
> +					BYT_RT5640_MCLK_EN),
> +	},
>  	{	/* I.T.Works TW891 */
>  		.matches = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),

