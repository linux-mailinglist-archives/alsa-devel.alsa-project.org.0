Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F4D19EBE6
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Apr 2020 16:10:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7137B1679;
	Sun,  5 Apr 2020 16:09:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7137B1679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586095838;
	bh=SBALdLamNvh8Ua11yFxr0k4eXPGd5U6huzuoDm7eMuM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=hXnrq4D8Ja5c+6lifnCNQh7bKb11QFKTtq8sqHZG7tNfav9ab9tEtS6AYGuX65FUy
	 qn7ghaIXXXOefuRiGet4YLbudDSdpFEBAU79/a8StVBfofd1C/jTySd5uWv5hbAwu8
	 Rdr2XYxMXryxpyjmgOVf3+ugwnyzBf9vKY/uLC1Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9275CF800E4;
	Sun,  5 Apr 2020 16:08:57 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 17F7EF801D8; Sun,  5 Apr 2020 16:08:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 39398F800E4
 for <alsa-devel@alsa-project.org>; Sun,  5 Apr 2020 16:08:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 39398F800E4
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="E9lS+3d6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586095730;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NOL6AllFf+Sqds6htU3Dltt1W6GlRwiczwdWO7kpU9w=;
 b=E9lS+3d6l5Kr+KPeUdVov1+hLm973ZXN8pUq5yZFAPHDWkW1WWROgRINz+CY1j7eRfW/ZO
 UrzESa0Pe1moUhk5y4KXqWeibRhZIqSxsZUXRdWJQiwqRfRMGgLiqjxQbwg2W7wZRUUAgF
 sCoBSTCruS3oJHSeZ4T+2Oczkl/Qr6U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-344-Ye3nmSfdM7qMA7BvdcEEAA-1; Sun, 05 Apr 2020 10:08:49 -0400
X-MC-Unique: Ye3nmSfdM7qMA7BvdcEEAA-1
Received: by mail-wr1-f70.google.com with SMTP id h95so6456263wrh.11
 for <alsa-devel@alsa-project.org>; Sun, 05 Apr 2020 07:08:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NOL6AllFf+Sqds6htU3Dltt1W6GlRwiczwdWO7kpU9w=;
 b=Yo6dk3qctrDPewZzdN8CeLCWQPPnh3R3xoq4ZrmmTWYoBqtNqAEnm6646TFD5fTbpC
 FSNC5fcl6xvy5xk5kblqys5jX2maZ7YkdvHx9KXiHABOpgcS7POHJO1HsXcyI1P74nNq
 q8aGpuJLt4FZEZlKI46r8bbDSIm3HmpjVEGQ6HvqtCZVNAaS/q31BZMTbaNw5zw5n+I4
 fmTHSJMlHV6+KQ6/wGXs4ucRqAXNRgeZOTNg2Q5Vr8u3QKjFmD0khKQNlUF77FRanVXq
 j0F7Ll1o84d3ZlkAE4BnAzBfY09jQaSpiLaWIcv6TLz+4QsvJWV3+zxmOE74e7S2t4s6
 beyg==
X-Gm-Message-State: AGi0PuZ57ToS5iW+4DoQkwklN24lcC6uJC1XIwNJMTtU/ZAt/RZesCXL
 3oaz9e+yyInxyibitzMkoVva1+Wy8M2BYqOKc2KBM4bFGJOZy2JD4c6VVjbQphE5/a4/HPznnzl
 d8grDWhw/lN3l7jl9B+iG/lI=
X-Received: by 2002:a5d:6102:: with SMTP id v2mr13343372wrt.298.1586095727753; 
 Sun, 05 Apr 2020 07:08:47 -0700 (PDT)
X-Google-Smtp-Source: APiQypJ6tZtbwsKijWTVlIDel5HLlAfQwVF9cwrsbnqYuN9kIvB28YjwTx6keO45Im2DnghmxeDVZw==
X-Received: by 2002:a5d:6102:: with SMTP id v2mr13343358wrt.298.1586095727516; 
 Sun, 05 Apr 2020 07:08:47 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id z16sm5885001wrg.66.2020.04.05.07.08.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Apr 2020 07:08:46 -0700 (PDT)
Subject: Re: [PATCH v3] ASoC: Intel: bytcr_rt5640: Add quirk for MPMAN
 MPWIN895CL tablet
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 flove@realtek.com, shumingf@realtek.com, Oder Chiou <oder_chiou@realtek.com>
References: <20200405133726.24154-1-hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <6c21ad5b-6664-f478-29df-7273a19a3d0c@redhat.com>
Date: Sun, 5 Apr 2020 16:08:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200405133726.24154-1-hdegoede@redhat.com>
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

Note the v3 in the Subject is my bad, this is the first version / v1 of this patch.

Regards,

Hans

On 4/5/20 3:37 PM, Hans de Goede wrote:
> The MPMAN MPWIN895CL tablet almost fully works with out default settings.
> The only problem is that it has only 1 speaker so any sounds only playing
> on the right channel get lost.
> 
> Add a quirk for this model using the default settings + MONO_SPEAKER.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>   sound/soc/intel/boards/bytcr_rt5640.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 6bd9ae813be2..d14d5f7db168 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -591,6 +591,17 @@ static const struct dmi_system_id byt_rt5640_quirk_table[] = {
>   					BYT_RT5640_SSP0_AIF1 |
>   					BYT_RT5640_MCLK_EN),
>   	},
> +	{
> +		/* MPMAN MPWIN895CL */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "MPMAN"),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "MPWIN8900CL"),
> +		},
> +		.driver_data = (void *)(BYTCR_INPUT_DEFAULTS |
> +					BYT_RT5640_MONO_SPEAKER |
> +					BYT_RT5640_SSP0_AIF1 |
> +					BYT_RT5640_MCLK_EN),
> +	},
>   	{	/* MSI S100 tablet */
>   		.matches = {
>   			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Micro-Star International Co., Ltd."),
> 

