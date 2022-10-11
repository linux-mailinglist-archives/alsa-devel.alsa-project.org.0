Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E35FB7A2
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Oct 2022 17:45:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 28A8A3F12;
	Tue, 11 Oct 2022 17:44:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 28A8A3F12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1665503146;
	bh=+ptjxKpKMe9ZpYpWkzy6xCUEZZDC37TWs3lCOeMWbyI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=P+oYgkuBNawSdJBgidV0LBYoVcu5YZ3zfN1vECyc/QV0W4Le2b5N2VE5WwoP+Y6St
	 UYJufg6xxFFeahJyvVitUxhFh2RSScwUcAW1zhc8HKnpNHc0ZtEyu/L170fyq4SIyi
	 h7r1AhLDSi1mDTTjQhnHPaz4LJwSPiq9uQ4fk0Hc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 84DF0F8021D;
	Tue, 11 Oct 2022 17:44:50 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D61BDF801D5; Tue, 11 Oct 2022 17:44:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EAF17F800C0
 for <alsa-devel@alsa-project.org>; Tue, 11 Oct 2022 17:44:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EAF17F800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="bZdqObFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665503087; x=1697039087;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+ptjxKpKMe9ZpYpWkzy6xCUEZZDC37TWs3lCOeMWbyI=;
 b=bZdqObFZLf9dD1yX4RsDBFjtXe3r1ShMbn7M6emfVbOj59+5bPLG3O6X
 I/Ztg+3DeLrXPahadSeNaTQbPADxNkgncI6nqPvc9Gd3FoxQc7tPB9B0v
 0Hd+tNI6YpwAYK5Xpwwi2dPGb35eA2HT4QmIAkh7oYIAozGl0U4Xnjs6E
 s13NZGNnoXORbcvEEhHvEbZhJRV7eBMWJ2dr8PVcrU2qDzsFf30jnI7Y2
 9Xr2CVwqWZ36dwPVKpDfuFMTsn8AM/KrxgUJtQ+1Y8fwrsbqHlEhsGBo1
 H1rkDMm5md8ysQKLnGbLxjWASo4TKCeiFPNtadM62cQWzKPrJFlezh0WH A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="304524997"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="304524997"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 08:44:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="715553658"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="715553658"
Received: from smile.fi.intel.com ([10.237.72.54])
 by FMSMGA003.fm.intel.com with ESMTP; 11 Oct 2022 08:44:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1oiHQo-005OPV-2A; Tue, 11 Oct 2022 18:44:34 +0300
Date: Tue, 11 Oct 2022 18:44:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 02/36] gpiolib: cdev: Add missed header(s)
Message-ID: <Y0WPYuZ/9//jxwQ2@smile.fi.intel.com>
References: <20221010201453.77401-1-andriy.shevchenko@linux.intel.com>
 <20221010201453.77401-3-andriy.shevchenko@linux.intel.com>
 <Y0SyVwjDl7NGfTPn@sol>
 <CAHp75Vf4oS8g0zxgismtLrzsJ7AE-bdMEq+GAzx2=Mwnhuk3UA@mail.gmail.com>
 <Y0V0IXF3sASTGdMU@smile.fi.intel.com> <Y0V57gI75ik4ki3A@sol>
 <Y0V9eJX7a0fe6EfX@smile.fi.intel.com>
 <CAMuHMdUhSKuJ3N5zf_+ad_dFu6kSmVTqRpgFUWtd54S9ryw=ew@mail.gmail.com>
 <Y0WJcXzkkK4oGbrR@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0WJcXzkkK4oGbrR@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Kent Gibson <warthog618@gmail.com>, linux-omap@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-aspeed@lists.ozlabs.org,
 patches@opensource.cirrus.com, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, alsa-devel@alsa-project.org,
 openbmc@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
List-Unsubscribe: <https://mailman.alsa-project.org/mailman/options/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=unsubscribe>
List-Archive: <http://mailman.alsa-project.org/pipermail/alsa-devel/>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Subscribe: <https://mailman.alsa-project.org/mailman/listinfo/alsa-devel>, 
 <mailto:alsa-devel-request@alsa-project.org?subject=subscribe>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Tue, Oct 11, 2022 at 06:19:13PM +0300, Andy Shevchenko wrote:
> On Tue, Oct 11, 2022 at 04:39:46PM +0200, Geert Uytterhoeven wrote:

...

After all this patch is not needed. However, during checking of the necessity
of this patch I realized that seq_file is used in a few GPIO drivers without
any actual users, so I will prepare clean up series for that as well.

-- 
With Best Regards,
Andy Shevchenko


