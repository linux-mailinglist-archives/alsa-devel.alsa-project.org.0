Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F15B819F9C8
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 18:08:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 86F9D1682;
	Mon,  6 Apr 2020 18:07:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 86F9D1682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586189291;
	bh=E2ZF6ePEb4ZuZka/H0BZRMmepuDSGAYc8dOFjjoErVg=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UF1R+lvQNFobxrpgw9P6k0Y/E+gLDxnnsx1jw96R074vyKzXP/nqMsRoY1ei822VQ
	 b3UObOsG0hc7LCvCmUGoR6SN0q7BqA9LXlZ7oJ2yHecIU2HfBL3YNwzWBgfTaDd9S7
	 YlFzkSHwwnlfNfrZqZ0ryvPyY/jqrk3AMUjG15F4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D1B1FF800CC;
	Mon,  6 Apr 2020 18:05:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8D690F8015D; Mon,  6 Apr 2020 18:05:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5AB79F800CC
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 18:05:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5AB79F800CC
IronPort-SDR: IszRwbxzHnoT45Qlofc+LApK9dxVE5RZIAXZRpTIS1Dby1oFFDANs5VVLBtnJmCMQKaqFDUS4f
 on5rX3eHmaEg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2020 09:05:31 -0700
IronPort-SDR: uz3vHQb5nBj8PaopWVqGPmPAa7VzFYcvgVEZ1Nwf3Mb6qWt0SjZ7JOiKwHOQRhb25WEru3JSIG
 8KoO6tsPTrSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,351,1580803200"; d="scan'208";a="361256308"
Received: from mmarathe-mobl1.amr.corp.intel.com (HELO [10.212.38.219])
 ([10.212.38.219])
 by fmsmga001.fm.intel.com with ESMTP; 06 Apr 2020 09:05:31 -0700
Subject: Re: [PATCH] ASoC: Intel: haswell: Power transition refactor
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200330194520.13253-1-cezary.rojewski@intel.com>
 <293372ae-5270-a1d4-2577-04991c08e33f@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ee6c0545-a325-8df4-9c26-d823582735af@linux.intel.com>
Date: Mon, 6 Apr 2020 10:02:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <293372ae-5270-a1d4-2577-04991c08e33f@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: vkoul@kernel.org, broonie@kernel.org, Ross Zwisler <zwisler@google.com>,
 lgirdwood@gmail.com, tiwai@suse.com
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



On 4/6/20 3:48 AM, Cezary Rojewski wrote:
> On 2020-03-30 21:45, Cezary Rojewski wrote:
>> Update D0 <-> D3 sequence to correctly transition hardware and DSP core
>> from and to D3. On top of that, set SHIM registers to their recommended
>> defaults during D0 and D3 proceduces as HW does not reset registers for
>> us.
>>
>> Connected to:
>> [alsa-devel][BUG] bdw-rt5650 DSP boot timeout
>> https://mailman.alsa-project.org/pipermail/alsa-devel/2019-July/153098.html 
>>
>>
>> Github issue ticket reference:
>> https://github.com/thesofproject/linux/pull/1842
>>
>> Tested on:
>> - BDW-Y RVP with rt286
>> - SAMUS with rt5677
>>
>> Proposed solution (both in July 2019 and on github):
>> 'Revert "ASoC: Intel: Work around to fix HW d3 potential crash issue"'
>> is NAKed as it only covers the problem up and actually brings back the
>> undefined behavior: some registers (e.g.: APLLSE) are describing LPT
>> offsets rather than WPT ones. In consequence, during power-transitions
>> driver issues incorrect writes and leaves the regs of interest alone.
>>
>> Existing patch - the non-revert - does not resolve the HW D3 issue at
>> all as it ignores the recommended sequence and does not initialize
>> hardware registers as expected. And thus, leaving things as are is also
>> unacceptable.
>>
>> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> ---
> 
> Pierre, your thoughts on this? This has already been confirmed working.

I don't have any specific knowledge on Broadwell to comment. I also 
haven't had time to test this patch, I was expecting Ross to provide his 
Tested-by tag?
