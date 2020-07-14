Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A18F21F0A6
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Jul 2020 14:15:12 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7C5A31662;
	Tue, 14 Jul 2020 14:14:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7C5A31662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1594728911;
	bh=jwQk69ZDpPmHfdWoVbuYfGKZ+P3mp7GVFsH651TbHzc=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=r4UG7DlblM80m/wy8rQJ25uEXg7h/C8StjJI2V92hzobAffTZ/CIBl5ELGIQ/T5Z/
	 tjShrPgYrHu4d/fYnj4qmni34D/eCNm2y3PURysfWiRhZpfdjdIlwn30ppXnTBuwGs
	 m9/fbVG81Finz18L3i0K0cdnH4iIsbQlSOa0VVs4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B4BCAF800E5;
	Tue, 14 Jul 2020 14:13:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6A387F8019B; Tue, 14 Jul 2020 14:13:27 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 90C11F8014E
 for <alsa-devel@alsa-project.org>; Tue, 14 Jul 2020 14:13:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 90C11F8014E
IronPort-SDR: RQ2p6cCLKzOqh7md38aIHfJrp6oE8WxaxEyVk7NC2wNk45EIIeUKKZp3a7Ji51iiWo5BCSkXL8
 BsXXJkQIKNBg==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="148015043"
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="148015043"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 05:13:18 -0700
IronPort-SDR: AVQ2HeD3grSpp/1uZ/3Ewp4Gml0TpwUYb28aQaKiPlizlH01CaYqsAEcjEifLaZHOS5qkbLl6Q
 BNilK68hcV0Q==
X-IronPort-AV: E=Sophos;i="5.75,350,1589266800"; d="scan'208";a="459668727"
Received: from pmaziarx-mobl.ger.corp.intel.com (HELO [10.249.128.98])
 ([10.249.128.98])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2020 05:13:16 -0700
Subject: Re: [PATCH v2 00/10] topology: decode: Various fixes
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <1594026363-30276-1-git-send-email-piotrx.maziarz@linux.intel.com>
 <fe7b1707-d6f3-f8ad-e72d-f5840f298d6d@linux.intel.com>
From: Piotr Maziarz <piotrx.maziarz@linux.intel.com>
Message-ID: <dd94424f-b1c9-826d-3eaf-244f25d2fda6@linux.intel.com>
Date: Tue, 14 Jul 2020 14:13:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fe7b1707-d6f3-f8ad-e72d-f5840f298d6d@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: cezary.rojewski@intel.com, amadeuszx.slawinski@intel.com
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

On 2020-07-06 22:01, Pierre-Louis Bossart wrote:
> 
> 
> On 7/6/20 4:05 AM, Piotr Maziarz wrote:
>> This series fixes various problems with topology decoding mechanism.
>> Some of the problems were critical like improper memory management or
>> infinite loops that were causing undefined behaviour or program crashes,
>> while other resulted in losing some data during conversion.
>>
>> Bugs found while testing with Intel SST topologies.
>>
>> Changelog:
>> v2:
>>    -Divide into more patches, critical fixes are in separate patches now
>>    -More specific descriptions
>>    -Fix a typo UML to UCM
> 
> That fix makes it even more confusing, I get that a UCM file can set 
> values for controls defined in a topology file, but 'decoding to UCM' 
> leaves me wondering what you are referring to.
> 

I meant standard ALSA configuration file format that is used also by UCM 
files. I'll change it for more clarity.

> Also you may want to remove all the Gerrit ChangeId before sending to 
> the mailing list.
> 
>>    -Add error reporting in topology: decode: fix channel map memory
>>     allocation
>>    -Remove goto again in topology: Make buffer for saving dynamic size
>>     for better readability
>>
>> Piotr Maziarz (10):
>>    topology: decode: Fix channel map memory allocation
>>    topology: decode: Fix infinite loop in decoding enum control
>>    topology: decode: Remove decoding  values for enum control
>>    topology: decode: Add enum control texts as separate element
>>    topology: decode: Fix printing texts section
>>    topology: decode: Change declaration of enum decoding function
>>    topology: decode: Fix decoding PCM formats and rates
>>    topology: decode: Print sig_bits field in PCM capabilities section
>>    topology: decode: Add DAI name printing
>>    topology: Make buffer for saving dynamic size
>>
>>   src/topology/ctl.c        | 51 
>> ++++++++++++++++++++++-------------------------
>>   src/topology/dapm.c       |  3 +--
>>   src/topology/pcm.c        | 11 +++++++---
>>   src/topology/save.c       | 34 ++++++++++++++++++++++++++-----
>>   src/topology/text.c       |  2 +-
>>   src/topology/tplg_local.h |  2 +-
>>   6 files changed, 64 insertions(+), 39 deletions(-)
>>

