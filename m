Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0933451FFA0
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 16:26:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 838591816;
	Mon,  9 May 2022 16:25:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 838591816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652106368;
	bh=RmFKKHm/zNxF176Uu6i/9T/WV9+GLqHLCIUqgV5ZDXQ=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FFVBUGDJ4hX7LtfTtlW15WxtqFktyAoQjwMkIotIa5MZfGz1pntBeQrgFRtUFMpCC
	 7WnP1vNopLi4D1o7PD3WELePTdT3WMDb1ZaF/4XzYUhOR6cQ6pavp8yE3ful4RxWUn
	 w+jDj9t236tDoNEdud6bhEtfwbPC9L8nNYkQC6hM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E5476F80269;
	Mon,  9 May 2022 16:25:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92A86F8025D; Mon,  9 May 2022 16:25:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DA250F8011C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 16:25:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DA250F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J5OgOaYT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652106305; x=1683642305;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=RmFKKHm/zNxF176Uu6i/9T/WV9+GLqHLCIUqgV5ZDXQ=;
 b=J5OgOaYTQ8CGcp9fSmXH88Em0wy2WCvOxfLLIljqagL01jhgoPjvucw3
 qFoSWPnD/yOj/WUvtSCBk5FIqgyeVeBjKkGkhICtT076nIKmWmZcTObLN
 n4LXEMf0bEGZZzkz5OwjrPwOm6McGQQoKlqpPYGJASYbt/iNIp4w00sIb
 5sYGZIo+dT/TjAyTI5/rCX3MycxbNK5D1au+/p+plevjYr0VgfV0912cY
 aje/bEiLC8L+7pl+OjTjN58DCDXgNn8lexILslLAkTe4KC30ePeKoDZ5+
 nPP8e3kni5xJauaNcdfiRNTvfE3v4bs6wVIEOMnnBjc/c8TB8GEQOKX91 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="268731095"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="268731095"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:25:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="592510983"
Received: from gfgerman-mobl1.amr.corp.intel.com (HELO [10.209.80.95])
 ([10.209.80.95])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:25:00 -0700
Message-ID: <97cd6566-e686-e1f2-fe91-4b4ba9d95f12@linux.intel.com>
Date: Mon, 9 May 2022 09:24:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH v2] soundwire: qcom: adjust autoenumeration timeout
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, vkoul@kernel.org
References: <20220506084705.18525-1-srinivas.kandagatla@linaro.org>
 <725af523-d144-e373-e09b-fb48b3afb9ed@linux.intel.com>
 <8643d266-7108-2440-43e1-c51b829ba481@linaro.org>
 <d9646029-29b1-d71b-d1f5-b33267888e3c@linux.intel.com>
 <fd355232-c5e3-ba1b-801d-526ee6f04946@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <fd355232-c5e3-ba1b-801d-526ee6f04946@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 bard.liao@intel.com, Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
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


>>> You could say why do we need wait itself in the first place.
>>>
>>> The reason we need wait in first place is because, there is a danger of
>>> codec accessing registers even before enumeration is finished. Because
>>> most of the ASoC codec registration happens as part of codec/component
>>> driver probe function rather than status callback.
>>>
>>> I hope this answers your questions.
>>
>>
>> Humm, not really.
>>
>> First, you're using this TIMEOUT_MS value in 3 unrelated places, and
>> using 2 different struct completion, which means there are side effects
>> beyond autoenumeration.
> 
> 2 of these 3 are autoenum ones, one is in probe path and other in bus
> reset path during pm.
> 
> The final one is broadcast timeout, new timeout value should be okay for
> that too, given that we need 10ms timeout.

probably better to make things explicit with a different timeout value
for the broadcast case.

100ms for a broadcast is really eons, it's supposed to be immediate really.

>> And then I don't get what you do on a timeout. in the enumeration part,
> 
> We can't do much on the timeout.
> 
>> the timeout value is not checked for, so I guess enumeration proceeds
>> without the hardware being available? That seems to contradict the
>> assertion that you don't want to access registers before the hardware is
>> properly initialized.
> 
> Even if enumeration timeout, we will not access the registers because
> the ASoC codec is not registered yet from WCD938x component master.

What happens when the codec is registered then? the autoenumeration
still didn't complete, so what prevents the read/writes from failing then?

>> And then on broadcast you have this error handling:
>>
>>         ret = wait_for_completion_timeout(&swrm->broadcast,
>>                           msecs_to_jiffies(TIMEOUT_MS));
>>         if (!ret)
>>             ret = SDW_CMD_IGNORED;
>>         else
>>             ret = SDW_CMD_OK;
>>
>> Which is equally confusing since SDW_CMD_IGNORED is really an error, and
>> the bus layer does not really handle it well - not to mention that I
>> vaguely recall the qcom hardware having its own definition of IGNORED?
> QCom hardware alteast the version based on which this driver was written
> did not have any support to report errors type back on register
> read/writes.
> 
> In this case a broad cast read or write did not generate a complete
> interrupt its assumed that its ignored, as there is no way to say if its
> error or ignored.

ok, that should be fine.

The code in bus.c mostly ignores -ENODATA for the suspend cases. For the
bank switch, I forgot that we also ignore it, Bard added a patch in
2021. The only case where we abort a transfer is on a real error.



