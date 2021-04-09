Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A092A35A667
	for <lists+alsa-devel@lfdr.de>; Fri,  9 Apr 2021 20:57:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 195BC15E0;
	Fri,  9 Apr 2021 20:56:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 195BC15E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617994660;
	bh=+rEXUwo56cRtGPkbyr/JmE5y+jWRYN/Y6DerO1XC2+4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TldmQmWkAN3bVh6Sqb3+SxRxGiVAMWwvMTjhp8zulo1xslX6ROVQWf+j75St+UWrl
	 +zLShMrKOmQ2q0S0Ggu38HXFe45DSR65u0z3OBJm2MMMLWBvtafSJBPXwDAkultEPA
	 a9Mbse4NIyRIivwGzxxohHEpQXMsL/ymSRVeFI9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73060F8016D;
	Fri,  9 Apr 2021 20:56:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 19CC8F8016A; Fri,  9 Apr 2021 20:56:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 16B65F800EE
 for <alsa-devel@alsa-project.org>; Fri,  9 Apr 2021 20:56:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 16B65F800EE
IronPort-SDR: izd9Upa83/4gPY95/qAftKIYMGTP7jXbumsKcx/haVHuscDEljLydigzCMu6uRLELAWdrsr1nY
 0U4JOzqGP2DA==
X-IronPort-AV: E=McAfee;i="6000,8403,9949"; a="181352449"
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="181352449"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 11:56:01 -0700
IronPort-SDR: bL79OWNPn4ZE3BhOmvpS56GpzLs+U585GZAMM0nSGHoLycRm0YaOdlYQigoli0L8frCQ/RI9aX
 RvDbZO8T2XhA==
X-IronPort-AV: E=Sophos;i="5.82,210,1613462400"; d="scan'208";a="419624645"
Received: from ricardor-mobl.amr.corp.intel.com (HELO [10.212.32.184])
 ([10.212.32.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2021 11:56:01 -0700
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Takashi Iwai <tiwai@suse.de>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
 <3107db1d-f97d-539a-05db-6f880b762f00@linux.intel.com>
 <3b33595e-777c-90b2-6d65-346c9bf6e003@perex.cz>
 <b0258a67-79ca-50cd-e6c5-74514ba8a3c5@linux.intel.com>
 <s5hv98v6h5a.wl-tiwai@suse.de>
 <9195f83a-28c4-d028-8f1e-c3beaa88d891@perex.cz>
 <05551192-57dd-2541-94a3-57d40a37e3bf@linux.intel.com>
 <8f33d7f9-50af-db15-8fb2-01d55bb0b413@linux.intel.com>
 <s5ho8en4dn7.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <eff846c0-c141-8fd2-bad1-dfd128dad58a@linux.intel.com>
Date: Fri, 9 Apr 2021 13:55:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <s5ho8en4dn7.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Curtis Malainey <cujomalainey@google.com>,
 ALSA development <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>,
 Amadeusz SX2awiX4ski <amadeuszx.slawinski@linux.intel.com>
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




>> No, replacing firmware files is not viable.
>>
>> Let me give you a practical example. In the course of SOF development,
>> we routinely copy new test firmware+topology in the location of
>> distribution-managed files. It's classic that when there is a
>> distribution update in the background to install the latest SOF
>> release, our test files are overwritten and it's not usual for
>> developers to lose time trying to figure out why the functionality
>> changed. We do need to have multiple paths and NEVER override what is
>> provided by the distributions. it's the moral equivalent of /usr/bin
>> v. /usr/local/bin.
> 
> Use /lib/firmware/updates/*.  That precedes over the standard path
> /lib/firmware/*.  (Also /lib/firmware/updates/$VERSION has even higher
> priority.)

thanks for the feedback Takashi, I had no idea this even existed :-)

The documentation is here:
https://www.kernel.org/doc/html/latest/driver-api/firmware/fw_search_path.html

I guess that removes the need for udev rules to select the 
firmware+topology in simple cases, e.g. if you have only one custom 
version or an image overlay.
