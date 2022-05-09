Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 595AF5201C1
	for <lists+alsa-devel@lfdr.de>; Mon,  9 May 2022 17:56:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E3CAC84D;
	Mon,  9 May 2022 17:55:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E3CAC84D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1652111810;
	bh=CftlZGa7BbIpaEVqfwmBbhxAf1NVA9H779JC9hwJHyo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Lx8KOrccVMZu43UqWE/PCV1+/KqERTRWJGsJUrnjtYz5LEluFGZlTzwGt/npZvFj1
	 uZ9GhKoJyU+rDzopU4wy1l77Q+ZU135gvO+wJIn0irsv04Vy3Hlac6ViqIHiYHMbrw
	 TZFl0nbhaEJHrbDf+wqawn57jpRPZL95eQQnA5Ys=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4FE50F80237;
	Mon,  9 May 2022 17:55:51 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 420A4F8025D; Mon,  9 May 2022 17:55:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=disabled
 version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4C7E1F800D3
 for <alsa-devel@alsa-project.org>; Mon,  9 May 2022 17:55:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4C7E1F800D3
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DKafEs65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652111745; x=1683647745;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CftlZGa7BbIpaEVqfwmBbhxAf1NVA9H779JC9hwJHyo=;
 b=DKafEs659Km1qYDk2dGq/oY4G9G2EFliPHJNqytV4Sr5vhUhm1IhZP92
 lWp3D5bGlwRavNQ6dGga/GsH0VWxZpfnnhGamCV4xBHnAeF5j/Kg6VSlk
 4y9gINuRTg0P0oe18v8Z8I9oebP2YEjQuKWusR1BpM1eHrJ0SSaAb96Zr
 iat4HtEwJT5G2l7P99qyB42/6BmT4G/BMo58aBE5vxdbzTfXbD/qkxliR
 ZgKncoWS3e40JPiy7qwzAbALcVyZWLXSqkCKS1E2P45gTgIdDz2+MNY4u
 P40+Z3hKcrjrKfvvEVaT1g45IbMi3MQlBowvBXxwbPD2xX7Qv6tyoQ8Is A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="294316046"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="294316046"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 08:55:41 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="592811754"
Received: from gfgerman-mobl1.amr.corp.intel.com (HELO [10.209.80.95])
 ([10.209.80.95])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 08:55:40 -0700
Message-ID: <914e993e-a440-74a6-e5d8-3589b0f4083b@linux.intel.com>
Date: Mon, 9 May 2022 10:55:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 02/14] ASoC: codecs: Add HD-Audio codec driver
Content-Language: en-US
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20220427081902.3525183-1-cezary.rojewski@intel.com>
 <20220427081902.3525183-3-cezary.rojewski@intel.com>
 <7bc3a92e-8bd1-c1d0-5610-af40dbb8fb7a@linux.intel.com>
 <YnUev8Rs42xLLE6Z@sirena.org.uk>
 <4a808f4c-83fc-747d-1536-d276138e57b8@intel.com>
 <2849fc32-83b8-4727-0aea-aa20b4d3557a@linux.intel.com>
 <28e7b768-dfa4-eca4-9d7a-5e8c6f54bc27@intel.com>
 <53557182-a2c5-a280-8887-bdb8a71dfd94@linux.intel.com>
 <alpine.DEB.2.22.394.2205091543170.1532214@eliteleevi.tm.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <alpine.DEB.2.22.394.2205091543170.1532214@eliteleevi.tm.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, upstream@semihalf.com, harshapriya.n@intel.com,
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



On 5/9/22 09:33, Kai Vehmanen wrote:
> Hi,
> 
> On Fri, 6 May 2022, Pierre-Louis Bossart wrote:
> 
>>>> On 5/6/22 10:28, Cezary Rojewski wrote:
>>>>> My suggestion is different: have all HD-Audio ASoC users switch to this
>>>>> implementation when possible and remove the existing code along with
>>>>> skylake-driver.
> [...]
>> I am however concerned about the lack of long-term plans and confusion
>> coming having 3 different ways of dealing with HDaudio codecs on the
>> same hardware platform (legacy, ASoC/SOF-Skylake, ASoC-AVS). 2 was
>> already bad, I don't see how 3 is better?
> 
> fortunately most of the actual logic is in the codec drivers (in 
> sound/pci/hda/), so redundancy in the asoc-to-hda wrappers is not that 
> bad.
> 
> As a slight correction to the thread, hdac_hda.c does support HDMI and all 
> SOF machine drivers transitioned to this a few years back (and dropped 
> use of hdac_hdmi.c which is mostly duplicating code in patch_hdmi.c).
> 
> In last few years, most of the changes have been to the actual codec 
> drivers and we've not really had many fixes to hdac_hda.c anymore (there 
> has been a few, and indeed PM related). So in this sense this has worked 
> well enough. Patches to fix bugs and add support for new hardware, have 
> benefitted all users (DSP and no-DSP) and changes have been only needed at 
> a single location. So this is all good.
> 
> The fixed DAI capabilities of hdac_hda.c are indeed not ideal (although in 
> practise hasn't really been an issue so far) and the approach in the new 
> hda.c seems indeed more robust. We do have a lot of existing machine 
> drivers (and shipping DSP topologies that we need to keep working), so 
> transitioning e.g. SOF machine drivers is not going to be straightforward.
> For new mach drivers, this could be considered.

We've just simplified the HDAudio topologies to support the Analog
playback and capture only, for both IPC3 and IPC4 cases, so there's
really no plan to support such dynamic capabilities. I am not even aware
of a single device available in our team where the digital inputs and
outputs are exposed on a connector, so even if we wanted we couldn't
test this dynamic part.

> So while not ideal, maybe it makes sense to have two wrappers, hdac_hda.c 
> for mach drivers with fixed DAI configuration, and the new hda.c that 
> supports dynamic configuration (but requires mach drivers that match 
> this). If the old SST driver is deprecated, we can then proceed to remove 
> hdac_hdmi.c from the tree, so there's some savings.

Such removal isn't going to happen for at least 3+ years, the time it
takes for the slowest distros and users to switch kernels.

that means we're going to have to maintain for the foreseeable future:

hdac_hdmi.c: used only by SST
hdac_hda.c: used by both SST and SOF
hda.c: used only by AVS.


