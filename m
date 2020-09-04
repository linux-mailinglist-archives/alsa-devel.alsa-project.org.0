Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C5125D0CB
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Sep 2020 07:04:48 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C0C11AC6;
	Fri,  4 Sep 2020 07:03:57 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C0C11AC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599195887;
	bh=JN0FZI582IJcgLwwiMOYbixgJHqCRoL83mENL/77ZfM=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LdUkhISl1QZqGRjwSI1SkmyUScm9GkJUvwkWEhHB7WVcXRbIg505+NCZTlMjoNaAg
	 r39IXsBbgo0sCQVPjZAnl36TO3XYnMrpoRWPpS5NqkAB2LOxvUii6IFCNRtmNLv+bc
	 70tjNPQProa8CUwTbUaH1ndlYwYnIUeryF6eTVUc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 882BFF80257;
	Fri,  4 Sep 2020 07:03:06 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A546AF8024A; Fri,  4 Sep 2020 07:03:04 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,PRX_BODY_21,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id CE11BF800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Sep 2020 07:02:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz CE11BF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="be/lZzo/"
Received: from localhost (unknown [122.182.253.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A64E206F2;
 Fri,  4 Sep 2020 05:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599195769;
 bh=JN0FZI582IJcgLwwiMOYbixgJHqCRoL83mENL/77ZfM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=be/lZzo/VK2yulLqLcXmZhrVXOkDY4yNL96PCBPrXw6QDqyWmJ7jFG7c65t594kr5
 tS0hdq9CrOrIhm+GxMb/C+R4VUqRGWdwFaz7lYJMmcLGzjEJVPLe107NxME1sFl7ok
 WwQoiwAaB7IwZ+5qUjIusbzw+QFZmKNZcZuw/iYc=
Date: Fri, 4 Sep 2020 10:32:44 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH v2 2/3] soundwire: SDCA: add helper macro to access
 controls
Message-ID: <20200904050244.GT2639@vkoul-mobl>
References: <20200901162225.33343-1-pierre-louis.bossart@linux.intel.com>
 <20200901162225.33343-3-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901162225.33343-3-pierre-louis.bossart@linux.intel.com>
Cc: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>,
 alsa-devel@alsa-project.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 tiwai@suse.de, gregkh@linuxfoundation.org,
 open list <linux-kernel@vger.kernel.org>, broonie@kernel.org,
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

On 01-09-20, 11:22, Pierre-Louis Bossart wrote:
> The upcoming SDCA (SoundWire Device Class Audio) specification defines
> a hierarchical encoding to interface with Class-defined capabilities.
> 
> The specification is not yet accessible to the general public but this
> information is released with explicit permission from the MIPI Board
> to avoid delays with SDCA support on Linux platforms.
> 
> A block of 64 MBytes of register addresses is allocated to SDCA
> controls, starting at address 0x40000000. The 26 LSBs which identify
> individual controls are set based on the following variables:
> 
> - Function Number. An SCDA device can be split in up to 8 independent
>   Functions. Each of these Functions is described in the SDCA
>   specification, e.g. Smart Amplifier, Smart Microphone, Simple
>   Microphone, Jack codec, HID, etc.
> 
> - Entity Number.  Within each Function, an Entity is an identifiable
>   block.  Up to 127 Entities are connected in a pre-defined
>   graph (similar to USB), with Entity0 reserved for Function-level
>   configurations.  In contrast to USB, the SDCA spec pre-defines
>   Function Types, topologies, and allowed options, i.e. the degree of
>   freedom is not unlimited to limit the possibility of errors in
>   descriptors leading to software quirks.
> 
> - Control Selector. Within each Entity, the SDCA specification defines
>   up-to 48 controls such as Mute, Gain, AGC, etc, and 16
>   implementation defined ones. Some Control Selectors might be used
>   for low-level platform setup, and other exposed to applications and
>   users. Note that the same Control Selector capability, e.g. Latency
>   control, might be located at different offsets in different
>   entities - the Control Selector mapping is Entity-specific.
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

This is good, thanks for adding it in changelog. Can you also add this
description to Documentation (that can come as an individual patch),

> 
> Reviewed-by: Rander Wang <rander.wang@linux.intel.com>
> Reviewed-by: Guennadi Liakhovetski <guennadi.liakhovetski@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Acked-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  include/linux/soundwire/sdw_registers.h | 33 +++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/include/linux/soundwire/sdw_registers.h b/include/linux/soundwire/sdw_registers.h
> index 5d3c271af7d1..99ff7afc27a2 100644
> --- a/include/linux/soundwire/sdw_registers.h
> +++ b/include/linux/soundwire/sdw_registers.h
> @@ -305,4 +305,37 @@
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

So this is for 30:26

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
> +#define SDW_SDCA_CTL(fun, ent, ctl, ch)						\
> +	(BIT(30)							|	\

Programmatically this is fine, but then since we are defining for the
description above, IMO it would actually make sense for this to be defined
as FIELD_PREP:

        FIELD_PREP(GENMASK(30, 26), 1)

or better

        u32_encode_bits(GENMASK(30, 26), 1)

> +	FIELD_PREP(GENMASK(24, 22), FIELD_GET(GENMASK(2, 0), (fun)))	|	\

Why not use u32_encode_bits(GENMASK(24, 22), (fun)) instead for this and
below?

> +	FIELD_PREP(BIT(21), FIELD_GET(BIT(6), (ent)))			|	\
> +	FIELD_PREP(GENMASK(20, 19), FIELD_GET(GENMASK(5, 4), (ctl)))	|	\
> +	FIELD_PREP(GENMASK(17, 15), FIELD_GET(GENMASK(5, 3), (ch)))	|	\
> +	FIELD_PREP(GENMASK(12, 7), FIELD_GET(GENMASK(5, 0), (ent)))	|	\
> +	FIELD_PREP(GENMASK(6, 3), FIELD_GET(GENMASK(3, 0), (ctl)))	|	\
> +	FIELD_PREP(GENMASK(2, 0), FIELD_GET(GENMASK(2, 0), (ch))))

Also, can we rather have a nice function for this, that would look much
cleaner

And while at it, consider defining masks for various fields rather than
using numbers in GENMASK() above, that would look better, be more
readable and people can reuse it.

-- 
~Vinod
