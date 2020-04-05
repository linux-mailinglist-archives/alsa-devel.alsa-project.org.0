Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9A819EEB2
	for <lists+alsa-devel@lfdr.de>; Mon,  6 Apr 2020 01:52:47 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id BAC221660;
	Mon,  6 Apr 2020 01:51:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz BAC221660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1586130766;
	bh=16OpPYwPMRdzFmmKY8d2HlrnKAcdShren9QBK4jAbq4=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NJV18y8pw8FKKFXL0eC6a9OfDeEMd6tZoy+ClQZCdYtq2qPzbmy5HA1daAEAi73qm
	 uZfmcvfmnVnXXMOgeNBYk5Suz9VDO1377/OyEbfKqsWWmpAHPTlzY++B8GZr3+omgM
	 fG1gxVJeMIlyyk2CV4aXeZ8wXbOMT9xDi1K1H3o0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF6F1F801DA;
	Mon,  6 Apr 2020 01:51:05 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 509D2F801DA; Mon,  6 Apr 2020 01:51:02 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 70F76F80058
 for <alsa-devel@alsa-project.org>; Mon,  6 Apr 2020 01:50:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 70F76F80058
IronPort-SDR: Bgc7xU6uRslUSGniNRivMgcNG+nv0ilwktjukibf2/7pjvsd0Npjvtf9gB0N/y+1HgAMcRgSkg
 P1xDvOufrsuA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2020 16:50:53 -0700
IronPort-SDR: e0Z+hUnwpMG43shiVck803kEt5nPO5j6lIc58BqxfeS+MBttSFPIVskYe+8Ro8LL9sKeayW9Zm
 gbHjbZs8xR9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,349,1580803200"; d="scan'208";a="253949529"
Received: from tecook-mobl1.amr.corp.intel.com (HELO [10.212.185.245])
 ([10.212.185.245])
 by orsmga006.jf.intel.com with ESMTP; 05 Apr 2020 16:50:52 -0700
Subject: Re: [PATCH 3/4] ASoC: Intel: bdw-rt5677: Remove ignore_suspend flag
 from SSP0 dai link
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20200319204947.18963-1-cezary.rojewski@intel.com>
 <20200319204947.18963-4-cezary.rojewski@intel.com>
 <dea20cf7-f324-a933-8f8e-e70a4dffa249@linux.intel.com>
 <259cbb60-9e59-1132-8371-83f837577f86@redhat.com>
 <fdb1f5f5-53a2-f1ae-c193-145c8a7f4f42@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <3af264d9-7064-dad4-b937-af45ffad4e65@linux.intel.com>
Date: Sun, 5 Apr 2020 18:11:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <fdb1f5f5-53a2-f1ae-c193-145c8a7f4f42@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Curtis Malainey <cujomalainey@google.com>, tiwai@suse.com,
 Dominik Brodowski <linux@dominikbrodowski.net>, lgirdwood@gmail.com,
 vkoul@kernel.org, broonie@kernel.org, Ben Zhang <benzh@google.com>
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


> 
> I just noticed something which is somewhat related to this
> discussion (and also somewhat off topic).
> 
> I just noticed on a Bay Trail device with a RT5672 codec
> and on a Cherry Trail device with a RT5645 codec that
> if an input / recording audio stream is active while
> suspending the tablet, then after resume audio is broken,
> playback seems to work (audio samples get consumed at normal
> speed) but it is silent.  Recording also is broken, not
> sure if it is broken, or just silent too.
> 
> When this happens, closing all apps which consume audio
> and waiting 5 seconds for a runtime-suspend to kick in
> fixes things. After this both record and playback
> works again.
> 
> Any idea what the cause for this problem might be?

Power management for the Atom/sst stuff is far from clear for me, it 
uses .prepare/.complete callbacks where 
snd_soc_suspend()/poweroff()/resume() are invoked, so there's a bit of 
confusion IMO between that the framework does and what the driver should do.

It's also unclear to me why the INFO_RESUME flag was set, since the 
driver cannot restart from the same position.

I would try and triangulate with the more traditional bytcr-rt5640, to 
rule out a codec-specific or machine driver issue (handling of rt5645 
and 5672 was done by different people and the machine driver is quite 
different).

I would also remove the INFO_RESUME, that will force the ALSA core to 
call the .prepare steps and maybe restore settings that are not applied 
with the current resume.

Either way, it's a bit of a shot in the dark :-(

My 2 cents
-Pierre
