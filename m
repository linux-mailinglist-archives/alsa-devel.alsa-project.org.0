Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADDC258437
	for <lists+alsa-devel@lfdr.de>; Tue,  1 Sep 2020 00:50:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 968CF1754;
	Tue,  1 Sep 2020 00:49:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 968CF1754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598914231;
	bh=n6RC2ProXWluq+rrfq0tixqJ6LZkVrMR87L9iSpHrXM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qGHiwG7sBh+oK0IDVONSzQfWzXt/ta3LztzjIDx5icQk32FYJtC9QpZVro5xD2p15
	 RzSUuarXBIJeDlRRLTVzS6Jkzji7KFjptIne0pcLf0OQ5GHpxIoWUN+SqH9P8VVcLI
	 7SotFfYr+NkWHjXUnAUV40YeEpLovgMrQ+Xfjhu4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C8AB9F80146;
	Tue,  1 Sep 2020 00:48:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC434F80212; Tue,  1 Sep 2020 00:47:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDEBDF80146
 for <alsa-devel@alsa-project.org>; Tue,  1 Sep 2020 00:45:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDEBDF80146
IronPort-SDR: N9IBD6zkjMPWklGgQQNg3cKo+6PNUr0v/0AVRkF6oVJ+/Sopb/h0Q/k2eXmGe+jv4tQfuIxRx+
 /akUv7h8Hn8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9730"; a="137119186"
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="137119186"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 15:45:50 -0700
IronPort-SDR: 3kPxLytFyQve8EiS/uttvND6c2LCCoHrm5YB6W2Mw06GdR2cgpi/ZxoMVwBxijCRcTsaM9QPxn
 1UyXl7v06HHg==
X-IronPort-AV: E=Sophos;i="5.76,376,1592895600"; d="scan'208";a="476932222"
Received: from rmalladi-mobl.amr.corp.intel.com (HELO [10.254.176.90])
 ([10.254.176.90])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2020 15:45:49 -0700
Subject: Re: [PATCH] soundwire: fix error handling
To: Nick Desaulniers <ndesaulniers@google.com>, trix@redhat.com
References: <20200829153515.3840-1-trix@redhat.com>
 <CAKwvOd=+X2AakX3kTYCvyug-MK_Y+atDbkDSRxA0pUfOatQ3mA@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <aae0bf86-5900-c437-492f-fbf23d3ff196@linux.intel.com>
Date: Mon, 31 Aug 2020 17:45:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAKwvOd=+X2AakX3kTYCvyug-MK_Y+atDbkDSRxA0pUfOatQ3mA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, LKML <linux-kernel@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, shreyas.nc@intel.com,
 Nathan Chancellor <natechancellor@gmail.com>, yung-chuan.liao@linux.intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>
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



On 8/31/20 12:47 PM, Nick Desaulniers wrote:
> On Sat, Aug 29, 2020 at 8:35 AM <trix@redhat.com> wrote:
>>
>> From: Tom Rix <trix@redhat.com>
>>
>> clang static analysis flags this problem
>>
>> stream.c:844:9: warning: Use of memory after
>>    it is freed
>>          kfree(bus->defer_msg.msg->buf);
>>                ^~~~~~~~~~~~~~~~~~~~~~~
>>
>> This happens in an error handler cleaning up memory
>> allocated for elements in a list.
>>
>>          list_for_each_entry(m_rt, &stream->master_list, stream_node) {
>>                  bus = m_rt->bus;
>>
>>                  kfree(bus->defer_msg.msg->buf);
>>                  kfree(bus->defer_msg.msg);
>>          }
>>
>> And is triggered when the call to sdw_bank_switch() fails.
>> There are a two problems.
>>
>> First, when sdw_bank_switch() fails, though it frees memory it
>> does not clear bus's reference 'defer_msg.msg' to that memory.
>>
>> The second problem is the freeing msg->buf. In some cases
>> msg will be NULL so this will dereference a null pointer.
>> Need to check before freeing.
>>
>> Fixes: 99b8a5d608a6 ("soundwire: Add bank switch routine")
>> Signed-off-by: Tom Rix <trix@redhat.com>
>> ---
>>   drivers/soundwire/stream.c | 8 +++++---
>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
>> index 37290a799023..6e36deb505b1 100644
>> --- a/drivers/soundwire/stream.c
>> +++ b/drivers/soundwire/stream.c
>> @@ -717,6 +717,7 @@ static int sdw_bank_switch(struct sdw_bus *bus, int m_rt_count)
>>          kfree(wbuf);
>>   error_1:
>>          kfree(wr_msg);
>> +       bus->defer_msg.msg = NULL;
> 
> This fix looks correct to me because L668 sets `bus->defer_msg.msg =
> wr_msg;`, but on error L719 frees `wr_msg`, so now
> `bus->defer_msg.msg` is a dangling pointer.
> 
>>          return ret;
>>   }
>>
>> @@ -840,9 +841,10 @@ static int do_bank_switch(struct sdw_stream_runtime *stream)
>>   error:
>>          list_for_each_entry(m_rt, &stream->master_list, stream_node) {
>>                  bus = m_rt->bus;
>> -
>> -               kfree(bus->defer_msg.msg->buf);
>> -               kfree(bus->defer_msg.msg);
>> +               if (bus->defer_msg.msg) {
>> +                       kfree(bus->defer_msg.msg->buf);
>> +                       kfree(bus->defer_msg.msg);
>> +               }
> 
> I'd prefer a conditional check for each, but sdw_ml_sync_bank_switch()
> has this same pattern, so it looks like the lifetime of these two
> match.
> 
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Also looks good to me.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
