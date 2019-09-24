Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D6D7BC74C
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Sep 2019 13:55:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EDCE0169E;
	Tue, 24 Sep 2019 13:54:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EDCE0169E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569326121;
	bh=HPM2YDxMs2/0I1VzAy3AvKhJkheObDdrfAMtAOwmpaE=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=M8A2oWCDD4qU2wjJdzuClhT1QQ8ZXU+F0m/GVrdNG+dlS4zlmCsIqCoJwG5GQS9oY
	 rhzyXL7XRRSoIax1tCKlKZYD/TxtUBaBCnubNRlHk5kpxT2jG6HlkxZOZIaXffZ6wg
	 zBdTdgxTae9GtukYEILQxHJMKygO5BvqWKDlDIfM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 04D91F805F8;
	Tue, 24 Sep 2019 13:53:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E834F80534; Tue, 24 Sep 2019 13:53:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12D7CF803F4
 for <alsa-devel@alsa-project.org>; Tue, 24 Sep 2019 13:53:39 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 4984EA0040;
 Tue, 24 Sep 2019 13:53:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 4984EA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1569326019; bh=YJUEO1rEDghVmFX0l8cJK4HMiBXKNfUMGWyOL50CL3o=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=pXBRabTS50EZY/gV6qAP0Md+WFHSdB1j4pJH+nxhIz8mLBfvLBVZ98Y1LqAvygU1/
 itYTsT434uw2M/bNZPn9ASERegJhhj/tTNw8A3krwwtl4xckv7h7uGIl7ltTD9p+8U
 4b+E7US+z2l8PB2Dt9NUZnP4vrmX/wkUf6xfM1tM=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 24 Sep 2019 13:53:35 +0200 (CEST)
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Pearson <mpearson@lenovo.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Elimar Riesebieter <riesebie@lxtec.de>
References: <20190919142329.35bsdnh5skuj7jl3@toy.home.lxtec.de>
 <853b3859-8c8e-1c52-becb-3807d351b8f1@linux.intel.com>
 <f11c5347d8504148a47fdbc48d920f59@lenovo.com>
 <98b99cea-9be1-f232-f62c-1f0b7a10e295@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <38abcb71-3041-7015-e56a-43f628b2faf1@perex.cz>
Date: Tue, 24 Sep 2019 13:53:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <98b99cea-9be1-f232-f62c-1f0b7a10e295@linux.intel.com>
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

Dne 19. 09. 19 v 17:15 Pierre-Louis Bossart napsal(a):
> On 9/19/19 9:54 AM, Mark Pearson wrote:
>>>
>>> Indeed UCM is required for all cases where SOF and PulseAudio are used.
>>>
>>> Our thinking was however to add this UCM file to the new repository outside
>>> of alsa-lib [1]. There is an on-going thread started by Jaroslav to move those
>>> files and relicense them as BSD-3-Clause [2]
>>>
>>> [1]
>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-
>>> July/153257.html
>>> [2]
>>> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-
>>> September/155246.html
>>
>> Thanks Pierre.
>>
>> Do we have any approximate timelines on when and how this will happen? (I'm new to this)
>>
>> One of my main aims is that we have a customer using Debian and one of our platforms that require this change - I need to make sure I understand how this would roll out and what actions they need to take in the meantime if it's not going to be available in Debian.
> 
> I think the first order would be to have the file cleaned-up, with its 
> Intel origin clearly stated with a signed-off-by tag.
> 
> Then once this is done, the Debian package creation needs to be handled 
> (using either the ALSA repo or the cloned version on SOF GitHub). I 
> don't have any experience with Debian packages so can't really comment 
> on the effort it would take.

I did some cleanups here:

https://github.com/alsa-project/alsa-ucm-conf/commit/f796f0852a097e238fa9f5efb174e95b5ee6c8b7

Pierre, could you confirm the original source and are you ok with that?

			Thank you,
				Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
