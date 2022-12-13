Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7664864BABD
	for <lists+alsa-devel@lfdr.de>; Tue, 13 Dec 2022 18:15:43 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 05A4E1833;
	Tue, 13 Dec 2022 18:14:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 05A4E1833
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1670951743;
	bh=hLsGCfvIjddggU0ZywVY7s922FmOj7/Vd71hqxF2vbY=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=LoPs+PjWzruUdSRAjAnSgsDV6ixfUtHZ/H+6Msith0Sv3BfcnG+WWW3oe1w6pO3Zy
	 PEM6DlLfJW4bOUl58EvfC36KkBuKUJ8KIVcltRprdb9jw2InrBql/SZzLxWMBRAAyg
	 bJAtva9bkiT3KlM4BMvIp4dvwRFXtwfAXjVi2Lak=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BAC28F80073;
	Tue, 13 Dec 2022 18:14:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A5309F80073; Tue, 13 Dec 2022 18:14:44 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AAA03F80073
 for <alsa-devel@alsa-project.org>; Tue, 13 Dec 2022 18:14:42 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA03F80073
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=LmjS55qI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670951683; x=1702487683;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=hLsGCfvIjddggU0ZywVY7s922FmOj7/Vd71hqxF2vbY=;
 b=LmjS55qIVbuY+189nVQKD1oqy1EGUguyEeaxkSWJv7W2LOw6W6XHldD2
 ZQ5LbiqaxARJHJCWgdlPkpGPisbN7TsHjgYFhK336ET3Jq3978b9Y/o0j
 7P6samyFkIdedy9lghmYGn/hJ6+laCugBh3xwxq/IaPhlLJjcshvEGWmG
 qz/b7xd6sBZELFucs0NKOYsdFpuKqUrhVWdXx3MYB+tO/wEt4laUNbhy7
 j0Z/FjeC89W4GtqoVbpgwDRWaN6rBWNdp8YIhKQygpHeg2CZg1qYdekti
 5+Bk+27joFmhydyxhsxdOw5GVIXvL1GHlO/lhJu+Je7LVnLA2YgTdBoNH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="404445152"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; d="scan'208";a="404445152"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 09:12:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10560"; a="642156491"
X-IronPort-AV: E=Sophos;i="5.96,242,1665471600"; d="scan'208";a="642156491"
Received: from lvalluri-mobl.amr.corp.intel.com (HELO [10.212.67.174])
 ([10.212.67.174])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2022 09:12:12 -0800
Message-ID: <d2debc58-9263-213d-17b4-fd738a7899e9@linux.intel.com>
Date: Tue, 13 Dec 2022 11:12:11 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: ASoC: soc-pcm: Don't zero TDM masks in __soc_pcm_open() breaks
 SOF Audio in Lenovo laptops
Content-Language: en-US
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
 "rf@opensource.cirrus.com" <rf@opensource.cirrus.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "peter.ujfalusi@linux.intel.com" <peter.ujfalusi@linux.intel.com>
References: <f7a515a0d5429b41348341874b78f3c3254970e6.camel@infinera.com>
 <Y5IOEAw5pjAvGgiN@sirena.org.uk>
 <8fa316d5-b525-2207-9092-da14f1d77232@linux.intel.com>
 <ade9deca-2f15-a3a6-97c3-7198f1cf0da0@linux.intel.com>
 <a31e0bee-6972-0c0f-7579-449fb412a0b2@linux.intel.com>
 <b54b48cf-3680-9f0c-8ca9-db904e4a57ec@linux.intel.com>
 <Y5Nfyo7VARU0TKoB@sirena.org.uk>
 <bf558787-0ca5-f99b-5ae3-3b0a30de9344@opensource.cirrus.com>
 <962b52d90af9bbb3bd2ff0a2a125037a80019a97.camel@infinera.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <962b52d90af9bbb3bd2ff0a2a125037a80019a97.camel@infinera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: "sashal@kernel.org" <sashal@kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "kai.vehmanen@linux.intel.com" <kai.vehmanen@linux.intel.com>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "ranjani.sridharan@linux.intel.com" <ranjani.sridharan@linux.intel.com>,
 "yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 12/13/22 10:57, Joakim Tjernlund wrote:
> On Fri, 2022-12-09 at 16:26 +0000, Richard Fitzgerald wrote:
>> On 9/12/22 16:18, Mark Brown wrote:
>>> On Fri, Dec 09, 2022 at 05:38:54PM +0200, Péter Ujfalusi wrote:
>>>> On 09/12/2022 16:42, Pierre-Louis Bossart wrote:
>>>
>>>>> Agree with the analysis, so what would be the least bad recommendation?
>>>>> a) revert the "don't zero TDM masks" patch
>>>>> b) backport the change to use set_stream()?
>>>
>>>> I would vote for b) unless other platforms report regressions.
>>>
>>> I don't really care either way given the backport policy.
>>
>> Neither do I.
>> If you want to minimize risk, revert the patch in older backports.
>>
>> Lessons learned:
>> Don't hijack a data member to pass something different from what it
>> is intended to hold.
>> Don't depend on a bug.
>> Don't assume all code is using a data member for what is supposed to be
>> in that member.
> 
> Did you reach a conclusion w.r.t what the should be?

I read the consensus is for a backport of the 'set_stream' stuff. You're
welcome to submit a patch.
