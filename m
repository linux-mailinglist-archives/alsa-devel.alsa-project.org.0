Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C1E753B17
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 14:36:27 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6DDF2847;
	Fri, 14 Jul 2023 14:35:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6DDF2847
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689338186;
	bh=qj1aaPyREzZcYjVK+fmXUh6iHLqnHWfOUSr3l9RvmIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=EQpq7r9m/SWo+w05ALA6Iwy7c5qHhNrqUBLTOpsw0bUn0iVaT01faoaCx7kA8sMI6
	 zub3Rmc4Exfgyd+BnOdEeYaQq3GwJNRXO68P7nbqSyZbSCWIEBN9XqTxLWKanZrVgk
	 yPsUEZI/BTFgb1zjLb+eclxJLZ2oXbN5F6/5ZrA0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A10A9F8024E; Fri, 14 Jul 2023 14:35:35 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 50BDCF80153;
	Fri, 14 Jul 2023 14:35:35 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AD77BF80236; Fri, 14 Jul 2023 14:35:30 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A3C46F800E4
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 14:35:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A3C46F800E4
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=K9YjCyxk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689338128; x=1720874128;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=qj1aaPyREzZcYjVK+fmXUh6iHLqnHWfOUSr3l9RvmIM=;
  b=K9YjCyxkzU86AMkN83aFvqyjlPfyncKez/zYEVxRC/0BiXARiNbmmbd9
   NIOXRq7/1xju8LSGpi79Lx3simOvQjB4Q8zkvmOO/eG5tfEFFpztTXYCY
   9ybg2Tik4FDVkZ5DF41qOhgHJuCjHdNfDJdzRlZXsthama7fcOE9rANQu
   Uqr/0Ci3ZNUZW8NgpGqhNU1LOpxF8cIk2g9kLtN3r+bCTKvoeXlLrbFov
   lJ20z/ToH2rC39SIMh+OMyFDrOa8ZmRJCr8YK/txDxRkDx5lBFXU7/C8y
   iAV+FByNQFA0qZIjSFBAD1rYFmvMdVuFbOVgl400p4srIwhgLSy8ZCRdV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="369012254"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="369012254"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="787840574"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="787840574"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jul 2023 05:35:21 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qKI11-002exN-2W;
	Fri, 14 Jul 2023 15:35:19 +0300
Date: Fri, 14 Jul 2023 15:35:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v3 03/15] ASoC: SOF: Remove unused Broxton PCI ID
Message-ID: <ZLFBBzmJXgXeWZ0y@smile.fi.intel.com>
References: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
 <20230714202457.423866-4-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714202457.423866-4-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: 7ELAZ2CTOJ4LRXX5NWMBVMLIQ7H7QHMK
X-Message-ID-Hash: 7ELAZ2CTOJ4LRXX5NWMBVMLIQ7H7QHMK
X-MailFrom: andriy.shevchenko@intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/7ELAZ2CTOJ4LRXX5NWMBVMLIQ7H7QHMK/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 14, 2023 at 10:24:45PM +0200, Amadeusz Sławiński wrote:
> Current code references 0x1a98 which is BXT-M (not -T as it is
> commented) and it's an RVP, BXT-M B0 to be specific. From what we know
> no BXT is available on market.

...

>  sound/hda/intel-dsp-config.c  | 7 -------
>  sound/soc/sof/intel/pci-apl.c | 2 --

I dunno how SOF and HDA are related to each other, but in the next patch you
also do something about HDA, either group all of them, or split HDA, or split
on per file basis. I'm not familiar with the relationship between them up to
you which way you choose.

-- 
With Best Regards,
Andy Shevchenko


