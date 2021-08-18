Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D613F0727
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Aug 2021 16:53:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40DD91686;
	Wed, 18 Aug 2021 16:52:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40DD91686
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629298406;
	bh=GlcqvJiNr5ZJ2FBGP0KcF/i1TrSri6r7/Qfg5Ti4Bng=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WToIbqlggXMYoCtbviBafDBT/w4qu44ZKgeaMpII6ibB3TlCd83UaV47N3vkSa8Zo
	 rjSsu1IuOJDUipx0rinSSOCh0wqdOnYmonzLKwBv8MJZKab11GCMGPhtIi8rowtWSm
	 vpREgobeF9quanM0vwUs0okD2ku+o7JWxSeoiyDc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9FC12F80163;
	Wed, 18 Aug 2021 16:52:08 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 541C2F80249; Wed, 18 Aug 2021 16:52:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 34CB1F80169
 for <alsa-devel@alsa-project.org>; Wed, 18 Aug 2021 16:51:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 34CB1F80169
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216335124"
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="216335124"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 07:51:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,330,1620716400"; d="scan'208";a="449785281"
Received: from ksawchu-mobl.amr.corp.intel.com (HELO [10.212.83.236])
 ([10.212.83.236])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 07:51:53 -0700
Subject: Re: [RFC PATCH 1/2] driver core: export
 driver_deferred_probe_trigger()
To: Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20210817190057.255264-1-pierre-louis.bossart@linux.intel.com>
 <20210817190057.255264-2-pierre-louis.bossart@linux.intel.com>
 <YRyeR6imvSwOOasQ@kroah.com> <20210818115736.GA4177@sirena.org.uk>
 <YR0Ji7DQXoo0z4vP@kroah.com> <20210818134814.GF4177@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <14235b8d-d375-6e2d-cae9-33adf9c48120@linux.intel.com>
Date: Wed, 18 Aug 2021 09:51:51 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210818134814.GF4177@sirena.org.uk>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 tiwai@suse.de, linux-kernel@vger.kernel.org, liam.r.girdwood@linux.intel.com,
 vkoul@kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christoph Hellwig <hch@lst.de>
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



>>> The issue is that the driver core is using drivers completing probe as a
>>> proxy for resources becoming available.  That works most of the time
>>> because most probes are fully synchronous but it breaks down if a
>>> resource provider registers resources outside of probe, we might still
>>> be fine if system boot is still happening and something else probes but
>>> only through luck.
> 
>> The driver core is not using that as a proxy, that is up to the driver
>> itself or not.  All probe means is "yes, this driver binds to this
>> device, thank you!" for that specific bus/class type.  That's all, if
>> the driver needs to go off and do real work before it can properly
>> control the device, wonderful, have it go and do that async.
> 
> Right, which is what is happening here - but the deferred probe
> machinery in the core is reading more into the probe succeeding than it
> should.

I think Greg was referring to the use of the PROBE_PREFER_ASYNCHRONOUS
probe type. We tried just that and got a nice WARN_ON because we are
using request_module() to deal with HDaudio codecs. The details are in
[1] but the kernel code is unambiguous...

        /*
	 * We don't allow synchronous module loading from async.  Module
	 * init may invoke async_synchronize_full() which will end up
	 * waiting for this task which already is waiting for the module
	 * loading to complete, leading to a deadlock.
	 */
	WARN_ON_ONCE(wait && current_is_async());


The reason why we use a workqueue is because we are otherwise painted in
a corner by conflicting requirements.

a) we have to use request_module()
b) we cannot use the async probe because of the request_module()
c) we have to avoid blocking on boot

I understand the resistance to exporting this function, no one in our
team was really happy about it, but no one could find an alternate
solution. If there is something better, I am all ears.

Thanks
-Pierre

[1] https://github.com/thesofproject/linux/pull/3079
