Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E260F233654
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jul 2020 18:09:01 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F34917C6;
	Thu, 30 Jul 2020 18:08:11 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F34917C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596125341;
	bh=QRlhryY0P4SVm2Rz55NBJaxK0FvSKI3yJgBN0yBoSt4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mAG45U9reyt5gCgFgw6MTJQK/gCqZPzGsEuXnUAv1KvLJYe4csRXEvgsGRb9HMOsZ
	 6t+nQR141CboFJdZX4F34ZMAggAl2xrNpcb6TmgXMSxMb8fqSsfLv51gbp8wXzUoZk
	 g4TXuUCU7uL/TLtAcgB7XC63YmyH7RTRyOi8Xn9Q=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A3B3DF8027B;
	Thu, 30 Jul 2020 18:06:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 338A0F80256; Thu, 30 Jul 2020 18:06:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=NICE_REPLY_A,PRX_BODY_135,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CF415F80111
 for <alsa-devel@alsa-project.org>; Thu, 30 Jul 2020 18:06:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CF415F80111
IronPort-SDR: UCFp/E70wLWBIk/+oFU7ouUWjXAksTpRANbYeZ3FniH3skXlU/2VHnuZFAHRK2I6aMMy3amHdh
 3Cnsem4uY4ag==
X-IronPort-AV: E=McAfee;i="6000,8403,9698"; a="152850167"
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="152850167"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 09:06:27 -0700
IronPort-SDR: ejShz7BMEPqgf95S0ALom3X9wqT/C/PZYI1PT1rAVp8F+2RgVitq7bjfhUSjl7ou61cA1T0jin
 8WcinSlwiMvQ==
X-IronPort-AV: E=Sophos;i="5.75,415,1589266800"; d="scan'208";a="465308149"
Received: from jrwang2-mobl.amr.corp.intel.com (HELO [10.212.82.25])
 ([10.212.82.25])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2020 09:06:25 -0700
Subject: Re: [PATCH] ASoC: core: restore dpcm flags semantics
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>
References: <20200723180533.220312-1-pierre-louis.bossart@linux.intel.com>
 <20200729154639.1983854-1-jbrunet@baylibre.com>
 <2ad13f95-434d-376a-bc38-b209623b461e@linux.intel.com>
 <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <936d6e37-0ad0-b0d7-814a-1ace12087746@linux.intel.com>
Date: Thu, 30 Jul 2020 11:06:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1jft998jbe.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Stephan Gerhold <stephan@gerhold.net>,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 zhangn1985@outlook.com, linux-amlogic@lists.infradead.org
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



On 7/30/20 4:04 AM, Jerome Brunet wrote:
> 
> On Wed 29 Jul 2020 at 17:56, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com> wrote:
> 
>> On 7/29/20 10:46 AM, Jerome Brunet wrote:
>>> commit b73287f0b0745 ('ASoC: soc-pcm: dpcm: fix playback/capture checks')
>>> changed dpcm_playback and dpcm_capture semantic by throwing an error if
>>> these flags are not aligned with DAIs capabilities on the link.
>>>
>>> The former semantic did not force the flags and DAI caps to be aligned.
>>> The flag previously allowed card drivers to disable a stream direction on
>>> a link (whether or not such feature is deemed useful).
>>>
>>> With change ('ASoC: core: use less strict tests for dailink capabilities')
>>> an error is thrown if the flags and and the DAI caps are not aligned. Those
>>> parameters were not meant to aligned initially. No technical reason was
>>> given about why cards should now be considered "broken" in such condition
>>> is not met, or why it should be considered to be an improvement to enforce
>>> that.
>>>
>>> Forcing the flags to be aligned with DAI caps just make the information
>>> the flag carry redundant with DAI caps, breaking a few cards along the way.
>>>
>>> This change drops the added error conditions and restore the initial flag
>>> semantics.
>>
>> or rather lack thereof.
> 
> Again, why ? All there is so far is your personal preference. no facts.

What would be the meaning/purpose of a dailink with .dpcm_capture set, 
with only dais that support playback only?

What would be the meaning/purpose of a dailink with .capture_only set, 
but with a dai that supports playback?

What happens if none of these flags are set?

What happens when all these flags are set?

No one seems to know, so my suggestion is to align first on consistent 
configurations, then see what can be removed.

>   * What we had gave capabilities to the link, independent of the DAI
>     components. ASoC just computes the intersection of all that to
>     determine which direction needs to be enabled. Seems rather simple
>     and straight forward.

that's what my last patch did, and when there is no intersection it 
complains. Please clarify what you expect when there is no overlap 
between dai and dailink capabilities. Keep in mind that we have a mix of 
hard-codec configuration and DT-created ones, your case is not the 
general one.

>   * It worked for every user of DPCM so a far.

Not completely true, when Morimoto-san added snd_soc_dai_stream_valid() 
it exposed tons of cases where the information on direction was not 
provided in a reliable at the DAI level. I will assert that we are still 
finding out cases with broken DAI configurations, and as a result we 
will also find broken dailink configurations. Your picture of DPCM as a 
perfectly functional system that I broke is a distortion of reality.

The reality is that we have to work in steps, first make sure all DAIs 
are properly described, then work on the dailinks and optimize at a 
later point. we will need warnings to find out what the problem cases 
are, and move slowly.

