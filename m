Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F260C763C79
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Jul 2023 18:29:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E13D5203;
	Wed, 26 Jul 2023 18:28:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E13D5203
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1690388942;
	bh=97MgdinZzeqLR7dKFXO0MmcsC1rkrqiXpSbNH2kGwTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vbAmeTZZIjuRii1uXY2tCZSZdnzTACufe5pDFXv09Ec0q0+oCkZzFEEecziwWV90Z
	 cJv1gByC3GBuwSVMIeEWulz69GVvYJ0QLzZbE2ihaQQoobCxx5bUXqHpoTGt8cWCym
	 ntL00ixNoKA/Wvx29JaYWu5H26dJss4L/9loCY6U=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60366F80553; Wed, 26 Jul 2023 18:28:10 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id A77B1F80153;
	Wed, 26 Jul 2023 18:28:07 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 3055FF8019B; Wed, 26 Jul 2023 18:27:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 364C1F80149
	for <alsa-devel@alsa-project.org>; Wed, 26 Jul 2023 18:27:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 364C1F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=kYkO2hIK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690388875; x=1721924875;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=97MgdinZzeqLR7dKFXO0MmcsC1rkrqiXpSbNH2kGwTI=;
  b=kYkO2hIKTGSONdISTxqM11qhIZTe8TuRYAN7c56Tqywz/CqbaOJqMmac
   3dJ7ZjdzJDmRRMMPRwyosPTqINjSQBWzG4sEx028z+dByUe3DYHcp3rl/
   1ENrqV0OskRCNa/pKSltzY9hpk1NfrrAjK+fVxyu/UetRDMmvISzNP3tO
   pS37hoSfC4kou1PkJt5eqTrP9nd7RGru5jeARukORTY4PG0610FWuI6Uc
   mULCv0PffSLzfRszgovh7bzQwlLSJizoUM9jKbSs+ulqGyhVysupuvS3e
   86+y+/lJSzRHg7odM4eh4FkX91X/HYjh4IrYcjiFeosy39nR3y2jRrQ1+
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="352968315"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200";
   d="scan'208";a="352968315"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2023 09:27:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="796643250"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200";
   d="scan'208";a="796643250"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 26 Jul 2023 09:27:46 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qOhMW-00EzwV-0U;
	Wed, 26 Jul 2023 19:27:44 +0300
Date: Wed, 26 Jul 2023 19:27:43 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Brent Lu <brent.lu@intel.com>
Cc: alsa-devel@alsa-project.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
	Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
	Yong Zhi <yong.zhi@intel.com>, Terry Cheong <htcheong@chromium.org>,
	Uday M Bhat <uday.m.bhat@intel.com>,
	Mac Chiang <mac.chiang@intel.com>,
	"Dharageswari . R" <dharageswari.r@intel.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	ye xingchen <ye.xingchen@zte.com.cn>
Subject: Re: [PATCH v2 1/2] ASoC: Intel: maxim-common: get codec number from
 ACPI
Message-ID: <ZMFJf2MM35KBFR95@smile.fi.intel.com>
References: <20230726140848.2267568-1-brent.lu@intel.com>
 <20230726140848.2267568-2-brent.lu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230726140848.2267568-2-brent.lu@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: Y5J54EFJ2VKGY6I6A7O62XCTGUVFVJQB
X-Message-ID-Hash: Y5J54EFJ2VKGY6I6A7O62XCTGUVFVJQB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/Y5J54EFJ2VKGY6I6A7O62XCTGUVFVJQB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 26, 2023 at 10:08:47PM +0800, Brent Lu wrote:
> Implement a helper function to get number of codecs from ACPI
> subsystem to remove the need of quirk flag in machine driver.

...

> +void max_98390_dai_link(struct snd_soc_dai_link *link)
> +{
> +	unsigned int num_codecs = get_num_codecs(MAX_98390_ACPI_HID);
> +
> +	link->codecs = max_98390_components;
> +
> +	switch (num_codecs) {
> +	case 2:
> +	case 4:
> +		link->num_codecs = num_codecs;
> +		break;
> +	default:

> +		pr_err("invalid codec number %d for %s\n", num_codecs,
> +			MAX_98390_ACPI_HID);

I believe you have struct device pointer available, use dev_err().

> +		break;
> +	}
> +
> +	link->init = max_98390_init;
> +	link->ops = &max_98390_ops;
> +}

...

> +void max_98390_set_codec_conf(struct snd_soc_card *card)
>  {
> +	unsigned int num_codecs = get_num_codecs(MAX_98390_ACPI_HID);
> +
> +	card->codec_conf = max_98390_codec_conf;
> +
> +	switch (num_codecs) {
> +	case 2:
> +	case 4:
> +		card->num_configs = num_codecs;
> +		break;
> +	default:
> +		pr_err("invalid codec number %d for %s\n", num_codecs,
> +			MAX_98390_ACPI_HID);

Ditto.

> +		break;
>  	}
>  }

-- 
With Best Regards,
Andy Shevchenko


