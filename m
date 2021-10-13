Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 431A942BF95
	for <lists+alsa-devel@lfdr.de>; Wed, 13 Oct 2021 14:14:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADF861612;
	Wed, 13 Oct 2021 14:13:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADF861612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634127269;
	bh=T4fHbwbML00OHT9TYOPKQT0lMBKcM0AcH1+OTKV21a4=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eMOSRmSX3vxw8QGr4+RcxjimXcbFirbXxTROPuGA7SA7wh8AXOsFbpRSjvOTk06u5
	 W/vbJhp97F3AMlQkZ9J9yT+ezbTQJovg5hkHHxv7mMGL2rQgNTKNsp9cmqM2JFHM25
	 /LPteCUPU4WSVlm5yRdQCpDHdEZhF64YGmLKPN2U=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F256CF80088;
	Wed, 13 Oct 2021 14:13:12 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 40187F80269; Wed, 13 Oct 2021 14:13:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D4D68F80088
 for <alsa-devel@alsa-project.org>; Wed, 13 Oct 2021 14:13:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D4D68F80088
X-IronPort-AV: E=McAfee;i="6200,9189,10135"; a="227370427"
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; d="scan'208";a="227370427"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 05:13:05 -0700
X-IronPort-AV: E=Sophos;i="5.85,370,1624345200"; d="scan'208";a="626324481"
Received: from isandweg-mobl2.ger.corp.intel.com (HELO [10.249.42.37])
 ([10.249.42.37])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2021 05:13:03 -0700
Message-ID: <b58ff7ef-0987-d133-5682-a30c4c023a78@linux.intel.com>
Date: Wed, 13 Oct 2021 15:13:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3] ASoC: rt1011: Fix 'I2S Reference' enum control caused
 error
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>
References: <20211011144518.2518-1-peter.ujfalusi@linux.intel.com>
 <163403898174.2091644.13928014844510803055.b4-ty@kernel.org>
 <b4f96793-de6f-0b0e-346d-f6a53633575f@linux.intel.com>
 <YWbIbnRVHGP82N+A@sirena.org.uk>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <YWbIbnRVHGP82N+A@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: oder_chiou@realtek.com, jack.yu@realtek.com, alsa-devel@alsa-project.org,
 seppo.ingalsuo@linux.intel.com, lgirdwood@gmail.com,
 pierre-louis.bossart@linux.intel.com
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



On 13/10/2021 14:52, Mark Brown wrote:
> On Tue, Oct 12, 2021 at 02:52:11PM +0300, Péter Ujfalusi wrote:
>> On 12/10/2021 14:45, Mark Brown wrote:
> 
>>> [1/1] ASoC: rt1011: Fix 'I2S Reference' enum control caused error
>>>       commit: c3de683c4d1d68ff27f21606b921d92ffdea3352
> 
>> I have noted that this patch is not enough to fix the i2s reference
>> support and a complete patch has been already sent:
> 
>> https://lore.kernel.org/alsa-devel/20211012063113.3754-1-peter.ujfalusi@linux.intel.com/
> 
> Are you sure this isn't just b4 thinking your later version matches the
> earlier version when it's the later version that got applied (you'll
> have got multiple mails with one for the later version as well)?

linux-next has this v3 and not the the proper fix sent a bit later

>> What keyword should I use next time to 'block' a patch applied?
> 
> You can't, there's a gap between me queueing things and testing and
> pushing out and mail sent in that time might not get seen.
> 
> You should also take care that when you're sending things you're doing
> so in a standard fashion, occasionally I have seen people bury things in
> the middle of threads or whatever which causes b4 to think an earlier
> version is actually a later one.

I don't send patches as reply but in this particular case I did changed
the commit subject since the original commit adding the i2s reference
selection was mostly broken.

I can send an updated patch on top of next, but the one we have applied
only fixes the alsamixer crash, the code remains broken.

-- 
Péter
