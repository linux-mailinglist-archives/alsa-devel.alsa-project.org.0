Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F7967273B
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Jan 2023 19:40:10 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 705D678B4;
	Wed, 18 Jan 2023 19:39:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 705D678B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1674067209;
	bh=rLOjY01QTq0Btsgrlpy5oCl1OvMXzrTFhGhJXtQRRpc=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=pCrpvsxUE8x5JLRo5DS+7XdJL69uLfWn/R6Kws27+uSiLmmngX8AXxbv1zomoKB4H
	 7s7VLWBX5J7Z39wV2bx2sIlM7kmobUm0BZ3UVEysfhWXVeSRYiefh+YghiiDrh0WrM
	 Vd9od8PdXf/fE2Tdeo8Ef88i9KI/nwt2bXfOUh34=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16A5EF80083;
	Wed, 18 Jan 2023 19:38:32 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C0094F80520; Wed, 18 Jan 2023 19:38:29 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBB6EF8024C
 for <alsa-devel@alsa-project.org>; Wed, 18 Jan 2023 19:38:19 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBB6EF8024C
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=mCUoYq/G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674067101; x=1705603101;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rLOjY01QTq0Btsgrlpy5oCl1OvMXzrTFhGhJXtQRRpc=;
 b=mCUoYq/Gn76v40p7wT5zGBTZ1aAOidLT9Lkdz03hMNh1qtv6Uo5OGptz
 c4ibOUrgUjYS01cdFfHeIerazgQ7YivA3cbmAUcvU9qjNzlcUiIp5Zp8t
 Jf/RHzlpbVR2ZzM/VslfOB3oFP1j8S1NwKMsbqX/voip2REyEgO1s4PNk
 DH058g9UkMz8heimWIYWJew/cW81zGDD6YP8DK+RX+Amk1h7eQmWM14I9
 QiR79y8MOUK+QR9PYldNb+Y6q3Wf1HlY9JLI88EOhjuiWatSI6aeonnxg
 iqGiTZ0q6DEBSFIcJrn2/cqJhVoSDyhr/XFR2DsiRK2Ct/asK0mUVPNmi w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327138517"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="327138517"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 10:37:56 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="783777249"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="783777249"
Received: from jaibarra-mobl.amr.corp.intel.com (HELO [10.209.131.1])
 ([10.209.131.1])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 10:37:55 -0800
Message-ID: <eb9fe53e-013b-e477-1d14-8d0c1c7514fc@linux.intel.com>
Date: Wed, 18 Jan 2023 10:41:18 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.4.2
Subject: Re: [PATCH v2 2/8] ASoC: cs42l42: Add SOFT_RESET_REBOOT register
Content-Language: en-US
To: Stefan Binding <sbinding@opensource.cirrus.com>,
 Mark Brown <broonie@kernel.org>
References: <20230118160452.2385494-1-sbinding@opensource.cirrus.com>
 <20230118160452.2385494-3-sbinding@opensource.cirrus.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230118160452.2385494-3-sbinding@opensource.cirrus.com>
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org,
 Richard Fitzgerald <rf@opensource.cirrus.com>, linux-kernel@vger.kernel.org
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>



On 1/18/23 10:04, Stefan Binding wrote:
> From: Richard Fitzgerald <rf@opensource.cirrus.com>
> 
> The SOFT_RESET_REBOOT register is needed to recover CS42L42 state after
> a Soundwire bus reset.

Humm, you probably want to clarify the terminology, the 'soft reset' is
defined in the SoundWire spec as the case where the peripheral device
loses sync. Bus reset is a Severe Reset, but there's also a Hard Reset.

does this 'SOFT_RESET_REBOOT' need to be accessed when there's a soft
reset, or only after a Severe/Hard Reset?

> 
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>
> Signed-off-by: Stefan Binding <sbinding@opensource.cirrus.com>
> ---
>  include/sound/cs42l42.h    | 5 +++++
>  sound/soc/codecs/cs42l42.c | 2 ++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/include/sound/cs42l42.h b/include/sound/cs42l42.h
> index 1d1c24fdd0cae..3994e933db195 100644
> --- a/include/sound/cs42l42.h
> +++ b/include/sound/cs42l42.h
> @@ -34,6 +34,7 @@
>  #define CS42L42_PAGE_24		0x2400
>  #define CS42L42_PAGE_25		0x2500
>  #define CS42L42_PAGE_26		0x2600
> +#define CS42L42_PAGE_27		0x2700
>  #define CS42L42_PAGE_28		0x2800
>  #define CS42L42_PAGE_29		0x2900
>  #define CS42L42_PAGE_2A		0x2A00
> @@ -720,6 +721,10 @@
>  
>  #define CS42L42_SRC_SDOUT_FS		(CS42L42_PAGE_26 + 0x09)
>  
> +/* Page 0x27 DMA */
> +#define CS42L42_SOFT_RESET_REBOOT	(CS42L42_PAGE_27 + 0x01)
> +#define CS42L42_SFT_RST_REBOOT_MASK	BIT(1)
> +
>  /* Page 0x28 S/PDIF Registers */
>  #define CS42L42_SPDIF_CTL1		(CS42L42_PAGE_28 + 0x01)
>  #define CS42L42_SPDIF_CTL2		(CS42L42_PAGE_28 + 0x02)
> diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
> index 2fefbcf7bd130..82aa11d6937be 100644
> --- a/sound/soc/codecs/cs42l42.c
> +++ b/sound/soc/codecs/cs42l42.c
> @@ -293,6 +293,7 @@ bool cs42l42_readable_register(struct device *dev, unsigned int reg)
>  	case CS42L42_SPDIF_SW_CTL1:
>  	case CS42L42_SRC_SDIN_FS:
>  	case CS42L42_SRC_SDOUT_FS:
> +	case CS42L42_SOFT_RESET_REBOOT:
>  	case CS42L42_SPDIF_CTL1:
>  	case CS42L42_SPDIF_CTL2:
>  	case CS42L42_SPDIF_CTL3:
> @@ -358,6 +359,7 @@ bool cs42l42_volatile_register(struct device *dev, unsigned int reg)
>  	case CS42L42_LOAD_DET_DONE:
>  	case CS42L42_DET_STATUS1:
>  	case CS42L42_DET_STATUS2:
> +	case CS42L42_SOFT_RESET_REBOOT:
>  		return true;
>  	default:
>  		return false;
