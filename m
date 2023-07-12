Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A869750D30
	for <lists+alsa-devel@lfdr.de>; Wed, 12 Jul 2023 17:54:45 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30D44850;
	Wed, 12 Jul 2023 17:53:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30D44850
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689177284;
	bh=JyJLilC7lSpSEXwLkk2Nl0wlhmfEXlOLLuDZFu3Vyj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=ekJTeaHBrU7GMLVWfZN56nThfTAYABGdBZsnfk8IX933GBsWM7J7k9hOpOXND+eaU
	 /SUBWXtISbJXPcnFdnCMEQkHmaPKoJnSlB01/22nhv0wOReTc+GJQDleCur32RrvHq
	 Tq7+c3TdeTHmKWgyfO/BfkNrncvws2z1QznoocRE=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 44B98F80249; Wed, 12 Jul 2023 17:53:52 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 7BA7BF80236;
	Wed, 12 Jul 2023 17:53:52 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id C92BFF8024E; Wed, 12 Jul 2023 17:53:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D6626F80153
	for <alsa-devel@alsa-project.org>; Wed, 12 Jul 2023 17:53:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D6626F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=T0mgB9D+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689177225; x=1720713225;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=JyJLilC7lSpSEXwLkk2Nl0wlhmfEXlOLLuDZFu3Vyj4=;
  b=T0mgB9D+2mo6mN24/FgJM2YD57iOiwmLaFgxUEMXY+1XSNF4DhjHBVL4
   0O/PFPi+WRqNf71+ydjrkhN3jUOgt5GuKDNrptVaIdcyd4du10Chsb4pG
   +AmKsndSemnwm4CsuTq2cp9gBENxyrC+fZpMwVvCYjYK66y3cr8lIUBp/
   d1OJzIiqkyjzK+pInWXSNUQwafz7yS7SzXW0+IpTjXXFOI9LinIN/ik4I
   zEgTqVDKCEK0vjYAVoVkpmq+M113Gt2Szs5swEY3lC5lmg11uP4kvnDff
   Ip5y4h6e2RlS9M+4I3dCLI9gOSnH6BNOExayvUcIqkiR1nYGYR1nYlI2H
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="362391801"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200";
   d="scan'208";a="362391801"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2023 08:53:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="895674100"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200";
   d="scan'208";a="895674100"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga005.jf.intel.com with ESMTP; 12 Jul 2023 08:53:38 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qJc9o-002AZF-0w;
	Wed, 12 Jul 2023 18:53:36 +0300
Date: Wed, 12 Jul 2023 18:53:36 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Amadeusz =?utf-8?B?U8WCYXdpxYRza2k=?=
 <amadeuszx.slawinski@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, alsa-devel@alsa-project.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 12/13] ASoC: SOF: Intel: Convert to PCI device IDs defines
Message-ID: <ZK7MgNH7KM7rHris@smile.fi.intel.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
 <20230711125726.3509391-13-amadeuszx.slawinski@linux.intel.com>
 <ZK1kPXm+FieJ+vya@smile.fi.intel.com>
 <ec6a8f88-ae94-21a5-ec01-013c68fd8feb@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ec6a8f88-ae94-21a5-ec01-013c68fd8feb@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: MAHGCX3Y4CXZ3WQPWPVSQ7KRUPYI76AB
X-Message-ID-Hash: MAHGCX3Y4CXZ3WQPWPVSQ7KRUPYI76AB
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/MAHGCX3Y4CXZ3WQPWPVSQ7KRUPYI76AB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Wed, Jul 12, 2023 at 02:16:17PM +0200, Amadeusz Sławiński wrote:
> On 7/11/2023 4:16 PM, Andy Shevchenko wrote:
> > On Tue, Jul 11, 2023 at 02:57:25PM +0200, Amadeusz Sławiński wrote:

...

> > Oh, additional remark below.

> > > +	{ PCI_DEVICE_DATA(INTEL, HDA_APL, &bxt_desc) },
> > > +	{ PCI_DEVICE_DATA(INTEL, HDA_APL_T, &bxt_desc) },
> > 
> > Have we ever had APL-T? What is that? I remember that we have had two or
> > three BXTs inside, and then products become for Broxton and Apollo Lake
> > SoC codenames. I never have heard about -T...
> 
> I've talked a bit with Cezary and it seems that 0x1a98 is BXT-M (not -T) and
> it's an RVP, BXT-M B0 to be specific. From what we know no BXT is available
> on market. Perhaps we can just remove it?

If you go this way, it should be in a separate patch and it seems it has
already pre-cooked commit message (as per previous paragraph) :-)

-- 
With Best Regards,
Andy Shevchenko


