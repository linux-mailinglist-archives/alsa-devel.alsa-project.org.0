Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 181E774F359
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Jul 2023 17:25:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A37B8EA2;
	Tue, 11 Jul 2023 17:24:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A37B8EA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1689089144;
	bh=la1QVq4HIgIr0eEz8hF9KkZUQTqFiyIfgzdHWOn/i40=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XN/+Bb8kr4Sq0yhbpECvwNzeawb0XtyiBAsTiXhxqKMtCJ9hj04hlrwh3NWvGBpAA
	 0MEobji6dFC3Pp/MEy1nVR0W559tll2yJ0iRu+7GA1d68sXUeOvjqkP/gkv9xJruBi
	 U3aN4i4BVtHQk5FHcYNUzeqTFkZgrOsZYhCUy6lg=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 6C736F80290; Tue, 11 Jul 2023 17:24:28 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D67F0F80236;
	Tue, 11 Jul 2023 17:24:27 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 896C2F80249; Tue, 11 Jul 2023 17:24:23 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B5E30F80153
	for <alsa-devel@alsa-project.org>; Tue, 11 Jul 2023 17:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B5E30F80153
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Z0JdAq/H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689089057; x=1720625057;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=la1QVq4HIgIr0eEz8hF9KkZUQTqFiyIfgzdHWOn/i40=;
  b=Z0JdAq/HLoTT/DEuPeCzveBluFiMZ7h89uIpQPG8aoyXTLtgL8aY9snt
   MlAtQVykNaFzlwnr0q8X0PujMKIdgdE+hyhUsjdrl6yUmxcnQld7CCKAQ
   HyqgaiMqbS+VmSOT7K70ZAqKqgJqeD8MNH8YvmlPxmXu1SoBh688hXX05
   oIuUATPjbqkzX0Nkb8XKsJF7B/rlEmmLpHnK+snMifKRdJNNuR7k3zhXV
   s331GUtFnM421bIDJ7rmR2fUg95synoVPkgqHlyXmAJGxwNI68eMUOmih
   4wb2Pf9rRdJoa98paMs4/Cg3sOaVomG9JWsmSCwAK5/Fg1DI9T0UcClNB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="344246897"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="344246897"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 08:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10768"; a="791241368"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200";
   d="scan'208";a="791241368"
Received: from pratipro-mobl1.ger.corp.intel.com (HELO [10.252.44.140])
 ([10.252.44.140])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2023 08:24:09 -0700
Message-ID: <bc2484ba-3bb2-7d74-fcd1-55c9ec253b9c@linux.intel.com>
Date: Tue, 11 Jul 2023 17:24:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH 00/13] PCI: Define Intel PCI IDs and use them in drivers
Content-Language: en-US
To: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
Cc: alsa-devel@alsa-project.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Cezary Rojewski <cezary.rojewski@intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>,
 Hans de Goede <hdegoede@redhat.com>
References: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230711125726.3509391-1-amadeuszx.slawinski@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X54COW5E45NP6OYNCURU7M4GYYERSGT3
X-Message-ID-Hash: X54COW5E45NP6OYNCURU7M4GYYERSGT3
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/X54COW5E45NP6OYNCURU7M4GYYERSGT3/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 7/11/23 14:57, Amadeusz Sławiński wrote:
> PCI IDs for Intel HDA are duplicated across quite a few drivers, due to
> various configurations and historical reasons. Currently almost all uses
> of HDA PCI IDs have corresponding comment telling which platform it is.
> Additionally there are some inconsistencies between drivers about which
> ID corresponds to which device.
> 
> Simplify things, by adding PCI IDs to global header and make use of them
> in drivers. This allows for removal of comments by having IDs themselves
> being self explanatory. Additionally it allows for removal of existing
> inconsistencies by having one source of truth.

I'd like to hear from Takashi and Mark on how this would work, we have
to provide new PCI IDs for both trees using a common 'pci_ids.h' file.

It's not science fiction, we have new PCI IDs for ArrowLake and LunarLake:

https://github.com/thesofproject/linux/pull/4437
https://github.com/thesofproject/linux/pull/4425

> Changes from RFC:
>  - Sort Intel PCI IDs before adding new ones
>  - Fix ordering of new PCI IDs (Andy)
>  - Define all used Intel IDs (Andy)
>  - Add macros for controller type detection (Andy/Bjorn)
>  - Add set of patches changing to use above macro (Andy/Bjorn)
>  - Use PCI_DEVICE_DATA for Intel IDs in sound/pci/hda/hda_intel.c (Andy)
>  - Commit message wording (Andy)
>  - Remove unnecessary tabs (Andy)
> 
> Amadeusz Sławiński (13):
>   PCI: Sort Intel PCI IDs by number
>   PCI: Add Intel Audio DSP devices to pci_ids.h
>   ALSA: hda: Add controller matching macros
>   ALSA: hda: Use global PCI match macro
>   ALSA: hda/i915:  Use global PCI match macro
>   ASoC: Intel: Skylake: Use global PCI match macro
>   ALSA: intel-dsp-config: Convert to PCI device IDs defines
>   ALSA: hda: Convert to PCI device IDs defines
>   ASoC: Intel: avs: Convert to PCI device IDs defines
>   ASoC: Intel: avs: Convert to PCI device IDs defines
>   ASoC: Intel: Skylake: Convert to PCI device IDs defines
>   ASoC: SOF: Intel: Convert to PCI device IDs defines
>   ASoC: Intel: sst: Convert to PCI device IDs defines
> 
>  include/linux/pci_ids.h                | 104 +++++--
>  include/sound/hda_codec.h              |   3 -
>  include/sound/hdaudio.h                |  27 ++
>  sound/hda/hdac_i915.c                  |   7 +-
>  sound/hda/intel-dsp-config.c           | 119 ++++----
>  sound/pci/hda/hda_intel.c              | 373 ++++++++++---------------
>  sound/soc/intel/atom/sst/sst.c         |   3 +-
>  sound/soc/intel/atom/sst/sst.h         |   1 -
>  sound/soc/intel/atom/sst/sst_pci.c     |   4 +-
>  sound/soc/intel/avs/board_selection.c  |  10 +-
>  sound/soc/intel/avs/core.c             |  16 +-
>  sound/soc/intel/skylake/skl-messages.c |  16 +-
>  sound/soc/intel/skylake/skl-pcm.c      |   3 +-
>  sound/soc/intel/skylake/skl.c          |  36 +--
>  sound/soc/sof/intel/pci-apl.c          |   9 +-
>  sound/soc/sof/intel/pci-cnl.c          |  15 +-
>  sound/soc/sof/intel/pci-icl.c          |  12 +-
>  sound/soc/sof/intel/pci-mtl.c          |   3 +-
>  sound/soc/sof/intel/pci-skl.c          |   6 +-
>  sound/soc/sof/intel/pci-tgl.c          |  45 +--
>  sound/soc/sof/intel/pci-tng.c          |   3 +-
>  21 files changed, 384 insertions(+), 431 deletions(-)
> 
