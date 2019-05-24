Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D3D4298C3
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 15:19:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB43216FD;
	Fri, 24 May 2019 15:19:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB43216FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558703990;
	bh=TFX4pHKLEJMEUSSb2V9aqEpNDvZhYi61xUg8s1tTom4=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=jOMeH/gD/r9wFI3EPXJBEfhosdYiKPhNdENO8a7QSkWuTxgSSt7MSBmPZwDNGkOzt
	 A/XdYXHZuLxOQL6s/bfCU8u6+nwwodkSrgde6UaPx3bXJ3azwGUajZLv8F+EuQbweW
	 s9Ejc6F5pLu6PFmgv4nADmrmez9oRFtCkFRJwusU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CD864F89673;
	Fri, 24 May 2019 15:18:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 936E3F89636; Fri, 24 May 2019 15:18:42 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F111AF806F7
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 15:18:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F111AF806F7
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 06:18:37 -0700
X-ExtLoop1: 1
Received: from mgastonx-mobl.amr.corp.intel.com (HELO [10.251.128.35])
 ([10.251.128.35])
 by orsmga003.jf.intel.com with ESMTP; 24 May 2019 06:18:37 -0700
To: Takashi Iwai <tiwai@suse.de>
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
 <20190523233951.31122-6-pierre-louis.bossart@linux.intel.com>
 <s5hlfywe15c.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3b8a3259-df2a-26b9-ae7e-b32bb036245a@linux.intel.com>
Date: Fri, 24 May 2019 08:18:36 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5hlfywe15c.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [RFC PATCH 5/6] ALSA / hda: stop probe if DMICS
 are detected on Skylake+ platforms
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



On 5/24/19 2:56 AM, Takashi Iwai wrote:
> On Fri, 24 May 2019 01:39:50 +0200,
> Pierre-Louis Bossart wrote:
>>
>> The legacy HD-Audio driver cannot handle Skylake+ platforms with
>> digital microphones. For those platforms, the SOF driver needs to be
>> used.
>>
>> Use the common intel-nhlt module to stop the probe when the DSP is
>> enabled and DMICs are exposed in the NHTL tables.
>>
>> Note: This assumes that the BIOS information is correct, and
>> additional testing is required to see on which platforms the detection
>> is a false positive.
>>
>> FIXME: I need to find what is the mirror of azx_create() to free all
>> the resources on exit.
> 
> azx_free() does the whole, so just goto out_free should suffice.

ok, thanks for the feedback!
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
