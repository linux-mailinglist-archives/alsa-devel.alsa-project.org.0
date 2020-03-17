Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3925018893E
	for <lists+alsa-devel@lfdr.de>; Tue, 17 Mar 2020 16:34:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C2E18167E;
	Tue, 17 Mar 2020 16:33:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C2E18167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584459271;
	bh=kMsY72mmL59mXN7CXQN6FNdo05HIidCYjxCMHysgvtM=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k86ZpTHeHQdYFx2DlRF7q9rmeQQ9N3TFCX7FCDqeH0gCD3ZrXGP4Mf63vDO/qoNwl
	 QCYNAwase8T2gYX7d7UGVY8/Hdr/p1HtBmEv2VVAkrv3RMxa/kkv+I5G4+SJhV+9jh
	 ewHgYwWGTOiGEuIXNSoe5GjJGP7uje7vk0XgAQq0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7F1D2F800C0;
	Tue, 17 Mar 2020 16:32:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 61AAAF8022B; Tue, 17 Mar 2020 16:32:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5F27EF80058
 for <alsa-devel@alsa-project.org>; Tue, 17 Mar 2020 16:32:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5F27EF80058
IronPort-SDR: 45f5ErQX4fOk1A4nnaebVLkoNG/hM3eurortqkZQWZkgT2NlZsrbPUZU+uSQrJri6PKzHQjECY
 aG/zdbES1riw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Mar 2020 08:32:36 -0700
IronPort-SDR: AlObTxabHgmiM6Jn3ywAh/Yt0oaBfUo/bqhYV9hSVEb6s6cToF6f79VnvrY/w1+8SKKs8wIUcS
 rEU7Bof4w0Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,564,1574150400"; d="scan'208";a="268002291"
Received: from atthomas-mobl.amr.corp.intel.com (HELO [10.255.32.45])
 ([10.255.32.45])
 by fmsmga004.fm.intel.com with ESMTP; 17 Mar 2020 08:32:33 -0700
Subject: Re: [PATCH] soundwire: stream: only change state if needed
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 alsa-devel@alsa-project.org
References: <20200317105142.4998-1-pierre-louis.bossart@linux.intel.com>
 <6bc8412a-f6d9-64d1-2218-ca98cfdb31c0@linaro.org>
 <27a73cbd-9418-4488-5cb2-fb21f9fc9110@linux.intel.com>
 <c1e5dc89-a069-a427-4912-89d90ecc0334@linaro.org>
 <6dde3b32-a29a-3ac9-d95d-283f5b05e64a@linux.intel.com>
 <7c7b334d-ae5c-35f6-9cf3-04700677211f@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7a362c6a-364e-499a-e841-0a919f48bf84@linux.intel.com>
Date: Tue, 17 Mar 2020 10:31:29 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <7c7b334d-ae5c-35f6-9cf3-04700677211f@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, vkoul@kernel.org, broonie@kernel.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


>>>> The change below would be an error case for Intel, so it's probably 
>>>> better if we go with your suggestion. You have a very specific state 
>>>> handling due to your power amps and it's probably better to keep it 
>>>> platform-specific.
>>>
>>> Just trying to understand, why would it be error for Intel case?
>>>
>>> IMO, If stream state is SDW_STREAM_ENABLED that also implicit that 
>>> its prepared too. Similar thing with SDW_STREAM_DEPREPARED.
>>> Isn't it?
>>
>> the stream state is a scalar value, not a mask. The state machine only 
>> allows transition from CONFIGURED TO PREPARED or from DEPREPARED TO 
>> PREPARED, or DISABLED to PREPARED.
>> There is no allowed transition from ENABLED TO PREPARED, you have to 
>> go through the DISABLED state and make sure a bank switch occurred, 
>> and re-do a bank switch to prepare again.
> I agree with you if are on single dai case. Am happy to move to stream 
> handling to machine driver for now.
> 
> But this also means that in cases like multi-codec its not recommended 
> to call sdw_prepare and sdw_enable in a single function from codec.
> Which might be worth documenting.

Well, the bigger question is why use sdw_stream functions at the codec 
level in the first place? All other codec drivers seem to have no issue 
leaving the dais owned by the master control stream state changes.

I am not saying I object or it's bad, just that there were significant 
changes in usages of the 'stream' concept since it was introduced, as 
well as threads in MIPI circles to clarify the prepare/enable 
dependencies, so it'd be useful to have a complete picture of what 
different platforms need/want.
