Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D0E6B9AE0
	for <lists+alsa-devel@lfdr.de>; Tue, 14 Mar 2023 17:15:50 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 08C541339;
	Tue, 14 Mar 2023 17:15:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 08C541339
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1678810550;
	bh=V6U675NRIIcVCoUxfsyJbXikofxVtHsIk28ldvKqnEI=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=j14gircX2mPXPCfHyarkPCj8huCwCnwfHjeFd0eIwhzA16lspWaBMyfE3ci9XsiAI
	 w17Z2o0YAp1fNBZEq0P4oVgrOBOLqLVKwQQRN5rTD0vJ3NnlyhcMGvjeXxWuom7XAP
	 sJmfe+jWcVkTw4hKQp0cgWbGL46i3bgUL7AXI3xw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id CCA1AF8032D;
	Tue, 14 Mar 2023 17:14:58 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 85036F80425; Tue, 14 Mar 2023 17:14:54 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id C9AACF80272
	for <alsa-devel@alsa-project.org>; Tue, 14 Mar 2023 17:14:50 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C9AACF80272
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=fFzqHPUO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678810492; x=1710346492;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=V6U675NRIIcVCoUxfsyJbXikofxVtHsIk28ldvKqnEI=;
  b=fFzqHPUOJ3yUVt61RuL14rwvbxL8kfkbe0/dxl4TlJBYuLW1Ra7+lBnb
   NVAL+88xvQXFrQ3vpEQx/SNtZtCzYvBCncbyQY2sbF9N/M+O8Ev3rkDPh
   0IlLEFsQBzQx7x5ZxQD2fjjbFl3KkVbd8D9TCfg/RIB0kLlADPW3mVBPd
   PYzFvboKVO1YMqfAHmAlRnBpq6h/H8ZkILV50YGOuxdcezqnpZgjqd8FE
   sTrrwFTuvykRN1DIV//ayqS6dOkq5Q4c2Twxso9gVtyrcNf1srsCeUwxR
   IRrW8HSIcgArgtHOWCj3CfJZRVxCZmh8V7wLLmS0Y0WiEb6ewvFfh8niA
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="339015236"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400";
   d="scan'208";a="339015236"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 09:14:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="802922318"
X-IronPort-AV: E=Sophos;i="5.98,260,1673942400";
   d="scan'208";a="802922318"
Received: from hsaquing-mobl.amr.corp.intel.com (HELO [10.255.35.31])
 ([10.255.35.31])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2023 09:14:47 -0700
Message-ID: <6d9d09aa-d83e-e811-1d43-34780ea05d4d@linux.intel.com>
Date: Tue, 14 Mar 2023 11:14:46 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [PATCH] ASoC: soc-compress: Inherit atomicity from DAI link for
 Compress FE
Content-Language: en-US
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20230314153409.1805280-1-daniel.baluta@oss.nxp.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230314153409.1805280-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XF7567GRI6PHJDCQV7VNEZAAFM5EYCTB
X-Message-ID-Hash: XF7567GRI6PHJDCQV7VNEZAAFM5EYCTB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: lgirdwood@gmail.com, kai.vehmanen@linux.intel.com,
 ranjani.sridharan@linux.intel.com, linux-kernel@vger.kernel.org,
 daniel.baluta@gmail.com, paul.olaru@nxp.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/XF7567GRI6PHJDCQV7VNEZAAFM5EYCTB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/14/23 10:34, Daniel Baluta wrote:
> From: Daniel Baluta <daniel.baluta@nxp.com>
> 
> After commit bbf7d3b1c4f40 ("ASoC: soc-pcm: align BE 'atomicity' with
> that of the FE") BE and FE atomicity must match.
> 
> In the case of Compress PCM there is a mismatch in atomicity between FE
> and BE and we get errors like this:
> 
> [   36.434566]  sai1-wm8960-hifi: dpcm_be_connect: FE is atomic but BE
> is nonatomic, invalid configuration

Not clear on the 'FE is atomic' in the case of a compressed stream,
which has to be handled with some sort of IPC, i.e. be nonatomic.

Also not sure why the FE is not set as nonatomic by the SOF parts?
If it's needed for PCM, why wouldn't it be needed for compressed data?

> [   36.444278]  PCM Deep Buffer: ASoC: can't connect SAI1.OUT
> 
> In order to fix this we must inherit the atomicity from DAI link
> associated with current PCM Compress FE.
> 
> Fixes: bbf7d3b1c4f4 ("ASoC: soc-pcm: align BE 'atomicity' with that of the FE")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  sound/soc/soc-compress.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
> index e7aa6f360cab..d649b0cf4744 100644
> --- a/sound/soc/soc-compress.c
> +++ b/sound/soc/soc-compress.c
> @@ -622,6 +622,9 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
>  			return ret;
>  		}
>  
> +		/* inherit atomicity from DAI link */
> +		be_pcm->nonatomic = rtd->dai_link->nonatomic;
> +
>  		rtd->pcm = be_pcm;
>  		rtd->fe_compr = 1;
>  		if (rtd->dai_link->dpcm_playback)
