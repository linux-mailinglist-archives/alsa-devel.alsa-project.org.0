Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5467C27BFF2
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Sep 2020 10:48:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 62B0A1868;
	Tue, 29 Sep 2020 10:47:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 62B0A1868
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601369325;
	bh=O0wIJZYDyTZAeRwHmJLYYXP8yMv4dIZw1aj81WqatOk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NgZSXSBEDY6kKO2WR1I4hcAwDy79dcZovYK8Me7LPTVKvYePoiGdyvQmOkxRUF4Gu
	 QFGeP9+9QB7DxVCR1sX4i1tHk9MKSixq0VjwPf5OLhZNksrsRFE4H2qBmUCm2el3Zs
	 KTIlz85MAVooiQJRMn3AP5FhMHjSF+/r/CmDLPVs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 802FAF8020C;
	Tue, 29 Sep 2020 10:47:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id F1574F801F5; Tue, 29 Sep 2020 10:47:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F3F46F800AB
 for <alsa-devel@alsa-project.org>; Tue, 29 Sep 2020 10:46:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F3F46F800AB
IronPort-SDR: xVSU7aU28vowglFBo5aPe4Iu+cvQWqvw8tPRZzFMe+YRbrDr0jXPu3pQnqtIyC9GnAm4hZKtVZ
 mi5ZAMgtPTmA==
X-IronPort-AV: E=McAfee;i="6000,8403,9758"; a="149921689"
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; d="scan'208";a="149921689"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 01:46:49 -0700
IronPort-SDR: RjHMgOgmvIbS5IUqfnoUspkw2O4cHXZ44owLOU5eEkwMytkNbmIas48Gc7f7ic4iFbt/ufZSOO
 r6MXRCosOeGQ==
X-IronPort-AV: E=Sophos;i="5.77,317,1596524400"; d="scan'208";a="513777912"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2020 01:46:31 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kNBHG-002kQm-3t; Tue, 29 Sep 2020 11:46:26 +0300
Date: Tue, 29 Sep 2020 11:46:26 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH v9 02/14] ASoC: Intel: catpt: Implement IPC protocol
Message-ID: <20200929084626.GY3956970@smile.fi.intel.com>
References: <20200926085910.21948-1-cezary.rojewski@intel.com>
 <20200926085910.21948-3-cezary.rojewski@intel.com>
 <20200928134424.GM3956970@smile.fi.intel.com>
 <407ca256d3884856b469ba65c0379d91@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <407ca256d3884856b469ba65c0379d91@intel.com>
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

On Mon, Sep 28, 2020 at 04:52:41PM +0000, Rojewski, Cezary wrote:
> On 2020-09-28 3:44 PM, Andy Shevchenko wrote:
> > On Sat, Sep 26, 2020 at 10:58:58AM +0200, Cezary Rojewski wrote:

...

> >> +	ret = ipc->rx.rsp.status;
> >> +	if (reply) {
> >> +		reply->header = ipc->rx.header;
> >> +		if (!ret && reply->data)
> >> +			memcpy(reply->data, ipc->rx.data, reply->size);
> >> +	}
> >> +
> >> +	return ret;
> > 
> > One more looking into this... What about
> > 
> > 	if (reply)
> > 		reply->header = ipc->rx.header;
> > 
> > 	ret = ipc->rx.rsp.status; // or even directly if (status) return status.
> > 	if (ret)
> > 		return ret;
> > 
> > 	if (reply->data)
> > 		memcpy(reply->data, ipc->rx.data, reply->size);
> > 
> > 	return 0;
> > 
> > It may be verbose but I think readability is better here.
> 
> In your example, last 'if' will cause exception if reply==NULL.

Yeah, should be reply && reply->data.

> Got your point, although that's just few lines which already involve
> 'if' with { } spacing. After removing size-checks you suggested this
> code is quite thin already.

Yes, sometimes too thin is not good in terms of readability.

...

> >> +	CATPT_CHANNEL_CONFIG_5_POINT_0	= 7, /* L, C, R, Ls & Rs */
> >> +	CATPT_CHANNEL_CONFIG_5_POINT_1	= 8, /* L, C, R, Ls, Rs & LFE */
> >> +	CATPT_CHANNEL_CONFIG_DUAL_MONO	= 9, /* One channel replicated in two */
> >> +	CATPT_CHANNEL_CONFIG_INVALID	= 10,
> > 
> > Hmm... I think I got the point why DUAL_MONO was at the end of the switch-case.
> > 
> 
> Well, well. Indeed we found where Willy is..

So, we may return to the previous state, up to you.

...

> >> +enum catpt_mclk_frequency {
> >> +	CATPT_MCLK_OFF = 0,
> >> +	CATPT_MCLK_FREQ_6_MHZ = 1,
> >> +	CATPT_MCLK_FREQ_21_MHZ = 2,
> >> +	CATPT_MCLK_FREQ_24_MHZ = 3,
> >> +};
> > 
> > Looks like a 3 MHz as base frequency with multiplicators 0, 2, 7, 8.
> 
> Naming based on FW enum type equivalent.

It was just an observation without any AR item :-)
If you really know the (hardware) background of these choices then perhaps
comment would be good to have.

...

> >> +#define CATPT_STREAM_MSG(msg_type) \
> >> +{ \
> >> +	.stream_msg_type = CATPT_STRM_##msg_type, \
> >> +	.global_msg_type = CATPT_GLB_STREAM_MESSAGE }
> >> +#define CATPT_STAGE_MSG(msg_type) \
> >> +{ \
> >> +	.stage_action = CATPT_STG_##msg_type, \
> >> +	.stream_msg_type = CATPT_STRM_STAGE_MESSAGE, \
> >> +	.global_msg_type = CATPT_GLB_STREAM_MESSAGE }
> > 
> > Hmm... This split is interesting. I would rather move } to a new line.
> > 
> 
> As basically everything in my code, style is based on existing example -
> usually stuff from ASoC core - here, it's include/sound/soc.h. It's full
> of such definitions so because catpt belongs to ASoC subsystem, I've
> used the exact same style. No problem changing if that's your preference.

I think it's better to follow the existing style across subsystem. You may
discard my (style related) comments if they contradict with used style.

-- 
With Best Regards,
Andy Shevchenko


