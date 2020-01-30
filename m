Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F06014DE05
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Jan 2020 16:40:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B75B71679;
	Thu, 30 Jan 2020 16:39:44 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B75B71679
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580398834;
	bh=FhsxNX/i+9RkWaC27Pnxg7bGFkqn5pCMHJJMA9yK4DU=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=D5d/LnpIqbfmM9/wfvC5wHkoWGanzVmHt0H2XJxv0LFY/ISV4g48pxOHo1C9bpBXv
	 0fL3F6/M+F7h6Psva4qpwQZv6s86eprgabeESfVEIoX9Vlwx+fFtvzw92QzFOsh8pl
	 chVpo9NA824+soRLWn/1vrbQ+07rptSIH3L1M1WU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C6D9EF80082;
	Thu, 30 Jan 2020 16:38:53 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 76041F80150; Thu, 30 Jan 2020 16:38:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCFF4F80082
 for <alsa-devel@alsa-project.org>; Thu, 30 Jan 2020 16:38:46 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DCFF4F80082
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Jan 2020 07:38:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,382,1574150400"; d="scan'208";a="224152828"
Received: from jsmesenc-mobl.amr.corp.intel.com (HELO [10.252.140.145])
 ([10.252.140.145])
 by fmsmga008.fm.intel.com with ESMTP; 30 Jan 2020 07:38:43 -0800
To: Mark Brown <broonie@kernel.org>
References: <20200129223603.2569-1-pierre-louis.bossart@linux.intel.com>
 <20200129223603.2569-2-pierre-louis.bossart@linux.intel.com>
 <20200130145548.GE6682@sirena.org.uk>
 <c6391973-fe6e-bd36-a2b5-c28cefc1ef75@linux.intel.com>
 <20200130151751.GF6682@sirena.org.uk>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <882842ba-72c2-2e32-ec9f-0b1fb3ae45e4@linux.intel.com>
Date: Thu, 30 Jan 2020 09:38:43 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200130151751.GF6682@sirena.org.uk>
Content-Language: en-US
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, Pan Xiuli <xiuli.pan@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH 1/3] ASoC: Intel: sof_pcm512x: add support
 for SOF platforms with pcm512x
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



On 1/30/20 9:17 AM, Mark Brown wrote:
> On Thu, Jan 30, 2020 at 09:14:29AM -0600, Pierre-Louis Bossart wrote:
> 
>>> These look like they might be a DAPM widget of some kind?
> 
>> it's the LED support only, turned on when you play and off when you stop.
>> At some point, I added a gpiochip support in the PCM152x codec driver to
>> avoid doing this, and have a nicer way of toggling the gpios. Due to lack of
>> time, I didn't maintain this solution, but we could add it in a follow-up
>> version if that was desired. It's really not the main functionality of this
>> patch.
> 
> Followup seems fine.

ok, will work on it, I haven't changed the code since December 2018
https://github.com/plbossart/sound/commits/hifiberry/gpios

Another thing I didn't complete is the support for the codec master 
mode, which would be needed for the Hifiberry DAC+ PRO versions (they 
have 2 oscillators for 44.1 and 48kHz support). It's a bit of a 
chicken-and-egg, during the probe the codec driver requests an mclk but 
in the case of the hifiberry the mclk is actually enabled at the codec 
level with a GPIO selection. I never found a clean way to do this, or an 
example where the clock consumer is also the clock provider. So far we 
only use these PRO boards in codec slave mode, which is a bit of a 
waste. For once we have good clocks, we should really use them...
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
