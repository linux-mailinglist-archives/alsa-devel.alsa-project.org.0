Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B5A151540
	for <lists+alsa-devel@lfdr.de>; Tue,  4 Feb 2020 06:10:19 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9B28A168B;
	Tue,  4 Feb 2020 06:09:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9B28A168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1580793018;
	bh=nLn4eC7NXglwlNevWX70Vwe0ekxEa10hy4Idz66jVPI=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=tx2KsqZX4Em/QLIjPtd5ORH+F0bqktqOWpaqJMpAK/JpfsWGvJJ1AwkocmhP/abCQ
	 OtX122QQBG3TeHD103mtwPyXQ/AYaD04OgJQ8/AUfCkNiN+qTBIHZhjNjtqTLHXWEa
	 O6UGsAZgDr+k5HBJ1kaSL3bw8ZGj/vT+ecjohA4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B007EF801DB;
	Tue,  4 Feb 2020 06:08:37 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 30AC9F80162; Tue,  4 Feb 2020 06:08:34 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 30791F800AB
 for <alsa-devel@alsa-project.org>; Tue,  4 Feb 2020 06:08:28 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 30791F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com
 header.b="a30XwVGe"
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e38fc110000>; Mon, 03 Feb 2020 21:07:29 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 03 Feb 2020 21:08:25 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 03 Feb 2020 21:08:25 -0800
Received: from [10.24.218.119] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 4 Feb
 2020 05:08:22 +0000
To: Takashi Iwai <tiwai@suse.de>
References: <20200203100617.3856-1-nmahale@nvidia.com>
 <s5hk154rm2f.wl-tiwai@suse.de>
From: Nikhil Mahale <nmahale@nvidia.com>
X-Nvconfidentiality: Public
Message-ID: <acd84229-07f8-46c5-fe5b-e027e918c56c@nvidia.com>
Date: Tue, 4 Feb 2020 10:38:19 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <s5hk154rm2f.wl-tiwai@suse.de>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1580792849; bh=XVM5uvDH9qNEKykoGtH6vmWipIO0ybSivUY6WHytNbk=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=a30XwVGeHM8PXt/xed5OTjQpJHmOXmI2ZuCIqZxYuS9WKnMUVSl5f9onCzH/Rr5kd
 53GGZEM3yjZj3qJ6ZDit1MrjxsaD9CwSvyxcZS0okzg52NfXOOnBG3lOV9FF4+iiJ9
 H41uOZJZpvyJ1Uh3uhPMbfnz3nigGt1Wz08qo3dj9wOEjb5oniqIfJXeymUUdiuHNV
 5WVuvQ8IJMNek0AkYhy3LAvfMARmBIuoPpoLrl7nsRA/VqvqjVzIV+J9x4ff4R8Ew4
 t1VDE++cExhgpM3IKoAoynUMDjV53FYkALLRoIHihkV1D6on4cNg7fdd8g3FXxMu+8
 WHrmsUF0S9Mag==
Cc: alsa-devel@alsa-project.org, kai.vehmanen@linux.intel.com,
 aplattner@nvidia.com, martin@larkos.de, tiwai@suse.com
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 2/3/20 4:10 PM, Takashi Iwai wrote:
> External email: Use caution opening links or attachments
> 
> 
> On Mon, 03 Feb 2020 11:06:17 +0100,
> Nikhil Mahale wrote:
>>
>> If dyn_pcm_assign is set, different jack objects are being created
>> for pcm and pins.
>>
>> If dyn_pcm_assign is set, generic_hdmi_build_jack() calls into
>> add_hdmi_jack_kctl() to create and track separate jack object for
>> pcm. Like sync_eld_via_acomp(), hdmi_present_sense_via_verbs() also
>> need to report status change of the pcm jack.
>>
>> Rename pin_idx_to_jack() to pin_idx_to_pcm_jack(). The code to
>> report status change of pcm jack, move it to update_eld() which is
>> common for acomp and !acomp code paths.
> 
> Thanks, that's the cause of the regression.
> However, this needs yet more careful handling, I'm afraid.
> 
> - hdmi_present_sense_via_verbs() may return true, and its callers
> (both check_presence_and_report() and hdmi_repoll_eld()) do call
> snd_hda_jack_report_sync() again.
> 
> - For non-dyn_pcm_assign case, we shouldn't call jack report there,
> but rather simply return true for calling report sync.
> 
> - There is another workaround to block the jack report in
> hdmi_present_sense_via_verbs() which is applied after update_eld(),
> and this will be ignored.
> 
> So, I guess that we need the conditional application of the individual
> snd_jack_report() only for spec->dyn_pcm_assign==true, and assure that
> hdmi_present() returns false.
Yeah, you are right. But I don't think we should return false from
hdmi_present().

Before dyn_pcm_assign support for non-acomp drivers:
1) pcm and pin plug detection were controlled by same jack object, and
2) change in plug status was reported from snd_hda_jack_report_sync().

If dyn_pcm_assign support is enabled for non-acomp drivers, then pcm
and pin detection are controlled by different jack object. Now, report
for plug status change of both jack object, requires to be in sync.
snd_hda_jack_report_sync() reports change in plug status of pin jack
object. I think after snd_hda_jack_report_sync() we should loop over
all pins, detect change in plug status, and report change in plug
status of pcm jack.
 
> The last item (the jack report block) is still unclear to me; it's a
> workaround that was needed for Nvidia drivers in the past due to
> instability.  If this is still needed for DP-MST case, we have to
> reconsider how to deal with it.  Otherwise, this can be applied only
> for non-dyn_pcm_assign case.
The jack report block, was added by commit 464837a7bc0a (ALSA: hda -
block HDMI jack reports while repolling), to avoid race condition
with repolling. That is not NVIDIA specific.

> BTW, the condition for jack->block_report and return value in
> hdmi_present_sense_via_verbs() looks currently complicated, but it
> could have been simplified like:
> 
> -- 8< --
> --- a/sound/pci/hda/patch_hdmi.c
> +++ b/sound/pci/hda/patch_hdmi.c
> @@ -1569,7 +1569,6 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
>          * the unsolicited response to avoid custom WARs.
>          */
>         int present;
> -       bool ret;
>         bool do_repoll = false;
> 
>         present = snd_hda_jack_pin_sense(codec, pin_nid, dev_id);
> @@ -1603,16 +1602,14 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
>         else
>                 update_eld(codec, per_pin, eld);
> 
> -       ret = !repoll || !eld->monitor_present || eld->eld_valid;
> -
>         jack = snd_hda_jack_tbl_get_mst(codec, pin_nid, per_pin->dev_id);
>         if (jack) {
> -               jack->block_report = !ret;
> +               jack->block_report = do_repoll;
>                 jack->pin_sense = (eld->monitor_present && eld->eld_valid) ?
>                         AC_PINSENSE_PRESENCE : 0;
>         }
>         mutex_unlock(&per_pin->lock);
> -       return ret;
> +       return !do_repoll;
>  }
> 
>  static struct snd_jack *pin_idx_to_jack(struct hda_codec *codec,
> -- 8< --
Yeah, this is simple to understand.

I am sending fresh patches, see if they make sense.

Thanks,
Nikhil Mahale

> 
> Takashi
> 
>>
>> Fixes: 5398e94fb753 ALSA: hda - Add DP-MST support for NVIDIA codecs
>> Signed-off-by: Nikhil Mahale <nmahale@nvidia.com>
>> ---
>>  sound/pci/hda/patch_hdmi.c | 87 ++++++++++++++++++++++++----------------------
>>  1 file changed, 45 insertions(+), 42 deletions(-)
>>
>> diff --git a/sound/pci/hda/patch_hdmi.c b/sound/pci/hda/patch_hdmi.c
>> index 48bddc218829..7b5360037217 100644
>> --- a/sound/pci/hda/patch_hdmi.c
>> +++ b/sound/pci/hda/patch_hdmi.c
>> @@ -1480,6 +1480,35 @@ static void hdmi_pcm_reset_pin(struct hdmi_spec *spec,
>>       per_pin->channels = 0;
>>  }
>>
>> +static struct snd_jack *pin_idx_to_pcm_jack(struct hda_codec *codec,
>> +                                         struct hdmi_spec_per_pin *per_pin)
>> +{
>> +     struct hdmi_spec *spec = codec->spec;
>> +     struct snd_jack *jack = NULL;
>> +     struct hda_jack_tbl *jack_tbl;
>> +
>> +     /* if !dyn_pcm_assign, get jack from hda_jack_tbl
>> +      * in !dyn_pcm_assign case, spec->pcm_rec[].jack is not
>> +      * NULL even after snd_hda_jack_tbl_clear() is called to
>> +      * free snd_jack. This may cause access invalid memory
>> +      * when calling snd_jack_report
>> +      */
>> +     if (per_pin->pcm_idx >= 0 && spec->dyn_pcm_assign) {
>> +             jack = spec->pcm_rec[per_pin->pcm_idx].jack;
>> +     } else if (!spec->dyn_pcm_assign) {
>> +             /*
>> +              * jack tbl doesn't support DP MST
>> +              * DP MST will use dyn_pcm_assign,
>> +              * so DP MST will never come here
>> +              */
>> +             jack_tbl = snd_hda_jack_tbl_get_mst(codec, per_pin->pin_nid,
>> +                                                 per_pin->dev_id);
>> +             if (jack_tbl)
>> +                     jack = jack_tbl->jack;
>> +     }
>> +     return jack;
>> +}
>> +
>>  /* update per_pin ELD from the given new ELD;
>>   * setup info frame and notification accordingly
>>   */
>> @@ -1490,9 +1519,15 @@ static bool update_eld(struct hda_codec *codec,
>>       struct hdmi_eld *pin_eld = &per_pin->sink_eld;
>>       struct hdmi_spec *spec = codec->spec;
>>       bool old_eld_valid = pin_eld->eld_valid;
>> +     struct snd_jack *pcm_jack;
>>       bool eld_changed;
>>       int pcm_idx;
>>
>> +     /* pcm_idx >=0 before update_eld() means it is in monitor
>> +      * disconnected event. Jack must be fetched before update_eld()
>> +      */
>> +     pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
>> +
>>       /* for monitor disconnection, save pcm_idx firstly */
>>       pcm_idx = per_pin->pcm_idx;
>>       if (spec->dyn_pcm_assign) {
>> @@ -1547,6 +1582,14 @@ static bool update_eld(struct hda_codec *codec,
>>                              SNDRV_CTL_EVENT_MASK_VALUE |
>>                              SNDRV_CTL_EVENT_MASK_INFO,
>>                              &get_hdmi_pcm(spec, pcm_idx)->eld_ctl->id);
>> +
>> +     if (!pcm_jack)
>> +             pcm_jack = pin_idx_to_pcm_jack(codec, per_pin);
>> +     if (eld_changed && pcm_jack)
>> +             snd_jack_report(pcm_jack,
>> +                             (eld->monitor_present && eld->eld_valid) ?
>> +                             SND_JACK_AVOUT : 0);
>> +
>>       return eld_changed;
>>  }
>>
>> @@ -1615,43 +1658,12 @@ static bool hdmi_present_sense_via_verbs(struct hdmi_spec_per_pin *per_pin,
>>       return ret;
>>  }
>>
>> -static struct snd_jack *pin_idx_to_jack(struct hda_codec *codec,
>> -                              struct hdmi_spec_per_pin *per_pin)
>> -{
>> -     struct hdmi_spec *spec = codec->spec;
>> -     struct snd_jack *jack = NULL;
>> -     struct hda_jack_tbl *jack_tbl;
>> -
>> -     /* if !dyn_pcm_assign, get jack from hda_jack_tbl
>> -      * in !dyn_pcm_assign case, spec->pcm_rec[].jack is not
>> -      * NULL even after snd_hda_jack_tbl_clear() is called to
>> -      * free snd_jack. This may cause access invalid memory
>> -      * when calling snd_jack_report
>> -      */
>> -     if (per_pin->pcm_idx >= 0 && spec->dyn_pcm_assign)
>> -             jack = spec->pcm_rec[per_pin->pcm_idx].jack;
>> -     else if (!spec->dyn_pcm_assign) {
>> -             /*
>> -              * jack tbl doesn't support DP MST
>> -              * DP MST will use dyn_pcm_assign,
>> -              * so DP MST will never come here
>> -              */
>> -             jack_tbl = snd_hda_jack_tbl_get_mst(codec, per_pin->pin_nid,
>> -                                                 per_pin->dev_id);
>> -             if (jack_tbl)
>> -                     jack = jack_tbl->jack;
>> -     }
>> -     return jack;
>> -}
>> -
>>  /* update ELD and jack state via audio component */
>>  static void sync_eld_via_acomp(struct hda_codec *codec,
>>                              struct hdmi_spec_per_pin *per_pin)
>>  {
>>       struct hdmi_spec *spec = codec->spec;
>>       struct hdmi_eld *eld = &spec->temp_eld;
>> -     struct snd_jack *jack = NULL;
>> -     bool changed;
>>       int size;
>>
>>       mutex_lock(&per_pin->lock);
>> @@ -1674,17 +1686,8 @@ static void sync_eld_via_acomp(struct hda_codec *codec,
>>               eld->eld_size = 0;
>>       }
>>
>> -     /* pcm_idx >=0 before update_eld() means it is in monitor
>> -      * disconnected event. Jack must be fetched before update_eld()
>> -      */
>> -     jack = pin_idx_to_jack(codec, per_pin);
>> -     changed = update_eld(codec, per_pin, eld);
>> -     if (jack == NULL)
>> -             jack = pin_idx_to_jack(codec, per_pin);
>> -     if (changed && jack)
>> -             snd_jack_report(jack,
>> -                             (eld->monitor_present && eld->eld_valid) ?
>> -                             SND_JACK_AVOUT : 0);
>> +     update_eld(codec, per_pin, eld);
>> +
>>       mutex_unlock(&per_pin->lock);
>>  }
>>
>> --
>> 2.16.4
>>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
