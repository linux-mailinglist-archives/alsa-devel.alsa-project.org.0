Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEA82727BF
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 16:38:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F2F7816C1;
	Mon, 21 Sep 2020 16:37:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F2F7816C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600699101;
	bh=xJfDoZZhGeHa2DKJwnYy8lP3R1Nn791B7faDgLQl9vk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NaSzcKz59v4ZAnwvoTIGIRBTorDfeH8imHZH2a0UCuOFbkDnbJU2ZIre4GoQPgt5J
	 DHbPrfyNTnmSjBPXA5jHU7iKr32rsGeBTSrG1dpVDgkQQ81Y+x1mkxCHJlOolRvRNB
	 2/9vCzgfy7V1vaB6eQXia2e2f3HmugqG7IDo/8VA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 12171F8010A;
	Mon, 21 Sep 2020 16:36:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4058F80162; Mon, 21 Sep 2020 16:36:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2E2ADF8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 16:36:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2E2ADF8010A
IronPort-SDR: 0AH4yHSxaFWzyN5308NRb+k2A4ridgqhsd+mbRBwU4MWXAetmtQoO2Xvjxt+PIlUij8aSmBJP8
 hyOF1pt6gwOQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="161310441"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="161310441"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 07:36:18 -0700
IronPort-SDR: 70P3Wyogsq4ofgWCK/yTZifYvy+SUuRTKOmtHUrftuBepUyjC5DRfOe3mXR8CoXYT/u0xCh6or
 nHMsw+4k635w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="337942515"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 21 Sep 2020 07:36:13 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kKMif-000kdN-1g; Mon, 21 Sep 2020 17:23:05 +0300
Date: Mon, 21 Sep 2020 17:23:05 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Message-ID: <20200921142305.GZ3956970@smile.fi.intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
 <20200921115424.4105-4-cezary.rojewski@intel.com>
 <20200921125934.GT3956970@smile.fi.intel.com>
 <2c073526-fc9d-832b-48d4-f955e3b99e24@linux.intel.com>
 <20200921142012.GY3956970@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200921142012.GY3956970@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com,
 gregkh@linuxfoundation.org, ppapierkowski@habana.ai, marcin.barlik@intel.com,
 zwisler@google.com, pierre-louis.bossart@linux.intel.com, lgirdwood@gmail.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 tiwai@suse.com, krzysztof.hejmowski@intel.com, cujomalainey@chromium.org,
 vamshi.krishna.gopal@intel.com
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

On Mon, Sep 21, 2020 at 05:20:12PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 21, 2020 at 03:58:33PM +0200, Amadeusz Sławiński wrote:
> > On 9/21/2020 2:59 PM, Andy Shevchenko wrote:
> > > > +struct catpt_set_volume_input {
> > > > +	u32 channel;
> > > > +	u32 target_volume;
> > > > +	u64 curve_duration;
> > > > +	enum catpt_audio_curve_type curve_type __aligned(4);
> > > > +} __packed;
> > > How this __packed changes anything? In general __packed doesn't make sense for
> > > in-kernel data structures. Otherwise you have to use proper (POD) types for
> > > data. Ditto for all similar cases.
> > 
> > All of __packed use in code is done on structures used to communicate with
> > FW, which is binary interface, so it is not kernel only structure, as it is
> > also FW one. While we can expect compiler to do the right thing, I consider
> > it is better to be explicit about what kind of data we are handling, so
> > there aren't any surprises.
> 
> Size of enum is compiler defined. It may not be used in the ABIs.

I have to elaborate that I'm talking in ABIs which implies different compilers
and even may be run on different CPU architectures.

> __uXX vs. uXX I dunno.

And here I'm talking about FW <--> OS interface. It's not user visible ABI, but
still some Ext <--> Int protocol. I saw uXX types in data structures of FW
communication protocols.

-- 
With Best Regards,
Andy Shevchenko


