Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id CA04B148BBB
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 17:17:32 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4C3BF166C;
	Fri, 24 Jan 2020 17:16:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4C3BF166C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579882652;
	bh=0XC8mhOFUAo4kEi2NG4BOMeRMBQIGlUO2FLWG76revU=;
	h=To:References:From:Date:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RmT7jSd9ObUjoMx8hZx6g6k0wLGf4wRU2YHrROvyWze7Sd1YnXW8l7oM0u2dDQssU
	 zzj0eZjkxO9WHgwllfEStLpsWybcnIPMXn/R7yFOd+YbdBVgMwgqWXiJfaluXwZm+e
	 nMh43YmjOI4K4cuEysFWMmmg/AcnS7pYkKCJ7u+A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BABBCF8020C;
	Fri, 24 Jan 2020 17:15:48 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5557F8020C; Fri, 24 Jan 2020 17:15:45 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 11411F800F5
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 17:15:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 11411F800F5
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 08:15:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="400697985"
Received: from iifeduba-mobl1.amr.corp.intel.com (HELO [10.254.110.26])
 ([10.254.110.26])
 by orsmga005.jf.intel.com with ESMTP; 24 Jan 2020 08:15:37 -0800
To: Michal Feix <michal@feix.family>, alsa-devel@alsa-project.org
References: <ebe959a0-5272-e7bd-6001-1ce598f7f6be@feix.family>
 <44ba763e-f3d2-3fa2-eea6-9ebb7317a3bd@linux.intel.com>
 <cc4fc82d-5b01-d5f9-7771-ba2b5daa5829@feix.family>
 <103d4b4e-f234-5704-310d-ad6286575aa1@linux.intel.com>
 <ba922286-a882-1ed4-3b62-8d8acee971fd@feix.family>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <97d84605-3394-c65e-4c97-8f20049677e0@linux.intel.com>
Date: Fri, 24 Jan 2020 10:15:37 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <ba922286-a882-1ed4-3b62-8d8acee971fd@feix.family>
Content-Language: en-US
Subject: Re: [alsa-devel] ASUS T100TAM UCM
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/23/20 9:02 AM, Michal Feix wrote:
> 
>>
>>> Thanks Pierre. I'm aware of the work done previously on Asus T100. 
>>> Not sure, if Asus T100TAM is any significantly different. Just tried 
>>> your suggested commands as root user:
>>>
>>> # alsaucm -c bytcr-rt5640 set _verb HiFi set _enadev Headphones
>>> ALSA lib ucm_subs.c:215:(uc_mgr_get_substituted_value) variable 
>>> '${CardComponents}' is not defined in this context!
>>> ALSA lib main.c:960:(snd_use_case_mgr_open) error: failed to import 
>>> bytcr-rt5640 use case configuration -22
>>> alsaucm: error failed to open sound card bytcr-rt5640: Invalid argument
>>>
>>> # alsaucm -c bytcr-rt5640 set _verb HiFi set _enadev Speaker
>>> ALSA lib ucm_subs.c:215:(uc_mgr_get_substituted_value) variable 
>>> '${CardComponents}' is not defined in this context!
>>> ALSA lib main.c:960:(snd_use_case_mgr_open) error: failed to import 
>>> bytcr-rt5640 use case configuration -22
>>> alsaucm: error failed to open sound card bytcr-rt5640: Invalid argument
>>>
>>> I also tried this:
>>>
>>> # alsaucm listcards
>>> ALSA lib utils.c:261:(uc_mgr_config_load) could not open 
>>> configuration file /usr/share/alsa/ucm2/HDA Intel PCH/HDA Intel PCH.conf
>>> alsaucm: error failed to get card list: No such file or directory
>>>
>>> There really is no such file "HDA Intel PCH.conf" in HDA Intel PCH 
>>> directory, but I do not see any such file in the alsa-ucm-conf 
>>> package downloaded from origin Alsa site.
>>
>> can you point us to the alsa-info results then? It could indeed be a 
>> completely different hardware, where you only have HDaudio support (no 
>> I2S codecs), in which case you shouldn't need UCM.
> 
> http://alsa-project.org/db/?f=e5f8088e73917cfeddca95344aef7debf1498fa1

weird, the ACPI info shows you have an RT5640 codec and the card 
bytcr_rt5640 is indeed created. You also have the lpe_hdmi driver, which 
means your platforms does not support HDaudio, so there is no dependency 
on 'HDA Intel PCH.conf'

It looks to me like an UCM issue. alsaucm listcards should give you all 
the UCM profiles supported, if this doesn't work then there's something 
missing. Probably something for Jaroslav to comment on?
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
