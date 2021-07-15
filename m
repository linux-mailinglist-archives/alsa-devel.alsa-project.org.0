Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 644063C99F9
	for <lists+alsa-devel@lfdr.de>; Thu, 15 Jul 2021 09:58:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C4DA71684;
	Thu, 15 Jul 2021 09:58:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C4DA71684
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1626335931;
	bh=fp/FoaPoY3ZTrTrG6EkGkXK0q8cqxDcfTi5yVqzeT9Q=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wlwk9sGc5aQc1Tszg7ob7yVLCAvyzM2AZ2E1i2a73pHvpgw0zIa82ozkgI1psBn33
	 mKgesw6nSX8J83RYsH7BT6hzIMjJwGNKxXuTMc3gtGXXjULjm0D80XH+/5vxo0pwPV
	 +NWtCi9wn1uI4Og3DfVEIExwsP8HfIA0c+0K+v/8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 22E98F8020C;
	Thu, 15 Jul 2021 09:57:25 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AF039F80217; Thu, 15 Jul 2021 09:57:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C4362F80095
 for <alsa-devel@alsa-project.org>; Thu, 15 Jul 2021 09:57:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C4362F80095
X-IronPort-AV: E=McAfee;i="6200,9189,10045"; a="274326452"
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="274326452"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 00:57:04 -0700
X-IronPort-AV: E=Sophos;i="5.84,240,1620716400"; d="scan'208";a="495204603"
Received: from pujfalus-mobl.ger.corp.intel.com (HELO [10.252.59.202])
 ([10.252.59.202])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2021 00:57:02 -0700
Subject: Re: [PATCH 0/2] ALSA: compress: Cleanup and a potential fix
To: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>,
 Vinod Koul <vkoul@kernel.org>, Takashi Iwai <tiwai@suse.de>
References: <20210714162424.4412-1-tiwai@suse.de> <YO+uAyrdT1xzLFIa@matsya>
 <74151b06-a1cd-3a6b-ef1e-8db03eb815ad@gmail.com>
From: "Ujfalusi, Peter" <peter.ujfalusi@linux.intel.com>
Message-ID: <2ac2e847-9c14-658e-8d75-0b93a8ddd0d6@linux.intel.com>
Date: Thu, 15 Jul 2021 10:56:59 +0300
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <74151b06-a1cd-3a6b-ef1e-8db03eb815ad@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>
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



On 7/15/2021 10:51, Péter Ujfalusi wrote:
> 
> 
> On 15/07/2021 06:39, Vinod Koul wrote:
>> On 14-07-21, 18:24, Takashi Iwai wrote:
>>> Hi,
>>>
>>> this series contains a couple of patches for compress-offload API, one
>>> for a cleanup of unused API functions and another for the proper mutex
>>> initialization.  I stumbled on the second while doing the first.
>>
>> Thanks for the cleanup. We never have a compress only device and it is a
>> mix of PCM and compress FEs mostly :)
> 
> Actually I'm working on a series where a card would only contain nothing
> else but a compr, no PCMs...

and I should have replied from here ;)

I'm preparing to split up the SOF into IPC clients [1] and the probes
support (which is using compress API) is going to be moved as a separate
client, creating it's own sound card with the single comprCxD0 (and the
controlCx).

Is this cleanup going to prevent this?

[1] https://github.com/thesofproject/linux/pull/3007

-- 
Péter
