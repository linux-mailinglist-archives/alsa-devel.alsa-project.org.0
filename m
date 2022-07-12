Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F1026571C58
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Jul 2022 16:25:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8A9B041;
	Tue, 12 Jul 2022 16:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8A9B041
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657635944;
	bh=D8ft9V0+ADG3wDCihX2raadoPFqtJ3Qm3yeYVZqzsmA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sd+JyRYOROF+qTKDDdD4o9+kg+lwpgvqxgymxZOoZQbuqRTRZbAkcL3UjPj1OJCB9
	 KOPAZ2/TVffzGI4SE+B3tiF7wezjQSmnQZiBY3EIuRpamuOTB74xYvM8h1SMH4744N
	 5KXQoifXZEbi7JN1BlJCEolbL46TDbqN1fJpYpB4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09C8DF80279;
	Tue, 12 Jul 2022 16:24:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 423F7F8012B; Tue, 12 Jul 2022 16:24:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 FREEMAIL_FROM,KHOP_HELO_FCRDNS,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 75053F800BD
 for <alsa-devel@alsa-project.org>; Tue, 12 Jul 2022 16:24:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 75053F800BD
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="346629483"
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="346629483"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 07:24:30 -0700
X-IronPort-AV: E=Sophos;i="5.92,265,1650956400"; d="scan'208";a="684791027"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jul 2022 07:24:25 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andy.shevchenko@gmail.com>) id 1oBGoI-001BWj-1L;
 Tue, 12 Jul 2022 17:24:22 +0300
Date: Tue, 12 Jul 2022 17:24:22 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
Message-ID: <Ys2EFtNVL8ZALQ5Q@smile.fi.intel.com>
References: <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
 <6c8e4104-2239-a188-649d-585f059cabdd@intel.com>
 <YsgjdKEtE7pMDTnZ@smile.fi.intel.com>
 <a73b3ec0-5abb-ddfd-414b-b9807f05413e@linux.intel.com>
 <CAHp75Vd4D0KF7ik+aMOwv-+bofWja_tDe4YUmihQBF+RiHZTmA@mail.gmail.com>
 <e2fe6351-f9ee-48eb-ad7f-280249f7f3f7@intel.com>
 <CAHp75VfvN-iJTpgg6JeKhOqJLhtYSieo7d7SOCBoUu-81FtSqg@mail.gmail.com>
 <c19ed4a6-6a96-b4a4-0f5a-7ca1dba925d1@intel.com>
 <YsnoH64cKCT7gndw@smile.fi.intel.com>
 <2c6a4a61-e6c8-0487-8d29-dc3fbb90bbe2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2c6a4a61-e6c8-0487-8d29-dc3fbb90bbe2@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Cc: Andy Shevchenko <andy@kernel.org>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 amadeuszx.slawinski@linux.intel.com,
 =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@linux.intel.com>
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

On Tue, Jul 12, 2022 at 03:51:04PM +0200, Cezary Rojewski wrote:
> On 2022-07-09 10:42 PM, Andy Shevchenko wrote:

...

> I still believe that casting blindly is not the way to go. I did explicitly
> ask about int vs u32, not int vs unsigned int. Please note that these values
> are later passed to the IPC handlers, and this changes the context a bit. If
> hw expects u32, then u32 it shall be.

What you can do is probably utilize _Generic() which will reduce the code base
and allow to use the same template for different types.

-- 
With Best Regards,
Andy Shevchenko


