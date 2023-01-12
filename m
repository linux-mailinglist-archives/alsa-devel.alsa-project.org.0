Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B7A6670D1
	for <lists+alsa-devel@lfdr.de>; Thu, 12 Jan 2023 12:25:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D67FD8B0A;
	Thu, 12 Jan 2023 12:24:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D67FD8B0A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673522717;
	bh=j1AKaJWXiYCekS8GbE9LC/wsL+PQo29nYc0+r3HZLg8=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mPZv6/ln/Qjv1TOOQdFGvYumjytXM8+XkMTwbmV4ZOyikYwCUPP1vgEfE0p7todQa
	 dsnXWPk/BDWL63t/CmUWeDXQzydw+xGEdUh4XrKvevxZ4PCuPnk72OrPjQ4zGbGqWf
	 vQlB7lgzs/nU7zZKrDMg+ZM7/6XhRlcXsXFQHwvA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 69750F804DC;
	Thu, 12 Jan 2023 12:24:25 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EDE9BF804DD; Thu, 12 Jan 2023 12:24:22 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E59AEF804D9
 for <alsa-devel@alsa-project.org>; Thu, 12 Jan 2023 12:24:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E59AEF804D9
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K+OgqGR0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673522662; x=1705058662;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=j1AKaJWXiYCekS8GbE9LC/wsL+PQo29nYc0+r3HZLg8=;
 b=K+OgqGR0ysCeqd9u2yEnxJJ/sGs/QO8qMNU/BJt3RjUoIjGnt2Fqh2KV
 UQ6DL7/xco6Z4e89AyTR+Vr75sIYz0dkWVXuCThNYjvDrgheYuTvrauFU
 3kiW4Ox8o580pYKuxk9baIs1hfESnx4qkyCvfqk0EErFsuqIVfJ8e43x7
 pifVh6SVn1FHttf5JdE8oip7Fpt9a5RxDH7i8LgG7igsaOtsnmeh7e8GO
 858rMJxopHD/r7fm+YX+LnFc4EfWHnqlX57Zxwjtx2QQv8ffSL2/emOZV
 JqMh/56Sjh+RoQ/SJk9BobZEifQmsp1TwiztOK5tv1Oaa2R5t7nNuRmB3 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="304057705"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="304057705"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 03:24:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="800169380"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="800169380"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga001.fm.intel.com with ESMTP; 12 Jan 2023 03:24:11 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1pFvgn-0081Bx-25; Thu, 12 Jan 2023 13:24:09 +0200
Date: Thu, 12 Jan 2023 13:24:09 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Mukunda,Vijendar" <vijendar.mukunda@amd.com>
Subject: Re: [PATCH v1 1/6] ASoC: amd: acp-es8336: Drop reference count of
 ACPI device after use
Message-ID: <Y7/t2Sw+PFkv8seP@smile.fi.intel.com>
References: <20230102203014.16041-1-andriy.shevchenko@linux.intel.com>
 <6d3380db-5e21-a3e5-b1c2-8618819d1cb2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6d3380db-5e21-a3e5-b1c2-8618819d1cb2@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Bard Liao <yung-chuan.liao@linux.intel.com>, linux-kernel@vger.kernel.org,
 Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Wed, Jan 11, 2023 at 08:35:41AM +0530, Mukunda,Vijendar wrote:
> On 03/01/23 02:00, Andy Shevchenko wrote:
> > Theoretically the device might gone if its reference count drops to 0.
> > This might be the case when we try to find the first physical node of
> > the ACPI device. We need to keep reference to it until we get a result
> > of the above mentioned call. Refactor the code to drop the reference
> > count at the correct place.
> >
> > While at it, move to acpi_dev_put() as symmetrical call to the
> > acpi_dev_get_first_match_dev().
> >
> > Fixes: 02527c3f2300 ("ASoC: amd: add Machine driver for Jadeite platform")
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Acked-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>

Thank you and HNY!

I have split this patch separately and sent as v2.

-- 
With Best Regards,
Andy Shevchenko


