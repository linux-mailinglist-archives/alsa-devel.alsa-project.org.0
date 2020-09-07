Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8D125FC05
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Sep 2020 16:27:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DC3E6179A;
	Mon,  7 Sep 2020 16:26:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DC3E6179A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599488832;
	bh=6pZbIYH2TbSxpjkQwYZo+czD5iqa6On9EHl5MPcyeDY=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o4jgWTE3kHOepHi0ewFC3JYZQug+Sqgu2h+HuCsq36IgxINypwiwfFOSG3J+vPGPj
	 5Ff7DmO3FHQ2MV9a+Ao4PaWKJVNMm6r7gZBsW+gKvUw68VjW1+1XIu8JYt1R28Ctgb
	 Lqr+6fRKGlHtEPkferTvX8uc5518e6YkIv9iYaa0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0A31F800FD;
	Mon,  7 Sep 2020 16:26:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 075F3F80256; Mon,  7 Sep 2020 16:26:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,NICE_REPLY_A,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1ACB9F8021C
 for <alsa-devel@alsa-project.org>; Mon,  7 Sep 2020 16:26:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1ACB9F8021C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="cdboRjN+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599488764;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zTmBPadsM0369P4dgmmlV6u5vQHhp1sa+9yqI7VZ1Zk=;
 b=cdboRjN+jFkmDdy3Ss9SYupEsnkOd8kYKVAtUv3NAf0u2/OPLK9mR5WOoT4SCF+4q2xmE+
 Me+C7zJ9aqUOFGEtBiq7hVMafl9cp7HMIJY9zRqPqNUzNQ8jU6rF1WYjMBSKdkNsfOAso9
 I+wsQXhmbZNMI2n9rWDKvEQU2XLODug=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-515-NwapBHvIMsW2kb3fUiz4tw-1; Mon, 07 Sep 2020 10:26:03 -0400
X-MC-Unique: NwapBHvIMsW2kb3fUiz4tw-1
Received: by mail-qv1-f69.google.com with SMTP id v14so1703702qvq.10
 for <alsa-devel@alsa-project.org>; Mon, 07 Sep 2020 07:26:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zTmBPadsM0369P4dgmmlV6u5vQHhp1sa+9yqI7VZ1Zk=;
 b=cHRJYDyRW9aK4/gDFGKCs++j1dA/DTnOUFMgXrObOcJj9nteuiRauGd8JTj6VahsKH
 NUrNYJg5eNHpOk2tW3xUgUvoVwhZir/fQQXsiaoXJFUm82axo+dsXAGvHa2GesDQYmLN
 nv2v0q0jfggl5tZSUcVFLJl35E8tO69Ld4pPqHFgl7rY5ji9RWyBF0zGBDzs/jXp5+v0
 CLCW22FsR9df1snNLrcNihWC8Vx2qzofA1UgAedXXIUDOWrAuKK8HrqoYlKyV+ewISe7
 USqpA0a+wrY/DIUzdf2m5xAxqATGkIiQc2VKvTILtLMN6be7LYstsWLSpK9sSe1YH4K4
 kOAw==
X-Gm-Message-State: AOAM5309SJDzK8RLZeAE+c0WQCNpdFmDYsRMBTR+9Y4nOj0XyPob0QLS
 jPtO0oAKCdWMjRChkw5wS5Q1JFyFRMItTg8OdFsP4PlD7U/nEfZQ/tdda2q6KrXETYcP393MV7b
 hzhG/7kZECiaeKLNgB425aN8=
X-Received: by 2002:ac8:501:: with SMTP id u1mr21438796qtg.261.1599488762562; 
 Mon, 07 Sep 2020 07:26:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhGRYnA5hTdPLhq0TFkWqjOkagkQnP39SW4Ctvj8U0kr+dtoORI0W4y5NuudcQmcnN+v9EwA==
X-Received: by 2002:ac8:501:: with SMTP id u1mr21438763qtg.261.1599488762185; 
 Mon, 07 Sep 2020 07:26:02 -0700 (PDT)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id k48sm12271020qtk.44.2020.09.07.07.26.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Sep 2020 07:26:01 -0700 (PDT)
Subject: Re: [PATCH] soundwire: stream: fix an invalid free
To: Vinod Koul <vkoul@kernel.org>
References: <20200905192613.420-1-trix@redhat.com>
 <20200907141402.GC2639@vkoul-mobl>
From: Tom Rix <trix@redhat.com>
Message-ID: <93b672ef-76c9-e87c-4526-897b0af01945@redhat.com>
Date: Mon, 7 Sep 2020 07:25:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200907141402.GC2639@vkoul-mobl>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Cc: guennadi.liakhovetski@linux.intel.com, alsa-devel@alsa-project.org,
 kai.vehmanen@linux.intel.com, ndesaulniers@google.com,
 pierre-louis.bossart@linux.intel.com, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, natechancellor@gmail.com,
 yung-chuan.liao@linux.intel.com, sanyog.r.kale@intel.com
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


On 9/7/20 7:14 AM, Vinod Koul wrote:
> Hello Tom,
>
> On 05-09-20, 12:26, trix@redhat.com wrote:
>> From: Tom Rix <trix@redhat.com>
>>
>> clang static analyzer reports this problem
>>
>> stream.c:872:2: warning: Argument to kfree() is a constant
>>   address (18446744073709551092), which is not memory
>>   allocated by malloc()
>>         kfree(stream);
>>         ^~~~~~~~~~~~~
>>
>> In sdw_shutdown_stream() the stream to free is set by
>> a call to snd_soc_dai_get_sdw_stream().  The problem block
>> is the check if the call was successful.
>>
>> 	if (!sdw_stream) {
>> 		dev_err(rtd->dev, "no stream found...
>> 		return;
>> 	}
>>
>> When snd_soc_dai_get_sdw_stream() fails, it does not
>> always return null, sometimes it returns -ENOTSUPP.
>>
>> So also check for error codes.
>> Fixes: 4550569bd779 ("soundwire: stream: add helper to startup/shutdown streams")
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>  drivers/soundwire/stream.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
>> index 6e36deb505b1..950231d593c2 100644
>> --- a/drivers/soundwire/stream.c
>> +++ b/drivers/soundwire/stream.c
>> @@ -1913,7 +1913,7 @@ void sdw_shutdown_stream(void *sdw_substream)
>>  
>>  	sdw_stream = snd_soc_dai_get_sdw_stream(dai, substream->stream);
>>  
>> -	if (!sdw_stream) {
>> +	if (IS_ERR_OR_NULL(sdw_stream)) {
> Thanks for the patch. Please see commit 3471d2a192ba ("soundwire:
> stream: fix NULL/IS_ERR confusion") in soundwire-next. This has already
> been updated to IS_ERR() and Bard has already sent patches for
> snd_soc_dai_get_sdw_stream() to return proper values.
>
> So I you can rerun this on next, you should see this fixed.

I am working on linux-next, so I will see Bard's patch when it lands there.

Sorry for not working on soundwire-next, but since i am fixing everywhere linux-next is easiest. 

Thank you for the update.

Tom

>

