Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE11520027
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 16:44:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E7DA618F9;
	Mon,  9 May 2022 16:44:02 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E7DA618F9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652107493;
	bh=YEOAHsp4YIuDbBJA0jElHnb9cuCzsO+aeS8tq87tTFs=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ommw6+H9Pue7T8ZlRMXn2VKaAA7gys8VBA0h6CWBnVc/mKrmpctu8qIr0ytqBz2D+
	 S9MkxQxVSCV/MnTbXVDqpLnQF6aSQ/npAFoWlLvOtmlGKVc3/iyfdcZQp2RsBuLDaV
	 AlDwSNDX9I9gjPY29JGMfSCMucpuge7UVkraUZ8o=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 87E16F80269;
	Mon,  9 May 2022 16:44:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 07701F8025D; Mon,  9 May 2022 16:44:01 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D1688F8011C
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 16:43:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D1688F8011C
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="Yj6oUpg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652107439; x=1683643439;
 h=date:from:to:cc:subject:in-reply-to:message-id:
 references:mime-version;
 bh=YEOAHsp4YIuDbBJA0jElHnb9cuCzsO+aeS8tq87tTFs=;
 b=Yj6oUpg2LYO3bkRqb1NTNuJVsObPU/T2jj6kzM0AhDJHV+Mj23o/RbTe
 uDWXj/tXsZSggOR5PmVoVMOwyqFawqOz2G1bXVU04g9yTbENyvSzMmvwP
 wNOKe8uudUe6tsimUll9+5lj+/9yD8IzefqXsYrZFGS8q8DuCWBNA5pUP
 8gSVov59f8LvRvqPGcP+j2CBeO/Mww64O+mWQ4u2tK19oHC4oR9cE9a1A
 Iyav5iUB2JHAGJeMOnv176QwWfE1GSE9CdfOMqlwGukuteARaePxdMZ6B
 cuO7G4FGAv+IAQleGPKAi/WwHnHooHXIijeF92fuA7ZRJIqjof/YCX4kL A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="269001382"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="269001382"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:43:53 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="519265466"
Received: from eliteleevi.tm.intel.com ([10.237.54.20])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 07:43:49 -0700
Date: Mon, 9 May 2022 17:33:51 +0300 (EEST)
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-X-Sender: kvehmane@eliteleevi.tm.intel.com
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
 Cezary Rojewski <cezary.rojewski@intel.com>
Subject: Re: [PATCH 02/14] ASoC: codecs: Add HD-Audio codec driver
In-Reply-To: <53557182-a2c5-a280-8887-bdb8a71dfd94@linux.intel.com>
Message-ID: <alpine.DEB.2.22.394.2205091543170.1532214@eliteleevi.tm.intel.com>
References: <20220427081902.3525183-1-cezary.rojewski@intel.com>
 <20220427081902.3525183-3-cezary.rojewski@intel.com>
 <7bc3a92e-8bd1-c1d0-5610-af40dbb8fb7a@linux.intel.com>
 <YnUev8Rs42xLLE6Z@sirena.org.uk>
 <4a808f4c-83fc-747d-1536-d276138e57b8@intel.com>
 <2849fc32-83b8-4727-0aea-aa20b4d3557a@linux.intel.com>
 <28e7b768-dfa4-eca4-9d7a-5e8c6f54bc27@intel.com>
 <53557182-a2c5-a280-8887-bdb8a71dfd94@linux.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7 02160 Espoo
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, harshapriya.n@intel.com,
 rad@semihalf.com, tiwai@suse.com, hdegoede@redhat.com,
 Mark Brown <broonie@kernel.org>, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

Hi,

On Fri, 6 May 2022, Pierre-Louis Bossart wrote:

>>> On 5/6/22 10:28, Cezary Rojewski wrote:
>>>> My suggestion is different: have all HD-Audio ASoC users switch to this
>>>> implementation when possible and remove the existing code along with
>>>> skylake-driver.
[...]
> I am however concerned about the lack of long-term plans and confusion
> coming having 3 different ways of dealing with HDaudio codecs on the
> same hardware platform (legacy, ASoC/SOF-Skylake, ASoC-AVS). 2 was
> already bad, I don't see how 3 is better?

fortunately most of the actual logic is in the codec drivers (in 
sound/pci/hda/), so redundancy in the asoc-to-hda wrappers is not that 
bad.

As a slight correction to the thread, hdac_hda.c does support HDMI and all 
SOF machine drivers transitioned to this a few years back (and dropped 
use of hdac_hdmi.c which is mostly duplicating code in patch_hdmi.c).

In last few years, most of the changes have been to the actual codec 
drivers and we've not really had many fixes to hdac_hda.c anymore (there 
has been a few, and indeed PM related). So in this sense this has worked 
well enough. Patches to fix bugs and add support for new hardware, have 
benefitted all users (DSP and no-DSP) and changes have been only needed at 
a single location. So this is all good.

The fixed DAI capabilities of hdac_hda.c are indeed not ideal (although in 
practise hasn't really been an issue so far) and the approach in the new 
hda.c seems indeed more robust. We do have a lot of existing machine 
drivers (and shipping DSP topologies that we need to keep working), so 
transitioning e.g. SOF machine drivers is not going to be straightforward.
For new mach drivers, this could be considered.

So while not ideal, maybe it makes sense to have two wrappers, hdac_hda.c 
for mach drivers with fixed DAI configuration, and the new hda.c that 
supports dynamic configuration (but requires mach drivers that match 
this). If the old SST driver is deprecated, we can then proceed to remove 
hdac_hdmi.c from the tree, so there's some savings.

Please do add some description to the commit+code+kconfig on how this new 
codec driver relates to hdac_hda. Otherwise it's very confusing to have 
two asoc codec drivers for the same thing.

Br, Kai
