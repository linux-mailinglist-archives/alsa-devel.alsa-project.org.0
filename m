Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA7874F237
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:27:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 73786ED8;
	Tue, 11 Jul 2023 16:26:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 73786ED8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689085653;
	bh=OYszt38IqNikveaxxJtUvxsFTPNnv5LlXD+DX90BkWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j+vBNVn4EuPzjLlwNNOhSgcqyrXnhk00pZYMD39HxRLGCuq1B/DHMM51PFSaNBZ3d
	 LXzqesYqIO4zg2Tsm0MTzTC9RewCDq2P/413cXgzaOH+bIcLDZMU5w4haNILVufumk
	 vKrAQdmrxkBcILPgz8nXkY3TmZwPcZQ3TJOvmK1M=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9EA25F80236; Tue, 11 Jul 2023 16:22:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DDA43F8065A;
	Tue, 11 Jul 2023 16:22:16 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 0103CF80249; Tue, 11 Jul 2023 14:49:31 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 6D737F800E4
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 14:49:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6D737F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=W0dBbjqg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689079770; x=1720615770;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OYszt38IqNikveaxxJtUvxsFTPNnv5LlXD+DX90BkWs=;
  b=W0dBbjqg/cc9Ce7dnR4pg5AoceaN9CJDKLn7cWEjh/lmCsAP4+tSaj2I
   Nsq+oy6fzcM7LH/gNvuqIUCLYICB6tOAKFcCFkPPGxm3la1egSJPGm1qq
   NAvDciPmAVQbz0KXVuoBKQkG3F49oBoEBb7R2GesT0I5gG3JnOE0Kq+ie
   sRoD1M78KOBADHTOh+sTHwKgZnpGGsJnMKY87Ib9+Rf7EYBD5Q3DeRBU8
   fh79kDqPp1VPx9MRl5Cgpr6kCaXQdgHn8XmU9hbmR3IiTsBnLOSczT7Hc
   BddvnAST/xk2NTpnp4iK8PwVdwXJO5KZl7cGOv3a87fXOJ7VLB8TUfa/v
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="354470009"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="354470009"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 05:49:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="721078284"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="721078284"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 11 Jul 2023 05:49:08 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJCng-001qlR-32;
	Tue, 11 Jul 2023 15:49:04 +0300
Date: Tue, 11 Jul 2023 15:49:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Serge Semin <fancer.lancer@gmail.com>
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
Subject: Re: [PATCH v2 13/15] spi: Rename SPI_MASTER_GPIO_SS to
 SPI_CONTROLLER_GPIO_SS
Message-ID: <ZK1PwMAz8OjsHgsE@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-14-andriy.shevchenko@linux.intel.com>
 <tvm772o6uqndgyjvycv27qouqq76crpre5tyqcnanaautqjjwn@pydiwhjzhbgd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tvm772o6uqndgyjvycv27qouqq76crpre5tyqcnanaautqjjwn@pydiwhjzhbgd>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 6H2JQIRTJSMIU6WX4KFODMQH4UPLGDMK
X-Message-ID-Hash: 6H2JQIRTJSMIU6WX4KFODMQH4UPLGDMK
X-Mailman-Approved-At: Tue, 11 Jul 2023 14:22:03 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/6H2JQIRTJSMIU6WX4KFODMQH4UPLGDMK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Tue, Jul 11, 2023 at 03:30:19PM +0300, Serge Semin wrote:
> On Mon, Jul 10, 2023 at 06:49:30PM +0300, Andy Shevchenko wrote:
> > Rename SPI_MASTER_GPIO_SS to SPI_CONTROLLER_GPIO_SS and
> > convert the users to SPI_CONTROLLER_GPIO_SS to follow
> 
> * I'm not an expert in English, but imo the next would look a
> * bit more readable:
> * convert s/the users to SPI_CONTROLLER_GPIO_SS/the code to using SPI_CONTROLLER_GPIO_SS

> > the new naming shema.
> 
> s/shema/schema

Right, thank you!

...

> Reviewed-by: Serge Semin <fancer.lancer@gmail.com>

Thank you for the review!

-- 
With Best Regards,
Andy Shevchenko


