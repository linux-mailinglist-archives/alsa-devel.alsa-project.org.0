Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9DC19C483
	for <lists+alsa-devel@lfdr.de>; Thu,  2 Apr 2020 16:42:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73F51167D;
	Thu,  2 Apr 2020 16:41:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73F51167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585838555;
	bh=kP+7pBfPEndFTVTQSb+hAxu7VbuXH9tdhCBFoZX5n40=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ml2bn/twhZigNVEAoFPbCMnkng77kerPKK3m//dRbHuvBc9XCRNXlcxJp7WpoR+Vo
	 NA0G3EO2D1xcXdhcJ+8cNlZdEYBBP3ZARlcoYqF65F4Sm3mJorULk/MZ9NV6tDZw/P
	 +phDoG1gEl5mOrTmeYlKQRWGe6Izq3EQyONmEDuA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86D98F80146;
	Thu,  2 Apr 2020 16:40:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9A833F80148; Thu,  2 Apr 2020 16:40:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 89BBBF80140
 for <alsa-devel@alsa-project.org>; Thu,  2 Apr 2020 16:40:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 89BBBF80140
IronPort-SDR: 6rWTEX1OaArlyNldfRJ4XYspYlh/Ln8GZNyrEpyRPy7dEzPHSH9D5+tSYQ7frAiUj4pz2Q+npa
 895k87nLFlqA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 07:40:42 -0700
IronPort-SDR: fDBxxK5xNTbax8EipfVCC23Lo0KyyX3mBP4IzEF0rCY3FzMPDLQ1zd4MG1KivgKmpaso5uZFtq
 Msu+2Y2a2qZg==
X-IronPort-AV: E=Sophos;i="5.72,336,1580803200"; d="scan'208";a="423153912"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.134.105.247])
 ([10.134.105.247])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2020 07:40:41 -0700
Subject: Re: [PATCH] ASoC: Intel: Skylake: Add alternative topology binary name
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200325122230.12172-1-mateusz.gorski@linux.intel.com>
 <70860cdd-0017-7e6c-3a87-85e125e236fe@linux.intel.com>
 <49890f9b-f6db-c989-6072-312014a1a1f2@linux.intel.com>
 <6ae14d4b-41e2-c48c-d0de-24a692468009@linux.intel.com>
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Message-ID: <d343fc58-5a8a-02db-bb1e-d45b408a0750@linux.intel.com>
Date: Thu, 2 Apr 2020 16:40:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <6ae14d4b-41e2-c48c-d0de-24a692468009@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: pl
Cc: cezary.rojewski@intel.com, tiwai@suse.com
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


>>
>> The intention of this patch was not to deal with the different DMIC 
>> configurations problem. It only simplifies the topology binary 
>> selection. As you mentioned in one of previous mails, currently there 
>> are two options:
>>
>> - name based on NHLT, which is pretty complicated, especially for end 
>> user, and is also depending on things like OEM name so the same 
>> topology will need to be renamed multiple times different devices 
>> (additionally, there are laptops on the market that do not have NHLT 
>> table at all)
>>
>> - dfw_sst.bin, which is only a fallback binary name and should not be 
>> actually used because it could be misleading for users/distro 
>> intergrators
>>
>> This change adds the third option, which is, in my opinion, the right 
>> way to deal with this problem. This name is simpler, does not depend 
>> on existence of NHLT, and makes life easier for users/distros.
>
> Right, and that's fine to avoid the NHLT-name and dfw_sst.bin, no 
> issue here. The point is to go one step further and require ZERO 
> configuration from users.
>
>> And as for the mentioned DMIC confguration problem - I am doing a 
>> research to find the simplest way to deal with this.
>
> Just append the number of mics detected to the topology file name? 
> Asking users to copy/symlink hda_dsp_DMIC_2ch.tplg as hda-dsp.tplg 
> doesn't really help, you can make things simpler.


Sent another patch to add path multiconfiguration feature to the driver. 
This way we will have one topology binary for multiple DMIC 
configurations, so we do not need to select different file according to 
its name. Also new version of topology conf was provided, the one with 
multiple configs.


Thanks,
Mateusz

