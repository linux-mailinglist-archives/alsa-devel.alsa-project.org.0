Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D6F2A018B
	for <lists+alsa-devel@lfdr.de>; Fri, 30 Oct 2020 10:37:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F000115F2;
	Fri, 30 Oct 2020 10:36:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F000115F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604050668;
	bh=RI7z3K7eILvFHncLjd3L3uO0NKeB7z7jOonFatnns4E=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=d9ONOeaTbVJ1VYwVLXq1ygP05rcc/fulHA4Gwsh/JW9Toa2jwy2JOXyy4F2nS+FcN
	 /lsPHFIGbDEcKtcNwIsRqCwAKeUxa8o8a+FW9BJdX17KJWzXc1vH56557nOtjBVE22
	 PEAAa1kck9nEcvu1e8N31lXmnRao+9e590XJYbqY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 400B9F800C0;
	Fri, 30 Oct 2020 10:36:15 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D1F7CF80212; Fri, 30 Oct 2020 10:36:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,PRX_BODY_21,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 8F7EAF800C0
 for <alsa-devel@alsa-project.org>; Fri, 30 Oct 2020 10:36:06 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8F7EAF800C0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="jjupfj7u"
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D258B20729;
 Fri, 30 Oct 2020 09:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604050563;
 bh=RI7z3K7eILvFHncLjd3L3uO0NKeB7z7jOonFatnns4E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jjupfj7uAi6xD50ApETPH+RDl/DqR9IWX31gydQAN+juak3UAXmBpFxqJ4qNdlIIH
 PTNSIGIW9lfZoJhPhlg9ZgBuEF654JofOlqoVHO72a0wM2WnWMA2dDlBBnOgaGPdKV
 e64mpXI+w+P+l5x0Zkplne4q2eVYr+7vutj2adEY=
Date: Fri, 30 Oct 2020 10:36:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Subject: Re: [PATCH v3] soundwire: SDCA: add helper macro to access controls
Message-ID: <20201030093651.GA2080962@kroah.com>
References: <20201029204955.8568-1-yung-chuan.liao@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201029204955.8568-1-yung-chuan.liao@linux.intel.com>
Cc: pierre-louis.bossart@linux.intel.com, alsa-devel@alsa-project.org,
 vinod.koul@linaro.org, mengdong.lin@intel.com, linux-kernel@vger.kernel.org,
 ranjani.sridharan@linux.intel.com, hui.wang@canonical.com, vkoul@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, sanyog.r.kale@intel.com,
 rander.wang@linux.intel.com, bard.liao@intel.com
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

On Fri, Oct 30, 2020 at 04:49:55AM +0800, Bard Liao wrote:
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
> Changelog:
> 
> v2:
>  - add SDW_SDCA_MBQ_CTL
> 
> v3:
>  - add SDW_SDCA_NEXT_CTL
> 
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
> +
>  #endif /* __SDW_REGISTERS_H */


No users of these macros?

