Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EB2C30F195
	for <lists+alsa-devel@lfdr.de>; Thu,  4 Feb 2021 12:09:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A6F01709;
	Thu,  4 Feb 2021 12:08:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A6F01709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612436972;
	bh=yiWpMG5b3x/4mjRKDSDjAB/B4Ih7X8u0secJF2pw0fU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pAd0BJnGbvFfYHJiQBROB6AcukywQ7Jg5WiwMBktdPBaZZxh3Vrmz9goTrW+eg3JX
	 sSOe4o4j96iVcZMqOWltZMtFFH4A4hYwDbcTNZA9pugLdaRy7hfEHf3h54krd4r7WC
	 Qvf4+p33qrABB9A3NhYLd3ow5ht9lp7EqC2QtFhM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8D9ECF801F7;
	Thu,  4 Feb 2021 12:07:59 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 800F1F80171; Thu,  4 Feb 2021 12:07:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABC4BF80154
 for <alsa-devel@alsa-project.org>; Thu,  4 Feb 2021 12:07:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABC4BF80154
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="M1gN+HH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612436874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U0qMZgLk1sSCSpTWGZWJXmQjxOZwSFIzc7qTwzAZp/c=;
 b=M1gN+HH0ADlNQGaRWSW9Oo4EkAdAcHwC1OcCi46mnm2sQaFPsWloHjV0fPSPEDNicFV+qE
 ZaTVLbY8RqItfnoF4mGF7vJBnYf6iDthDnjeG7T6eFuc9fq/EBEPCiZzA7NkB4tTAVWLHL
 dofQp+0oYLA1LgEPP1FvUgdf7HAJ+tM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-468-YK_Ylm1mNLOHX97la32T-Q-1; Thu, 04 Feb 2021 06:07:52 -0500
X-MC-Unique: YK_Ylm1mNLOHX97la32T-Q-1
Received: by mail-ed1-f72.google.com with SMTP id t9so2610407edd.3
 for <alsa-devel@alsa-project.org>; Thu, 04 Feb 2021 03:07:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=U0qMZgLk1sSCSpTWGZWJXmQjxOZwSFIzc7qTwzAZp/c=;
 b=UtEo54vdfDid1ikBM3V69p1pO+orXTqYf1K55e55M9c93RtrdnjECjVYooXhzXN+Wi
 p8xhVRGFleIXl6HZeC4J7wy0w6m030dhC+LaYgY3tjdf+Vwp4dJHXkLKMociDjMLbRil
 q0+zaAUl57VuBJuaMOeWWM7Kcqz2oC2xCZYUtDLGzXS9guJqozbfMPRjHPa0oOcJJz64
 0orfFVqKiQSegPhd0YZjXafKvponeg3NhJaoS+DQjk65xae0mXg/LbWJTtxYIcicsrYz
 tdbMbzntPcohANESAtGNbeu2nJYIt9CMkJ0ItDefIibxb7M7dJe8XO0QaCf6p85Tg9a7
 kWdA==
X-Gm-Message-State: AOAM5335Ie1OK7e7V9nBxyyiqkvWLq6d5MhuySLJb11SKysV3PF9mEcH
 mymMIbUC0MstdAqinxoHOPSfwK1RanjzBG09n2rrLCwbTKrwn+ZvmV/7VWRCWVcHKh8++MdQJAQ
 zGK0xtnxSy6rLUYCEmhWnvnuJRzpPSJbWbXAVaP4ZoBd0cufUsia9iNNG9LbJXvncCiLmtNMbZn
 8=
X-Received: by 2002:aa7:cb0d:: with SMTP id s13mr6190093edt.221.1612436871357; 
 Thu, 04 Feb 2021 03:07:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxDjpwt9knKChEkepFHLIybOBA0LsguChVehWT2nwhAjMnlRd6l8zMhzwjJJQwocZib7ICOeQ==
X-Received: by 2002:aa7:cb0d:: with SMTP id s13mr6190065edt.221.1612436871071; 
 Thu, 04 Feb 2021 03:07:51 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
 by smtp.gmail.com with ESMTPSA id o4sm2289469edw.78.2021.02.04.03.07.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 03:07:50 -0800 (PST)
Subject: Re: [PATCH v4 0/5] MFD/ASoC: Add support for Intel Bay Trail boards
 with WM5102 codec
To: Lee Jones <lee.jones@linaro.org>
References: <20210120214957.140232-1-hdegoede@redhat.com>
 <249f1a7c-048e-d255-d860-68a97a0092c8@redhat.com>
 <20210204105748.GD2789116@dell>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <7f53dede-946e-c38e-e871-3df1119f1faf@redhat.com>
Date: Thu, 4 Feb 2021 12:07:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210204105748.GD2789116@dell>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org,
 patches@opensource.cirrus.com, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Mark Brown <broonie@kernel.org>
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

On 2/4/21 11:57 AM, Lee Jones wrote:
> On Thu, 04 Feb 2021, Hans de Goede wrote:
> 
>> Hi all,
>>
>> On 1/20/21 10:49 PM, Hans de Goede wrote:
>>> Hi All,
>>>
>>> Here is v4 of my series to add support for Intel Bay Trail based devices
>>> which use a WM5102 codec for audio output/input.
>>>
>>> This was developed and tested on a Lenovo Yoga Tablet 1051L.
>>>
>>> The MFD and ASoC parts do not have any build-time dependencies
>>> on each other. But the follow-up jack-detect series does have
>>> patches depending on each-other and on this series. So IMHO it
>>> would be best if this entire series would be merged through the
>>> MFD tree to make merging the follow-up series easier.
>>>
>>> Mark, if that is ok with you (and you are happy with the ASoC
>>> changes) can you please Ack this ?
>>
>> I believe that this series and the follow-up:
>>
>> "[PATCH v4 00/13] MFD/extcon/ASoC: Rework arizona codec jack-detect support"
>>
>> series are both ready for merging. All patches have Reviewed-by and/or
>> Acked-by tags now.
> 
> I don't think they do.  You're missing ASoC and Extcon Acks.

Right, what I meant is that the patches have been reviewed by other
stake-holders, including the follow-up series being tested by the cirrus
codec folks (thank you Charles).

But yes the actual subsys maintainers have not acked these yet;
and I'm aware that you will need those for merging this through
the MFD tree.

Note that this series only requires Mark ack, the follow-up
also touches extcon code, this one is purely MFD + ASoC patches.

> Not sure why *this* set fell through the cracks though.  However, it's
> now on my to-review list.
> 
> If I can work fast enough, maybe this series can get into 5.12, but
> the follow-up still needs reviews.
> 
> It might be best to collect the *-bys you do have and [RESEND].

Ok, will do.

>> I guess it is too late for 5.12, but it would be nice to at least formulate
>> a plan for getting this merged after 5.12-rc1 is out. Given the
>> interdependencies I still believe that it is best to merge all the patches
>> through the mfd tree and then have Lee provide an immutable branch for the
>> other subsystems to merge.
> 
> Yes, that's fine.
> 
>> Mark and extcon-maintainers (for the follow-up series) may we have your ack
>> for merging these through the MFD tree ?
> 
> Ah, you noticed that too!

Ack :)

Regards,

Hans

