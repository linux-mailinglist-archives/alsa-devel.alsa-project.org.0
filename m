Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B16574F229
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 16:25:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8112CED3;
	Tue, 11 Jul 2023 16:24:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8112CED3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689085514;
	bh=+zeFSMPLY2Z95wTb4g4rf/2HnStio6yWOtQ5rXla3Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UEogOptweyo+DlAToLi69mCfLm2twfOVdEwqGPAzS42VjHquqEoGimAnP2VCCRgu+
	 WYBNlgHKOP1JhRkRWw2Qu03TcLusUk19jkwWRwms729g/1O6kuGpO8iCktK6haWjiT
	 HAKtWngom7ZsV0L03RzvnlPhSOYEN/xqQ2HYRy7c=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 9651DF805EC; Tue, 11 Jul 2023 16:21:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 02971F805EC;
	Tue, 11 Jul 2023 16:21:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 057EEF80236; Tue, 11 Jul 2023 12:59:08 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8D9D2F80093
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 12:59:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8D9D2F80093
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=lf1kCD9q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689073145; x=1720609145;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+zeFSMPLY2Z95wTb4g4rf/2HnStio6yWOtQ5rXla3Pk=;
  b=lf1kCD9qvUJqTp/GVBcYioFX3kfYyyAkcrUg2dGXmji/lcjMsSnmmSKw
   mk9VsHWQat26bj56hBFch45IoUGE9z0k/8u7HRa9/eZoihL1keGAsA279
   LSS2dZ7tjPMAxijKEEciTRMoKgk5SX3AAbpZQBD6QjkKRP3Ov8+/2zBhW
   sMZxCmEqKLWvM5OjYKCCvw3rJnB6tGNtTukW5Lkaoa2i0m2Mu2HD4JKib
   6DML8DAdRXVEJbBro/zsNu5B2Xe/7HRddruJs3/o5Us9jp+eI3diD0kqG
   4TCc3WHYf/5OEtR/+SKvYaRGiavVWFeOz5FdBtBdWmj+/dNUiQj/ckuHf
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450948902"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="450948902"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 03:59:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="721055869"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="721055869"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 11 Jul 2023 03:58:49 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJB4v-001p5g-2V;
	Tue, 11 Jul 2023 13:58:45 +0300
Date: Tue, 11 Jul 2023 13:58:45 +0300
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
Subject: Re: [PATCH v2 03/15] spi: Replace if-else-if by bitops and
 multiplications
Message-ID: <ZK015fKTOK5wjck+@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-4-andriy.shevchenko@linux.intel.com>
 <24e71654-bc79-42ac-86d1-4e6100f6893a@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <24e71654-bc79-42ac-86d1-4e6100f6893a@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: MN3RXMHXNJAX4JSUO4EL7JW4RLBJY5WJ
X-Message-ID-Hash: MN3RXMHXNJAX4JSUO4EL7JW4RLBJY5WJ
X-Mailman-Approved-At: Tue, 11 Jul 2023 14:21:36 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MN3RXMHXNJAX4JSUO4EL7JW4RLBJY5WJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 10, 2023 at 05:56:59PM +0100, Mark Brown wrote:
> On Mon, Jul 10, 2023 at 06:49:20PM +0300, Andy Shevchenko wrote:
> 
> > -		if (xfer->bits_per_word <= 8)
> > -			maxsize = maxwords;
> > -		else if (xfer->bits_per_word <= 16)
> > -			maxsize = 2 * maxwords;
> > -		else
> > -			maxsize = 4 * maxwords;
> > -
> > +		maxsize = maxwords * roundup_pow_of_two(BITS_TO_BYTES(xfer->bits_per_word));
> 
> This will change the behaviour if bits_per_word is more than 32.  That
> is validated out elsewhere but I shouldn't have had to go around
> checking the code to confirm that this is the case.  This is the sort of
> thing that should be highlighted when doing this sort of edge case
> stylistic change.

Right, I have to add this into commit message of v3.

-- 
With Best Regards,
Andy Shevchenko


