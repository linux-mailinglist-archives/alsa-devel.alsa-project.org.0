Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5DA874D7E7
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Jul 2023 15:38:04 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 10DF33E7;
	Mon, 10 Jul 2023 15:37:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 10DF33E7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1688996284;
	bh=HA2So+NjBTWAY2fjVnTJJii4ARFTRIerq07ZS5EB7BI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=HhCZjeiwOFNG7Z473F9fUUzNAo5tjSgwlQOjcugqbHsmSVNUEAA+kWd6NsKGbVB+t
	 yXOHt1HsYg1LnFkEc8/LpUqhGpXJZ9y8LfXCQqSPvnc/0NWiUxS4aDfXKgNwztWc9M
	 gkwrrZ1a3Xng1DK0KDql23K6wqGG/xfKAbeIY+n4=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 48E91F80153; Mon, 10 Jul 2023 15:37:12 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C15E2F80153;
	Mon, 10 Jul 2023 15:37:12 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 2EB1EF80249; Mon, 10 Jul 2023 15:37:10 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DFD42F800E4
	for <alsa-devel@alsa-project.org>; Mon, 10 Jul 2023 15:37:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DFD42F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IjYLkVSv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688996228; x=1720532228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HA2So+NjBTWAY2fjVnTJJii4ARFTRIerq07ZS5EB7BI=;
  b=IjYLkVSvmCHsTPWzf2GNThVqCrYFi1Qz6kM9yhAIuU9//+YxkMurdVG4
   HyD7dVtpOY0iQLvlxg8wIm8oKkds+omoAYoOVpghh8U6BR4O6Y1CUNsiZ
   TvdqhD1YyfAy+gglytLMZgITBBZviFwkEqsLfjpo4w7hTphikd/F8esG+
   Co5+V0DZU5mQXlabEujPh7nJUwaQlkDYOxx+dg2W683kADCtRfRECHRXr
   XRVppt2PpI+vrQ9gpTFrMihhg4OSVL0iBi7svnxDERMjwt24D36+TxZec
   LORuq/4AX42Dhb/ne0EISkR7gVLLJStrlq6F6pbYQdKEBKwZl7acZEzAG
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450701153"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="450701153"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jul 2023 06:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="894774244"
X-IronPort-AV: E=Sophos;i="6.01,194,1684825200";
   d="scan'208";a="894774244"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 10 Jul 2023 06:36:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qIr4P-001ZC8-1X;
	Mon, 10 Jul 2023 16:36:53 +0300
Date: Mon, 10 Jul 2023 16:36:53 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>,
	Kris Bahnsen <kris@embeddedts.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Tharun Kumar P <tharunkumar.pasumarthi@microchip.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org
Cc: Radu Pirea <radu_nicolae.pirea@upb.ro>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>
Subject: Re: [PATCH v1 0/8] spi: Header and core clean up and refactoring
Message-ID: <ZKwJdb0rJCmH5cBA@smile.fi.intel.com>
References: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710102751.83314-1-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: VMXVQ7YNW2PGO4Q4ARYRMZCFZSNM5FER
X-Message-ID-Hash: VMXVQ7YNW2PGO4Q4ARYRMZCFZSNM5FER
X-MailFrom: andriy.shevchenko@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/VMXVQ7YNW2PGO4Q4ARYRMZCFZSNM5FER/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Mon, Jul 10, 2023 at 01:27:43PM +0300, Andy Shevchenko wrote:
> Various cleanups and refactorings of the SPI header and core parts
> united in a single series.
> 
> Patches 1 & 2, 5 & 6 & 8 are dependent inside each group.
> 
> No functional change intended.

I will resend the entire series.

-- 
With Best Regards,
Andy Shevchenko


