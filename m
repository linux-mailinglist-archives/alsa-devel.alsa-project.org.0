Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEDD2C2018
	for <lists+alsa-devel@lfdr.de>; Tue, 24 Nov 2020 09:35:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D557B1612;
	Tue, 24 Nov 2020 09:34:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D557B1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1606206947;
	bh=h4pTWTrSoOo7rJeNoA0yqc3cBAhJq0j4UBhLaw/3b8E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a3NAZFR+wHN2GYiP1zS2ZDUiR4wr8KM50Y2o9iSqh44GfxDZGWnrL5Dn/NAqIkqxy
	 hN7PRqUcxHWAAt/5ReH+a+P/QA9q1voOlS0+db0qN/PZyEwc0jYVULrNCA7sfOQ6Wd
	 CNxmj4+uwPp8OcRHvUrVGw8qyT3WhSdxBek3MkAg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3E6BCF800C1;
	Tue, 24 Nov 2020 09:34:14 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7EDACF80165; Tue, 24 Nov 2020 09:34:12 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_21,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id D9962F80161
 for <alsa-devel@alsa-project.org>; Tue, 24 Nov 2020 09:34:02 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz D9962F80161
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="ubvou44h"
Received: from localhost (unknown [122.167.149.197])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0B26920782;
 Tue, 24 Nov 2020 08:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606206839;
 bh=h4pTWTrSoOo7rJeNoA0yqc3cBAhJq0j4UBhLaw/3b8E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ubvou44hpIPS8fHyz28TCkI2J1IjbkX7twxtzE7uJILKIH7A8PL0MPNirq26vKITQ
 EiUtoZIiMogSXheZ36I6bAB4ShlvVyxih4g7GIaUbsBGLx/oIjDEEL2/8+oDMKa68q
 scOLaz84z4DS9W/nIcujR4gdtAaB0uIRryDWOIF8=
Date: Tue, 24 Nov 2020 14:03:53 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH 1/5] soundwire: SDCA: add helper macro to access controls
Message-ID: <20201124083353.GH8403@vkoul-mobl>
References: <20201103172226.4278-1-yung-chuan.liao@linux.intel.com>
 <20201103172226.4278-2-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201103172226.4278-2-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, mengdong.lin@intel.com,
 sanyog.r.kale@intel.com, rander.wang@linux.intel.com, bard.liao@intel.com
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

On 04-11-20, 01:22, Bard Liao wrote:
> From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
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
>   Functions. Each of these Functions is described in the SDCA
>   specification, e.g. Smart Amplifier, Smart Microphone, Simple
>   Microphone, Jack codec, HID, etc.
> 
> - Entity Number.  Within each Function,  an Entity is  an identifiable
>   block.  Up   to  127  Entities   are  connected  in   a  pre-defined
>   graph  (similar to  USB), with  Entity0 reserved  for Function-level
>   configurations.  In  contrast  to  USB, the  SDCA  spec  pre-defines
>   Function Types, topologies, and allowed  options, i.e. the degree of
>   freedom  is not  unlimited to  limit  the possibility  of errors  in
>   descriptors leading to software quirks.
> 
> - Control Selector. Within each Entity, the SDCA specification defines
>   48 controls such as Mute, Gain, AGC, etc, and 16 implementation
>   defined ones. Some Control Selectors might be used for low-level
>   platform setup, and other exposed to applications and users. Note
>   that the same Control Selector capability, e.g. Latency control,
>   might be located at different offsets in different entities, the
>   Control Selector mapping is Entity-specific.
> 
> - Control Number. Some Control Selectors allow channel-specific values
>   to be set, with up to 64 channels allowed. This is mostly used for
>   volume control.
> 
> - Current/Next values. Some Control Selectors are
>   'Dual-Ranked'. Software may either update the Current value directly
>   for immediate effect. Alternatively, software may write into the
>   'Next' values and update the SoundWire 1.2 'Commit Groups' register
>   to copy 'Next' values into 'Current' ones in a synchronized
>   manner. This is different from bank switching which is typically
>   used to change the bus configuration only.
> 
> - MBQ. the Multi-Byte Quantity bit is used to provide atomic updates
>   when accessing more that one byte, for example a 16-bit volume
>   control would be updated consistently, the intermediate values
>   mixing old MSB with new LSB are not applied.
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
> Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>  include/linux/soundwire/sdw_registers.h | 32 +++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/include/linux/soundwire/sdw_registers.h b/include/linux/soundwire/sdw_registers.h
> index f420e8059779..e14dff9a9c7f 100644
> --- a/include/linux/soundwire/sdw_registers.h
> +++ b/include/linux/soundwire/sdw_registers.h
> @@ -298,4 +298,36 @@
>  #define SDW_CASC_PORT_MASK_INTSTAT3		1
>  #define SDW_CASC_PORT_REG_OFFSET_INTSTAT3	2
>  
> +/*
> + * v1.2 device - SDCA address mapping
> + *
> + * Spec definition
> + *	Bits		Contents
> + *	31		0 (required by addressing range)
> + *	30:26		0b10000 (Control Prefix)
> + *	25		0 (Reserved)
> + *	24:22		Function Number [2:0]
> + *	21		Entity[6]
> + *	20:19		Control Selector[5:4]
> + *	18		0 (Reserved)
> + *	17:15		Control Number[5:3]
> + *	14		Next
> + *	13		MBQ
> + *	12:7		Entity[5:0]
> + *	6:3		Control Selector[3:0]
> + *	2:0		Control Number[2:0]
> + */
> +
> +#define SDW_SDCA_CTL(fun, ent, ctl, ch)		(BIT(30) |			\
> +						 (((fun) & 0x7) << 22) |	\
> +						 (((ent) & 0x40) << 15) |	\
> +						 (((ent) & 0x3f) << 7) |	\
> +						 (((ctl) & 0x30) << 15) |	\
> +						 (((ctl) & 0x0f) << 3) |	\
> +						 (((ch) & 0x38) << 12) |	\
> +						 ((ch) & 0x07))
> +
> +#define SDW_SDCA_MBQ_CTL(reg)			((reg) | BIT(13))
> +#define SDW_SDCA_NEXT_CTL(reg)			((reg) | BIT(14))

Ideally would have liked to use defines with GENMASK etc instead of
numbers, but this is not a strong issue so:

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
