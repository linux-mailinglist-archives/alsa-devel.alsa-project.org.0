Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D76B56B9B5
	for <lists+alsa-devel@lfdr.de>; Fri,  8 Jul 2022 14:32:02 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1900B210;
	Fri,  8 Jul 2022 14:31:12 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1900B210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1657283522;
	bh=XHYMrkzGf/OI8qKbbQnFdL1E3JeCl+7O7p1aJH4TFj4=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cAIPx5Cioo/5jKlidG32gMOzw5btLk/fPQ2eXxl2C5fQG/d8oOZh5el65nV7gf5aO
	 Lv18chXyVz8ZvIYLV+tC3N5lCy8zhkvmQcIQawpab3Ss4VQFTlUJRrgDVrC7eOiIGD
	 xO/J6TBgsh31HVvtlWSjCyRkmE0Rk4WjqEH43pHY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8AD68F8025B;
	Fri,  8 Jul 2022 14:31:01 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 24A74F80167; Fri,  8 Jul 2022 14:30:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
 FREEMAIL_FROM,KHOP_HELO_FCRDNS,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,SPF_NONE,
 T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id EC54BF800E9
 for <alsa-devel@alsa-project.org>; Fri,  8 Jul 2022 14:30:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz EC54BF800E9
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="345958150"
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="345958150"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 05:30:51 -0700
X-IronPort-AV: E=Sophos;i="5.92,255,1650956400"; d="scan'208";a="661758508"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jul 2022 05:30:47 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
 (envelope-from <andy.shevchenko@gmail.com>) id 1o9n88-00183d-0o;
 Fri, 08 Jul 2022 15:30:44 +0300
Date: Fri, 8 Jul 2022 15:30:44 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 1/2] lib/string_helpers: Introduce strsplit_u32()
Message-ID: <YsgjdKEtE7pMDTnZ@smile.fi.intel.com>
References: <20220707091301.1282291-1-cezary.rojewski@intel.com>
 <CAHp75VceKBoxXVPP4dRYb8LQqHMMDHFp6-E2iuZ-h2RTK8PWQQ@mail.gmail.com>
 <e0c7d254-ace3-625c-cc83-52ca0b45e9fc@intel.com>
 <CAHp75VckU2ZraLJ-frjWXjUu9pFW+-XmWgTbYqUXOUNAD-1HGA@mail.gmail.com>
 <6c8e4104-2239-a188-649d-585f059cabdd@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c8e4104-2239-a188-649d-585f059cabdd@intel.com>
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

On Fri, Jul 08, 2022 at 02:13:14PM +0200, Cezary Rojewski wrote:
> On 2022-07-08 1:46 PM, Andy Shevchenko wrote:
> > On Fri, Jul 8, 2022 at 1:33 PM Cezary Rojewski
> > <cezary.rojewski@intel.com> wrote:

...

> > > When I'd written the very first version of this function many months
> > > ago, get_options() looked as it does not fulfill our needs. It seems to
> > > be true even today: caller needs to know the number of elements in an
> > > array upfront.
> > 
> > Have you read a kernel doc for it? It does return the number of
> > elements at the first pass.
> 
> Yes, I've checked several parts of it. Perhaps I did miss something but
> simple_strtoull() doc reads: use kstrtox() instead.

Doc was fixed to make clearer that in some cases it's okay to use
simple_strtox(). And this was exactly due to obfuscation code with this
recommendation. Yes, in general one supposed to use kstrtox(), but it's
not 100% obligatory.

> Thus the strsplit_u32()
> makes use of kstrtox().

Yeah...

> > > Also, kstrtox() takes into account '0x' and modifies the
> > > base accordingly if that's the case. simple_strtoull() looks as not
> > > capable of doing the same thing.
> > 
> > How come?! It does parse all known prefixes: 0x, 0, +, -.
> 
> Hmm.. doc says that it stops at the first non-digit character. Will
> re-check.

Yes, but under non-digit implies the standard prefixes of digits.
simple_strtox() and kstrotox() use the very same function for prefixes.

> > > The goal is to be able to parse input such as:
> > > 
> > > 0x1000003,0,0,0x1000004,0,0
> > > 
> > > into a sequence of 6 uints, filling the *tkns and *num_tkns for the caller.
> > 
> > Yes. Have you checked the test cases for get_options()?

(1)

...

> > > avs-driver, which is also part of the ASoC framework has very similar
> > > debug-interface. I believe there's no need to duplicate the functions -
> > > move them to common code instead.
> > 
> > Taking the above into account, please try to use get_options() and
> > then tell me what's not working with it. If so, we will add test cases
> > to get_options() and fix it.
> 
> There is a difference:
> 
> 	// get_options
> 	int ints[5];
> 
> 	s = get_options(str, ARRAY_SIZE(ints), ints);
> 
> 	// strsplit_u32()
> 	u32 *tkns, num_tkns;
> 
> 	ret = strsplit_u32(str, delim, &tkns, &num_tkns);
> 
> Nothing has been told upfront for in the second case.

It seems you are missing the (1). The code has checks for the case where you
can do get number upfront, it would just require two passes, but it's nothing
in comparison of heave realloc().

  unsigned int *tokens;
  char *p;
  int num;

  p = get_options(str, 0, &num);
  if (num == 0)
	// No numbers in the string!

  tokens = kcalloc(num + 1, sizeof(*tokens), GFP_KERNEL);
  if (!tokens)
	return -ENOMEM;

  p = get_oprions(str, num, &tokens);
  if (*p)
	// String was parsed only partially!
	// assuming it's not a fatal error

  return tokens;

-- 
With Best Regards,
Andy Shevchenko


