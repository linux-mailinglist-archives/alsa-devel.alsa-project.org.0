Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A01D7EF09D
	for <lists+alsa-devel@lfdr.de>; Fri, 17 Nov 2023 11:35:13 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6399A852;
	Fri, 17 Nov 2023 11:34:22 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6399A852
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1700217312;
	bh=cOHAaYPRxtyxODavsRav9jwEKw9D9DOZg1yHIgcNARw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:List-Id:
	 List-Archive:List-Help:List-Owner:List-Post:List-Subscribe:
	 List-Unsubscribe:From;
	b=SjGJQPMU6exC7hapPNdKJFjoqu9VYu5Wyvr1wb4y4uBdkBsCWM6d07w/SBTCQZKYm
	 sNeyBKeM8RKnA3/A2u3Nt7QIxJkR+DTjxsmTBwJHQOR8EqJSM8YKBJS/vf/sd6k1Vk
	 jK+IyEhVlnjzDWU/bB8qcsGNROAbwtpq3cGlKmUo=
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id 84A29F80563; Fri, 17 Nov 2023 11:33:31 +0100 (CET)
Received: from mailman-core.alsa-project.org (mailman-core.alsa-project.org [10.254.200.10])
	by alsa1.perex.cz (Postfix) with ESMTP id 6EF9DF8016E;
	Fri, 17 Nov 2023 11:33:30 +0100 (CET)
Received: by alsa1.perex.cz (Postfix, from userid 50401)
	id A814AF801D5; Fri, 17 Nov 2023 11:30:41 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
	URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
	version=3.4.6
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa1.perex.cz (Postfix) with ESMTPS id A1033F80166
	for <alsa-devel@alsa-project.org>; Fri, 17 Nov 2023 11:30:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A1033F80166
Authentication-Results: alsa1.perex.cz;
	dkim=pass (2048-bit key,
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=Qu6LuElg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700217034; x=1731753034;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=cOHAaYPRxtyxODavsRav9jwEKw9D9DOZg1yHIgcNARw=;
  b=Qu6LuElg9IG7uYiaoOTnIuj9OFd6yM5EjeVUG+mIWdkM1beP0l9mr8XI
   P6AvEubUP7UBkryAwQ+M5aHeWh77OPkUsZBC1xER9lTmOZsG7/zIP4Ctc
   lspwimMBqDSfOchRn83PfonCLF4CdG3zL6r/hjimcs0OdmVJjIoZaVFnb
   5tTd35LgEr928MpW47jVDC7t9Kwgfwal82LXMd25EQvB5JJMjQsD0xMBI
   yXTpXCmXxsJW6lpTW8Oxz5QQEW4jiovxBkvaJgiBDVPTq3RGjLfLRVrW9
   k9MEehAe6gQwHVc4jhnj2+e39jeb30qaNRjP5uPMFPncfTxEgfwroCcCk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="422371401"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="422371401"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 02:30:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="1097062243"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600";
   d="scan'208";a="1097062243"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.94.0.53])
 ([10.94.0.53])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 02:30:23 -0800
Message-ID: <3ab5e640-03b5-49c5-9ec0-ce23f13212ba@linux.intel.com>
Date: Fri, 17 Nov 2023 11:30:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: Intel: Skylake: Fix mem leak in few functions
Content-Language: en-US
To: Kamil Duljas <kamil.duljas@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>,
 Cezary Rojewski <cezary.rojewski@intel.com>
References: <20231116125150.1436-1-kamil.duljas@gmail.com>
From: =?UTF-8?Q?Amadeusz_S=C5=82awi=C5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <20231116125150.1436-1-kamil.duljas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RBWZWSXQZCTDTEXILYXNF7J72AVNWDAV
X-Message-ID-Hash: RBWZWSXQZCTDTEXILYXNF7J72AVNWDAV
X-MailFrom: amadeuszx.slawinski@linux.intel.com
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
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/message/RBWZWSXQZCTDTEXILYXNF7J72AVNWDAV/>
List-Archive: 
 <https://mailman.alsa-project.org/hyperkitty/list/alsa-devel@alsa-project.org/>
List-Help: <mailto:alsa-devel-request@alsa-project.org?subject=help>
List-Owner: <mailto:alsa-devel-owner@alsa-project.org>
List-Post: <mailto:alsa-devel@alsa-project.org>
List-Subscribe: <mailto:alsa-devel-join@alsa-project.org>
List-Unsubscribe: <mailto:alsa-devel-leave@alsa-project.org>

On 11/16/2023 1:51 PM, Kamil Duljas wrote:
> The resources should be freed when function return error.
> 
> Signed-off-by: Kamil Duljas <kamil.duljas@gmail.com>
> ---
>   sound/soc/intel/skylake/skl-pcm.c     | 4 +++-
>   sound/soc/intel/skylake/skl-sst-ipc.c | 4 +++-
>   2 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/intel/skylake/skl-pcm.c b/sound/soc/intel/skylake/skl-pcm.c
> index d0c02e8a6785..18866bc415a5 100644
> --- a/sound/soc/intel/skylake/skl-pcm.c
> +++ b/sound/soc/intel/skylake/skl-pcm.c
> @@ -240,8 +240,10 @@ static int skl_pcm_open(struct snd_pcm_substream *substream,
>   	snd_pcm_set_sync(substream);
>   
>   	mconfig = skl_tplg_fe_get_cpr_module(dai, substream->stream);
> -	if (!mconfig)
> +	if (!mconfig) {
> +		kfree(dma_params);
>   		return -EINVAL;
> +	}
>   
>   	skl_tplg_d0i3_get(skl, mconfig->d0i3_caps);
>   
> diff --git a/sound/soc/intel/skylake/skl-sst-ipc.c b/sound/soc/intel/skylake/skl-sst-ipc.c
> index 7a425271b08b..fd9624ad5f72 100644
> --- a/sound/soc/intel/skylake/skl-sst-ipc.c
> +++ b/sound/soc/intel/skylake/skl-sst-ipc.c
> @@ -1003,8 +1003,10 @@ int skl_ipc_get_large_config(struct sst_generic_ipc *ipc,
>   
>   	reply.size = (reply.header >> 32) & IPC_DATA_OFFSET_SZ_MASK;
>   	buf = krealloc(reply.data, reply.size, GFP_KERNEL);
> -	if (!buf)
> +	if (!buf) {
> +		kfree(reply.data);
>   		return -ENOMEM;
> +	}
>   	*payload = buf;
>   	*bytes = reply.size;
>   

Seems ok,
Reviewed-by: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
