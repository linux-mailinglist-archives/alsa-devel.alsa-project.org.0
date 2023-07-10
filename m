Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C00874F0DC
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:57:39 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BDADFEC7;
	Tue, 11 Jul 2023 15:56:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BDADFEC7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083857;
	bh=hcRhvsNpzCZm3Sd7nNPgrDaCtucecy1QPHYWw64ui6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=QEe565vpvhMAVlOmKJUPPl9WpbMnfzaWAfchvloTPNLF+PZ6lvq03PoXZX4UFWYhG
	 bacb48ag0wWscSCrYnTzeEDVl+k1Fl/dol8MMJ1ceJTXwLFXAp96wXvG0yrB81Bx0N
	 ljr4XCsHvTFfXr45f/vpog7Ov9xHF+e4A4XphiI4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2558BF80652; Tue, 11 Jul 2023 15:52:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 90A4FF80651;
	Tue, 11 Jul 2023 15:52:34 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3E911F80249; Mon, 10 Jul 2023 18:13:30 +0200 (CEST)
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
	by alsa1.perex.cz (Postfix) with ESMTPS id 57C57F80093
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 18:13:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 57C57F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IQIraLTl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689005608; x=1720541608;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hcRhvsNpzCZm3Sd7nNPgrDaCtucecy1QPHYWw64ui6o=;
  b=IQIraLTle+CkQlHMziD8HF2ehHRbFClXprWdyy+DFOq85WWow1tW1e3z
   y6g3U3Xci84LH80KmXrJTpqWocfXfMLunIMQcOGl4vYsbYwcbmGDYyhND
   kE909BJoifITpYpumFH08XcskgBmlyIDKWpcAcHepa71wa5nKLWu5BlMJ
   OtS2Yf0BA8HZ5EHjsQTCOHru9yLvMZfBmy7/9X+3HoTFI8c1EPckVbCh0
   L0IhimJGYYcnLmgIUqdBjlN//H8h9uCeOkBtbW884mYlr0/03duUYGmN8
   UIUBwg9FY21hrpyUkZI1O/uY7ialF3XTyVERACqcwI5ldHa00gODf7lRi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="354244105"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="354244105"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 09:12:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="790844445"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="790844445"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 10 Jul 2023 09:12:26 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qItUs-001bGm-39;
	Mon, 10 Jul 2023 19:12:22 +0300
Date: Mon, 10 Jul 2023 19:12:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
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
	Richard Cochran <richardcochran@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Andy Gross <agross@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sanjay R Mehta <sanju.mehta@amd.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH v2 09/15] spi: Use struct_size() helper
Message-ID: <ZKwt5utuGaCf5nmT@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-10-andriy.shevchenko@linux.intel.com>
 <20230710-doze-scared-9f0a2e1a9125-mkl@pengutronix.de>
 <ZKwtgwZtUUHGC+S3@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZKwtgwZtUUHGC+S3@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: A3TDHM5BNRMJDPZ6ZH465722MDIKEPDU
X-Message-ID-Hash: A3TDHM5BNRMJDPZ6ZH465722MDIKEPDU
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:52:26 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/A3TDHM5BNRMJDPZ6ZH465722MDIKEPDU/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 10, 2023 at 07:10:43PM +0300, Andy Shevchenko wrote:
> On Mon, Jul 10, 2023 at 05:59:55PM +0200, Marc Kleine-Budde wrote:
> > On 10.07.2023 18:49:26, Andy Shevchenko wrote:

...

> > > +	struct spi_transfer	t[];
> > 
> > You might want to use the DECLARE_FLEX_ARRAY helper here.
> 
> Technically, yes, semantically documentation [1] disagrees with

"and [2]"

> you, so I leave it as is.
> 
> [1]: Documentation/process/deprecated.rst:269

[2]: Documentation/process/deprecated.rst:350

-- 
With Best Regards,
Andy Shevchenko


