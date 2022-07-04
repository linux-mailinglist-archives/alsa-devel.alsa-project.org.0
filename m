Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3AB565BB4
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 18:21:53 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 38737172D;
	Mon,  4 Jul 2022 18:21:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 38737172D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656951713;
	bh=xyXs9nOKE5kOELoI4oJbIuwpDppoegku8WgrxRZHARM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kTteTfes1YXK8gvoUFzhPY1nCid5hlO1O6BI5uecDPIFna/lc8FdU5zc5vV5Erdkd
	 cGs1IDm3oSdQ87ouDrsgeADwVShcxdE3xbf8DdY/VBYu3bbnEOsIn4drwDQ/QqvCNU
	 0SaX01eVasLF7doWlB9ZffALyQkLBj61PPtiEHsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CBDC3F8052E;
	Mon,  4 Jul 2022 18:21:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 97C65F802BE; Mon,  4 Jul 2022 18:21:00 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7A1D6F80139
 for <alsa-devel@alsa-project.org>; Mon,  4 Jul 2022 18:20:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7A1D6F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Ew93qqQc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656951658; x=1688487658;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xyXs9nOKE5kOELoI4oJbIuwpDppoegku8WgrxRZHARM=;
 b=Ew93qqQcJvctnNH6/54LBJs/0dMDWdgniVrvjuSms/JIsZnbQlPRBc8w
 CgfzL64JxHcIaMvNCL7EC6RNXPOYQbKcMegRuYHhLTqHzXPGfhklJ0J3W
 DTcofqL4MJbTrCnVjCuA15vtFOMa0zi46u6QhnkY+pZpmL6WO1IuR+MCT
 j5qJCmvvvRA+bXV4SdwFbtjxpWIuF8t3yTyrHb7pNVASCqIKjm4wTGHvI
 vlrtemrYzXzGuv7APS2MkTrfMnnppCJYERm4vCm/IAOoB5Z/sK9r1w840
 VVD82byR3JnVeBYKAAZDx/V64Q7gHpMW+VW0XMGz4hSKVUeewvIm/IGqA g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="347142144"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="347142144"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 09:20:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="649676565"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 09:20:48 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1o8OoX-0015Ad-1D; Mon, 04 Jul 2022 19:20:45 +0300
Date: Mon, 4 Jul 2022 19:20:45 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v2 1/1] ASoC: Intel: catpt: remove duplicating driver
 data retrieval
Message-ID: <YsMTXVYv/ks+nyqu@smile.fi.intel.com>
References: <20220703145152.62297-1-andriy.shevchenko@linux.intel.com>
 <9c67d656-9990-7206-58b4-3de25d8341a0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9c67d656-9990-7206-58b4-3de25d8341a0@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Mon, Jul 04, 2022 at 10:36:33AM +0300, Péter Ujfalusi wrote:
> On 03/07/2022 17:51, Andy Shevchenko wrote:

...

> We could just pass the "(const struct catpt_spec *)id->driver_data" in
> place of spec to catpt_dev_init() and we can get rid of the local
> temporary pointer?

I would not go this way for non-POD types.

> If not, then I would cast out the spec before it's use:
> spec = (const struct catpt_spec *)id->driver_data;
> catpt_dev_init(cdev, dev, spec);

This I can do (as well as in the other patch).

-- 
With Best Regards,
Andy Shevchenko


