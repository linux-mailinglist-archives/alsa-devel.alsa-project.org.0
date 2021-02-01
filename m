Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C85EB30AEE2
	for <lists+alsa-devel@lfdr.de>; Mon,  1 Feb 2021 19:16:46 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 63EFF1769;
	Mon,  1 Feb 2021 19:15:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 63EFF1769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612203401;
	bh=rDGINYABbeNDbYSbsIwVgtNsJKutry0SpMNHmRXmiVA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=shXuHxhII6jEdAbsK5eWR/lncGehGgHGsOAPYsf/4HoKXpwjbLN7Drh45Ny/Hpwlg
	 xh3lw2Tx1MGeV7pP1UGTFvnXEM9bUJWuw6L27iA0hWGhsa5o1bXPEq7heeh58it1Za
	 UejKCkuuF81Trjf75GQF4zU/XhQa/iodA6uDtZLc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D822CF802D2;
	Mon,  1 Feb 2021 19:13:44 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BDFECF80156; Mon,  1 Feb 2021 19:13:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A6A8AF80153
 for <alsa-devel@alsa-project.org>; Mon,  1 Feb 2021 19:13:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A6A8AF80153
IronPort-SDR: +iAveLoTC7etIDkW+31XcPjPOyTYBV/Qx3vAxxG18IXcuezBe3BLRDbpU2t8fcxKW2TaBBjtvJ
 u1mGkVxxzsOA==
X-IronPort-AV: E=McAfee;i="6000,8403,9882"; a="167833512"
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="167833512"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 10:13:28 -0800
IronPort-SDR: gSXK9Wz0LLbo/1o2z8pNJICOfR2OtG/gUJ5mkpRd5bum4FfrsAv7S3wwQcC7KgsPWMOD4zz5GO
 T+j5E3uPaGJA==
X-IronPort-AV: E=Sophos;i="5.79,393,1602572400"; d="scan'208";a="412516938"
Received: from dkhaldi-mobl1.amr.corp.intel.com (HELO [10.212.126.61])
 ([10.212.126.61])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Feb 2021 10:13:27 -0800
Subject: Re: [PATCH 5/6] soundwire: qcom: update register read/write routine
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20210129173248.5941-1-srinivas.kandagatla@linaro.org>
 <20210129173248.5941-6-srinivas.kandagatla@linaro.org>
 <5c69ed09-60be-2f3d-ed25-f6dbfcb9d62f@linux.intel.com>
 <3a2b5c2d-21aa-2bf5-62df-ef85c7c9293c@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b87758d0-5862-3b4e-5a90-7b27d0c78d0d@linux.intel.com>
Date: Mon, 1 Feb 2021 10:42:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <3a2b5c2d-21aa-2bf5-62df-ef85c7c9293c@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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



On 2/1/21 9:50 AM, Srinivas Kandagatla wrote:
> 
> 
> On 29/01/2021 19:33, Pierre-Louis Bossart wrote:
>>
>>
>> On 1/29/21 11:32 AM, Srinivas Kandagatla wrote:
>>> In the existing code every soundwire register read and register write
>>> are kinda blocked. Each of these are using a special command id that
>>
>> what does 'kinda blocked' mean?
> 
> I meant read/writes are waiting for completion interrupt!
> 
>>
>>> generates interrupt after it successfully finishes. This is really
>>> overhead, limiting and not really necessary unless we are doing
>>> something special.
>>>
>>> We can simply read/write the fifo that should also give exactly
>>> what we need! This will also allow to read/write registers in
>>> interrupt context, which was not possible with the special
>>> command approach.
>>
>> This is really unclear, sorry.
> 
> If read/writes are waiting for an interrupt, it becomes difficult to 
> read or write to any registers from same interrupt handler!

Well, yes, you need to handle the complete() at a lower level than the 
code that initiates the transactions otherwise you self-deadlock.

IIRC in the Intel initial code, the complete was in the handler and the 
register IOs in the thread.

> 
> 
>>
>>> +    if (id != SWR_BROADCAST_CMD_ID) {
>>> +        if (id < 14)
>>> +            id += 1;
>>> +        else
>>> +            id = 0;
>>
>> that is really odd. if id=13 (group2) then id becomes 14 (master 
>> address). A comment is really needed here.
> 
> This is magic value for each fifo read or write, so that we can verify 
> that them by comparing with this magic value!
> 
> This has nothing to do with device number!

You should probably add a comment here then, or use a #define instead of 
the 14 which threw me off.

> 
>>
>>> +    if (cmd_id == SWR_BROADCAST_CMD_ID) {
>>> +        /*
>>> +         * sleep for 10ms for MSM soundwire variant to allow broadcast
>>> +         * command to complete.
>>
>> that's also super-odd. There is nothing in SoundWire that makes any 
>> difference between a regular and a broadcast command. they all 
>> complete in the same time (a frame).
>>> +         */
>>> +        ret = wait_for_completion_timeout(&swrm->broadcast, (2 * 
>>> HZ/10));
>>
>> is this 10ms really or dependent on CONFIG_HZ?

comment missed?

>>
>>> +        if (!ret)
>>> +            ret = SDW_CMD_IGNORED;
>>> +        else
>>> +            ret = SDW_CMD_OK;
>>
>> no CMD_FAILED support?
> 
> Qcom controllers does not provide that information if the command is 
> ignored or failed by any means!
> 
> That was the behavior from the starting of this driver.

ah yes, now I remember this.
