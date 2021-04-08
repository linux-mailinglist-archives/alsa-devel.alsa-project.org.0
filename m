Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 34AE7358CFD
	for <lists+alsa-devel@lfdr.de>; Thu,  8 Apr 2021 20:53:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A38EC165E;
	Thu,  8 Apr 2021 20:52:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A38EC165E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1617908002;
	bh=dAgVvOlRTFC6lXpCj9NFAgjeEcmxzvYc/g0TILWD/0E=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gJurMCWASysCwYRTectDpF2uCDtqv4ZjQZd4II6wVJK6Y0VCe53h8Fp+TMg98Zmi2
	 S6OakaMwNj9UHvVNPU2C+p1LQSnO0+wnCVubcKuedtrRe2qRnQZ0CBg7DICvVRe5Kd
	 OEO5nF5uAi3h5q66sZgD+fz2PCFTALU+MIl+v5kg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0EE96F80246;
	Thu,  8 Apr 2021 20:51:56 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D8B36F8020B; Thu,  8 Apr 2021 20:51:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2DB3FF80162
 for <alsa-devel@alsa-project.org>; Thu,  8 Apr 2021 20:51:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2DB3FF80162
IronPort-SDR: Qlp8pc3baAi0kyXahgo8i2KCjy//JMxSwvgVM/gb4wfhFLA6zNmV6isQtcQU0kBNn0HeHCUExf
 MocEzc4Jr/ow==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="181147188"
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; d="scan'208";a="181147188"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 11:51:43 -0700
IronPort-SDR: nb5CdhfUnW9mfF3a6qOb1LyQiAEFAkBlMzVyDFnuOvZnLwgLuGh8eLJUUBQV3q4cJ3VRbK+Lxk
 rVE6HMU/oZuQ==
X-IronPort-AV: E=Sophos;i="5.82,207,1613462400"; d="scan'208";a="458943913"
Received: from kritiaga-mobl.amr.corp.intel.com (HELO [10.212.59.29])
 ([10.212.59.29])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 11:51:43 -0700
Subject: Re: [PATCH] ALSA: core - add more card sysfs entries
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>,
 Mark Brown <broonie@kernel.org>
References: <20210408094314.1322802-1-perex@perex.cz>
 <20210408103819.GA40407@workstation> <s5h35w182a5.wl-tiwai@suse.de>
 <45acc908-3603-3479-9fb2-5206339a9ace@perex.cz>
 <20210408120502.GA4516@sirena.org.uk> <s5hpmz47w3i.wl-tiwai@suse.de>
 <56c874ae-e801-63df-19fa-a1325f6104ca@perex.cz>
 <3107db1d-f97d-539a-05db-6f880b762f00@linux.intel.com>
 <3b33595e-777c-90b2-6d65-346c9bf6e003@perex.cz>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <b0258a67-79ca-50cd-e6c5-74514ba8a3c5@linux.intel.com>
Date: Thu, 8 Apr 2021 13:51:41 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3b33595e-777c-90b2-6d65-346c9bf6e003@perex.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: ALSA development <alsa-devel@alsa-project.org>
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



>>> When we have a common standard layer for the plug-and-play handling (udev), we
>>> should concentrate to allow changing / refining of this information there.
>>> Those strings are not used for anything else than the user space. So from my
>>> view, there's no reason to create another mechanism to handle the overrides.
>>> It should be a safe, fast, flexible and_optional_  solution. The udev can
>>> alter the sysfs attributes directly without any hassle with the file
>>> modifications or looking for another way to pass / store this information
>>> somewhere.
>>
>> There's one part where I am lost.
>>
>> The initial idea of udev what to modify kernel parameters to pick a
>> different path for firmware/topology before probing the PCI driver. At
> 
> This may be a problematic point. The kernel cmdline cannot be modified from
> udev (as far as I know). The module parameters can be set using modprobe's
> config files or when loaded with sysfs attributes (/sys/module/*/parameters).
> Eventually, you can call the modprobe command with custom module parameters
> when the appropriate MODALIAS is probed.
> 
> Perhaps, I'm missing something here, too. Some example udev rules may help.

see the example shared by Curtis

SUBSYSTEM=="pci", ATTR{vendor}=="0x8086", ATTR{device}=="0xa0c8", 
ATTR{class}=="0x040100", ATTRS{[dmi/id]board_name}=="Eldrid", 
RUN+="/sbin/modprobe snd_sof_pci tplg_path=intel/sof-tplg/pdm1"

Those 'path' parameters would have to be set prior to creating the card, 
making them writable via sysfs would not work, the firmware and topology 
are already loaded and changing the paths would have no effect.

>> that point there is no card and no sysfs attributes just yet, they will
>> be added at a later point during the probe itself.
>>
>> So are we talking about a second set of rules that would be applied when
>> the card is created?
> 
> Yes, I'm talking about rules which depends on the sound driver specific sysfs
> attributes (you can match the modified /sys/module/*/parameters here).

you lost me with 'match the modified parameters' wording. who matches 
and who modifies those parameters?
