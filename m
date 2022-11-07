Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4B561ED7A
	for <lists+alsa-devel@lfdr.de>; Mon,  7 Nov 2022 09:52:33 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DF5DB82E;
	Mon,  7 Nov 2022 09:51:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DF5DB82E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1667811152;
	bh=UEbNkZyIar5feKVXcLdCv3/HZL+9/FqYrCpMpTzi31Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=F7ThrfoWUC2o9fx2pDBX8soHDcNQTWyvzP39hSwjIy4q/1HD2rdjvjdo3iyuaU3Bs
	 mFsedaFGTD6ZBj+RvChReES8E7GUuMSPAaOPhtoV9rj4aSYbaqLF1nWjirxoM8pXXa
	 n/fFqUzUMH8fe8uUTjgZzw3b7j3A41t90L4EHOUE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 82803F804BD;
	Mon,  7 Nov 2022 09:51:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D9C10F8025A; Mon,  7 Nov 2022 09:51:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 534EFF800EC
 for <alsa-devel@alsa-project.org>; Mon,  7 Nov 2022 09:51:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 534EFF800EC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="UMJoU53q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667811090; x=1699347090;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UEbNkZyIar5feKVXcLdCv3/HZL+9/FqYrCpMpTzi31Y=;
 b=UMJoU53qX5w1gg6VOcNPSu/PJLdaVmMqmZNu4H/ncbb1HQ6K0X7hnspg
 6fxexNv/9I7UbxuHk2u2C5TM07KFiE9p5XqDrhBhVjz8sGfbiABFbHZ55
 eTrjYfOYv2wFiFFAs6S0oiKx9XVNmmzLcBP+XpcXS3hiEFHHye/TVmrJc
 crV2EGREKAT9sb/384QeX9uAfTSOmGeZZfwdjTZic7n43WkMwzeQ7LtNd
 T/Oqa3Uh/uGHPWdXlzjjxgNG/U3A6Zm/WO9TxqQrSpB+WaC+/6ilA+E56
 02l8AjxQThTtHRRVpln8NW1OB/NPYWoQtFfzBcqzo3Po5bmy/MfIhxbDi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="372480275"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="372480275"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:51:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="810765606"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; d="scan'208";a="810765606"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.91])
 ([10.99.249.91])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 00:51:23 -0800
Message-ID: <c6ec7267-df1f-e119-7cbc-0d841085a1c4@linux.intel.com>
Date: Mon, 7 Nov 2022 09:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 1/3] ASoC: component: Propagate result of suspend and
 resume callbacks
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org
References: <20221104131244.3920179-1-cezary.rojewski@intel.com>
 <20221104131244.3920179-2-cezary.rojewski@intel.com>
 <b8bd9830-c933-092b-42db-75dd39bcb0c0@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <b8bd9830-c933-092b-42db-75dd39bcb0c0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, tiwai@suse.com
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

On 11/4/2022 3:00 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 11/4/22 09:12, Cezary Rojewski wrote:
>> From: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
>>
>> Both component->driver->suspend and ->resume() do return an int value
>> but it isn't propagated to the core later on. Update
>> snd_soc_component_suspend() and snd_soc_component_resume() so that the
>> possible errors are not squelched.
> 
> This looks alright on paper but could break existing solutions.
> There are a number of cases where an error during suspend is not fatal
> and you don't want to prevent a system suspend if this is recoverable on
> resume.
> 
> See for example the errors on clock-stop for SoundWire, which are
> squelched on purpose. See also Andy Ross' PR to precisely stop
> propagating errors in SOF https://github.com/thesofproject/linux/pull/3863
> 
> Maybe a less intrusive change would be to add a WARN_ON or something
> visible to make sure solutions are fixed, and only critical issues can
> prevent suspend? And in a second step the errors are propagated.
> 

Do note that thread you've pointed out handles device suspend, by which 
I mean, it is modification of sof_suspend(), called by 
snd_sof_runtime_suspend() which is then registered as handler in:
sound/soc/sof/sof-pci-dev.c: 
SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
sound/soc/sof/sof-acpi-dev.c: 
SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
sound/soc/sof/sof-of-dev.c: 
SET_RUNTIME_PM_OPS(snd_sof_runtime_suspend, snd_sof_runtime_resume,
and then taking TGL device for example there is:
static struct pci_driver snd_sof_pci_intel_tgl_driver = {
	(...)
         .driver = {
                 .pm = &sof_pci_pm,
         },
};

And what this patch set changes is handling of .suspend callback present 
in struct snd_soc_component_driver, which as evidenced by followup 
patches is handled in ASoC core while audio is being suspended.
As far as I can tell SOF makes no direct use of this callback.

I'm not negating that maybe there should be a bit of time when only 
warning is emitted, just making sure that we are on the same page, about 
what is being changed.

