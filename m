Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F53750943
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 15:10:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ED7463E7;
	Wed, 12 Jul 2023 15:10:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ED7463E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689167452;
	bh=WtKHEzd9TLb1fy9g0AvI3P/4wH5wHUCXn6+ARbR9U1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=TsP2/lga4NEWF0Yrd/MUcmbtFzXqaQNjvmErC6AVoSZRvXWVujpy+/hGcsVBh2oig
	 t5XclOjW1YC1G6paVFyHu2AshXG9O/34+DzU5/wrEez5jN1TH1iAlVBqiRo9JXuE3d
	 Jcm+l3W2GWNz+3R+/oSYuD87FkYL1IrOq/O67dEw=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id E09C5F80544; Wed, 12 Jul 2023 15:10:00 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 56145F80236;
	Wed, 12 Jul 2023 15:10:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C9A3F80249; Tue, 11 Jul 2023 17:30:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A27BCF800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 17:30:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A27BCF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=csPvXIEV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689089428; x=1720625428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WtKHEzd9TLb1fy9g0AvI3P/4wH5wHUCXn6+ARbR9U1s=;
  b=csPvXIEVpkHxaUjuX5PXJZBwmNUVdDBFTrNjxBtnGJbsI8Mr8MI8REcd
   tffOI9lCu2t29eG+kGwfYwrVhwBWLCad8OiP9o5SvQvgYt4RdW4stbpCY
   eiJWyo3X8Za9QnmqoR1JQQxFfVIyS5UizKa9hwclwqAALdOVUloj2GXbl
   VIslFXpoWcNHsr7U9eA4Zz52XcrcVZiEjr9DsLrGR2BmkisDJfbGecsek
   Ho/mY9tC0T2Jqh081OBcmcz6UE74RcFSEMeWHbDf6EgN9JS5wygtBO4Av
   qeTCuhIsXzvfqQZSXnEYWytuyI8Nvh+Rac6oQDow1hgTvSe4AeVvqi+WJ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="428346803"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="428346803"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 08:30:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="698462660"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="698462660"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 11 Jul 2023 08:30:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJFJX-001swf-0G;
	Tue, 11 Jul 2023 18:30:07 +0300
Date: Tue, 11 Jul 2023 18:30:06 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
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
Subject: Re: [PATCH v2 04/15] spi: Replace open coded
 spi_controller_xfer_timeout()
Message-ID: <ZK11flZf/1grJ1Bd@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
 <cfaffa00-4b61-4d81-8675-70295844513b@sirena.org.uk>
 <ZK02efTYxV3czigr@smile.fi.intel.com>
 <5959b123-09e3-474b-9ab0-68d71cfdd9a2@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5959b123-09e3-474b-9ab0-68d71cfdd9a2@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: LIQRNBZE7EPHJGUCPDLKMOG577RULZH5
X-Message-ID-Hash: LIQRNBZE7EPHJGUCPDLKMOG577RULZH5
X-Mailman-Approved-At: Wed, 12 Jul 2023 13:09:55 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/LIQRNBZE7EPHJGUCPDLKMOG577RULZH5/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 03:14:54PM +0100, Mark Brown wrote:
> On Tue, Jul 11, 2023 at 02:01:13PM +0300, Andy Shevchenko wrote:
> > On Mon, Jul 10, 2023 at 06:30:32PM +0100, Mark Brown wrote:
> > > On Mon, Jul 10, 2023 at 06:49:21PM +0300, Andy Shevchenko wrote:
> 
> > > > + * Assume speed to be 100 kHz if it's not defined at the time of invocation.
> 
> > > You didn't mention this bit in the changelog, and I'm not 100% convinced
> > > it was the best idea in the first place.  It's going to result in some
> > > very big timeouts if it goes off, and we really should be doing
> > > validation much earlier in the process.
> 
> > Okay, let's drop this change.
> 
> Like I say we *should* be fine with the refactoring without this, or at
> least if it's an issue we should improve the validation.

For the speeds < 1000 Hz, this change will lead to the div by 0 crash.
It seems that the current code which this one removes is better than
the spi_controller_xfer_timeout() provides.

If anything, the spi_controller_xfer_timeout() should be improved first.
So, for now I drop this for sure. Maybe in the future we can come back
to it.

-- 
With Best Regards,
Andy Shevchenko


