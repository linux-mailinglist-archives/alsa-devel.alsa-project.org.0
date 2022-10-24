Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6124260AF14
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Oct 2022 17:30:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EE9097270;
	Mon, 24 Oct 2022 17:30:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EE9097270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666625454;
	bh=495TwSnjgMfnGSNRf5N7yyUOvjrDfZs3B8fnnTueuAQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=N2+2z6oZkgKbCNjDaHbrdhl4I1pCqKlfwMpI7ci2g7uRA70M5ykNgsDw/qmz4cBWL
	 SGoz3vSpsHYCIc+DXqdUfOhQ9vH1A7kAUaHecOIiZox2Ja4ZKoeNGoJe7phjVwwcWM
	 tf3xYkAXpc/pOkAdn8uQC8jMp8GI/bf5RP4HgiMw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4DBDAF8053D;
	Mon, 24 Oct 2022 17:29:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 012CCF80533; Mon, 24 Oct 2022 17:29:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED,URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 787C1F80506
 for <alsa-devel@alsa-project.org>; Mon, 24 Oct 2022 17:29:49 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 41FFCA003F;
 Mon, 24 Oct 2022 17:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 41FFCA003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1666625388; bh=PcvcoM20a+y5p6Jd0ZBuAWhlXSCzS+BEhyNfcGxj88U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gBmrZ3Bnv1ZtEMPZGsgbBoIBLC6W21rjdF0zN50yWcwY8d/hvSPo2AZvDYQOEbQVD
 MCQHKEQCSVMl4MKIQNgabqDx8lM3/VGFJeCi3p5CHhCMNCWv3ITQoquwOeWw1fAqjB
 Xgp615nbjHjnZNix5VpjhqAqkAVpghnCYahJgddA=
Received: from [192.168.100.98] (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Mon, 24 Oct 2022 17:29:45 +0200 (CEST)
Message-ID: <24cbabfc-42e8-72f4-1e84-c5023c20d28a@perex.cz>
Date: Mon, 24 Oct 2022 17:29:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] ASoC: core: clarify the driver name initialization
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20220929143754.345144-1-perex@perex.cz>
 <eb7971c2-f5fe-afb5-9333-4b941b958355@linux.intel.com>
 <8d461c81-5d70-cfbb-4653-979764a6b5a6@perex.cz>
 <3770c782-d01c-37b6-73a5-2c45c869d541@linux.intel.com>
 <2285503b-b2cd-bca4-d491-cf4e8eaac92a@perex.cz>
 <5b94c9ef-a37b-9d71-ad05-5ce9ba103af0@linux.intel.com>
 <708583ba-ea20-cc46-7ca1-ee213586441a@perex.cz>
 <df4f3b77-887f-8894-3bd7-3dd386af58f1@linux.intel.com>
 <8d0ccf4a-a6d9-f914-70a9-c2ad55af3a04@perex.cz>
 <e2da2a30-c3fa-acc1-8c9c-78476e6f2461@linux.intel.com>
From: Jaroslav Kysela <perex@perex.cz>
In-Reply-To: <e2da2a30-c3fa-acc1-8c9c-78476e6f2461@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Mark Brown <broonie@kernel.org>
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

On 24. 10. 22 16:08, Pierre-Louis Bossart wrote:

>>> If we can report a less confusing driver name to the users, that's fine
>>> with me, but I don't get the idea of using the driver name as the first
>>> criterion to identify a setup, you'll also need the card name so why not
>>> use the card name as primary criterion?
>>
>> It is not usable for the USB driver where every model has own name set
>> from USB descriptors for example.
> 
> How would you use UCM in that context, the use of a driver name would
> lead to a lot of abstraction potentially, isn't there a risk of not
> being able to detect specific skews that need variants?

The fine USB device ID matching is used. This USB device ID is in the 
components string. But yes, it's the next level after the basic lookup.

>> We can use a similar mechanism as we did with
>> CONFIG_SND_SOC_INTEL_USER_FRIENDLY_LONG_NAMES . The distributions can
>> enable this when packages when UCM configs are updated. Also, new
>> drivers should use new driver name scheme, it's only for the current
>> drivers.
> 
> That would be good indeed. FWIW, I reverted this patch in our
> development tree to remove confusing error messages that make tests fail.
> 
> That would not be an Intel only option though, right? There are tons of
> other ASoC machine drivers who don't set the driver name at all, so it
> could take time to make that transition.

Yes, but we need to start somewhere. It seems that a most of ASoC drivers do 
not use card names bigger than 15 characters (I noted this recently in UCM).

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
