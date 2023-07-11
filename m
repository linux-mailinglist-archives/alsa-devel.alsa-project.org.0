Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A481674F22A
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:25:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CEC63ED7;
	Tue, 11 Jul 2023 16:24:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CEC63ED7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689085524;
	bh=g5docwgn1sedQFCIUNy5vO+RB2jnG5735hob/X5gUzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=OoJTYZRpfjfFZcEUCkDVHSIRTd83kVF2nzG06LJ8m92yWiDtS9DA+NCuxNEMp3vvN
	 p04sgBpIvD69dzVJuHvBeOZ9BzlEeGB6HUTw5l61qUGXWMioC6p6tZ7Q4o1GtNIIIl
	 QUJGGzHZO7d89m5k5j4pY/rMFBLqa90wGlxOemR0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 56AD1F805FA; Tue, 11 Jul 2023 16:21:54 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CD965F805F5;
	Tue, 11 Jul 2023 16:21:53 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D6822F80236; Tue, 11 Jul 2023 13:01:41 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6446FF800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 13:01:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6446FF800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gn+op04x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689073299; x=1720609299;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=g5docwgn1sedQFCIUNy5vO+RB2jnG5735hob/X5gUzk=;
  b=gn+op04xEtU/Y7R7NcC64GkAbjscdCuyYF2kgK9rjRPB3OVZsRs5oQsR
   l/Fmb0Qu1AUQE8DfKEfiOswZ5yjccMWyehu+IjdTtC/VTtmkSNU6sTfLZ
   t3AYX+NSZ7xOB+J6IGiMk8jKlErweRNuu4m98qwI/lt3xvzc/tAYprF9j
   t/+EENxX9dtY5g7QUk7j6iGZP7oSygtMguXVFEIyaiHL1WdldRXB32STN
   58GN3ROxXJ5XtNfq+Q5XFQSs15bE7MwAwjHGBeOQMWmCnh1qtNUZnu1cL
   Sw+JxA/Xn7qvm66tPV1nb4ilHllSZdjO8dBcM17IVWvXlFr5mRrmyK5aD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="368087972"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="368087972"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 04:01:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="715143826"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="715143826"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 11 Jul 2023 04:01:17 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJB7J-001p8E-30;
	Tue, 11 Jul 2023 14:01:13 +0300
Date: Tue, 11 Jul 2023 14:01:13 +0300
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
Message-ID: <ZK02efTYxV3czigr@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-5-andriy.shevchenko@linux.intel.com>
 <cfaffa00-4b61-4d81-8675-70295844513b@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cfaffa00-4b61-4d81-8675-70295844513b@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: I3APFRGDMVH73FIJT7PPK4HJGAP66ZU2
X-Message-ID-Hash: I3APFRGDMVH73FIJT7PPK4HJGAP66ZU2
X-Mailman-Approved-At: Tue, 11 Jul 2023 14:21:47 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/I3APFRGDMVH73FIJT7PPK4HJGAP66ZU2/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 10, 2023 at 06:30:32PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:21PM +0300, Andy Shevchenko wrote:
> 
> > Since the new spi_controller_xfer_timeout() helper appeared,
> > we may replace open coded variant in spi_transfer_wait().
> 
> > + * Assume speed to be 100 kHz if it's not defined at the time of invocation.
> > + *
> 
> You didn't mention this bit in the changelog, and I'm not 100% convinced
> it was the best idea in the first place.  It's going to result in some
> very big timeouts if it goes off, and we really should be doing
> validation much earlier in the process.

Okay, let's drop this change.

> > +	u32 speed_hz = xfer->speed_hz ?: 100000;
> 
> Not only the ternery operator, but the version without the second
> argument for extra clarity!

Elvis can be interpreted as "A _or_ B (if A is false/0)".
Some pieces related to SPI use Elvis already IIRC.

-- 
With Best Regards,
Andy Shevchenko


