Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D99324D3536
	for <lists+alsa-devel@lfdr.de>; Wed,  9 Mar 2022 18:29:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6AA0B17F0;
	Wed,  9 Mar 2022 18:28:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6AA0B17F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646846942;
	bh=mP0CR0O9vyPXavl2qyDdIj3TrH8nTnf8xlRsirHZ77Y=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KVzmsFRG9minItgKaAwaq2VTR959sYSL0f20VPwfCzV+qPNGsGteJ3/yxbFJ7hVf+
	 occtTyrc11gOzFcDviIsOnPuZmB/OssQmGDma4j8SSEefxOlSnGA9S3WzWgnlgAotO
	 l3TRnGS48PAmKnkmbU6VvHscg4wMN6aW96qn3C0A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 352B0F804AB;
	Wed,  9 Mar 2022 18:27:24 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 09CE4F80236; Wed,  9 Mar 2022 18:27:21 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7820AF80155
 for <alsa-devel@alsa-project.org>; Wed,  9 Mar 2022 18:27:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7820AF80155
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="CMTGN6Tl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646846838; x=1678382838;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=mP0CR0O9vyPXavl2qyDdIj3TrH8nTnf8xlRsirHZ77Y=;
 b=CMTGN6TlgdngAeATTjM7T/XCGgE6JdMUY1/hC5KA5yH3s6RTGCEdM5sN
 7U2gyjxaIq/uKXyLCuUk8zFtirNMjRL4Gbos0vozo5ox6/medvje+whZk
 axjRZP+NKcR56UCPCywOrhMgAJyhqzSgLlj7az7qsycFp3QXh4KK+Gz2J
 6Gq3NvwglOGcS/4Vag26KtDkRFTRIJyz+mBUaAZj0NlOQ9ivLRTJA6+JN
 LnKu/aWRT4helYavPl0gexSHspf61jQDZGzMrSntDStWipPCmMW9Exo6u
 ivHURzNZElNDkO9Z2MVdKGZU4K9OBCvc6ScjbJXbz3I5oHDrN2I/VpGs8 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10281"; a="242484143"
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="242484143"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 09:27:13 -0800
X-IronPort-AV: E=Sophos;i="5.90,167,1643702400"; d="scan'208";a="554214563"
Received: from thihoan5-mobl.amr.corp.intel.com (HELO [10.209.14.48])
 ([10.209.14.48])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2022 09:27:12 -0800
Message-ID: <dfb79a8a-913d-e7e6-8895-15894a7bf231@linux.intel.com>
Date: Wed, 9 Mar 2022 11:16:25 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 05/20] ASoC: SOF: Intel: hda: report SSP link mask to
 machine driver
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220308192610.392950-1-pierre-louis.bossart@linux.intel.com>
 <20220308192610.392950-6-pierre-louis.bossart@linux.intel.com>
 <18986c3d-b31c-2361-049d-348779ccdf7f@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <18986c3d-b31c-2361-049d-348779ccdf7f@intel.com>
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



On 3/9/22 10:59, Cezary Rojewski wrote:
> On 2022-03-08 8:25 PM, Pierre-Louis Bossart wrote:
>> For devices designed for Windows, the SSP information should be listed
>> in the NHLT, and when present can be used to set quirks automatically
>> in the machine driver.
>>
>> The NHLT information exposes BT and analog audio connections
>> separately, for now we are only interested in the analog audio parts.
>>
>> The use of dev_info() for the SSP mask is intentional so that we can
>> immediately flag devices with an ES8336 codec. Since NHLT is not used
>> for recent Chromebooks these messages should be rare.
> 
> 
> ...
> 
>> +static int check_nhlt_ssp_mask(struct snd_sof_dev *sdev)
>> +{
>> +    struct nhlt_acpi_table *nhlt;
>> +    int ssp_mask = 0;
>> +
>> +    nhlt = intel_nhlt_init(sdev->dev);
>> +    if (!nhlt)
>> +        return ssp_mask;
>> +
>> +    if (intel_nhlt_has_endpoint_type(nhlt, NHLT_LINK_SSP)) {
>> +        ssp_mask = intel_nhlt_ssp_endpoint_mask(nhlt, NHLT_DEVICE_I2S);
>> +        if (ssp_mask)
>> +            dev_info(sdev->dev, "NHLT_DEVICE_I2S detected, ssp_mask 
>> %#x\n", ssp_mask);
>> +    }
>> +    intel_nhlt_free(nhlt);
> 
> 
> NHLT "toggling" found in this function looks weird. Why not cache NHLT 
> pointer i.e.: get it once and put when driver is no longer required? 
> Initializing and freeing NHLT (AKA get/put ACPI table) every time a 
> request is made does not look like an optimal solution.

I agree with your remark, but this is an optimization that we plan on 
doing later. There are other changes coming wrt to NHTL to extract DMIC 
blobs, and it's better to change all the functions using the same 
programming flow when we are in 'stable' state.

The concern isn't really optimization at this point but just to get 
audio to work. Keep in mind all this patchset was generated with tests 
crowdsourced to the community, and the empirical detection of the 
SSP-codec link could be broken on some platforms - the NHLT does not 
give *any* information on where the codec is actually connected.


