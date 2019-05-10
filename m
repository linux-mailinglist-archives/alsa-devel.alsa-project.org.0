Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C91DE1A2C0
	for <lists+alsa-devel@lfdr.de>; Fri, 10 May 2019 19:59:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 19DCB18B2;
	Fri, 10 May 2019 19:58:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 19DCB18B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1557511146;
	bh=JJNrp5fu7ReiBzDNy390BYkQrFgSMO54Tebu3PjmvOM=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FfQ14ICrPOJr2SBHcXQQkNzo0yIaLBLoCh8oRkuEiDODPMTr/ya3DCrS75H3sxjFi
	 EYI9ta1l+J4WkMmy2wHhu1FYKp2F0it0ekFB9Z+PqiX/2yQNqreXk791yaK/jlzjpo
	 oCsnXm7iVqb3Y/SRmkLbzwCANm3Cwa7+aHgDYx44=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4B49EF896FD;
	Fri, 10 May 2019 19:57:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BA334F896FD; Fri, 10 May 2019 19:57:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=PRX_BODY_72,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8ABF0F8073C
 for <alsa-devel@alsa-project.org>; Fri, 10 May 2019 19:57:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8ABF0F8073C
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 May 2019 10:57:12 -0700
X-ExtLoop1: 1
Received: from linux.intel.com ([10.54.29.200])
 by orsmga005.jf.intel.com with ESMTP; 10 May 2019 10:57:12 -0700
Received: from khbyers-mobl2.amr.corp.intel.com (unknown [10.251.29.37])
 by linux.intel.com (Postfix) with ESMTP id CC36C580482;
 Fri, 10 May 2019 10:57:11 -0700 (PDT)
To: Takashi Iwai <tiwai@suse.de>
References: <20190510023657.8960-1-yuehaibing@huawei.com>
 <s5h7eayn5or.wl-tiwai@suse.de>
 <73c6dd27-895a-adba-a4ef-2992266fcc48@linux.intel.com>
 <s5hlfzempf0.wl-tiwai@suse.de>
 <1e7e1908-a813-6c9b-5b88-122864d3a372@linux.intel.com>
 <s5hbm0amnpl.wl-tiwai@suse.de> <s5h8svemn0u.wl-tiwai@suse.de>
 <00aa3055-0b97-3ac4-f588-3665bfcb5811@linux.intel.com>
 <s5h1s16memr.wl-tiwai@suse.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <75c3efb7-8057-0d4c-a53d-45f4527d90a1@linux.intel.com>
Date: Fri, 10 May 2019 12:56:51 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <s5h1s16memr.wl-tiwai@suse.de>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, rdunlap@infradead.org,
 YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 lgirdwood@gmail.com, broonie@kernel.org
Subject: Re: [alsa-devel] [PATCH] ASoC: SOF: Fix build error with
 CONFIG_SND_SOC_SOF_NOCODEC=m
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


>>>> Yes, that would work.  OTOH, I see no merit to build an extra module
>>>> for nocodec.  nocodec.c can be built together with sof-core stuff.
>>
>> the module has its benefits. Today nocodec includes all possible DAIs,
>> I wanted to add module parameters to restrict things a bit for
>> tests/debug. It'll be e.g. very helpful for SoundWire to avoid
>> exposing the SSP DAIs.
>>
>> Also nocodec is incompatible with hdaudio/hdmi support at the moment,
>> we had all sorts of issues with suspend/resume.
> 
> Well, in the case of SOF, the core code calls directly
> soc_nocodec_setup(), hence it's rather a direct link.  So it makes
> little sense to make the nocodec code split from sof-core, unless the
> nocodec code is used / linked by components other than SOF.  I doubt
> the possibility because the current DAI is clearly only for SOF...
> 
> The module option can be still be there; it'll be applied just to
> sof-core instead of sof-nocodec.

I see your point and this SOF core/nocodec dependency is a conceptual 
miss on our side. Thanks for bringing our attention on this.

The core is really supposed to be about the DSP side of things. It 
shouldn't be burdened with machine driver stuff, but it unfortunately is 
at two levels.

Initially the nocodec code was handled at the soc-acpi-dev or 
soc-pci-dev level, and it's still there that the FORCE_CODEC mode is 
handled, along with the calls to check the codec ACPI IDs. Now when we 
enabled the HDaudio case, we somehow ended-up moving parts of the 
nocodec support in the SOF core to simplify our life but created a 
dependency that wasn't intentional at all. we collectively missed it 
while we were struggling with nocodec/hdaudio compatibility.

The second issue is that we create a platform_device for the machine 
driver in the SOF core. This is a shortcut that we took and that works 
for Intel, but for DeviceTree-based platforms this will have to change.

So long story short, I'd rather have a simple Kconfig fix to avoid 
compilation issues for now and revisit all the machine driver support, 
e.g. when the i.MX patches show up, than strengthen a dependency that we 
introduced by accident rather than by design.


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
