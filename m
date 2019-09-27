Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C5827C08A7
	for <lists+alsa-devel@lfdr.de>; Fri, 27 Sep 2019 17:33:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50FA8166F;
	Fri, 27 Sep 2019 17:32:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50FA8166F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1569598405;
	bh=du7rQElwgmbwmMUZab+26LCzV9KbFzfMZQ4D3V52H8c=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=abdLBPHqUheSbOZtu1357NO8NVoYG1qXo02ChGNc1CbbW+0ZlBHA1a8LIK6FjBc0n
	 ap3bOVHS2gIcsdzdSzGkUgf3Wto4w8lkbSJS5u/dAFmPTiOhCWtC+ub+nX68FSf5ib
	 wxIwpffrq70xyZAuMTivWyOscfYAvLaOtdgZKdvY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 97097F80140;
	Fri, 27 Sep 2019 17:31:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 3F109F8049A; Fri, 27 Sep 2019 17:31:37 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 815FFF800B3
 for <alsa-devel@alsa-project.org>; Fri, 27 Sep 2019 17:31:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 815FFF800B3
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Sep 2019 08:31:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,555,1559545200"; d="scan'208";a="219816264"
Received: from crojewsk-mobl1.ger.corp.intel.com (HELO [10.252.6.245])
 ([10.252.6.245])
 by fmsmga002.fm.intel.com with ESMTP; 27 Sep 2019 08:31:27 -0700
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20190923165739.3975-1-perex@perex.cz>
From: Cezary Rojewski <cezary.rojewski@intel.com>
Message-ID: <746f82e2-0752-7476-85d7-9cabdd966caa@intel.com>
Date: Fri, 27 Sep 2019 17:31:25 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20190923165739.3975-1-perex@perex.cz>
Content-Language: en-US
Cc: Takashi Iwai <tiwai@suse.de>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: Skylake SST driver - blacklist the
 PCI device IDs for the auto probe
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

On 2019-09-23 18:57, Jaroslav Kysela wrote:
> There are basically three drivers for the PCI devices for
> the recent Intel hardware with the build-in DSPs. The legacy HDA
> driver has dmic_detect module option for the auto detection
> of the platforms with the digital microphone. Because the SOF
> driver is preferred, just skip PCI probe in the Skylake SST
> driver when the PCI device ID clashes by default. The user
> can override the auto behaviour with the pci_binding
> module parameter.
> 

Honestly, the SKL/ SOF/ legacy enumeration is complicated enough and I 
don't think it needs yet enough if or else.

On top of that, some of platforms listed here are shared by both and you 
cannot just enable SOF interface by default there.

> Boot log from Lenovo Carbon X1 (7th gen) with the default settings:
> 
>    snd_hda_intel 0000:00:1f.3: Digital mics found on Skylake+ platform, aborting probe
>    snd_soc_skl 0000:00:1f.3: SOF driver is preferred on this platform, aborting probe
>    sof-audio-pci 0000:00:1f.3: warning: No matching ASoC machine driver found
>    sof-audio-pci 0000:00:1f.3: DSP detected with PCI class/subclass/prog-if 0x040380
>    ....

> 
> Perhaps, it may be more wise to create one shared module and all
> three drivers should call the driver detection routine(s) from one
> place.
> 

This.
It is the only right path to follow.

-

In general there are greater plans ahead as cAVS interface is actually 
the preferred one. That has been already committed by Intel. The details 
of actual merge of both drivers to solve the enumeration-and-other 
issues are still being worked on as that is quite a task : )

Czarek
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
