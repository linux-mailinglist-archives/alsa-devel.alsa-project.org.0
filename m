Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0EAC08A9
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 17:34:13 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C1579167A;
	Fri, 27 Sep 2019 17:33:21 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C1579167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569598451;
	bh=2mIweqEBNMgSHi8p5DJ7wb7dNIKe2IlXozYl5L7oym4=;
	h=Date:From:To:References:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MDj74h2g0gdTz06RCAGYwFY1CDAFMXcSISKmGGdgiVozqVTiMjtf4T5Z5/LvaSmk3
	 sAGdDOBA/HTp0pauNnk3h3oSG8wW+pw9N0xDj3PEi9LOVJ2udu3Ewu4NXZN+sEzF9p
	 a6hpUpzgAhL1B+vDyRk38PrNYfqRDrGhpWiJjs3k=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id EA860F8049A;
	Fri, 27 Sep 2019 17:33:16 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 68AB6F804CA; Fri, 27 Sep 2019 17:33:15 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12A07F8044C
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 17:33:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12A07F8044C
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 08:33:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,555,1559545200"; d="scan'208";a="194521052"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga006.jf.intel.com with ESMTP; 27 Sep 2019 08:33:05 -0700
Received: from andy by smile with local (Exim 4.92.1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1iDsEy-0001S5-2b; Fri, 27 Sep 2019 18:33:04 +0300
Date: Fri, 27 Sep 2019 18:33:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <20190927153304.GS32742@smile.fi.intel.com>
References: <20190925161922.22479-1-navid.emamdoost@gmail.com>
 <13f4bd40-dbaa-e24e-edca-4b4acff9d9c5@linux.intel.com>
 <20190927025526.GD22969@cs-dulles.cs.umn.edu>
 <dc68e0dc-9a8e-cc52-c560-3e86c783dbb3@linux.intel.com>
 <6966df25-e82c-1abe-6a0f-ff497dcda23b@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6966df25-e82c-1abe-6a0f-ff497dcda23b@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, kjlu@umn.edu,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>, emamd001@umn.edu,
 smccaman@umn.edu, Thomas Gleixner <tglx@linutronix.de>,
 Enrico Weigelt <info@metux.net>, linux-kernel@vger.kernel.org,
 Navid Emamdoost <navid.emamdoost@gmail.com>
Subject: Re: [alsa-devel] [PATCH v2] ASoC: Intel: Skylake: prevent memory
 leak in snd_skl_parse_uuids
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

On Fri, Sep 27, 2019 at 05:10:18PM +0200, Cezary Rojewski wrote:

> I'm fine with solution #1 as I guess asking to wait for refactor is not an
> option. Code deployment is delayed due to range of administrative decisions,
> some of which should be uncovered on alsa-devel soon enough.

The problem with solution #1 is freeing orphaned pointer. It will work,
but it's simple is not okay from object life time prospective.

-- 
With Best Regards,
Andy Shevchenko


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
