Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4A05108CF
	for <lists+alsa-devel@lfdr.de>; Tue, 26 Apr 2022 21:18:14 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9367C183A;
	Tue, 26 Apr 2022 21:17:23 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9367C183A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651000693;
	bh=cFVnoieo1fo/THQXuh1tXVAtJ4dekxs6BrEoLjfywqE=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cQin/MO7QlyJhH13iAozp2+ELcQebQ3M5bYoMxdpbSIg0pSWMsl/oIBr7QL77NOgf
	 hs+sobD3f1sJ6G5zAIPG3ab5zoG546czKwZ8mSvzSM9gp5A9VSS0j3HEUsoodTCvOR
	 gKQ1MriSqzdc/HVN7Emi8RNoXTPp6eT2Oz6RDgzo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 572D3F80171;
	Tue, 26 Apr 2022 21:17:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFD2CF80152; Tue, 26 Apr 2022 21:17:13 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 997FAF80105
 for <alsa-devel@alsa-project.org>; Tue, 26 Apr 2022 21:17:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 997FAF80105
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ww9rKbKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651000631; x=1682536631;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=cFVnoieo1fo/THQXuh1tXVAtJ4dekxs6BrEoLjfywqE=;
 b=Ww9rKbKrPo7dQDk3iNk24XVVDTlU0oe3O4SWjXeV+irQys26uA1Al5cx
 qsc4Ujdbf+VKGkXDP3BvWZ3IRrSX0UdT9ZxdZXo+GqX2bRzBt1+TLuUb/
 6cUOMYqkOC/ixsoXMJOv/0Nm2nA4+7pxRUoNiQOitmOWq1dwmnTBJELri
 Uqvx71Re6VRuL1z+EPSnf5SoZ7OK47ELUgjEepAVet1Jj+zeR1Nj/1jUx
 30QypIhfghAKz9a15rc2lpJOuwVvA4J+EmLGZhavz0UeA51i20yhagdVX
 nvdgNgHMQpv2HBRBUafv/JMuUo2r3nxriYMyRD88R1lFhTL4cock59qeQ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10329"; a="265859194"
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="265859194"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 12:17:03 -0700
X-IronPort-AV: E=Sophos;i="5.90,291,1643702400"; d="scan'208";a="628669588"
Received: from jzhang96-mobl.amr.corp.intel.com (HELO [10.212.151.202])
 ([10.212.151.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Apr 2022 12:16:34 -0700
Message-ID: <04d652ae-60df-88ad-518f-bbcedc0f1de3@linux.intel.com>
Date: Tue, 26 Apr 2022 14:16:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH] ASoC: Intel: avs: Depend on CONFIG_ACPI
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20220426115454.685787-1-amadeuszx.slawinski@linux.intel.com>
 <eab567f0-73a4-bf23-76bf-8d576fa942f0@linux.intel.com>
 <YmgnE/HKNmI+agNs@sirena.org.uk>
 <726c58e5-241d-053f-8b4c-d56a5a228f0f@intel.com>
 <Ymg5CAbwf/UxUOff@sirena.org.uk>
 <ba9e90de-94ad-d6c9-b6df-1fe6f802e9d6@linux.intel.com>
 <54e21f85-ecbe-2a88-0557-0f810b45f1eb@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <54e21f85-ecbe-2a88-0557-0f810b45f1eb@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Liam Girdwood <lgirdwood@gmail.com>, alsa-devel@alsa-project.org,
 Takashi Iwai <tiwai@suse.com>, kernel test robot <lkp@intel.com>
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



On 4/26/22 14:07, Amadeusz Sławiński wrote:
> On 4/26/2022 8:26 PM, Pierre-Louis Bossart wrote:
>>
>>
>> On 4/26/22 13:25, Mark Brown wrote:
>>> On Tue, Apr 26, 2022 at 08:07:22PM +0200, Cezary Rojewski wrote:
>>>
>>>> Would you like the change proposed by Pierre to be part of this patch or a
>>>> separate one?
>>>
>>> Either is fine.
>>>
>>>> Also, I assume the above code does not change, just:
>>>> s/select SND_SOC_ACPI/select SND_SOC_ACPI if ACPI/
>>>
>>>> is applied on top of what's already in the patch. Is my deduction correct?
>>>
>>> AIUI the current patch and associated hard dependency on ACPI could be
>>> dropped but I've not checked or thought too deeply about it
>>
>>
>> my suggestion was the following:
>>
>> depends on PCI
>> depends on COMMON_CLK
>> select SND_SOC_ACPI if ACPI
> 
> Thanks for suggestion, I tested with it, but it doesn't work as we access fields from struct nhlt_specific_cfg which is available only if ACPI support is enabled:
> 
> sound/soc/intel/avs/path.c: In function ‘avs_copier_create’:
> sound/soc/intel/avs/path.c:186:17: error: ‘struct nhlt_specific_cfg’ has no member named ‘caps’
>   186 |   data = ep_blob->caps;
>       |                 ^~
> sound/soc/intel/avs/path.c:187:22: error: ‘struct nhlt_specific_cfg’ has no member named ‘size’
>   187 |   data_size = ep_blob->size;
>       |                      ^~
> sound/soc/intel/avs/path.c:210:17: error: ‘struct nhlt_specific_cfg’ has no member named ‘caps’
>   210 |   data = ep_blob->caps;
>       |                 ^~
> sound/soc/intel/avs/path.c:211:22: error: ‘struct nhlt_specific_cfg’ has no member named ‘size’
>   211 |   data_size = ep_blob->size;
>       |                      ^~
> 
> Now there are few ways this can be solved:
> 1. Move the struct nhlt_specific_cfg definition out of define check... in include/sound/intel-nhlt.h, but that seems kind of sloppy to me, even if it makes sense.

That would be my preference. There's no real reason to hide those definitions that are pure C, and only have some enums exposed and others not.


diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h

index 6fb2d5e378fdd..340584d9515f4 100644

--- a/include/sound/intel-nhlt.h

+++ b/include/sound/intel-nhlt.h

@@ -25,8 +25,6 @@ enum nhlt_device_type {

        NHLT_DEVICE_INVALID

 };

 

-#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)

-

 struct wav_fmt {

        u16 fmt_tag;

        u16 channels;

@@ -126,6 +124,8 @@ enum {

        NHLT_MIC_ARRAY_VENDOR_DEFINED = 0xf,

 };

 

+#if IS_ENABLED(CONFIG_ACPI) && IS_ENABLED(CONFIG_SND_INTEL_NHLT)

+

 struct nhlt_acpi_table *intel_nhlt_init(struct device *dev);

 

 void intel_nhlt_free(struct nhlt_acpi_table *addr);



> 2. NHLT is only needed for I2S and DMIC configuration, so we could in theory add #ifdef ACPI around configuration for those endpoints in sound/soc/intel/avs/path.c - but it introduces potential problems on x86 platforms with users doing some weird config.
> 3. Depend directly on ACPI (current patch) causing NHLT support to be always enabled. And then apply change suggested by Pierre when we rewrite NHLT support to use NHLT structures in include/acpi/actbl2.h header as it as far as I can tell exposes all structures unconditionally.
> 
> I've discussed with Cezary and we are leaning towards option 3. but if there is any other preference we can prepare patch for that option.

