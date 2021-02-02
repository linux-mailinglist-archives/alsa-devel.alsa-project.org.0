Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CB830C7BD
	for <lists+alsa-devel@lfdr.de>; Tue,  2 Feb 2021 18:30:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 718CB1788;
	Tue,  2 Feb 2021 18:29:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 718CB1788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612287020;
	bh=zm1MPrUhj1UuLRrU9gqRLjVl10m31WM8jmwUzJLj+GE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XibpHhzjwPtkrMG3vUyCXk3jV6mBECEtnAKiiEM3cHa9OObv0TzcGvDtTGD5oAY+b
	 fJf7hB08+Wm/NR7ZwFsA0C2+MfEYU4B9Fj4sUXZiDiKVWd39oWW3TMdyJq5ptPA4A+
	 o3gKNzhO7iUDKAgRwyh6qXX8nO7VTHe1cipF5kFw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6F5BEF80171;
	Tue,  2 Feb 2021 18:28:00 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D0900F8023B; Tue,  2 Feb 2021 18:27:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B3D8BF80152
 for <alsa-devel@alsa-project.org>; Tue,  2 Feb 2021 18:27:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B3D8BF80152
IronPort-SDR: vddZnQgG/NA9GBbN6GJjRga7lMO/ebn/rAEFZapCVuAa4Z8TZkvIWucPmBR2dkNbyRo9rXPt9i
 RYx2LwivBvSQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="265726531"
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="265726531"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 09:27:49 -0800
IronPort-SDR: HfFg+VQ4ZEeKVhk/vhJsVfeAKKZst4btROqlGQgAxTN89jRrSMDa05gehdk5qY7c3sM6Pdt7KB
 cpNrvBd+eG1A==
X-IronPort-AV: E=Sophos;i="5.79,396,1602572400"; d="scan'208";a="370798503"
Received: from ncruzgar-mobl.amr.corp.intel.com (HELO [10.212.75.122])
 ([10.212.75.122])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Feb 2021 09:27:48 -0800
Subject: Re: [PATCH 5/6] soundwire: qcom: update register read/write routine
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-6-srinivas.kandagatla@linaro.org>
 <5c69ed09-60be-2f3d-ed25-f6dbfcb9d62f@linux.intel.com>
 <3a2b5c2d-21aa-2bf5-62df-ef85c7c9293c@linaro.org>
 <b87758d0-5862-3b4e-5a90-7b27d0c78d0d@linux.intel.com>
 <4e3ebb99-5647-f71c-1256-a2c55bd9995f@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <25ca91d5-4492-34f8-46df-4cb53c3a0b1b@linux.intel.com>
Date: Tue, 2 Feb 2021 10:58:05 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4e3ebb99-5647-f71c-1256-a2c55bd9995f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: sanyog.r.kale@intel.com, yung-chuan.liao@linux.intel.com,
 linux-kernel@vger.kernel.org, alsa-devel@alsa-project.org
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


>>>>> generates interrupt after it successfully finishes. This is really
>>>>> overhead, limiting and not really necessary unless we are doing
>>>>> something special.
>>>>>
>>>>> We can simply read/write the fifo that should also give exactly
>>>>> what we need! This will also allow to read/write registers in
>>>>> interrupt context, which was not possible with the special
>>>>> command approach.
>>>>
>>>> This is really unclear, sorry.
>>>
>>> If read/writes are waiting for an interrupt, it becomes difficult to 
>>> read or write to any registers from same interrupt handler!
>>
>> Well, yes, you need to handle the complete() at a lower level than the 
>> code that initiates the transactions otherwise you self-deadlock.
>>
>> IIRC in the Intel initial code, the complete was in the handler and 
>> the register IOs in the thread.
>>
> Yes, we did the same in previous version of the code, however with this 
> patch reading/writing fifo directly without need of completion should 
> remove that need of another thread!

Right, but you'll also write-off some command/control efficiency by 
either sleeping too much before checking the status, or sleeping too 
little and reading status from a transaction that's not finished.
