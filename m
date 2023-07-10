Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3874474D7C1
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 15:33:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34C3F3E7;
	Mon, 10 Jul 2023 15:32:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34C3F3E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688996006;
	bh=PcgdfCqBIbPTu4JqQZu5q+HYQGpr7DWOm49hDVjk5i0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=hYfMXq1qh3kfNNwAW/bxlXE9Mqi4E8ChVOSQscUsZ8flGXa6drUIoG4+HvUPe7vyx
	 ikYfJ2OtSCb31dgoJPcdzIWDufs7hRmD1miAYI6+5sD57iqqrC/Vy/jnbQHRsWOCoH
	 kt7gq9gKsSKLHOXD+5J5i+cVWzrdW9zFpxlXpsvg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 45B2DF800D2; Mon, 10 Jul 2023 15:32:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D2A0FF80153;
	Mon, 10 Jul 2023 15:32:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 53BA6F80249; Mon, 10 Jul 2023 15:32:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 4242FF800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 15:32:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4242FF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=SMOtDTxm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688995946; x=1720531946;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PcgdfCqBIbPTu4JqQZu5q+HYQGpr7DWOm49hDVjk5i0=;
  b=SMOtDTxmFrGnPGK+C4+ACaN1MnhjrrFAoLx0boQW9xpoj99jJGujIhaf
   7A6IIzE6JR5AvoJ3rod88nlnuz+HTOtn+HEoDuDQUPJnuww8DGgERlPRN
   wvDueApCFU09OFCZo5bX/cSed72aK/8R3uaAeOsHVyc+rEMJXCxOglXi3
   Bpgc1eAJjjdpqCGPLyO/h6IBRoUDVmZ+k813qIIUMbVd1TeH29iStvdhJ
   GHXZ7d81d6Gpbj4QnR7XH5nyheKvd3RHhCyaI3fS6IQpvnHWY+5QDrKqk
   8a4EGiw2+BeodYa4UjZD9peZ5m6uMueiomX6rkebf5ZL4Yzz1K5bTiJ4t
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="428037972"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="428037972"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 06:32:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="790802176"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="790802176"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jul 2023 06:32:12 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qIqzq-001Z8L-0E;
	Mon, 10 Jul 2023 16:32:10 +0300
Date: Mon, 10 Jul 2023 16:32:09 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Kris Bahnsen <kris@embeddedts.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v1 4/8] spi: Get rid of old SPI_MASTER_NO_.X and
 SPI_MASTER_MUST_.X
Message-ID: <ZKwIWUeqD/otnSFM@smile.fi.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
 <ZKvnPXl9H+cQR8Ok@smile.fi.intel.com>
 <353027bf-6d2a-40de-9e18-8553864b343c@sirena.org.uk>
 <ZKv7p96D2B9vYd0J@smile.fi.intel.com>
 <7aff8759-cfca-47b5-b995-5260e5082c45@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7aff8759-cfca-47b5-b995-5260e5082c45@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: X6CBJ3RERKTKXFXU6UOW6XRMCZRGBNOI
X-Message-ID-Hash: X6CBJ3RERKTKXFXU6UOW6XRMCZRGBNOI
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X6CBJ3RERKTKXFXU6UOW6XRMCZRGBNOI/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 10, 2023 at 02:21:05PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 03:37:59PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 12:22:59PM +0100, Mark Brown wrote:
> > > On Mon, Jul 10, 2023 at 02:10:53PM +0300, Andy Shevchenko wrote:

...

> > > > > > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > > > > > and kill the not used anymore definitions.

...

> > > > > > > -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > > > > > +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;
> 
> > > What part of the above change is replacing _NO_ with _MUST_?
> 
> > None, that's why assuming the split by name should be fine.
> 
> That's what the above changelog sounds like it's trying to do (I'm not
> sure the change itself makes sense but the first thing I ran into when
> reviewing the patch), AFIACT you're missing a "from" in the changelog?

I see, I will elaborate better in v2.
But still, I will split on per macro and add one for GPIO_SS.
Seems to me better that way.

-- 
With Best Regards,
Andy Shevchenko


