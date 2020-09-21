Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E818A273237
	for <lists+alsa-devel@lfdr.de>; Mon, 21 Sep 2020 20:50:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5E40916C9;
	Mon, 21 Sep 2020 20:49:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5E40916C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600714209;
	bh=5/OcpLtMrBTLSop2H/5Iuz7WmaNFECLDOS88dt7JneE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WU4xgfo22VXxg3P0ChG7Nrb9KmR9EhFLKJUNycJsh9StW9C+YBYqHvZHFsuyWBqwZ
	 QgOfTdfNnruN3e4SSGA4GVS6lJI5V5AZ0WYVhk4itiNJ3yQ7ppq0HhzN9OXBOVHQZY
	 6r7sAV3swhYHru0Hcythr1dGcTen5EAxmOWI7Oko=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7CA67F8010A;
	Mon, 21 Sep 2020 20:48:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1A792F80162; Mon, 21 Sep 2020 20:48:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0B325F8010A
 for <alsa-devel@alsa-project.org>; Mon, 21 Sep 2020 20:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0B325F8010A
IronPort-SDR: sWhKrvCFs1wWXojbM4acUdX3iPq4Tegmh3Sp1tJvV2OvLtTIyrnB7N6D7qEsYfU9qlXXclHPsG
 nRibRX0UVR4A==
X-IronPort-AV: E=McAfee;i="6000,8403,9751"; a="148115266"
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="148115266"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 11:48:10 -0700
IronPort-SDR: NCv+m0Pf3v+ljDqVPT83Px1ulIFoltORHnUO45zW9ynyKX0EAS+npFSSEy58Sh2qdzTQjyGEho
 o/awl5nEJaKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,287,1596524400"; d="scan'208";a="338029170"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 21 Sep 2020 11:48:05 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kKQkj-000skc-F8; Mon, 21 Sep 2020 21:41:29 +0300
Date: Mon, 21 Sep 2020 21:41:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH v7 03/14] ASoC: Intel: catpt: Add IPC message handlers
Message-ID: <20200921184129.GH3956970@smile.fi.intel.com>
References: <20200921115424.4105-1-cezary.rojewski@intel.com>
 <20200921115424.4105-4-cezary.rojewski@intel.com>
 <20200921125934.GT3956970@smile.fi.intel.com>
 <55266617b42843839fb85309d3097fd6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55266617b42843839fb85309d3097fd6@intel.com>
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
 Krzysztof" <krzysztof.hejmowski@intel.com>, "Papierkowski,
 Piotr \(Habana\)" <ppapierkowski@habana.ai>, "Gopal,
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

On Mon, Sep 21, 2020 at 06:13:59PM +0000, Rojewski, Cezary wrote:
> On 2020-09-21 2:59 PM, Andy Shevchenko wrote:
> > On Mon, Sep 21, 2020 at 01:54:13PM +0200, Cezary Rojewski wrote:

...

> >> +	for (i = j = 0; i < FW_INFO_SIZE_MAX; i++)
> >> +		if (cdev->ipc.config.fw_info[i] == ' ')
> >> +			if (++j == 4)
> >> +				break;
> > 
> >> +	for (j = ++i; j < FW_INFO_SIZE_MAX && j - i < 20; j++) {
> > 
> > This should have static_assert() at the place where you define both constants
> > (2nd is mentioned above 20).
> > 
> >> +		if (cdev->ipc.config.fw_info[j] == ' ')
> >> +			break;
> >> +		*(pos + j - i) = cdev->ipc.config.fw_info[j];
> >> +	}
> >> +	pos += 20;
> > 
> > These two for-loops should have some comment to explain what's going on.
> > 
> 
> Actually, after poking my FW friends again I realized that it's just
> dumping 20chars from "hash" segment of fw_info (struct catpt_fw_ready,
> field: fw_info[]).
> 
> So, this could be replaced by:
> 

> 	/* navigate to fifth info segment (fw hash) */
> 	for (i = j = 0; i < FW_INFO_SIZE_MAX; i++)
> 		/* info segments are separated by space each */
> 		if (cdev->ipc.config.fw_info[i] == ' ')
> 			if (++j == 4)
> 				break;

...and this is repeating strnchr() / strnchrnul().

With the questions "what if...":
 - nul in the middle of this?
 - less than 4 spaces found?

> 	memcpy(pos, &cdev->ipc.config.fw_info[++i], CATPT_DUMP_HASH_SIZE);
> 	pos += CATPT_DUMP_HASH_SIZE;
> 
> 
> Existing for-loops were based on internal solution. Half of the code
> isn't needed afterall..

-- 
With Best Regards,
Andy Shevchenko


