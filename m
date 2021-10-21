Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id ECDFF436A88
	for <lists+alsa-devel@lfdr.de>; Thu, 21 Oct 2021 20:25:37 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7FFA2852;
	Thu, 21 Oct 2021 20:24:47 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7FFA2852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1634840737;
	bh=+MINymt/hZrmvuvHhJr4a4+SscmvyLccKCmr5hGxJGE=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=o6uCHJTRBPKg9epK70fZ5+BGail41Pz3gP4KyHNDSuPOufAt2kPGtPqDLFyqd87jv
	 Iy1JXtMjM8oWc2nhF1CWzrFCUPkV/+I3EAG5xQxmrSAhgVaU/KYTxaEgf3vBowjA/I
	 gR7FYeX8VsQbBC6fE2M5AQBwwXxHId/mJEe+kkWA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DF162F80246;
	Thu, 21 Oct 2021 20:24:20 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 833F8F80240; Thu, 21 Oct 2021 20:24:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE autolearn=disabled version=3.4.0
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 296F5F80155
 for <alsa-devel@alsa-project.org>; Thu, 21 Oct 2021 20:24:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 296F5F80155
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="252608398"
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="252608398"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 11:24:08 -0700
X-IronPort-AV: E=Sophos;i="5.87,170,1631602800"; d="scan'208";a="527584711"
Received: from tclangle-mobl1.amr.corp.intel.com (HELO [10.212.126.155])
 ([10.212.126.155])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2021 11:24:07 -0700
Subject: Re: [PATCH] ASoC: Intel: Unify HDAudio-ext bus initialization
To: Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
References: <20211018192134.353931-1-cezary.rojewski@intel.com>
 <alpine.DEB.2.22.394.2110191203390.3554566@eliteleevi.tm.intel.com>
 <4bf04607-0779-fe47-61b1-1780ab1a3d20@intel.com>
 <25811f8f-c7bc-89c2-f616-4102293a2deb@linux.intel.com>
 <d8b90004-6c64-8cef-266a-17b2a4a480d7@intel.com>
 <569f6bf6-c346-3059-fc7e-e8c46c7dc4b6@linux.intel.com>
 <994c6339-6f67-58e9-77a1-a2faa20ade72@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <857438fc-1d63-84a8-f42a-79b082297035@linux.intel.com>
Date: Thu, 21 Oct 2021 12:19:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <994c6339-6f67-58e9-77a1-a2faa20ade72@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Cc: hdegoede@redhat.com, alsa-devel@alsa-project.org, broonie@kernel.org,
 tiwai@suse.com
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


>> If it was just moving common parts, I would have no issue. My main
>> objection is that you went one step further and started renaming stuff
>> in rather confusing ways, e.g.
>>
>> -void sof_hda_bus_init(struct hdac_bus *bus, struct device *dev)
>> +void sof_hda_bus_init(struct hda_bus *bus, struct pci_dev *pdev,
>>
>> - * snd_hdac_ext_bus_init - initialize a HD-audio extended bus
>> + * snd_hda_ext_bus_init - initialize a HD-audio extended bus
> 
> Reason for renaming snd_hdac_ext_bus_init() to snd_hda_ext_bus_init() is
> argument type change: 'struct hdac_bus *' to struct hda_bus *'. Don't
> believe that's confusing to anybody.

it is confusing to me, myself and I. The main point is that it blurs
layers.

The hdaudio_ext library deals with Intel controller extensions for DMA
management and does not need to know about a larger container.

> No problem with reverting naming change for now - we can streamline
> naming later.
> 
> In regard to sof_hda_bus_init(): I don't see any renaming here, just
> argument type changes to match new snd_hda_ext_bus_init() usage.
> 
>> hda_bus is a definition from hda_codec.h, I don't see a reason why we
>> should use this structure when the vast majority of the code uses
>> hdac_bus. And the purpose of hdac_ext is really to deal with
>> *controller* extensions to couple/decouple DMAs. There is no dependency
>> on codecs at that level.
> 
> hda_bus is the base for all HDAudio drivers:
> struct azx
> struct skl_dev
> struct sof_intel_hda_dev
> 
> So no, what vast majority of code actually does is hda_bus/codec to
> hdac_bus/codec (and vice-versa) translation when in fact all the drivers
> are hda_* based. If you speak of confusion, that's the confusion that
> should be addressed in the future..

I maintain that the hdaudio_ext library is about Intel-specific changes
on the controller level and only with DMAs.

/**
 * hdac_ext_stream: HDAC extended stream for extended HDA caps
 *
 * @hstream: hdac_stream
 * @pphc_addr: processing pipe host stream pointer
 * @pplc_addr: processing pipe link stream pointer
 * @spib_addr: software position in buffers stream pointer
 * @fifo_addr: software position Max fifos stream pointer
 * @dpibr_addr: DMA position in buffer resume pointer
 * @dpib: DMA position in buffer
 * @lpib: Linear position in buffer
 * @decoupled: stream host and link is decoupled
 * @link_locked: link is locked
 * @link_prepared: link is prepared
 * @link_substream: link substream
 */

It's not really a surprise that there's confusion, even the HDaudio spec
describes controller, DMA, link and codec without clearly calling out
boundaries between layers.

> 
>> Even if there was, I also don't really see why/when we should start
>> using hda_ext v. hdac_ext, the naming convention completely escapes me.
>> It would seem logical to me to only use hdac_ext as an extension of
>> hdac_, no?
>>
>> I also don't get what this means:
>> +    snd_hda_ext_bus_init(hbus, pci, NULL, ext_ops, "sklbus");
>>
>> what is 'sklbus' and what purpose are you trying to accomplish with this
>> change?
>>
> 
> Well, please see the updated declaration of snd_hda_ext_bus_init() in
> this very patch and then the existing code of
> sound/soc/intel/skylake/skl.c - skl_create().
> Last argument in updated declaration reads 'modelname'. Skylake-driver
> has its own, SOF initializes it differently.

Not sure why you have your own?
