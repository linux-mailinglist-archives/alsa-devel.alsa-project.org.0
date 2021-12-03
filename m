Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id DAECF467B5B
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Dec 2021 17:28:20 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 70FC62152;
	Fri,  3 Dec 2021 17:27:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 70FC62152
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638548900;
	bh=zUZYjG5vELPQIez9lN5coKE5YtQNmsF21QWIPma6T1k=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NhtejjqvXJx8CJ7h6doPB520qgsi+t/Q9/20IyIYhuBGYecOhUJZQw7r84LNYQ7Qc
	 eI3K12ZGHjQ2LLYTFj6y6TRbrbRZ49r7YeZUrsWzLePADmGjx7Pu0yDNSip1WmKYyQ
	 8/2kmXuCKpP0rsJ4dSXx9kcXeetMNggRXH9lwgtM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CDD5BF80249;
	Fri,  3 Dec 2021 17:27:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A895AF80246; Fri,  3 Dec 2021 17:27:01 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8D462F800A7
 for <alsa-devel@alsa-project.org>; Fri,  3 Dec 2021 17:26:54 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D462F800A7
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="223877050"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="223877050"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 08:26:52 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="678146833"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 08:26:50 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mtBNb-001pDg-LZ; Fri, 03 Dec 2021 18:25:47 +0200
Date: Fri, 3 Dec 2021 18:25:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
Subject: Re: [PATCH v1 1/2] ASoC: ti: davinci-mcasp: Get rid of duplicate
 of_node assignment
Message-ID: <YapFC9ksQmGy6llL@smile.fi.intel.com>
References: <20211202205612.76216-1-andriy.shevchenko@linux.intel.com>
 <1a2831d2-49bb-f1fc-14e8-d6a0d53664cf@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a2831d2-49bb-f1fc-14e8-d6a0d53664cf@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Peter Ujfalusi <peter.ujfalusi@ti.com>, Mark Brown <broonie@kernel.org>
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

On Fri, Dec 03, 2021 at 04:45:31PM +0200, Péter Ujfalusi wrote:
> On 02/12/2021 22:56, Andy Shevchenko wrote:
> > GPIO library does copy the of_node from the parent device of
> > the GPIO chip, there is no need to repeat this in the individual
> > drivers. Remove assignment here.
> 
> Thanks, looks good,
> Acked-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>

Thanks!

> > For the details one may look into the of_gpio_dev_init() implementation.
> 
> Which works after commit 1df62542e0161.

Actually even before that.

-- 
With Best Regards,
Andy Shevchenko


