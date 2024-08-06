Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (unknown [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C14C7948DB7
	for <lists+alsa-devel@lfdr.de>; Tue,  6 Aug 2024 13:31:15 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4571E3C26;
	Tue,  6 Aug 2024 13:30:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4571E3C26
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1722943855;
	bh=XeP8qMVW9duWHN2BUl9XidmCMVmrVkb5XZ55nX3RpWU=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:List-Archive:
	 List-Help:List-Owner:List-Post:List-Subscribe:List-Unsubscribe:
	 From;
	b=CvEVCEusNOZHW5HegkaS7vhyjAB8TvYHxTp9d+RPzdhrXOZl/Bs6FJsAsd/kNGfMA
	 BTrozqsRLBIAyN7m8YNZMHuoPMVnIHe5vmWNUukhyXcFgCxanjhlw1mkB7lQHMd4Gt
	 N+f99LdPDrbCtqMshVyuhbUPu2SVObHERK/SVX3I=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 4F1BAF805AA; Tue,  6 Aug 2024 13:30:23 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FF12F805AE;
	Tue,  6 Aug 2024 13:30:21 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 24F08F802DB; Tue,  6 Aug 2024 13:25:55 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
	RCVD_IN_VALIDITY_CERTIFIED_BLOCKED,RCVD_IN_VALIDITY_RPBL_BLOCKED,
	SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AAA99F800E3
	for <alsa-devel@alsa-project.org>; Tue,  6 Aug 2024 13:25:40 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AAA99F800E3
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=IRH8Dcyz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722943542; x=1754479542;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=XeP8qMVW9duWHN2BUl9XidmCMVmrVkb5XZ55nX3RpWU=;
  b=IRH8DcyzQDP4IeKaMhmVfxkHvwdF2i6cRe/zuWSJjnQ81uUcwDtaWSCc
   XOplIuly0LJV44pvPyCvSNQpWO3Ng/P5qiwSBXBRj2LXaddZW4IEK/xAg
   u2XBLP0foZnbNG2iWertNjd4Xutsh1AWwOW5gbhDfULwMApnVsAmkcjf/
   43Bi0zCEJrwcvFrCZunZ1kLP2MUjMsFxe9y4OtPXxXtkD0gnLcsMD/qJ7
   Z/ng98KSsNQ413liFJMSNmYWgWZd7l4vV/g3fixBhc3niYvqj3efp5wz/
   lfxUaSr8cv4G7i3a3lbIcfECnddpG8vu8JWP7typKKc47guERq6rwC7QC
   Q==;
X-CSE-ConnectionGUID: KGUMovVqS4KnCJ3gDNa/hQ==
X-CSE-MsgGUID: aGUP/JoKQamEddJXwxNB/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11155"; a="20804833"
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800";
   d="scan'208";a="20804833"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 04:25:37 -0700
X-CSE-ConnectionGUID: uVVs95WMQuuVeX2XlWhaPA==
X-CSE-MsgGUID: 4wC1AypiTUqIxnJYqoPfTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,267,1716274800";
   d="scan'208";a="56399162"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO [10.245.246.248])
 ([10.245.246.248])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2024 04:25:34 -0700
Message-ID: <e89a56bf-c377-43d8-bba8-6a09e571ed64@linux.intel.com>
Date: Tue, 6 Aug 2024 13:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/6] ALSA: compress: add Sample Rate Converter codec
 support
To: Shengjiu Wang <shengjiu.wang@nxp.com>, vkoul@kernel.org, perex@perex.cz,
 tiwai@suse.com, alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, nicoleotsuka@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, linuxppc-dev@lists.ozlabs.org
References: <1722940003-20126-1-git-send-email-shengjiu.wang@nxp.com>
 <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <1722940003-20126-2-git-send-email-shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WATCIRYZQLAJQT6SVMW34ZLJONTKGEDC
X-Message-ID-Hash: WATCIRYZQLAJQT6SVMW34ZLJONTKGEDC
X-MailFrom: pierre-louis.bossart@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/WATCIRYZQLAJQT6SVMW34ZLJONTKGEDC/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 8/6/24 12:26, Shengjiu Wang wrote:
> Add Sample Rate Converter(SRC) codec support, define the output
> format and rate for SRC.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  include/uapi/sound/compress_offload.h | 2 ++
>  include/uapi/sound/compress_params.h  | 9 ++++++++-
>  2 files changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
> index 98772b0cbcb7..8b2b72f94e26 100644
> --- a/include/uapi/sound/compress_offload.h
> +++ b/include/uapi/sound/compress_offload.h
> @@ -112,10 +112,12 @@ struct snd_compr_codec_caps {
>   * end of the track
>   * @SNDRV_COMPRESS_ENCODER_DELAY: no of samples inserted by the encoder at the
>   * beginning of the track
> + * @SNDRV_COMPRESS_SRC_RATIO_MOD: Resampling Ratio Modifier for sample rate converter
>   */
>  enum sndrv_compress_encoder {
>  	SNDRV_COMPRESS_ENCODER_PADDING = 1,
>  	SNDRV_COMPRESS_ENCODER_DELAY = 2,
> +	SNDRV_COMPRESS_SRC_RATIO_MOD = 3,
>  };

this sounds wrong to me. The sample rate converter is not an "encoder",
and the properties for padding/delay are totally specific to an encoder
function.

The other point is that I am not sure how standard this ratio_mod
parameter is. This could be totally specific to a specific
implementation, and another ASRC might have different parameters.

>  
>  /**
> diff --git a/include/uapi/sound/compress_params.h b/include/uapi/sound/compress_params.h
> index ddc77322d571..0843773ea6b4 100644
> --- a/include/uapi/sound/compress_params.h
> +++ b/include/uapi/sound/compress_params.h
> @@ -43,7 +43,8 @@
>  #define SND_AUDIOCODEC_BESPOKE               ((__u32) 0x0000000E)
>  #define SND_AUDIOCODEC_ALAC                  ((__u32) 0x0000000F)
>  #define SND_AUDIOCODEC_APE                   ((__u32) 0x00000010)
> -#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_APE
> +#define SND_AUDIOCODEC_SRC                   ((__u32) 0x00000011)
> +#define SND_AUDIOCODEC_MAX                   SND_AUDIOCODEC_SRC

I am not sure this is wise to change such definitions?
>  
>  /*
>   * Profile and modes are listed with bit masks. This allows for a
> @@ -324,6 +325,11 @@ struct snd_dec_ape {
>  	__u32 seek_table_present;
>  } __attribute__((packed, aligned(4)));
>  
> +struct snd_dec_src {
> +	__u32 format_out;
> +	__u32 rate_out;
> +} __attribute__((packed, aligned(4)));

Again I am not sure how standard those parameters are, and even if they
were if their representation is reusable.

And the compressed API has a good split between encoders and decoders, I
am not sure how an SRC can be classified as either.

>  union snd_codec_options {
>  	struct snd_enc_wma wma;
>  	struct snd_enc_vorbis vorbis;
> @@ -334,6 +340,7 @@ union snd_codec_options {
>  	struct snd_dec_wma wma_d;
>  	struct snd_dec_alac alac_d;
>  	struct snd_dec_ape ape_d;
> +	struct snd_dec_src src;
>  } __attribute__((packed, aligned(4)));
>  
>  /** struct snd_codec_desc - description of codec capabilities

