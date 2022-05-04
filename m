Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F1519C12
	for <lists+alsa-devel@lfdr.de>; Wed,  4 May 2022 11:42:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 56D3783B;
	Wed,  4 May 2022 11:41:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 56D3783B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1651657337;
	bh=sDQH4JA42UCFkdyS9i1y+kp64G0RxQnvwnuwju4uDLc=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QWCm2u9v10dxD5xyKRFFMR7gk1SW7QOjGKjQp7VDaCPvFhGVVgLDHKqzpH2beDDwN
	 rXFuZawkDSqovr4Xwcl6UIFvylSx8fPSlKKPxLSufCPe8QbSXwiveqgnmqCVkbGLUt
	 gKmS3fGEFHn1PcNZKL6Tk+hu6nXiVgfO+xFLKTU0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C042BF800BF;
	Wed,  4 May 2022 11:41:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 38B17F80163; Wed,  4 May 2022 11:41:16 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B07A3F80129
 for <alsa-devel@alsa-project.org>; Wed,  4 May 2022 11:41:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B07A3F80129
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="P1lolH/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651657273; x=1683193273;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=sDQH4JA42UCFkdyS9i1y+kp64G0RxQnvwnuwju4uDLc=;
 b=P1lolH/rzLpPep/7AbTbMgP394ukyx+d804W3enEqSnz1MWJLvi1z7s4
 DXB865BywEvKEOMLWNDRBAkuKuBcDYzDDT96Fi5PjN52ihmxWlCHbTw5E
 yrRjsXmbLRmGTrJOjBTJooZjHcTJRNTt8UkPHEBDIq8LaheFFZOlbUE1c
 TcLEgR3ZOu8kSSuSdyK0xpJyY79HGcJJM9sdfHsjoVnMWUSU75b0SDOVP
 krrdkcC2UkuNJLTvynCU4nuwXFyRylApzswR9QSlnGmgIRlURc4Hx5O51
 pN7TDlmdzn8+fN7GhzzG9UlnHhfxS38Uboabs9rmAj5J3PliPt9E/PkX7 A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="354151888"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="354151888"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 02:41:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="734320948"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.121])
 ([10.99.241.121])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 02:41:05 -0700
Message-ID: <26235767-cc5a-8f9b-b0f9-f48fc4a082b8@linux.intel.com>
Date: Wed, 4 May 2022 11:41:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 10/14] ASoC: Intel: avs: Machine board registration
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, broonie@kernel.org
References: <20220426172346.3508411-1-cezary.rojewski@intel.com>
 <20220426172346.3508411-11-cezary.rojewski@intel.com>
 <2cda9e60-483b-6866-7ad5-787e43c25824@linux.intel.com>
 <f1607df1-a8de-f26c-fbdb-be4bfba899eb@intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <f1607df1-a8de-f26c-fbdb-be4bfba899eb@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, cujomalainey@chromium.org,
 lma@semihalf.com
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

On 4/29/2022 4:01 PM, Cezary Rojewski wrote:

>>> +static struct snd_soc_acpi_mach *dmi_match_quirk(void *arg)
>>> +{
>>> +    struct snd_soc_acpi_mach *mach = arg;
>>> +    const struct dmi_system_id *dmi_id;
>>> +    struct dmi_system_id *dmi_table;
>>> +
>>> +    if (mach->quirk_data == NULL)
>>> +        return mach;
>>> +
>>> +    dmi_table = (struct dmi_system_id *)mach->quirk_data;
>>> +
>>> +    dmi_id = dmi_first_match(dmi_table);
>>> +    if (!dmi_id)
>>> +        return NULL;
>>> +
>>> +    return mach;
>>> +}
>>> +
>>> +#define AVS_SSP(x)        (BIT(x))
>>> +#define AVS_SSP_RANGE(a, b)    (GENMASK(b, a))
>>> +
>>> +/* supported I2S board codec configurations */
>>> +static struct snd_soc_acpi_mach avs_skl_i2s_machines[] = {
>>> +    {
>>> +        .id = "INT343A",
>>> +        .drv_name = "avs_rt286",
>>> +        .link_mask = AVS_SSP(0),
>>
>> I've told this before, 'link_mask' was introduced for *SoundWire*. 
>> Please do not overload existing concepts and use this instead:
>>
>> @i2s_link_mask: I2S/TDM links enabled on the board
> 
> 
> Noooo :( Sad panda is sad.
> 
> 'link_mask' is such a wonderful name as it matches naming used in our 
> specs - which call BE side 'LINK'.
> 
> If it's a must then yes, we will resign from using 'link_mask'.
> 

I'll just note that header kernel doc for link_mask says:
" * @link_mask: describes required board layout, e.g. for SoundWire."
I would say there is no assumption that it is SDW only, so we could also 
argue that if it is it should be named sdw_link_mask and comment be 
fixed to remove "e.g." ;)
