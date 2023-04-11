Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BB26DDC09
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Apr 2023 15:26:11 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 54A17EF9;
	Tue, 11 Apr 2023 15:25:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 54A17EF9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1681219570;
	bh=P/iDhHTGwWX+IUkevSeJym7AO9IHqFOgQHaG3NtyP2I=;
	h=Date:Subject:To:References:From:In-Reply-To:CC:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=bASbZOvdyk2kdvzClsXBq7ssisMzqvBKNAo0C1Vw7YyvTKJXvY0TenI02i43YG0Wx
	 +f/Oj5C/YW4VZ9XrjfimigEdx72MGj8S/xbLqRwZm2EIfKznHBuR7UWMefZ3y61xss
	 aVizk9D1pmLrC+yHm8phnR4eRM1QRopnepptgpb8=
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id BFF86F8025E;
	Tue, 11 Apr 2023 15:25:19 +0200 (CEST)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id D15A5F8032B; Tue, 11 Apr 2023 15:25:14 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_NONE,URIBL_BLOCKED shortcircuit=no autolearn=ham
	autolearn_force=no version=3.4.6
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id 29E87F80149
	for <alsa-devel@alsa-project.org>; Tue, 11 Apr 2023 15:25:08 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 29E87F80149
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=NUJ9f6re
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681219510; x=1712755510;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=P/iDhHTGwWX+IUkevSeJym7AO9IHqFOgQHaG3NtyP2I=;
  b=NUJ9f6renYb/RXFqIX587r5H8oPEl+GOz+PQjTFl2i9BN8ymM4k50xFW
   uxCJpKFN59nY86E+loC5IiJ7FvyaBbXpPprD7tFogTlpPyIH6ZX72Tkga
   yaUj7x0vYArASS5ylSb147UusaekrKENLwP8Isl/YkfhwXKAjKvFdjih9
   xZH/cawqsNRpnqeKvaNRzOHb/olJdJx8M3UIyZJ7DhEcLs6NrUa6qrWTG
   uxL27QDJJfooiP/+z9VHTV0z0JZ0l+2eIENGrYT6AFFmFp2p0Y9lspxTF
   IFi0CvzkhKACzF717pJUmHT5Onh+UC0B9Zkue503La3ct1OhMk2NyquzB
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="429901271"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400";
   d="scan'208";a="429901271"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 06:25:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="799909332"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400";
   d="scan'208";a="799909332"
Received: from rpearman-mobl.amr.corp.intel.com (HELO [10.252.132.237])
 ([10.252.132.237])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2023 06:25:03 -0700
Message-ID: <14976031-7d63-4069-8647-3cee41064215@linux.intel.com>
Date: Tue, 11 Apr 2023 08:25:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.9.0
Subject: Re: [PATCH] ASoC: soc-compress: set pcm nonatomic flag from dai_link
Content-Language: en-US
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, broonie@kernel.org
References: <20230411110831.813-1-srinivas.kandagatla@linaro.org>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <20230411110831.813-1-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BJ665LP4DVNGDVJR3QMVLCDMIHD5KS3X
X-Message-ID-Hash: BJ665LP4DVNGDVJR3QMVLCDMIHD5KS3X
X-MailFrom: pierre-louis.bossart@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation;
 header-match-alsa-devel.alsa-project.org-0;
 header-match-alsa-devel.alsa-project.org-1; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: tiwai@suse.com, lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 alsa-devel@alsa-project.org, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: "Alsa-devel mailing list for ALSA developers -
 http://www.alsa-project.org" <alsa-devel.alsa-project.org>
Archived-At: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/BJ665LP4DVNGDVJR3QMVLCDMIHD5KS3X/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>



On 4/11/23 06:08, Srinivas Kandagatla wrote:
> In compress offload case we never set nonatomic flag on a new pcm. This triggers
> below configuration error with DPCM on Qualcomm setup where dai_links are marked
> as nonatomic.
> 
> "FE is atomic but BE is nonatomic, invalid configuration"
> 
> Fix this by Updating the pcm nonatomic flag correcly from the respective dai_link.
> 
> CC: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  sound/soc/soc-compress.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
> index 554c329ec87f..a8d70274cab8 100644
> --- a/sound/soc/soc-compress.c
> +++ b/sound/soc/soc-compress.c
> @@ -615,6 +615,7 @@ int snd_soc_new_compress(struct snd_soc_pcm_runtime *rtd, int num)
>  			return ret;
>  		}
>  
> +		be_pcm->nonatomic = rtd->dai_link->nonatomic;
>  		rtd->pcm = be_pcm;
>  		rtd->fe_compr = 1;
>  		if (rtd->dai_link->dpcm_playback)

isn't this fixed already? Daniel Baluta sent a patch for this, already
applied by Mark:

https://lore.kernel.org/alsa-devel/20230324124019.30826-1-daniel.baluta@oss.nxp.com/
