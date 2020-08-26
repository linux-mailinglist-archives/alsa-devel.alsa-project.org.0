Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC9D2524E4
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 03:06:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 40C9D16FD;
	Wed, 26 Aug 2020 03:06:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 40C9D16FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598404015;
	bh=TSyl33ZJDuu9dk+bPhYfp7Ene1dlNFFNDb8nlvRGA/w=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kasoIg4PVDvE9id7Lwn6ZII39ntfJmLne/pVpD4nsg520qcgewYk4w2sNVmFUAKyd
	 MbLzfg8/2oge9c7LC38iWFWffI6fPylCKxR2bTBNU+EMFEihaG2JHme8Gz2aeW/+YX
	 tKOm/g6t/i+jsL4GFy5ShNvfefdxyMmaB5rDF8og=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88231F80143;
	Wed, 26 Aug 2020 03:05:14 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EB344F8025A; Wed, 26 Aug 2020 03:05:11 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=NICE_REPLY_A,PRX_BODY_21,
 SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D8AF7F800D1
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 03:04:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D8AF7F800D1
IronPort-SDR: +WOHWOtERg65cfeysM+lH7eL/P127xAaC8T8DCmX78wGWzzr+hkCNoIVKSg/br4zXnMEVvfUrJ
 M1XiNRkfSjzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9724"; a="241033483"
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="241033483"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 18:04:52 -0700
IronPort-SDR: ZKh7M1XTZkWJpN4mbKxK1HrCXTXaxCvt64udGJHISyGNeGE0jtcREJbv8HH31lvJcWUdgK9geY
 WURSAr+d3grg==
X-IronPort-AV: E=Sophos;i="5.76,354,1592895600"; d="scan'208";a="443834936"
Received: from yungchua-mobl.ccr.corp.intel.com (HELO [10.252.187.42])
 ([10.252.187.42])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2020 18:04:43 -0700
Subject: Re: [PATCH 3/4] soundwire: SDCA: add helper macro to access controls
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
 <20200825171656.75836-4-pierre-louis.bossart@linux.intel.com>
From: Bard liao <yung-chuan.liao@linux.intel.com>
Message-ID: <e705b622-5505-51ac-cbf2-cb3c6f317f2c@linux.intel.com>
Date: Wed, 26 Aug 2020 09:04:41 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200825171656.75836-4-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>, tiwai@suse.de,
 gregkh@linuxfoundation.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 linux-kernel@vger.kernel.org, Hui Wang <hui.wang@canonical.com>,
 vkoul@kernel.org, broonie@kernel.org, srinivas.kandagatla@linaro.org,
 jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Rander Wang <rander.wang@linux.intel.com>
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


On 8/26/2020 1:16 AM, Pierre-Louis Bossart wrote:
> The upcoming SDCA (SoundWire Device Class Audio) specification defines
> a hierarchical encoding to interface with Class-defined capabilities.
>
> The specification is not yet accessible to the general public but this
> information is released with explicit permission from the MIPI Board
> to avoid delays with SDCA support on Linux platforms.
>
> A block of 64 MBytes of register addresses are allocated to SDCA
> controls, starting at address 0x40000000. The 26 LSBs which identify
> individual controls are set based on the following variables:
>
> - Function Number. An SCDA device can be split in up to 8 independent
>    Functions. Each of these Functions is described in the SDCA
>    specification, e.g. Smart Amplifier, Smart Microphone, Simple
>    Microphone, Jack codec, HID, etc.
>
> - Entity Number.  Within each Function,  an Entity is  an identifiable
>    block.  Up   to  127  Entities   are  connected  in   a  pre-defined
>    graph  (similar to  USB), with  Entity0 reserved  for Function-level
>    configurations.  In  contrast  to  USB, the  SDCA  spec  pre-defines
>    Function Types, topologies, and allowed  options, i.e. the degree of
>    freedom  is not  unlimited to  limit  the possibility  of errors  in
>    descriptors leading to software quirks.
>
> - Control Selector. Within each Entity, the SDCA specification defines
>    48 controls such as Mute, Gain, AGC, etc, and 16 implementation
>    defined ones. Some Control Selectors might be used for low-level
>    platform setup, and other exposed to applications and users. Note
>    that the same Control Selector capability, e.g. Latency control,
>    might be located at different offsets in different entities, the
>    Control Selector mapping is Entity-specific.
>
> - Control Number. Some Control Selectors allow channel-specific values
>    to be set, with up to 64 channels allowed. This is mostly used for
>    volume control.
>
> - Current/Next values. Some Control Selectors are
>    'Dual-Ranked'. Software may either update the Current value directly
>    for immediate effect. Alternatively, software may write into the
>    'Next' values and update the SoundWire 1.2 'Commit Groups' register
>    to copy 'Next' values into 'Current' ones in a synchronized
>    manner. This is different from bank switching which is typically
>    used to change the bus configuration only.
>
> - MBQ. the Multi-Byte Quantity bit is used to provide atomic updates
>    when accessing more that one byte, for example a 16-bit volume
>    control would be updated consistently, the intermediate values
>    mixing old MSB with new LSB are not applied.
>
> These 6 parameters are used to build a 32-bit address to access the
> desired Controls. Because of address range, paging is required, but
> the most often used parameter values are placed in the lower 16 bits
> of the address. This helps to keep the paging registers constant while
> updating Controls for a specific Device/Function.
>
> Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

Acked-by: Bard Liao <yung-chuan.liao@linux.intel.com>


