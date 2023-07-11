Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6114474F236
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:27:26 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E5BD1F7A;
	Tue, 11 Jul 2023 16:26:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E5BD1F7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689085646;
	bh=nee+8F3UgjHiHBrgA29lPenNEyq01aBvrZNu0iQvTPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=COzdGUJstWNBkasSc0Q3MdNGI6S2nIQb9y4V8sYVeAbnwB3hW3PUa0XaA4AKs/i6n
	 CLQt3XiDsAUwGowAGLF2sVZyT1UxF/xKQdqd0MwjHnxwkVHghhFKjVWSDg9xa4GtrP
	 UUUbyRa5hiLelC0a+zcLadYF46SuMgLuRF3yfAYM=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id DFA90F8063D; Tue, 11 Jul 2023 16:22:14 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 455E6F8064C;
	Tue, 11 Jul 2023 16:22:14 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8145CF80249; Tue, 11 Jul 2023 14:48:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 53EE0F80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 14:48:17 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 53EE0F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=PiYkStTL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689079699; x=1720615699;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nee+8F3UgjHiHBrgA29lPenNEyq01aBvrZNu0iQvTPs=;
  b=PiYkStTLmpjUszCkofe/8NHGQCuT/+sliq/buzGSPZFNuSrj31R7EOtB
   1n4LvrtMcIQE464EwGNVbYUmeh0v4a9wE2rL6CLZKMstxahJA9DFGlY2F
   hPm7GodB/3ONtz4RHIRt0qfg38cwBs27t+HcOpYOL5d+sh6GeKtt7kMKg
   9xZIsVOSU6q0y2ULtAe/jIGs4gKXvGhnWRGpWaWP5j1WaMm7xEf0c+Ven
   iH1et3fhsL9Hz8fCerN/WoE5dGsyln332EuGcUA54JxyM6+dNJakfO0QL
   NHY0RsTt+5zgIvcksBEye6R+FDSMQlmKQJ7bsZDzMQ57+BUFW7e+/UB4h
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="430694933"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="430694933"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 05:48:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="967787376"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="967787376"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga006.fm.intel.com with ESMTP; 11 Jul 2023 05:48:00 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJCmb-001qkh-0z;
	Tue, 11 Jul 2023 15:47:57 +0300
Date: Tue, 11 Jul 2023 15:47:57 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Mark Brown <broonie@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Vijaya Krishna Nivarthi <quic_vnivarth@quicinc.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v2 05/15] spi: Remove code duplication in
 spi_add_device_locked()
Message-ID: <ZK1PfXsUJipjcCH6@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-6-andriy.shevchenko@linux.intel.com>
 <7557bada-3076-4d6e-a5c5-d368433706e2@sirena.org.uk>
 <ZK03rBqoQ0IZz617@smile.fi.intel.com>
 <20230711120133.45drgk46y4cz7aut@mercury.elektranox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230711120133.45drgk46y4cz7aut@mercury.elektranox.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: IMGWBF4OYGDAFGS3UROHXD4N3PUJ2JGS
X-Message-ID-Hash: IMGWBF4OYGDAFGS3UROHXD4N3PUJ2JGS
X-Mailman-Approved-At: Tue, 11 Jul 2023 14:22:03 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IMGWBF4OYGDAFGS3UROHXD4N3PUJ2JGS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 02:01:33PM +0200, Sebastian Reichel wrote:
> On Tue, Jul 11, 2023 at 02:06:20PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 06:16:22PM +0100, Mark Brown wrote:
> > > On Mon, Jul 10, 2023 at 06:49:22PM +0300, Andy Shevchenko wrote:

...

> > > > -	struct device *dev = ctlr->dev.parent;
> > > > -
> > > > -	/* Chipselects are numbered 0..max; validate. */
> > > > -	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
> > > > -		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
> > > > -			ctlr->num_chipselect);
> > > > -		return -EINVAL;
> > > > -	}
> > > > -
> > > > -	/* Set the bus ID string */
> > > > -	spi_dev_set_name(spi);
> > > 
> > > I see that this is duplicating spi_add_device() (and we really could do
> > > better with code sharing there I think) but I can't immediately see
> > > where the duplication that's intended to be elimiated is here - where
> > > else in the one call path that spi_add_device_locked() has would we do
> > > the above?  Based on the changelog I was expecting to see some
> > > duplicated code in the function itself.
> > 
> > Oh, by some reason Sebastian wasn't in this rather long Cc list.
> > Added him.
> > 
> > Reading again I don't see any useful explanation why that piece of code has to
> > be duplicated among these two functions. It's 100% a copy.
> > 
> > Sebastian, can you shed some light here?
> 
> The patch in this thread is obviously wrong. It results in the
> checks never beeing called for spi_add_device_locked(). The copy is
> in spi_add_device() and those two are not calling into each other.

Ah, now I see, I missed __ in the name.
Thank you for opening my eyes!

> But it should be fine to move the code to the start of
> __spi_add_device(), which allows removing the duplication. In that
> case the code will be run with the add_lock held, which is probably
> what I was worried about two years ago. Looking at it again, the
> lock is held anyways in case of spi_add_device_locked().

Right, I will re-do that.

-- 
With Best Regards,
Andy Shevchenko


