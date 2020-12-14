Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC162D9D3E
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Dec 2020 18:09:18 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20935178C;
	Mon, 14 Dec 2020 18:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20935178C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1607965758;
	bh=V/T1E+uEQoQdHcKIZIcjTHjTAUXDc2XjH8xlb+jIEpU=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Hz9shoaG5U9DTdb1whNmaVIalzACr+Co7NLVSQ2CAu/SMhkaC35H+Cq7jAKtOaoBv
	 f+W6f2UFwONxWgRZcwXMW7kT34NAVigwQQQimvG8PIEtq6qdgPUr0hWza2W42+oMHa
	 M/Jnl+1Zsd/fvR8lZh4AKbzIxl4Pgp0KTH0Yo4rA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8A691F800ED;
	Mon, 14 Dec 2020 18:07:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 99416F801F7; Mon, 14 Dec 2020 18:07:40 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=NICE_REPLY_A,SPF_HELO_NONE,
 SPF_NONE,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 49EC2F80121
 for <alsa-devel@alsa-project.org>; Mon, 14 Dec 2020 18:07:31 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 49EC2F80121
IronPort-SDR: hfilVu+bWVfLVEizTp+sKCcia75X4lIwkpAENbWTpFoufihodxCG71y0jBawCf4qAqGHuLD/BK
 k0R1O8lvYBMQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="174885842"
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="174885842"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 09:07:28 -0800
IronPort-SDR: 8yjtT0xbS8RvlMcwve5C1sPoi/a8XF4j0g6A3k8YPrgt+POPcD0akXzGr/YS+gxGekZlv9IkIj
 3lK82lpjalzQ==
X-IronPort-AV: E=Sophos;i="5.78,420,1599548400"; d="scan'208";a="449089701"
Received: from mgorski-mobl.ger.corp.intel.com (HELO [10.213.21.123])
 ([10.213.21.123])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Dec 2020 09:07:25 -0800
Subject: Re: [PATCH] ASoC: Intel: Skylake: skl-topology: Fix OOPs ib
 skl_tplg_complete
To: Ricardo Ribalda <ribalda@chromium.org>,
 Cezary Rojewski <cezary.rojewski@intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@linux.intel.com>,
 Jie Yang <yang.jie@linux.intel.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org
References: <20201211170629.871085-1-ribalda@chromium.org>
From: "Gorski, Mateusz" <mateusz.gorski@linux.intel.com>
Message-ID: <6b933ad0-2b54-33de-4d74-c176efd4d110@linux.intel.com>
Date: Mon, 14 Dec 2020 18:07:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201211170629.871085-1-ribalda@chromium.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: pl
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


> If dobj->control is not initialized we end up in an OOPs during
> skl_tplg_complete:
>
> [   26.553358] BUG: kernel NULL pointer dereference, address:
> 0000000000000078
> [   26.561151] #PF: supervisor read access in kernel mode
> [   26.566897] #PF: error_code(0x0000) - not-present page
> [   26.572642] PGD 0 P4D 0
> [   26.575479] Oops: 0000 [#1] PREEMPT SMP PTI
> [   26.580158] CPU: 2 PID: 2082 Comm: udevd Tainted: G         C
> 5.4.81 #4
> [   26.588232] Hardware name: HP Soraka/Soraka, BIOS
> Google_Soraka.10431.106.0 12/03/2019
> [   26.597082] RIP: 0010:skl_tplg_complete+0x70/0x144 [snd_soc_skl]
>
> Fixes: 2d744ecf2b98 ("ASoC: Intel: Skylake: Automatic DMIC format configuration according to information from NHL")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>   sound/soc/intel/skylake/skl-topology.c | 15 ++++++++-------
>   1 file changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/sound/soc/intel/skylake/skl-topology.c b/sound/soc/intel/skylake/skl-topology.c
> index 40bee10b0c65..0955cbb4e918 100644
> --- a/sound/soc/intel/skylake/skl-topology.c
> +++ b/sound/soc/intel/skylake/skl-topology.c
> @@ -3619,19 +3619,20 @@ static void skl_tplg_complete(struct snd_soc_component *component)
>   
>   	list_for_each_entry(dobj, &component->dobj_list, list) {
>   		struct snd_kcontrol *kcontrol = dobj->control.kcontrol;
> -		struct soc_enum *se =
> -			(struct soc_enum *)kcontrol->private_value;
> -		char **texts = dobj->control.dtexts;
> +		struct soc_enum *se;
> +		char **texts;
>   		char chan_text[4];
>   
> -		if (dobj->type != SND_SOC_DOBJ_ENUM ||
> -		    dobj->control.kcontrol->put !=
> -		    skl_tplg_multi_config_set_dmic)
> +		if (dobj->type != SND_SOC_DOBJ_ENUM || !kcontrol ||
> +		    kcontrol->put != skl_tplg_multi_config_set_dmic)
>   			continue;
> +
> +		se = (struct soc_enum *)kcontrol->private_value;
> +		texts = dobj->control.dtexts;
>   		sprintf(chan_text, "c%d", mach->mach_params.dmic_num);
>   
>   		for (i = 0; i < se->items; i++) {
> -			struct snd_ctl_elem_value val;
> +			struct snd_ctl_elem_value val = {};
>   
>   			if (strstr(texts[i], chan_text)) {
>   				val.value.enumerated.item[0] = i;


Hi Ricardo,

there is another thread regarding this issue (with fix provided by 
Lukasz Majczak), you can find it here:

     https://www.spinics.net/lists/stable/msg431524.html


Thanks,
Mateusz

