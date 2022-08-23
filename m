Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC3659D49B
	for <lists+alsa-devel@lfdr.de>; Tue, 23 Aug 2022 10:34:55 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 462F51630;
	Tue, 23 Aug 2022 10:34:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 462F51630
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1661243695;
	bh=LPlSmIhgx1twdTlubrcxMSh4KOzxNRfH6HiP2Nso1Jo=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KMBcTwduOdUga7jCpguG+B6Zwm5N3L7Y4xkwpUqfUbLi6DiSF0OEy6IgCNTrPrZLQ
	 4bpLUBFRpMKi2eknsK36PlTzrqu7ey31+2s9Kc4ToNFDUhES9Pkf/ZQWzXRo7K/J5b
	 5xqaa88KicwZmBBK4ZslmLrLBHZyrscQH3qii+gE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CEE5BF800C9;
	Tue, 23 Aug 2022 10:33:55 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id EA627F8020D; Tue, 23 Aug 2022 10:33:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 63499F800A7
 for <alsa-devel@alsa-project.org>; Tue, 23 Aug 2022 10:33:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 63499F800A7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="HtUi0XLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661243628; x=1692779628;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=LPlSmIhgx1twdTlubrcxMSh4KOzxNRfH6HiP2Nso1Jo=;
 b=HtUi0XLbRccC2rWk4pw1fFglG13+sDzHzBcykeWKN50wE0oA7anivXxc
 c+/kMjoe44h0juDKhUdjLyJmC57V9xwUiUZ3ksACIw2t9mmuUAp515VQU
 pNAf82FtdPp9WHlvE/9hRWCoTEnUamjwkBziWKyCEnmKpVXaToosQ+wjs
 7QNILX95GWr2IAl+Cxpg1r7X76a+KxjFHubxBCh2tc3ZXSnAj/Lv3C8P4
 YwJfiR7vkcvI8J+nJuaR0rbRMVq9upiRcAmp8FhHhbdGIenm4x1LcYfE5
 SPqn1kDTpEy18D6OTYqAq99ee/F5Dce6xUEAPhdOR0Zm0c3Y9Rn2INpaH Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10447"; a="379918798"
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="379918798"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 01:33:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,257,1654585200"; d="scan'208";a="585885602"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.249])
 ([10.99.241.249])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Aug 2022 01:33:42 -0700
Message-ID: <b112f824-631d-40d4-31bd-9bd56f31930e@linux.intel.com>
Date: Tue, 23 Aug 2022 10:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 2/4] ALSA: hda: intel-nhlt: add intel_nhlt_ssp_mclk_mask()
Content-Language: en-US
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 alsa-devel@alsa-project.org
References: <20220822185911.170440-1-pierre-louis.bossart@linux.intel.com>
 <20220822185911.170440-3-pierre-louis.bossart@linux.intel.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20220822185911.170440-3-pierre-louis.bossart@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: tiwai@suse.de, Cezary Rojewski <cezary.rojewski@intel.com>,
 broonie@kernel.org, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>
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

On 8/22/2022 8:59 PM, Pierre-Louis Bossart wrote:
> SOF topologies hard-code the MCLK used for SSP connections. That was a
> bad idea in hindsight, this information should really come from BIOS
> and/or machine driver.
> 
> This patch introduces a helper to scan all SSP endpoints connected to
> a codec, and all formats to see what MCLK is used. When BIT(0) of the
> mdivc offset if set in the SSP blob, MCLK0 is used, and likewise when
> BIT(1) is set MCLK1 is used.
> 
> The case where both MCLKs are used is possible but has never been seen
> in practice so should be treated as an error by the caller.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> Reviewed-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
> Reviewed-by: Bard Liao <yung-chuan.liao@linux.intel.com>
> ---
>   include/sound/intel-nhlt.h |  7 +++++
>   sound/hda/intel-nhlt.c     | 61 ++++++++++++++++++++++++++++++++++++++
>   2 files changed, 68 insertions(+)
> 
> diff --git a/include/sound/intel-nhlt.h b/include/sound/intel-nhlt.h
> index 3d5cf201cd802..53470d6a28d65 100644
> --- a/include/sound/intel-nhlt.h
> +++ b/include/sound/intel-nhlt.h
> @@ -136,6 +136,8 @@ bool intel_nhlt_has_endpoint_type(struct nhlt_acpi_table *nhlt, u8 link_type);
>   
>   int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8 device_type);
>   
> +int intel_nhlt_ssp_mclk_mask(struct nhlt_acpi_table *nhlt, int ssp_num);
> +
>   struct nhlt_specific_cfg *
>   intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
>   			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
> @@ -169,6 +171,11 @@ static inline int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8
>   	return 0;
>   }
>   
> +static inline int intel_nhlt_ssp_mclk_mask(struct nhlt_acpi_table *nhlt, int ssp_num)
> +{
> +	return 0;
> +}
> +
>   static inline struct nhlt_specific_cfg *
>   intel_nhlt_get_endpoint_blob(struct device *dev, struct nhlt_acpi_table *nhlt,
>   			     u32 bus_id, u8 link_type, u8 vbps, u8 bps,
> diff --git a/sound/hda/intel-nhlt.c b/sound/hda/intel-nhlt.c
> index 13bb0ccfb36c0..0323aedb6ecf4 100644
> --- a/sound/hda/intel-nhlt.c
> +++ b/sound/hda/intel-nhlt.c
> @@ -157,6 +157,67 @@ int intel_nhlt_ssp_endpoint_mask(struct nhlt_acpi_table *nhlt, u8 device_type)
>   }
>   EXPORT_SYMBOL(intel_nhlt_ssp_endpoint_mask);
>   
> +#define SSP_BLOB_V1_0_SIZE		84
> +#define SSP_BLOB_V1_0_MDIVC_OFFSET	19 /* offset in u32 */
> +#define SSP_BLOB_V1_5_SIZE		96
> +#define SSP_BLOB_V1_5_MDIVC_OFFSET	21 /* offset in u32 */
> +#define SSP_BLOB_VER_1_5		0xEE000105
> +#define SSP_BLOB_V2_0_MDIVC_OFFSET	20 /* offset in u32 */
> +#define SSP_BLOB_VER_2_0		0xEE000200
> +
> +int intel_nhlt_ssp_mclk_mask(struct nhlt_acpi_table *nhlt, int ssp_num)
> +{
> +	struct nhlt_endpoint *epnt;
> +	struct nhlt_fmt *fmt;
> +	struct nhlt_fmt_cfg *cfg;
> +	int mclk_mask = 0;
> +	int i, j;
> +
> +	if (!nhlt)
> +		return 0;
> +
> +	epnt = (struct nhlt_endpoint *)nhlt->desc;
> +	for (i = 0; i < nhlt->endpoint_count; i++) {
> +
> +		/* we only care about endpoints connected to an audio codec over SSP */
> +		if (epnt->linktype == NHLT_LINK_SSP &&
> +		    epnt->device_type == NHLT_DEVICE_I2S &&
> +		    epnt->virtual_bus_id == ssp_num) {

if (epnt->linktype != NHLT_LINK_SSP ||
     epnt->device_type != NHLT_DEVICE_I2S ||
     epnt->virtual_bus_id != ssp_num)
	continue;

and then you can remove one indentation level below?

> +
> +			fmt = (struct nhlt_fmt *)(epnt->config.caps + epnt->config.size);
> +			cfg = fmt->fmt_config;
> +
> +			/*
> +			 * In theory all formats should use the same MCLK but it doesn't hurt to
> +			 * double-check that the configuration is consistent
> +			 */
> +			for (j = 0; j < fmt->fmt_count; j++) {
> +				u32 *blob;
> +				int mdivc_offset;
> +
> +				if (cfg->config.size >= SSP_BLOB_V1_0_SIZE) {
> +					blob = (u32 *)cfg->config.caps;
> +
> +					if (blob[1] == SSP_BLOB_VER_2_0)
> +						mdivc_offset = SSP_BLOB_V2_0_MDIVC_OFFSET;
> +					else if (blob[1] == SSP_BLOB_VER_1_5)
> +						mdivc_offset = SSP_BLOB_V1_5_MDIVC_OFFSET;
> +					else
> +						mdivc_offset = SSP_BLOB_V1_0_MDIVC_OFFSET;
> +
> +					mclk_mask |=  blob[mdivc_offset] & GENMASK(1, 0);
> +				}
> +
> +				cfg = (struct nhlt_fmt_cfg *)(cfg->config.caps + cfg->config.size);
> +			}
> +		}
> +		epnt = (struct nhlt_endpoint *)((u8 *)epnt + epnt->length);
> +	}
> +
> +	return mclk_mask;

Although I understand that it is relegated to the caller, but if both 
mclk being set is considered an error maybe add some kind of check here 
instead and free callers from having to remember about it?

if (hweight_long(mclk_mask) != 1)
	return -EINVAL;

return mclk_mask;

> +}
> +EXPORT_SYMBOL(intel_nhlt_ssp_mclk_mask);
> +
>   static struct nhlt_specific_cfg *
>   nhlt_get_specific_cfg(struct device *dev, struct nhlt_fmt *fmt, u8 num_ch,
>   		      u32 rate, u8 vbps, u8 bps)

