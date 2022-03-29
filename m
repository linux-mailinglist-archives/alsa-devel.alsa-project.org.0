Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9094EAB18
	for <lists+alsa-devel@lfdr.de>; Tue, 29 Mar 2022 12:17:46 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id ACA6317A9;
	Tue, 29 Mar 2022 12:16:55 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz ACA6317A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1648549065;
	bh=KdDIPnzEvrOVnpI31P1RPyUa3N8iLXvXKsJ4BtKvAxI=;
	h=Date:Subject:To:References:From:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sUmxz5QXDZ08HTDUey9RQvjD3sHGtDDKuMLYEoHBG3x/JTK/OKi25fMBb6IhewXYy
	 oJmdGq2QVFMlBwj7La5grl+GBCNVdiTto62DSiy6srrmcGg9lnYOIMIR3/Y8z8O+ua
	 5fiJe7AfpWdV7gNAbiW7xAN3dhkX/xMM1xU8OOUg=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 2B61FF800FA;
	Tue, 29 Mar 2022 12:16:39 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BF264F80311; Tue, 29 Mar 2022 12:16:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42FCAF800F2
 for <alsa-devel@alsa-project.org>; Tue, 29 Mar 2022 12:16:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42FCAF800F2
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com
 header.b="J+au2RuQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648548991; x=1680084991;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=KdDIPnzEvrOVnpI31P1RPyUa3N8iLXvXKsJ4BtKvAxI=;
 b=J+au2RuQjZEdPJc/3VJZ53LzryaD/xeh1Y0E4joKCQTXEVRRfqVFSIoQ
 ugQVAqnW7Tl8Kmj4y5FZR21gENZvMe3N9t9H3DZF3VxZr/yGmtj69j1rR
 +ap0EoQKTNXp3XfpdpZC8u0AYZ9KYyyVIddufOc9VXTK4/zb7rvfYS+q9
 /MkItsw+ZF6iqc8qAYLzrMH4A78Kw5ctog3/iHEUg6QjmLMvRlapubUVD
 e0l5HRHt9s4brMBFt55tMMAYY1on1Ou4xv8OY74F/BMLQngWzFzoju6Hd
 VXnLXkdYy6UgYXSdhwwCdHVBr9nyx6rfYxTM2ksgD83NpoVPKayGypVhy A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10300"; a="258928714"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="258928714"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 03:16:20 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="694668162"
Received: from jfranckx-mobl.ger.corp.intel.com (HELO [10.249.42.73])
 ([10.249.42.73])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 03:16:18 -0700
Message-ID: <5d966a7e-816a-0c68-0dda-adde0d8a2f8c@linux.intel.com>
Date: Tue, 29 Mar 2022 13:16:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] ASoC: SOF: topology: use new sound control LED layer
Content-Language: en-US
To: Jaroslav Kysela <perex@perex.cz>,
 ALSA development <alsa-devel@alsa-project.org>
References: <20220329080351.2384110-1-perex@perex.cz>
From: =?UTF-8?Q?P=c3=a9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>
In-Reply-To: <20220329080351.2384110-1-perex@perex.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: Takashi Iwai <tiwai@suse.de>, Bard Liao <yung-chuan.liao@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
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

Hi Jaroslav,

On 29/03/2022 11:03, Jaroslav Kysela wrote:
> Use the new sound control LED layer instead the direct ledtrig_audio_set()
> call - see 22d8de62f11b ("ALSA: control - add generic LED trigger module
> as the new control layer").

Don't we need to select SND_CTL_LED from SOF to make sure that the LED
trigger module is available?

> Signed-off-by: Jaroslav Kysela <perex@perex.cz>
> Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
> Cc: Bard Liao <yung-chuan.liao@linux.intel.com>
> Cc: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
> Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/sof/control.c  | 33 ---------------------------------
>  sound/soc/sof/topology.c | 10 ++++++++++
>  2 files changed, 10 insertions(+), 33 deletions(-)
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
> diff --git a/sound/soc/sof/topology.c b/sound/soc/sof/topology.c
> index 9b11e9795a7a..267a781494da 100644
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
> @@ -821,6 +822,15 @@ static int sof_control_load_volume(struct snd_soc_component *scomp,
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
> +	}
> +
>  	dev_dbg(scomp->dev, "tplg: load kcontrol index %d chans %d\n",
>  		scontrol->comp_id, scontrol->num_channels);
>  

-- 
Péter
