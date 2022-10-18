Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B31F602D62
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 15:50:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id DD7CF9DD8;
	Tue, 18 Oct 2022 15:50:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz DD7CF9DD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666101053;
	bh=BruUzXTcD0ZSIrLJbGsUpz4KVW2XzzPlCeBQgCkPsEU=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VazL7sB2d/QmSbXM1SJHXNze0gJ1j6oa1tv1W3YUTzosSik2KQhqxf7UGvG/jU+SD
	 K6sIMDPmfev0JNYqcK7CIqAPO8NA3dllo+oMZNN+9yq5/0DYBgeOvokj74h94dhoks
	 zt5eiVv7ps0wzmAp/KA0NtM6vrEbVv0VN7LYBNPE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4AE79F804BD;
	Tue, 18 Oct 2022 15:49:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0F9E6F8024C; Tue, 18 Oct 2022 15:49:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 532C7F800AB
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 15:49:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 532C7F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="L97oGSxI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666100994; x=1697636994;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BruUzXTcD0ZSIrLJbGsUpz4KVW2XzzPlCeBQgCkPsEU=;
 b=L97oGSxIZc53nZxG804PUdGylppzo2feqtijUbBP1ARUN4b2ZilTWDLD
 Fcx06AkgWq2qi3HnjAdZrvpri5KrsHv2j6qgrgBF9vzf6sVd9ecpDNYlV
 lhtIrpTPQp1sIPE/kdLOpD/H7lfBTltw+F3adPJ4X5CUCYQ0reH0tDa2N
 EwNlxeq4n1tmkd95VGbd2v5FfvBcB0qsXFotcVTxNlNgZp32bC4MCnJ82
 YMjB1ZBA8KQjQHkqBWNDO++uT+Q8sTeV2P0qdlxVroankCpsinDVW7wo/
 jCsnNGPINXq+hS5xG3IZDoCUr5lVAyuxsAR3BV+7z+A7oohz11M13nhmM w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="285829544"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="285829544"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 06:49:50 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="606545929"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="606545929"
Received: from mariaca1-mobl.ger.corp.intel.com (HELO [10.252.27.127])
 ([10.252.27.127])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 06:49:48 -0700
Message-ID: <b9e10ec7-1c4f-a2bf-7471-26b92616ce14@linux.intel.com>
Date: Tue, 18 Oct 2022 16:49:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.3.3
Subject: Re: [PATCH 12/19] ASoC: SOF: Intel: Set the default firmware library
 path for IPC4
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, lgirdwood@gmail.com,
 broonie@kernel.org
References: <20221018120916.19820-1-peter.ujfalusi@linux.intel.com>
 <20221018120916.19820-13-peter.ujfalusi@linux.intel.com>
 <4e501a9d-45bb-0ef0-6900-a61af5d4bae0@linux.intel.com>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <4e501a9d-45bb-0ef0-6900-a61af5d4bae0@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, kai.vehmanen@linux.intel.com,
 alsa-devel@alsa-project.org, pierre-louis.bossart@linux.intel.com,
 ranjani.sridharan@linux.intel.com, chao.song@intel.com
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



On 18/10/2022 15:38, Amadeusz Sławiński wrote:
>> @@ -174,6 +189,9 @@ static const struct sof_dev_desc rpls_desc = {
>>           [SOF_IPC] = "intel/sof",
>>           [SOF_INTEL_IPC4] = "intel/avs/rpl-s",
>>       },
>> +    .default_lib_path = {
>> +        [SOF_INTEL_IPC4] = "intel/avs-lib/rpl-s",
>> +    },
>>       .default_tplg_path = {
>>           [SOF_IPC] = "intel/sof-tplg",
>>           [SOF_INTEL_IPC4] = "intel/avs-tplg",
>> @@ -202,6 +220,9 @@ static const struct sof_dev_desc rpl_desc = {
>>           [SOF_IPC] = "intel/sof",
>>           [SOF_INTEL_IPC4] = "intel/avs/rpl",
>>       },
>> +    .default_lib_path = {
>> +        [SOF_INTEL_IPC4] = "intel/avs-lib/rpl",
>> +    },
>>       .default_tplg_path = {
>>           [SOF_IPC] = "intel/sof-tplg",
>>           [SOF_INTEL_IPC4] = "intel/avs-tplg",
> 
> 
> I'm not sure that I understand the rationale here, can't libraries be
> kept in the same directory as FW, as far as I know they are version
> locked to FW anyway.

During the internal review we arrived to this setup, to keep the
libraries separate from the basefw binary.
One of the reason is that SOF project is not likely not going to release
external libraries, they are mostly vendor/product locked.
To make the life easier for the vendors (and distributions, packagers)
we concluded that it is better to keep them separate.

The option is there to specify custom path as well in case it is needed.

> In avs driver when we decided on intel/avs/platform
> path we planned to keep FW related libaries there...

My initial approach was this as well, but after a long debate it got
revised.

> Also adding Czarek to CC.

-- 
Péter
