Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ADA21F2C3
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 15:35:58 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0626215F9;
	Tue, 14 Jul 2020 15:35:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0626215F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594733758;
	bh=l7u0mlhqJOkekNbOxiSk6mfHz6SDAm/bLkFyE5oYGIE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e4SESu6GLtMGKV+siMDZu8jr0aOP+XGGe20UNirZXh00fo7OsK4id3RLO6xR/7WJy
	 eCHCJeiLFeIXx2RU+sf5WPZeRFhFB1v4j7TkWC97jYRt6XJVahLqFVPm/UvC/8Xj0c
	 vyNy1EAtP4w/4CjxzYB0hwJX/Ikh/UF9ZsAUXGyA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2D880F801EC;
	Tue, 14 Jul 2020 15:34:17 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D53E2F8019B; Tue, 14 Jul 2020 15:34:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [207.211.31.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6625BF8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 15:34:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6625BF8014E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="iYPkFdVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594733642;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nbYxWd2D4nHUUgDPltXRuvjC0SSKlTNEhd9CP0YMbwc=;
 b=iYPkFdVNZY4xcHPe4g3E+JLcLBNJW6yClvPAgKktSIPMR5rCQLetk0g+Tw1gCpU9PMGjvM
 Y6Gjl1ZZpY7ZSM+nFUIMPO0PnpUgw+Oy7Z8lU7Uo9vvE+A9I0df+8k+EKxGlPtBGnmo9R/
 4S6PV7RG1giS9bQ+I/RCbrOF/7+JJaI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-305-d3m34hSEMXqueHwpuXD8ww-1; Tue, 14 Jul 2020 09:34:01 -0400
X-MC-Unique: d3m34hSEMXqueHwpuXD8ww-1
Received: by mail-wr1-f71.google.com with SMTP id y13so21721173wrp.13
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 06:34:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nbYxWd2D4nHUUgDPltXRuvjC0SSKlTNEhd9CP0YMbwc=;
 b=X/umyhvSJNDvwsufHpb7aKJVX1NL/dADaTg0gaphsZsJPhc1ue4vcuelLhEaSCIzgi
 9rpXNIqmStn9F45a4pSpPPULLdO4a9M59/tbQVcz2TQ9vAiRP4V/wsDMQaAOmZ92GDBw
 I2eRRVXxR2LiI6HS10rxYBfqBWhN5D6WWLsqM8bkugGJfFILQUUMLOwxx8Id2l816Rwb
 PiDB4UMgmHYWi9l+l//loZs5pFIsfGy7LaI/BA54KlcxRzRZZwbAyeBfy/eZRyZNF6jA
 t4FPy0f48VE0RCh3FR29PoEEL7mXoSfWO/DYsM3m2mgjz2iuyYAFWpkLDBMR50Uit5Fx
 KZaA==
X-Gm-Message-State: AOAM530OjaEXdJud3Gme7Vp6/mbyCkVn7UiyPslng53qtnXHUBD5whBd
 o4Efm+IS4C6EiLPj1RSJh9DNj96Oy6z8l2kJPcEE3Jvqnt4NO/0MRT7UtNZv1gZXx/DswZQKhxY
 aMPycuPv9pOpsLMNktRQhIpM=
X-Received: by 2002:a7b:c116:: with SMTP id w22mr4413270wmi.97.1594733639996; 
 Tue, 14 Jul 2020 06:33:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRuMChFkvfKKE/w1wbHZHIs87aQfuy0IINKhNsGaCWeLr1sl5q3sbqOzLFhiAFarAar7Nyng==
X-Received: by 2002:a7b:c116:: with SMTP id w22mr4413259wmi.97.1594733639844; 
 Tue, 14 Jul 2020 06:33:59 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id m4sm4270892wmi.48.2020.07.14.06.33.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jul 2020 06:33:59 -0700 (PDT)
Subject: Re: [PATCH] ASoC: Intel: bytcht_es8316: Add missed put_device()
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, liam.r.girdwood@linux.intel.com,
 yang.jie@linux.intel.com, broonie@kernel.org, perex@perex.cz,
 tiwai@suse.com, kuninori.morimoto.gx@renesas.com, paul@crapouillou.net
References: <20200714080918.148196-1-jingxiangfeng@huawei.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <25abce87-5572-a78a-f001-7776f07be4ac@redhat.com>
Date: Tue, 14 Jul 2020 15:33:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200714080918.148196-1-jingxiangfeng@huawei.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
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

Hi,

On 7/14/20 10:09 AM, Jing Xiangfeng wrote:
> snd_byt_cht_es8316_mc_probe() misses to call put_device() in an error
> path. Add the missed function call to fix it.
> 
> Fixes: ba49cf6f8e4a ("ASoC: Intel: bytcht_es8316: Add quirk for inverted jack detect")
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   sound/soc/intel/boards/bytcht_es8316.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
> index 9e5fc9430628..ecbc58e8a37f 100644
> --- a/sound/soc/intel/boards/bytcht_es8316.c
> +++ b/sound/soc/intel/boards/bytcht_es8316.c
> @@ -543,8 +543,10 @@ static int snd_byt_cht_es8316_mc_probe(struct platform_device *pdev)
>   
>   	if (cnt) {
>   		ret = device_add_properties(codec_dev, props);
> -		if (ret)
> +		if (ret) {
> +			put_device(codec_dev);
>   			return ret;
> +		}
>   	}
>   
>   	devm_acpi_dev_add_driver_gpios(codec_dev, byt_cht_es8316_gpios);
> 

