Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B31B0180DCC
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Mar 2020 02:53:35 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 4CDD51662;
	Wed, 11 Mar 2020 02:52:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 4CDD51662
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583891615;
	bh=fjD0kxXlAtn6CQUGXFVJ+Y8ozWT2Mw7q5rY459BwVzw=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=A6RJlhj3SP+iYyVgaEd9xVoVPtOHVACszjmy3t2WKwbWFqlFHi9YU4vpwe66pZSD4
	 Sl7SS2BEobvZ7o4fLJtU5Akpd2mLWHQkq60Nnr+YE78zhfxXRbHaW1E5Ni5S0G5q2G
	 xPwypHw3qzAdcvuaUfLKyPGgAik/VGfR9zuwXqEE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3FCA1F800DA;
	Wed, 11 Mar 2020 02:51:54 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id A0FB6F8020C; Wed, 11 Mar 2020 02:51:51 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 818E4F800BC
 for <alsa-devel@alsa-project.org>; Wed, 11 Mar 2020 02:51:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 818E4F800BC
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 18:51:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,539,1574150400"; d="scan'208";a="389115339"
Received: from vssomaya-mobl1.amr.corp.intel.com (HELO [10.252.138.210])
 ([10.252.138.210])
 by orsmga004.jf.intel.com with ESMTP; 10 Mar 2020 18:51:44 -0700
Subject: Re: [PATCH 0/7] ASoC: Merge CPU/Codec DAIs
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Mark Brown <broonie@kernel.org>
References: <87y2s7vgxb.wl-kuninori.morimoto.gx@renesas.com>
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <03ac5f70-9aa3-b909-c693-caaa0afd09c9@linux.intel.com>
Date: Tue, 10 Mar 2020 20:51:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <87y2s7vgxb.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Hi Morimoto-san,

On 3/10/20 8:06 PM, Kuninori Morimoto wrote:
> 
> Hi Mark
> 
> Current ALSA SoC has CPU/Codec categorized DAIs.
> But it will be no longer good much for modern device.
> 
> Currently, rtd has both CPU/Codec DAIs array.
> 
> 	rtd->cpu_dais   = [][][][][][][][][]
> 	rtd->codec_dais = [][][][][][][][][]
> 
> This patch merges these, like below.
> It still keeps rtd->cpu_dais, rtd->codec_dais

Sorry, but I perceive a contradiction here, or I am missing the bigger 
picture.

Is the end-goal to remove the cpu_dais and codec_dais, and fold them as 
non-descript 'dais'? This is what I understand by "it will be no longer 
good much for modern device"

Or is this 'merge' a simple data handling change to avoid using two 
"for" loops instead of one, and we are going to keep the distinction 
between dais?

more specifically I am concerned about the tons of code we have, e.g. a 
random machine driver:

	struct snd_soc_dai *codec_dai = rtd->codec_dai;
	struct snd_soc_jack *jack;
	int ret;

	/* Configure sysclk for codec */
	ret = snd_soc_dai_set_sysclk(codec_dai, DA7219_CLKSRC_MCLK,

If the rtd structure only has an array of dais, how would the codecs be 
configured then?
	
> 
> 	rtd->dais = [][][][][][][][][][][][][][][][][][]
> 	            ^cpu_dais         ^codec_dais
> 	            |--- num_cpus ---|--- num_codecs --|
> 
> After this merging, we can merge for_each_rtd_cpu/codec_dais().
> 
> -	for_each_rtd_cpu_dais() {
> -		...
> -	}
> -	for_each_rtd_codec_dais() {
> -		...
> -	}
> +	for_each_rtd_dais() {
> +		...
> +	}
> 
> 
> Kuninori Morimoto (7):
>    ASoC: soc-core: Merge CPU/Codec DAIs
>    ASoC: soc-core: Merge for_each_rtd_cpu/codec_dais()
>    ASoC: soc-dapm: Merge for_each_rtd_cpu/codec_dais()
>    ASoC: soc-pcm: Merge for_each_rtd_cpu/codec_dais()
>    ASoC: soc-core: Merge CPU/Codec for soc_dai_pcm_new()
>    ASoC: soc-pcm: Merge CPU/Codec MSB at soc_pcm_apply_msb()
>    ASoC: soc-pcm: Merge CPU/Codec at soc_pcm_pointer()
> 
>   include/sound/soc.h  |   7 +-
>   sound/soc/soc-core.c |  66 +++-----
>   sound/soc/soc-dapm.c |   9 +-
>   sound/soc/soc-pcm.c  | 367 +++++++++++--------------------------------
>   4 files changed, 123 insertions(+), 326 deletions(-)
> 
