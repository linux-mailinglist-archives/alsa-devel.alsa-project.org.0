Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EB76074F22E
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:25:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4D4B9EEA;
	Tue, 11 Jul 2023 16:25:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4D4B9EEA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689085555;
	bh=pnPOejrtBmciSuneX2GIuca/d8m7aJiJ68yCzAIAa8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=q3VG3mPF27pGKh0Upvxv05x44iamCpfnzvr9zQR8GXASVlsjeEGLBrfUO98XYPUJb
	 wMyuqAmF1EpyX5Y85UU3m5CkRZaUWAdoH1VbREdExhTFAKUKqv+DLz4S/ZJ8MNkAp7
	 /Ye1QQgVNk+dIqPXQ+nHq9nS6dF+fcjT9ZCzyzvc=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 72E21F8060D; Tue, 11 Jul 2023 16:22:01 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C41C3F8060B;
	Tue, 11 Jul 2023 16:22:00 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 735A7F80236; Tue, 11 Jul 2023 13:10:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 5CB01F80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 13:10:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5CB01F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=A4EDmKzZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689073823; x=1720609823;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pnPOejrtBmciSuneX2GIuca/d8m7aJiJ68yCzAIAa8Y=;
  b=A4EDmKzZe+xrgH16GDyEiKso/+66cyUM+qvWtfRtUWJdIeU4oxxZX7kO
   rCKfQ9xlL6om0o0oxaAE9a4fYXixaw5W32oOIJGdugg7HiWteA02js4yp
   FdPImtGPGwd8fnHcWX9t4ijI1UGFgZy0eTfuThDdWR/iEU7BMDMyNtGZz
   kj55+2eSgz0zB/XVe4n2SlQozvnL33h+6PcYKFoFG8eDgkbmbxpqABdgg
   k2YH4H3plI2kT+mxj9Lm3lErROZ6wqedDAB5iBZx+1aqEup6JyqBVsoor
   MLQhK4D9hhmmwH049UD9l7PkV2K0q242QiOfYclVwulyxadcl49dgl9R/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="344909470"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="344909470"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 04:10:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="834644461"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="834644461"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2023 04:10:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJBFs-001pGf-16;
	Tue, 11 Jul 2023 14:10:04 +0300
Date: Tue, 11 Jul 2023 14:10:04 +0300
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
Subject: Re: [PATCH v2 08/15] spi: Clean up headers
Message-ID: <ZK04jEIo9ovLzF0e@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-9-andriy.shevchenko@linux.intel.com>
 <da48f031-d93b-4a30-bad6-f80f58b35853@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da48f031-d93b-4a30-bad6-f80f58b35853@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: HLHY2MGN7JUSCIYWEDPHHDJMOTB7ZCDS
X-Message-ID-Hash: HLHY2MGN7JUSCIYWEDPHHDJMOTB7ZCDS
X-Mailman-Approved-At: Tue, 11 Jul 2023 14:21:48 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/HLHY2MGN7JUSCIYWEDPHHDJMOTB7ZCDS/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 09:26:46AM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:25PM +0300, Andy Shevchenko wrote:
> > There is a few things done:
> > - include only the headers we are direct user of
> > - when pointer is in use, provide a forward declaration
> > - add missing headers
> > - group generic headers and subsystem headers
> > - sort each group alphabetically
> 
> This breaks an x86 allmodconfig build:

Yeah, it was too brave to go. That's actually the answer why I left
mod_devicetable.h included. (However the mod_devicetable.h probably should
stay to be similar to i2c.h.

Let's postpone this one, but it's good to have the build report so we know
which drivers are missing GPIO header to be included.

-- 
With Best Regards,
Andy Shevchenko


