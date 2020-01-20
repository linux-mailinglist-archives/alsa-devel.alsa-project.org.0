Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0EF14281A
	for <lists+alsa-devel@lfdr.de>; Mon, 20 Jan 2020 11:19:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 0599D1675;
	Mon, 20 Jan 2020 11:18:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 0599D1675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1579515552;
	bh=P+Qn9Jf1Z/ooOCJpLG7R/8OWaf9QVNCGkqxfEOjexds=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=GxebpQep+zZSEz+/HWxRn6fmcCzE7r/WOk7/siA/6thIOyp/VxICc2JD9xF87lc5D
	 /CIFKlEcrjJ+MJUx727UmsmpxqwfOSkUugmCg0+htcaOB34z1XJyNT14Dx4x8MKMZh
	 1SV1+R86O1/F0v6n0iOpMXXt5wYP4+A/emghdACo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 45B7DF8022D;
	Mon, 20 Jan 2020 11:17:28 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 56759F8020C; Mon, 20 Jan 2020 11:17:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E10CEF8012F
 for <alsa-devel@alsa-project.org>; Mon, 20 Jan 2020 11:17:20 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E10CEF8012F
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 02:17:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,341,1574150400"; d="scan'208";a="227015778"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga003.jf.intel.com with ESMTP; 20 Jan 2020 02:17:13 -0800
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1itU7O-0000Dw-8J; Mon, 20 Jan 2020 12:17:14 +0200
Date: Mon, 20 Jan 2020 12:17:14 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <20200120101714.GG32742@smile.fi.intel.com>
References: <20200117175626.56358-1-andriy.shevchenko@linux.intel.com>
 <20200117175626.56358-7-andriy.shevchenko@linux.intel.com>
 <c92e0395-0a08-a400-eb48-0aa05e52cf30@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c92e0395-0a08-a400-eb48-0aa05e52cf30@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-rtc@vger.kernel.org, Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 "Guilherme G . Piccoli" <gpiccoli@canonical.com>, alsa-devel@alsa-project.org,
 Cezary Rojewski <cezary.rojewski@intel.com>, x86@kernel.org,
 Jie Yang <yang.jie@linux.intel.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Mark Brown <broonie@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [alsa-devel] [PATCH v1 7/8] ASoC: Intel: Switch DMI table match
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

On Fri, Jan 17, 2020 at 01:10:55PM -0600, Pierre-Louis Bossart wrote:
> On 1/17/20 11:56 AM, Andy Shevchenko wrote:
> > Since we have a common x86 quirk that provides an exported variable,
> > use it instead of local DMI table match.
> > 
> > Cc: Cezary Rojewski <cezary.rojewski@intel.com>
> > Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> > Cc: Liam Girdwood <liam.r.girdwood@linux.intel.com>
> > Cc: Jie Yang <yang.jie@linux.intel.com>
> > Cc: Mark Brown <broonie@kernel.org>
> > Cc: alsa-devel@alsa-project.org
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Thanks Andy.
> 
> Acked-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thank you. Though I think I'll re-do this a bit, i.e.
 - convert the cht_quirk() to oneliner that is using ternary operator
 - convert also codec driver to use variable instead of DMI match

> 
> > ---
> >   .../intel/common/soc-acpi-intel-cht-match.c   | 28 ++-----------------
> >   1 file changed, 3 insertions(+), 25 deletions(-)
> > 
> > diff --git a/sound/soc/intel/common/soc-acpi-intel-cht-match.c b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> > index d0fb43c2b9f6..833d2e130e6e 100644
> > --- a/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> > +++ b/sound/soc/intel/common/soc-acpi-intel-cht-match.c
> > @@ -5,31 +5,11 @@
> >    * Copyright (c) 2017, Intel Corporation.
> >    */
> > -#include <linux/dmi.h>
> > +#include <linux/platform_data/x86/machine.h>
> > +
> >   #include <sound/soc-acpi.h>
> >   #include <sound/soc-acpi-intel-match.h>
> > -static unsigned long cht_machine_id;
> > -
> > -#define CHT_SURFACE_MACH 1
> > -
> > -static int cht_surface_quirk_cb(const struct dmi_system_id *id)
> > -{
> > -	cht_machine_id = CHT_SURFACE_MACH;
> > -	return 1;
> > -}
> > -
> > -static const struct dmi_system_id cht_table[] = {
> > -	{
> > -		.callback = cht_surface_quirk_cb,
> > -		.matches = {
> > -			DMI_MATCH(DMI_SYS_VENDOR, "Microsoft Corporation"),
> > -			DMI_MATCH(DMI_PRODUCT_NAME, "Surface 3"),
> > -		},
> > -	},
> > -	{ }
> > -};
> > -
> >   static struct snd_soc_acpi_mach cht_surface_mach = {
> >   	.id = "10EC5640",
> >   	.drv_name = "cht-bsw-rt5645",
> > @@ -43,9 +23,7 @@ static struct snd_soc_acpi_mach *cht_quirk(void *arg)
> >   {
> >   	struct snd_soc_acpi_mach *mach = arg;
> > -	dmi_check_system(cht_table);
> > -
> > -	if (cht_machine_id == CHT_SURFACE_MACH)
> > +	if (x86_microsoft_surface_3_machine)
> >   		return &cht_surface_mach;
> >   	else
> >   		return mach;
> > 

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
