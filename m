Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBFC26129F
	for <lists+alsa-devel@lfdr.de>; Tue,  8 Sep 2020 16:24:22 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DAA271792;
	Tue,  8 Sep 2020 16:23:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DAA271792
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599575061;
	bh=d2WoSnF+sJyfhm362v/0Te7p052EtZ6aCcVs+WFCdRE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CB4yCFecB/8rEIZwbIqSfk9x18AKZ0eEH+Q4b3el3xwJlgVa+k0TYTnQEywpiNYJj
	 iwE8SfOHCrCz0s/EptTVvLazJbrWML9eN83crpble1TK7X0sdCc0aRBKZy56RXdvYS
	 mXTLcxgT5FPhlbEDd6sEpgZHTCsPMFjKDdh/XDQs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 29F89F802C4;
	Tue,  8 Sep 2020 16:21:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2CFCCF80277; Tue,  8 Sep 2020 16:21:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=NICE_REPLY_A,
 RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL, SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 55188F801F2
 for <alsa-devel@alsa-project.org>; Tue,  8 Sep 2020 16:21:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 55188F801F2
IronPort-SDR: khL4NL3zGUE8rwxPAxOTJnlr6aN5KdEiKM6Zr4VVsKI/OUn6OPGbQMaQAG5z4xf+JT3Jh1Gpyt
 LulmWH/UV9pg==
X-IronPort-AV: E=McAfee;i="6000,8403,9737"; a="159106187"
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="159106187"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 07:21:37 -0700
IronPort-SDR: Jlr6cLUOaTW1MGk/PTu3PoKiu7Df7IKWpl/6fWCb0o3Mws6srCxC5FJRdz4OpuKICxzUP6/TVR
 RLqGwXD6ExFQ==
X-IronPort-AV: E=Sophos;i="5.76,406,1592895600"; d="scan'208";a="448802366"
Received: from mgarber-mobl1.amr.corp.intel.com (HELO [10.212.179.134])
 ([10.212.179.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2020 07:21:36 -0700
Subject: Re: [RFC PATCH 1/3] topology: use inclusive language for bclk
To: Takashi Iwai <tiwai@suse.de>
References: <20200903201024.1109914-1-pierre-louis.bossart@linux.intel.com>
 <20200903201024.1109914-2-pierre-louis.bossart@linux.intel.com>
 <s5hd03152mr.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <deaae562-80f2-a934-d551-ac5d9a047bbf@linux.intel.com>
Date: Tue, 8 Sep 2020 08:39:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hd03152mr.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, broonie@kernel.org
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




>>   /* DAI topology FSYNC parameter
>>    * For the backwards capability, by default codec is fsync master
>> @@ -335,7 +338,7 @@ struct snd_soc_tplg_hw_config {
>>   	__u8 clock_gated;	/* SND_SOC_TPLG_DAI_CLK_GATE_ value */
>>   	__u8 invert_bclk;	/* 1 for inverted BCLK, 0 for normal */
>>   	__u8 invert_fsync;	/* 1 for inverted frame clock, 0 for normal */
>> -	__u8 bclk_master;	/* SND_SOC_TPLG_BCLK_ value */
>> +	__u8 bclk_provider;	/* SND_SOC_TPLG_BCLK_ value */
>>   	__u8 fsync_master;	/* SND_SOC_TPLG_FSYNC_ value */
>>   	__u8 mclk_direction;    /* SND_SOC_TPLG_MCLK_ value */
>>   	__le16 reserved;	/* for 32bit alignment */
> 
> Is it 100% compatible?  Note that the uapi/* header is a copy from the
> kernel header, and it means that we'll change the same for the kernel,
> too.

It's absolutely 100% compatible by design.
I was planning to update the kernel uapi header to align changes, but 
the volume of code is much lower on the alsa-lib side. Will resubmit 
with the preferred provider/consumer wording.
