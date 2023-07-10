Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9E274D5D9
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 14:39:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1E467203;
	Mon, 10 Jul 2023 14:38:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1E467203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688992763;
	bh=2I7Ns5P9Fqk5itIQUPMwgPj6Db+DdMBwViqY3DgUc6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=nPH8Ib9Wf8e2Iiv7cix6DkPYhsgHPaznJujILd1JX24JLm2yCn2aLJdlzOqHE76d0
	 yeObtx7JrN3bICGjbrw3WBHxACkr856ercf3D2tlgF/YgP5K9U7lUnNJ2I2rAfXw7y
	 SK6uPOQHvvFlV3FJpOE1gHvT9HaPN+PsMu61DO/g=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 776A9F8027B; Mon, 10 Jul 2023 14:38:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 1CD3BF80153;
	Mon, 10 Jul 2023 14:38:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id F2FB5F80249; Mon, 10 Jul 2023 14:38:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id E154BF800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 14:38:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E154BF800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=B+4okRfM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688992697; x=1720528697;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2I7Ns5P9Fqk5itIQUPMwgPj6Db+DdMBwViqY3DgUc6U=;
  b=B+4okRfMay5cKaUdBt+YXEUfYbqaTA4Kasu+YT9xdGmni+KVM17qmUxL
   PnfFtglMyqBYqNL6iIEuj2rH5anMQrdEzzi1SZhtT5OCSqn9jyc/mxMyB
   UwtRgApnYc0mCFdK1HW4prul0fzeFMlMfMAiw7zJtPXYUjX9Tr/5CsoDj
   TcUZ/gCOdOLOdHe7YtsXA+/16lFc5n5G4KFDI+d5qcpw8BiyHUIMAl2qU
   wrLISuggLyOod80bm9px8ON9cpdW+hAZzfv0ct9P/BthW2d6XVDQH/sqf
   OX/11tcqVnx8m9a65xIUJ9Q1wmSExLJ9BFy8RCbojm/Lh4NC+ULaJDtDJ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="428025540"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="428025540"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 05:38:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10766"; a="755983743"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="755983743"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 10 Jul 2023 05:38:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qIq9Q-001YUr-0L;
	Mon, 10 Jul 2023 15:38:00 +0300
Date: Mon, 10 Jul 2023 15:37:59 +0300
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
Message-ID: <ZKv7p96D2B9vYd0J@smile.fi.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
 <20230710102751.83314-5-andriy.shevchenko@linux.intel.com>
 <1ffd5603-4140-4bf6-bfed-af70a6759bda@sirena.org.uk>
 <ZKvmkAP5ZuT6lGLN@smile.fi.intel.com>
 <ZKvnPXl9H+cQR8Ok@smile.fi.intel.com>
 <353027bf-6d2a-40de-9e18-8553864b343c@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <353027bf-6d2a-40de-9e18-8553864b343c@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: Z5K7LSNFISGXGWC7AQMVDR2N3TYWZQSF
X-Message-ID-Hash: Z5K7LSNFISGXGWC7AQMVDR2N3TYWZQSF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Z5K7LSNFISGXGWC7AQMVDR2N3TYWZQSF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 10, 2023 at 12:22:59PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 02:10:53PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 02:08:00PM +0300, Andy Shevchenko wrote:
> > > On Mon, Jul 10, 2023 at 12:04:35PM +0100, Mark Brown wrote:
> > > > On Mon, Jul 10, 2023 at 01:27:47PM +0300, Andy Shevchenko wrote:
> 
> > > > > Convert the users to SPI_CONTROLLER_NO_?X and SPI_CONTROLLER_MUST_.X
> > > > > and kill the not used anymore definitions.
> 
> > > > The above is not what this change does:
> 
> > > How to improve it? I was sure that the form of "converting to something and
> > > something" is clear...
> 
> > A wild guess, maybe you meant to split to two changes, one per each macro group?
> 
> No, doing TX and RX in one commit is fine.

No, I meant one per _NO_ and _MUST_.

> > > > > -	controller->flags = SPI_MASTER_MUST_RX | SPI_MASTER_MUST_TX;
> > > > > +	controller->flags = SPI_CONTROLLER_MUST_RX | SPI_CONTROLLER_MUST_TX;
> 
> What part of the above change is replacing _NO_ with _MUST_?

None, that's why assuming the split by name should be fine.

-- 
With Best Regards,
Andy Shevchenko


