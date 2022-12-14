Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B9E64CD34
	for <lists+alsa-devel@lfdr.de>; Wed, 14 Dec 2022 16:42:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AC7962A79;
	Wed, 14 Dec 2022 16:41:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AC7962A79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1671032533;
	bh=cU8tgWWNMEdHRLR61GiAwe5544OaRBsZ/Ic0VeuL3YQ=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EEZXh/Ys8B3xyrXZBMO4M8FIbnw0BX7v2xdlsYlxpZBcAVmD+iv0C4nOYHCrRQUcN
	 7VRAZ0zgsger6OI3fpBKeNXJMy3SMxQXM+nKGH+nfPyiBQSHCF8I7v7MgpqEjcea2i
	 rpROMkDjg+sUKJy27/W0M7jPEfHRIx6Pq1HPQCXA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3AE9DF80141;
	Wed, 14 Dec 2022 16:41:16 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFEE9F804D0; Wed, 14 Dec 2022 16:41:14 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED shortcircuit=no
 autolearn=ham autolearn_force=no version=3.4.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A198F801D5
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 16:41:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A198F801D5
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=e19hr7O5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671032471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7XBd4ptJNbvgrkzTUuMXLg7l6NQuSyxEYYBB50Aa96E=;
 b=e19hr7O5n67jOtDOJo8eKq1JIcgrz15tFbAtV7vrKsjerPBZZbue5Kgrtaa0w0VvIKx3sc
 xPO+wLdXAEsEmky4iY649sqF5at0eFLY7PhrWYB+lvJ+qE10D6lK0JsWvBmUya4ZRAau0p
 X5MU6Mu/wZHdUmCwWztkzbRYDzqRsoE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-648-GHZMq6RAMpGJPoD7zrdKUA-1; Wed, 14 Dec 2022 10:41:10 -0500
X-MC-Unique: GHZMq6RAMpGJPoD7zrdKUA-1
Received: by mail-ed1-f69.google.com with SMTP id
 y20-20020a056402271400b0046c9a6ec30fso9804310edd.14
 for <alsa-devel@alsa-project.org>; Wed, 14 Dec 2022 07:41:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7XBd4ptJNbvgrkzTUuMXLg7l6NQuSyxEYYBB50Aa96E=;
 b=OVaEV7+3Vqo6nJfBgvc1CuMWnIGL+YMpfKeFZxYki6PRQpqmw5EuvPjJKpvbmZd3i2
 DEF7IdmErGTJGpOSuY8hPKJrWoV5xD8D/j7ofp1AQ6G4HMNmfZRMj04pie92EYHQc/bD
 UBYpR5eSOdt0utsE2BrzZYpNrS4occsSmGAAsgra/o558xsMLk7jzNswlSxVmvF5PuoB
 ThSpW7oEQasvyV9XlSgwyNlwmzaoMPSlxP/PP74nK3P+dNoqBKR4tlk9Q8VcA9WbTwBz
 oFLsEBRdTh6zwPnf5qxnxEBdGecP743w8M525kgyABVGIfWWK9jHh+eTa6UNv66AeSLF
 NyWA==
X-Gm-Message-State: ANoB5pmFFdLgYY2fI2z1ILrrL/HhisJSxqynPv8K9DAFaePE203tlnyO
 dOAhCEIxjj3EBD/WofF5ucErdd0Ub3G40FPS8iBPnubZ/R1SSXpD2FwWapldKgsmKnDs2ldjEgu
 92Ftcy0PXPPEx3dQJmuuSZdM=
X-Received: by 2002:a17:907:2137:b0:7c1:9041:8c5 with SMTP id
 qo23-20020a170907213700b007c1904108c5mr5712990ejb.41.1671032468690; 
 Wed, 14 Dec 2022 07:41:08 -0800 (PST)
X-Google-Smtp-Source: AA0mqf50Yg1t+/0rBr+e+/ZnJM3sz1HziqrJ0rW9vdRAPMksDUv4cZG97eQGNn9vZPLbhZPznnhJYA==
X-Received: by 2002:a17:907:2137:b0:7c1:9041:8c5 with SMTP id
 qo23-20020a170907213700b007c1904108c5mr5712971ejb.41.1671032468479; 
 Wed, 14 Dec 2022 07:41:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 lu19-20020a170906fad300b007c0cbdfba04sm5914743ejb.70.2022.12.14.07.41.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Dec 2022 07:41:07 -0800 (PST)
Message-ID: <725e80d6-73ab-d760-d49d-7cbc42dd442d@redhat.com>
Date: Wed, 14 Dec 2022 16:41:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] Add HP Stream 8 to bytcr_rt5640.c
To: Moises Cardona <moisesmcardona@gmail.com>, cezary.rojewski@intel.com
References: <20221214120830.1572474-1-moisesmcardona@gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221214120830.1572474-1-moisesmcardona@gmail.com>
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

Hi,

On 12/14/22 13:08, Moises Cardona wrote:
> The bytcr_rt5640.c file already supports the HP Stream 7.
> 
> The HP Stream 8 is almost identical in terms of the hardware
> with the exception of it having stereo speakers, a SIM
> card slot and the obvious size difference.
> 
> 
> Signed-off-by Moises Cardona <moisesmcardona@gmail.com>

Thanks, this new version (which should have been marked as v2)
looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> 
> ---
>  sound/soc/intel/boards/bytcr_rt5640.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index fb9d9e271845..569d039d680b 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -796,6 +796,16 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>  					BYT_RT5640_SSP0_AIF1 |
>  					BYT_RT5640_MCLK_EN),
>  	},
> +	{	/* HP Stream 8 */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "HP Stream 8 Tablet"),
> +		},
> +		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
> +					BYT_RT5640_JD_NOT_INV |
> +					BYT_RT5640_SSP0_AIF1 |
> +					BYT_RT5640_MCLK_EN),
> +	},
>  	{	/* I.T.Works TW891 */
>  		.matches = {
>  			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "To be filled by O.E.M."),

