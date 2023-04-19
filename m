Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 420E76E81A1
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Apr 2023 21:04:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 307A3EF1;
	Wed, 19 Apr 2023 21:03:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 307A3EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681931088;
	bh=1Hh8WUIR6eeK+AxsczOGGcqyUNQHx9FNhheYlsKci2Y=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=XrrURvO7d24Bg7vRWX8uWyZkt/oqRjHJE5KDruFcIhsjv4c7qSG0ZxkUUpuC2hTb7
	 yK+ZZ3J8aceFP66zCyHb/BfeD/cvgTt36S5s6MrU90u5vbHfhHBeOP0fCOznxHwFOv
	 pxK3aJoahOAYUhcuZ0C1r7RcCZlsQGRWrU2siZ1I=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id EF1B7F80149;
	Wed, 19 Apr 2023 21:03:56 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 5FEB5F80155; Wed, 19 Apr 2023 21:03:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id B8BB3F80053;
	Wed, 19 Apr 2023 21:03:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B8BB3F80053
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=GRuVOqj+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681931031; x=1713467031;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1Hh8WUIR6eeK+AxsczOGGcqyUNQHx9FNhheYlsKci2Y=;
  b=GRuVOqj+qTlyk4aPn3FVbtZdWsZ5DgGiLLJ1HqAktbHXFtFsZR8HhDvn
   6Df9bcRGg76m8/YG7aC3VscEwaC2v42a/0hatlT7x7TsjgbnFLfGGRADd
   0i3Yw2AhVqo7zZh3wOG9SZpX0AMBC/LRczRMwdFvTnPpZHYHKNnA+g6dx
   n9KKy+S6ZVkp991IzaQg4YXQQXSkXKDjkYI/+tAkZGDqqSNwQG2sre7BU
   bZe7oGp0knSUJ+nSk6OUsPsEOpnXAbXt/qrbaeBaKMpkLJRmZAcr3zM+o
   rlLG1/D/YfslwOnmKpbpB9VZ1CK76OPSochxUcBdcMma7dfv3k3f94hx0
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325148267"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="325148267"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:03:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="1021319731"
X-IronPort-AV: E=Sophos;i="5.99,210,1677571200";
   d="scan'208";a="1021319731"
Received: from gargicha-mobl1.amr.corp.intel.com (HELO [10.209.74.38])
 ([10.209.74.38])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 12:03:19 -0700
Message-ID: <fbdee94e-b731-0471-e18f-b334ab0db7f5@linux.intel.com>
Date: Wed, 19 Apr 2023 14:03:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.10.0
Subject: Re: [PATCH] ASoC: SOF: Intel: hda-stream: Move three variable
 assignments behind condition checks in hda_dsp_iccmax_stream_hw_params()
Content-Language: en-US
To: Markus Elfring <Markus.Elfring@web.de>, kernel-janitors@vger.kernel.org,
 alsa-devel@alsa-project.org, sound-open-firmware@alsa-project.org,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
 Rander Wang <rander.wang@intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
References: <40c60719-4bfe-b1a4-ead7-724b84637f55@web.de>
 <1a11455f-ab57-dce0-1677-6beb8492a257@web.de>
 <c18331ca-3de9-d433-f477-b04103958b9c@web.de>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <c18331ca-3de9-d433-f477-b04103958b9c@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: N3UN4V4RC442E6BUHXRZADXWCDZQVIL7
X-Message-ID-Hash: N3UN4V4RC442E6BUHXRZADXWCDZQVIL7
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: cocci@inria.fr, LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/N3UN4V4RC442E6BUHXRZADXWCDZQVIL7/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/19/23 13:54, Markus Elfring wrote:
> Date: Wed, 19 Apr 2023 20:42:19 +0200
> 
> The address of a data structure member was determined before
> a corresponding null pointer check in the implementation of
> the function “hda_dsp_iccmax_stream_hw_params”.
> 
> Thus avoid the risk for undefined behaviour by moving the assignment
> for three local variables behind some condition checks.
> 
> This issue was detected by using the Coccinelle software.
> 
> Fixes: 7d88b9608142f95ccdd3dfb190da4a5faddb1cc7 ("ASoC: SOF: Intel: hdac_ext_stream: consistent prefixes for variables/members")
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>

Yes indeed, for some reason this was fixed in
hda_dsp_stream_hw_params() but not in the
hda_dsp_iccmax_stream_hw_params() variant.

Could we however use the same code as in hda_dsp_stream_hw_params() for
consistency?

	if (!hext_stream) {
		dev_err(sdev->dev, "error: no stream available\n");
		return -ENODEV;
	}

	if (!dmab) {
		dev_err(sdev->dev, "error: no dma buffer allocated!\n");
		return -ENODEV;
	}

	hstream = &hext_stream->hstream;
	sd_offset = SOF_STREAM_SD_OFFSET(hstream);
	mask = BIT(hstream->index);

Thanks!

> ---
>  sound/soc/sof/intel/hda-stream.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
> index 79d818e6a0fa..9c44127014fc 100644
> --- a/sound/soc/sof/intel/hda-stream.c
> +++ b/sound/soc/sof/intel/hda-stream.c
> @@ -407,10 +407,10 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_st
>  				    struct snd_dma_buffer *dmab,
>  				    struct snd_pcm_hw_params *params)
>  {
> -	struct hdac_stream *hstream = &hext_stream->hstream;
> -	int sd_offset = SOF_STREAM_SD_OFFSET(hstream);
> +	struct hdac_stream *hstream;
> +	int sd_offset;
>  	int ret;
> -	u32 mask = 0x1 << hstream->index;
> +	u32 mask;
> 
>  	if (!hext_stream) {
>  		dev_err(sdev->dev, "error: no stream available\n");
> @@ -422,9 +422,12 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_st
>  		return -ENODEV;
>  	}
> 
> +	hstream = &hext_stream->hstream;
>  	if (hstream->posbuf)
>  		*hstream->posbuf = 0;
> 
> +	sd_offset = SOF_STREAM_SD_OFFSET(hstream);
> +
>  	/* reset BDL address */
>  	snd_sof_dsp_write(sdev, HDA_DSP_HDA_BAR,
>  			  sd_offset + SOF_HDA_ADSP_REG_SD_BDLPL,
> @@ -459,6 +462,8 @@ int hda_dsp_iccmax_stream_hw_params(struct snd_sof_dev *sdev, struct hdac_ext_st
>  				sd_offset + SOF_HDA_ADSP_REG_SD_LVI,
>  				0xffff, (hstream->frags - 1));
> 
> +	mask = 0x1 << hstream->index;
> +
>  	/* decouple host and link DMA, enable DSP features */
>  	snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL,
>  				mask, mask);
> --
> 2.40.0
> 
