Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3A7510897
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 21:08:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0D93117F0;
	Tue, 26 Apr 2022 21:08:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0D93117F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651000134;
	bh=lDS4r8VUg0uT04q+a1QxoG8HJ5gRSx6/HBQJlYipm60=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=g5FvP3K1uk+094N6vTeum1inwXM+YiP9m2FSpqj5IB8HmoHMVJiS5nu5vvSEP32yD
	 uLUot6d0QN18b7U0oV9sRtR22w0oVkBj255cqT9PXllpNu1tDMWmn8oeYBQSr6hzQD
	 LEAzRY4T/JX0YzcB9V5DQCkqQ0RA3aOGASMp9u38=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 95515F8014B;
	Tue, 26 Apr 2022 21:07:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 257F2F80152; Tue, 26 Apr 2022 21:07:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10904F80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 21:07:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 10904F80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="WaG0R9Uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651000071; x=1682536071;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=lDS4r8VUg0uT04q+a1QxoG8HJ5gRSx6/HBQJlYipm60=;
 b=WaG0R9Uf50lPlUUNZuXVfVuZqU3TJCD5VfLmcAMR+8YU8yoOWg5poTR4
 fQ2TYflt069tvwqvm7wp1cd5zIKfnrMyS5QI297TSifB9rWqGBVqq8WzI
 ifiifRXd2wOK2f6QupZkDunw79Ei7RGO/kJBO1+A/j55MhZr57nbtcVZ+
 EYru3LxWaZpmAfYUYEBRqyacSrqLRePlArsUxVFUkwWdL0L8EKU4fFd4f
 wLz1kS7iIEPhbzAnzXT9kUOI3aGhiud6HUnb3I94zW7eme916e8vRUvFU
 msB4GYD8siXThwj5ck+FVB3HOkwBbiowZHzYiHXAK5DwBqN2If2nigEej w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="263286522"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="263286522"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 12:07:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="580102378"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.249.202])
 ([10.99.249.202])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 12:07:44 -0700
Message-ID: <54e21f85-ecbe-2a88-0557-0f810b45f1eb@linux.intel.com>
Date: Tue, 26 Apr 2022 21:07:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: Intel: avs: Depend on CONFIG_ACPI
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Cezary Rojewski <cezary.rojewski@intel.com>
References: <20220426115454.685787-1-amadeuszx.slawinski@linux.intel.com>
 <eab567f0-73a4-bf23-76bf-8d576fa942f0@linux.intel.com>
 <YmgnE/HKNmI+agNs@sirena.org.uk>
 <726c58e5-241d-053f-8b4c-d56a5a228f0f@intel.com>
 <Ymg5CAbwf/UxUOff@sirena.org.uk>
 <ba9e90de-94ad-d6c9-b6df-1fe6f802e9d6@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <ba9e90de-94ad-d6c9-b6df-1fe6f802e9d6@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 kernel test robot <lkp@intel.com>, Liam Girdwood <lgirdwood@gmail.com>
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

On 4/26/2022 8:26 PM, Pierre-Louis Bossart wrote:
> 
> 
> On 4/26/22 13:25, Mark Brown wrote:
>> On Tue, Apr 26, 2022 at 08:07:22PM +0200, Cezary Rojewski wrote:
>>
>>> Would you like the change proposed by Pierre to be part of this patch or a
>>> separate one?
>>
>> Either is fine.
>>
>>> Also, I assume the above code does not change, just:
>>> s/select SND_SOC_ACPI/select SND_SOC_ACPI if ACPI/
>>
>>> is applied on top of what's already in the patch. Is my deduction correct?
>>
>> AIUI the current patch and associated hard dependency on ACPI could be
>> dropped but I've not checked or thought too deeply about it
> 
> 
> my suggestion was the following:
> 
> depends on PCI
> depends on COMMON_CLK
> select SND_SOC_ACPI if ACPI

Thanks for suggestion, I tested with it, but it doesn't work as we 
access fields from struct nhlt_specific_cfg which is available only if 
ACPI support is enabled:

sound/soc/intel/avs/path.c: In function ‘avs_copier_create’:
sound/soc/intel/avs/path.c:186:17: error: ‘struct nhlt_specific_cfg’ has 
no member named ‘caps’
   186 |   data = ep_blob->caps;
       |                 ^~
sound/soc/intel/avs/path.c:187:22: error: ‘struct nhlt_specific_cfg’ has 
no member named ‘size’
   187 |   data_size = ep_blob->size;
       |                      ^~
sound/soc/intel/avs/path.c:210:17: error: ‘struct nhlt_specific_cfg’ has 
no member named ‘caps’
   210 |   data = ep_blob->caps;
       |                 ^~
sound/soc/intel/avs/path.c:211:22: error: ‘struct nhlt_specific_cfg’ has 
no member named ‘size’
   211 |   data_size = ep_blob->size;
       |                      ^~

Now there are few ways this can be solved:
1. Move the struct nhlt_specific_cfg definition out of define check... 
in include/sound/intel-nhlt.h, but that seems kind of sloppy to me, even 
if it makes sense.
2. NHLT is only needed for I2S and DMIC configuration, so we could in 
theory add #ifdef ACPI around configuration for those endpoints in 
sound/soc/intel/avs/path.c - but it introduces potential problems on x86 
platforms with users doing some weird config.
3. Depend directly on ACPI (current patch) causing NHLT support to be 
always enabled. And then apply change suggested by Pierre when we 
rewrite NHLT support to use NHLT structures in include/acpi/actbl2.h 
header as it as far as I can tell exposes all structures unconditionally.

I've discussed with Cezary and we are leaning towards option 3. but if 
there is any other preference we can prepare patch for that option.







