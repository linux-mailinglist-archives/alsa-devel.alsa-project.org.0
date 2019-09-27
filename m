Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D67FC085A
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 17:12:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 93BE11668;
	Fri, 27 Sep 2019 17:11:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 93BE11668
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569597139;
	bh=swx4EKtLQgsdgOgdFru0SxSZhYW0wRz1gV5FpCykdOE=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ojf3tE+0mGQ/IE/iEKzUJ/INfk7N1MNv/BP/tikGIuIdpJ5pSzeUB9/O+hlbLaiaL
	 LlwC2jeKoo17spIPjs+6lKTABc/awNq4DmggQM5Yp4n9vpIfYXW1EPESHJIsVE8crg
	 J+ny8yaGzhmbfHXFazEgs4rD/f4zeluI8ofcrefo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 07AF1F80140;
	Fri, 27 Sep 2019 17:10:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D50FF8049A; Fri, 27 Sep 2019 17:10:32 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6A710F80140
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 17:10:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6A710F80140
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 08:10:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,555,1559545200"; d="scan'208";a="219808427"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.6.245])
 ([10.252.6.245])
 by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2019 08:10:20 -0700
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Navid Emamdoost <navid.emamdoost@gmail.com>
References: <20190925161922.22479-1-navid.emamdoost@gmail.com>
 <13f4bd40-dbaa-e24e-edca-4b4acff9d9c5@linux.intel.com>
 <20190927025526.GD22969@cs-dulles.cs.umn.edu>
 <dc68e0dc-9a8e-cc52-c560-3e86c783dbb3@linux.intel.com>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <6966df25-e82c-1abe-6a0f-ff497dcda23b@intel.com>
Date: Fri, 27 Sep 2019 17:10:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <dc68e0dc-9a8e-cc52-c560-3e86c783dbb3@linux.intel.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kjlu@umn.edu,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>, smccaman@umn.edu,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Enrico Weigelt <info@metux.net>, linux-kernel@vger.kernel.org,
 emamd001@umn.edu
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

On 2019-09-27 15:14, Pierre-Louis Bossart wrote:
> On 9/26/19 9:55 PM, Navid Emamdoost wrote:
>> On Wed, Sep 25, 2019 at 12:05:28PM -0500, Pierre-Louis Bossart wrote:
>>> On 9/25/19 11:19 AM, Navid Emamdoost wrote:
>>>> In snd_skl_parse_uuids if allocation for module->instance_id fails, the
>>>> allocated memory for module shoulde be released. I changes the
>>>> allocation for module to use devm_kzalloc to be resource_managed
>>>> allocation and avoid the release in error path.
>>>
>>> if you use devm_, don't you need to fix the error path as well then, 
>>> I see a
>>> kfree(uuid) in skl_freeup_uuid_list().
>>>
>>> I am not very familiar with this code but the error seems to be that the
>>> list_add_tail() is called after the module->instance_id is allocated, so
>>> there is a risk that the module allocated earlier is not freed (since 
>>> it's
>>> not yet added to the list). Freeing the module as done in patch 1 works,
>>> using devm_ without fixing the error path does not seem correct to me.
>>>

Good catch, Pierre.

>> Thanks for the feedback, then it's your call if you can accept patch 1 as
>> fix.
> 
> Cezary, it's really your call.
> 

Actually, not the best person to ask about "objective decisions" here as 
my vision is clouded by changes done internally. This code no longer 
exists in our internal repo. It's better for host to send MODULE_INFO 
request rather than understanding firmware binary structure and parse it 
directly.

I'm fine with solution #1 as I guess asking to wait for refactor is not 
an option. Code deployment is delayed due to range of administrative 
decisions, some of which should be uncovered on alsa-devel soon enough.

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
