Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id E06884C5025
	for <lists+alsa-devel@lfdr.de>; Fri, 25 Feb 2022 21:53:41 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 634151F44;
	Fri, 25 Feb 2022 21:52:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 634151F44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1645822421;
	bh=meAKQIKXTx+ytg6qzgCzIuMrlNWk9WIiwy/GSH1+Lsw=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BdnPJuCWO6riy+smEs1KoF+f7KeHDmUY5iMBq1JkLMzqaaWLjsokAmddjjKiGIATJ
	 3xd4PRZu8+8U8w6g7m9CbSDOs38k+raut5xOPiAra4uSZdxw5z9SbB9hFMoC3cGZTM
	 g+d/GMPSMCCNqyrgcQWS8UhPCC+DYkFnZ4LhTTx8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C0485F80159;
	Fri, 25 Feb 2022 21:52:35 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 6CDF3F8020D; Fri, 25 Feb 2022 21:52:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.1 required=5.0 tests=DATE_IN_PAST_03_06, DKIM_SIGNED,
 DKIM_VALID,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
 autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4533EF800B6
 for <alsa-devel@alsa-project.org>; Fri, 25 Feb 2022 21:52:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4533EF800B6
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="FH21fQ55"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645822351; x=1677358351;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=meAKQIKXTx+ytg6qzgCzIuMrlNWk9WIiwy/GSH1+Lsw=;
 b=FH21fQ553ZVF0kStqj5H5VP2czIVi84w5ta5kG1q3qj5L+CNshgcFN/B
 SwxKity59IfGc3dkfzf99ehfgcqRGqN4KRHI7M4xoUgvx/4VAtx67O0Zu
 7mhkBojmkzFvjDacjNWAJ3gokifRyTKctlXLjDWlw5sFahGnE76e/w5lb
 Zl/AYe/Egg/TKDwuZMzyJ8RguOb5TXdulAesdxoAOxsT3y29jrG4UoRTS
 17RyM4X+6x7VWwX+JZt6ZBPG712AcqmT7Y3NOCnpTwFXVx2fF7xqhlNkQ
 d0HIcSa/AoLeGB0OQMTPoKKyOc2xAto9k9lMQtF4kLt9krUTFmOP9Rg4H Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10269"; a="313296115"
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="313296115"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:25 -0800
X-IronPort-AV: E=Sophos;i="5.90,137,1643702400"; d="scan'208";a="777520517"
Received: from nnwogbe-mobl1.amr.corp.intel.com (HELO [10.212.101.231])
 ([10.212.101.231])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2022 12:52:24 -0800
Message-ID: <b829b32d-7488-78a4-9e50-b1c37851e108@linux.intel.com>
Date: Fri, 25 Feb 2022 10:33:02 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.5.0
Subject: Re: [PATCH 00/17] ASoC: Intel: AVS - Audio DSP for cAVS
Content-Language: en-US
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
References: <20220207122108.3780926-1-cezary.rojewski@intel.com>
 <702df428-e972-fcdc-c250-c0a73c4d2ba8@linux.intel.com>
 <eb26c043-f80a-d283-0b4f-299bc182a6fe@intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <eb26c043-f80a-d283-0b4f-299bc182a6fe@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, hdegoede@redhat.com, broonie@kernel.org,
 amadeuszx.slawinski@linux.intel.com, cujomalainey@chromium.org,
 lma@semihalf.com
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


> The request was to split the initial series into smaller chunks and
> separate the driver-specific stuff from parts that _could_ get
> incorporated into the framework to level it up in regard to DSP
> management. Series: "Intel: avs: Topology and path management" [1] has
> been provided for such discussion.
> 
> Given the request, we are planning to upstream avs-driver in four chunks:
> - IPC protocol and code loading (this one)
> - Topology and path management [1]
> - secondary flows e.g.: DSP recovery
> - machine boards
> 
> 
> In regard to DPCM FE/BE, ASoC already has DAI-link components: let codec
> operations stay with codec component, leaving DSP related operations as
> platform component responsibility. FE for DSP drivers typically comes
> from topology and drives the HOST DMA part whereas BE deals with LINK
> (hardware, data transfer interface such as PDM or I2S) side, including
> its configuration.

I respectfully disagree with your analysis, we cannot dissociate DSP and
link management. The intersection between the BE dailink handling and
the DSP management is the configuration of the cpu-dai on the host side.

When the DSP firmware programs the DAI registers, as we do on the Intel
side for SSP, DMIC and ALH/SoundWire, then the format information needs
to be exposed back to the DSP platform driver so that the codec can be
informed of the configuration. Most interfaces can support multiple
formats, and currently we don't have a good way to know what the
firmware changes and how to match PCM hw_params with link configuration.

The current work-around we use is to rely on the dailink fixup to force
the dailink to operate at a rate consistent with the topology, but
that's really not good at all. What would be needed is that all format
changes through the DSP graph are propagated all the way to the DAI and
used for the dailink configuration. That would also enable us to remove
unnecessary SRCs or format conversions, which I believe is a capability
at the heart of your AVS path proposal.

That's really my point, you cannot really think of DSP management
without factoring in DPCM.

It's not just me blabbering into the wind btw, others have voiced the
need to improve FE->BE format handling and add constraints, see

https://lore.kernel.org/alsa-devel/20210323114327.3969072-1-codrin.ciubotariu@microchip.com/

> I'm happy to continue the discussion regarding "path" in the dedicated
> series [1] as current series covers IPC protocol and code loading -only.

this RFC series was not mentioned in the cover letter for this patchset,
so it wouldn't be surprising if others also missed the connection.

> [1]:
> https://lore.kernel.org/alsa-devel/20220207132532.3782412-1-cezary.rojewski@intel.com/T/#t
