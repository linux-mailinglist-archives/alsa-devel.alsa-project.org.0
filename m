Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C00D71A0DE
	for <lists+alsa-devel@lfdr.de>; Thu,  1 Jun 2023 16:49:34 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E2CBBD8;
	Thu,  1 Jun 2023 16:48:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E2CBBD8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1685630973;
	bh=ZjMPPnkOsUyvdtnWla3A8bZAJ3Ehv3zALg3Ikocts4A=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=UirmFZyt5QwejZuhP4rD/iStkcY4rx3sdBD385pYh33PzuWMgnsd6Ecrk5PNwaQ/D
	 UHNrWmtADnOAPHIyTr4qdP0/NqHtnZ0BB5lK9/HH74wioglO5Cd44bav78Tv4XitBm
	 U/2VhJv2mnNZzoEh5YDrIHy9aXzgi10zt6qHHzl0=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 75621F8047D; Thu,  1 Jun 2023 16:48:42 +0200 (CEST)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 23B9AF80132;
	Thu,  1 Jun 2023 16:48:42 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 60654F800C8; Thu,  1 Jun 2023 16:48:38 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED shortcircuit=no
	autolearn=ham autolearn_force=no version=3.4.6
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id AE1A2F800C1
	for <alsa-devel@alsa-project.org>; Thu,  1 Jun 2023 16:48:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AE1A2F800C1
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=gtumXcQ3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685630914; x=1717166914;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ZjMPPnkOsUyvdtnWla3A8bZAJ3Ehv3zALg3Ikocts4A=;
  b=gtumXcQ3Fczzz187/XtbzczeBqEQkA2Zk3snFmsG8PU6Tc/ZQEY+3JXh
   dVZY/U8loDEVJ6yoE6QN7NlWhJjb/dtcjB00MdeTNj5wslsNHCzArdUq4
   vPzkHaBJCun9jOVUhK7534Lj+THpD7wcx27az4ZfAL4o/V5RNUFk8AAHZ
   lobZLWD5912AXZ3xOhXy1B1RqjfzyWhkSZ4udJH25VrNz2BhfgJO1U8sW
   GRUPPpfg6cmPwD2M4FTCRQt0WEPhMaR1Ys6QVi9qLnGIG7uZ0oPfPzAUG
   OWqw+FScGLHs1qevqdDQTnF0WVM3JYp+juv8Z1MKoejmeE4Ct8FHi4PXt
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="358871437"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400";
   d="scan'208";a="358871437"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 07:48:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="881634867"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400";
   d="scan'208";a="881634867"
Received: from gjayacha-mobl1.amr.corp.intel.com (HELO [10.209.41.36])
 ([10.209.41.36])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2023 07:48:04 -0700
Message-ID: <18ec3299-56a6-2156-c856-55754fd8fa54@linux.intel.com>
Date: Thu, 1 Jun 2023 09:08:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.11.0
Subject: Re: [PATCH] ASoC: cs35l56: Remove NULL check from
 cs35l56_sdw_dai_set_stream()
To: Richard Fitzgerald <rf@opensource.cirrus.com>, broonie@kernel.org
Cc: alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
 patches@opensource.cirrus.com
References: <20230601124907.3128170-1-rf@opensource.cirrus.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230601124907.3128170-1-rf@opensource.cirrus.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: PINB2GBDJGRQRM4FSRUBE337JURHUZUJ
X-Message-ID-Hash: PINB2GBDJGRQRM4FSRUBE337JURHUZUJ
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/PINB2GBDJGRQRM4FSRUBE337JURHUZUJ/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 6/1/23 07:49, Richard Fitzgerald wrote:
> The dma pointer must be set to the passed stream pointer, even
> if that pointer is NULL.
> 
> Fixes: e49611252900 ("ASoC: cs35l56: Add driver for Cirrus Logic CS35L56")
> Signed-off-by: Richard Fitzgerald <rf@opensource.cirrus.com>

Yep, good catch, this is what we have for other codecs.

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

> ---
>  sound/soc/codecs/cs35l56.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/sound/soc/codecs/cs35l56.c b/sound/soc/codecs/cs35l56.c
> index 3c07bd1e959e..c03f9d3c9a13 100644
> --- a/sound/soc/codecs/cs35l56.c
> +++ b/sound/soc/codecs/cs35l56.c
> @@ -704,9 +704,6 @@ static int cs35l56_sdw_dai_hw_free(struct snd_pcm_substream *substream,
>  static int cs35l56_sdw_dai_set_stream(struct snd_soc_dai *dai,
>  				      void *sdw_stream, int direction)
>  {
> -	if (!sdw_stream)
> -		return 0;
> -
>  	snd_soc_dai_dma_data_set(dai, direction, sdw_stream);
>  
>  	return 0;
