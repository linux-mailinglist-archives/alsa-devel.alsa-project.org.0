Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AB93009E0
	for <lists+alsa-devel@lfdr.de>; Fri, 22 Jan 2021 18:32:34 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5ED9E1EF3;
	Fri, 22 Jan 2021 18:31:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5ED9E1EF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1611336754;
	bh=NAbskHsLY4u+M5BMVt2cTCodofYTtwKosFHirQyK40U=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=fmAWqgoifb+lsFrKV5jDO0OLCB/kEH9D3W5h3zLhVssHQ2x5veXCPMMvNnksoVow8
	 GuxY/9cFkDl93tBYJPGdV4G4rptPJIGQP/PuXPN3ujkO/8jA4/JwJJ65FR8Rb6QQ9G
	 sIXpGi44zYVpuE7aqx2EzCL4QNsfSv7vSmc1/7SY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C80E0F8019B;
	Fri, 22 Jan 2021 18:30:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B5169F8016E; Fri, 22 Jan 2021 18:30:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id ABA90F80129
 for <alsa-devel@alsa-project.org>; Fri, 22 Jan 2021 18:30:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz ABA90F80129
IronPort-SDR: AhYDhC3mwCmnXaHA8QYl3/XEEe/SKo2hC1cWzZrpoJoQjurG1jVY94c8QL34paaotQn9jWhEZD
 fxq1+1JzvkvA==
X-IronPort-AV: E=McAfee;i="6000,8403,9872"; a="167159438"
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; d="scan'208";a="167159438"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 09:30:38 -0800
IronPort-SDR: LZXl21KXyG7Fk2Z9KyJIFfZiZvf9AxEHAY2BrzsArYM5I+Rjokf04DUPkrEPXFFk+e5azegNDX
 dKmcDlJdT4ow==
X-IronPort-AV: E=Sophos;i="5.79,367,1602572400"; d="scan'208";a="400737391"
Received: from gabel-mobl1.amr.corp.intel.com (HELO [10.251.128.206])
 ([10.251.128.206])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jan 2021 09:30:37 -0800
Subject: Re: [PATCH 2/2] ASoC: SOF: SND_INTEL_DSP_CONFIG dependency
To: Takashi Iwai <tiwai@suse.de>
References: <20210122005725.94163-1-pierre-louis.bossart@linux.intel.com>
 <20210122005725.94163-3-pierre-louis.bossart@linux.intel.com>
 <s5hwnw58i1y.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b84e78cb-b8a7-f62a-79ef-dab4e67decdc@linux.intel.com>
Date: Fri, 22 Jan 2021 09:38:55 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hwnw58i1y.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Arnd Bergmann <arnd@kernel.org>, alsa-devel@alsa-project.org,
 broonie@kernel.org, vkoul@kernel.org, Arnd Bergmann <arnd@arndb.de>
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


>> The sof-pci-dev driver fails to link when built into the kernel
>> and CONFIG_SND_INTEL_DSP_CONFIG is set to =m:
>>
>> arm-linux-gnueabi-ld: sound/soc/sof/sof-pci-dev.o: in function `sof_pci_probe':
>> sof-pci-dev.c:(.text+0x1c): undefined reference to `snd_intel_dsp_driver_probe'
>>
>> As a temporary fix, use IS_REACHABLE to prevent the problem from
>> happening. A more complete solution is to move this code to
>> Intel-specific parts, restructure the drivers and Kconfig as discussed
>> with Arnd Bergmann and Takashi Iwai.
>>
>> Fixes: 82d9d54a6c0e ("ALSA: hda: add Intel DSP configuration / probe code")
>> Reported-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> This might not be good enough.  The code may still refer to the
> snd_intel_dsp_probe() symbol even if IS_REACHABLE() is false
> (although, practically seen, gcc should optimize it out).
> 
> You need #if IS_REACHABLE() instead of the plain if.
> Then you don't need to change the indentation, and the patch will be
> eventually smaller, too :)

I used the if() on purpose since in the past you mentioned #if/#endif 
are ugly. There are plenty of other cases in the kernel code where if( 
IF_REACHABLE(CONFIG_XYZ)) is used...

I don't mind sending a v2, the net result is the same.
