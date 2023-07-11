Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FC074F224
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:24:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1A489ED8;
	Tue, 11 Jul 2023 16:24:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1A489ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689085495;
	bh=lIHyBeHEaNenp9Q/l2JAcaQuyI3ymSNUAckdiFell2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=J0xNA6gCq56k1OvDNgP2/Xa2WZhnohcwrRUDdDCkSwzTwxO0AK1X2Mnf4+E3LQ3q6
	 sEdx4MjxVNgMCFfszxFBK5SVZ7ONQQUWRCK3KdeWuf4kzD2O/2WoSP5yvghVsUg20i
	 qo3ySgb2nQrTSC6ylTcLGUxM32l8RW+tU6gJ3Hw8=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 8423EF805E6; Tue, 11 Jul 2023 16:21:49 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id F20E5F805E2;
	Tue, 11 Jul 2023 16:21:48 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 08A04F80236; Tue, 11 Jul 2023 12:58:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
	shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29DD2F80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 12:58:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29DD2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=bIfsM5ct
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689073122; x=1720609122;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lIHyBeHEaNenp9Q/l2JAcaQuyI3ymSNUAckdiFell2M=;
  b=bIfsM5ct2T7MLRY1QZV+yGbgdUKQKPHL66vX+rsLqbSs1deUCt2BAmOe
   CGw1PxCOUY8lvyecKl/u0oOEGol9CeCTfcHPQDG3FXWR3OqkmVx7SBV4J
   DYPtQvgORJjPaSkI6KuTRe6H4l7/xmUS5XOGrEaEPqcYpFfWbtNfLvyln
   G1Ivx2HhebRCankwaJew5pfvxakYUmkRavCfS1tDQp5I7g83Kp1uPabOa
   XVhMGoxcRh6PZ24CGEy9yo+JbxLtJQKZ0i0N7n8YY97Y8Cy+AZWnHeLyr
   PQtpND1GJTo15Srn7JGNPD7ro/y/TbCPoDj6grjpdDVvhfLkrlxhXB1du
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="368087267"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="368087267"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:58:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="724404293"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="724404293"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 11 Jul 2023 03:58:16 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJB4O-001p51-1q;
	Tue, 11 Jul 2023 13:58:12 +0300
Date: Tue, 11 Jul 2023 13:58:12 +0300
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
Subject: Re: [PATCH v2 02/15] spi: Drop duplicate IDR allocation code in
 spi_register_controller()
Message-ID: <ZK01xAqLc8AGFDo/@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-3-andriy.shevchenko@linux.intel.com>
 <97f3436a-78ca-4a94-a409-ef04bd3b593f@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97f3436a-78ca-4a94-a409-ef04bd3b593f@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: GCGOAORGDZTDAECVIAYKXDOLF6IOXL7G
X-Message-ID-Hash: GCGOAORGDZTDAECVIAYKXDOLF6IOXL7G
X-Mailman-Approved-At: Tue, 11 Jul 2023 14:21:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/GCGOAORGDZTDAECVIAYKXDOLF6IOXL7G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 10, 2023 at 06:09:00PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:19PM +0300, Andy Shevchenko wrote:
> 
> > Refactor spi_register_controller() to drop duplicate IDR allocation.
> > Instead of if-else-if branching use two sequential if:s, which allows
> > to re-use the logic of IDR allocation in all cases.
> 
> For legibility this should have been split into a separate factoring out
> of the shared code and rewriting of the logic, that'd make it trivial to
> review.

Should I do that for v3?

> > -		mutex_lock(&board_lock);
> > -		id = idr_alloc(&spi_master_idr, ctlr, first_dynamic,
> > -			       0, GFP_KERNEL);
> > -		mutex_unlock(&board_lock);
> > -		if (WARN(id < 0, "couldn't get idr"))
> > -			return id;
> > -		ctlr->bus_num = id;
> > +		status = spi_controller_id_alloc(ctlr, first_dynamic, 0);
> > +		if (status)
> > +			return status;
> 
> The original does not do the remapping of return codes that the previous
> two copies do...

Yes, I had to mention this in the commit message that in my opinion this makes
no difference. With the dynamically allocated aliases the absence of the slot
has the same effect as in the other cases.

-- 
With Best Regards,
Andy Shevchenko


