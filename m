Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C496328B433
	for <lists+alsa-devel@lfdr.de>; Mon, 12 Oct 2020 13:55:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 623FB168D;
	Mon, 12 Oct 2020 13:54:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 623FB168D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602503749;
	bh=dXqfDe8kzMa4kjk6lVxb6avWBjMcTvpnbjtbCFMmyCU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IIU2WWNvBKOoRL04l0eRM03UdnMMxY+q9mCxNtfgCniWs7LxSi8kksZGpoGeVCsWH
	 lnouAOB8rKaZk/TRfOVOTttLUJymgzzFzvmvkocpXAVP03Hg6ERuHTr6k/OkgKaFk7
	 rMHECjlBX1/YntnXUZH3kjAMC3NR91wsPk9Dtf3E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2ECBDF8021D;
	Mon, 12 Oct 2020 13:54:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 4BB3EF80217; Mon, 12 Oct 2020 13:54:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA96EF800D8
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 13:54:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA96EF800D8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="CdVmayCO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1602503641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vOqiEcErybqDI1zn02672DvUaNztooofdkAjcIgz2WI=;
 b=CdVmayCOKdnwBX5zUPnKgwBvSbZ9HViTjWX5tcm/c2Z1x0gesbSurX/qmAluVsnuRDh5sU
 wWCUtCBdNiLyE+eH+Fe2I3aqHDJoy6rP0nd9kgbUiidlEwmZpyTMJW0607mDM7IZVtdgqO
 evFxSa7s/ezyerEO/nwGdgxtwYBsTkk=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-52-mesDN-8iOEm43PR_gynq1Q-1; Mon, 12 Oct 2020 07:53:57 -0400
X-MC-Unique: mesDN-8iOEm43PR_gynq1Q-1
Received: by mail-ed1-f72.google.com with SMTP id n19so6503866eds.8
 for <alsa-devel@alsa-project.org>; Mon, 12 Oct 2020 04:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=vOqiEcErybqDI1zn02672DvUaNztooofdkAjcIgz2WI=;
 b=twxz9DUKtyA/tt10uIaFWTY1xsj0S9tgyXLU6km0T72gZbWvrv7LwjkOrIT5Qgmwpc
 2y2A5hQc33WiGOOMqrIGTq1WUi9aYYDq41E0RmjHP8JVUtCBNHbYcYahrU75/jJ5tkL5
 5xx6znuUpdBkhSm4HvhNSFhGsZQPiK01ubR2OsTaq/P45zLiNoIzOhEgSBvxV6JYlLhS
 HRctr3OgSFDNAX5XJyKMli7C4txBY1KNUc2nNnFGfUQOpHsls3O9RZxVVKAg3QGHqNdB
 L/llvK7pVJ1VjZqma2m/hWSF9dT61Lo59d5Nfhu6EAX1Rwgnl76YMXKIRfoazq5TqRbs
 2WzA==
X-Gm-Message-State: AOAM533ARQK/R3qHbL/0wwoKc4PKwaHlfXp5FsYmB2vlYyOPbWDIi0pr
 1In/8+MnS1ulWL2eX2DEeIjNl8gx1XlwDREaT951+VLpS/wRb62LtHQKs0Wefl0X6V6i94mVVlF
 yqLQ8Zyr/Ll0yeb9MQk4Uf2E=
X-Received: by 2002:a05:6402:22ae:: with SMTP id
 cx14mr13891268edb.73.1602503635967; 
 Mon, 12 Oct 2020 04:53:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKmHL9unW5hqNPynOMLx6UjtgJb+xcV40ce/WD3DXg8Dp8mqd5pcPT4i4SDmEOZ5JLQYHrSQ==
X-Received: by 2002:a05:6402:22ae:: with SMTP id
 cx14mr13891252edb.73.1602503635767; 
 Mon, 12 Oct 2020 04:53:55 -0700 (PDT)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
 by smtp.gmail.com with ESMTPSA id c5sm10673024edx.58.2020.10.12.04.53.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Oct 2020 04:53:55 -0700 (PDT)
Subject: Re: [PATCH v2 00/13] ASoC: Intel: Remove obsolete solutions and
 components
To: Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.de>
References: <20201006064907.16277-1-cezary.rojewski@intel.com>
 <cf1fb47d-412f-48fd-4501-e63f1db32bc1@redhat.com>
 <s5ha6wrretr.wl-tiwai@suse.de> <20201012113626.GA4332@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <bda70fe7-ac16-8215-5506-c4144064bcfd@redhat.com>
Date: Mon, 12 Oct 2020 13:53:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201012113626.GA4332@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, krzysztof.hejmowski@intel.com,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, lgirdwood@gmail.com,
 ppapierkowski@habana.ai, marcin.barlik@intel.com, zwisler@google.com,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 filip.proborszcz@intel.com, amadeuszx.slawinski@linux.intel.com,
 michal.wasko@intel.com, tiwai@suse.com, andriy.shevchenko@linux.intel.com,
 cujomalainey@chromium.org, vamshi.krishna.gopal@intel.com
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

On 10/12/20 1:36 PM, Mark Brown wrote:
> On Mon, Oct 12, 2020 at 11:09:04AM +0200, Takashi Iwai wrote:
>> Hans de Goede wrote:
> 
>>> replacement and dropping the old code ?  I'm not sure if that is such
>>> a great idea, what is the fallback plan if testing does find significant
>>> issues with the new catpt code ?
> 
>> I find the action a bit too rushing, too.  OTOH, the old code wasn't
>> well maintained, honestly speaking.  So, from another perspective,
>> switching to a new code can be seen as a better chance to fix any
>> bugs.
> 
> That was my take as well - the old code seemed to be very fragile for
> structural reasons which are hopefully addressed here and Intel seem
> willing to actively work on supporting this version.  I have to confess
> I had assumed Hans had seen all this stuff going past, the new driver
> got quite a few rounds of review.

My ASoC interest is 99% Intel Bay Trail / Cherry Trail support, so
I'm not on alsa-devel list since that gets a lot more then just that.

IOW I'm relying on being Cc-ed, which might not be the best tactic
I guess.

Anyways, the Bay Trail / Cherry Trail changes here are 100% ok with me.
I pointed out the Haswell / Broadwell bits since I was taking a look
anyways, I don't really have a strong opinion on those, I've never seen
a  Haswell / Broadwell machine actually using the SST/ASoC code,
all those which I have seen use the HDA driver.

And from the sounds of it for those rare Haswell / Broadwell machines
which do use the SST code the new catpt code should be an improvement.
So from my pov everything is good.

Regards,

Hans

