Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 326342D609F
	for <lists+alsa-devel@lfdr.de>; Thu, 10 Dec 2020 16:56:54 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5C4C9167E;
	Thu, 10 Dec 2020 16:56:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5C4C9167E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607615813;
	bh=9URZAhQrd2CLmhloSibH3ceV8IKqiN8vmFv0AxJFo/A=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=OoKo8H+G9j5iLWxDQroQ2JuBdwjLqXuoowMmeZH5G+tbebZlxeaqnY/IAg4jPlrz/
	 ntGXXnRt6KF/tDd1RZ2sMeozUcHMdOPuUZl/g09VEsNVZnb38AfeBSUzXkaRpEm7Hw
	 keiTZwAUXB85JPNcvqbI2HQbUaMEmg+AXv+NVFo4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E6DCBF80105;
	Thu, 10 Dec 2020 16:56:01 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2D186F80218; Thu, 10 Dec 2020 16:56:00 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C0EABF80105
 for <alsa-devel@alsa-project.org>; Thu, 10 Dec 2020 16:55:47 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C0EABF80105
IronPort-SDR: xvYy4e8x5veNcwMBJ6ALgTV82H4FL+AQVR5M04042AqT6EpJvXgiK+BpA24YIfu/IaZn/GgmKd
 Aq4zmYC5i9hA==
X-IronPort-AV: E=McAfee;i="6000,8403,9830"; a="235870317"
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="235870317"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 07:55:45 -0800
IronPort-SDR: 3nkhWLCpQ6dAgMT9lORwAd8Jj7LQTaOWfcJOil6sKfSm0P33XjP5LeJlZlfS624xA3+aUm+ZjR
 b2qpEZaQKnEQ==
X-IronPort-AV: E=Sophos;i="5.78,408,1599548400"; d="scan'208";a="319653427"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.213.11.242])
 ([10.213.11.242])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Dec 2020 07:55:43 -0800
Subject: Re: [PATCH] ASoC: Intel: Skylake: Check the kcontrol against NULL
To: Lukasz Majczak <lma@semihalf.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>
References: <20201210121438.7718-1-lma@semihalf.com>
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Message-ID: <43ecc9e6-3a86-6e7c-bb88-f87fbce0f51d@linux.intel.com>
Date: Thu, 10 Dec 2020 16:55:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201210121438.7718-1-lma@semihalf.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: pl
Cc: alsa-devel@alsa-project.org, Guenter Roeck <groeck@google.com>,
 Radoslaw Biernacki <rad@semihalf.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Marcin Wojtas <mw@semihalf.com>,
 Alex Levin <levinale@google.com>
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


> There is no check for the kcontrol against NULL and in some cases
> it causes kernel to crash.
>
> Fixes: 2d744ecf2b984 ("ASoC: Intel: Skylake: Automatic DMIC format configuration according to information from NHLT")
> Cc: <stable@vger.kernel.org> # 5.4+
> Signed-off-by: Lukasz Majczak <lma@semihalf.com>
> ---
>   sound/soc/intel/skylake/skl-topology.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
> index ae466cd592922..c9abbe4ff0ba3 100644
> --- a/sound/soc/intel/skylake/skl-topology.c
> +++ b/sound/soc/intel/skylake/skl-topology.c
> @@ -3618,12 +3618,18 @@ static void skl_tplg_complete(struct snd_soc_component *component)
>   	int i;
>   
>   	list_for_each_entry(dobj, &component->dobj_list, list) {
> -		struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
> -		struct soc_enum *se =
> -			(struct soc_enum *)kcontrol->private_value;
> -		char **texts = dobj->control.dtexts;
> +		struct snd_kcontrol *kcontrol;
> +		struct soc_enum *se;
> +		char **texts;
>   		char chan_text[4];
>   
> +		kcontrol = dobj->control.kcontrol;
> +		if(!kcontrol)
> +			continue;
> +
> +		se = (struct soc_enum *)kcontrol->private_value;
> +		texts = dobj->control.dtexts;
> +
>   		if (dobj->type != SND_SOC_DOBJ_ENUM ||
>   		    dobj->control.kcontrol->put !=
>   		    skl_tplg_multi_config_set_dmic)
>
> base-commit: 69fe63aa100220c8fd1f451dd54dd0895df1441d


Thanks for pointing out and fixing this. This check was obviously 
missing there. I did a quick verification on few of our platforms, 
encountered no issues, so:

     Reviewed-by: Mateusz Gorski <mateusz.gorski@linux.intel.com>


Also, could you please:

- describe the affected configuration (used machine driver or audio card 
name, device name),
- share full dmesg logs from one of said crashes,
- copy the output of "amixer -c0 controls" command executed on affected 
device.

These would be useful information for us to further improve our 
validation and help us with debugging.


Thanks,

Mateusz


