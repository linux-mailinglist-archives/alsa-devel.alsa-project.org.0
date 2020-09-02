Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9225225AB89
	for <lists+alsa-devel@lfdr.de>; Wed,  2 Sep 2020 14:57:20 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5AB891837;
	Wed,  2 Sep 2020 14:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5AB891837
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1599051439;
	bh=yPqQwTlMHAbXGQQyso57cYKC5eou/zEVlBnwKkoOGAk=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=vo+Ap6t7D6tZw1kvrBsgwjBhJwkKh7ImndNcCP2UuqM1y2fbT0k7L6xpo6Cfx8+TK
	 X5k6h2vkBNR2MepqOvvyLhzZxXxJ7ZiK6L6+46HSSKYGpq72UF4jAVqT+UoWCUXkkB
	 NFdNzz20lG8h2JikVDU0eWz1TDVL+Lq06OS591w0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 86555F800F3;
	Wed,  2 Sep 2020 14:55:38 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D19FFF80212; Wed,  2 Sep 2020 14:55:36 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BFBB2F800F3
 for <alsa-devel@alsa-project.org>; Wed,  2 Sep 2020 14:55:29 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 040C2A0040;
 Wed,  2 Sep 2020 14:55:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 040C2A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1599051329; bh=HdR53cCKHm692xh5oEsPnPWPHXiwcrR8Hn2FmeLKg6w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=xsfXCsbw2J4g0yjHSJggdIZrTZlsW3/apWAN6Gdfm8o6lR3wBTI+lrCQDYBSmw+YF
 M7kF8/SoKgHfR3hsc8BIQ8VUMkslxyV/+dzMjyQxOlaSlKN46HpzIjVLCDWs/qq6m1
 nMEHSfG9FigR4VLKR5ifD6qMGi/gO5m5ApGrKpmM=
Received: from p1gen2.perex-int.cz (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed,  2 Sep 2020 14:55:19 +0200 (CEST)
Subject: Re: [PATCH] ALSA: hda/realtek - Add control fixup for Lenovo Thinkpad
 X1 Carbon 7th
To: Takashi Iwai <tiwai@suse.de>, Benjamin Poirier <benjamin.poirier@gmail.com>
References: <20200829112746.3118-1-benjamin.poirier@gmail.com>
 <32b649db-ede6-d3ea-a963-d0bac331e4b4@perex.cz>
 <s5hft81czh8.wl-tiwai@suse.de> <s5hlfhsbn0u.wl-tiwai@suse.de>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <3e999b99-0ce7-68b8-a923-07ba2f4d798d@perex.cz>
Date: Wed, 2 Sep 2020 14:55:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <s5hlfhsbn0u.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Vincent Bernat <vincent@bernat.ch>, Even Brenden <evenbrenden@gmail.com>,
 Mark Pearson <mpearson@lenovo.com>
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

Dne 02. 09. 20 v 10:28 Takashi Iwai napsal(a):
> On Tue, 01 Sep 2020 17:01:55 +0200,
> Takashi Iwai wrote:
>>
>> On Tue, 01 Sep 2020 15:52:09 +0200,
>> Jaroslav Kysela wrote:
>>>
>>>> +}
>>>> +
>>>> +static int tpx1_dual_speaker_vol_put(struct snd_kcontrol *kcontrol,
>>>> +				     struct snd_ctl_elem_value *ucontrol)
>>>> +{
>>>> +	struct tpx1_dual_speaker *speaker_priv = snd_kcontrol_chip(kcontrol);
>>>> +	int err;
>>>> +
>>>> +	/* Control tweeter volume */
>>>> +	err = speaker_priv->underlying.put(&speaker_priv->underlying,
>>>> +					   ucontrol);
>>>> +	if (err < 0)
>>>> +		return err;
>>>> +
>>>> +	/* Control woofer volume (shared with headphone) */
>>>> +	err = speaker_priv->hp_vol.put(&speaker_priv->hp_vol, ucontrol);
>>>> +	if (err < 0)
>>>> +		return err;
>>>> +
>>>> +	snd_ctl_notify(speaker_priv->codec->card, SNDRV_CTL_EVENT_MASK_VALUE,
>>>> +		       &speaker_priv->hp_vol.id);
>>>> +	return err;
>>>> +}
>>>> +
>>>> +static int tpx1_dual_speaker_vol_tlv(struct snd_kcontrol *kcontrol,
>>>> +				     int op_flag, unsigned int size,
>>>> +				     unsigned int __user *tlv)
>>>> +{
>>>> +	struct tpx1_dual_speaker *speaker_priv = snd_kcontrol_chip(kcontrol);
>>>> +
>>>> +	return speaker_priv->underlying.tlv.c(&speaker_priv->underlying,
>>>> +					      op_flag, size, tlv);
>>>> +}
>>>> +
>>>> +static void tpx1_dual_speaker_vol_free(struct snd_kcontrol *kcontrol)
>>>> +{
>>>> +	struct tpx1_dual_speaker *speaker_priv = snd_kcontrol_chip(kcontrol);
>>>> +
>>>> +	if (speaker_priv->underlying.private_free)
>>>> +		speaker_priv->underlying.private_free(
>>>> +			&speaker_priv->underlying);
>>>> +	kfree(speaker_priv);
>>>> +}
>>>> +
>>>> +static int tpx1_dual_override_speaker_vol(struct hda_codec *codec,
>>>> +					  struct snd_kcontrol *speaker_vol,
>>>> +					  struct snd_kcontrol *hp_vol)
>>>> +{
>>>> +	struct tpx1_dual_speaker *speaker_priv;
>>>> +
>>>> +	speaker_priv = kmalloc(sizeof(struct tpx1_dual_speaker), GFP_KERNEL);
>>>> +	if (!speaker_priv)
>>>> +		return -ENOMEM;
>>>> +	speaker_priv->codec = codec;
>>>> +	memcpy(&speaker_priv->underlying, speaker_vol,
>>>> +	       sizeof(struct snd_kcontrol));
>>>> +	memcpy(&speaker_priv->hp_vol, hp_vol, sizeof(struct snd_kcontrol));
>>>
>>> This is a bit clumsy part. It would be probably nice to have a helper in the
>>> upper control code to clone the original control safely. Takashi?
>>
>> The purpose of those is to have two controls managing the same amp and
>> get notified with each other at other's update, right?  The missing
>> piece is only about notification, and that could be done in the common
>> code somehow, too.  For example, we can reduce the 16bit usage of NID
>> to 8 bit embedded in private_value, then we'll have 8 bit space for
>> storing the coupled kctl nid or some other tag for notification.
>>
>> However, the approach by this patch has minor problems, as far as I
>> see:
>>
>> - The notification may be issued unnecessarily for Master volume
>>   change;
>>   when you change Master volume, it'll notify Headphone and/or Speaker
>>   as well although those (virtual) values aren't changed.
>>   It's a minor issue and can be almost negligible, though.
>>
>> - The volume status depends on the operation order;
>>   e.g. when switching the output from speaker to headphone, at first
>>   mute and set volume zero Speaker, then unmute/raise Headphone.
>>   But if we do unmute/raise Headphone at first, then mute/zero
>>   Speaker, the headphone output will be also zero volume out of
>>   sudden.
>>   It seems that PA does in the former way, so the current approach
>>   might work practically, but it can be a pitfall in some corner
>>   cases.
> 
> After testing the actual patch with hda-emu, I noticed that the
> Speaker volume changes the volume of both speakers, and it's also tied
> with Headphone, too.  That said, basically this is de facto Master
> volume, and we basically don't need to control the individual amp.
> 
> If that's the case, the following patch may work instead (checked only
> via hda-emu).  It applies the workaround to fix the routing, then
> rename the half-working volume controls that aren't touched by PA.  If
> user definitely needs to adjust the individual amp, they can still
> change the renamed kctl (DAC1 and DAC2), but this must be a rare
> requirement.

This patch works with and without UCM and the code is really straight now.
Nice idea. Please, apply it to upstream.

Reviewed-by: Jaroslav Kysela <perex@perex.cz>

> 
> 
> Takashi
> 
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -5867,6 +5867,39 @@ static void alc275_fixup_gpio4_off(struct hda_codec *codec,
>  	}
>  }
>  
> +/* Quirk for Thinkpad X1 7th and 8th Gen
> + * The following fixed routing needed
> + * DAC1 (NID 0x02) -> Speaker (NID 0x14); some eq applied secretly
> + * DAC2 (NID 0x03) -> Bass (NID 0x17) & Headphone (NID 0x21); sharing a DAC
> + * DAC3 (NID 0x06) -> Unused, due to the lack of volume amp
> + */
> +static void alc285_fixup_thinkpad_x1_gen7(struct hda_codec *codec,
> +					  const struct hda_fixup *fix, int action)
> +{
> +	static const hda_nid_t conn[] = { 0x02, 0x03 }; /* exclude 0x06 */

It seems that NID 0x17 should be forced to 0x03 only for this hardware.

> +	static const hda_nid_t preferred_pairs[] = {
> +		0x14, 0x02, 0x17, 0x03, 0x21, 0x03, 0
> +	};

But you're preferring this here..

> +	struct alc_spec *spec = codec->spec;
> +
> +	switch (action) {
> +	case HDA_FIXUP_ACT_PRE_PROBE:
> +		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn), conn);
> +		spec->gen.preferred_dacs = preferred_pairs;
> +		break;
> +	case HDA_FIXUP_ACT_BUILD:
> +		/* The generic parser creates somewhat unintuitive volume ctls
> +		 * with the fixed routing above, and the shared DAC2 may be
> +		 * confusing for PA.
> +		 * Rename those to unique names so that PA don't touch them
> +		 * and use only Master volume.
> +		 */
> +		rename_ctl(codec, "Front Playback Volume", "DAC1 Playback Volume");
> +		rename_ctl(codec, "Bass Speaker Playback Volume", "DAC2 Playback Volume");
> +		break;
> +	}
> +}
> +
>  static void alc233_alc662_fixup_lenovo_dual_codecs(struct hda_codec *codec,
>  					 const struct hda_fixup *fix,
>  					 int action)
> @@ -6135,6 +6168,7 @@ enum {
>  	ALC289_FIXUP_DUAL_SPK,
>  	ALC294_FIXUP_SPK2_TO_DAC1,
>  	ALC294_FIXUP_ASUS_DUAL_SPK,
> +	ALC285_FIXUP_THINKPAD_X1_GEN7,
>  	ALC285_FIXUP_THINKPAD_HEADSET_JACK,
>  	ALC294_FIXUP_ASUS_HPE,
>  	ALC294_FIXUP_ASUS_COEF_1B,
> @@ -7280,11 +7314,17 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.chained = true,
>  		.chain_id = ALC294_FIXUP_SPK2_TO_DAC1
>  	},
> +	[ALC285_FIXUP_THINKPAD_X1_GEN7] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc285_fixup_thinkpad_x1_gen7,
> +		.chained = true,
> +		.chain_id = ALC269_FIXUP_THINKPAD_ACPI
> +	},
>  	[ALC285_FIXUP_THINKPAD_HEADSET_JACK] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = alc_fixup_headset_jack,
>  		.chained = true,
> -		.chain_id = ALC285_FIXUP_SPEAKER2_TO_DAC1
> +		.chain_id = ALC285_FIXUP_THINKPAD_X1_GEN7
>  	},
>  	[ALC294_FIXUP_ASUS_HPE] = {
>  		.type = HDA_FIXUP_VERBS,
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
