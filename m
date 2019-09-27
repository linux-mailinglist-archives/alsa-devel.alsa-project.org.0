Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C54EC03C4
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 12:59:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9B82166E;
	Fri, 27 Sep 2019 12:58:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9B82166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569581980;
	bh=VOIfi6qkynWCXL1LZD4Ul/Hw5qo9fU6qjSebwvpCNSQ=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UJ+y8eDFfeZOfmHD1F4zV6d5LFhnfXkPLbD/NDoInX3aO3R9uT3dIhMzZ/4R6zz8C
	 H9Ic8IqmvIShv+FA/87jn0an+K2w5SrXe+0eQkR0AaDcg9WObwB4uLyH0lCmWGWB/D
	 MSaVcvyVGZmo4J55brIHiYcrSI8pOneNmHnXu/9M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5A633F8049A;
	Fri, 27 Sep 2019 12:57:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C6525F8049A; Fri, 27 Sep 2019 12:57:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6491BF80140
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 12:57:51 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id A952EA003F;
 Fri, 27 Sep 2019 12:57:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz A952EA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1569581870; bh=nBBbr9K969r88jzXl5qbnDMsNAVtfuyPNmv8d8/ptm0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=dakVp/Qb0gY9aJYkiAYWqg4bAMoq7dMWtNZ1UKBYYHYrAOZZqIAQMFdKuadiPhtMs
 CGGp8YNYyS8/9Yezbq8r1n+kKpuQji+yvzwRqNhiB1MTHJiur/lBIwPl6BKrcglEc0
 3QI9PECH3jcf4WMRLJ2ipFVr34uEAL2SjmQ/h7GU=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri, 27 Sep 2019 12:57:45 +0200 (CEST)
To: Jaska Uimonen <jaska.uimonen@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Pearson <mpearson@lenovo.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Elimar Riesebieter <riesebie@lxtec.de>
References: <20190919142329.35bsdnh5skuj7jl3@toy.home.lxtec.de>
 <853b3859-8c8e-1c52-becb-3807d351b8f1@linux.intel.com>
 <f11c5347d8504148a47fdbc48d920f59@lenovo.com>
 <98b99cea-9be1-f232-f62c-1f0b7a10e295@linux.intel.com>
 <38abcb71-3041-7015-e56a-43f628b2faf1@perex.cz>
 <1569578841.43188.16.camel@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <71636f27-3dd6-6236-f025-13dc465d06ae@perex.cz>
Date: Fri, 27 Sep 2019 12:57:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1569578841.43188.16.camel@linux.intel.com>
Content-Language: en-US
Subject: Re: [alsa-devel] [External] Re: alsa-lib: Add ucm support for
 whiskeylake sof-skl_hda_card audio
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

Dne 27. 09. 19 v 12:07 Jaska Uimonen napsal(a):
> On Tue, 2019-09-24 at 13:53 +0200, Jaroslav Kysela wrote:
>> Dne 19. 09. 19 v 17:15 Pierre-Louis Bossart napsal(a):
>>> On 9/19/19 9:54 AM, Mark Pearson wrote:
>>>>>
>>>>> Indeed UCM is required for all cases where SOF and PulseAudio
>>>>> are used.
>>>>>
>>>>> Our thinking was however to add this UCM file to the new
>>>>> repository outside
>>>>> of alsa-lib [1]. There is an on-going thread started by
>>>>> Jaroslav to move those
>>>>> files and relicense them as BSD-3-Clause [2]
>>>>>
>>>>> [1]
>>>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-
>>>>> July/153257.html
>>>>> [2]
>>>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-
>>>>> September/155246.html
>>>>
>>>> Thanks Pierre.
>>>>
>>>> Do we have any approximate timelines on when and how this will
>>>> happen? (I'm new to this)
>>>>
>>>> One of my main aims is that we have a customer using Debian and
>>>> one of our platforms that require this change - I need to make
>>>> sure I understand how this would roll out and what actions they
>>>> need to take in the meantime if it's not going to be available in
>>>> Debian.
>>>
>>> I think the first order would be to have the file cleaned-up, with
>>> its 
>>> Intel origin clearly stated with a signed-off-by tag.
>>>
>>> Then once this is done, the Debian package creation needs to be
>>> handled 
>>> (using either the ALSA repo or the cloned version on SOF GitHub).
>>> I 
>>> don't have any experience with Debian packages so can't really
>>> comment 
>>> on the effort it would take.
>>
>> I did some cleanups here:
>>
>> https://github.com/alsa-project/alsa-ucm-conf/commit/f796f0852a097e23
>> 8fa9f5efb174e95b5ee6c8b7
>>
>> Pierre, could you confirm the original source and are you ok with
>> that?
> 
> Cleanup looks fine to me, we should add still UCM "PlaybackVolume" and
> "CaptureVolume" settings, because otherwise Pulseaudio will use SW
> volume only. This will make for example HDA led quirks useless...
> (and actually CaptureVolume and PlaybackVolume in pulseaudio ucm
> support is still not integrated, hopefully soon). Defining Capture and
> PlaybackVolume should not do any harm currently for user space.
> 
> I can do that, Jaroslav you want PR against github or patches here 
> to mailing list?

As you wish. Both ways are acceptable for me. Note that I did another cleanup
for 'Bass Speaker' for Carbon X1 7th and merged 'import' branch to 'master'
branch on github (so do the PR against master, if you like).

				Thanks,
					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
