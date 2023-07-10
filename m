Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F24CD74D452
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 13:12:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 296EF84B;
	Mon, 10 Jul 2023 13:11:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 296EF84B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688987523;
	bh=anBTsvynQ8qUvIELsfh79T1xhkkDcClo5RxqNLeYaSA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=AEH4YJBfQrRbTSn5ltW7XtEMhrfy6nIUKALy34/PAsMHs7sVqeTM6fZivyTFwQ9lw
	 610u6mJ8f2yMD1RxS9eMs03hZv4q+I1dgUhQA2czRyFwK08UWq29B3Gmv3PVGNEe8Y
	 MVLxs6zDdPXsAyEbnSXAkXWukBAGHLvrUUZN/XMI=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B13E8F80290; Mon, 10 Jul 2023 13:11:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 12900F80249;
	Mon, 10 Jul 2023 13:11:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5E282F8024E; Mon, 10 Jul 2023 13:11:09 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D1F8BF80153
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 13:11:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1F8BF80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=OpHtfqpp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688987468; x=1720523468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=anBTsvynQ8qUvIELsfh79T1xhkkDcClo5RxqNLeYaSA=;
  b=OpHtfqppgoBAGWxc1LvBp1vDV64JBJwK2C0LvK9yhmgniySBNx3/r0DO
   JhnBPHpMZ7itNXxsfR1njNQM3kb5FoZWcsUaKBVSb4kT9g/QSdJQ4qyrv
   RNmWyAJKjW2CHjixcHYJbDJjNQkMrhL6h8c4nWySXVwLvEJVDcg6Y0sJh
   vYV1F/YcmT8BHUyd3ZzahJ4foA6XlGoT4AQWSRD/GtK//FPMgFRHspb32
   X//OaoxyarSvsCHhwGTUAjo5XHG6W5wrMzmJKTbXBsS0EHaAFy6wL2OIj
   5EVy5ED82E7pHhVbJW/s1HBSg3PikSwsGmAWMwNF2twt6bNkFq/BAa+Fv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="343908971"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="343908971"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 04:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="720664309"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="720664309"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 10 Jul 2023 04:10:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qIon7-001XKM-1M;
	Mon, 10 Jul 2023 14:10:53 +0300
Date: Mon, 10 Jul 2023 14:10:53 +0300
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
Message-ID: <ZKvnPXl9H+cQR8Ok@smile.fi.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: GI3HAOR4QRDERGWNORCLYSPDXWGWMB5D
X-Message-ID-Hash: GI3HAOR4QRDERGWNORCLYSPDXWGWMB5D
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GI3HAOR4QRDERGWNORCLYSPDXWGWMB5D/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 10, 2023 at 02:08:00PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 10, 2023 at 12:04:35PM +0100, Mark Brown wrote:
> > On Mon, Jul 10, 2023 at 01:27:47PM +0300, Andy Shevchenko wrote:
> > 
> > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > and kill the not used anymore definitions.
> > 
> > The above is not what this change does:
> 
> How to improve it? I was sure that the form of "converting to something and
> something" is clear...

A wild guess, maybe you meant to split to two changes, one per each macro group?

> > > -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;

-- 
With Best Regards,
Andy Shevchenko


