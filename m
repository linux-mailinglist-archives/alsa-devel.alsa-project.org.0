Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 10D7E3139AD
	for <lists+alsa-devel@lfdr.de>; Mon,  8 Feb 2021 17:41:04 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2FFEE1678;
	Mon,  8 Feb 2021 17:40:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2FFEE1678
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1612802463;
	bh=70cHdvu5kwQc+Xp7joWoqcz6bAw9QF2jBOnoKnOVBfQ=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=pgqystQMbFStV+Z4I8t8EFTBfuHNFA2E+5Mru5oLGKbvTRaUFWRmKjJ5iGSIryFZq
	 2MwXxlXq5OC3HDIxfIXch+n2+E9VLNBsqvv6b/iK6kI0xBOOaXdj8eBVP2tmNaNhEZ
	 agaw2k6SPYJ3NPNrr4gg/CBsuwu1lKGIWbunYygw=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E9DF2F802A0;
	Mon,  8 Feb 2021 17:38:36 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B3B6F80290; Mon,  8 Feb 2021 17:38:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 5EA70F8022D
 for <alsa-devel@alsa-project.org>; Mon,  8 Feb 2021 17:38:27 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 5EA70F8022D
IronPort-SDR: Hd1Ygr6+Yql44P5ZWBOLHI5LBhhZkU5EHOIYQwjIYrF78YA0Dw1rCmO8MvVowksmWBQ9ZFf5Ea
 fOI+4CcsdQIQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9889"; a="245810588"
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="245810588"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 08:38:24 -0800
IronPort-SDR: QzV9IrMZ+miK4k3yknfstPhk2jaNrN7XzQ/QQgMCdld9TZgFvcGgSWxfie93EMUYoTQgIuy/m3
 1UyWZzOU0qYw==
X-IronPort-AV: E=Sophos;i="5.81,162,1610438400"; d="scan'208";a="377835388"
Received: from rahaness-mobl.amr.corp.intel.com (HELO [10.212.141.76])
 ([10.212.141.76])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2021 08:38:23 -0800
Subject: Re: [PATCH v2] ALSA: hda: intel-dsp-config: Add
 SND_INTEL_BYT_PREFER_SOF Kconfig option
To: Hans de Goede <hdegoede@redhat.com>,
 Cezary Rojewski <cezary.rojewski@intel.com>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
References: <20210208135919.135600-1-hdegoede@redhat.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <f5266816-d4e9-3bec-7ac4-e933c8a5078e@linux.intel.com>
Date: Mon, 8 Feb 2021 09:33:46 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210208135919.135600-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org
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



On 2/8/21 7:59 AM, Hans de Goede wrote:
> The kernel has 2 drivers for the Low Power Engine audio-block on
> Bay- and Cherry-Trail SoCs. The old SST driver and the new SOF
> driver. If both drivers are enabled then the kernel will default
> to using the old SST driver, unless told otherwise through the
> snd_intel_dspcfg.dsp_driver module-parameter.
> 
> Add a boolean SND_INTEL_BYT_PREFER_SOF Kconfig option, which when set to Y
> will make the kernel default to the new SOF driver instead.
> The option defaults to n, preserving the current behavior.
> 
> Making this configurable will help distributions such as Fedora:
> https://fedoraproject.org/w/index.php?title=Changes/SofDefaultForIntelLpe
> to test using SOF on BYT/CHT during the transition phase where we
> have both drivers (eventually the old driver and this option will
> be removed).
> 
> Note that this drops the acpi_config_table[] containing 2 entries per ACPI
> hardware-id if both drivers are enabled. snd_intel_acpi_dsp_find_config()
> will always return the first hit, so we only need a single entry with the
> flags value set depending on the Kconfig settings.
> 
> Suggested-by: Takashi Iwai <tiwai@suse.de>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Thanks Hans!

