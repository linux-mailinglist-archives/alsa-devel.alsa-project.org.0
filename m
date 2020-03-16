Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA733186F64
	for <lists+alsa-devel@lfdr.de>; Mon, 16 Mar 2020 16:54:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7BA6618C5;
	Mon, 16 Mar 2020 16:53:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7BA6618C5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584374066;
	bh=muw8/ZXGristQ7B08kI84PR6OYN0JNDDxwHbMqzof+s=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tKaza0MbGpLT0NiG+vTYVXJxylbZkwgkjJ89yg42Yp5XaWkHDJX2szfJAHWDcg37a
	 ofrZUI8ZfO7T+nuxUU11elUqjy+cc59fC4FBA772fDsIc5wygMfpeHbyyuHpBb0FKa
	 R5T2JowHU0a+reSiYtZVDz4gHx0pV1mukD8o5Hy0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 5EE1CF8015B;
	Mon, 16 Mar 2020 16:52:45 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 62D90F8015B; Mon, 16 Mar 2020 16:52:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 SURBL_BLOCKED,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 48028F800D2
 for <alsa-devel@alsa-project.org>; Mon, 16 Mar 2020 16:52:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 48028F800D2
IronPort-SDR: phRxoHFiOrbksVX6yCX9LW8+oAwXrN1h+cdUMDr3OQ8Xg5aHd1g59Bv0F2Z7Di2MuK7TWf6BN1
 oo3FJUXkPcPQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2020 08:52:34 -0700
IronPort-SDR: 9zyAWkN3nB4wjhOmEf4Pmw/yZT/SB1Nniyz6/VX2h1j7UqExbvfs+TP/uKG+b02wCSWlFjD6bV
 MlEAeKpPPj5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,561,1574150400"; d="scan'208";a="237986234"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga008.jf.intel.com with ESMTP; 16 Mar 2020 08:52:31 -0700
Received: from andy by smile with local (Exim 4.93)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1jDs2b-00A6Y7-2Y; Mon, 16 Mar 2020 17:52:33 +0200
Date: Mon, 16 Mar 2020 17:52:33 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH v3 0/9] x86: Easy way of detecting MS Surface 3
Message-ID: <20200316155233.GS1922688@smile.fi.intel.com>
References: <20200122112306.64598-1-andriy.shevchenko@linux.intel.com>
 <871rps9uxd.fsf@ashishki-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871rps9uxd.fsf@ashishki-desk.ger.corp.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 x86@kernel.org, Jie Yang <yang.jie@linux.intel.com>,
 linux-kernel@vger.kernel.org,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>
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

On Mon, Mar 16, 2020 at 05:33:02PM +0200, Alexander Shishkin wrote:
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> writes:
> 
> > While working on RTC regression, I noticed that we are using the same DMI check
> > over and over in the drivers for MS Surface 3 platform. This series dedicated
> > for making it easier in the same way how it's done for Apple machines.
> 
> [...]
> 
> >   x86/quirks: Introduce hpet_dev_print_force_hpet_address() helper
> >   x86/quirks: Join string literals back
> 
> These two don't seem to be related to the Surface 3 cause of the rest of
> the patchset, or am I missing something?

No, they are not. I think it's suitable to have them in the bunch nevertheless.

-- 
With Best Regards,
Andy Shevchenko


