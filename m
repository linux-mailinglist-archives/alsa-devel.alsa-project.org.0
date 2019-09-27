Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2EDC0E07
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Sep 2019 00:28:00 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4420B166F;
	Sat, 28 Sep 2019 00:27:10 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4420B166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569623280;
	bh=kLDqfudY3IG0r6CBBagcP2GqaOqhOy+RE6m+lHUCL8s=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XsEUXLLunDXmEqHuIhssepWO84Zpv+K2e4NXzYxf38qbjbheU7vMY2Cd4rH+BdX3j
	 kAliJd5hMxsGC0jSBkExn8+Jyt4TJK5exQtDxdeO+1pUFOoBxWx5yWjaboy9e+PHWa
	 vE5S5geMhmN1fw6tOY/bC7Q8HUqrlGpwGbzE+Q5Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73FBCF80138;
	Sat, 28 Sep 2019 00:26:15 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A1C89F8049A; Sat, 28 Sep 2019 00:25:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=PRX_BODY_76,SPF_HELO_PASS,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A8F86F800B3
 for <alsa-devel@alsa-project.org>; Sat, 28 Sep 2019 00:25:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A8F86F800B3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 15:25:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,557,1559545200"; d="scan'208";a="219948342"
Received: from linux.intel.com ([10.54.29.200])
 by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2019 15:25:40 -0700
Received: from jastaffa-mobl3.amr.corp.intel.com (unknown [10.251.18.83])
 by linux.intel.com (Postfix) with ESMTP id 23629580127;
 Fri, 27 Sep 2019 15:25:39 -0700 (PDT)
To: Andy Shevchenko <andy.shevchenko@gmail.com>
References: <20190925161922.22479-1-navid.emamdoost@gmail.com>
 <13f4bd40-dbaa-e24e-edca-4b4acff9d9c5@linux.intel.com>
 <20190927025526.GD22969@cs-dulles.cs.umn.edu>
 <dc68e0dc-9a8e-cc52-c560-3e86c783dbb3@linux.intel.com>
 <6966df25-e82c-1abe-6a0f-ff497dcda23b@intel.com>
 <20190927153304.GS32742@smile.fi.intel.com>
 <2e8ef4df-9c5f-f6e0-23ee-32d3bc555330@linux.intel.com>
 <CAHp75Veung3v41RMmBoQHE7TFWUccE2oXsVnNgUt0JE0naTfLw@mail.gmail.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3428d5e2-3246-7e1c-cb4d-59351193e4de@linux.intel.com>
Date: Fri, 27 Sep 2019 17:25:41 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Veung3v41RMmBoQHE7TFWUccE2oXsVnNgUt0JE0naTfLw@mail.gmail.com>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, Navid Emamdoost <emamd001@umn.edu>,
 Stephen McCamant <smccaman@umn.edu>, Kangjie Lu <kjlu@umn.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Enrico Weigelt <info@metux.net>, Navid Emamdoost <navid.emamdoost@gmail.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 9/27/19 3:39 PM, Andy Shevchenko wrote:
> On Fri, Sep 27, 2019 at 7:39 PM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.intel.com> wrote:
>>> The problem with solution #1 is freeing orphaned pointer. It will work,
>>> but it's simple is not okay from object life time prospective.
>>
>> ?? I don't get your point at all Andy.
>> Two allocations happens in a loop and if the second fails, you free the
>> first and then jump to free everything allocated in the previous
>> iterations. what am I missing?
> 
> Two things:
>   - one allocation is done with kzalloc(), while the other one with
> devm_kcalloc()
>   - due to above the ordering of resources is reversed

Ah yes, I see your point now, sorry for being thick.
Indeed it'd make sense to use devm_ for both allocations, but then the 
kfree needs to be removed in the error handling.

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
