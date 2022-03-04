Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D51D4CD959
	for <lists+alsa-devel@lfdr.de>; Fri,  4 Mar 2022 17:44:30 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id A4BAB1F05;
	Fri,  4 Mar 2022 17:43:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz A4BAB1F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1646412269;
	bh=ogTCBxXfnhxDtUlU6jMFmsSEI2vBzzJm0ACcpQXkooU=;
	h=Subject:From:To:Date:In-Reply-To:References:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qBSlWfhzXqUw1LTC7Lx3pKe5OO+MiGG5OvifQ9mzrJzxihi3Z/Ib8RkfD74m6Dd2u
	 NG9DviRARMfeeepMdIfHDzvL44SvLTcF7ozJhLKQflDWHTzN3l63aiima2kyQmq+1/
	 9GPzrORPXajS9JRINn4dg2noA8Rf/AFwg7nMT0hM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 245D7F801F5;
	Fri,  4 Mar 2022 17:43:21 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DBC28F801EC; Fri,  4 Mar 2022 17:43:19 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 084DEF800F0
 for <alsa-devel@alsa-project.org>; Fri,  4 Mar 2022 17:43:16 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 084DEF800F0
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="KRT8q1rx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646412198; x=1677948198;
 h=message-id:subject:from:to:cc:date:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ogTCBxXfnhxDtUlU6jMFmsSEI2vBzzJm0ACcpQXkooU=;
 b=KRT8q1rxZ+E0JaFXWwesoEea4sIxjhdW/xFlt5HSYxc93i3kGg1shd0A
 RJN5uxJv24xbhQy43Ut0xPj+ECFEgpek1ZsMwpxXlKc9LjIN90SLR2Bsh
 A8dKN6J82Ycgaq/FhlAY3RHQUQlu6TP277exbpCcRZvnq2mVLklgXjJgZ
 ht9T9JlAH5fYRamdfwLfv1UpPzRZkffyWesePvV6WRZiYtn6zz+f68PAo
 H+ZFniyjwEsP7+Ujifev2kQ6P8FLeqvyCI76Jf1atJq1YS50sDy/JMawY
 q+bUo0U9qnD8uOpSe4eQ6c4hkhAJmImh3sLBrFrjPR4JveniiCLLWiKeA w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="340442223"
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="340442223"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:43:14 -0800
X-IronPort-AV: E=Sophos;i="5.90,155,1643702400"; d="scan'208";a="779681859"
Received: from srstocke-mobl.amr.corp.intel.com ([10.251.130.3])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 08:43:14 -0800
Message-ID: <8f7b174fc61797e7f229ac8d1e13631863bc3372.camel@linux.intel.com>
Subject: Re: [PATCH v3 12/17] ASoC: Intel: avs: Declare module configuration
 types
From: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>, alsa-devel@alsa-project.org
Date: Fri, 04 Mar 2022 08:43:14 -0800
In-Reply-To: <20220304145755.2844173-13-cezary.rojewski@intel.com>
References: <20220304145755.2844173-1-cezary.rojewski@intel.com>
 <20220304145755.2844173-13-cezary.rojewski@intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: upstream@semihalf.com, harshapriya.n@intel.com, rad@semihalf.com,
 tiwai@suse.com, pierre-louis.bossart@linux.intel.com, hdegoede@redhat.com,
 broonie@kernel.org, amadeuszx.slawinski@linux.intel.com,
 cujomalainey@chromium.org, lma@semihalf.com
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

On Fri, 2022-03-04 at 15:57 +0100, Cezary Rojewski wrote:
> Declare structures and constants for all modules being part of basefw
> binary. These are used in streaming operations to communicate the
> needs
> of software to firmware side.
> 
> While adding module types, append handler for SET_SINK_FORMAT runtime
> for COPIER module which allows for configuration of output pin other
> than the default one (0).
> 
> Signed-off-by: Amadeusz Sławiński <
> amadeuszx.slawinski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
> ---
>  sound/soc/intel/avs/messages.c |  17 +++
>  sound/soc/intel/avs/messages.h | 252
> +++++++++++++++++++++++++++++++++
>  2 files changed, 269 insertions(+)
> 
> diff --git a/sound/soc/intel/avs/messages.c
> b/sound/soc/intel/avs/messages.c
> index 7a2a7206df4b..44566705e56c 100644
> --- a/sound/soc/intel/avs/messages.c
> +++ b/sound/soc/intel/avs/messages.c
> @@ -678,3 +678,20 @@ int avs_ipc_get_modules_info(struct avs_dev
> *adev, struct avs_mods_info **info)
>  	*info = (struct avs_mods_info *)payload;
>  	return 0;
>  }
> +
> +int avs_ipc_copier_set_sink_format(struct avs_dev *adev, u16
> module_id,
> +				   u8 instance_id, u32 sink_id,
> +				   const struct avs_audio_format
> *src_fmt,
> +				   const struct avs_audio_format
> *sink_fmt)
> +{
> +	struct avs_copier_sink_format cpr_fmt;
> +
> +	cpr_fmt.sink_id = sink_id;
> +	/* Firmware expects driver to resend copier's input format. */
> +	cpr_fmt.src_fmt = *src_fmt;
> +	cpr_fmt.sink_fmt = *sink_fmt;
> +
> +	return avs_ipc_set_large_config(adev, module_id, instance_id,
> +					AVS_COPIER_SET_SINK_FORMAT,
> +					(u8 *)&cpr_fmt,
> sizeof(cpr_fmt));
> +}
> diff --git a/sound/soc/intel/avs/messages.h
> b/sound/soc/intel/avs/messages.h
> index 67ba0a6347a1..966139e9663d 100644
> --- a/sound/soc/intel/avs/messages.h
> +++ b/sound/soc/intel/avs/messages.h
> @@ -498,4 +498,256 @@ static inline bool
> avs_module_entry_is_loaded(struct avs_module_entry *mentry)
>  
>  int avs_ipc_get_modules_info(struct avs_dev *adev, struct
> avs_mods_info **info);
>  
> +/* Module configuration */
> +
> +#define AVS_MIXIN_MOD_UUID \
> +	GUID_INIT(0x39656EB2, 0x3B71, 0x4049, 0x8D, 0x3F, 0xF9, 0x2C,
> 0xD5, 0xC4, 0x3C, 0x09)
> +
> +#define AVS_MIXOUT_MOD_UUID \
> +	GUID_INIT(0x3C56505A, 0x24D7, 0x418F, 0xBD, 0xDC, 0xC1, 0xF5,
> 0xA3, 0xAC, 0x2A, 0xE0)
> +
> +#define AVS_COPIER_MOD_UUID \
> +	GUID_INIT(0x9BA00C83, 0xCA12, 0x4A83, 0x94, 0x3C, 0x1F, 0xA2,
> 0xE8, 0x2F, 0x9D, 0xDA)
> +
> +#define AVS_KPBUFF_MOD_UUID \
> +	GUID_INIT(0xA8A0CB32, 0x4A77, 0x4DB1, 0x85, 0xC7, 0x53, 0xD7,
> 0xEE, 0x07, 0xBC, 0xE6)
> +
> +#define AVS_MICSEL_MOD_UUID \
> +	GUID_INIT(0x32FE92C1, 0x1E17, 0x4FC2, 0x97, 0x58, 0xC7, 0xF3,
> 0x54, 0x2E, 0x98, 0x0A)
> +
> +#define AVS_MUX_MOD_UUID \
> +	GUID_INIT(0x64CE6E35, 0x857A, 0x4878, 0xAC, 0xE8, 0xE2, 0xA2,
> 0xF4, 0x2e, 0x30, 0x69)
> +
> +#define AVS_UPDWMIX_MOD_UUID \
> +	GUID_INIT(0x42F8060C, 0x832F, 0x4DBF, 0xB2, 0x47, 0x51, 0xE9,
> 0x61, 0x99, 0x7b, 0x35)
> +
> +#define AVS_SRCINTC_MOD_UUID \
> +	GUID_INIT(0xE61BB28D, 0x149A, 0x4C1F, 0xB7, 0x09, 0x46, 0x82,
> 0x3E, 0xF5, 0xF5, 0xAE)
> +
> +#define AVS_PROBE_MOD_UUID \
> +	GUID_INIT(0x7CAD0808, 0xAB10, 0xCD23, 0xEF, 0x45, 0x12, 0xAB,
> 0x34, 0xCD, 0x56, 0xEF)
> +
> +#define AVS_AEC_MOD_UUID \
> +	GUID_INIT(0x46CB87FB, 0xD2C9, 0x4970, 0x96, 0xD2, 0x6D, 0x7E,
> 0x61, 0x4B, 0xB6, 0x05)
> +
> +#define AVS_ASRC_MOD_UUID \
> +	GUID_INIT(0x66B4402D, 0xB468, 0x42F2, 0x81, 0xA7, 0xB3, 0x71,
> 0x21, 0x86, 0x3D, 0xD4)
> +
> +#define AVS_INTELWOV_MOD_UUID \
> +	GUID_INIT(0xEC774FA9, 0x28D3, 0x424A, 0x90, 0xE4, 0x69, 0xF9,
> 0x84, 0xF1, 0xEE, 0xB7)
Why do you need to hard-code this? DOes the fw config info that you
retrieve using get_large_config or even the FW manifest have it
already?
Thanks,Ranjani

