Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 86098144064
	for <lists+alsa-devel@lfdr.de>; Tue, 21 Jan 2020 16:22:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 027131674;
	Tue, 21 Jan 2020 16:21:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 027131674
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579620149;
	bh=hQd/ORISTo4ef4fdYZtqQMxR2BA/ASQQaNTkk+/z09E=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=QiWMzRrF8kcyzUTLjh+e+HgRLo7fhSImTBOZrARgZJ2enSQhD+XSzhjdziQPEf79V
	 vz0jE5RPtXKujOZQVZHVp1uJpB/BwNyz1sgCFW+5n8WUdvJt3WxUiiQ+vL1FO1q/3M
	 P7uU4obhlgydMfdJaEIu6BnTZx/Y4KegPlSliJ/g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3F47F801D9;
	Tue, 21 Jan 2020 16:20:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7C0AFF801D9; Tue, 21 Jan 2020 16:20:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8C11FF800E7
 for <alsa-devel@alsa-project.org>; Tue, 21 Jan 2020 16:20:35 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8C11FF800E7
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 07:20:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,346,1574150400"; d="scan'208";a="259096316"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002.fm.intel.com with ESMTP; 21 Jan 2020 07:20:29 -0800
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1itvKQ-0007V5-FF; Tue, 21 Jan 2020 17:20:30 +0200
Date: Tue, 21 Jan 2020 17:20:30 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20200121152030.GU32742@smile.fi.intel.com>
References: <20200120160801.53089-1-andriy.shevchenko@linux.intel.com>
 <20200120160801.53089-10-andriy.shevchenko@linux.intel.com>
 <20200120175554.GK6852@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200120175554.GK6852@sirena.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 x86@kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH v2 9/9] ASoC: Intel: Switch DMI table match
 to a test of variable
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On Mon, Jan 20, 2020 at 05:55:54PM +0000, Mark Brown wrote:
> On Mon, Jan 20, 2020 at 06:08:01PM +0200, Andy Shevchenko wrote:
> > Since we have a common x86 quirk that provides an exported variable,
> > use it instead of local DMI table match.
> 
> Acked-by: Mark Brown <broonie@kernel.org>
> 
> > -	if (cht_machine_id == CHT_SURFACE_MACH)
> > -		return &cht_surface_mach;
> > -	else
> > -		return mach;
> > +	return x86_microsoft_surface_3_machine ? &cht_surface_mach : arg;
> 
> but if you're respinning this please replace this with a normal
> conditional statement to improve legibility.

Okay, will do. Thanks for review!

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
