Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F0B2803C6
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Oct 2020 18:22:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B22E0191E;
	Thu,  1 Oct 2020 18:21:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B22E0191E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601569352;
	bh=icGAbLnhtUGG4FZHt4vn473IU2Lqxbrh4SJ9A1pKxHI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XUVXsOifZSZQ/Nu0yvuXXBox82Jk1kMw95a9CMdf7D2qHTrdc+kHqXVAAHFQ+TLS4
	 gchm4pFgo21bBhSSrPd7cpH9nwos/NPnO+DiQShOfQn8LubQii5ugB9EQ2DG5CcXW0
	 jV8xmLjg7FbP2rTaeBv7DcNmeqfkiTUwEhPRq01I=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CC275F8020C;
	Thu,  1 Oct 2020 18:20:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AB8EAF801F5; Thu,  1 Oct 2020 18:20:50 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6D105F801D8
 for <alsa-devel@alsa-project.org>; Thu,  1 Oct 2020 18:20:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D105F801D8
IronPort-SDR: QOqjNe9mBnRLnBUbxwe3cQL1e3UUCNjUuj5VkYz/h3C4uOUVAWHsGfMC6do8IM/OE2SC8oLH6T
 4DN3C1enuUsA==
X-IronPort-AV: E=McAfee;i="6000,8403,9761"; a="163626087"
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="163626087"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 09:20:40 -0700
IronPort-SDR: C2dn6wV9epBDg1xpFQ0gkbQf+Am12SWE1MugG+wEhkyPikpWSCebMIh76RKfhu+ZdCrlIPechY
 EO3Wpy91WP+g==
X-IronPort-AV: E=Sophos;i="5.77,323,1596524400"; d="scan'208";a="416120368"
Received: from myounan-mobl1.amr.corp.intel.com (HELO [10.251.131.17])
 ([10.251.131.17])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2020 09:20:40 -0700
Subject: Re: [PATCH 0/6] Ancillary bus implementation and SOF multi-client
 support
To: Mark Brown <broonie@kernel.org>
References: <20200930225051.889607-1-david.m.ertman@intel.com>
 <20201001125038.GC6715@sirena.org.uk>
 <ddb019b8-4370-eca8-911f-38adf0531076@linux.intel.com>
 <20201001152450.GK6715@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <2ba29c19-205b-6d0a-3a28-f9d5cc32adfe@linux.intel.com>
Date: Thu, 1 Oct 2020 11:20:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201001152450.GK6715@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, tiwai@suse.de, gregkh@linuxfoundation.org,
 ranjani.sridharan@intel.com, parav@nvidia.com, jgg@nvidia.com,
 Dave Ertman <david.m.ertman@intel.com>
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



On 10/1/20 10:24 AM, Mark Brown wrote:
> On Thu, Oct 01, 2020 at 09:07:19AM -0500, Pierre-Louis Bossart wrote:
> 
>>>> are controlled by DT/ACPI. The same argument applies for not using MFD
>>>> in this scenario as it relies on individual function devices being
>>>> physical devices that are DT enumerated.
> 
>>> MFD has no reliance on devices being DT enumerated, it works on systems
>>> that don't have DT and in many cases it's not clear that the split you'd
> 
> ...
> 
>> To the best of my knowledge, the part of 'individual function devices being
>> physical devices' is correct though. MFDs typically expose different
>> functions on a single physical bus, and the functions are separated out by
>> register maps. In the case where there's no physical bus/device and no
>> register map it's unclear how MFDs would help?
> 
> MFD doesn't care.  All MFD is doing is instantiating platform devices
> and providing mechanisms to pass resources through from the parent
> device to the child devices.  It doesn't really matter to it which if
> any combination of resources are being provided to the children or what
> the devices represent.

I have nothing against MFD, but if this boils down to platform devices 
we are back to the initial open "are platform devices suitable as 
children of PCI devices"? I've heard Greg say no for the last year and a 
half - and he just re-stated this earlier in this thread.
