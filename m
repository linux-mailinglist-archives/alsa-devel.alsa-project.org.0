Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 19CFF4242E4
	for <lists+alsa-devel@lfdr.de>; Wed,  6 Oct 2021 18:40:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9D7E2820;
	Wed,  6 Oct 2021 18:39:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9D7E2820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1633538414;
	bh=n9TA7OTCfb7pE5hCAtRZXaJ8S/lQSUuaNJIqgvG22r0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEGP0jJEe5TUtHGzz0hPIL8nARzrUEGKk0uEldleSwSwBKOtT1bCP5uzWFWOTXfmO
	 W5gjWLoNjELk86PcXfGYLLQ98Zdsvw/uPeM8qP9/cbntUf9TEClNWrudLcWf/sjH/l
	 XsOKryciEgk6l1uVXjKPgPmekdAIAoYFrApJzZO4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2355FF8010B;
	Wed,  6 Oct 2021 18:38:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1315BF8010B; Wed,  6 Oct 2021 18:38:56 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=NICE_REPLY_A,PRX_BODY_65,
 SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DC2EBF8010B
 for <alsa-devel@alsa-project.org>; Wed,  6 Oct 2021 18:38:49 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC2EBF8010B
X-IronPort-AV: E=McAfee;i="6200,9189,10129"; a="206159625"
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="206159625"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:37:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,352,1624345200"; d="scan'208";a="439181042"
Received: from nbasa-mobl2.amr.corp.intel.com (HELO [10.213.170.135])
 ([10.213.170.135])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2021 09:37:27 -0700
Subject: Re: [PATCH v1 3/4] ASoC: Intel: bytcr_rt5651: use
 devm_clk_get_optional() for mclk
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20211006150451.16561-1-andriy.shevchenko@linux.intel.com>
 <20211006150451.16561-3-andriy.shevchenko@linux.intel.com>
 <2d190513-7ac4-731c-7c9a-1f60a98f6345@linux.intel.com>
 <YV3NZnb6mg43nUC1@smile.fi.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <015e084e-70ed-7b5c-b103-8426ef0842d4@linux.intel.com>
Date: Wed, 6 Oct 2021 11:37:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YV3NZnb6mg43nUC1@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Jie Yang <yang.jie@linux.intel.com>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Mark Brown <broonie@kernel.org>
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



On 10/6/21 11:23 AM, Andy Shevchenko wrote:
> On Wed, Oct 06, 2021 at 10:51:52AM -0500, Pierre-Louis Bossart wrote:
>> On 10/6/21 10:04 AM, Andy Shevchenko wrote:
>>> The devm_clk_get_optional() helper returns NULL when devm_clk_get()
>>> returns -ENOENT. This makes things slightly cleaner. The added benefit
>>> is mostly cosmetic.
> 
> ...
> 
>>>  	if (SND_SOC_DAPM_EVENT_ON(event)) {
>>> -		if (byt_rt5651_quirk & BYT_RT5651_MCLK_EN) {
>>> -			ret = clk_prepare_enable(priv->mclk);
>>> -			if (ret < 0) {
>>> -				dev_err(card->dev,
>>> -					"could not configure MCLK state");
>>> -				return ret;
>>> -			}
>>> +		ret = clk_prepare_enable(priv->mclk);
>>> +		if (ret < 0) {
>>> +			dev_err(card->dev, "could not configure MCLK state");
>>> +			return ret;
>>>  		}
>>
>> I don't get why you removed the test on the BYT_RT5651_MCLK_EN quirk,
>> see below it was designed as a fall-back mode. We don't want to return
>> an error when we know the clock is not present/desired.
> 
> Why should we do a unneeded test? When we switch to the optional, there
> will be no error from these CCF APIs. Besides that it drops indentation
> level and makes code neat.

By looking at this code only one cannot really visualize that it's a
no-op. I personally prefer to see explicit intent rather than have to
dig hundreds of lines below what this clock is optional.

I am also not even sure that in real products this clock is actually
optional, the default is to make use of it:

#define BYT_RT5651_DEFAULT_QUIRKS	(BYT_RT5651_MCLK_EN | \

and the only platform without this clock is "Minnowboard Max B3" -
probably not used by anyone. I fried mine a long time ago.

We'd need to Hans to comment on this since he's really the only one
maintaining this code.

> ...
> 
>> same here, why was the quirk removed?
> 
> Same answer.
> 
> ...
> 
>> that part in the probe looks fine, but the changes above are controversial.
> 
> I didn't get. How controversial? Why? The whole point of _optional is to get
> rid of unneeded checks (since they are _anyway_ be called).

It's inconsistent since you kept the following part but no longer use it:

+		/*
+		 * Fall back to bit clock usage when clock is not
+		 * available likely due to missing dependencies.
+		 */
+		if (!priv->mclk)
+			byt_rt5651_quirk &= ~BYT_RT5651_MCLK_EN;



