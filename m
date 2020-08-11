Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8A3241EB9
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 18:56:41 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ADA0C1664;
	Tue, 11 Aug 2020 18:55:50 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ADA0C1664
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597165000;
	bh=lxmc9DXaN8Dxl4oww7Cb/ch/PTcz0Rl7FJyUH20ZR9I=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=p7v4aIV9LTaBohKH2s/p9gaMokLkuY7QKpmSxKqf9KJF4Qi/yZmSLADBP5loeglBr
	 ftEZDKxeC3SCDY0pnibznTLBx4LpD/pdeOJwzf5MngYQDYoj6+ea3jW8HOuFadz7kS
	 MtMlWLbYGomzp7jsOog62BG9cmzx2Cx8wQB7PWoE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C5A10F80161;
	Tue, 11 Aug 2020 18:54:59 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7196CF8015B; Tue, 11 Aug 2020 18:54:57 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 441D3F80118
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 18:54:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 441D3F80118
IronPort-SDR: ElBcUIu1r8pbrZiWDblmzD1U3wYkOeXYYHVEqHuYs1uyDDTRbqQmYEg/A2q4kVvpIOEs/qpXrD
 7qMz0///XbRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="151446947"
X-IronPort-AV: E=Sophos;i="5.76,301,1592895600"; d="scan'208";a="151446947"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 09:54:41 -0700
IronPort-SDR: R+rgW4VXEi6GPdVsNSPPelRJdde1YATjsp7hTZyCXnQW5hDkJKLhGtxzcFZx76HOtN6UvBV43J
 NaFi2AsXBeTA==
X-IronPort-AV: E=Sophos;i="5.76,301,1592895600"; d="scan'208";a="495211140"
Received: from lwhitehe-mobl.amr.corp.intel.com (HELO [10.212.97.49])
 ([10.212.97.49])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Aug 2020 09:54:39 -0700
Subject: Re: [PATCH v3 2/2] ASoC: Intel: Add period size constraint on strago
 board
To: Mark Brown <broonie@kernel.org>, Yu-Hsuan Hsu <yuhsuan@chromium.org>
References: <6466847a-8aae-24f7-d727-36ba75e95f98@linux.intel.com>
 <DM6PR11MB364259049769F6EF3B84AABD97480@DM6PR11MB3642.namprd11.prod.outlook.com>
 <3f3baf5e-f73d-9cd6-cbfb-36746071e126@linux.intel.com>
 <CAGvk5PohOP0Yv22tb53EX=ZLB9_vOMb=iujTh64OvHmjC1d4mg@mail.gmail.com>
 <DM6PR11MB3642AC7F8EC47EB48B384D4797450@DM6PR11MB3642.namprd11.prod.outlook.com>
 <CAGvk5PogmqfEnFRA8hzby+AGgbOSvbELamh_1=eA9KTpyBMPYQ@mail.gmail.com>
 <s5htux939x1.wl-tiwai@suse.de>
 <CAGvk5PpcmkZ2HarqeCDaXm4id=84wYs-u4vWxJunHaf09gj66g@mail.gmail.com>
 <s5ho8nh37br.wl-tiwai@suse.de>
 <CAGvk5PphzkdiNfW8hiDuqX+2eQO2FvrpzA0qR3=3VvqM3GBhAA@mail.gmail.com>
 <20200811145353.GG6967@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <d78f9adc-d583-f0f2-ce38-3c9175c939b8@linux.intel.com>
Date: Tue, 11 Aug 2020 11:54:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811145353.GG6967@sirena.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jie Yang <yang.jie@linux.intel.com>, "Rojewski,
 Cezary" <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Sam McNally <sammc@chromium.org>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Daniel Stuart <daniel.stuart14@gmail.com>,
 "yuhsuan@google.com" <yuhsuan@google.com>, "Lu, Brent" <brent.lu@intel.com>,
 Damian van Soelen <dj.vsoelen@gmail.com>
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


>>> ... Why only 240?  That's the next logical question.
>>> If you have a clarification for it, it may be the rigid reason to
>>> introduce such a hw constraint.
> 
>> According to Brent, the DSP is using 240 period regardless the
>> hw_param. If the period size is 256, DSP will read 256 samples each
>> time but only consume 240 samples until the ring buffer of DSP is
>> full. This behavior makes the samples in the ring buffer of kernel
>> consumed quickly.
> 
>> Not sure whether the explanation is correct. Hi Brent, can you confirm it?
> 
> This seems to be going round and round in circles.  Userspace lets the
> kernel pick the period size, if the period size isn't 240 (or a multiple
> of it?) the DSP doesn't properly pay attention to that apparently due to
> internal hard coding in the DSP firmware which we can't change so the
> constraint logic needs to know about this DSP limitation - it seems like
> none of this is going to change without something new going into the
> mix?  We at least need a new question to ask about the DSP firmware I
> think.

I just tested aplay -Dhw: on a Cyan Chromebook with the Ubuntu kernel 
5.4, and I see no issues with the 240 sample period. Same with 432, 960, 
9600, etc.

I also tried just for fun what happens with 256 samples, and I don't see 
any underflows thrown either, so I am wondering what exactly the problem 
is? Something's not adding up. I would definitively favor multiple of 
1ms periods, since it's the only case that was productized, but there's 
got to me something a side effect of how CRAS programs the hw_params.

root@chrx:~# aplay -Dhw:0,0 --period-size=240 --buffer-size=480 -v 1.wav
Playing WAVE '1.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
Hardware PCM card 0 'chtmax98090' device 0 subdevice 0
Its setup is:
   stream       : PLAYBACK
   access       : RW_INTERLEAVED
   format       : S16_LE
   subformat    : STD
   channels     : 2
   rate         : 48000
   exact rate   : 48000 (48000/1)
   msbits       : 16
   buffer_size  : 480
   period_size  : 240
   period_time  : 5000
   tstamp_mode  : NONE
   tstamp_type  : MONOTONIC
   period_step  : 1
   avail_min    : 240
   period_event : 0
   start_threshold  : 480
   stop_threshold   : 480
   silence_threshold: 0
   silence_size : 0
   boundary     : 8646911284551352320
   appl_ptr     : 0
   hw_ptr       : 0

root@chrx:~# aplay -Dhw:0,0 --period-size=256 --buffer-size=512 -v 1.wav
Playing WAVE '1.wav' : Signed 16 bit Little Endian, Rate 48000 Hz, Stereo
Hardware PCM card 0 'chtmax98090' device 0 subdevice 0
Its setup is:
   stream       : PLAYBACK
   access       : RW_INTERLEAVED
   format       : S16_LE
   subformat    : STD
   channels     : 2
   rate         : 48000
   exact rate   : 48000 (48000/1)
   msbits       : 16
   buffer_size  : 512
   period_size  : 256
   period_time  : 5333
   tstamp_mode  : NONE
   tstamp_type  : MONOTONIC
   period_step  : 1
   avail_min    : 256
   period_event : 0
   start_threshold  : 512
   stop_threshold   : 512
   silence_threshold: 0
   silence_size : 0
   boundary     : 4611686018427387904
   appl_ptr     : 0
   hw_ptr       : 0


