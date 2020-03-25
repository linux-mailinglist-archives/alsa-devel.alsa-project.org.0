Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D1303192821
	for <lists+alsa-devel@lfdr.de>; Wed, 25 Mar 2020 13:23:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 615BE166C;
	Wed, 25 Mar 2020 13:22:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 615BE166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585138983;
	bh=lJoKGmSF3FXSDH3T+qg3wuxu3N33Bcgptpat1RVD8n0=;
	h=From:Subject:To:References:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=DHfQwqkXUOZwog+p0Gc5Xh9epm1XiqtwB+HglAO8cJpvFMIymJ5V1we6e6cCjc1SU
	 iXGZoPNt+chPmgLRpdJ97zGfjL7euJdcY5LKFli25axBiUbEb3YLd8C4KzSCrJljiv
	 Frwj/zDiLjpRCQQxPGiqcXoiRowMoWxhWc/hTPQE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1FCC1F8015A;
	Wed, 25 Mar 2020 13:21:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5554DF8015A; Wed, 25 Mar 2020 13:21:17 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 709E0F800EF
 for <alsa-devel@alsa-project.org>; Wed, 25 Mar 2020 13:21:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 709E0F800EF
IronPort-SDR: DHWdNZ06OHufzZCakLpdRNIcwD5z/VCthqTacFGc5yed/u6YBM03Ml9PZ1q4Qk7fxMOOPb/RpP
 zKQU8H7BpdBA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 05:21:08 -0700
IronPort-SDR: wovgDthWTp9Ad5EbMzRc00DdoDsM+/fTkI7SxMe6hIed7vOWwRADvLnyA1ODv+hxAzTkwqht+h
 dcwMxyhHhCxA==
X-IronPort-AV: E=Sophos;i="5.72,304,1580803200"; d="scan'208";a="270783385"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.254.66.157])
 ([10.254.66.157])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2020 05:21:07 -0700
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Subject: Re: [PATCH v2] topology: Add topology file for generic HDA DSP
 machine driver
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200309120944.15240-1-mateusz.gorski@linux.intel.com>
 <0d2fb996-2668-e53b-ec91-18bf9e27df31@linux.intel.com>
 <7334e7b6-c4d3-aac3-46d2-b4fbcb0e3957@linux.intel.com>
 <27e153ce-f94b-876a-32e7-66dd5842c07b@linux.intel.com>
 <0efdc802-eb82-2137-19a1-9a7e71fa62d8@linux.intel.com>
 <00bd3e15-b088-c185-4473-8d928da01b9c@linux.intel.com>
Message-ID: <07efcaf1-c6fd-49f3-1e76-e20c370d4a70@linux.intel.com>
Date: Wed, 25 Mar 2020 13:21:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <00bd3e15-b088-c185-4473-8d928da01b9c@linux.intel.com>
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
>> We have a mechanism to choose the PCM configuration of given topology 
>> path via amixer control. That way we can include both 2ch and 4ch 
>> DMIC configurations in one topology file and simply change DMIC 
>> pipeline configuration on runtime.
>>
>> Unfortunately this mechanism is not currently available on upstream.
>>
>> As said before, this is a reference topology, if needed I can also 
>> upload modified version with 4ch DMIC path.
>
> I don't understand the concept of 'reference topology'. It's not like 
> anyone is going to modify this file, which is seriously cryptic, so 
> it's got to be a 'usable topology', turn-key really.
>
> You would need three files, with no dmic, with 2 dmic with 4 dmic and 
> a driver level code selection. Today the code loads the topology name 
> coming from NHLT or dfw_sst.bin, you'd need a more elaborate logic to 
> deal with the hardware variants and without requiring any fiddling, 
> rename or edits of topology files.
>
>

I prepared 3 different topology .conf files and sent them in patch set. 
These topologies cover all three cases (no DMIC, 2ch DMIC capture and 
4ch DMIC capture). I also prepared and sent kernel patch adding third 
way of selecting topology binary file so that its name depends on used 
machine driver.

Thanks,
Mateusz

