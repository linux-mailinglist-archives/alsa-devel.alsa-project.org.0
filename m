Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FACC498C1E
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 20:21:45 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACCFC20DD;
	Mon, 24 Jan 2022 20:20:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACCFC20DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643052104;
	bh=Tz2n7p3jXn7LoN/70ndR79c8utMhwMkRadffMOmDpzY=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XqKd5z9iEQsvZUM0/BRgcMPFrIAgrQnWWokRv6oX/+JuXv/fkfnEwhauYuzg4kCtJ
	 +YvTmqhWYomuGfDSVge2zozIjt/uNN8KhwW7M9D3nz5/PXOPM1+PVQyTGyKts2y9J1
	 skZDsVW027sxgdIq9Ta1o6QKfLqhJqmyggWEzUuE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 251E9F80083;
	Mon, 24 Jan 2022 20:20:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B7234F8027C; Mon, 24 Jan 2022 20:20:36 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9114CF80083
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 20:20:30 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 745D5A0047;
 Mon, 24 Jan 2022 20:20:29 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 745D5A0047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1643052029; bh=H/Ju0LIP/r1P/zsnLrr5J1i9pZSVZE3HKcBXU2NDFoo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=JObOjk3wmovcCbFArs+Tgi6d0kBYXIaSBAb/mg1fBISjVbU71UDlqgLtfKpwzefN8
 tQvVnX/jYD9Y0kh+9kXDkH1GQpN/PTtXQdXFE3SJ/rjF1XvlpiOcQs/PzS4eR3aqMz
 nv2o24PB02iEZ0yYUgh6UuvCvqh9C0uSTdR6Y0MQ=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 24 Jan 2022 20:20:25 +0100 (CET)
Message-ID: <b4f715f5-7a52-f433-e11d-53b23ed3f3ad@perex.cz>
Date: Mon, 24 Jan 2022 20:20:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 0/3] ASoC: Add bounds checking for written values
Content-Language: en-US
To: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>
References: <20220124153253.3548853-1-broonie@kernel.org>
 <9eecf478-b705-7273-7553-24bafaec5404@perex.cz>
 <Ye7ZXvIK3sVkvzQJ@sirena.org.uk> <s5hzgnloycd.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <s5hzgnloycd.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>
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

On 24. 01. 22 18:08, Takashi Iwai wrote:
> On Mon, 24 Jan 2022 17:52:46 +0100,
> Mark Brown wrote:
>>
>> On Mon, Jan 24, 2022 at 05:29:50PM +0100, Jaroslav Kysela wrote:
>>> On 24. 01. 22 16:32, Mark Brown wrote:
>>
>>>> This series adds verification that values written to registers are in
>>>> bounds for controls since the core doesn't validate for us.
>>
>>> As discussed, those conditions should be optional to eventually catch the
>>> wrong applications. I don't see any benefit to report the range error back
>>> when there is value masking code already. The users will note when the
>>> unwanted values are written to the hardware, or not?
>>
>> In general I'd say that silent failures are harder to work with than
>> returning an error at the point where we notice that there's a problem,
>> assuming userspace is paying any attention to the error return at all of
>> course.  We certainly have quite a lot of existing put() methods that do
>> return errors and it's not like the application isn't invoking undefined
>> behaviour so I don't see a problem here.
> 
> I find also it's more useful to have the proper checks in general.
> 
> Jaroslav, is you concern only about the compatibility of user-space?
> Or anything else?  The compatibility is always certainly a slight
> issue; if this breaks really something useful and actually working
> stuff, we need to consider the workaround...

My concern is only based on the fact that this code is normally not reachable. 
It only costs some CPU ticks and adds extra code to the drivers without any 
other benefit. The applications should not use out of range values and if they 
do, the behavior is not defined (the drivers should only avoid crashes).

The code seems to be added only to make things consistent for the test 
applications. I don't think that it's worth to care only for this reason. What 
is the goal for this code? The result with the proposed code will be - the SoC 
core has the extra validation conditions.

The user space can eventually add similar checks to detect the broken 
applications.

Basically, I think that those checks should be marked as debug and they should 
be optional like we do for CONFIG_SND_CTL_VALIDATION and enable only the fast 
path by default.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
