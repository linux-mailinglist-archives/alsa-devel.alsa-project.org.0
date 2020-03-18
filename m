Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 092F218981D
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Mar 2020 10:43:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9EA921755;
	Wed, 18 Mar 2020 10:42:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9EA921755
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584524617;
	bh=KA6kxYjRiaC7bOQKke1gGoL6RGTSHP3JuvmCUiV5Ec0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o3na7FmLxYJGO8QZXdUe168QiJKtBR2su6+Pc299P5a2CZgmLCVcL+zFQ6fP3cBbR
	 Nbn9zjzRaQHxNKt9p5Ohj8yYL4D00q9mcvkdPM4QYy6vaxecH4oKVGHWHBzbPPFrU6
	 cjQzUmZprMdacHowHAZiHDfbHCCusirNpBo0/RsY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 839E9F80132;
	Wed, 18 Mar 2020 10:41:56 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D6E4F80139; Wed, 18 Mar 2020 10:41:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 12580F800B7
 for <alsa-devel@alsa-project.org>; Wed, 18 Mar 2020 10:41:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 12580F800B7
IronPort-SDR: hsc+gA7eQGDeOcptvFFN1XRF1Y36dlEZYoYn8WV8DgLjRbXvzSi5B/QNbHt1HW5oD26C4wUE98
 CrlPAq9OfqtQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2020 02:41:46 -0700
IronPort-SDR: ORroYAM1KHIe5G6nl1CYBrtbrzPa8jYhFyIQ6qqrD+QGHGs+Q8O/LQlNvfrX8z0P0CccpA88s0
 Om4sJrb4I/Sw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,566,1574150400"; d="scan'208";a="248117273"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.249.155.222])
 ([10.249.155.222])
 by orsmga006.jf.intel.com with ESMTP; 18 Mar 2020 02:41:43 -0700
Subject: Re: snd_hda_intel/sst-acpi sound breakage on suspend/resume since
 5.6-rc1
To: Dominik Brodowski <linux@dominikbrodowski.net>, tiwai@suse.com
References: <20200318063022.GA116342@light.dominikbrodowski.net>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <66c719b3-a66e-6a9f-fab8-721ba48d7ad8@intel.com>
Date: Wed, 18 Mar 2020 10:41:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200318063022.GA116342@light.dominikbrodowski.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 yang.jie@linux.intel.com, pierre-louis.bossart@linux.intel.com,
 liam.r.girdwood@linux.intel.com, broonie@kernel.org
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

On 2020-03-18 07:30, Dominik Brodowski wrote:
> Hi!
> 
> While 5.5.x works fine, mainline as of ac309e7744be (v5.6-rc6+) causes me
> some sound-related trouble: after boot, the sound works fine -- but once I
> suspend and resume my broadwell-based XPS13, I need to switch to headphone
> and back to speaker to hear something. But what I hear isn't music but
> garbled output.
> 
> A few dmesg snippets from v5.6-rc6-9-gac309e7744be which might be of
> interest. I've highlighted the lines differing from v.5.5.x which might be
> of special interest:
> 

Thank you for the report, Dominik. You definitely got our attention.

I've checked the market: Dell XPS 13 9343, yes? Once you confirm model 
id, I'll order a piece immediately to our site.

In regard to logs, thanks for highlighting important lines. Build is of 
'rc' so bugs can still be in plenty - any reason for switching to 
cutting-edge kernel on production stuff? Our CI didn't detect any 
anomalies yet as it is running on 5.5.

I'll direct your ticket on todays meeting. On the first look, issue 
seems to be connected with recent changes to /drivers/dma/dmaengine.c. 
DesignWare DMA controller drv - which HSW/BDW makes use of - might not 
have been updated accordingly. Will dig further on that.

One more, just to make it clear for the rest of the viewers:

 > 	haswell-pcm-audio haswell-pcm-audio: Direct firmware load for 
intel/IntcPP01.bin failed with error -2
 > 	haswell-pcm-audio haswell-pcm-audio: fw image intel/IntcPP01.bin not 
available(-2)

Back in the ancient days of DSP (HSW/BDW are actually the very first 
audio DSP hws for Intel) topology was part of FW - SW could not 
configure it and probably that's why library IntcPP01 is attempted to be 
loaded on every boot, even if it's not part of configuration for given 
hw. Maybe we could make it quieter though..

> 
> (these last two messages already are printed a couple of time after boot, and then
> again during a suspend/resume cycle. On v.5.5.y, there are similar messages
> "no context buffer need to restore!"). Everything is built-in, no modules
> are loaded.
> 
> Unfortunately, I cannot bisect this issue easily -- i915 was broken for
> quite some time on this system[*], prohibiting boot...

Hmm, sounds like that issue is quite old. DSP for Haswell and Broadwell 
is available for I2S devices only, so this relates directly to legacy 
HDA driver. Compared to Skylake+, HDAudio controller for older platforms 
is found within GPU. My advice is to notify the DRM guys about this issue.

Takashi, are you aware of problems with HDMI on HSW/ BDW or should I 
just loop Jani and other DRM peps here?

Czarek
