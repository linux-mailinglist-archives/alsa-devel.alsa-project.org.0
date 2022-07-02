Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA3F564327
	for <lists+alsa-devel@lfdr.de>; Sun,  3 Jul 2022 00:47:05 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 440BE1673;
	Sun,  3 Jul 2022 00:46:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 440BE1673
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1656802025;
	bh=EHPFiSOBoXpWqoj2nriA2KCGhR11TUndu2UF+4ZjQ3g=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Fhxo7hGtc53fZeD/sq2K4upH34EOzDQ1CmqfBxey5JDt7xl2McsYy1rEhwkd4RU11
	 rVQmIvL2AlLM9+LnUG5fFFwjENFMA175N2+6haYVd46gOngCV0r/1XAo9DydBkciAX
	 uFwlFOt8Ksqeo7Xh5SzucD1ubS0vahJIN1XyUCgI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AAA0DF800CC;
	Sun,  3 Jul 2022 00:46:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EFDDFF8032D; Sun,  3 Jul 2022 00:46:03 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12515F800CC
 for <alsa-devel@alsa-project.org>; Sun,  3 Jul 2022 00:45:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12515F800CC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="mqAAJ7oV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656801961; x=1688337961;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=EHPFiSOBoXpWqoj2nriA2KCGhR11TUndu2UF+4ZjQ3g=;
 b=mqAAJ7oV6oXh/xSd+S1qvg04i5W4OGinS2wxl/Fh4HLaZhXpDoZX+c3m
 pNFdxMlwWIBYx4hqfW5BAuxPYsDeUAb7ht2klqI2GKoSlvJXiaY9TE5VU
 TOZITz/y/plssY7MSDUH3qpOAu9HnuV3sIzrlfkPs8bs3kyKbth/WM44Q
 q8eJUFOqmrtCXs4cFrrnq8gsBIUS3P8BuobPA8+pVC+b7D8eS/JdhySCP
 hH38+Z4IPT3jW2toNiOLvJLue4gT3eZQlOYlsS6jjmtyB0visBhDcevrJ
 NAA6GMKf2eZUNAUd7Lyg3EGeToRMIATnmBeVK35FCHC0xVAZPcoT+tWiO g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10396"; a="308406920"
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; d="scan'208";a="308406920"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2022 15:45:57 -0700
X-IronPort-AV: E=Sophos;i="5.92,241,1650956400"; d="scan'208";a="659789341"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2022 15:45:54 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1o7ls7-0013zv-1D; Sun, 03 Jul 2022 01:45:51 +0300
Date: Sun, 3 Jul 2022 01:45:51 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] ASoC: Intel: catpt: remove duplicating driver
 data retrieval
Message-ID: <YsDKnw7Crs8sP9MN@smile.fi.intel.com>
References: <20220702223243.51364-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220702223243.51364-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>
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

On Sun, Jul 03, 2022 at 01:32:43AM +0300, Andy Shevchenko wrote:
> device_get_match_data() in ACPI case calls similar to acpi_match_device() API.
> Hence there is no need to duplicate the call. Just check what the former
> returns.

This patch is wrong and it's late here, and I'm blind. Sorry for the noise.

-- 
With Best Regards,
Andy Shevchenko


