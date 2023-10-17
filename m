Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8455C7CD0C0
	for <lists+alsa-devel@lfdr.de>; Wed, 18 Oct 2023 01:28:30 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CCB1FE7A;
	Wed, 18 Oct 2023 01:27:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CCB1FE7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1697585309;
	bh=7I1Y4nnQBV4/2CN7n+iQSuwae/PdMJVhORVRJRUVvoo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=vAfsStKG07AbVSTAKmUHNswJq3fnReJFlB6IyMPUCoB4q8uce8Qe9ZNL66jK7LuD0
	 y01EXruSVduV7wnEbkShUSjKwIXwLDvkvH1Kpq0djM0B81q5irU0dXCxUWbmhhPyfy
	 XcD13KgQnXvf+oeR/os7sx/tnEwva6rFjJZn6xMs=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id CD8C5F80620; Wed, 18 Oct 2023 01:24:17 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 2584BF80618;
	Wed, 18 Oct 2023 01:24:17 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 29C96F8061D; Wed, 18 Oct 2023 01:24:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 3718FF80536
	for <alsa-devel@alsa-project.org>; Wed, 18 Oct 2023 01:23:22 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3718FF80536
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Iyp9sWGd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697585003; x=1729121003;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=7I1Y4nnQBV4/2CN7n+iQSuwae/PdMJVhORVRJRUVvoo=;
  b=Iyp9sWGdXDBksgoSbkDsug92Lj123wk+91uuXYo//580shLl2BiBmWvV
   ToM681qSMsWzyJkm8xX6anxggnqm+Kh7b29CE0np8UB8I5ZZh2qvJndcF
   gZ9coMd/X6GyBrSFmq5Xu/yOUjjfjw9rF5Q6JoEjD7yBp3m5timlomq5s
   dR0LasS/XcWPVMCe1nApKW/aq5YjdbEu/qb8tGqyd7jcGIR+YqCv2m/Ek
   DbxXnGPv/7Ho9OxUe0fy3i20t3nz/RJkjrYe09cNkZ1CBuGrWBNA4tWXP
   Hn2a1H1KyEEC++7G2WJlM8logPRMC+UsvrwveRdEm6wlCKhE6D9+EeQm4
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="384778120"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="384778120"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="826637471"
X-IronPort-AV: E=Sophos;i="6.03,233,1694761200";
   d="scan'208";a="826637471"
Received: from asprado-mobl2.amr.corp.intel.com (HELO [10.212.55.179])
 ([10.212.55.179])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 16:23:18 -0700
Message-ID: <dbb1f64b-8112-4a2f-9138-616e04bdc53c@linux.intel.com>
Date: Tue, 17 Oct 2023 17:33:25 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 21/34] ASoC: usb: Add PCM format check API for USB
 backend
Content-Language: en-US
To: Wesley Cheng <quic_wcheng@quicinc.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, agross@kernel.org, andersson@kernel.org,
 konrad.dybcio@linaro.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 srinivas.kandagatla@linaro.org, bgoswami@quicinc.com,
 Thinh.Nguyen@synopsys.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20231017200109.11407-1-quic_wcheng@quicinc.com>
 <20231017200109.11407-22-quic_wcheng@quicinc.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20231017200109.11407-22-quic_wcheng@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: CKWTCFZDL5UTA34CTFMY6YSF2D37T6RR
X-Message-ID-Hash: CKWTCFZDL5UTA34CTFMY6YSF2D37T6RR
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/CKWTCFZDL5UTA34CTFMY6YSF2D37T6RR/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 10/17/23 15:00, Wesley Cheng wrote:
> Introduce a check for if a particular PCM format is supported by the USB

Introduce a helper to check if a ...

> audio device connected.  If the USB audio device does not have an audio
> profile which can support the requested format, then notify the USB
> backend.
> 
> Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
> ---
>  include/sound/soc-usb.h |  3 +++
>  sound/soc/soc-usb.c     | 13 +++++++++++++
>  2 files changed, 16 insertions(+)
> 
> diff --git a/include/sound/soc-usb.h b/include/sound/soc-usb.h
> index 58c686f4f7ba..c6ddc055c4cd 100644
> --- a/include/sound/soc-usb.h
> +++ b/include/sound/soc-usb.h
> @@ -37,6 +37,9 @@ struct snd_soc_usb {
>  	void *priv_data;
>  };
>  
> +int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
> +			int direction);
> +
>  int snd_soc_usb_connect(struct device *usbdev, struct snd_soc_usb_device *sdev);
>  int snd_soc_usb_disconnect(struct device *usbdev, struct snd_soc_usb_device *sdev);
>  void *snd_soc_usb_find_priv_data(struct device *usbdev);
> diff --git a/sound/soc/soc-usb.c b/sound/soc/soc-usb.c
> index 73b1bcc3b506..7407678a993e 100644
> --- a/sound/soc/soc-usb.c
> +++ b/sound/soc/soc-usb.c
> @@ -63,6 +63,19 @@ void *snd_soc_usb_find_priv_data(struct device *dev)
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_usb_find_priv_data);
>  
> +int snd_soc_usb_find_format(int card_idx, struct snd_pcm_hw_params *params,
> +			int direction)
> +{
> +	struct snd_usb_stream *as;
> +
> +	as = snd_usb_find_suppported_substream(card_idx, params, direction);
> +	if (!as)
> +		return -EOPNOTSUPP;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_usb_find_format);

Is this the right way to check for formats?

formats are defined within the scope of an endpoint, and those endpoints
are themselves defined within the scope of an interface?

I don't see a notion of endpoint here. Does this assume all endpoints
are valid, or maybe the existence of a single endpoint in a device?

Confused.
