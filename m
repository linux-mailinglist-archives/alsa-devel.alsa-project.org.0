Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC454984A5
	for <lists+alsa-devel@lfdr.de>; Mon, 24 Jan 2022 17:24:55 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2B637285B;
	Mon, 24 Jan 2022 17:24:05 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2B637285B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1643041495;
	bh=zkVnxmZoUn2PXNTt6Cj60EJHO4p9UXlPBZUS9Jg10dI=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=R1VbgjD+c91Vkpnx2d//IdDNMBKEhVtEo21OvyuNmSwLPED/pQ+Llc0R+T43Wy86Z
	 FjaDxZ8OYDxBvTfNeKQRuntuzldpDN/l+Ros8At/Sg9Q0CFwlc+Yfa8B/0v3cmT7I3
	 5Deiv+TkTKBdRWTvzzQTWptY/RKVm+bixY88P7Fc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9538DF802BE;
	Mon, 24 Jan 2022 17:23:49 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 18707F8027C; Mon, 24 Jan 2022 17:23:47 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8E446F800E9
 for <alsa-devel@alsa-project.org>; Mon, 24 Jan 2022 17:23:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8E446F800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="PqQTUS4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643041421; x=1674577421;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zkVnxmZoUn2PXNTt6Cj60EJHO4p9UXlPBZUS9Jg10dI=;
 b=PqQTUS4U+tyJjADPyBA3sg6vglzCH5m+DtGeCETz3URqelO8rATxIpYx
 q7cxxUPESC/kIMD8MrBMc4YHX/5t0NaLd/geeMWH23poo184bP/Svv8rp
 zKntNA9zFXCEZJluCqy7Ia+Bg5Oam9siyEz45wKYTnMPzd01EHOinp97B
 NeL49MYfRkiyjyjA45XBnQ3S1YmfYA9WRd/nbd1fN1aRZ+ojMpkiuSDt0
 0AOrW3E+LTm3ef6OQ6pEm9bWAR/CfQjiwtibMiYAyeOAKAdR2rP9y9DX3
 EZ7MXH8YsGxD8/XIcJAUX2W7Aq/HKvlYepWn+D/9yHyEKg08UxAfKzXTT w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="332437776"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="332437776"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 08:23:36 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="479135670"
Received: from smile.fi.intel.com ([10.237.72.61])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 08:23:34 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nC26t-00Dwzw-NZ; Mon, 24 Jan 2022 18:22:27 +0200
Date: Mon, 24 Jan 2022 18:22:27 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH v1 1/1] ASoC: madera: Replace kernel.h with the necessary
 inclusions
Message-ID: <Ye7SQ7Na4Q5KyvOk@smile.fi.intel.com>
References: <20211222164534.67636-1-andriy.shevchenko@linux.intel.com>
 <20211229095345.GX18506@ediswmail.ad.cirrus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211229095345.GX18506@ediswmail.ad.cirrus.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, linux-kernel@vger.kernel.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>
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

On Wed, Dec 29, 2021 at 09:53:45AM +0000, Charles Keepax wrote:
> On Wed, Dec 22, 2021 at 06:45:34PM +0200, Andy Shevchenko wrote:
> > When kernel.h is used in the headers it adds a lot into dependency hell,
> > especially when there are circular dependencies are involved.
> > 
> > Replace kernel.h inclusion with the list of what is really being used.

> Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks!

Takashi, should I resend this?

-- 
With Best Regards,
Andy Shevchenko


