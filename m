Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4C3B148F58
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Jan 2020 21:28:23 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5D9A8166F;
	Fri, 24 Jan 2020 21:27:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5D9A8166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579897703;
	bh=W5TNyMYxkYa0j0EDeUjh1BB87ZIeNL+fh+bm0fxB1e0=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VbQj0mG/7649FIjw2zM/0Ro32LSatwJzHaZK2yVWcvUtTPQA/uEMbHP+sscIUvNjL
	 B6TM9IxJy+0b2HW75NkKr7mhhDOBGNhanMGOdR2Ipre0ft/62d4D6fCDZNV2BBrQtw
	 c1D8AiAw9BsBOKKeXmvmuehf3O0j7vzqvyWfjeaw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 96F00F8028E;
	Fri, 24 Jan 2020 21:24:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B2661F801D8; Fri, 24 Jan 2020 21:24:18 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7F12BF8020C
 for <alsa-devel@alsa-project.org>; Fri, 24 Jan 2020 21:24:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7F12BF8020C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Jan 2020 12:24:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,358,1574150400"; d="scan'208";a="400759951"
Received: from iifeduba-mobl1.amr.corp.intel.com (HELO [10.254.110.26])
 ([10.254.110.26])
 by orsmga005.jf.intel.com with ESMTP; 24 Jan 2020 12:24:07 -0800
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200124190413.18154-1-cezary.rojewski@intel.com>
 <20200124190413.18154-9-cezary.rojewski@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <88fbdc86-01ce-eb44-5523-fc989c0556fe@linux.intel.com>
Date: Fri, 24 Jan 2020 13:41:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200124190413.18154-9-cezary.rojewski@intel.com>
Content-Language: en-US
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>, broonie@kernel.org,
 tiwai@suse.com, lgirdwood@gmail.com
Subject: Re: [alsa-devel] [PATCH 08/12] ASoC: SOF: Generic probe compress
	operations
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


> +config SND_SOC_SOF_DEBUG_PROBES
> +	bool "SOF enable data probing"
> +	select SND_SOC_COMPRESS
> +	help
> +	  This option enables the data probing feature that can be used to
> +	  gather data directly from specific points of the audio pipeline.
> +	  Say Y if you want to enable probes.
> +	  If unsure, select "N".
> +
>   endif ## SND_SOC_SOF_DEBUG
>   
>   endif ## SND_SOC_SOF_DEVELOPER_SUPPORT

This one is interesting.

Do we want to limit the PROBES to developers? Or do we want to enable 
probes on production firmware as well - which could be really useful for 
people tuning stuff on platform using production keys, i.e. without the 
ability to re-generate the firmware on their own.

And if the firmware does not include support for probes, we should 
detect it and I didn't see anything in this series that checks this 
capability? And if the firmware does not report it then it's a miss in 
the design.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
