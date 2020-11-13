Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FD82B2188
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Nov 2020 18:08:06 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 91A951886;
	Fri, 13 Nov 2020 18:07:15 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 91A951886
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1605287285;
	bh=5Z010UYDU947uYhgB/YdV+8vIBYjvGb06TRQXiv44zU=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SK5XBxsRFMjrK2zbPcCw4eXjz8SsSevhLEVDwN4rvHpir6v8eNa6L6lHf+nY/nY43
	 fSYwN+gIUsLY67dPFAxx/neq3rNAllr8oXkrNr1PV0HOqjaw8HUc2yVCg3d7N+GXba
	 6ZYiN7iLJPS+wjkU0JYmgW0B6gdazfRKPSVMaFvI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09C82F800E9;
	Fri, 13 Nov 2020 18:06:33 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D4446F8020C; Fri, 13 Nov 2020 18:06:30 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,PRX_BODY_65,RCVD_IN_MSPIKE_H5,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A112CF800E9
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 18:06:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A112CF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="cWSp9wb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605287182;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CVuyz24G7Uf8HTaihyyI8diJcHxT+DkxPumTbZuoQVQ=;
 b=cWSp9wb/nP31Jp4ECP7+BWjTAciB3sU43cM5QIrbr+iiAjAGKfsEz75TIN69egdt35gum3
 nO1tH7FNJ5WfQeGTTkF/snBwY6KeHUUKkWPQviYYmgZxn9c8Y2O31fT9TNsVLIPdvxMREI
 CzFsD1FiVzzzGnbnhksz1T8+HaQqT+Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-hEnjhHjmPRSh5mnFYc7dAA-1; Fri, 13 Nov 2020 12:06:19 -0500
X-MC-Unique: hEnjhHjmPRSh5mnFYc7dAA-1
Received: by mail-ed1-f70.google.com with SMTP id d1so5009285edz.14
 for <alsa-devel@alsa-project.org>; Fri, 13 Nov 2020 09:06:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CVuyz24G7Uf8HTaihyyI8diJcHxT+DkxPumTbZuoQVQ=;
 b=rGxsLmS4+G4mAfU2QP3uhih00KHlIqNvTd4bKk+vnADDjTZxVY5eiSUE79KKg5oPuR
 Y6eiXcC9WM3LG3SkOQBesBLMzaadZj+N/+ef1s/udkuTpyN7IKnqPH9/l/vmmF+3UZIx
 1hxjBKkNyLD/5n+ksbsbeu6G1SlJOwNTqtvokRKv7vtVhxvHJ9r8MuhYsFf1+FjZJMbi
 Jp19iwpwEumQ5jiVVwPPVxKcvtKVQOrymIUZIvKaWw0GslbUzS11oNwgs1g/pDa2pze4
 NI7OnyebKxCaqUDjiCRkLGTTdm1Or/cFfxUzdc5QqkT42qYHUdZnuEm25/tsg/ZdPguN
 C9fA==
X-Gm-Message-State: AOAM531PUHFiZaBt5ZRhCDn3NHtia/SJeMAkR5cau0PQOhJO166dxqqG
 Wr7qizS87vsMgyYQPutFOT+bJ4aV6aBywlPNSC7lI4VDhUuY+olnRC6fnZ38Wf/+mJSWgHGj8rP
 hA6OSJUY6/Bg8KsN4WNa/whk=
X-Received: by 2002:a17:906:a843:: with SMTP id
 dx3mr2964030ejb.313.1605287175714; 
 Fri, 13 Nov 2020 09:06:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjv79a9Fu9rrwwkaiJBAY6CG/fIZAFD5TDJ4RjsKyE9dJr3NCdFbIp3KMDpSdpgHU49I2Oag==
X-Received: by 2002:a17:906:a843:: with SMTP id
 dx3mr2963495ejb.313.1605287170521; 
 Fri, 13 Nov 2020 09:06:10 -0800 (PST)
Received: from x1.localdomain
 (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
 by smtp.gmail.com with ESMTPSA id rn28sm4162279ejb.22.2020.11.13.09.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Nov 2020 09:06:09 -0800 (PST)
Subject: Re: [PATCH 00/14] ASoC: Intel/SOF: extend run-time driver selection
 to ACPI devices
To: Mark Brown <broonie@kernel.org>,
 "Rojewski, Cezary" <cezary.rojewski@intel.com>
References: <20201112223825.39765-1-pierre-louis.bossart@linux.intel.com>
 <0a0854d1ddaf4f9b81ef5569a7d501a5@intel.com>
 <20201113164946.GD4828@sirena.org.uk>
From: Hans de Goede <hdegoede@redhat.com>
Message-ID: <2cf7075b-bd51-21a5-2058-3a98e6c488a7@redhat.com>
Date: Fri, 13 Nov 2020 18:06:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201113164946.GD4828@sirena.org.uk>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: "tiwai@suse.de" <tiwai@suse.de>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
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

On 11/13/20 5:49 PM, Mark Brown wrote:
> On Fri, Nov 13, 2020 at 01:06:48PM +0000, Rojewski, Cezary wrote:
> 
>> For a very long time upstream was filled with "flavors" of drivers for
>> Intel solutions. Having three available for BYT is a very good example
>> of that. The division of what goes where wasn't exactly explicit either.
>> This all leads to confusion - while community and users may feel
>> confused about what's recommended and what they should actually be
>> using, surprisingly (unsurprisingly?) developers were too.
> 
> ...
> 
>> Patchset presented here goes directly against that goal. We, Intel
>> developers, are tasked with providing reliable, working solutions
>> exposing best possible experience for our customers when dealing with
>> our products. And thus solutions provided are called recommended. We
>> don't deal with flavors and try-it-out-on-your-own-risk.
> 
> My feeling here was that this is helping with this goal in that it's not
> changing the defaults but is rather pushing the decision making process
> from build time to runtime.  This means that distributions are able to
> ship the preferred implementations for all the platforms without causing
> any issues for the hopefully small set of users who need or want to work
> on a different firmware, if they've been doing something like sticking
> with an alternative firmware for old users since things were working
> they'll be able to smoothly transition over to the current recommended
> default, eg leaving old users on the old firmware by default.  That's a
> bit of a niche use case but then hopefully all use cases for selecting a
> non-default firmware are niche.
> 
> It also means that people don't have to think about this so much at
> build time, they can just turn everything on and not worry they'll cause
> problems for people using the binary and still get the recommended
> runtime behaviour by default unless the user actively does something

Exactly. As Pierre-Louis mentions the Intel team does not have most
of the affected hardware. Since I've been working on making BYT and CHT
based devices work better with Linux as a side project for the last
couple of years I have been buying these kinda devices 2nd hand when ever
I can get one cheap and I've built a big collection of these (one might
say this has gotten out of hand a bit) see here:

https://github.com/jwrdegoede/sunxi-fedora-scripts/blob/master/x86-tablet-info
https://github.com/jwrdegoede/sunxi-fedora-scripts/blob/master/x86-codec-info

For my device collection (mostly the first link).

As Pierre-Louis mentioned I've already been working with him on getting
ready to move everything BYT/CHT related over to SOF. I've already been
testing SOF on various devices with mostly ok results so far.
But this is a process not a switch which we can simply throw.

So I'm all in favor of this patch-set. With some luck we can switch the
BYT/CHT default to SOF in Fedora for F34 beta (*), but doing that really
sorta hinges on this patch-set so that users can easily try the old
driver, both as a workaround for issues and to check if the problem
is caused by the switch to SOF.

Talking about doing this for Fedora 34, I think that switching the
default there is a good idea (and I can make this happen) what do
others think about doing this?

Regards,

Hans

