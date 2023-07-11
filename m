Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 228B474F22D
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:25:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7F746F0D;
	Tue, 11 Jul 2023 16:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7F746F0D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689085544;
	bh=RVFLgj8cxsWZyvySjgaprTvsCfpSOgqQ4kC3+s/s1Fk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=tXCtj4RyYXM72zfXs+kVs4f+uclSRME80GYqbqZDQLCp5zVRVj6v81/h7gaSxw5hq
	 rm8dW+PnvNnwonxXoC/ZdWUpRSl9yTtqilIwm/9NWqNV62Tl7k0q/pMj5zVIy7mMFJ
	 97GGEjjIEvUNCxQn5Pqc9HEaylo4pJAhmnEv1f6I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 10EDAF805FC; Tue, 11 Jul 2023 16:21:58 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 18418F805FC;
	Tue, 11 Jul 2023 16:21:58 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E3D50F80236; Tue, 11 Jul 2023 13:06:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 7EDF3F800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 13:06:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7EDF3F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=FsRgayC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689073601; x=1720609601;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=RVFLgj8cxsWZyvySjgaprTvsCfpSOgqQ4kC3+s/s1Fk=;
  b=FsRgayC2WX2Mg0PRtIac6LfuLCQaoBMxNSC6BWYQYyD78/g8IAGMWFz8
   I4qSLnHZTs3UbrN22OwDj69WUCMZBrj029U76dYsfQmDh2681pq6CNz62
   Lsk2/qC4Ey7sjIrsbXjRiNmlrNb3IxJoGVvE49nQhZu4fUD4ohBorrHZq
   P12mJgwnfa5DEyxcZu243VGnass+idYbz/JJjJYOoOkoRJVK4tsE2VO0v
   TyFG3DuPCWjTn+D3pz9/LbnOEYZgx5Af/VxtS7VY869ZWsFpF+8i0t3m3
   vQUXhv0Xc0ev5jihV/3KwMPDP7smgo+id6o5kaSlznt6W8e99rBuRy8Sy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450950709"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="450950709"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 04:06:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="721057401"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="721057401"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 11 Jul 2023 04:06:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJBCG-001pDs-2n;
	Tue, 11 Jul 2023 14:06:20 +0300
Date: Tue, 11 Jul 2023 14:06:20 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
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
Message-ID: <ZK03rBqoQ0IZz617@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-6-andriy.shevchenko@linux.intel.com>
 <7557bada-3076-4d6e-a5c5-d368433706e2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7557bada-3076-4d6e-a5c5-d368433706e2@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: EFAGZ3FPS5VKH2RFVCJ3NBCCZUP24IYG
X-Message-ID-Hash: EFAGZ3FPS5VKH2RFVCJ3NBCCZUP24IYG
X-Mailman-Approved-At: Tue, 11 Jul 2023 14:21:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/EFAGZ3FPS5VKH2RFVCJ3NBCCZUP24IYG/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 10, 2023 at 06:16:22PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:22PM +0300, Andy Shevchenko wrote:
> > Seems by unknown reason, probably some kind of mis-rebase,
> > the commit 0c79378c0199 ("spi: add ancillary device support")
> > adds a dozen of duplicating lines of code. Drop them.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  drivers/spi/spi.c | 11 -----------
> >  1 file changed, 11 deletions(-)
> > 
> > diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
> > index c99ee4164f11..46cbda383228 100644
> > --- a/drivers/spi/spi.c
> > +++ b/drivers/spi/spi.c
> > @@ -712,17 +712,6 @@ EXPORT_SYMBOL_GPL(spi_add_device);
> >  static int spi_add_device_locked(struct spi_device *spi)
> >  {
> >  	struct spi_controller *ctlr = spi->controller;
> > -	struct device *dev = ctlr->dev.parent;
> > -
> > -	/* Chipselects are numbered 0..max; validate. */
> > -	if (spi_get_chipselect(spi, 0) >= ctlr->num_chipselect) {
> > -		dev_err(dev, "cs%d >= max %d\n", spi_get_chipselect(spi, 0),
> > -			ctlr->num_chipselect);
> > -		return -EINVAL;
> > -	}
> > -
> > -	/* Set the bus ID string */
> > -	spi_dev_set_name(spi);
> 
> I see that this is duplicating spi_add_device() (and we really could do
> better with code sharing there I think) but I can't immediately see
> where the duplication that's intended to be elimiated is here - where
> else in the one call path that spi_add_device_locked() has would we do
> the above?  Based on the changelog I was expecting to see some
> duplicated code in the function itself.

Oh, by some reason Sebastian wasn't in this rather long Cc list.
Added him.

Reading again I don't see any useful explanation why that piece of code has to
be duplicated among these two functions. It's 100% a copy.

Sebastian, can you shed some light here?

-- 
With Best Regards,
Andy Shevchenko


