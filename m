Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B631968E1
	for <lists+alsa-devel@lfdr.de>; Sat, 28 Mar 2020 20:17:27 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 618D91672;
	Sat, 28 Mar 2020 20:16:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 618D91672
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1585423047;
	bh=ZXUXOaFlnExVfXVu1mT/el2VFSRU8rdINHEmfVic2tI=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oBrWH9Xwnv5RbMi5ui1Oc7f76+fV4Au/iN9Cr9Sg4wD0Uv2Jq8OeDRI4Zl/0VZvuJ
	 P9U8zqENh2iD3RXciB3d+v8DU+JkxcARSGuCIc/Hjy4Fy78qzCihN2dctK0cldNq5p
	 71sKiS+N8y5AW6NTG5ieXSgXumpuCMBzACQQWAAo=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8076CF80227;
	Sat, 28 Mar 2020 20:15:46 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E2CDBF80234; Sat, 28 Mar 2020 20:15:43 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 83759F80146
 for <alsa-devel@alsa-project.org>; Sat, 28 Mar 2020 20:15:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 83759F80146
IronPort-SDR: 6Qxq5B4Syr6NY/T1/F7NtTjL3mVKF0+rNncKVO9QnCF/VoJvXT2nh1OmOwMdrhtQW4d+opu3yp
 mEmYXqd6mHcg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2020 12:15:35 -0700
IronPort-SDR: FbuZkJRFJU/dG0dgfT/vpDps/g43NOEHl0LcxwbaHFePwshTD3zYEjvsuNz36P0u+RiioqyApW
 vby1tCwXj2GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,317,1580803200"; d="scan'208";a="236958387"
Received: from unknown (HELO [10.251.234.208]) ([10.251.234.208])
 by orsmga007.jf.intel.com with ESMTP; 28 Mar 2020 12:15:34 -0700
Subject: Re: sw_params for a direct-ed(dmix) hw pcm
To: sylvain.bertrand@gmail.com, Jaroslav Kysela <perex@perex.cz>
References: <20200321155303.GB357@freedom> <20200325174419.GA1224@freedom>
 <alpine.DEB.2.21.2003261350380.2957@eliteleevi.tm.intel.com>
 <9d986c48-184a-1d6e-4c5b-172a7ecd98a8@perex.cz>
 <20200326200415.GA1321@freedom> <s5hlfnmfcdt.wl-tiwai@suse.de>
 <0b0f5117-3b4b-0c25-cd4b-0ecc72479635@perex.cz>
 <20200328182624.GA775@freedom>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <1baab0fd-d802-3707-645f-d5dc4bf6c32c@linux.intel.com>
Date: Sat, 28 Mar 2020 14:15:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200328182624.GA775@freedom>
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



On 3/28/20 1:26 PM, sylvain.bertrand@gmail.com wrote:
> On Fri, Mar 27, 2020 at 10:40:06AM +0100, Jaroslav Kysela wrote:
>> Yes, it's a bug which should be fixed in dmix instead to use a workaround in
>> the app. The easiest way is to return an error in set sw_params, but it may
>> cause problems for the app which assumes that this timestamp mode can be set
>> freely. Perhaps, we can add a timestamp translation layer (not easy, I
>> know).
> 
> I understand that, in the case of a shared hw, reasonable defaults should be
> enforce to avoid that any audio application which would be first to configure
> this hw and throwing some audio configuration tantrum, forces it upon all the
> other audio applications (this is the answer to "why has dmix some defaults?").
> 
> Speaking strictly, snd_pcm_sw_params_set_tstamp_type() has a return
> value, namely application code must expect a return code which could be an
> error code. Additionnaly an audio app using the kernel interface/a hw plugin
> pcm, would have to track anyway the type of timestamp clock at the time of state
> change: the trigger timestamp of a kernel status ioctl used the type of
> timestamp clock at the time of the state change, not the type of timestamp
> clock provided in the ioctl (btw, what about some documentation addition?).
> 
> In the use case of a shared device, it seems the right way would be to send an
> error back to the application (aka "making snd_pcm_sw_params_set_tstamp_type()
> recurse down the plugin pipeline"), because after giving some thoughts about it
> I don't see how it is possible to convert a timestamp from one clock type to
> another: backlog all adjtime deltas, plus the initial values, plus any natural
> drift? The linux devs in charge of time keeping may be able to answer this.

I don't think it's possible unless the timestamps are taken really close 
to each other. There was some work some by Chris Hall in 2016 to revisit 
how the conversions were done and the past taken into account is a 
couple of ms, see ("time: Add history to cross timestamp interface 
supporting slower devices").

if your device is "shared", which implies a mixer, the notion of precise 
timestamps is rather questionable so you might be able to get-by with 
local interpolation in your plug-ins. Trying a full-blown conversion of 
the kernel-reported time is not really useful if the mixing granularity 
is in the ms range or more.

FWIW you also want to take MONOTONIC_RAW with a grain of salt. In a 
corner case w/ long tests lasting 48 hours we saw the timestamps 
reported by the kernel drift over time. the drift was minor 
(double-digit ppb - yes parts per billion) but the fixed-point math for 
the counters at some point impacts the results. Reading directly the TSC 
from userspace and doing floating-point math bypassed the rounding errors.
