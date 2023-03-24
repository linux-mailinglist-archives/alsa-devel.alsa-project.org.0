Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3EC6C7EF1
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Mar 2023 14:38:28 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D9836E9D;
	Fri, 24 Mar 2023 14:37:37 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D9836E9D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1679665107;
	bh=hrxu6Dq+/7P2nTvs2nQdBfPtx5S00hxfReedkevyPEg=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=VxCH+d+W4a01m/rLo5koC3JLyzGgP3dcm4Ei5Q/Dovm6Py/hqyzc2iEyQKJKvlOYP
	 qchfKcI8tlFRtvUJ9ydoT9bPkP9WGK8XcHNkIXOm2QsPXt5lMgdLW53FUkNG/1TY9D
	 gOAu3u21uV60LeMvBzoKhsuq3ieiIWEa6peyCekw=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6A95BF8027B;
	Fri, 24 Mar 2023 14:37:37 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 276FFF800C9; Fri, 24 Mar 2023 14:37:33 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id DC740F802E8
	for <alsa-devel@alsa-project.org>; Fri, 24 Mar 2023 14:37:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DC740F802E8
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=TC0zOTed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679665043; x=1711201043;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=hrxu6Dq+/7P2nTvs2nQdBfPtx5S00hxfReedkevyPEg=;
  b=TC0zOTed+AXOOWsqu5ha+UpvYaXUnNnoYFVZ7j5bMmNecqeutOuuNzXJ
   lbbPoaiThdClSshUOu4oiXaAOh9xqMEG8PBaawIaH/K2iDFRpKLBC6Xx0
   Fzc8/9dcUhr3NElQWSf0/y0VXepdVmK9yocFI/p/uC0OswMpBIiUNWlc5
   pD3qaMo15C4ehjyh1qAGxqPpgTvrWUEbWLVZ7uBv2rSEd21usjXZ5HaZj
   NFZ/SeqTRteelTo5WlpwYQ2UngjOUB5K8PPIzrqyGFpqfonVVfmTVZ9gD
   s8y1dHzbx5yXu9OYtdsv7y8fa3KLn69GSGreI0zwZLpYARW8W/W9k821n
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="339803891"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400";
   d="scan'208";a="339803891"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 06:37:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10659"; a="685168715"
X-IronPort-AV: E=Sophos;i="5.98,288,1673942400";
   d="scan'208";a="685168715"
Received: from kvnguye3-mobl1.amr.corp.intel.com (HELO [10.212.145.31])
 ([10.212.145.31])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2023 06:37:09 -0700
Message-ID: <9440fa8f-f50b-716f-7c9f-d7d9d7d183f5@linux.intel.com>
Date: Fri, 24 Mar 2023 07:56:50 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.8.0
Subject: Re: [RESEND PATCH] ASoC: soc-compress: Inherit atomicity from DAI
 link for Compress FE
To: Daniel Baluta <daniel.baluta@oss.nxp.com>, broonie@kernel.org,
 alsa-devel@alsa-project.org
References: <20230324124019.30826-1-daniel.baluta@oss.nxp.com>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230324124019.30826-1-daniel.baluta@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IWJOG4A32HDUOG6R2PNSRQXEXXOFK4XB
X-Message-ID-Hash: IWJOG4A32HDUOG6R2PNSRQXEXXOFK4XB
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, ranjani.sridharan@linux.intel.com,
 kai.vehmanen@linux.intel.com, lgirdwood@gmail.com, vkoul@kernel.org,
 daniel.baluta@gmail.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/IWJOG4A32HDUOG6R2PNSRQXEXXOFK4XB/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 3/24/23 07:40, Daniel Baluta wrote:
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
> [   36.444278]  PCM Deep Buffer: ASoC: can't connect SAI1.OUT
> 
> In order to fix this we must inherit the atomicity from DAI link
> associated with current PCM Compress FE.
> 
> Fixes: bbf7d3b1c4f4 ("ASoC: soc-pcm: align BE 'atomicity' with that of the FE")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>

Reviewed-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>

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
