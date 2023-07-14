Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB4F753B1C
	for <lists+alsa-devel@lfdr.de>; Fri, 14 Jul 2023 14:37:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EC150DF9;
	Fri, 14 Jul 2023 14:36:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EC150DF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689338243;
	bh=jtrdQg43uwRw8V/SyWjoA6lDOg9Cy8vdVhZHpyU1RSk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=WcdlNOUhpFb4LTI1f7+tLskRywUVnK6Xicb2QFU3ljqmjZR5adZz4AvogoffuzWCJ
	 DIQTNO5r54RCsBGILxpnB0HGjLWhIB+3QMfJXLY2mQYhYUqS3bmJtHKUMHAwaGgBLy
	 XmuIDXhbTWndX5ox3xghGNBZ8pm+1vOpP7AMUr6k=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DC9EF80544; Fri, 14 Jul 2023 14:36:32 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id C9734F80236;
	Fri, 14 Jul 2023 14:36:31 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 37608F80236; Fri, 14 Jul 2023 14:36:29 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 860C3F80153
	for <alsa-devel@alsa-project.org>; Fri, 14 Jul 2023 14:36:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 860C3F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ciyPq1Q4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689338187; x=1720874187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=jtrdQg43uwRw8V/SyWjoA6lDOg9Cy8vdVhZHpyU1RSk=;
  b=ciyPq1Q4nxZfJxVHQoiKBymAZI3q5I4COBes9xafXAkWMau37foPQVXX
   ZE46KWvgDdiuP1LhE4PqTuRM/1Y0FGaDgoiPS7m8rl66AAphKjVqVo6GO
   ysdtmUIHflh6INW4vYOcuEELg5eUbH+vZbdlvZhSifOMOJt1cgL2SqxBF
   7s1LkDvV1XyEV8zeiAy7HCXa4rqevquGeggM2yRSag0qLnOw2srs6/vrO
   GCC1EKFu5dzFV8pYolbSadjw1Bh8aOiVFaEBMbJzcWQWFuIAarb8bIzZ0
   taNPU6lc8QvNJVdmLXqy7FCzfn2qzp1TrZwAvY6c5okAoJ8e5zA4mgFC8
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="429228637"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="429228637"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2023 05:36:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10770"; a="1053039721"
X-IronPort-AV: E=Sophos;i="6.01,205,1684825200";
   d="scan'208";a="1053039721"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 14 Jul 2023 05:36:20 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1qKI1y-002ey7-2b;
	Fri, 14 Jul 2023 15:36:18 +0300
Date: Fri, 14 Jul 2023 15:36:18 +0300
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
Subject: Re: [PATCH v3 00/15] PCI: Define Intel PCI IDs and use them in
 drivers
Message-ID: <ZLFBQqGzoCjBHChK@smile.fi.intel.com>
References: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230714202457.423866-1-amadeuszx.slawinski@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: KSMSDFPZ5VQQNRR5Y5SN4WL2MGJFC2MF
X-Message-ID-Hash: KSMSDFPZ5VQQNRR5Y5SN4WL2MGJFC2MF
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/KSMSDFPZ5VQQNRR5Y5SN4WL2MGJFC2MF/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Jul 14, 2023 at 10:24:42PM +0200, Amadeusz Sławiński wrote:
> PCI IDs for Intel HDA are duplicated across quite a few drivers, due to
> various configurations and historical reasons. Currently almost all uses
> of HDA PCI IDs have corresponding comment telling which platform it is.
> Additionally there are some inconsistencies between drivers about which
> ID corresponds to which device.
> 
> Simplify things, by adding PCI IDs to global header and make use of them
> in drivers. This allows for removal of comments by having IDs themselves
> being self explanatory. Additionally it allows for removal of existing
> inconsistencies by having one source of truth.

> Changes from v2:
>  - Change CHV to BSW (Andy)
>  - Fix incorrectly rebased patches (Andy)
>  - Fix commit message and add suggestions from Andy to SST patch (Andy)
>  - Rebased on top of Linus tree commit: 4b810bf037e5

Use --base parameter, it will help CIs as well to test your changes against
correct base.

-- 
With Best Regards,
Andy Shevchenko


