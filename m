Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ED467A630C
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 09:49:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C2BD167B;
	Tue,  3 Sep 2019 09:48:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C2BD167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567496961;
	bh=QPa80ocvFuP+GbESUDKhkBJcv1ERujiyNr9b+peV0gg=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=edfClCb6Fo6w6YZbNUsodZ0czFSSGA5eBm8Grs+HrEHJtKjHKuMZJspnYKSodtba8
	 d1ZfP0cMZRt4y632gDypi8+ZUoMoRAv2L6Xb9XPeJttRZxW9hJFGyjYfbE+9MLLFaC
	 MrgS+E3+eAnWW2bU8T1K9FzmDYRWDW2L5a20+VhY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7C02FF8045F;
	Tue,  3 Sep 2019 09:47:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2C75F8045F; Tue,  3 Sep 2019 09:47:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 78276F80392
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 09:47:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 78276F80392
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1DCD03DE04
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 07:47:27 +0000 (UTC)
Received: by mail-ed1-f69.google.com with SMTP id x40so10042314edm.4
 for <alsa-devel@alsa-project.org>; Tue, 03 Sep 2019 00:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=nToouos/ozr0DRHz/vRlgqcFjK+SaZJGZA6PyxDTHMU=;
 b=IG9q+7/aZggdFVeAXi9duQvgn0ZChVixmyoRhFXTrGxTRYmGLlVKtCNpiKflfBtUVQ
 b/ltcZAp3ySu3aKGK3kZGd/6yy97Tzzz+0USNvxMQmu9OX2VyOHdSo/FwzcyuYx1Q9li
 BsoCz69mLa4hpD2j7Tayx7G0mus24hkIUXqE1KP1fV3TOeesiw2JxwH1k61fzzsqxQ/k
 VlhGx6cKtYmwKtOQ824eqYJk6dYTpKxce2OO/4lOAU8//hFcvE9arFdtomlu9CD70VN/
 K5joYpDkxv8ODUElrJSTDRvxwZaZQbEZTnjUz1AuDUg2/zMBnxkG6ii6K+KIUAMqfKdG
 Batg==
X-Gm-Message-State: APjAAAWXivACt+U2K3FCIstHIV4Bg+Y7RUNzw4jAjLopoZDas920F1kb
 dW5z4Q4OvwB3rsAb6euPcAMvYOQvPiKIrYphSPI4BAuOua6iLo8yt1F6oCaZnJdh53cjZdbzfLn
 nUoUlVDyDB71a8yFNANURQtM=
X-Received: by 2002:a05:6402:644:: with SMTP id
 u4mr34576096edx.176.1567496845893; 
 Tue, 03 Sep 2019 00:47:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyEsD3TOBCDHd28jJNnKpZ4Rpm8J0qxTFZIA6wSXLtiaYMUCsARF3yaPKIbzIEeFNxZiUGcog==
X-Received: by 2002:a05:6402:644:: with SMTP id
 u4mr34576090edx.176.1567496845737; 
 Tue, 03 Sep 2019 00:47:25 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl.
 [84.106.84.65])
 by smtp.gmail.com with ESMTPSA id dd17sm1395640ejb.61.2019.09.03.00.47.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Sep 2019 00:47:25 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <20190831145842.32990-1-hdegoede@redhat.com>
 <s5hef0zjhw5.wl-tiwai@suse.de>
 <99a375b4-f6e9-ef5e-6f24-9e76db44b2e8@redhat.com>
 <s5hpnkiww75.wl-tiwai@suse.de>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <57014241-1364-222b-ac48-b44023425b84@redhat.com>
Date: Tue, 3 Sep 2019 09:47:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <s5hpnkiww75.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/2] conf/ucm: Add UCM profile for
 cht-bsw-rt5672 boards
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Hi,

On 02-09-19 17:32, Takashi Iwai wrote:
> On Mon, 02 Sep 2019 10:31:30 +0200,
> Hans de Goede wrote:
>>
>> Hi Takashi,
>>
>> On 02-09-19 09:07, Takashi Iwai wrote:
>>> On Sat, 31 Aug 2019 16:58:41 +0200,
>>> Hans de Goede wrote:
>>>>
>>>> Add an UCM profile for Intel boards with a RT5672 codec.
>>>>
>>>> Re-use the existing platform enable and disable sequences for BYT/CHT SST
>>>> support and add a codecs/rt5672 dir with codec specific enable / disable
>>>> sequences for the various inputs and outputs.
>>>>
>>>> This is partly based on earlier work done here:
>>>> https://github.com/plbossart/UCM/tree/master/cht-bsw-rt5672
>>>>
>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>
>>> We've recently set up a new alsa-ucm-conf repo for keeping UCM
>>> profiles outside alsa-lib repo.  The new repo has a different license
>>> (BSD3-Clause) for easily adapting to OSes with license restriction.
>>>
>>> I guess we should put the stuff there from now on, as much as
>>> possible?  The handling of UCM profile is currently pending, and we
>>> need to decide the general policy, as well as how to transfer the
>>> existing profiles to the new repo...
>>
>> I think it is good that we now have a separate repo and I'm fine
>> with re-licensing all my UCM profile work under a BSD3-Clause license.
>>
>> But I believe that until we have actually figured out how this is
>> all going to work and we are actually doing releases from the
>> new alsa-ucm-conf repo, we should keep adding new profiles to
>> alsa-lib for now, because these profiles are necessary for things
>> to work OOTB for our end users.
> 
> Well, putting to both repos isn't a good idea from the packaging POV,
> either.  If we're going to release the alsa-ucm-conf sooner or later
> together with the next alsa-lib release, we can put into the new repo
> from the beginning.

Well, we want to move some of the other UCM profiles over too, right?
(I guess eventually we want to move all of them over)

So we are going to have this duplicate profile problem anyways.

I was thinking of adding a --without-duplicate-ucm-profiles option
to alsa-lib's ./configure which when used disables installation of UCM
profiles which have a copy in the new alsa-ucm-conf.

This will give use a transition period, where distros can choose to either
use alsa-lib with --without-duplicate-ucm-profiles + the new alsa-ucm-conf,
or just use alsa-lib as they have before. Note the idea is for this to
be temporary, eventually the profiles which are "disabled" by
--without-duplicate-ucm-profiles can be dropped and the option removed.

OTOH if you plan to make sure that the next alsa-lib release is done
in sync with the first alsa-ucm-conf release and you plan to move the
UCM profiles which can be moved (licensing) before that, giving us a clean
break, then that is fine too.

Regards,

Hans

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
