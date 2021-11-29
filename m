Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 229A4461BD2
	for <lists+alsa-devel@lfdr.de>; Mon, 29 Nov 2021 17:35:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B35291AF0;
	Mon, 29 Nov 2021 17:34:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B35291AF0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1638203740;
	bh=KJ+8Sud1eZpxEv3q6NsRe/B4of5h6qlxtUiOXtOY0XA=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kMfqPSI26oTEfEMJhNad8veZEfUk1V067VjIzyi4f6juylit2T7Vb0J/dDblIeJVN
	 5TkLq4X+X++Om5ENIO9NcjITeRbQ9NKooUJMoSQHNkT8E3bTKeI+bVT6lK196E0DtH
	 bUTPvfWqXNHg9oLliO5Ihv75kXu4f7VkW9jURZlo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 631B8F80508;
	Mon, 29 Nov 2021 17:33:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5AA5EF8050F; Mon, 29 Nov 2021 17:32:58 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 88A5DF80246
 for <alsa-devel@alsa-project.org>; Mon, 29 Nov 2021 17:32:43 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 88A5DF80246
X-IronPort-AV: E=McAfee;i="6200,9189,10183"; a="322241120"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="322241120"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 08:32:10 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="676418513"
Received: from ticela-nm-11.amr.corp.intel.com (HELO [10.212.98.225])
 ([10.212.98.225])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 08:32:09 -0800
Subject: Re: ALSA: hda: Make proper use of timecounter
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
References: <871r35kwji.ffs@tglx>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <4c1b9ecd-cefe-f890-f309-39d602201d58@linux.intel.com>
Date: Mon, 29 Nov 2021 10:06:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <871r35kwji.ffs@tglx>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
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



On 11/24/21 4:40 PM, Thomas Gleixner wrote:
> HDA uses a timecounter to read a hardware clock running at 24 MHz. The
> conversion factor is set with a mult value of 125 and a shift value of 0,
> which is not converting the hardware clock to nanoseconds, it is converting
> to 1/3 nanoseconds because the conversion factor from 24Mhz to nanoseconds
> is 125/3. The usage sites divide the "nanoseconds" value returned by
> timecounter_read() by 3 to get a real nanoseconds value.
> 
> There is a lengthy comment in azx_timecounter_init() explaining this
> choice. That comment makes blatantly wrong assumptions about how
> timecounters work and what can overflow.
> 
> The comment says:
> 
>      * Applying the 1/3 factor as part of the multiplication
>      * requires at least 20 bits for a decent precision, however
>      * overflows occur after about 4 hours or less, not a option.
> 
> timecounters operate on time deltas between two readouts of a clock and use
> the mult/shift pair to calculate a precise nanoseconds value:
> 
>     delta_nsec = (delta_clock * mult) >> shift;
> 
> The fractional part is also taken into account and preserved to prevent
> accumulated rounding errors. For details see cyclecounter_cyc2ns().
> 
> The mult/shift pair has to be chosen so that the multiplication of the
> maximum expected delta value does not result in a 64bit overflow. As the
> counter wraps around on 32bit, the maximum observable delta between two
> reads is (1 << 32) - 1 which is about 178.9 seconds.
> 
> That in turn means the maximum multiplication factor which fits into an u32
> will not cause a 64bit overflow ever because it's guaranteed that:
> 
>      ((1 << 32) - 1) ^ 2 < (1 << 64)
> 
> The resulting correct multiplication factor is 2796202667 and the shift
> value is 26, i.e. 26 bit precision. The overflow of the multiplication
> would happen exactly at a clock readout delta of 6597069765 which is way
> after the wrap around of the hardware clock at around 274.8 seconds which
> is off from the claimed 4 hours by more than an order of magnitude.
> 
> If the counter ever wraps around the last read value then the calculation
> is off by the number of wrap arounds times 178.9 seconds because the
> overflow cannot be observed.
> 
> Use clocks_calc_mult_shift(), which calculates the most accurate mult/shift
> pair based on the given clock frequency, and remove the bogus comment along
> with the divisions at the readout sites.
> 
> Fixes: 5d890f591d15 ("ALSA: hda: support for wallclock timestamps")
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

I don't recall the reason of why I added separate steps for
multiplication by 125 and division by 3 back in 2012, but obviously they
weren't aligned with my own comment "Max buffer time is limited to 178
seconds to make sure wall clock counter does not overflow".

Thanks for the patch, much appreciated.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

