Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E42B2726E4
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 16:23:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E4C516CF;
	Mon, 21 Sep 2020 16:23:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E4C516CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600698232;
	bh=Hs7lomgp1TGaXXS5UzSbRvt2HfpRx9FAJTBXmSBAqCc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gNU5YvveCUCHINDAfUESHowFsAX5OkMItQmlfJTHQ3rYN8E/7vcU6RHiHbyvNhDGf
	 2oKcQcpOQfmrzOo7eYuMgNsOTNxsYVxQINm7a+Lc6SLOkqnA09tHIldbnPSw0cIJwv
	 d5C93vVL4Q79HeEhuhArd94JE3rGGSN5GtLQY1CM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55588F802E8;
	Mon, 21 Sep 2020 16:20:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D3120F802E8; Mon, 21 Sep 2020 16:20:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D25BBF802E3
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 16:20:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D25BBF802E3
IronPort-SDR: mGPqMy8psavnyMllH000y5EPJmnuLdnwYhQIQr2lUbk9b6l5LoVEK2wZHBp0gyIuztyE8Qzo+D
 X6AP0LI3RXYQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="157762884"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="157762884"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 07:20:20 -0700
IronPort-SDR: 9AkR8SO9Kr65hcjU70ASpyErLMMkizREfAuLNeDxp3RaU9ErJFDE1QgwFToLyhu9hESGMdkj6W
 kNepDZuyKceA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="337938638"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 21 Sep 2020 07:20:15 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kKMfs-000kbY-5s; Mon, 21 Sep 2020 17:20:12 +0300
Date: Mon, 21 Sep 2020 17:20:12 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?= <amadeuszx.slawinski@linux.intel.com>
Subject: Re: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Message-ID: <20200921142012.GY3956970@smile.fi.intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
 <20200921115424.4105-4-cezary.rojewski@intel.com>
 <20200921125934.GT3956970@smile.fi.intel.com>
 <2c073526-fc9d-832b-48d4-f955e3b99e24@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2c073526-fc9d-832b-48d4-f955e3b99e24@linux.intel.com>
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

On Mon, Sep 21, 2020 at 03:58:33PM +0200, Amadeusz Sławiński wrote:
> On 9/21/2020 2:59 PM, Andy Shevchenko wrote:
> > > +struct catpt_set_volume_input {
> > > +	u32 channel;
> > > +	u32 target_volume;
> > > +	u64 curve_duration;
> > > +	enum catpt_audio_curve_type curve_type __aligned(4);
> > > +} __packed;
> > How this __packed changes anything? In general __packed doesn't make sense for
> > in-kernel data structures. Otherwise you have to use proper (POD) types for
> > data. Ditto for all similar cases.
> 
> All of __packed use in code is done on structures used to communicate with
> FW, which is binary interface, so it is not kernel only structure, as it is
> also FW one. While we can expect compiler to do the right thing, I consider
> it is better to be explicit about what kind of data we are handling, so
> there aren't any surprises.

Size of enum is compiler defined. It may not be used in the ABIs.

__uXX vs. uXX I dunno.

-- 
With Best Regards,
Andy Shevchenko


