Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3019320D5EF
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Jun 2020 22:04:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BA9EC165E;
	Mon, 29 Jun 2020 22:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BA9EC165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593461058;
	bh=6u+ueu8mwwkztoe91bhc4fSzBYiRYoUmgVRIZTK4GgE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UgMR77IZZi12SMyiUEFnICZJMlbyQhQH4XvMvTYPy6lnVTe1zBi3OO687Q9LSL+As
	 kTCwBGVRbcjayJ7LudRoZI7euURC6BoE81eaEIvb4wzuPgKxTN5KQ13neeJyIB1p/r
	 6+m7lzZ5fhtZIr08fgl6X2uIlXmViWqubBi844Rw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD41DF8020C;
	Mon, 29 Jun 2020 22:02:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 66955F80217; Mon, 29 Jun 2020 22:02:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 09E28F80096
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 22:02:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 09E28F80096
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="RWftICYi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593460949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5P7wbiDWv4UOgMAeguuZyI0w31+W6fKo+gmexo4S+2o=;
 b=RWftICYiCk/c7clD/Zz8rfYIjp+Q7sobST4hD7zvtHgS+VJjkrBbeJuT3423Ru+WWgpHeK
 rUyYZBwfEvPUzSMy0rMmQJSFhxj6y1AE+nLLq6wuPod8/Osu6BpXSFR1DDXaU2OaWpHsNL
 eKziRpWLB6ty16BK9wQbjmRrh48MyIg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-511-9rz8zyZ4Oxm1KYJboPi9ag-1; Mon, 29 Jun 2020 16:02:27 -0400
X-MC-Unique: 9rz8zyZ4Oxm1KYJboPi9ag-1
Received: by mail-ed1-f72.google.com with SMTP id o3so15135734eda.23
 for <alsa-devel@alsa-project.org>; Mon, 29 Jun 2020 13:02:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5P7wbiDWv4UOgMAeguuZyI0w31+W6fKo+gmexo4S+2o=;
 b=bGlqyqwzF/HNwH7v2ZVesApL0dhYNEIv7yEd/GC+IprwHrYNdlqM8wf93xlxpFluXx
 xFs4UU7JbyCEaLhf9Qf9Fg+vxMJWacHxly5loTtpwOEA7geviS5JZhCwWrpdahJ10roR
 QUVoe+GF7Arl8Fv9z9ABiO534C87Zua0CoggDJkpZtxuKY0Uu4DO1wbGYDeIaievcvdE
 eH5a7z2B89AfwVPOHr1L/y9bocRh1HlRBMVK9JXxd3rMoihodGYBEWgWwQI3bdoMoYjg
 MAAkFzbf3Dhv6uHvAgidK43jElOXjdbTPkZZozcR0HP0OcnynaHt9gAD5KrWxyDsk0Yt
 lBLA==
X-Gm-Message-State: AOAM532xol6J0Jg4T717L08PhLkXBfdFRhgdBIyOW8HNpZwPA7ONVWCE
 QSWyPdXGe0FN7DIAlEXaY94g/C3vq0Czo1dcIUKkZLNi+b0PPPqMuWYYHZff1a90xUOfUC4MWn5
 msaBZr4lYVvjiZ58qQN6+QvE=
X-Received: by 2002:a17:906:444e:: with SMTP id
 i14mr3418860ejp.418.1593460945548; 
 Mon, 29 Jun 2020 13:02:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyIA64K/INYDh8m5BujI4jBGSxGILfFvYwyRNawdzOyUkjwKTNSuFlpEFYl3wHSqrQ29MSzog==
X-Received: by 2002:a17:906:444e:: with SMTP id
 i14mr3418836ejp.418.1593460945368; 
 Mon, 29 Jun 2020 13:02:25 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id s7sm614353edr.57.2020.06.29.13.02.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2020 13:02:24 -0700 (PDT)
Subject: Re: ASoC: rt5670/cht_bsw_rt5672: Some bugfixes and cleanups
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Oder Chiou <oder_chiou@realtek.com>
References: <20200628155231.71089-1-hdegoede@redhat.com>
 <2dda2d0a-2aa5-d9a5-d214-6ab0259de43c@linux.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <b93be4cd-0d32-4bc0-d3f8-4f8a22996469@redhat.com>
Date: Mon, 29 Jun 2020 22:02:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <2dda2d0a-2aa5-d9a5-d214-6ab0259de43c@linux.intel.com>
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

Hi,

On 6/29/20 5:14 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 6/28/20 10:52 AM, Hans de Goede wrote:
>> Hi All,
>>
>> This series is mainly the result of me working on fixing the extra
>> set of speakers in the Lenovo Miix 2 10 kbd dock not working with
>> Linux (patches 1 and 3) while working on this I noticed some other
>> bugs (patches 2 and 4) and I also ended up doing some generic
>> cleanups (patches 5 and 6). For patches 1-3 or 1-4 it would be
>> nice it they can go to a future 5.8-rc# 5-6 are mostly -next
>> material.
> 
> I added a minor comment on patch 1 but is a good set of changes, thanks Hans!

Since Mark has already merged this, I believe it is best to keep
patch 1 as is, still thank you for the clarification of what is
going on.

> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

And thank you for the review; and Mark thank you for merging these.

Regards,

Hans

