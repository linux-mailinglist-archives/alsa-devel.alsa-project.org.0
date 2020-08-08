Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4364123F76F
	for <lists+alsa-devel@lfdr.de>; Sat,  8 Aug 2020 13:52:40 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D29A31612;
	Sat,  8 Aug 2020 13:51:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D29A31612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596887559;
	bh=vjdSom4nuSF66kN8G1PTFnJ5spoAHJFKJNTxorjrugc=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Vpw5zm0tV5r7qJn432RZ0G6TkkMNj/eWDh+XchFMq+wWZUZcGny3ubuplp63ATagj
	 fQ1WHd0CANXqmrQReDCkYck+EQa72i8mpMJATactK91JGWYh2zche69GvroshkeaY2
	 AbzyqHiKg5ibBOMrs6eaU13w1l5FB6c1KAFTcewc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1239DF80139;
	Sat,  8 Aug 2020 13:50:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AFFC3F8015A; Sat,  8 Aug 2020 13:50:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H4,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49C1AF80139
 for <alsa-devel@alsa-project.org>; Sat,  8 Aug 2020 13:50:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49C1AF80139
IronPort-SDR: kYdnhhHIvdpkiL34hddDWiwOJ85OLF6XbXWsr+TlRmgd9uogDbBoUJo8cRVHnQNcHO0IqE5Buv
 rqRyOkDbNQDQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9706"; a="238124241"
X-IronPort-AV: E=Sophos;i="5.75,449,1589266800"; d="scan'208";a="238124241"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2020 04:50:47 -0700
IronPort-SDR: RY6e6cIAEuw9jAEtJHzQAo+TtYcs2rMsvFB0XpOqb75p9Np2nBd92PuDIWEMvR/RM+OglNhkLw
 13oQba3sB53w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,449,1589266800"; d="scan'208";a="333797017"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga007.jf.intel.com with ESMTP; 08 Aug 2020 04:50:43 -0700
Received: from andy by smile with local (Exim 4.94)
 (envelope-from <andriy.shevchenko@intel.com>)
 id 1k4NN3-007Egj-Pr; Sat, 08 Aug 2020 14:50:41 +0300
Date: Sat, 8 Aug 2020 14:50:41 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 01/13] ASoC: Intel: Add catpt device
Message-ID: <20200808115041.GN3703480@smile.fi.intel.com>
References: <20200807110649.17114-1-cezary.rojewski@intel.com>
 <20200807110649.17114-2-cezary.rojewski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200807110649.17114-2-cezary.rojewski@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 filip.kaczmarski@intel.com, harshapriya.n@intel.com, marcin.barlik@intel.com,
 zwisler@google.com, lgirdwood@gmail.com, tiwai@suse.com,
 filip.proborszcz@intel.com, broonie@kernel.org, michal.wasko@intel.com,
 cujomalainey@chromium.org, ppapierkowski@habana.ai,
 vamshi.krishna.gopal@intel.com
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

On Fri, Aug 07, 2020 at 01:06:37PM +0200, Cezary Rojewski wrote:
> Declare base structures, registers and device routines for the catpt
> solution. Catpt deprecates and is a direct replacement for
> sound/soc/intel/haswell. Supports Lynxpoint and Wildcat Point both.


...

> +struct catpt_mregion {
> +	u32 start;
> +	u32 end;
> +	bool busy;
> +	struct list_head node;
> +};

I'm wondering if struct resource can be used instead.

You know that you may introduce a new type of resource if you want to.

> +static inline size_t catpt_mregion_size(const struct catpt_mregion *reg)
> +{
> +	return reg->end - reg->start + 1;
> +}
> +
> +/* True if region r1 intersects region r2 */
> +static inline bool catpt_mregion_intersects(struct catpt_mregion *r1,
> +					    struct catpt_mregion *r2)
> +{
> +	return (r1->start >= r2->start && r1->start <= r2->end) ||
> +	       (r1->end >= r2->start && r1->end <= r2->end);
> +}
> +
> +static inline bool catpt_mregion_intersecting(struct catpt_mregion *r1,
> +					      struct catpt_mregion *r2,
> +					      struct catpt_mregion *ret)
> +{
> +	if (!catpt_mregion_intersects(r1, r2))
> +		return false;
> +	ret->start = max(r1->start, r2->start);
> +	ret->end = min(r1->end, r2->end);
> +	return true;
> +}

Yeah, it reminds the existing resource infrastructure. Why to repeat it?


-- 
With Best Regards,
Andy Shevchenko


