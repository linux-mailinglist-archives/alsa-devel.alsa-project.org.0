Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 60DB16660AC
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Jan 2023 17:37:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 77BAF7623;
	Wed, 11 Jan 2023 17:36:11 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 77BAF7623
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673455021;
	bh=7dkVETTlDXUhLhrvwjxjCMgYYkzeQUbz/FyEzEQyDVw=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=NRbPwbTNP6C0+auA4W5ZdTZDTyqv79f7tt7enmT4/384vIE3gLOYKFUymyGclLu2i
	 t2sHhPRoXaafQ/W+5S4yKXJ5k08YKYzK6zuda9XSOJ6y+CVoGdfAT8ZaNvw4d0CYVy
	 Clu/BICAPNhdl0axYsI82dJc9cPOOk59v7ArjQ68=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 90FB8F8016E;
	Wed, 11 Jan 2023 17:36:02 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E7C70F804BC; Wed, 11 Jan 2023 17:35:59 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
 RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0D0BAF8016E
 for <alsa-devel@alsa-project.org>; Wed, 11 Jan 2023 17:35:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0D0BAF8016E
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=ePft6CR5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673454957; x=1704990957;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7dkVETTlDXUhLhrvwjxjCMgYYkzeQUbz/FyEzEQyDVw=;
 b=ePft6CR5OTXYcSXwtd58uiXH09vrd09YQHWMvR9ulQiHoY9gb0wB8WR6
 IzCFvZ7d6Rw0txvatQxVgKXer7uSVJKMqwfiqbMb0+ZVA4n9MYDrD32Ku
 ZgcFJMT08QQ6OO8ZZ67bKSzcL2cRj9nNbBZxN5ane7olVQAa0Ij/QZViJ
 2WpqpNvvucfxPkfO48k1FVa+xNqoyJIfn6gTTc7Xo6WqkvyOsqWMzKB39
 zt3zXjYdUNTs4JTC4FdzTkFbz/fguFDw/7RON9S6S52/rzdSnWrdn2H9e
 Lb1pmxT0QTZzSlPGNC4cEkW+J2hT74ntaaZbnAc7tV4XX0inTezBoknFv Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="324703981"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="324703981"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="607408142"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="607408142"
Received: from flobatol-mobl1.amr.corp.intel.com (HELO [10.212.110.208])
 ([10.212.110.208])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 08:32:05 -0800
Message-ID: <7ad57c38-7ccd-46a3-b4d9-d10f41547757@linux.intel.com>
Date: Wed, 11 Jan 2023 07:36:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH 00/19] Add soundwire support for Pink Sardine platform
Content-Language: en-US
To: Vijendar Mukunda <Vijendar.Mukunda@amd.com>, broonie@kernel.org,
 vkoul@kernel.org, alsa-devel@alsa-project.org
References: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230111090222.2016499-1-Vijendar.Mukunda@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: arungopal.kondaveeti@amd.com, Mastan.Katragadda@amd.com,
 Sunil-kumar.Dommati@amd.com, Basavaraj.Hiregoudar@amd.com,
 Mario.Limonciello@amd.com
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/11/23 03:02, Vijendar Mukunda wrote:
> Pink Sardine(ps) platform is based on ACP6.3 Architecture.
> ACP6.3 IP has two soundwire controller instance support.

After reviewing patch1, it looks like there's a confusion between
controller and manager? the use of the 'sdw-master-count' property is
not for controller count, it's defined within the scope of an ACPI
controller device (usually a companion device to the PCI device).

> This patchset add support for Soundwire controller on Pink Sardine
> platform.

That's great, thanks for sharing.

> Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
> Vijendar Mukunda (19):
>   ASoC: amd: ps: create platform devices based on acp config
>   soundwire: amd: Add support for AMD Master driver
>   soundwire: amd: register sdw controller dai ops
>   soundwire: amd: enable build for AMD soundwire master driver
>   soundwire: amd: add soundwire interrupt handling
>   ASoC: amd: ps: add support for soundwire interrupts in acp pci driver
>   ASoC: amd: ps: add soundwire dma driver for pink sardine platform
>   ASoC: amd: ps: add soundwire dma driver dma ops
>   ASoC: amd: ps: add support for Soundwire DMA interrupts
>   ASoC: amd: ps: enable Soundwire DMA driver build
>   ASoC: amd: update comments in Kconfig file
>   ASoC: amd: ps: Add soundwire specific checks in pci driver in pm ops.
>   ASoC: amd: ps: add support for runtime pm ops for soundwire dma driver
>   soundwire: amd: add runtime pm ops for AMD master driver
>   soundwire: amd: add startup and shutdown dai ops
>   soundwire: amd: handle wake enable interrupt
>   soundwire: amd: add pm_prepare callback and pm ops support
>   ASoC: amd: ps: implement system level pm ops for soundwire dma driver
>   ASoC: amd: ps: increase runtime suspend delay
> 
>  drivers/soundwire/Kconfig         |    9 +
>  drivers/soundwire/Makefile        |    4 +
>  drivers/soundwire/amd_master.c    | 1734 +++++++++++++++++++++++++++++
>  drivers/soundwire/amd_master.h    |  284 +++++
>  include/linux/soundwire/sdw_amd.h |   65 ++
>  sound/soc/amd/Kconfig             |    3 +-
>  sound/soc/amd/ps/Makefile         |    2 +
>  sound/soc/amd/ps/acp63.h          |   98 +-
>  sound/soc/amd/ps/pci-ps.c         |  383 ++++++-
>  sound/soc/amd/ps/ps-sdw-dma.c     |  728 ++++++++++++
>  10 files changed, 3287 insertions(+), 23 deletions(-)
>  create mode 100644 drivers/soundwire/amd_master.c
>  create mode 100644 drivers/soundwire/amd_master.h
>  create mode 100644 include/linux/soundwire/sdw_amd.h
>  create mode 100644 sound/soc/amd/ps/ps-sdw-dma.c
> 
