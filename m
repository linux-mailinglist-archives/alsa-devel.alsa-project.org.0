Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F295781125
	for <lists+alsa-devel@lfdr.de>; Fri, 18 Aug 2023 19:02:42 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E83D9EC1;
	Fri, 18 Aug 2023 19:01:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E83D9EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1692378161;
	bh=caq96PDrOVqQ3tEIxkcaDXSnE06/7ClYFQb1q4M3iPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=S/ukGgUTn/KtRNveq4824ilCvk7bX68euHFMr/5+iG+94qpptH+GKctNgAF7enfcL
	 jYUAamvDAi1H1DS26XA7vZaou/SD7Lo40JhRmk2MtlXjgdi/NoUrxT1HmjEIbhuvZ0
	 k7/IDzprGLKv//GY3Pc7b7nCf06HJROHOa/1m8pA=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5DF29F80536; Fri, 18 Aug 2023 19:01:50 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id DF81AF8016D;
	Fri, 18 Aug 2023 19:01:49 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D25A1F801EB; Fri, 18 Aug 2023 19:01:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id D30FEF800D1
	for <alsa-devel@alsa-project.org>; Fri, 18 Aug 2023 19:01:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D30FEF800D1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=KzJ5+5m4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692378095; x=1723914095;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=caq96PDrOVqQ3tEIxkcaDXSnE06/7ClYFQb1q4M3iPc=;
  b=KzJ5+5m4PeBMCSJNwisj8UT0yVdoPT0OVQdEYcinAtu3rkfpJmdujm6k
   jCDjZHJuE2lLYq8nWZL5oqWdasxY6yI3TeVNfPdFdZYK3a2aCcxnqQfbT
   hygIyN8+phfNFFhLZTPWfnLSj2aJCu1He0OzCMEYworGXkuYwQ3V3FGzQ
   8batGf5o7MzwFDsYEaENG9TBlIRWA4VO9kJAQKNEdoWrtcRsxtEZ9q+EQ
   kPhzZT+BY8oc6Lmt71/Lig8LOKCgjBOIppSB5//nHKMgccAUxru9cBrYI
   RMaMC/EqqROGLVXDeiQMVr47zILkMZcd6MLH1PfRWNuh2Un87BK+tOWs5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="372050858"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="372050858"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2023 10:01:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10806"; a="770188157"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200";
   d="scan'208";a="770188157"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 18 Aug 2023 10:01:19 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qX2qa-00GyU7-2D;
	Fri, 18 Aug 2023 20:01:16 +0300
Date: Fri, 18 Aug 2023 20:01:16 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Shenghao Ding <shenghao-ding@ti.com>, tiwai@suse.de, robh+dt@kernel.org,
	lgirdwood@gmail.com, perex@perex.cz, kevin-lu@ti.com,
	13916275206@139.com, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, liam.r.girdwood@intel.com,
	mengdong.lin@intel.com, baojun.xu@ti.com, thomas.gfeller@q-drop.com,
	peeyush@ti.com, navada@ti.com, broonie@kernel.org,
	gentuser@gmail.com
Subject: Re: [PATCH v3 2/2] ALSA: hda/tas2781: Add tas2781 HDA driver
Message-ID: <ZN+j3LmfUW2vB+QS@smile.fi.intel.com>
References: <20230818085558.1431-1-shenghao-ding@ti.com>
 <20230818085558.1431-2-shenghao-ding@ti.com>
 <4c1b44b5-995a-fac7-a72b-89b8bf816dd2@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c1b44b5-995a-fac7-a72b-89b8bf816dd2@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID-Hash: XDY72YXEXPEBWWAWR45W2MIJ4XIEVPFL
X-Message-ID-Hash: XDY72YXEXPEBWWAWR45W2MIJ4XIEVPFL
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XDY72YXEXPEBWWAWR45W2MIJ4XIEVPFL/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On Fri, Aug 18, 2023 at 11:00:34AM -0500, Pierre-Louis Bossart wrote:

...

> > +static int comp_match_tas2781_dev_name(struct device *dev,
> > +	void *data)
> > +{
> > +	struct scodec_dev_name *p = data;
> > +	const char *d = dev_name(dev);
> > +	int n = strlen(p->bus);
> > +	char tmp[32];
> > +
> > +	/* check the bus name */
> > +	if (strncmp(d, p->bus, n))
> > +		return 0;

> > +	/* skip the bus number */
> > +	if (isdigit(d[n]))
> > +		n++;

Why do you think it can't be two or more digits?

> > +	/* the rest must be exact matching */
> > +	snprintf(tmp, sizeof(tmp), "-%s:00", p->hid);
> 
> ACPI can sometimes add :01 suffixes, this looks like the re-invention of
> an ACPI helper?
> 
> Adding Andy for the ACPI review.
> 
> > +	return !strcmp(d + n, tmp);
> > +}

Yes, this looks like reinventing a wheel.
Just compare dev_name() against what is in p->....

...

> > +static void tas2781_fixup_i2c(struct hda_codec *cdc,
> > +	const struct hda_fixup *fix, int action)
> > +{
> > +	 tas2781_generic_fixup(cdc, action, "i2c", "TIAS2781");
> 
> TI ACPI ID is TXNW
> 
> https://uefi.org/ACPI_ID_List?search=TEXAS
> 
> There's also a PNP ID PXN
> 
> https://uefi.org/PNP_ID_List?search=TEXAS
> 
> "TIAS" looks like an invented identifier. It's not uncommon but should
> be recorded with a comment if I am not mistaken.
> 
> > +}

Thank you, but actually it's a strong NAK to this even with the comment.
We have to teach people to follow the specification (may be even hard way).

So where did you get the ill-formed ACPI ID?
Is Texas Instrument aware of this?
Can we have a confirmation letter from TI for this ID, please?

-- 
With Best Regards,
Andy Shevchenko


