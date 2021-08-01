Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FED03DCB1B
	for <lists+alsa-devel@lfdr.de>; Sun,  1 Aug 2021 12:29:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B65D41898;
	Sun,  1 Aug 2021 12:28:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B65D41898
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1627813749;
	bh=wTYs8EJ69Vj1m1KHMV35DrcjzJcAZkm6nAGn90Jf7cE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AcE52rJ0VVZI+4tHsniefMHocJ5H0bo/h7zLRO9sINvUrx18bKxfU7+OG5G2OIWay
	 O44CTJElhVZSimEMSDHiSSweSmSrvX0otHHD42+I0v0ncIyf1LoK7Yq7giwovvvcWH
	 I9UUyjcA7I0REA4ro0aeDlOYFlvxyZcEG4Xy5pqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BC592F80095;
	Sun,  1 Aug 2021 12:27:41 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A229DF802E8; Sun,  1 Aug 2021 12:27:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0FBFFF80095
 for <alsa-devel@alsa-project.org>; Sun,  1 Aug 2021 12:27:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0FBFFF80095
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="N5LOCnFk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627813652;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RyKCHi2t7GKtEV19cLCaxDgwiG0IZbXlUkipNRRHrMs=;
 b=N5LOCnFkfNp6XvWphwIlsLGEtHwL1UEd1yxV5juW+qeZ3RAu/jmgF9YQuZxaBDYga8NKko
 4xIzSlT+e0dCqia20OLDw0Eclx0iL7niQd7odHCG9dQMCGJHr+sY410B7EozopS50rD3SL
 bjHc5/YMte5ptbF/X4aHpZ3Qc6jYIqI=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-rVH4ZKvwOiu0FAu7I6RzbQ-1; Sun, 01 Aug 2021 06:27:31 -0400
X-MC-Unique: rVH4ZKvwOiu0FAu7I6RzbQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 o90-20020a5093e30000b02903bb95130460so7117905eda.0
 for <alsa-devel@alsa-project.org>; Sun, 01 Aug 2021 03:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RyKCHi2t7GKtEV19cLCaxDgwiG0IZbXlUkipNRRHrMs=;
 b=jVK/PtJfrBeuXg2ustvBQz5bNz3PulffbRDL6hUr/kEF3WUzxWFSkmCZWutlXUMz+Q
 YcyLHhIvOqVaI5chix85MLmRf1mMmdxxTVPuoMDOukIAT0RLJqeUiQnBPisfxVEdhgum
 WP2qj+TuBMbxg8tI5nr/3mshaxlfrvqCbze1RTO0rbnM0VzUMe+TP6zgV2u8upU62PL3
 JKe32dzS5SkI/LVbE0ZhjSdeP/B2eMLR7AkpuAztCL7m2kEpqUUc95LCQCE+5Fu2CHtV
 NCDL6mRO0mlt1luA/CYD6SeJ9glVlIvQgBquqqfMoitdveuoU0m9MMOOnJnV3nMq8B7w
 M7Bg==
X-Gm-Message-State: AOAM533nrr8pLdBO1LULsArOt36TmgdfH7RjVxM89wtFQEKZTpDmunUt
 B6SdYi39KiUoIXjuBV9qP7wyRpwKhFhTk538zPmImlTrWR2oOietCNErC490n4XwlUJuQY67Tes
 dvqY4z6rBExPNvjgLu57IMnwwTIzgftVzwyxRXWcRjZj/6GdqAHk5Cv3cf/9zBhKdkzw8UvX+MM
 Q=
X-Received: by 2002:a17:906:7191:: with SMTP id
 h17mr11006234ejk.330.1627813650134; 
 Sun, 01 Aug 2021 03:27:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf4/aCYBMOy8CNfS9Cu/hXSHFLutCQdb3Ykk/Q/jzIJz8MKeK9ZuFwi4fPBrjS/KgtSydiog==
X-Received: by 2002:a17:906:7191:: with SMTP id
 h17mr11006224ejk.330.1627813649996; 
 Sun, 01 Aug 2021 03:27:29 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
 by smtp.gmail.com with ESMTPSA id g8sm3831666edw.89.2021.08.01.03.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 01 Aug 2021 03:27:29 -0700 (PDT)
Subject: Re: [5.14 regression] "ALSA: core: Add continuous and vmalloc mmap
 ops" breaks Intel SST audio
To: Takashi Iwai <tiwai@suse.de>
References: <8d6674da-7d7b-803e-acc9-7de6cb1223fa@redhat.com>
 <s5h35ru7vkz.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <146ba2f9-448d-7268-a197-baab618ce2e8@redhat.com>
Date: Sun, 1 Aug 2021 12:27:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <s5h35ru7vkz.wl-tiwai@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On 7/31/21 10:10 AM, Takashi Iwai wrote:
> On Fri, 30 Jul 2021 22:04:00 +0200,
> Hans de Goede wrote:
>>
>> Hi All;,
>>
>> As discussed in the "5.14 regression, Intel SST (BYT) audio no longer works" thread,
>> audio on X86 devices using the Intel SST driver no longer works with 5.14.
>>
>> After poking at this for a while I've found the culprit:
>> 30b7ba6972d5 ("ALSA: core: Add continuous and vmalloc mmap ops")
>>
>> If I revert that single commit then everything works fine again with 5.14.
> 
> Does the patch below fix the problem?

Yes that seems to fix things, thank you.

Regards,

Hans



> ---
> --- a/sound/core/memalloc.c
> +++ b/sound/core/memalloc.c
> @@ -215,7 +215,7 @@ static int snd_dma_continuous_mmap(struct snd_dma_buffer *dmab,
>  				   struct vm_area_struct *area)
>  {
>  	return remap_pfn_range(area, area->vm_start,
> -			       dmab->addr >> PAGE_SHIFT,
> +			       page_to_pfn(virt_to_page(dmab->area)),
>  			       area->vm_end - area->vm_start,
>  			       area->vm_page_prot);
>  }
> 

