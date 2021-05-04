Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E7E372DF1
	for <lists+alsa-devel@lfdr.de>; Tue,  4 May 2021 18:21:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9A9031693;
	Tue,  4 May 2021 18:20:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9A9031693
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1620145263;
	bh=JIkBzfwJIjZiFPDJL55R1uMQuYOur0gJwwhHtjmqBpA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tLQ+eFTpHSabQzuyVaOM8pQfkKAOl4EAz/8JuTsGm7ZLnsj9uk4rLCNKNL4HBflDc
	 cPIctGWECh4hx43ZA7v1z3vr4dVHWtVblRKAA2tbsz2mKBELwARiE5TXHDInQoSl0b
	 klVwNS2rRtu/I3jH7Y0+gXUda1wvW8ynRh+CCaWk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6DB7F80234;
	Tue,  4 May 2021 18:19:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 15535F8021C; Tue,  4 May 2021 18:19:21 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04F6DF80114
 for <alsa-devel@alsa-project.org>; Tue,  4 May 2021 18:19:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04F6DF80114
IronPort-SDR: znXGdKdoLcVxWMnUzzHjoiDY+H3S0F9ZEO+bHM95uEPsM+r7bQpVlynqfD+x5doiw0gRA9UdcS
 lLkXPE6aGenA==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="198075860"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="198075860"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 09:19:11 -0700
IronPort-SDR: /FAYA0Q8TJeJnVTsIS6w8zsi4IzOZ9BrNyDQWzCdKZKU8cDWr8hE9RIWvvzOwC2A7TEQU8I6RH
 swnrjAjSulWw==
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="463293347"
Received: from gomeza-mobl.amr.corp.intel.com (HELO [10.212.65.75])
 ([10.212.65.75])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 09:19:11 -0700
Subject: Re: [PATCH 0/9] ASoC: Intel: add new TGL/ADL configurations
To: Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org
References: <20210415175013.192862-1-pierre-louis.bossart@linux.intel.com>
 <161858869852.28833.4104992497142755503.b4-ty@kernel.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ce1dde92-6d5b-8fa7-8b36-a6efbb39b922@linux.intel.com>
Date: Tue, 4 May 2021 11:19:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <161858869852.28833.4104992497142755503.b4-ty@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, "Lu, Brent" <brent.lu@intel.com>
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



On 4/16/21 11:01 AM, Mark Brown wrote:
> On Thu, 15 Apr 2021 12:50:04 -0500, Pierre-Louis Bossart wrote:
>> Very little code but quite a few descriptors to add TigerLake (TGL)
>> /AlderLake (ADL) ACPI match tables for I2S and SoundWire devices, new
>> dailinks for Bluetooth offload. Some day this will be read from
>> platform firmware.
>>
>> Also clarify how microphones are handled for SoundWire devices, and
>> create modules to avoid linking the same code multiple times.
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/9] ASoC: Intel: soc-acpi: add ADL SoundWire base configurations
>        commit: 093b9dcb597611ce65f8c5610ee446616c0be304
> [2/9] ASoC: Intel: soc-acpi: add ADL jack-less SoundWire configurations
>        commit: 870dc42fe8311ef5b291ccb21eda3f7069b6f599
> [5/9] ASoC: Intel: sof_sdw: add quirk for new ADL-P Rvp
>        commit: d25bbe80485f8bcbbeb91a2a6cd8798c124b27b7

Mark, I thought the series was applied but only 3 out of 9 patches 
seemed to have been merged. There wasn't any expectation/pressure that 
they would land in 5.13 so that's not a problem, but for the 5.14 cycle 
should I resend the remaining ones, we now have a new machine driver 
developed by Brent Lu [1] that relies on the sof-maxim-common module in 
patch 9?
Let me know what's easiest for you, thanks!
-Pierre

[1] https://github.com/thesofproject/linux/pull/2884
