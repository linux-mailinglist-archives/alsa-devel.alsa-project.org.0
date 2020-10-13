Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 223B028D505
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Oct 2020 21:59:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 97B3716B1;
	Tue, 13 Oct 2020 21:58:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 97B3716B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1602619178;
	bh=R08Rplzb7Qmig2ikDrR1hhBZlw+3MvUoLWwORtYKxBk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=opCjG28i46FSLvYo80lGfWPbWRHxVsmvx+F2cs+BZqDYb3/18wkI9Vy6FI0qZvnaY
	 ozysMl+eC14O0X7MbhC/JM+zFHzXhBXkXUtDc3KSHtezpc6IbKXt7LQ2fj/B0ZPW8+
	 pk1hQO4Y9UaJYtxKs3gNWaYum31Y56ctgGv+XDdY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3D12BF801A3;
	Tue, 13 Oct 2020 21:57:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1DB16F800CE; Tue, 13 Oct 2020 21:57:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=NICE_REPLY_A,PRX_BODY_14,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B9D82F800CE
 for <alsa-devel@alsa-project.org>; Tue, 13 Oct 2020 21:57:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B9D82F800CE
IronPort-SDR: iYRio/yKt5ERIqBwcygE37//qc18lQCUIZCwgwc36unYCxHTa+XpagFXZOjoHTo6DcyJtvOIiL
 oyyWI3B6ABjg==
X-IronPort-AV: E=McAfee;i="6000,8403,9773"; a="166038523"
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="166038523"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 12:57:45 -0700
IronPort-SDR: d0IlcAIZDMxhhDk4Vn2AdgtgrpwB9JQaofY6SZeFhcib7oole0qgEOyzyHL1s4NdDdNZIlJH9b
 0FpHvLq3v3CQ==
X-IronPort-AV: E=Sophos;i="5.77,371,1596524400"; d="scan'208";a="390428718"
Received: from maryannn-mobl.amr.corp.intel.com (HELO [10.209.70.94])
 ([10.209.70.94])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 12:57:43 -0700
Subject: Re: [PATCH v2 2/6] ASoC: SOF: Introduce descriptors for SOF client
To: Randy Dunlap <rdunlap@infradead.org>,
 Dave Ertman <david.m.ertman@intel.com>, alsa-devel@alsa-project.org
References: <20201005182446.977325-1-david.m.ertman@intel.com>
 <20201005182446.977325-3-david.m.ertman@intel.com>
 <076a0c53-0738-270e-845f-0ac968a4ea78@infradead.org>
 <d9f062ee-a5f0-b41c-c8f6-b81b374754fa@linux.intel.com>
 <9ef98f33-a0d3-579d-26e0-6046dd593eef@infradead.org>
 <5b447b78-626d-2680-8a48-53493e2084a2@infradead.org>
 <7192373a-0347-2d2d-74fc-6544f738b195@linux.intel.com>
 <b07f6cbc-8e48-a4aa-bfcb-8a938fa00a38@infradead.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <91f0e062-5878-562c-c055-5dc597d4841f@linux.intel.com>
Date: Tue, 13 Oct 2020 14:57:07 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <b07f6cbc-8e48-a4aa-bfcb-8a938fa00a38@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: parav@mellanox.com, tiwai@suse.de, netdev@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, fred.oh@linux.intel.com,
 linux-rdma@vger.kernel.org, dledford@redhat.com, broonie@kernel.org,
 jgg@nvidia.com, gregkh@linuxfoundation.org, kuba@kernel.org,
 dan.j.williams@intel.com, shiraz.saleem@intel.com, davem@davemloft.net,
 kiran.patil@intel.com
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


>>>>>>> +config SND_SOC_SOF_CLIENT_SUPPORT
>>>>>>> +    bool "SOF enable clients"
>>>>>>
>>>>>> Tell users what "SOF" means.
>>>>>
>>>>> This option can only be reached if the user already selected the topic-level option. From there on the SOF acronym is used. Is this not enough?
>>>>
>>>> Yes, that's enough. I didn't see it. Sorry about that.
>>>
>>> Huh. I still don't see that Kconfig option.
>>> Which patch is it in?
>>>
>>> I only saw patches 1,2,3 on LKML.
>>
>> The Sound Open Firmware (SOF) driver is upstream since 2019, see https://elixir.bootlin.com/linux/latest/source/sound/soc/sof/Kconfig
>>
>> What was shared in these patches is just an evolution to make the driver more modular to handle of 'subfunctions' with the auxiliary bus.
>>
>> we'd love to hear your feedback if you think the help text can be improved. Thanks!
>>
> 
> OK, I looked at the SOF Kconfig files. They are mostly OK except for
> missing '.' at the end of lots of sentences and a few other typos.
> 
> Do you want patches?

Sure! Thanks in advance.
