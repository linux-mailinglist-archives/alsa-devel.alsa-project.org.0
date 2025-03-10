Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B635EA592B8
	for <lists+alsa-devel@lfdr.de>; Mon, 10 Mar 2025 12:26:09 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [45.14.194.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9B5F607B1;
	Mon, 10 Mar 2025 12:25:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9B5F607B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1741605968;
	bh=i/7QjVV7rIb5AvxHrpWor82wSEVgjqYwZDr90kTdXOk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=poCaEIcnLd57SvzNpOt8GRB3l9fpRL1RibHbJ1lilYAVGRZn2MvO2AdyS2R2HW9eD
	 h4meuQNpnEtxYP2DdsAlOG1JeMx3ri2sbmP2QKmFoOvKvLQ9w1FgVLwru7QiErDe8l
	 PgsRIAfZ05DS9u7VjGXtacdMl7T3tbRZslF7+Pc0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id AF395F8051D; Mon, 10 Mar 2025 12:25:34 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 78EFDF804F3;
	Mon, 10 Mar 2025 12:25:34 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D4D5EF800ED; Mon, 10 Mar 2025 12:25:28 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_VALIDITY_RPBL_BLOCKED,RCVD_IN_VALIDITY_SAFE_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 8B69CF800BD
	for <alsa-devel@alsa-project.org>; Mon, 10 Mar 2025 12:25:25 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 8B69CF800BD
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=oBjLiXxD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741605928; x=1773141928;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=i/7QjVV7rIb5AvxHrpWor82wSEVgjqYwZDr90kTdXOk=;
  b=oBjLiXxDauJtwSqv9MeZpx+dEWNR0GaUoFHSPSl10N2r0d/ydqZoWeyK
   zMHiDfGpHwmIO7cWIV5CbNi+mbxpkgBpsR/cJLeSUTj9iQmp9QZbWcFKX
   xBsYoog/h2q+Ek1lWVM7GqvSTWmy3KjzD5sZ3v/VTwA291LkO9/IKBBKP
   k3ykclkKflYZzTCqD5QcMhdRzvqBs5talhkQPo28GNJI9gZw/Yfmi/nS/
   VXunoexATzuZftEFOQYEfAnKXpUnC6eChYgDi7SfI3KtC/wdbbi/DuFTl
   8MLmDZ5x9iS1crOZL1YeOR5DTI5FK1qV/+AA5riJanBRFJcVvKSkN9uol
   w==;
X-CSE-ConnectionGUID: 3io5i6j4T/eyFx4fH6ogXA==
X-CSE-MsgGUID: l4E4zz6+Sc+LZ4aYSWBHmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11368"; a="42634071"
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600";
   d="scan'208";a="42634071"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 04:25:23 -0700
X-CSE-ConnectionGUID: hJMWasBGToeid9xeZGyNeQ==
X-CSE-MsgGUID: cx2Dvm+2RPqB4/EUr8hb2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,235,1736841600";
   d="scan'208";a="124964273"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.8.107])
 ([10.94.8.107])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2025 04:25:19 -0700
Message-ID: <f9436b0d-8cfa-4f37-9b0c-395c033f849e@linux.intel.com>
Date: Mon, 10 Mar 2025 12:25:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/14] ASoC: amd: acp: Implement acp_common_hw_ops support
 for acp platforms
To: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>,
 broonie@kernel.org, alsa-devel@alsa-project.org
Cc: Vijendar.Mukunda@amd.com, mario.limonciello@amd.com,
 Basavaraj.Hiregoudar@amd.com, Sunil-kumar.Dommati@amd.com,
 syed.sabakareem@amd.com, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Jeff Johnson <quic_jjohnson@quicinc.com>,
 Peter Zijlstra <peterz@infradead.org>, Greg KH <gregkh@linuxfoundation.org>,
 "open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <linux-sound@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250310104601.7325-1-venkataprasad.potturu@amd.com>
 <20250310104601.7325-3-venkataprasad.potturu@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20250310104601.7325-3-venkataprasad.potturu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UQ6S2LRLMSIBCGK4WJDRW7SFLEN4NKBO
X-Message-ID-Hash: UQ6S2LRLMSIBCGK4WJDRW7SFLEN4NKBO
X-MailFrom: amadeuszx.slawinski@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.9
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/UQ6S2LRLMSIBCGK4WJDRW7SFLEN4NKBO/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 3/10/2025 11:45 AM, Venkata Prasad Potturu wrote:
> Implement acp common hardware ops for acp_init and acp_deinit
> funcions to support commons ops for all platforms.
> 
> Signed-off-by: Venkata Prasad Potturu <venkataprasad.potturu@amd.com>
> ---
>   sound/soc/amd/acp/acp-legacy-common.c | 50 +++++++++++++++++++++++++++
>   sound/soc/amd/acp/acp-pci.c           | 13 ++++---
>   sound/soc/amd/acp/amd.h               | 36 +++++++++++++++++++
>   3 files changed, 95 insertions(+), 4 deletions(-)
> 

...

>   
> @@ -252,6 +274,20 @@ int restore_acp_i2s_params(struct snd_pcm_substream *substream,
>   
>   void check_acp_config(struct pci_dev *pci, struct acp_chip_info *chip);
>   
> +static inline int acp_hw_init(struct acp_chip_info *chip)
> +{
> +	if (chip && chip->acp_hw_ops && chip->acp_hw_ops->acp_init)
> +		return chip->acp_hw_ops->acp_init(chip);
> +	return -EOPNOTSUPP;
> +}
> +
> +static inline int acp_hw_deinit(struct acp_chip_info *chip)
> +{
> +	if (chip && chip->acp_hw_ops && chip->acp_hw_ops->acp_init)

Shouldn't it check for ->acp_deinit() instead?

> +		return chip->acp_hw_ops->acp_deinit(chip);
> +	return -EOPNOTSUPP;
> +}
> +
>   static inline u64 acp_get_byte_count(struct acp_dev_data *adata, int dai_id, int direction)
>   {
>   	u64 byte_count = 0, low = 0, high = 0;

