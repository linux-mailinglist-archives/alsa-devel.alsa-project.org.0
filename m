Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F07A66A118
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Jan 2023 18:49:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A598EAB08;
	Fri, 13 Jan 2023 18:48:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A598EAB08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673632168;
	bh=vXZYegqr0r8VoEKtaFQ41Pd2O25X43DEDShZ7ZuY//c=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=BQ1x9kPPowt3EoQYHBl6xAXkSmtRcBOFheEZvKLmBBOGcTPzVG0gjqopWz8WZEyLs
	 1B58VYdNsNVjuJ3VRCJlTp93nOHq/9/CwfL//n2pNMyO3e04oUR0u1j7Ut+PQOJXX2
	 FQsRm8qx61nFiEu3YHby91Q8GEVPex+7QstShxtQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5E4D2F8016D;
	Fri, 13 Jan 2023 18:48:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 255D1F8030F; Fri, 13 Jan 2023 18:48:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B8E91F8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 18:48:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8E91F8016D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=BFbHakLz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673632103; x=1705168103;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vXZYegqr0r8VoEKtaFQ41Pd2O25X43DEDShZ7ZuY//c=;
 b=BFbHakLzWoZ5FohimrRkuIYvu6v19tCEM8v/zn5GPocFNjicJYR3x2FP
 nnFCXpE6GPuluFwPVqQkbdSTZbRBFdUFw3nbPwWoM10lCQwhlIzRQkr8j
 B5tgkJCKwf8LbQEWYnDLeBFftAtAtGU1a0j/Riclc72mbY3qq/iSRKQap
 bHY2NY/qIe5awbIjdUSQ0yhuKwV9zBJWo/3F4CWfiYxJxvCuCBjGoW4yK
 iZ8TC3lOYwNKEUnq0RUqbaqe4QBiCkzeT7FGTr6N4TNjVUfuS3ZHOJAMu
 Nv6oxE82+oKDy+zDCHnONbmLSyV3SUwdmfQRxd5md1cT08s5sp5xz44+6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="326111270"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="326111270"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 09:48:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10589"; a="635854356"
X-IronPort-AV: E=Sophos;i="5.97,214,1669104000"; d="scan'208";a="635854356"
Received: from rerayess-mobl.amr.corp.intel.com (HELO [10.212.13.223])
 ([10.212.13.223])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jan 2023 09:48:12 -0800
Message-ID: <202c4f36-77b0-44a2-a77d-b989040dafc6@linux.intel.com>
Date: Fri, 13 Jan 2023 11:48:12 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 1/5] soundwire: stream: uniquify dev_err() logs
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, alsa-devel@alsa-project.org,
 vkoul@kernel.org
References: <20230113093532.3872113-1-yung-chuan.liao@linux.intel.com>
 <20230113093532.3872113-2-yung-chuan.liao@linux.intel.com>
 <d2c6f43a-e166-a201-4662-ba726347f2da@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <d2c6f43a-e166-a201-4662-ba726347f2da@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: vinod.koul@linaro.org, bard.liao@intel.com, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/13/23 04:22, Amadeusz Sławiński wrote:
> On 1/13/2023 10:35 AM, Bard Liao wrote:
>> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>>
>> There are a couple of duplicate logs which makes harder than needed to
>> follow the error flows. Add __func__ or make the log unique.
>>
>> Signed-off-by: Pierre-Louis Bossart
>> <pierre-louis.bossart@linux.intel.com>
>> Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
>> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
>> ---
>>   drivers/soundwire/stream.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
>> index df3b36670df4..e0eae0b98267 100644
>> --- a/drivers/soundwire/stream.c
>> +++ b/drivers/soundwire/stream.c
>> @@ -1389,7 +1389,7 @@ static int _sdw_prepare_stream(struct
>> sdw_stream_runtime *stream,
>>         ret = do_bank_switch(stream);
>>       if (ret < 0) {
>> -        dev_err(bus->dev, "Bank switch failed: %d\n", ret);
>> +        dev_err(bus->dev, "do_bank_switch failed: %d\n", ret);
>>           goto restore_params;
>>       }
> 
> This one seems bit unrelated to the change and makes error message
> inconsistent with:
> https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git/tree/drivers/soundwire/stream.c?h=next&id=545c365185a47672b1d5cc13c84057a1e874993c#n1498
> and
> https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/soundwire.git/tree/drivers/soundwire/stream.c?h=next&id=545c365185a47672b1d5cc13c84057a1e874993c#n1575
> which actually brings me to another suggestion, can this error message
> perhaps be just moved into do_bank_switch() function itself, instead of
> being duplicated multiple times or alternatively just also prefix all of
> them with function name?

well, as you correctly pointed out, there are multiple users of
'do_bank_switch' so we don't want to put the message in the function itself.

We could indeed use __func__ instead, that'd be fine.

Looking at the code, there are also inconsistencies with the use of
pr_err and dev_err. dev_err(bus->dev is wrong actually, this would use
the bus variable assigned in the previous loop, this makes no sense for
multi-segment topologies.

Let's drop this patch and revisit all this, hope Vinod can deal with
patch 1..4 otherwise we'll resend the set.

Thanks Amadeusz for the feedback.
