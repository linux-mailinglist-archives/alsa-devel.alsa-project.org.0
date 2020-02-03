Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFFF151018
	for <lists+alsa-devel@lfdr.de>; Mon,  3 Feb 2020 20:04:48 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C210B168B;
	Mon,  3 Feb 2020 20:03:57 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C210B168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580756687;
	bh=6ozowow79EHY7Ki1ndbT1p1AY7J9PkTvj9su7ewx5xA=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IN8/1IhWK3SlSkANmH8mFEUYBBcFinwZaZ0KEAOqobLEhPCvp2B8A+b8dQUIG42HB
	 PpX8r1uw1Yw2NH3HaPFc3MLabAlY0M9R1gPhkbGWuETUW6HPi9cWeVdSqR+m9jQ286
	 74ukXhci/Q5eI6ZFcdN4JPsEFsjjiAj9qo/G6htY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BDC7EF80150;
	Mon,  3 Feb 2020 20:03:06 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E5482F80148; Mon,  3 Feb 2020 20:03:04 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_BLOCKED,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from larkos.de (larkos.de [188.68.52.65])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3BBFBF800B8
 for <alsa-devel@alsa-project.org>; Mon,  3 Feb 2020 20:03:01 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3BBFBF800B8
Received: from a89-182-229-197.net-htp.de ([89.182.229.197]
 helo=[192.168.178.12])
 by larkos.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <martin@larkos.de>)
 id 1iygzr-0006lX-IM; Mon, 03 Feb 2020 20:03:00 +0100
To: Nikhil Mahale <nmahale@nvidia.com>, tiwai@suse.com,
 kai.vehmanen@linux.intel.com
References: <20200203100617.3856-1-nmahale@nvidia.com>
From: Martin Regner <martin@larkos.de>
Message-ID: <9b122308-490e-c3c4-edf7-25ef26720906@larkos.de>
Date: Mon, 3 Feb 2020 20:02:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200203100617.3856-1-nmahale@nvidia.com>
Content-Language: en-GB
Cc: alsa-devel@alsa-project.org, aplattner@nvidia.com
Subject: Re: [alsa-devel] [PATCH] ALSA: hda - Fix DP-MST support for NVIDIA
	codecs
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

The patch neatly applies and seems to fix my issue.
I had to acivate the device once with pavucontrol (not unplugged 
anymore) and after that the device is working without any extra actions 
after reboot.

Thank you very much.

On 03.02.20 11:06, Nikhil Mahale wrote:
> If dyn_pcm_assign is set, different jack objects are being created
> for pcm and pins.
>
> If dyn_pcm_assign is set, generic_hdmi_build_jack() calls into
> add_hdmi_jack_kctl() to create and track separate jack object for
> pcm. Like sync_eld_via_acomp(), hdmi_present_sense_via_verbs() also
> need to report status change of the pcm jack.
>
> Rename pin_idx_to_jack() to pin_idx_to_pcm_jack(). The code to
> report status change of pcm jack, move it to update_eld() which is
> common for acomp and !acomp code paths.
>
> Fixes: 5398e94fb753 ALSA: hda - Add DP-MST support for NVIDIA codecs
> Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
> ---
>   sound/pci/hda/patch_hdmi.c | 87 ++++++++++++++++++++++++----------------------
>   1 file changed, 45 insertions(+), 42 deletions(-)
>
> diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
> index 48bddc218829..7b5360037217 100644
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -1480,6 +1480,35 @@ static void hdmi_pcm_reset_pin(struct hdmi_spec *spec,
>   	per_pin->channels = 0;
>   }
>   
> +static struct snd_jack *pin_idx_to_pcm_jack(struct hda_codec *codec,
> +					    struct hdmi_spec_per_pin *per_pin)
> +{
> +	struct hdmi_spec *spec = codec->spec;
> +	struct snd_jack *jack = NULL;
> +	struct hda_jack_tbl *jack_tbl;
> +
> +	/* if !dyn_pcm_assign, get jack from hda_jack_tbl
> +	 * in !dyn_pcm_assign case, spec->pcm_rec[].jack is not
> +	 * NULL even after snd_hda_jack_tbl_clear() is called to
> +	 * free snd_jack. This may cause access invalid memory
> +	 * when calling snd_jack_report
> +	 */
> +	if (per_pin->pcm_idx >= 0 && spec->dyn_pcm_assign) {
> +		jack = spec->pcm_rec[per_pin->pcm_idx].jack;
> +	} else if (!spec->dyn_pcm_assign) {
> +		/*
> +		 * jack tbl doesn't support DP MST
> +		 * DP MST will use dyn_pcm_assign,
> +		 * so DP MST will never come here
> +		 */
> +		jack_tbl = snd_hda_jack_tbl_get_mst(codec, per_pin->pin_nid,
> +						    per_pin->dev_id);
> +		if (jack_tbl)
> +			jack = jack_tbl->jack;
> +	}
> +	return jack;
> +}
> +
>   /* update per_pin ELD from the given new ELD;
>    * setup info frame and notification accordingly
>    */
> @@ -1490,9 +1519,15 @@ static bool update_eld(struct hda_codec *codec,
>   	struct hdmi_eld *pin_eld = &per_pin->sink_eld;
>   	struct hdmi_spec *spec = codec->spec;
>   	bool old_eld_valid = pin_eld->eld_valid;
> +	struct snd_jack *pcm_jack;
>   	bool eld_changed;
>   	int pcm_idx;
>   
> +	/* pcm_idx >=0 before update_eld() means it is in monitor
> +	 * disconnected event. Jack must be fetched before update_eld()
> +	 */
> +	pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
> +
>   	/* for monitor disconnection, save pcm_idx firstly */
>   	pcm_idx = per_pin->pcm_idx;
>   	if (spec->dyn_pcm_assign) {
> @@ -1547,6 +1582,14 @@ static bool update_eld(struct hda_codec *codec,
>   			       SNDRV_CTL_EVENT_MASK_VALUE |
>   			       SNDRV_CTL_EVENT_MASK_INFO,
>   			       &get_hdmi_pcm(spec, pcm_idx)->eld_ctl->id);
> +
> +	if (!pcm_jack)
> +		pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
> +	if (eld_changed && pcm_jack)
> +		snd_jack_report(pcm_jack,
> +				(eld->monitor_present && eld->eld_valid) ?
> +				SND_JACK_AVOUT : 0);
> +
>   	return eld_changed;
>   }
>   
> @@ -1615,43 +1658,12 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
>   	return ret;
>   }
>   
> -static struct snd_jack *pin_idx_to_jack(struct hda_codec *codec,
> -				 struct hdmi_spec_per_pin *per_pin)
> -{
> -	struct hdmi_spec *spec = codec->spec;
> -	struct snd_jack *jack = NULL;
> -	struct hda_jack_tbl *jack_tbl;
> -
> -	/* if !dyn_pcm_assign, get jack from hda_jack_tbl
> -	 * in !dyn_pcm_assign case, spec->pcm_rec[].jack is not
> -	 * NULL even after snd_hda_jack_tbl_clear() is called to
> -	 * free snd_jack. This may cause access invalid memory
> -	 * when calling snd_jack_report
> -	 */
> -	if (per_pin->pcm_idx >= 0 && spec->dyn_pcm_assign)
> -		jack = spec->pcm_rec[per_pin->pcm_idx].jack;
> -	else if (!spec->dyn_pcm_assign) {
> -		/*
> -		 * jack tbl doesn't support DP MST
> -		 * DP MST will use dyn_pcm_assign,
> -		 * so DP MST will never come here
> -		 */
> -		jack_tbl = snd_hda_jack_tbl_get_mst(codec, per_pin->pin_nid,
> -						    per_pin->dev_id);
> -		if (jack_tbl)
> -			jack = jack_tbl->jack;
> -	}
> -	return jack;
> -}
> -
>   /* update ELD and jack state via audio component */
>   static void sync_eld_via_acomp(struct hda_codec *codec,
>   			       struct hdmi_spec_per_pin *per_pin)
>   {
>   	struct hdmi_spec *spec = codec->spec;
>   	struct hdmi_eld *eld = &spec->temp_eld;
> -	struct snd_jack *jack = NULL;
> -	bool changed;
>   	int size;
>   
>   	mutex_lock(&per_pin->lock);
> @@ -1674,17 +1686,8 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
>   		eld->eld_size = 0;
>   	}
>   
> -	/* pcm_idx >=0 before update_eld() means it is in monitor
> -	 * disconnected event. Jack must be fetched before update_eld()
> -	 */
> -	jack = pin_idx_to_jack(codec, per_pin);
> -	changed = update_eld(codec, per_pin, eld);
> -	if (jack == NULL)
> -		jack = pin_idx_to_jack(codec, per_pin);
> -	if (changed && jack)
> -		snd_jack_report(jack,
> -				(eld->monitor_present && eld->eld_valid) ?
> -				SND_JACK_AVOUT : 0);
> +	update_eld(codec, per_pin, eld);
> +
>   	mutex_unlock(&per_pin->lock);
>   }
>   


_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
