Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A71FC0620
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 15:15:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8F5E71672;
	Fri, 27 Sep 2019 15:15:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8F5E71672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569590153;
	bh=+fvhwM254hKRm1QIk7KTqTOiRdjc8MBaQs52aW2EdHY=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Svzf7pDrQt/2Rwe2SrBFMNo30YsAccPTuLx+9T3gusEjEhdrSVf7ITHYq9HdkAHp1
	 xf2JmUgXVJ7a9nRiMm6CtV9iTcXcbHWWiiSBZBCLGEw5q/XimkwosdUj9Phx80nHNj
	 rvg42pQDnPFg5UG3InEtuMBekoJ3JiNT3MY2ND1A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 24651F804CA;
	Fri, 27 Sep 2019 15:14:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DA127F8049A; Fri, 27 Sep 2019 15:14:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 47480F80138
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 15:14:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 47480F80138
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 06:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,555,1559545200"; d="scan'208";a="183972918"
Received: from linux.intel.com ([10.54.29.200])
 by orsmga008.jf.intel.com with ESMTP; 27 Sep 2019 06:13:59 -0700
Received: from jastaffa-mobl3.amr.corp.intel.com (unknown [10.251.18.83])
 by linux.intel.com (Postfix) with ESMTP id 661845801E6;
 Fri, 27 Sep 2019 06:13:58 -0700 (PDT)
To: Navid Emamdoost <navid.emamdoost@gmail.com>
References: <20190925161922.22479-1-navid.emamdoost@gmail.com>
 <13f4bd40-dbaa-e24e-edca-4b4acff9d9c5@linux.intel.com>
 <20190927025526.GD22969@cs-dulles.cs.umn.edu>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <dc68e0dc-9a8e-cc52-c560-3e86c783dbb3@linux.intel.com>
Date: Fri, 27 Sep 2019 08:14:00 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190927025526.GD22969@cs-dulles.cs.umn.edu>
Content-Language: en-US
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kjlu@umn.edu,
 Mark Brown <broonie@kernel.org>, Jie Yang <yang.jie@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 emamd001@umn.edu, smccaman@umn.edu, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Enrico Weigelt <info@metux.net>, linux-kernel@vger.kernel.org
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

On 9/26/19 9:55 PM, Navid Emamdoost wrote:
> On Wed, Sep 25, 2019 at 12:05:28PM -0500, Pierre-Louis Bossart wrote:
>> On 9/25/19 11:19 AM, Navid Emamdoost wrote:
>>> In snd_skl_parse_uuids if allocation for module->instance_id fails, the
>>> allocated memory for module shoulde be released. I changes the
>>> allocation for module to use devm_kzalloc to be resource_managed
>>> allocation and avoid the release in error path.
>>
>> if you use devm_, don't you need to fix the error path as well then, I see a
>> kfree(uuid) in skl_freeup_uuid_list().
>>
>> I am not very familiar with this code but the error seems to be that the
>> list_add_tail() is called after the module->instance_id is allocated, so
>> there is a risk that the module allocated earlier is not freed (since it's
>> not yet added to the list). Freeing the module as done in patch 1 works,
>> using devm_ without fixing the error path does not seem correct to me.
>>
> Thanks for the feedback, then it's your call if you can accept patch 1 as
> fix.

Cezary, it's really your call.

> Navid.
>>>
>>> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
>>> ---
>>> Changes in v2:
>>> 	- Changed the allocation for module from kzalloc to devm_kzalloc
>>> ---
>>>    sound/soc/intel/skylake/skl-sst-utils.c | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/sound/soc/intel/skylake/skl-sst-utils.c b/sound/soc/intel/skylake/skl-sst-utils.c
>>> index d43cbf4a71ef..ac37f04b0eea 100644
>>> --- a/sound/soc/intel/skylake/skl-sst-utils.c
>>> +++ b/sound/soc/intel/skylake/skl-sst-utils.c
>>> @@ -284,7 +284,7 @@ int snd_skl_parse_uuids(struct sst_dsp *ctx, const struct firmware *fw,
>>>    	 */
>>>    	for (i = 0; i < num_entry; i++, mod_entry++) {
>>> -		module = kzalloc(sizeof(*module), GFP_KERNEL);
>>> +		module = devm_kzalloc(ctx->dev, sizeof(*module), GFP_KERNEL);
>>>    		if (!module) {
>>>    			ret = -ENOMEM;
>>>    			goto free_uuid_list;
>>>
>>

_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
