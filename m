Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6012138AE
	for <lists+alsa-devel@lfdr.de>; Fri,  3 Jul 2020 12:35:52 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E0677168B;
	Fri,  3 Jul 2020 12:35:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E0677168B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1593772552;
	bh=Yesq5SdI/fnqcAi+ZsKHgk/iLwBb54IuWq0ChbLjQi0=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JkFUuECxJtdwJZFqh6+atIUVU52Vh63bpYqwjHguFtbfimRgAluRHHLqlX7Anbue9
	 AIgnVB9U7i1J5gBRQQYebGTk2XOQk6QWLXHFwRVW+fsbh29m3nJBJWfo7CCkKNf1OE
	 xKjLc/DJSnXhp5EyNSs4jyeyeojKSr0LC80A0RlU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D85A3F800E0;
	Fri,  3 Jul 2020 12:34:10 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 0D5BCF80217; Fri,  3 Jul 2020 12:34:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DB155F800E0
 for <alsa-devel@alsa-project.org>; Fri,  3 Jul 2020 12:34:00 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 70B02A0040;
 Fri,  3 Jul 2020 12:33:59 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 70B02A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1593772439; bh=3T/wE8bMc0BL0daCfI0X8ARfu5h0bvCmF7vzLBctSt4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RyrQ8HUcueeRyovLp4HaK4ICBrqfaGMTgMN+6fxsIQmdmW/fDe2g5HH6yphyedtwV
 LOVAbf7HMBRjoGl9fsQe1boEe1AsYNLkyggCrNh6ELLSOl1WAhNy/CbOxefFRZyjMu
 EBjxJfCUsufABqanTZUTSb+TXQ7W3A45LKHO5hLc=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Fri,  3 Jul 2020 12:33:50 +0200 (CEST)
Subject: Re: [PATCH v2 2/2] ALSA: hda/realtek - Replace Lenovo Thinkpad X1
 Carbon 7th quirk
To: Benjamin Poirier <benjamin.poirier@gmail.com>, alsa-devel@alsa-project.org
References: <20200703080005.8942-1-benjamin.poirier@gmail.com>
 <20200703080005.8942-3-benjamin.poirier@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <58a7791c-0db4-a585-c550-3d3e9576191c@perex.cz>
Date: Fri, 3 Jul 2020 12:33:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200703080005.8942-3-benjamin.poirier@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: Kailang Yang <kailang@realtek.com>, Takashi Iwai <tiwai@suse.com>,
 Hui Wang <hui.wang@canonical.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Vincent Bernat <vincent@bernat.ch>, Even Brenden <evenbrenden@gmail.com>
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

Dne 03. 07. 20 v 10:00 Benjamin Poirier napsal(a):
> As a result of commit d2cd795c4ece ("ALSA: hda - fixup for the bass speaker
> on Lenovo Carbon X1 7th gen"), the sound output level on my machine, an X1
> Carbon 7th gen, was reduced to ~65% of its previous level when playing
> certain sounds. [1]
> 
> Internally, this laptop model has three outputs (PCM-OUT1, connection 0x02;
> PCM-OUT2, connection 0x03; SP-OUT PCM, connection 0x06) which can be routed
> to two sets of stereo speakers: Front (tweeters, node 0x14) and Bass
> (woofers, node 0x17, aka Rear in some contexts) and one headphone output
> (node 0x21). The tweeters are noticeably less powerful than the woofers.
> [2]
> 
> Before commit d2cd795c4ece, the bass speakers were connected to SP-OUT PCM.
> SP-OUT PCM is meant for s/pdif output and does not have volume control.
> This connection made volume control commonly ineffective (using the Master
> slider in alsa or pulseaudio apparently had little effect or alternated
> between mute or max with nothing in between).
> 
> commit d2cd795c4ece added quirk ALC285_FIXUP_SPEAKER2_TO_DAC1 which
> resulted in assigning both sets of speakers to PCM-OUT1, bringing
> the two sets of speakers under one effective volume control but also
> lowering the output volume noticeably.
> 
> Fix this by connecting PCM-OUT1 to Front speakers and PCM-OUT2 to Rear
> speakers. Each set of speakers gets its own volume control and the max
> output volume is restored to what it was before commit d2cd795c4ece. This
> is done by setting the connection of node 0x17 to 0x03.
> 
> However, when we do this, the HDA auto config automatically changes the
> connection of node 0x21 to 0x02. This output, meant for the front speakers,
> has some "secret" equalizer which changes the output volume according to
> the level of what's being played, after some delay[3]. This is undesirable
> with headphones. Therefore, this patch manually limits the connection of
> node 0x21 to 0x03.

Thank you for this work. Perhaps, Takashi will have some comments to improve 
this quirk.

> The volume control for PCM-OUT2 is renamed to reflect its dual effect.
> This name is also used in a modified alsa UCM profile. [4]

The new name is not ideal. Perhaps, a mirror (joined) control might be better 
in this case. I mean to create both "Bass Speaker Playback Volume" and 
"Headphone Playback Volume" with the similar NID control.

Or create "Speaker Playback" controls with 4 channels (and joined "Headphone 
Playback" controls).

> It is possible that the X1 Carbon 8th gen would benefit from the same
> changes but I don't have a device to test that. Fixups are reordered so
> that the devices for 7th & 8th gen can share the same chain after the first
> fixup. The resulting chain is:

8th gen hardware should be similar, so the new fixup should be applied to this 
hw, too.

> ALC295_FIXUP_TPX17_DUAL_SPEAKERS/ALC285_FIXUP_SPEAKER2_TO_DAC1
> ALC285_FIXUP_THINKPAD_HEADSET_JACK
> ALC269_FIXUP_THINKPAD_ACPI
> ALC269_FIXUP_SKU_IGNORE
> 
> [1] https://gist.github.com/hamidzr/dd81e429dc86f4327ded7a2030e7d7d9#gistcomment-3214171
> [2] https://bugzilla.kernel.org/show_bug.cgi?id=207407#c10
> [3] https://gist.github.com/hamidzr/dd81e429dc86f4327ded7a2030e7d7d9#gistcomment-3276276
> [4] https://lore.kernel.org/alsa-devel/20200703072302.16876-1-benjamin.poirier@gmail.com/
> 
> Fixes: d2cd795c4ece ("ALSA: hda - fixup for the bass speaker on Lenovo Carbon X1 7th gen")
> Link: https://lore.kernel.org/alsa-devel/20200210025249.GA2700@f3/
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Kailang Yang <kailang@realtek.com>
> Tested-by: Vincent Bernat <vincent@bernat.ch>
> Tested-by: Even Brenden <evenbrenden@gmail.com>
> Signed-off-by: Benjamin Poirier <benjamin.poirier@gmail.com>
> ---
>   sound/pci/hda/patch_realtek.c | 56 ++++++++++++++++++++++++++++++++---
>   1 file changed, 52 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 16696694da91..ef3dbf83e42b 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -5825,6 +5825,46 @@ static void alc285_fixup_speaker2_to_dac1(struct hda_codec *codec,
>   	}
>   }
>   
> +static void alc295_fixup_tpx17_dual_speakers(struct hda_codec *codec,
> +					     const struct hda_fixup *fix,
> +					     int action)
> +{
> +	if (action == HDA_FIXUP_ACT_PRE_PROBE) {
> +		static const hda_nid_t conn[] = { 0x03 };
> +
> +		/* For NID 0x17 (bass speakers), the connection list is {0x02,
> +		 * 0x03, 0x06}. Disable SP-OUT PCM (0x06) selection since it
> +		 * has no volume control, disable PCM1 (0x02) selection since
> +		 * it is for front speakers. This leaves PCM2 (0x03).
> +		 */
> +		snd_hda_override_conn_list(codec, 0x17, ARRAY_SIZE(conn),
> +					   conn);
> +		/* For NID 0x21 (headphone out), the connection list is {0x02,
> +		 * 0x03}. Disable LOUT1 (0x02) selection since its volume
> +		 * fluctuates according to input level. This leaves LOUT2
> +		 * (0x03).
> +		 */
> +		snd_hda_override_conn_list(codec, 0x21, ARRAY_SIZE(conn),
> +					   conn);
> +	} else if (action == HDA_FIXUP_ACT_INIT) {
> +		/* Because the overridden connection lists contain only a
> +		 * single node, __parse_nid_path() does not label the output
> +		 * as "multi". This leads snd_hda_activate_path() to skip the
> +		 * AC_VERB_SET_CONNECT_SEL even though it might be needed. Do
> +		 * it here instead.
> +		 * Note that when doing AC_VERB_SET_CONNECT_SEL, the
> +		 * connection is specified by index instead of nid.
> +		 */
> +		snd_hda_codec_write(codec, 0x17, 0, AC_VERB_SET_CONNECT_SEL,
> +				    0x1);
> +		snd_hda_codec_write(codec, 0x21, 0, AC_VERB_SET_CONNECT_SEL,
> +				    0x1);
> +	} else if (action == HDA_FIXUP_ACT_BUILD) {
> +		rename_ctl(codec, "Headphone Playback Volume",
> +			   "Headphone/Bass Speaker Playback Volume");
> +	}
> +}
> +
>   /* Hook to update amp GPIO4 for automute */
>   static void alc280_hp_gpio4_automute_hook(struct hda_codec *codec,
>   					  struct hda_jack_callback *jack)
> @@ -6077,6 +6117,7 @@ enum {
>   	ALC225_FIXUP_DISABLE_MIC_VREF,
>   	ALC225_FIXUP_DELL1_MIC_NO_PRESENCE,
>   	ALC295_FIXUP_DISABLE_DAC3,
> +	ALC295_FIXUP_TPX17_DUAL_SPEAKERS,
>   	ALC285_FIXUP_SPEAKER2_TO_DAC1,
>   	ALC280_FIXUP_HP_HEADSET_MIC,
>   	ALC221_FIXUP_HP_FRONT_MIC,
> @@ -6886,11 +6927,17 @@ static const struct hda_fixup alc269_fixups[] = {
>   		.type = HDA_FIXUP_FUNC,
>   		.v.func = alc295_fixup_disable_dac3,
>   	},
> +	[ALC295_FIXUP_TPX17_DUAL_SPEAKERS] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = alc295_fixup_tpx17_dual_speakers,
> +		.chained = true,
> +		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK
> +	},
>   	[ALC285_FIXUP_SPEAKER2_TO_DAC1] = {
>   		.type = HDA_FIXUP_FUNC,
>   		.v.func = alc285_fixup_speaker2_to_dac1,
>   		.chained = true,
> -		.chain_id = ALC269_FIXUP_THINKPAD_ACPI
> +		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK
>   	},
>   	[ALC256_FIXUP_DELL_INSPIRON_7559_SUBWOOFER] = {
>   		.type = HDA_FIXUP_PINS,
> @@ -7263,7 +7310,7 @@ static const struct hda_fixup alc269_fixups[] = {
>   		.type = HDA_FIXUP_FUNC,
>   		.v.func = alc_fixup_headset_jack,
>   		.chained = true,
> -		.chain_id = ALC285_FIXUP_SPEAKER2_TO_DAC1
> +		.chain_id = ALC269_FIXUP_THINKPAD_ACPI
>   	},
>   	[ALC294_FIXUP_ASUS_HPE] = {
>   		.type = HDA_FIXUP_VERBS,
> @@ -7559,8 +7606,8 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>   	SND_PCI_QUIRK(0x17aa, 0x224c, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
>   	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
>   	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
> -	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
> -	SND_PCI_QUIRK(0x17aa, 0x22be, "Thinkpad X1 Carbon 8th", ALC285_FIXUP_THINKPAD_HEADSET_JACK),
> +	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC295_FIXUP_TPX17_DUAL_SPEAKERS),
> +	SND_PCI_QUIRK(0x17aa, 0x22be, "Thinkpad X1 Carbon 8th", ALC285_FIXUP_SPEAKER2_TO_DAC1),

It will cause regression with the old UCM configs. I would preper the manual 
model selection and switch this when things settle a bit in the user space. We 
definitely need a better way to control this volume separately for both 
tweeters and the bass speakers in the user space. The "Master" volume hack is 
far from the ideal solution.

For this time, keep ALC285_FIXUP_SPEAKER2_TO_DAC1 as the default fixup.

						Jaroslav


>   	SND_PCI_QUIRK(0x17aa, 0x30bb, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
>   	SND_PCI_QUIRK(0x17aa, 0x30e2, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
>   	SND_PCI_QUIRK(0x17aa, 0x310c, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
> @@ -7746,6 +7793,7 @@ static const struct hda_model_fixup alc269_fixup_models[] = {
>   	{.id = ALC255_FIXUP_DELL_SPK_NOISE, .name = "dell-spk-noise"},
>   	{.id = ALC225_FIXUP_DELL1_MIC_NO_PRESENCE, .name = "alc225-dell1"},
>   	{.id = ALC295_FIXUP_DISABLE_DAC3, .name = "alc295-disable-dac3"},
> +	{.id = ALC295_FIXUP_TPX17_DUAL_SPEAKERS, .name = "alc295-thinkpad-x1-gen7"},
>   	{.id = ALC285_FIXUP_SPEAKER2_TO_DAC1, .name = "alc285-speaker2-to-dac1"},
>   	{.id = ALC280_FIXUP_HP_HEADSET_MIC, .name = "alc280-hp-headset"},
>   	{.id = ALC221_FIXUP_HP_FRONT_MIC, .name = "alc221-hp-mic"},
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
