Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE93158A8D
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Feb 2020 08:42:24 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AEA291670;
	Tue, 11 Feb 2020 08:41:33 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AEA291670
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1581406943;
	bh=8UwJlJz+zUngm4vjZPqabWmMf++g+mTK1UEfXOqH4oo=;
	h=To:References:From:Date:In-Reply-To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ovLRLcR5PzD8TMgvGkLEJHBJ8beyq8SIs1TCue82AcD8T0PBvVFbEO17WyjNwfuFB
	 oIYP8ru6GLmekiWJqK70WB1Tqm9ctS9XqkNbeGNQASErKPg3IbbAZL50s2VeHeN+21
	 5iPUyOP9Qq9tQhfANZo/NSTYtjqsSA9xPTvJUoE0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BA731F8013D;
	Tue, 11 Feb 2020 08:40:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 94508F80145; Tue, 11 Feb 2020 08:40:39 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,SURBL_BLOCKED,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 076D2F8013D
 for <alsa-devel@alsa-project.org>; Tue, 11 Feb 2020 08:40:32 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0B3F1A0040;
 Tue, 11 Feb 2020 08:40:32 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0B3F1A0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1581406832; bh=REuN32AszY9i63pAP7wyB0Bevs0Di3fTL0d0VlG4R+8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=YkVpS+MWC0LjjHaa1no+jx6K9PwzwYMFwWqQFHeLq58Elbailo9PdMeJjpX5yn/BB
 v+bcqMDe/oEJkYJf0vY8DWKCUYs69iVVV2PgjdxPRrznFbS1R5ECQVm1CENKNCi//0
 dPLD1aLSaYEiFKRTD+8hECYKB1k8MAiNcjke7w9k=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 11 Feb 2020 08:40:26 +0100 (CET)
To: Benjamin Poirier <benjamin.poirier@gmail.com>, Takashi Iwai <tiwai@suse.de>
References: <20200211055651.4405-1-benjamin.poirier@gmail.com>
 <20200211055651.4405-2-benjamin.poirier@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <b23abac0-401c-9472-320c-4e9d7eab26de@perex.cz>
Date: Tue, 11 Feb 2020 08:40:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200211055651.4405-2-benjamin.poirier@gmail.com>
Content-Language: en-US
Cc: alsa-devel@alsa-project.org, Kailang Yang <kailang@realtek.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [alsa-devel] [PATCH 2/2] ALSA: hda/realtek - Fix Lenovo
 Thinkpad X1 Carbon 7th quirk value
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

Dne 11. 02. 20 v 6:56 Benjamin Poirier napsal(a):
> As a result of commit d2cd795c4ece ("ALSA: hda - fixup for the bass speaker
> on Lenovo Carbon X1 7th gen"), the maximum sound output level on my
> machine, an X1 Carbon, was reduced to ~60% of its previous level.
> 
> This laptop model has two sets of stereo speakers: Front and Bass (aka Rear
> in some contexts).
> Before commit d2cd795c4ece, volume control was commonly ineffective (using
> the Master slider in alsa or pulseaudio apparently had little effect or
> alternated between mute or max with nothing in between - more details
> below)
> commit d2cd795c4ece added quirk ALC285_FIXUP_SPEAKER2_TO_DAC1 which
> resulted in assigning both sets of speakers to the same DAC, bringing
> the two sets of speakers under one effective volume control but also
> lowering the max output volume noticeably.
> 
> Fix this by changing the quirk so that each set of speakers can be
> controlled individually and the max output volume is restored to what it
> was before commit d2cd795c4ece.
> 
> Since there is no documentation about the audio codec, here is some
> detailed information about the result of applying different quirks.
> DAC connection (which is what's affected by the quirk) is reported as found
> in /proc/asound/card0/codec#0, Node 0x17.
> pavucontrol controls are reported with the device configured with the
> "Analog Surround 4.0 Output" profile.
> 
> no quirk
> 	Loud max output volume
> 	DAC connection
> 	  Connection: 3
> 	     0x02 0x03 0x06*
> 	Controls in alsamixer
> 		Master controls front speakers only.
> 		Speaker controls front speakers only.
> 		Bass Speaker is a toggle that mutes everything.
> 		PCM controls all speakers.
> 		There is no "Front" mixer.
> 	Controls in pavucontrol
> 		"Front Left"/"Front Right" sliders work as expected.
> 		"Rear Left"/"Rear Right" sliders seem to operate in a
> 		non-linear fashion such that most values above 0% result in
> 		max volume output.
> 		-> Because the bass speakers (Rear) are more powerful, the
> 		net effect is that when the channels are linked into a
> 		single slider, it seems like it has just two modes: mute or
> 		max.
> ALC285_FIXUP_SPEAKER2_TO_DAC1
> 	Weak (~60%) max output volume
> 	DAC connection
> 	  Connection: 3
> 	     0x02* 0x03 0x06
> 	  In-driver Connection: 1
> 	     0x02
> 	Controls in alsamixer
> 		Master controls all four speakers.
> 		Speaker controls all four speakers.
> 		Bass Speaker is a toggle that mutes everything.
> 		PCM controls all four speakers.
> 		There is no "Front" mixer.
> 	Controls in pavucontrol
> 		"Front Left"/"Front Right" sliders have no effect.
> 		"Rear Left"/"Rear Right" sliders control both front and
> 		bass speakers.
> 		-> Volume control is effective but it's not possible to
> 		control front and bass speakers individually.
> ALC295_FIXUP_DISABLE_DAC3
> 	Loud max output volume
> 	DAC connection
> 	  Connection: 3
> 	     0x02 0x03* 0x06
> 	  In-driver Connection: 2
> 	     0x02 0x03
> 	Controls in alsamixer
> 		Master controls all speakers.
> 		Speaker is a toggle that mutes everything.
> 		Bass Speaker controls bass speakers only.
> 		PCM controls all speakers.
> 		Front controls front speakers only.
> 	Controls in pavucontrol
> 		"Front Left"/"Front Right" sliders control front speakers
> 		only.
> 		"Rear Left"/"Rear Right" sliders control bass speakers
> 		only.
> 		-> Volume control is effective and it's possible to control
> 		each of the four speakers individually.
> 
> In summary, Node 0x17 DAC connection 0x3 offers the loudest max volume and
> the most detailed mixer controls. That connection is obtained with quirk
> ALC295_FIXUP_DISABLE_DAC3. Therefore, change the ThinkPad X1 Carbon 7th to
> use ALC295_FIXUP_DISABLE_DAC3.

The volume split (individual volume control) will cause trouble for the UCM 
volume control at the moment which is the target for this device to get the 
digital microphone working. If there is no possibility to share DAC, it would 
be probably more nice to join the volume control in the driver.

Have you tried to use 0x03 as source for all four speakers?

Why PA handles the rear volume control with the current driver code in the 
legacy ALSA driver? It should be handled like standard stereo device. I'll check.

You should also test PA with UCM.

				Thanks,
					Jaroslav

> 
> Fixes: d2cd795c4ece ("ALSA: hda - fixup for the bass speaker on Lenovo Carbon X1 7th gen")
> Link: https://lore.kernel.org/alsa-devel/20200210025249.GA2700@f3/
> Cc: Jaroslav Kysela <perex@perex.cz>
> Cc: Kailang Yang <kailang@realtek.com>
> Signed-off-by: Benjamin Poirier <benjamin.poirier@gmail.com>
> ---
>   sound/pci/hda/patch_realtek.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 05d44df2008e..3171da10123e 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -7268,7 +7268,7 @@ static const struct snd_pci_quirk alc269_fixup_tbl[] = {
>   	SND_PCI_QUIRK(0x17aa, 0x224c, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
>   	SND_PCI_QUIRK(0x17aa, 0x224d, "Thinkpad", ALC298_FIXUP_TPT470_DOCK),
>   	SND_PCI_QUIRK(0x17aa, 0x225d, "Thinkpad T480", ALC269_FIXUP_LIMIT_INT_MIC_BOOST),
> -	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC285_FIXUP_SPEAKER2_TO_DAC1),
> +	SND_PCI_QUIRK(0x17aa, 0x2292, "Thinkpad X1 Carbon 7th", ALC295_FIXUP_DISABLE_DAC3),
>   	SND_PCI_QUIRK(0x17aa, 0x30bb, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
>   	SND_PCI_QUIRK(0x17aa, 0x30e2, "ThinkCentre AIO", ALC233_FIXUP_LENOVO_LINE2_MIC_HOTKEY),
>   	SND_PCI_QUIRK(0x17aa, 0x310c, "ThinkCentre Station", ALC294_FIXUP_LENOVO_MIC_LOCATION),
> 


-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
