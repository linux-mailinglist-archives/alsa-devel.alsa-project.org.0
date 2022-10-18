Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBB96029A3
	for <lists+alsa-devel@lfdr.de>; Tue, 18 Oct 2022 12:48:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D16E58A8F;
	Tue, 18 Oct 2022 12:47:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D16E58A8F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1666090123;
	bh=5z9Qj0QE6GGcAmqUBaoVWARVq1z81/f9SdP0Ih87rkg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=eedORuGpWU5A6GHwBLQwCemwMjOkmHC3mtM28kRBawDgI66Tmd+FLlqlje+XIQOpS
	 xq8lOV9c5863NrkomWh7bSE6pJflZzJz0Gftwb/Tc+cUVJ8/462QRsC4pfER93TKeo
	 bzgWdd+iaIfBqtYa48GXfJKdeTC05mz1tL0VFDMY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2DCD9F800AA;
	Tue, 18 Oct 2022 12:47:49 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 494B3F804C1; Tue, 18 Oct 2022 12:47:47 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED,
 URIBL_DBL_BLOCKED_OPENDNS autolearn=disabled version=3.4.0
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6C851F800E5
 for <alsa-devel@alsa-project.org>; Tue, 18 Oct 2022 12:47:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6C851F800E5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="DjXDVUPa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666090061; x=1697626061;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5z9Qj0QE6GGcAmqUBaoVWARVq1z81/f9SdP0Ih87rkg=;
 b=DjXDVUPaLBypZhZqYVq1N1E78n9Sb+StX5wvWIW5XMFoiBboWhsVxh22
 L0OZju/rL6yiN+xMqfu1v2smx004XURwMebst70fAlMSDlMGr/hIYLJF9
 vBxg/wi6etE+LvO1/qHF7Cfqhv4F9+v2SLkXEOlCR5N554JnBtv3wbqdi
 3og3twE9CgSH3CJ+rGrHKgvJWH58rW0vngI71l0OIt/3GYuII1wkmQuLZ
 68QIj8Hrq/9UR5d4dVddThpvYLRz+6HwAoSj5ZOK/UO7dUbJYEPzayQCq
 lmbpo9RXLgRhaFBz0G42S8hFX82qPa4Im8mlZliMVHAXGa76Jh56xyoTE Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="307730080"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="307730080"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 03:47:27 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10503"; a="733567198"
X-IronPort-AV: E=Sophos;i="5.95,193,1661842800"; d="scan'208";a="733567198"
Received: from aslawinx-mobl.ger.corp.intel.com (HELO [10.99.241.36])
 ([10.99.241.36])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2022 03:47:26 -0700
Message-ID: <9b721915-1428-81ee-1be9-29c2e9d36d5f@linux.intel.com>
Date: Tue, 18 Oct 2022 12:47:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 06/11] ASoC: soc-dapm.c: merge dapm_power_one_widget() and
 dapm_widget_set_power()
Content-Language: en-US
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <8735bmqazf.wl-kuninori.morimoto.gx@renesas.com>
 <87tu42owdd.wl-kuninori.morimoto.gx@renesas.com>
From: =?UTF-8?Q?Amadeusz_S=c5=82awi=c5=84ski?=
 <amadeuszx.slawinski@linux.intel.com>
In-Reply-To: <87tu42owdd.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Linux-ALSA <alsa-devel@alsa-project.org>
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

On 10/18/2022 1:37 AM, Kuninori Morimoto wrote:
> From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> 
> dapm_widget_set_power() (= X) is called only from
> dapm_power_one_widget() (= Y), and total purpose of these functions are
> calling dapm_seq_insert() (= a) accordingly for each widget.
> 
> (X)	static void dapm_widget_set_power(...)
> 	{
> 		...
> 		if (power)
> (a)			dapm_seq_insert(w, up_list, true);
> 		else
> (a)			dapm_seq_insert(w, down_list, false);
> 	}
> 
> (Y)	static void dapm_power_one_widget(...)
> 	{
> 		..
> 
> 		switch (w->id) {
> 		case snd_soc_dapm_pre:
> (a)			dapm_seq_insert(w, down_list, false);
> 			break;
> 		case snd_soc_dapm_post:
> (a)			dapm_seq_insert(w, up_list, true);
> 			break;
> 
> 		default:
> 			power = dapm_widget_power_check(w);
> 
> (X)			dapm_widget_set_power(w, power, up_list, down_list);
> 			break;
> 		}
> 	}
> 
> It should be more simple, but the code is unnecessarily complicated,
> and difficult to read/understand. This patch merge these into one.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>   sound/soc/soc-dapm.c | 39 +++++++++++++++------------------------
>   1 file changed, 15 insertions(+), 24 deletions(-)
> 
> diff --git a/sound/soc/soc-dapm.c b/sound/soc/soc-dapm.c
> index d4281e776e44..764830a51d2d 100644
> --- a/sound/soc/soc-dapm.c
> +++ b/sound/soc/soc-dapm.c
> @@ -1873,11 +1873,24 @@ static void dapm_widget_set_peer_power(struct snd_soc_dapm_widget *peer,
>   		dapm_mark_dirty(peer, "peer state change");
>   }
>   
> -static void dapm_widget_set_power(struct snd_soc_dapm_widget *w, bool power,
> +static void dapm_power_one_widget(struct snd_soc_dapm_widget *w,
>   				  struct list_head *up_list,
>   				  struct list_head *down_list)
>   {
>   	struct snd_soc_dapm_path *path;
> +	int power;
> +
> +	switch (w->id) {
> +	case snd_soc_dapm_pre:
> +		power = 0;
> +		goto end;
> +	case snd_soc_dapm_post:
> +		power = 1;
> +		goto end;
> +	default:
> +	}

This introduces build error when applied:

sound/soc/soc-dapm.c: In function ‘dapm_power_one_widget’:
sound/soc/soc-dapm.c:1890:2: error: label at end of compound statement
  1890 |  default:
       |  ^~~~~~~

(May be because of CONFIG_WERROR, but still it would be a warning at 
least...)

> +
> +	power = dapm_widget_power_check(w);
>   
>   	if (w->power == power)
>   		return;
> @@ -1897,35 +1910,13 @@ static void dapm_widget_set_power(struct snd_soc_dapm_widget *w, bool power,
>   	if (!w->is_supply)
>   		snd_soc_dapm_widget_for_each_sink_path(w, path)
>   			dapm_widget_set_peer_power(path->sink, power, path->connect);
> -
> +end:
>   	if (power)
>   		dapm_seq_insert(w, up_list, true);
>   	else
>   		dapm_seq_insert(w, down_list, false);
>   }
>   
> -static void dapm_power_one_widget(struct snd_soc_dapm_widget *w,
> -				  struct list_head *up_list,
> -				  struct list_head *down_list)
> -{
> -	int power;
> -
> -	switch (w->id) {
> -	case snd_soc_dapm_pre:
> -		dapm_seq_insert(w, down_list, false);
> -		break;
> -	case snd_soc_dapm_post:
> -		dapm_seq_insert(w, up_list, true);
> -		break;
> -
> -	default:
> -		power = dapm_widget_power_check(w);
> -
> -		dapm_widget_set_power(w, power, up_list, down_list);
> -		break;
> -	}
> -}
> -
>   static bool dapm_idle_bias_off(struct snd_soc_dapm_context *dapm)
>   {
>   	if (dapm->idle_bias_off)

