Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A37731B21F
	for <lists+alsa-devel@lfdr.de>; Sun, 14 Feb 2021 19:53:36 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B57101687;
	Sun, 14 Feb 2021 19:52:45 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B57101687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1613328815;
	bh=vdgNBJIWGl8nXmh4nOIxmlXyTih1KBviQExcHun7j80=;
	h=Subject:To:References:From:Date:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=NadstBZiWAP+LRkmJKhcAoe5xh8vupPSgKILc0jhZy/n4xZXSiTkraxE+LsbkOVMA
	 VAEMFSSRrYWuaUTkLiuUKMi4RgLHvYgD7DPtK2lvkMGaT1khVkKheO5VxC4ZBX+g5A
	 N482DdjY0AdExw5VlTOkeyKHOIdjJJZeXEPnc83A=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 041E5F800F0;
	Sun, 14 Feb 2021 19:52:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 23A1FF80155; Sun, 14 Feb 2021 19:52:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 10701F800B2
 for <alsa-devel@alsa-project.org>; Sun, 14 Feb 2021 19:51:52 +0100 (CET)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 5E495A0042;
 Sun, 14 Feb 2021 19:51:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 5E495A0042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1613328711; bh=cvdjkRHWFkzG1lLfAFQoWXRELwhjh9aZAgl/H1YhF18=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=shMZT7rji9g0Qza6xyS5aIMcHpz4YS2/4/dcUoAH3CcWxdJkioPpRZ7uUADD1y7XZ
 Pq1Zbh3YLDrArISiKbUvm5hyoUXCPA4h5NbzKv+U3a9wMFODe5bhs/B5Wn23KaPxY1
 qDn4xzoaUGOjpF3t6tQ8njru35ulewub33j2YS8w=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Sun, 14 Feb 2021 19:51:39 +0100 (CET)
Subject: Re: [PATCH v3 3/3] ASoC: rt715:add micmute led state control supports
To: Perry Yuan <perry979106@gmail.com>, Mark Brown <broonie@kernel.org>,
 Perry Yuan <Perry.Yuan@dell.com>
References: <20210112171814.5404-1-Perry_Yuan@Dell.com>
 <20210112175406.GF4646@sirena.org.uk>
 <43507ba7-74b8-2d18-57ca-271f89a752de@gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <4a79cb14-4c71-8bd8-9c8c-ab2421e97e0b@perex.cz>
Date: Sun, 14 Feb 2021 19:51:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <43507ba7-74b8-2d18-57ca-271f89a752de@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Cc: oder_chiou@realtek.com, alsa-devel@alsa-project.org, mgross@linux.intel.com,
 Mario.Limonciello@dell.com, linux-kernel@vger.kernel.org, tiwai@suse.com,
 lgirdwood@gmail.com, hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
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

Dne 14. 02. 21 v 7:43 Perry Yuan napsal(a):

>>> @@ -287,6 +291,18 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
>>>   			return err;
>>>   	}
>>>   
>>> +#if IS_ENABLED(CONFIG_DELL_PRIVACY)
>>> +	/* dell privacy LED trigger state changed by muted/unmute switch */
>>> +	if (mc->invert) {
>>> +		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1]) {
>>> +			rt715->micmute_led = LED_OFF;
>>> +		} else {
>>> +			rt715->micmute_led = LED_ON;
>>> +		}
>>> +		ledtrig_audio_set(LED_AUDIO_MICMUTE, rt715->micmute_led);
>>> +	}
>>> +#endif
>>> +

My question is, how do we know that the rt715 codec has connected internal
microphone to this input? I believe that this should be covered in the machine
specific code (runtime check), not in the codec code. #if CONFIG is not
sufficient here.

> I have moved this part code to the local definition of 
> rt715_set_amp_gain_put and removed from rt715_priv.
> new code will be like this in V4.
> 
> @@ -88,6 +89,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol 
> *kcontrol,
>                  RT715_SET_GAIN_MIX_ADC2_L};
>          unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
>          unsigned int read_ll, read_rl, i, j, loop_cnt;
> +       bool micmute_led;
> 

The whole LED trigger mechanism for the sound is covered in my LED generic
code : https://lore.kernel.org/alsa-devel/20210211111400.1131020-1-perex@perex.cz/

						Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
