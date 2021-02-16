Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id A230131CE2A
	for <lists+alsa-devel@lfdr.de>; Tue, 16 Feb 2021 17:37:26 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 34F1715E0;
	Tue, 16 Feb 2021 17:36:36 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 34F1715E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613493446;
	bh=gss2BANqMBgAgasEbeb8A5u3pmWoGb/tqo4svkXDX5o=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kTntoBrcn29Yxh7XLq+nbCuqXG6Tr3xOB1KAeA4tKvAKrEQpWKf+K15ncr7V8Btb8
	 zwBEcD5E/TMHuwBCd8aQbVzxunLus63ljIPWExqmHQUPzaazh6llejaN7omtEKngqm
	 yjqK5wB7ap/lxh38UkfZow5rY6a9ytcyFbWlrVHM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 79609F8016E;
	Tue, 16 Feb 2021 17:35:55 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B35E4F8015A; Tue, 16 Feb 2021 17:35:52 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2BCE1F8014D
 for <alsa-devel@alsa-project.org>; Tue, 16 Feb 2021 17:35:45 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 7BD04A003F;
 Tue, 16 Feb 2021 17:35:39 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 7BD04A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1613493339; bh=5kZN+fC/iZuw+K0QJOiRSrsqWGpaODMMwM4izOsTRJQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=0hSBuMFqOCGzX3yXQHB+Om/bn8Aej3io5iF+q0T8P/jiI3muEjbkcAAra265OilHh
 MUUL6AX6G59Q6I24jwzwmQPlkFmsaTdMGU8i5EA2xb2OtXk3OGdW8Oz/fos2yJt88q
 HL4z7JCRNgDZ2UZRFxItqBpmuMk9sx3n5Njkl7zw=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue, 16 Feb 2021 17:35:32 +0100 (CET)
Subject: Re: [PATCH 2/4] ASoC: rt5670: Remove 'HP Playback Switch' control
To: Hans de Goede <hdegoede@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Oder Chiou <oder_chiou@realtek.com>
References: <20210215142118.308516-1-hdegoede@redhat.com>
 <20210215142118.308516-3-hdegoede@redhat.com>
 <d3eb3192-851b-3d18-269a-725d74256010@perex.cz>
 <294813c9-b417-a632-997d-0b81bad94dbe@redhat.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <871855cd-8e42-f28e-d15c-01fb8fe3444b@perex.cz>
Date: Tue, 16 Feb 2021 17:35:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <294813c9-b417-a632-997d-0b81bad94dbe@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: alsa-devel@alsa-project.org, Takashi Iwai <tiwai@suse.com>,
 Bard Liao <bard.liao@intel.com>
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

Dne 16. 02. 21 v 16:15 Hans de Goede napsal(a):
> Hi,
> 
> On 2/15/21 7:09 PM, Jaroslav Kysela wrote:
>> Dne 15. 02. 21 v 15:21 Hans de Goede napsal(a):
>>> The RT5670_L_MUTE_SFT and RT5670_R_MUTE_SFT bits (bits 15 and 7) of the
>>> RT5670_HP_VOL register are set / unset by the headphones deplop code
>>> run by rt5670_hp_event() on SND_SOC_DAPM_POST_PMU / SND_SOC_DAPM_PRE_PMD.
>>>
>>> So we should not also export a control to userspace which toggles these
>>> same bits.
>>
>> I think that it may be worth to preserve the full-mute functionality.
>> According the datasheet, the register 0x02 has volume range -46.5dB..12dB.
>> Even the lowest volume may produce an audible output.
>>
>> I would cache the mute switch value in rt5670_priv and update the
>> POST_PMU/PRE_PMD code to use this settings.
> 
> Yes that should work.
> 
> Note though that patch 4/4 adds a mute for the master volume control, even
> though I call it an "emulated" mute it is a full mute, it is just that
> we now have 2 switches, 1 mixer switch and 1 mute switch, which must
> both be true before we enable the path from the DAC through the mixer
> which sits directly behind the "DAC1 Playback Volume" control.
> 
> And we need that mute anyways because the speaker output does not
> have any volume control other then the master "DAC1 Playback Volume"
> which has the same issue of only going very soft and not going to
> a full mute.
> 
> So since we have a working mute in the master volume control, we don't
> really need one for the "HP Playback Volume" control. with that all said,
> your suggestion should work fine.
> 
> So the question is do we want to do as you suggest, or are we happy
> with just having the master mute ?

One hw mute per one hw output should be sufficient. Thank you for the explanation.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
