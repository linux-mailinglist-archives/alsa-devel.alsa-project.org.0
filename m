Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 431603F7805
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Aug 2021 17:08:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BB00F167B;
	Wed, 25 Aug 2021 17:08:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BB00F167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629904131;
	bh=VvN3p1x82sJN6ciE2MVAz2pR9UcPovK7pzX6wQ32G3o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wo/XedIxgk0JOuChSWSs4JhVmq5pwoo+8W43fwL+RW/fLAfZMk6RNyxhfH+1ts8BS
	 UUSa4N7Y5mNzlbPyDSrehM3/PyN9MLxpuvNNp02/Pg2f5h4WPV85c6F87SaYpLaW5I
	 iD1RGWbMGArzwkAchBSdG4smzsQRR8S2WGf/c3is=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0FD27F8020D;
	Wed, 25 Aug 2021 17:07:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6EBC4F8020C; Wed, 25 Aug 2021 17:07:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 987FBF800AE
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 17:07:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 987FBF800AE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="h0+/DrrI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629904038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h/3CbWOgv+EOmqelt7GVpuaqByU3P7F9xcIdRy7aexI=;
 b=h0+/DrrIggvK41cbylofRrD5Wf4Uy4peTgPY4GgeihwSOC4G6jgTcHS7yGqS5Cd+KVgFpX
 OC2fFG1RUoDB8ap8MUtdYzi3Ozvr5xzRFuyGpe28hhS9a0qCP75v2wWhi0C7QHwc10NQHq
 ZjCu97GrVqtPehzhAVExPtgRBY/bDek=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-554-ws8aFALQPdWPndkj_5GW9g-1; Wed, 25 Aug 2021 11:07:17 -0400
X-MC-Unique: ws8aFALQPdWPndkj_5GW9g-1
Received: by mail-ed1-f72.google.com with SMTP id
 e18-20020a0564020892b02903be9702d63eso3791036edy.17
 for <alsa-devel@alsa-project.org>; Wed, 25 Aug 2021 08:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h/3CbWOgv+EOmqelt7GVpuaqByU3P7F9xcIdRy7aexI=;
 b=h44qnLnBlWIszD35F5aU858TFSPC2JSkLhuA2wlRJPfDE8WCfVa4d3WoWvB/o/RYX8
 x2DhZUANIbnQU7qcppPLHOs/KBjMzMWBDk+STxPdVb7SwAjqOXcHJEe4ARZa4LCO+PjG
 Oq1lD50lXjmZcgGDVJFTis2G+SUkDt/L7pShXQysxF4qZJCNWd9o/+SNT2MH3pwzvoxZ
 qTyCvOet+QfiA6BnJ+azFtdTy+m1tDehHXAf6E9s4aLxjCae/idCEUJU2t34yu7aBggv
 +UDrAK9Sw+0fnzyAfocNNKdgMNHBRI7muylaTfhAXWnLZMCnx0jROifBdYMDBAPDiqjl
 73Sg==
X-Gm-Message-State: AOAM531XSD8cnISPhFf1d2Qq+xxdjFV1LItdRrbTEg0R3E1hjRKEfLE4
 szYp68Q/szBVfTK/zOEBf8P5cuS7Qpc1PQ+lKbVu4D4XnkZvTbjuxHjKSvXEo0t/0v0KY46Z9y0
 BB/DRn6/XQyrHOKZj107oF1AZIfTx/TemNb0G6TK/mcddf3BCn/k07vXzw3vXRvKSRNPj4JkfNX
 M=
X-Received: by 2002:a17:906:7256:: with SMTP id
 n22mr46189740ejk.173.1629904035738; 
 Wed, 25 Aug 2021 08:07:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVJZK3i4o59VL4FzCFM7dzTwa/sf94V18PHOecBZloflumQ65W0d2j/3rnNxwkd1Rrjb/0jg==
X-Received: by 2002:a17:906:7256:: with SMTP id
 n22mr46189707ejk.173.1629904035334; 
 Wed, 25 Aug 2021 08:07:15 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id f26sm139123eds.90.2021.08.25.08.07.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Aug 2021 08:07:14 -0700 (PDT)
Subject: Re: [PATCH] ASoC: Intel: bytcr_rt5640: Make
 rt5640_jack_gpio/rt5640_jack2_gpio static
To: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, broonie@kernel.org,
 liam.r.girdwood@linux.intel.com, cezary.rojewski@intel.com,
 pierre-louis.bossart@linux.intel.com, yang.jie@linux.intel.com
References: <20210825122519.3364-1-peter.ujfalusi@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <63e4f111-cf7a-ebee-52e1-d8c9f23d097d@redhat.com>
Date: Wed, 25 Aug 2021 17:07:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210825122519.3364-1-peter.ujfalusi@linux.intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

Hi,

On 8/25/21 2:25 PM, Peter Ujfalusi wrote:
> Marking the two jack gpio as static fixes the following Sparse errors:
> sound/soc/intel/boards/bytcr_rt5640.c:468:26: error: symbol 'rt5640_jack_gpio' was not declared. Should it be static?
> sound/soc/intel/boards/bytcr_rt5640.c:475:26: error: symbol 'rt5640_jack2_gpio' was not declared. Should it be static?
> 
> Fixes: 9ba00856686ad ("ASoC: Intel: bytcr_rt5640: Add support for HP Elite Pad 1000G2 jack-detect")
> Signed-off-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  sound/soc/intel/boards/bytcr_rt5640.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
> index 05667a33d919..a6e837290c7d 100644
> --- a/sound/soc/intel/boards/bytcr_rt5640.c
> +++ b/sound/soc/intel/boards/bytcr_rt5640.c
> @@ -465,14 +465,14 @@ static struct snd_soc_jack_pin rt5640_pins2[] = {
>  	},
>  };
>  
> -struct snd_soc_jack_gpio rt5640_jack_gpio = {
> +static struct snd_soc_jack_gpio rt5640_jack_gpio = {
>  	.name = "hp-detect",
>  	.report = SND_JACK_HEADSET,
>  	.invert = true,
>  	.debounce_time = 200,
>  };
>  
> -struct snd_soc_jack_gpio rt5640_jack2_gpio = {
> +static struct snd_soc_jack_gpio rt5640_jack2_gpio = {
>  	.name = "hp2-detect",
>  	.report = SND_JACK_HEADSET,
>  	.invert = true,
> 

