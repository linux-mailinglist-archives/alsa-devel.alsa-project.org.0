Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D7B4D3537
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 18:29:05 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15B021828;
	Wed,  9 Mar 2022 18:28:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15B021828
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646846944;
	bh=UjnLfQPqw3UUYGqeNSpb4WueN3QxQhXX6nN/Soeq+PM=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WzK0X2Ll++EjQzC39ASnlLj9Fge3LpE2ED12myQQoV3Cs0/8E8ajW/Pstbf2ATmus
	 BHBprbvr1+k5+eQ457k1vFeF2O9kCl1rW92qxKu1r4tb4Dw3DoOayQ3ssAlAB8PljP
	 jR/P5MmKjIVza6W/GdUN0REU+7s7OhjPHI08TqCw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AE851F80516;
	Wed,  9 Mar 2022 18:27:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA583F804AB; Wed,  9 Mar 2022 18:27:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0B19F80158
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 18:27:18 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0B19F80158
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="SjvMqCo9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646846839; x=1678382839;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=UjnLfQPqw3UUYGqeNSpb4WueN3QxQhXX6nN/Soeq+PM=;
 b=SjvMqCo95M/xsyWuMv87tb6Po//YCPCdYH0PwzauEiEs6X2+A0yt7M+p
 v5YcyBJaM2EnAM2NUeGDZyqUXU1RsJzOCBGxt6s/VqKg8TJ2LMAYLbZjr
 WAFUqNc/SlLuuspMbANeIZUaQB5lJujPCJ0s4cKIrnG87kpBfIqUt06xe
 U2i2BLt/Ym1LDqAIupAuHxBte6YEoay4zwcPABNbMVNo3ZhI0yloKlAXX
 rrPKwLjDlOHOa3LtPnh5g6kWeBZH8KR71z/qCjhob/WUOowMXdNmlwF3E
 X0adys6iEdzr9aCzuG3toHpqwAzDDp1dgCmR3mTffDu7LLxyAHhHwYhpy g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="242484153"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="242484153"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 09:27:14 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="554214584"
Received: from thihoan5-mobl.amr.corp.intel.com (HELO [10.209.14.48])
 ([10.209.14.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 09:27:13 -0800
Message-ID: <ae033bbe-db89-8750-2a8b-a073001681da@linux.intel.com>
Date: Wed, 9 Mar 2022 11:24:58 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 04/20] ALSA: intel-nhlt: add helper to detect SSP link mask
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
 <20220308192610.392950-5-pierre-louis.bossart@linux.intel.com>
 <e12a2a8d-7f96-5055-1168-2ced05d00751@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <e12a2a8d-7f96-5055-1168-2ced05d00751@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Huajun Li <huajun.li@intel.com>, tiwai@suse.de,
 =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Nikolai Kostrigin <nickel@altlinux.org>, broonie@kernel.org,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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


>> diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
>> index 128476aa7c61..4063da378283 100644
>> --- a/sound/hda/intel-nhlt.c
>> +++ b/sound/hda/intel-nhlt.c
>> @@ -130,6 +130,28 @@ bool intel_nhlt_has_endpoint_type(struct 
>> nhlt_acpi_table *nhlt, u8 link_type)
>>   }
>>   EXPORT_SYMBOL(intel_nhlt_has_endpoint_type);
>> +int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8 
>> device_type)
>> +{
>> +    struct nhlt_endpoint *epnt;
>> +    int ssp_mask = 0;
>> +    int i;
>> +
>> +    if (!nhlt || (device_type != NHLT_DEVICE_BT && device_type != 
>> NHLT_DEVICE_I2S))
> 
> The '!nhlt' safety is superfluous in my opinion. Kernel core API e.g.: 
> device one assumes caller is sane in basically all cases.

Agree. I will remove this test in a follow-up optimization patch. the 
same pattern is used for existing dmic stuff so it's better to remove it 
in one shot.

>> +        return 0;
>> +
>> +    epnt = (struct nhlt_endpoint *)nhlt->desc;
>> +    for (i = 0; i < nhlt->endpoint_count; i++) {
>> +        if (epnt->linktype == NHLT_LINK_SSP && epnt->device_type == 
>> device_type) {
>> +            /* for SSP the virtual bus id is the SSP port */
>> +            ssp_mask |= BIT(epnt->virtual_bus_id);
>> +        }
>> +        epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
>> +    }
>> +
>> +    return ssp_mask;
>> +}
>> +EXPORT_SYMBOL(intel_nhlt_ssp_endpoint_mask);
> 
> Since this is a *public* API - not direct part of any driver, really - 
> providing kernel-doc is recommended.

there isn't a single line of kernel-doc for the entire NHLT stuff.  and 
ahem, that includes recent additions from your team ;-)

bool intel_nhlt_has_endpoint_type(struct nhlt_acpi_table *nhlt, u8 
link_type);

So agree, but let's do this in a follow-up patchset. the goal of this 
patchset is to help community users that don't see an audio card 
created, not to make NHLT support super shiny.
