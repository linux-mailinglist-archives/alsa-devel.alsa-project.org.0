Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4674EC1A9
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Mar 2022 13:57:56 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E17C218DF;
	Wed, 30 Mar 2022 13:57:05 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E17C218DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648641476;
	bh=yYfrJKaF9krMZCNaEhmJFzesfjs9bBX/zErQAzrdgyg=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=e+afmRQBqtFOpd781cwEcCNjxaflcn/2hbjR3fF5kAnujhnGvPco3rP63WnKh0ttR
	 m5iciVHg71e8EfJ5t8EH942fv8fIh3K2MRd1Z3QiKlW8P1EzsmYJjeT55EWvH12XCl
	 VZV4ehRDqSuMO0XkFshlRtkHEgbtn9y/GiepcsjI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D0E7AF80520;
	Wed, 30 Mar 2022 13:49:44 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 8B358F80520; Wed, 30 Mar 2022 13:49:43 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 24805F80520
 for <alsa-devel@alsa-project.org>; Wed, 30 Mar 2022 13:49:36 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 24805F80520
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="chNWNEhO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648640978; x=1680176978;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yYfrJKaF9krMZCNaEhmJFzesfjs9bBX/zErQAzrdgyg=;
 b=chNWNEhOJ7bZupBN0MTlHpnw/x2nYoE/ZMhNHu7kdHmnZtREq+Zzmeqt
 Tq4poPbDLAtuel/dL4yI4GKYoM1P+t/PY2AEa878r+dhQfnvsUJem2X2u
 IBKuvvtxnFOF15wlAj1d+uf6AmejZWWvM03CVZg/Jb+D+3Bn06+gqhGuH
 Fs3mdvzJ+QnPTqME3foIH2oiV1r9ztOiKlng+K7bXWMI/QDKwkUFRsTov
 NIaQlpZIU3N1vY1gshbrtNXvpSUs/U7jJsiPvOsfL3RQwqiLlfvhLjOik
 XhCaBfow2hWyDTsJgrGorh35DyxdTD7/h+LXuZDZkhWF+EJ3pt/s4ky+k A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="239452259"
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="239452259"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 04:49:34 -0700
X-IronPort-AV: E=Sophos;i="5.90,222,1643702400"; d="scan'208";a="695075787"
Received: from dhoffend-mobl1.ger.corp.intel.com (HELO [10.251.210.66])
 ([10.251.210.66])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2022 04:49:32 -0700
Message-ID: <2a865fa9-f8e0-60d6-3b5a-790ef78cf47a@linux.intel.com>
Date: Wed, 30 Mar 2022 14:49:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2] ASoC: SOF: topology: use new sound control LED layer
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20220329120039.2394138-1-perex@perex.cz>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220329120039.2394138-1-perex@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Mark Brown <broonie@kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
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



On 29/03/2022 15:00, Jaroslav Kysela wrote:
> Use the new sound control LED layer instead the direct ledtrig_audio_set()
> call - see 22d8de62f11b ("ALSA: control - add generic LED trigger module
> as the new control layer").
> 
> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> 
> -----
> v2:
>   - add Mark to Cc:
>   - add snd_ctl_led_request() call
> ---
>  sound/soc/sof/control.c  | 33 ---------------------------------
>  sound/soc/sof/sof-priv.h |  1 +
>  sound/soc/sof/topology.c | 16 ++++++++++++++++
>  3 files changed, 17 insertions(+), 33 deletions(-)
> 
> diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
> index de1778c4002b..3b5718a3516d 100644
> --- a/sound/soc/sof/control.c
> +++ b/sound/soc/sof/control.c
> @@ -15,36 +15,6 @@
>  #include "sof-priv.h"
>  #include "sof-audio.h"
>  
> -static void update_mute_led(struct snd_sof_control *scontrol,
> -			    struct snd_kcontrol *kcontrol,
> -			    struct snd_ctl_elem_value *ucontrol)
> -{
> -	int temp = 0;
> -	int mask;
> -	int i;
> -
> -	mask = 1U << snd_ctl_get_ioffidx(kcontrol, &ucontrol->id);
> -
> -	for (i = 0; i < scontrol->num_channels; i++) {
> -		if (ucontrol->value.integer.value[i]) {
> -			temp |= mask;
> -			break;
> -		}
> -	}
> -
> -	if (temp == scontrol->led_ctl.led_value)
> -		return;
> -
> -	scontrol->led_ctl.led_value = temp;
> -
> -#if IS_REACHABLE(CONFIG_LEDS_TRIGGER_AUDIO)
> -	if (!scontrol->led_ctl.direction)
> -		ledtrig_audio_set(LED_AUDIO_MUTE, temp ? LED_OFF : LED_ON);
> -	else
> -		ledtrig_audio_set(LED_AUDIO_MICMUTE, temp ? LED_OFF : LED_ON);
> -#endif
> -}
> -
>  int snd_sof_volume_get(struct snd_kcontrol *kcontrol,
>  		       struct snd_ctl_elem_value *ucontrol)
>  {
> @@ -121,9 +91,6 @@ int snd_sof_switch_put(struct snd_kcontrol *kcontrol,
>  	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
>  	const struct sof_ipc_tplg_ops *tplg_ops = sdev->ipc->ops->tplg;
>  
> -	if (scontrol->led_ctl.use_led)
> -		update_mute_led(scontrol, kcontrol, ucontrol);
> -
>  	if (tplg_ops->control->switch_put)
>  		return tplg_ops->control->switch_put(scontrol, ucontrol);
>  
> diff --git a/sound/soc/sof/sof-priv.h b/sound/soc/sof/sof-priv.h
> index 0d9b640ae24c..e537b1258aa8 100644
> --- a/sound/soc/sof/sof-priv.h
> +++ b/sound/soc/sof/sof-priv.h
> @@ -473,6 +473,7 @@ struct snd_sof_dev {
>  	struct list_head route_list;
>  	struct snd_soc_component *component;
>  	u32 enabled_cores_mask; /* keep track of enabled cores */
> +	bool led_present;
>  
>  	/* FW configuration */
>  	struct sof_ipc_window *info_window;
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index 9b11e9795a7a..e47a64934c04 100644
> --- a/sound/soc/sof/topology.c
> +++ b/sound/soc/sof/topology.c
> @@ -773,6 +773,7 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
>  	struct snd_soc_tplg_mixer_control *mc =
>  		container_of(hdr, struct snd_soc_tplg_mixer_control, hdr);
>  	int tlv[TLV_ITEMS];
> +	unsigned int mask;
>  	int ret;
>  
>  	/* validate topology data */
> @@ -821,6 +822,16 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
>  		goto err;
>  	}
>  
> +	if (scontrol->led_ctl.use_led) {
> +		mask = scontrol->led_ctl.direction ? SNDRV_CTL_ELEM_ACCESS_MIC_LED :
> +							SNDRV_CTL_ELEM_ACCESS_SPK_LED;
> +		scontrol->access &= ~SNDRV_CTL_ELEM_ACCESS_LED_MASK;
> +		scontrol->access |= mask;
> +		kc->access &= ~SNDRV_CTL_ELEM_ACCESS_LED_MASK;
> +		kc->access |= mask;
> +		sdev->led_present = true;
> +	}
> +
>  	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d\n",
>  		scontrol->comp_id, scontrol->num_channels);
>  
> @@ -2027,6 +2038,7 @@ static struct snd_soc_tplg_ops sof_tplg_ops = {
>  
>  int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
>  {
> +	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
>  	const struct firmware *fw;
>  	int ret;
>  
> @@ -2049,6 +2061,10 @@ int snd_sof_load_topology(struct snd_soc_component *scomp, const char *file)
>  	}

Nitpick, but I would probably done:
- 	}
+ 	} else if (sdev->led_present) {
+		ret = snd_ctl_led_request();
+ 	}

Reviewed-by: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>

>  
>  	release_firmware(fw);
> +
> +	if (ret >= 0 && sdev->led_present)
> +		ret = snd_ctl_led_request();
> +
>  	return ret;
>  }
>  EXPORT_SYMBOL(snd_sof_load_topology);

-- 
Péter
