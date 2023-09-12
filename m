Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1735479D7D5
	for <lists+alsa-devel@lfdr.de>; Tue, 12 Sep 2023 19:45:24 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6F9E19F6;
	Tue, 12 Sep 2023 19:44:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6F9E19F6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1694540722;
	bh=cm5fmflUTyUPcscwv9xakLpN6ml82B7DzcINH5QsMyM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=u/5qs61+/RRlfL7370quw4COARYcrHxINMevmS4E0ktnZ76Xafy2IGuzZxrbyWgAM
	 wYuovVlxQRuv/nFbupTqNEtPMT5TqetgP9dOb5DhWUVzW+L+0cDUhrMqk8qBUZY5B2
	 VV78/X/nUKWvO/xz7Ld398PKed+sBxvd0OOPUv4Y=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 7D454F80212; Tue, 12 Sep 2023 19:44:31 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id D8B65F80212;
	Tue, 12 Sep 2023 19:44:30 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 03306F80425; Tue, 12 Sep 2023 19:44:26 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 9A386F80212
	for <alsa-devel@alsa-project.org>; Tue, 12 Sep 2023 19:44:18 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9A386F80212
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Xccj3iJc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694540660; x=1726076660;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cm5fmflUTyUPcscwv9xakLpN6ml82B7DzcINH5QsMyM=;
  b=Xccj3iJch6F4AahdVVJaI233X0UdbGC1V/pF2mj40B7FAGaGKY8P+YVJ
   kiDvNsnXjhzB3cvezeWM0HMmXiD3c+DO3GxdXIFHGsV7/cYBnR4f1L20x
   VzuAOdeL1vGdJqisdqEChmX1ZJKX0YjvrjVbECiZdVZFbodaAjpTEP1qd
   m1C2kTDdemKxOcedRl2OBCBWgUA2WmubCWwGQh/aGkZCYiWKx9Xu+N2wP
   OhqgapvsvZCVl/zSEtjeySCFrUqXRRqlByMKOtPH6hcwBV67gyi16M/vf
   WIdGXgh8OGI7nzJudo5v3IavCUEnDjw201SJr6k16qcmIv5/E9cGTwCuZ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="378356231"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000";
   d="scan'208";a="378356231"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 10:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10831"; a="809363946"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000";
   d="scan'208";a="809363946"
Received: from skotini-mobl.amr.corp.intel.com (HELO [10.209.169.137])
 ([10.209.169.137])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 10:44:14 -0700
Message-ID: <1d2d927d-6506-86fb-fc42-038d2d70c853@linux.intel.com>
Date: Tue, 12 Sep 2023 13:39:56 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.15.0
Subject: Re: [PATCH 0/4] ASoC: cs35l56: Use PCI SSID to select specific
 firmware
Content-Language: en-US
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org,
 yung-chuan.liao@linux.intel.com, kai.vehmanen@linux.intel.com,
 peter.ujfalusi@linux.intel.com
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 linux-kernel@vger.kernel.org
References: <20230912163207.3498161-1-rf@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230912163207.3498161-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 444PNYHG325JOCGPLOFXOR5GETQ3URNH
X-Message-ID-Hash: 444PNYHG325JOCGPLOFXOR5GETQ3URNH
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/444PNYHG325JOCGPLOFXOR5GETQ3URNH/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 9/12/23 12:32, Richard Fitzgerald wrote:
> The PCI device registers contain a subsystem ID (SSID), that is
> separate from the silicon ID. The PCI specification defines it thus:
> 
> "They provide a mechanism for board vendors to distiguish their
>  boards from one another even thought the boards may have the same
>  PCI controller on them."
> 
> This allows the driver for the silicon part to apply board-speficic
> settings based on this SSID.
> 
> The CS35L56 driver uses this to select the correct firmware file for
> the board. The actual ID is part of the PCI register set of the
> host audio interface so this set of patches includes extracting the
> SSID from the Intel audio controller and passing it to the machine
> driver and then to ASoC components. Other PCI audio controllers
> will have the same SSID registers, so can use the same mechanism to
> pass the SSID.
> 
> Richard Fitzgerald (4):
>   ASoC: soc-card: Add storage for PCI SSID
>   ASoC: SOF: Pass PCI SSID to machine driver
>   ASoC: Intel: sof_sdw: Copy PCI SSID to struct snd_soc_card
>   ASoC: cs35l56: Use PCI SSID as the firmware UID

for the series

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>


> 
>  include/sound/soc-acpi.h         |  7 ++++++
>  include/sound/soc-card.h         | 37 ++++++++++++++++++++++++++++++++
>  include/sound/soc.h              | 11 ++++++++++
>  include/sound/sof.h              |  8 +++++++
>  sound/soc/codecs/cs35l56.c       | 11 ++++++++++
>  sound/soc/intel/boards/sof_sdw.c |  6 ++++++
>  sound/soc/sof/sof-audio.c        |  7 ++++++
>  sound/soc/sof/sof-pci-dev.c      |  8 +++++++
>  8 files changed, 95 insertions(+)
> 
