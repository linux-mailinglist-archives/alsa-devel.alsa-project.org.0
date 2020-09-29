Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C89D727C296
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 12:45:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2713F18BE;
	Tue, 29 Sep 2020 12:44:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2713F18BE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601376332;
	bh=xS/KgcIRl1oBonjOGIO0g1KLCmbHCv4pk0WMaG59/xU=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=evXKNqqeL8DzdpVRxYvr9Q0fMQro0O/SyV3dcWgYLLajzYNdc6txq+QiA9YMmF+SZ
	 PyoymdY15foQcW6dxhk1SiZ6y3/7dPjsZI8IrTnnaCqY/mjHGH1azLDJI9QBqVjJMI
	 WIfz0WsJlgi+YdDnAG2KcTxWN/vlQmIeZIh2tM14=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 41A3EF800DD;
	Tue, 29 Sep 2020 12:43:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DCE7F801F5; Tue, 29 Sep 2020 12:43:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_PASS,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4D92CF800DD
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 12:43:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4D92CF800DD
IronPort-SDR: 5LRQlB1MUnU2VYTviMS8U9A+UBw7DwYO5ZLo/neLaBiQzxzN9rIOtQQ8omY3OfdMMFiI4+TaUs
 ZcQUHhbiAyrA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="141566447"
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="141566447"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 03:43:34 -0700
IronPort-SDR: YLSTTNBI3kvnaptvQ6+qY4CCGPZPlKNCnpEdRHi7N8XjLNBo2irC82zHukUX6ykFxdUGBtl5ax
 rY+k+MNYOsog==
X-IronPort-AV: E=Sophos;i="5.77,318,1596524400"; d="scan'208";a="312170004"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 03:43:30 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kND6S-002luR-Cb; Tue, 29 Sep 2020 13:43:24 +0300
Date: Tue, 29 Sep 2020 13:43:24 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH v9 02/14] ASoC: Intel: catpt: Implement IPC protocol
Message-ID: <20200929104324.GC3956970@smile.fi.intel.com>
References: <20200926085910.21948-1-cezary.rojewski@intel.com>
 <20200926085910.21948-3-cezary.rojewski@intel.com>
 <20200928134424.GM3956970@smile.fi.intel.com>
 <407ca256d3884856b469ba65c0379d91@intel.com>
 <20200929084626.GY3956970@smile.fi.intel.com>
 <39c11ae42aa84cd3b03e8cc376e57317@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39c11ae42aa84cd3b03e8cc376e57317@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: "pierre-louis.bossart@linux.intel.com"
 <pierre-louis.bossart@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>, "Kaczmarski,
 Filip" <filip.kaczmarski@intel.com>, "N,
 Harshapriya" <harshapriya.n@intel.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "Barlik,
 Marcin" <marcin.barlik@intel.com>, "zwisler@google.com" <zwisler@google.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>, "tiwai@suse.com" <tiwai@suse.com>,
 "Proborszcz, Filip" <filip.proborszcz@intel.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "amadeuszx.slawinski@linux.intel.com" <amadeuszx.slawinski@linux.intel.com>,
 "Wasko, Michal" <michal.wasko@intel.com>,
 "cujomalainey@chromium.org" <cujomalainey@chromium.org>, "Hejmowski,
 Krzysztof" <krzysztof.hejmowski@intel.com>,
 "ppapierkowski@habana.ai" <ppapierkowski@habana.ai>, "Gopal,
 Vamshi Krishna" <vamshi.krishna.gopal@intel.com>
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

On Tue, Sep 29, 2020 at 09:39:36AM +0000, Rojewski, Cezary wrote:
> On 2020-09-29 10:46 AM, Andy Shevchenko wrote:
> > On Mon, Sep 28, 2020 at 04:52:41PM +0000, Rojewski, Cezary wrote:
> >> On 2020-09-28 3:44 PM, Andy Shevchenko wrote:
> >>> On Sat, Sep 26, 2020 at 10:58:58AM +0200, Cezary Rojewski wrote:

...

> >>>> +	ret = ipc->rx.rsp.status;
> >>>> +	if (reply) {
> >>>> +		reply->header = ipc->rx.header;
> >>>> +		if (!ret && reply->data)
> >>>> +			memcpy(reply->data, ipc->rx.data, reply->size);
> >>>> +	}
> >>>> +
> >>>> +	return ret;
> >>>
> >>> One more looking into this... What about
> >>>
> >>> 	if (reply)
> >>> 		reply->header = ipc->rx.header;
> >>>
> >>> 	ret = ipc->rx.rsp.status; // or even directly if (status) return status.
> >>> 	if (ret)
> >>> 		return ret;
> >>>
> >>> 	if (reply->data)
> >>> 		memcpy(reply->data, ipc->rx.data, reply->size);
> >>>
> >>> 	return 0;
> >>>
> >>> It may be verbose but I think readability is better here.
> >>
> >> In your example, last 'if' will cause exception if reply==NULL.
> > 
> > Yeah, should be reply && reply->data.
> > 
> >> Got your point, although that's just few lines which already involve
> >> 'if' with { } spacing. After removing size-checks you suggested this
> >> code is quite thin already.
> > 
> > Yes, sometimes too thin is not good in terms of readability.
> > 
> 
> This will cost us additional check (2x reply==NULL instead of 1x). Maybe
> a newline between:
> 
> 	reply->header = ipc->rx.header;
> 
> 	if (!ret && reply->data)
> 		memcpy(reply->data, ipc->rx.data, reply->size);
> 
> suffices?

I don't like the !ret piece, TBH.
But I wouldn't object too much if you leave it as is. And double check for
reply at least makes it cleaner in my opinion than compressing in few lines.

...

> If there are no other concerns, either a quick spinoff (v10) or delay
> those readability improvements till series with resource_union() re-use?

I guess we may do v10 w/o waiting. Let me look at the last two patches I
haven't commented yet.

> While catpt is a big upgrade when compared to existing /haswell/
> (obviously) there are more fruits of this rewrite: house cleaning -
> follow-up series targeting /haswell/, /baytrail/ and /common/ of
> sound/soc/intel. Guess everyone would like to see those in 5.10.

Yes!

-- 
With Best Regards,
Andy Shevchenko


