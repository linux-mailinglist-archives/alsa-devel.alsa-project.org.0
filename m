Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC3256CB69
	for <lists+alsa-devel@lfdr.de>; Sat,  9 Jul 2022 22:43:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 806AD1DF;
	Sat,  9 Jul 2022 22:42:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 806AD1DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657399415;
	bh=ZuCeOm6N5CyMt4WIoY0Ljv2m+YkMTKZIXjDap3q6AM0=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mYYDKjTP4F3KV93XExc5ZEhCx+dC7sBenQtuS8ctdXcgh0xjq0xN72gIN8/gp91Hg
	 FPgEVVLn3wkiEjLOgR4k3TVVyv6+AHTTQChNQRJakirNFHqKh5R7xKqWIrmUh8/q2n
	 x23UeH09rpSQesbWHOKtbKyU3ty9TVMXV33ZdvQo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF8E0F80158;
	Sat,  9 Jul 2022 22:42:34 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 540F9F80245; Sat,  9 Jul 2022 22:42:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.2 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 FREEMAIL_FROM, NML_ADSP_CUSTOM_MED, SPF_HELO_NONE, SPF_NONE,
 T_SCC_BODY_TEXT_LINE, 
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C242CF80158
 for <alsa-devel@alsa-project.org>; Sat,  9 Jul 2022 22:42:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C242CF80158
X-IronPort-AV: E=McAfee;i="6400,9594,10403"; a="285586315"
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; d="scan'208";a="285586315"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2022 13:42:14 -0700
X-IronPort-AV: E=Sophos;i="5.92,259,1650956400"; d="scan'208";a="594460189"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2022 13:42:11 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andy.shevchenko@gmail.com>) id 1oAHHE-0019Qg-0W;
 Sat, 09 Jul 2022 23:42:08 +0300
Date: Sat, 9 Jul 2022 23:42:07 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
Message-ID: <YsnoH64cKCT7gndw@smile.fi.intel.com>
References: <CAHp75VceKBoxXVPP4dRYb8LQqHMMDHFp6-E2iuZ-h2RTK8PWQQ@mail.gmail.com>
 <e0c7d254-ace3-625c-cc83-52ca0b45e9fc@intel.com>
 <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
 <6c8e4104-2239-a188-649d-585f059cabdd@intel.com>
 <YsgjdKEtE7pMDTnZ@smile.fi.intel.com>
 <a73b3ec0-5abb-ddfd-414b-b9807f05413e@linux.intel.com>
 <CAHp75Vd4D0KF7ik+aMOwv-+bofWja_tDe4YUmihQBF+RiHZTmA@mail.gmail.com>
 <e2fe6351-f9ee-48eb-ad7f-280249f7f3f7@intel.com>
 <CAHp75VfvN-iJTpgg6JeKhOqJLhtYSieo7d7SOCBoUu-81FtSqg@mail.gmail.com>
 <c19ed4a6-6a96-b4a4-0f5a-7ca1dba925d1@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c19ed4a6-6a96-b4a4-0f5a-7ca1dba925d1@intel.com>
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

On Sat, Jul 09, 2022 at 10:45:49AM +0200, Cezary Rojewski wrote:
> On 2022-07-08 6:49 PM, Andy Shevchenko wrote:
> > On Fri, Jul 8, 2022 at 6:32 PM Cezary Rojewski
> > <cezary.rojewski@intel.com> wrote:
> > > 
> > > On 2022-07-08 5:25 PM, Andy Shevchenko wrote:
> > > > On Fri, Jul 8, 2022 at 2:34 PM Péter Ujfalusi
> > > > <peter.ujfalusi@linux.intel.com> wrote:
> > 
> > > A long shot, but what if we were to modify get_options() so it takes
> > > additional element-size parameter instead?
> > 
> > But why? int / unsigned int, u32 / s32  are all compatible in the current cases.
> 
> I'd like to avoid any additional operations, so that the retrieved payload
> can be provided to the IPC handler directly. The IPC handlers for AudioDSP
> drivers are expecting payload in u32s.
> 
> // u32 **tkns, size_t *num_tkns as foo() arguments
> // u32 *ints, int nints as locals
> 
> 	get_options(buf, 0, &nints);
> 	if (!nints) {
> 		ret = -ENOENT;
> 		goto free_buf;
> 	}
> 
> 	ints = kcalloc(nints + 1, sizeof(*ints), GFP_KERNEL);
> 	if (!ints) {
> 		ret = -ENOMEM;
> 		goto free_buf;
> 	}
> 
> 	get_num_options(buf, nints + 1, ints, sizeof(*ints));
> 
> 	*tkns = ints;
> 	*num_tkns = nints;
> 
> No additional operations in between. The intermediate IPC handler can later
> refer to the actual payload via &tkns[1] before passing it to the generic
> one.
> 
> Casting int array into u32 array does not feel right, or perhaps I'm missing
> something like in the doc case.

C standard.

int to unsigned int is not promoted. And standard says that "The rank of any
unsigned integer type shall equal the rank of the corresponding signed integer
type, if any."

I don't know why one needs to have an additional churn here. int and unsigned
int are interoperable with the adjustment to the sign when the other argument
is signed or lesser rank of.

-- 
With Best Regards,
Andy Shevchenko


