Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AC107252998
	for <lists+alsa-devel@lfdr.de>; Wed, 26 Aug 2020 10:57:36 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 29114172A;
	Wed, 26 Aug 2020 10:56:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 29114172A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1598432256;
	bh=QMndYZ6vu/NhmekefXUyl5NW9B3dLtTbytao7DwlYdE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=VaZHp/6gcrI2jB9Op8nz+5EKg9JhpeKd+E4dac2hmzznq5VF3rrHxzZhfbOTF13kf
	 l9FQD6lmXue9BRmLWZ1Zpfn/kNcKpU0hJuIW8u7I0HZvpDyAelT6yzUJs+er3izwyr
	 ErdBmL7nS7SxRjhPevBLGzpJ1uRecdfzTEZZhEFA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 1B18FF800EB;
	Wed, 26 Aug 2020 10:55:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DFB11F800EB; Wed, 26 Aug 2020 10:55:52 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_21,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6852CF800EB
 for <alsa-devel@alsa-project.org>; Wed, 26 Aug 2020 10:55:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6852CF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="Mpr1CDb2"
Received: from localhost (unknown [122.171.38.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C5066206EB;
 Wed, 26 Aug 2020 08:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598432144;
 bh=QMndYZ6vu/NhmekefXUyl5NW9B3dLtTbytao7DwlYdE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mpr1CDb24jgZnMbRof/qhYO3PbfKOejO9E4DC6d1PAnQLN2uuJx/07a2WDSuDCPM/
 xwxsDEcVO1R3pHinMT5eu/k1Ro+oC8vVB5Pz8998oKwTX4oEqcbik95K+LkR973hOZ
 L/Or+IzLFPFZpGNkpsqvYIG/fiVXfW9qpea5uBX0=
Date: Wed, 26 Aug 2020 14:25:40 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/4] soundwire: SDCA: add helper macro to access controls
Message-ID: <20200826085540.GY2639@vkoul-mobl>
References: <20200825171656.75836-1-pierre-louis.bossart@linux.intel.com>
 <20200825171656.75836-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200825171656.75836-4-pierre-louis.bossart@linux.intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Hui Wang <hui.wang@canonical.com>, broonie@kernel.org,
 srinivas.kandagatla@linaro.org, jank@cadence.com, slawomir.blauciak@intel.com,
 Sanyog Kale <sanyog.r.kale@intel.com>,
 Bard liao <yung-chuan.liao@linux.intel.com>,
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

On 25-08-20, 12:16, Pierre-Louis Bossart wrote:
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
> ---
>  include/linux/soundwire/sdw_registers.h | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/include/linux/soundwire/sdw_registers.h b/include/linux/soundwire/sdw_registers.h
> index 5d3c271af7d1..906dadda7387 100644
> --- a/include/linux/soundwire/sdw_registers.h
> +++ b/include/linux/soundwire/sdw_registers.h
> @@ -305,4 +305,17 @@
>  #define SDW_CASC_PORT_MASK_INTSTAT3		1
>  #define SDW_CASC_PORT_REG_OFFSET_INTSTAT3	2
>  
> +/* v1.2 device - SDCA address mapping */

Can you please add description of bits used by each field here,
something like we have done for DevId

> +#define SDW_SDCA_CTL(fun, ent, ctl, ch)		(BIT(30) |			\
> +						 (((fun) & 0x7) << 22) |	\
> +						 (((ent) & 0x40) << 15) |	\
> +						 (((ent) & 0x3f) << 7) |	\
> +						 (((ctl) & 0x30) << 15) |	\
> +						 (((ctl) & 0x0f) << 3) |	\
> +						 (((ch) & 0x38) << 12) |	\
> +						 ((ch) & 0x07))

GENMASK() for the bitmaps here please. Also it would look very neat by
using FIELD_PREP() here, you can skip the bit shifts and they would be
done by FIELD_PREP() for you.

> -- 
> 2.25.1

-- 
~Vinod
