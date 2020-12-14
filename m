Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 426082D9B2F
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 16:38:14 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 90C0516DA;
	Mon, 14 Dec 2020 16:37:23 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 90C0516DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607960293;
	bh=6f/VPo7fjIhfbVuUAaKK6xQpjZpBXd62uD9YTbIXyxE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=K/EiOmIaDVG+cSEdXNW2gEkjsauqL+ZOVpvbvHYPUORVWKZ4CnF3D40QsxSckDSJs
	 V+lX/KtRWrqhN3ECs78Cj7k17TGGWE0LcapLa5RfFfnrTg5T6HpsiPaB4XkMJTtMtX
	 BjzmsGMk04abME5kVddNgDftQWbC51ODllc6XRck=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 119B9F80240;
	Mon, 14 Dec 2020 16:36:38 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1446AF801F7; Mon, 14 Dec 2020 16:36:35 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E8EAF800ED
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 16:36:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E8EAF800ED
IronPort-SDR: B0HU27dzOPx5EwINj3rSQwqJmdMo2wVLzg3X6s640XB9z9DJ2lvD1FVRCuuZ8to5+s7I49HR0V
 wWAB/4LrI4Ig==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="173954638"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="173954638"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 07:36:29 -0800
IronPort-SDR: 2uuepX6zj63kKsCfkNKBkPGV1U2c0aGqBnFw/nqNEDv8JW4+heLzfU1fERWyFRlFIBlcDLpFrg
 Hu/+0vFjlNHg==
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="351368672"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 07:36:27 -0800
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1kopuj-00EIgw-7c; Mon, 14 Dec 2020 17:37:29 +0200
Date: Mon, 14 Dec 2020 17:37:29 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Rojewski, Cezary" <cezary.rojewski@intel.com>
Subject: Re: [PATCH v1] catpt: Switch to use list_entry_is_head() helper
Message-ID: <20201214153729.GK4077@smile.fi.intel.com>
References: <20201208102637.1168-1-andriy.shevchenko@linux.intel.com>
 <7b7ad24505604110aeeebb2a0b30e573@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7b7ad24505604110aeeebb2a0b30e573@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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

On Mon, Dec 14, 2020 at 09:14:13AM +0000, Rojewski, Cezary wrote:
> On 2020-12-08 11:26 AM, Andy Shevchenko wrote:
> > Since we got list_entry_is_head() helper in the generic header,
> > we may switch catpt to use it. It removes the need in additional variable.
> 
> Thanks for the patch, Andy. One nitpick below.

...

> >   	struct catpt_dev *cdev = dev_get_drvdata(dai->dev);
> >   	struct snd_soc_component *component = dai->component;
> > -	struct snd_kcontrol *pos, *kctl = NULL;
> >   	const char *name;
> >   	int ret;
> >   	u32 id = stream->info.stream_hw_id;
> > +	struct snd_kcontrol *pos;
> 
> Shouldn't structs be declared before any primitive-types?

Good question. I consider the length of the line is more important
(to keep reversed xmas tree order).

If you think we should leave as is tell me, I'll send v2.

-- 
With Best Regards,
Andy Shevchenko


