Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9ABE4F89
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Oct 2019 16:50:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 46237184B;
	Fri, 25 Oct 2019 16:49:30 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 46237184B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1572015020;
	bh=09ypQY1uEO+UL427jAUJKic1d1RQIBEK9S7gxe2u3MU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=MUNusBZ/njMKAbiHC0NtQmj5o9CyDQTmoW5i+i0eEh+t5koA0a9VTujMolKqfVXBh
	 RoQdlfT3kgVBMOy9LVJjuhWhpMPoIjngBAl0IwI3uSbnNx10eTdThSgzXXjeVW59tG
	 L9iG6bw8CjP98U1GRVOQiWLrgUM5yUjlBB2MmoC0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AF19DF80368;
	Fri, 25 Oct 2019 16:48:35 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8C04EF8036F; Fri, 25 Oct 2019 16:48:33 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 32E97F80112
 for <alsa-devel@alsa-project.org>; Fri, 25 Oct 2019 16:48:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 32E97F80112
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 25 Oct 2019 07:48:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,229,1569308400"; d="scan'208";a="223940563"
Received: from bnail-mobl.amr.corp.intel.com (HELO [10.252.140.167])
 ([10.252.140.167])
 by fmsmga004.fm.intel.com with ESMTP; 25 Oct 2019 07:48:25 -0700
To: "Lu, Brent" <brent.lu@intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <1571994691-20199-1-git-send-email-brent.lu@intel.com>
 <3ce80285-ddb5-653d-cf60-febc9fd0bdee@linux.intel.com>
 <CF33C36214C39B4496568E5578BE70C740320822@PGSMSX108.gar.corp.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <219281e5-d685-d584-0d22-5dcf3ca2bec2@linux.intel.com>
Date: Fri, 25 Oct 2019 09:48:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CF33C36214C39B4496568E5578BE70C740320822@PGSMSX108.gar.corp.intel.com>
Content-Language: en-US
Cc: "Rojewski, Cezary" <cezary.rojewski@intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Tzung-Bi Shih <tzungbi@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Richard Fontana <rfontana@redhat.com>, Mark Brown <broonie@kernel.org>, "M,
 Naveen" <naveen.m@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 "Subhransu S . Prusty" <subhransu.s.prusty@intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: eve: implement set_bias_level
 function for rt5514
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



On 10/25/19 9:43 AM, Lu, Brent wrote:
>> On 10/25/19 4:11 AM, Brent Lu wrote:
>>> The first DMIC capture always fail (zero sequence data from PCM port)
>>> after using DSP hotwording function (i.e. Google assistant).
>>
>> Can you clarify where the DSP hotwording is done? Intel DSP or rt5514?
>>
>> Turning on the MCLK with the BIAS info might force the Intel DSP to remain
>> on, which would impact power consumption if it was supposed to remain off.
>>
> 
> Hi Pierre,
> 
> It's done in rt5514's DSP and the interface is SPI instead of I2S for the voice wake
> up function.
> 
> There is a driver rt5514-spi.c which provides platform driver and DAI. User space
> application first uses the mixer to turn on the voice wake up function:
> 
> amixer -c0 cset name='DSP Voice Wake Up' on
> 
> Then open and read data from the PCM port which goes to the SPI platform and
> dai code. Finally it uses same mixer to turn off the function and return to normal
> codec mode. The DMIC recording (from I2S) and the voice wake on function should
> be mutually exclusive according to the driver design.
> 
> In the codec driver rt5514.c there is a rt5514_set_bias_level function. It's expected to
> turn on/off mclk here according to Realtek people's say but our ssp clock requires set
> rate function to be called in advance so I implement the code in machine driver.

Can you clarify if the rt5514 needs the MCLK while it's doing the 
hotword detection?

My point is really that this patch uses a card-level BIAS indication, 
and I'd like to make sure this does not interfere with the audio DSP 
being in D3 state.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
