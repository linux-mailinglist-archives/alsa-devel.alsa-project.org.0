Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EED1B565BA7
	for <lists+alsa-devel@lfdr.de>; Mon,  4 Jul 2022 18:21:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1997A1722;
	Mon,  4 Jul 2022 18:20:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1997A1722
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656951670;
	bh=aCKzmIiBu49W8RI8z/u3rSgsHu2N2nzoFiWnk255af4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tBqcbJGEYWB/bUSd3xn/bABQdKlj7SbF5fNeSJaNAPv4/45Jqvh0WYu0cLpUg/9bY
	 t7w0qvAU8m47cORXqJ/PJkrdO3/FvvLF8wvc49ISO3FeE5NoQEKmnIlTc2w0wwlicW
	 rfU81q2Muag5UNtRukdAZd+AJvphOSgbm+oiVuMo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AED29F80165;
	Mon,  4 Jul 2022 18:20:18 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A1E5F8014E; Mon,  4 Jul 2022 18:20:17 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7FCA7F80139;
 Mon,  4 Jul 2022 18:20:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7FCA7F80139
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="ixFJvGmp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656951615; x=1688487615;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=aCKzmIiBu49W8RI8z/u3rSgsHu2N2nzoFiWnk255af4=;
 b=ixFJvGmpoH37GpWeVl/hv3YT0EA4ORjs4lTHdEUiPo2YEFaIzj1cP00Y
 TiEdELJ9sE8DNZdZ3+EDmmqiMPBMo+hZ+s/nCGwG5KHnbrEmhaKDmYfcz
 CWifZ6dhqmnGYbm1sNkMBEjq9hPUmh1Zd4RiPpSXW3sdR7dkuZKAjX/tn
 uh+UCSt1knsa/NSNC5Q3dLKM6PATgILnIlLZSjxdDhX1pGf9iJxOjckkD
 1aNc8E3RTT5q1z3/+KhEo+WCy9aq1en0JIH2knFUZpYm3/KohXxDtWVc0
 V5ynBx3FPNBcL8j9lHIy6Pi12KluOL1t4jXuWiUgXAj6NFuIp+DIv7kHl g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10398"; a="283191982"
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="283191982"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 09:19:48 -0700
X-IronPort-AV: E=Sophos;i="5.92,243,1650956400"; d="scan'208";a="734878887"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2022 09:19:45 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1o8OnV-0015AU-35; Mon, 04 Jul 2022 19:19:41 +0300
Date: Mon, 4 Jul 2022 19:19:41 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
Subject: Re: [PATCH v1 1/1] ASoC: SOF: Intel: bdw: remove duplicating driver
 data retrieval
Message-ID: <YsMTHTcOWX4Q3W7f@smile.fi.intel.com>
References: <20220703143533.62173-1-andriy.shevchenko@linux.intel.com>
 <91f156ba-5d93-63d6-5fa0-86614bc370d3@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91f156ba-5d93-63d6-5fa0-86614bc370d3@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 sound-open-firmware@alsa-project.org
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

On Mon, Jul 04, 2022 at 10:31:48AM +0300, Péter Ujfalusi wrote:
> On 03/07/2022 17:35, Andy Shevchenko wrote:

...

> +	return sof_acpi_probe(pdev, (const struct sof_dev_desc *)id->driver_data);
>  }

> We don't use the desc in sof_broadwell_probe(), so we can just pass the id->driver_data

I prefer not to cast inside the function parameters when it's not about POD.

-- 
With Best Regards,
Andy Shevchenko


