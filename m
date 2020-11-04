Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A06A2A6394
	for <lists+alsa-devel@lfdr.de>; Wed,  4 Nov 2020 12:48:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AE7C916AE;
	Wed,  4 Nov 2020 12:47:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AE7C916AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604490508;
	bh=7Cpyq6Lis1gWZqc95hzUKZB5gRiue+Nx54RImIitrL0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Wr0qTH+rN2rfiAHxuoGhOpJ3d55TZpea8CbN4s4jRTt1Q3pI0/FLZK9W64SAcUnmp
	 eWDehKnBiSgdMfjtH/VjyzieJIb4cUkp0PMiq51IoJWdRGFuUT+lBA5ck0kljZ+VKw
	 gUo8+8IPgLj4O0U9J0ft/FkyEMRkgQWogc7NyGXM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A5E91F80232;
	Wed,  4 Nov 2020 12:46:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C4C7F80229; Wed,  4 Nov 2020 12:46:53 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 07267F80229
 for <alsa-devel@alsa-project.org>; Wed,  4 Nov 2020 12:46:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 07267F80229
IronPort-SDR: b4AQd1m4Je4ToQs3Km4NVGe0FbNz/SJhwi79fCBVhOJ9B92cUrAA0pPcXHqaFLCSes2INd6875
 tcp0ZDZaAquQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9794"; a="169310721"
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; d="scan'208";a="169310721"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 03:46:41 -0800
IronPort-SDR: 68kskoXqxwYBFqWbszWyaEQkCGG5qeIkJGC5hc6NY2wJMZcLz88Qhstzoozgc0QQfFt7j092xm
 MWHOjYSRFquA==
X-IronPort-AV: E=Sophos;i="5.77,450,1596524400"; d="scan'208";a="471197594"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.249.147.98])
 ([10.249.147.98])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2020 03:46:39 -0800
Subject: Re: [PATCH] ASoC: Intel: Skylake: Add alternative topology binary name
To: Greg KH <gregkh@linuxfoundation.org>
References: <20201103141047.15053-1-mateusz.gorski@linux.intel.com>
 <20201103153541.GC3267686@kroah.com>
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Message-ID: <d6006431-420f-55c7-0f78-977507e11fcf@linux.intel.com>
Date: Wed, 4 Nov 2020 12:46:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201103153541.GC3267686@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: pl
Cc: cezary.rojewski@intel.com, alsa-devel@alsa-project.org,
 Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
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


>> [ Upstream commit 1b290ef023b3eeb4f4688b582fecb773915ef937 ]
>>
>> Add alternative topology binary file name based on used machine driver
>> and fallback to use this name after failed attempt to load topology file
>> with name based on NHLT.
>> This change addresses multiple issues with current mechanism, for
>> example - there are devices without NHLT table, and that currently
>> results in tplg_name being empty.
>>
>> Signed-off-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>
>> Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
>> Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
>> Link: https://lore.kernel.org/r/20200427132727.24942-2-mateusz.gorski@linux.intel.com
>> Signed-off-by: Mark Brown <broonie@kernel.org>
>> ---
>>
>> This functionality is merged on upstream kernel and widely used. Merging
>> it to LTS kernel would improve the user experience and resolve some of the
>> problems regarding topology naming that the users are facing.
> What problems are people facing, and what kernel(s) are you asking for
> this to be ported to, and why can't people just use 5.8 or newer if they
> have this new hardware?
>
> thanks,
>
> greg k-h

I forgot to add - I wanted this change to be merged to stable 5.4 
kernel. Please let me know if I should resend this patch with this 
information included.

As for the user issues - topology binary file name is currently created 
according to information from NHLT. The problem is, that some laptops 
(for example Dell XPS 13) do not have NHLT at all. This results in 
topology binary name being empty (" ").
This patch adds alternative name based on loaded machine driver.

It applies not only to new hardware, please note that the mentioned Dell 
XPS 13 is based on Kabylake. This issue existed on upstream from the 
beginning of Skylake driver and was only recently addressed.

