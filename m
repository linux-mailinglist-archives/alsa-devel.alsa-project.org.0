Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B07FC298E8
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 15:28:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 457E616FB;
	Fri, 24 May 2019 15:27:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 457E616FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558704528;
	bh=xy2omf3ZzeWndo+N4jiErmqIf3DVZPkGHifnWvyWJls=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SSR+nUTnSok/WZhA0CrfnID/amNYdpXdQ+R4PnHDWCN0MExE2nw52V2WthD9+iTlQ
	 JOhwKmdZ2gS4lSHP4osbIBs43+VpOSt46t4LltD9AuHkqGc/ViZaodi9/spGYZya08
	 NVCexx9rkf8oULOZivYMBTk9Wod0wYrqLdjNMUww=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ADAFAF89630;
	Fri, 24 May 2019 15:27:03 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CFB1EF89630; Fri, 24 May 2019 15:27:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CD4A5F80C0F
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 15:26:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CD4A5F80C0F
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 May 2019 06:26:56 -0700
X-ExtLoop1: 1
Received: from mgastonx-mobl.amr.corp.intel.com (HELO [10.251.128.35])
 ([10.251.128.35])
 by orsmga003.jf.intel.com with ESMTP; 24 May 2019 06:26:55 -0700
To: Takashi Iwai <tiwai@suse.de>
References: <20190523233951.31122-1-pierre-louis.bossart@linux.intel.com>
 <s5hk1ege12p.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <284f78d4-ec5a-0ff1-2b67-2977b3634692@linux.intel.com>
Date: Fri, 24 May 2019 08:26:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5hk1ege12p.wl-tiwai@suse.de>
Content-Language: en-US
Cc: Hui Wang <hui.wang@canonical.com>,
 Curtis Malainey <cujomalainey@google.com>, alsa-devel@alsa-project.org,
 broonie@kernel.org, Daniel Drake <drake@endlessm.com>
Subject: Re: [alsa-devel] [RFC PATCH 0/6] ALSA/HDA: abort probe when DMICs
	are detected
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



On 5/24/19 2:58 AM, Takashi Iwai wrote:
> On Fri, 24 May 2019 01:39:45 +0200,
> Pierre-Louis Bossart wrote:
>>
>> This is the second take on same problem of detecting when the HDaudio
>> legacy driver can be used and when the SST or SOF drivers are
>> required.
>>
>> The previous attempt based on a the PCI Class information was a
>> resounding failure and broke audio on Linus' laptop, so we need
>> additional information to avoid enabling a DSP-based driver without a
>> good reason to do so.
>>
>> This patchset suggests the use of the NHLT information which *in
>> theory* exposes DMIC endpoints. The legacy HDaudio driver cannot
>> handle DMICs and will not provide any capture capabilities. Since it's
>> typically the first one to probe due to the Makefile order, aborting
>> the probe will let the PCI subsystem look for the next driver which
>> hopefully will support this capability.
>>
>> I tested this patch on 5 devices (SKL, KBL, APL, GLK, WHL), three
>> without DMICs and two with, and the detection seems to work as
>> planned. I would appreciate it if HDaudio integrators and folks at
>> Google/Canonical/Endless can give this a try. As usual I expect that
>> we will have to use quirks and work-arounds, but it'd be a better idea
>> than a build-time mutual exclusion. We could also make this optional
>> (Kconfig and/or module parameters) if people prefer to muck with
>> blacklists.
>>
>> Feedback and comments welcome!
> 
> The general idea and suggested implementation look almost good to me.
> Of course we have to provide a way to override the default behavior in
> case of buggy BIOS (I bet a drink for the existence of such :)

I am not sure if it's a good idea to enable this by default, the 
experience of the first round showed it's risky to make assumptions on 
what BIOS vendors implemented.
I'd rather make this an opt-in solution for distros that have to deal 
with this conflict and don't want to use blacklists, and provide both a 
Kconfig and kernel parameter to either statically or dynamically enable 
this capability. Also this is really needed mostly with WHL+ platforms 
where a lot of vendors use DMICs, for previous generations there are 
only Chromebooks and a single-digit number of KBL devices.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
