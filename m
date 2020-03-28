Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 67E9A196988
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Mar 2020 22:36:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 1089F1672;
	Sat, 28 Mar 2020 22:35:12 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 1089F1672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585431362;
	bh=2OrJrSTnHAecCMFEyenaH1sgb1EyAzyZI4Pq+LFmBGw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A/RAPIKqY0igeeYZLHgIMXoHgfA7iW46/8cn/LabFGDI56Qa3iwf2roOa8KjaMiD1
	 xIbjUcN79tEeLTEIIZrqW6mpB9KKW6a4n96eH7Whc6hKIW1l/9eMtSAkDaOmtTsHrc
	 yynYqvXd/x90ckox6/tRB0xPapMnxxk/hr291Fk0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DFEFF80118;
	Sat, 28 Mar 2020 22:34:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2C876F80234; Sat, 28 Mar 2020 22:34:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6F38FF80146
 for <alsa-devel@alsa-project.org>; Sat, 28 Mar 2020 22:34:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6F38FF80146
IronPort-SDR: iSe+r6DTBqMYSjLdJC6vG5NBlo1Zh0E0eVIS5iXC6sFeqa3fC95xAHcMXuphnqBIr1UBL6cwFd
 9/tyhFaoBcvA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2020 14:34:03 -0700
IronPort-SDR: kFnBgwvdmFSDU0k2JDNhxwKDcx7AHg5wXybL0SIjzfNmCtmZ5feTyiJ4HE+5BE3psEojoSDaxU
 1X+ebvAwn+Gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,317,1580803200"; d="scan'208";a="236976289"
Received: from unknown (HELO [10.251.234.208]) ([10.251.234.208])
 by orsmga007.jf.intel.com with ESMTP; 28 Mar 2020 14:34:02 -0700
Subject: Re: sw_params for a direct-ed(dmix) hw pcm
To: sylvain.bertrand@gmail.com
References: <20200321155303.GB357@freedom> <20200325174419.GA1224@freedom>
 <alpine.DEB.2.21.2003261350380.2957@eliteleevi.tm.intel.com>
 <9d986c48-184a-1d6e-4c5b-172a7ecd98a8@perex.cz>
 <20200326200415.GA1321@freedom> <s5hlfnmfcdt.wl-tiwai@suse.de>
 <0b0f5117-3b4b-0c25-cd4b-0ecc72479635@perex.cz>
 <20200328182624.GA775@freedom>
 <1baab0fd-d802-3707-645f-d5dc4bf6c32c@linux.intel.com>
 <20200328203744.GA2398@freedom>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <59266c58-96d8-93e9-bc8f-86e9fccf8d60@linux.intel.com>
Date: Sat, 28 Mar 2020 16:34:01 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200328203744.GA2398@freedom>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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



On 3/28/20 3:37 PM, sylvain.bertrand@gmail.com wrote:
> On Sat, Mar 28, 2020 at 02:15:34PM -0500, Pierre-Louis Bossart wrote:
>> I don't think it's possible unless the timestamps are taken really close to
>> each other. There was some work some by Chris Hall in 2016 to revisit how
>> the conversions were done and the past taken into account is a couple of ms,
>> see ("time: Add history to cross timestamp interface supporting slower
>> devices").
>>
>> if your device is "shared", which implies a mixer, the notion of precise
>> timestamps is rather questionable so you might be able to get-by with local
>> interpolation in your plug-ins. Trying a full-blown conversion of the
>> kernel-reported time is not really useful if the mixing granularity is in
>> the ms range or more.
>>
>> FWIW you also want to take MONOTONIC_RAW with a grain of salt. In a corner
>> case w/ long tests lasting 48 hours we saw the timestamps reported by the
>> kernel drift over time. the drift was minor (double-digit ppb - yes parts
>> per billion) but the fixed-point math for the counters at some point impacts
>> the results. Reading directly the TSC from userspace and doing
>> floating-point math bypassed the rounding errors.
> 
> This is how I got into this: I was writting a naive audio application and
> arrived at the point I needed timing information to do exactly that, a rough,
> but enough, audio linear interpolation (with ffmpeg timestamp). I naively
> configured alsa to use monotonic_raw, because avoiding ntp for audio timing was
> a good idea, and when I did sample on my side the monotonic raw clock, I
> realised that everything was off 100s of ms (alsa defaults to monotonic and
> ignores monotonic_raw setting in the case of a shared device). I followed the
> white rabbit, and here I stand. The cherry on top was the inconsistency about
> the trigger timestamp (which is not meant to be close to the other timestamps).
> 
> This pushes to fix snd_pcm_sw_params_set_tstamp_type(): recursive along a pcm
> plugin "pipeline" and return an error in the case of a setting difference from
> the one chosen by dmix.
> I am not confident at all since I have only a minimal perspective on alsa.

Using MONOTONIC_RAW is very nice on paper, until you realize you can't 
program a timer using the information. You can only read the timestamp 
and not really do much if you want to sleep/wait.

In practice, if you really really need super-precise information you'll 
get use rdtsc(), and apply you own formulas. And otherwise stick with 
MONOTONIC, it's rather unlikely you will ever notice the NTP changes. 
PulseAudio, CRAS and a number of Android HALs use MONOTONIC and nobody 
ever complained.
