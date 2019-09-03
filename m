Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C8DFFA636D
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Sep 2019 10:03:08 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E72D1686;
	Tue,  3 Sep 2019 10:02:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E72D1686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1567497788;
	bh=6Zfme1xFwYonDN7uML4tIOyOsZgwCu5KikzVa3tN9FI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fUcG97CgXPWHVhRtHpDJP9K20iPuWLmKQg2SkyGcwYbbjt/8tmeTo2A9MwyWGL8au
	 yDsiBCmzbIVLlQzpIrJhMOg6BlKYVbwukR0tUnhJyRKwxiUOJleI+IW7y2M8//156t
	 RtiXza7QuzACtQndie4wGsogTcxqa4jYne24T4FQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B9BEF8049B;
	Tue,  3 Sep 2019 10:02:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E675F8049B; Tue,  3 Sep 2019 10:02:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 61D11F80392
 for <alsa-devel@alsa-project.org>; Tue,  3 Sep 2019 10:02:07 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 65938A0040;
 Tue,  3 Sep 2019 10:02:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 65938A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1567497727; bh=PdpyYRGGmZlpeQNxBQWyiAko3AAqHrExkUj2jZ4ttlU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YFwC8m+eHR70TLr3pyP/560c4Za74ZroCBte8wSPZPA+8VQ9Dz6JjOcQI1kkqYKaI
 gqS9KurYf8Z96KfyEV3KZ6ERpXelQtRjhK88IMj0S69xTypIoNgs7owsYdkF7cx6C+
 AagT9mxDMfKi6s6vf3SBLl+yXTFcIEIjg+GDPN2A=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  3 Sep 2019 10:02:03 +0200 (CEST)
To: Hans de Goede <hdegoede@redhat.com>, Takashi Iwai <tiwai@suse.de>
References: <20190831145842.32990-1-hdegoede@redhat.com>
 <s5hef0zjhw5.wl-tiwai@suse.de>
 <99a375b4-f6e9-ef5e-6f24-9e76db44b2e8@redhat.com>
 <s5hpnkiww75.wl-tiwai@suse.de>
 <57014241-1364-222b-ac48-b44023425b84@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <218c37d2-aec4-18b2-bab6-c006b60ecc0a@perex.cz>
Date: Tue, 3 Sep 2019 10:02:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <57014241-1364-222b-ac48-b44023425b84@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dne 03. 09. 19 v 9:47 Hans de Goede napsal(a):
> Hi,
> 
> On 02-09-19 17:32, Takashi Iwai wrote:
>> On Mon, 02 Sep 2019 10:31:30 +0200,
>> Hans de Goede wrote:
>>>
>>> Hi Takashi,
>>>
>>> On 02-09-19 09:07, Takashi Iwai wrote:
>>>> On Sat, 31 Aug 2019 16:58:41 +0200,
>>>> Hans de Goede wrote:
>>>>>
>>>>> Add an UCM profile for Intel boards with a RT5672 codec.
>>>>>
>>>>> Re-use the existing platform enable and disable sequences for BYT/CHT SST
>>>>> support and add a codecs/rt5672 dir with codec specific enable / disable
>>>>> sequences for the various inputs and outputs.
>>>>>
>>>>> This is partly based on earlier work done here:
>>>>> https://github.com/plbossart/UCM/tree/master/cht-bsw-rt5672
>>>>>
>>>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>>>
>>>> We've recently set up a new alsa-ucm-conf repo for keeping UCM
>>>> profiles outside alsa-lib repo.  The new repo has a different license
>>>> (BSD3-Clause) for easily adapting to OSes with license restriction.
>>>>
>>>> I guess we should put the stuff there from now on, as much as
>>>> possible?  The handling of UCM profile is currently pending, and we
>>>> need to decide the general policy, as well as how to transfer the
>>>> existing profiles to the new repo...
>>>
>>> I think it is good that we now have a separate repo and I'm fine
>>> with re-licensing all my UCM profile work under a BSD3-Clause license.
>>>
>>> But I believe that until we have actually figured out how this is
>>> all going to work and we are actually doing releases from the
>>> new alsa-ucm-conf repo, we should keep adding new profiles to
>>> alsa-lib for now, because these profiles are necessary for things
>>> to work OOTB for our end users.
>>
>> Well, putting to both repos isn't a good idea from the packaging POV,
>> either.  If we're going to release the alsa-ucm-conf sooner or later
>> together with the next alsa-lib release, we can put into the new repo
>> from the beginning.
> 
> Well, we want to move some of the other UCM profiles over too, right?
> (I guess eventually we want to move all of them over)
> 
> So we are going to have this duplicate profile problem anyways.
> 
> I was thinking of adding a --without-duplicate-ucm-profiles option
> to alsa-lib's ./configure which when used disables installation of UCM
> profiles which have a copy in the new alsa-ucm-conf.
> 
> This will give use a transition period, where distros can choose to either
> use alsa-lib with --without-duplicate-ucm-profiles + the new alsa-ucm-conf,
> or just use alsa-lib as they have before. Note the idea is for this to
> be temporary, eventually the profiles which are "disabled" by
> --without-duplicate-ucm-profiles can be dropped and the option removed.
> 
> OTOH if you plan to make sure that the next alsa-lib release is done
> in sync with the first alsa-ucm-conf release and you plan to move the
> UCM profiles which can be moved (licensing) before that, giving us a clean
> break, then that is fine too.

Yes, that sounds good. I will also try to send e-mail to all authors for the
permission to change the licence to BSD3-Clause license. Perhaps, we can get
all agreements before the next alsa-lib is released, so all UCM profiles will
be moved to the new repository and the configuration option
--without-duplicate-ucm-profiles will not be required.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
