Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6355F59E573
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 16:57:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 16FBF3E8;
	Tue, 23 Aug 2022 16:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 16FBF3E8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661266675;
	bh=hw68frbppD7Mlvlxs5XzBRD0+2ym9L9GN1qHi2MhEzw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OY3QOfUI6T22slL8+VvZ1jEXC6GHkbKAnFsc8ob6JI2arJkvNUfTQNmIcDdDNG95P
	 9uQ0iQoCe1JY6xrwHHP4OD0ManPFhBMMwY1nXEmLnaXljkKRtgeurheVGG9kWBS6rS
	 e8NTito3Dq1SbAnDSYkowXbhLmXDZ5GwSlgtKkx4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 74A16F8027B;
	Tue, 23 Aug 2022 16:56:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 72EB2F8020D; Tue, 23 Aug 2022 16:56:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D4FCF800C9
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 16:56:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D4FCF800C9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="msHajl/D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661266611; x=1692802611;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hw68frbppD7Mlvlxs5XzBRD0+2ym9L9GN1qHi2MhEzw=;
 b=msHajl/Du98UaPob5bUK/ZW0UUgdAcN9eVgcTBhg2fZ7TIAIwIp/2jcP
 R0sQU7WT0j/cCBoXqnhR+z90cRvcP9DmhXCEI8wYxYabhJvyOwzW/jnfX
 zk2RPGN92S0TGXMpcbArlOJN3s7YQ6tdZRMIq8mMVjJL6+265DddSoNO1
 f6NsW9n4/5WmdOcz3LBq4+hK8ge0jR3PRWTYJAw/MPtZdhD0yiEg0VODm
 nWelqlg1kvD6hPFo9a9f9UXEyE5V5yBocUiGcgNGUI3VaGb9vgVfTKZPn
 prCDK91aQRqcJrRnFPycvOtHUJDkOkSYKZ9CAqy7474ahQYAbj+aW8m/V w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10448"; a="357685701"
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="357685701"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 07:55:59 -0700
X-IronPort-AV: E=Sophos;i="5.93,258,1654585200"; d="scan'208";a="586020960"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.249])
 ([10.99.241.249])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 07:55:57 -0700
Message-ID: <6ee7b704-fb40-a5b5-f5c0-a19096f8d1d4@linux.intel.com>
Date: Tue, 23 Aug 2022 16:55:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] ALSA: hda: intel-nhlt: add intel_nhlt_ssp_mclk_mask()
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220822185911.170440-1-pierre-louis.bossart@linux.intel.com>
 <20220822185911.170440-3-pierre-louis.bossart@linux.intel.com>
 <b112f824-631d-40d4-31bd-9bd56f31930e@linux.intel.com>
 <c7bd2799-3cbf-a984-8f48-5e069b88db51@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <c7bd2799-3cbf-a984-8f48-5e069b88db51@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On 8/23/2022 10:52 AM, Pierre-Louis Bossart wrote:
> Hi Amadeusz,
> 
>>> +int intel_nhlt_ssp_mclk_mask(struct nhlt_acpi_table *nhlt, int ssp_num)
>>> +{
>>> +    struct nhlt_endpoint *epnt;
>>> +    struct nhlt_fmt *fmt;
>>> +    struct nhlt_fmt_cfg *cfg;
>>> +    int mclk_mask = 0;
>>> +    int i, j;
>>> +
>>> +    if (!nhlt)
>>> +        return 0;
>>> +
>>> +    epnt = (struct nhlt_endpoint *)nhlt->desc;
>>> +    for (i = 0; i < nhlt->endpoint_count; i++) {
>>> +
>>> +        /* we only care about endpoints connected to an audio codec
>>> over SSP */
>>> +        if (epnt->linktype == NHLT_LINK_SSP &&
>>> +            epnt->device_type == NHLT_DEVICE_I2S &&
>>> +            epnt->virtual_bus_id == ssp_num) {
>>
>> if (epnt->linktype != NHLT_LINK_SSP ||
>>      epnt->device_type != NHLT_DEVICE_I2S ||
>>      epnt->virtual_bus_id != ssp_num)
>>      continue;
>>
>> and then you can remove one indentation level below?
> 
> 
> Would that work? We still need to move the epnt pointer:
> 
> epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
> 
> and moving this in the endpoint_count loop would be ugly as well.
> 
> 

Another solution would be goto to skip, but that also seems ugly :/
I guess it can stay as it is then.

>>> +
>>> +            fmt = (struct nhlt_fmt *)(epnt->config.caps +
>>> epnt->config.size);
>>> +            cfg = fmt->fmt_config;
>>> +
>>> +            /*
>>> +             * In theory all formats should use the same MCLK but it
>>> doesn't hurt to
>>> +             * double-check that the configuration is consistent
>>> +             */
>>> +            for (j = 0; j < fmt->fmt_count; j++) {
>>> +                u32 *blob;
>>> +                int mdivc_offset;
>>> +
>>> +                if (cfg->config.size >= SSP_BLOB_V1_0_SIZE) {
>>> +                    blob = (u32 *)cfg->config.caps;
>>> +
>>> +                    if (blob[1] == SSP_BLOB_VER_2_0)
>>> +                        mdivc_offset = SSP_BLOB_V2_0_MDIVC_OFFSET;
>>> +                    else if (blob[1] == SSP_BLOB_VER_1_5)
>>> +                        mdivc_offset = SSP_BLOB_V1_5_MDIVC_OFFSET;
>>> +                    else
>>> +                        mdivc_offset = SSP_BLOB_V1_0_MDIVC_OFFSET;
>>> +
>>> +                    mclk_mask |=  blob[mdivc_offset] & GENMASK(1, 0);

One more thing, where does this GENMASK come from, as far as I can tell 
HW specifies and FW uses one bit field to signal that MCLK is enabled? 
(mdivc is simply a value written to HW register to configure it).

>>> +                }
>>> +
>>> +                cfg = (struct nhlt_fmt_cfg *)(cfg->config.caps +
>>> cfg->config.size);
>>> +            }
>>> +        }
>>> +        epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
>>> +    }
>>> +
>>> +    return mclk_mask;
>>
>> Although I understand that it is relegated to the caller, but if both
>> mclk being set is considered an error maybe add some kind of check here
>> instead and free callers from having to remember about it?
>>
>> if (hweight_long(mclk_mask) != 1)
>>      return -EINVAL;
>>
>> return mclk_mask;
> 
> I went back and forth multiple times on this one. I can't figure out if
> this would be a bug or a feature, it could be e.g. a test capability and
> it's supported in hardware. I decided to make the decision in the caller
> rather than a lower level in the library.
> 
> If the tools used to generate NHLT don't support this multi-MCLK mode
> then we could indeed move the test here.
> 

Considering comment I added above I've asked Czarek to also check this 
series. I'm not sure it even makes sense to name the field "_mask" when 
it is one bit...

>>
>>> +}
>>> +EXPORT_SYMBOL(intel_nhlt_ssp_mclk_mask);
>>> +
>>>    static struct nhlt_specific_cfg *
>>>    nhlt_get_specific_cfg(struct device *dev, struct nhlt_fmt *fmt, u8
>>> num_ch,
>>>                  u32 rate, u8 vbps, u8 bps)
>>

