Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DB674F0DB
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 15:57:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 017F8EBA;
	Tue, 11 Jul 2023 15:56:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 017F8EBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689083847;
	bh=0SlN/itezSp5S5zjCF2SMzf5gnBS89SJ4xDj94AkcQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=m1q7/4XDaJgQD3UpXpbGiUuvZUrHYERstXlr419SyHCzvE5rZ6Du8zel2TWZotgGg
	 VB9FtP6tGcDkS/xTxFuu7Fb1QUTG/xHbcF9lrMtUqdwd4jIPTz1tGEBhXQ7u/Bto69
	 /4uOT9ZZkVvvGLYEi1tKOo1zgUF2+5mx+F2DAcOU=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CB396F80631; Tue, 11 Jul 2023 15:52:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2C628F8063C;
	Tue, 11 Jul 2023 15:52:32 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id B6A72F80249; Mon, 10 Jul 2023 18:12:51 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id CF0B3F800D2
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 18:12:38 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF0B3F800D2
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=RrIUmbqo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689005566; x=1720541566;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0SlN/itezSp5S5zjCF2SMzf5gnBS89SJ4xDj94AkcQw=;
  b=RrIUmbqolnzzrBEq0/3+vNgpWjWTfonYrrnrs+oosxuLk8dLRJFwzNzV
   y51pocnL0WSTbZDr38gJI20Q/7NSKi1P8C07e2Hgd4b1QhZYMvpe6wNFM
   KYqg/Cvchkm36rmQNAsEH43dY15Fc1PKuKYNcNxFKUOMyPrM7/yZ1WHIj
   k+iwX9fQ6NpIA84Si522KyRAl6qUIX1E4cfQ2cJFte81B4gLw3dUkJn+w
   hD5peL9WR9m+kBPb3QKQWpNpRSxNBGuKrHbmEAFmfz5XBbn6ErkGgEuIW
   G+83h0k61/scau4YxJhyFJNTx7hMRdSf45zY/lhgc/0HUBTLV557T6O37
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="430464641"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="430464641"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 09:10:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="750388713"
X-IronPort-AV: E=Sophos;i="6.01,195,1684825200";
   d="scan'208";a="750388713"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga008.jf.intel.com with ESMTP; 10 Jul 2023 09:10:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qItTH-001bF6-2N;
	Mon, 10 Jul 2023 19:10:43 +0300
Date: Mon, 10 Jul 2023 19:10:43 +0300
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
Message-ID: <ZKwtgwZtUUHGC+S3@smile.fi.intel.com>
References: <20230710154932.68377-1-andriy.shevchenko@linux.intel.com>
 <20230710154932.68377-10-andriy.shevchenko@linux.intel.com>
 <20230710-doze-scared-9f0a2e1a9125-mkl@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710-doze-scared-9f0a2e1a9125-mkl@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: DIUK4NN2M67MXKODIUP4SDJNEH3OAV4G
X-Message-ID-Hash: DIUK4NN2M67MXKODIUP4SDJNEH3OAV4G
X-Mailman-Approved-At: Tue, 11 Jul 2023 13:52:25 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/DIUK4NN2M67MXKODIUP4SDJNEH3OAV4G/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 10, 2023 at 05:59:55PM +0200, Marc Kleine-Budde wrote:
> On 10.07.2023 18:49:26, Andy Shevchenko wrote:

...

> > +	struct spi_transfer	t[];
> 
> You might want to use the DECLARE_FLEX_ARRAY helper here.

Technically, yes, semantically documentation [1] disagrees with
you, so I leave it as is.

[1]: Documentation/process/deprecated.rst:269

-- 
With Best Regards,
Andy Shevchenko


