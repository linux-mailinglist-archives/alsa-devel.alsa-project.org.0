Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1803928B1A4
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 11:32:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B8B521699;
	Mon, 12 Oct 2020 11:31:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B8B521699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602495159;
	bh=n2X+0TeH/c/81kugO19rzUsSg1o9V7vFDPhVemlbzok=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GdwUzDdNlkTLvamD6FtS6m0cWSQ6ZPRwXXfQgvSY8CWpBmLd3IONCTYb2MmLZZWzk
	 omEWJ+GdJnxuQVTEbvKHYmvdAoyRVIG9imUjjaa7pEx6raOzA6Ap+lg1m9De0zS9Qc
	 xL5VUzK/ZSDIseWGY63rFW8/fY0+juqYUmXr1kc0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A884F8021D;
	Mon, 12 Oct 2020 11:30:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0170FF80217; Mon, 12 Oct 2020 11:30:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_65,RCVD_IN_MSPIKE_H5,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 677E2F800F6
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 11:30:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 677E2F800F6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="Ub8s1jWl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602495049;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zhBwrBANqi2gs4mhiwFcWulFL6nZhFilBFwPEE6tG6s=;
 b=Ub8s1jWlNp/NqbJ0C1VgZTgk9qnu1dWfEctqomLaOMFZXF1aKVfV0ccMDQSTa4bAlc0rG7
 ZeGho861bEQWfHo5WziuXuOahhaYZQSKgEun99I+4qyiGSpBcNjeLaGlFvzrPCFTm++zF6
 gqvzEdFod1YanFgTNFqg/fft/fGBc+8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-T8uhoqEQOXyjmgRVae-O3g-1; Mon, 12 Oct 2020 05:30:46 -0400
X-MC-Unique: T8uhoqEQOXyjmgRVae-O3g-1
Received: by mail-ej1-f71.google.com with SMTP id j2so6078128ejm.18
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 02:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zhBwrBANqi2gs4mhiwFcWulFL6nZhFilBFwPEE6tG6s=;
 b=owSLQ23MZBKfHFminPYXIRzhmqAq07rQEVxXArK3ZOnNO4PtuBgtcmaDrkkCLmsdYL
 00g9sAJRvSCwM+J/dHU4IaNxSSYld2HtE3ROnEm4Xp4iEmYh84b0sxHMkkS+u7AkODNz
 PxGERwD0SCE4K8gsLi1Zp6RAH00VldpLkz8h1ThThKoIrFWvtjUxgBe9oF6OvBjwKHc4
 jX2+7tfiSwEXJJ33OUaN5KR64Qn+FpwlM/F49G3zAkDBfP0eM/LYR8L21gb8Nq84qVvO
 kZvMNORui1GuGhvV/h+QMu72SHtqd2f5Ine7gAow/oTR7tLqHBlf4PWg5KpvtM6h9klr
 up3Q==
X-Gm-Message-State: AOAM532UUNeGkj2n/PZnrEOq4WRjvHbdvh6uVsciTvhaZ5fXxWhS7Ua9
 PUhMNiSUs/HRVu2gLq1SRxIKOeVoGUBpRYAvoyjjtdJ+wWYVkwSUvMk74B0V4JxGGQYE11awUzB
 3dhExAMXl30q1uTGILjsTT4I=
X-Received: by 2002:a17:906:9941:: with SMTP id
 zm1mr1810689ejb.337.1602495045296; 
 Mon, 12 Oct 2020 02:30:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTXmZYfQlvN4meSZ0m602SO69e5cB06kVqE+EONmKrFeNpykIuSnI9/z8NAbXJD6F2LQ4dMw==
X-Received: by 2002:a17:906:9941:: with SMTP id
 zm1mr1810669ejb.337.1602495045059; 
 Mon, 12 Oct 2020 02:30:45 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id dm8sm10257396edb.57.2020.10.12.02.30.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 02:30:44 -0700 (PDT)
Subject: Re: [PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and
 components
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20201006064907.16277-1-cezary.rojewski@intel.com>
 <cf1fb47d-412f-48fd-4501-e63f1db32bc1@redhat.com>
 <d64473eb74bb4428a25f9c7903e295e5@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <410bd0d7-348a-4016-683f-6fce78aa3046@redhat.com>
Date: Mon, 12 Oct 2020 11:30:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d64473eb74bb4428a25f9c7903e295e5@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "Hejmowski, Krzysztof" <krzysztof.hejmowski@intel.com>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "ppapierkowski@habana.ai" <ppapierkowski@habana.ai>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "pierre-louis.bossart@linux.intel.com" <pierre-louis.bossart@linux.intel.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "Proborszcz,
 Filip" <filip.proborszcz@intel.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

HI,

On 10/12/20 11:24 AM, Rojewski, Cezary wrote:
> On 2020-10-12 10:26 AM, Hans de Goede wrote:
>> Hi,
>>
>> On 10/6/20 8:48 AM, Cezary Rojewski wrote:

<snip>

> Hello Hans,
> 
> Thanks for your help during maintenance of BYT & CHT products.
> Agreed, will Cc you in future series for listed devices.

Great, thank you.

>> FWIW (since that this is already merged) I'm fine with removing the
>> quite old Bay Trail support from common/sst-acpi.c, at least Fedora
>> has been using the medium-old (with SOF being the new thing)
>> CONFIG_SND_SST_IPC_ACPI support for Bay Trail audio support for
>> quite some time now.
>>
> 
> Please note CONFIG_SND_SST_IPC_ACPI is targeting /atom/ solution, not
> the /baytrail/ one (see the /atom/sst/Makefile). Fact that is has been
> used within /common/sst-acpi.c is a developer's mistake probably caused
> by generic naming of mentioned kconfig.
> 
> I'll send a patch today somewhat addressing this inconsistency.

Ok.

>> This is not just about Bay Trail And Cherry Trail devices though,
>> this series also makes changes impacting Haswell and Broadwell devices.
>>
>> The commit removing this support claims that at least for Haswell the
>> new sound/soc/intel/catpt replaces it, but I do not see that code in
>> 5.9, so that means that in one cycle we are both introducing the
>> replacement and dropping the old code ?  I'm not sure if that is such
>> a great idea, what is the fallback plan if testing does find significant
>> issues with the new catpt code ?
>>
>> Anyways since AFAIK this series is already in next I guess we will
>> find out how this goes.
>>
> 
> Your report about this series being merged to v5.9 is worrying. It is
> not supposed to be there as catpt-series is its direct dependency. Cover
> letter for the latter mentions that explicitly while this series starts
> with "Follow up to catpt series".

Sorry for causing a misunderstanding, this series is not merged for
5.9, AFAICT it is queued up for 5.10. What I was trying to say is that
the new catpt code is also NOT in 5.9.  So 5.9 will both get the
replacement catpt code and drop the old sst-acpi support for Broadwell /
Haswell in a single cycle.

<snip>

> Given the work that has been done behind the scenes, I'd argue hsw/bdw
> has never been in the better place than it is today - that goes for
> both, Linux and Windows solutions as both worlds took part in this
> project. Code rewritten, actual CI running, several setups in racks,
> documentation refreshed, FW + SW windows again on thier legs and so on.

Ok, sounds good, hopefully thing will work out fine for HSW/BDW in 5.10
then.

Regards,

Hans

