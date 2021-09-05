Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B93B400DD5
	for <lists+alsa-devel@lfdr.de>; Sun,  5 Sep 2021 05:09:18 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EFD44187A;
	Sun,  5 Sep 2021 05:08:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EFD44187A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1630811356;
	bh=AIXJ4/MxTO5EUx/rComJPXc+5bcCNVGDILhvxv/l9PE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n5crQDB4CD8uMcJR0apNZwVedqqHEklvF+FENJAUqO4Iim72Vgpf8gzfIG44GJn6Z
	 VUIArkTC4g+MLQe+hT66FMsAsqYML+I23JSi21qQoLXF9pjLOc137TBHsw/Hu2mUU8
	 d2/43CjmohMSz0PL8LkQpZSiyOm2NdGRbDRXzLLU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id B3D8DF802A9;
	Sun,  5 Sep 2021 05:07:58 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id CB8EBF80253; Sun,  5 Sep 2021 05:07:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE, PRX_BODYSUB_1, SPF_HELO_NONE,
 SPF_NONE, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qk1-x730.google.com (mail-qk1-x730.google.com
 [IPv6:2607:f8b0:4864:20::730])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9FC32F800B5
 for <alsa-devel@alsa-project.org>; Sun,  5 Sep 2021 05:07:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9FC32F800B5
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="OiFF0GeT"
Received: by mail-qk1-x730.google.com with SMTP id bk29so3393675qkb.8
 for <alsa-devel@alsa-project.org>; Sat, 04 Sep 2021 20:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=M40TES1R1/IdM3HWUt+rWVasZGZCIH9BInscr8qqlv8=;
 b=OiFF0GeTLvS1Eyd8qNlg6N29Wqf1Fnj4m2r7CS1BtBPHb4QPAc7F3HwoTYFTuf0SSy
 c+FzQNN4N3OU8sEAFUMHK57ns3C7UTcXYHaurpbCpgLsRe89VkxYist3yO0VLtiOwjMA
 QQQj5ejzxY39LiaO5elT14wWGi+iVXPOhHVpgdSS5G6aQkZtWbF2911VB0xuXdsk50ou
 gC2ODRRgSLi9UB7zaO87gnOM4/JqiKaYOlCXd+8ft8iQob2kJ8Pxn9WTVvUg7aKxvm7e
 wlx6Tp6MoIDCCC4jSaRK5QfDybPk5TwDmdTmcJmrjaWkg0yoIRXCNlGuHJR5vSKGgbb1
 fcCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=M40TES1R1/IdM3HWUt+rWVasZGZCIH9BInscr8qqlv8=;
 b=B31ENCxXr1RHKfpqwx2JNbrp9OAQd/76UM3ZMT1rel9/nDuREQH/L1VhBp7Rbczq/W
 OX7j2/GI09SzglCVbd8W6nb31l6gqMT64HL8J761WU/QgzQ7muVOwmjPT9/dNPuOYniR
 /CVX0M8u/WVlSDOgi31SBENjKsftWeYhN5cgJxXXVjNl+22biiV2l8XAwPZst0VOIzr3
 Ft2NkoOMcELO6GhxEjYsHfbDFhXdBacqBRXInUCdPgmKD6iuE6Qoyx0aeEqdLo7vPZAs
 QK8WOEDJgKiv92WSg1lvnqimemA25r+I5QHllKpAQpvSyB3wh5ClptmitOZc4LGsYG2F
 4j1A==
X-Gm-Message-State: AOAM5328aNTW/QhQoNclkddDpx26g1GHTo7WL983KdYyb/tzZX4YRoLn
 isB6ufH3TLDkjSnu+mRN6aQklVvXwnbVwZBQ3LM=
X-Google-Smtp-Source: ABdhPJyLYs41Qz5w2BYomZYltBInn73NLxRrUT7ajrLLwH48SRBGIon3YXyvcmQIjCTxRPVb8I6YHR2miFS/eEgnt3s=
X-Received: by 2002:a05:620a:254c:: with SMTP id
 s12mr5538219qko.112.1630811263287; 
 Sat, 04 Sep 2021 20:07:43 -0700 (PDT)
MIME-Version: 1.0
References: <333881630574354@mail.yandex.ru>
 <CAEsQvcuqkff--CgGDa8j0=GWgqMAx09ooo3zRCmGK8drxXGpMA@mail.gmail.com>
 <676251630705379@mail.yandex.ru>
 <CAEsQvcuJyspDVoSApUYRsfSiyXG0DHwbdJWSuj6WeEoUCxCN-A@mail.gmail.com>
In-Reply-To: <CAEsQvcuJyspDVoSApUYRsfSiyXG0DHwbdJWSuj6WeEoUCxCN-A@mail.gmail.com>
From: Geraldo Nascimento <geraldogabriel@gmail.com>
Date: Sun, 5 Sep 2021 00:11:54 -0300
Message-ID: <CAEsQvcvDA5UMNm4MBzq9ZUBX-8WjRy4t0SXghJSGSjNW2Rk=rA@mail.gmail.com>
Subject: Re: No sound after kernel 5.8.15-301
To: =?UTF-8?B?0KHRg9GA0LrQvtCyINCf0LDQstC10Ls=?= <surpaul@yandex.ru>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Cc: alsa-devel@alsa-project.org
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

Pavel, please note that if your issue is related to PipeWire you'll have to
disable PipeWire with systemctl to test directly with ALSA, at least as far
as I'm aware.

Em S=C3=A1b, 4 de set de 2021 23:03, Geraldo Nascimento <geraldogabriel@gma=
il.com>
escreveu:

> Em Sex, 3 de set de 2021 18:49, =D0=A1=D1=83=D1=80=D0=BA=D0=BE=D0=B2 =D0=
=9F=D0=B0=D0=B2=D0=B5=D0=BB <surpaul@yandex.ru> escreveu:
>
>>
>>
>> $ aplay Enable.wav
>> Playing WAVE 'file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
>> 48000 Hz, Stereo
>>
>> $ pasuspender -- aplay Enable.wav
>> Playing WAVE 'file.wav' : Signed 24 bit Little Endian in 3bytes, Rate
>> 48000 Hz, Stereo
>>
>> In the first case, the music plays, and in the second, it doesn't.
>>
>
> Hi Pavel,
>
> When you say the music plays do you mean to say it plays through HDMI or
> does it play through the speakers?
>
> $ aplay -l / $ pasuspender -- aplay -l
>> **** List of PLAYBACK Hardware Devices ****
>> card 0: PCH [HDA Intel PCH], device 0: ALC256 Analog [ALC256 Analog]
>>   Subdevices: 1/1
>>   Subdevice #0: subdevice #0
>> card 0: PCH [HDA Intel PCH], device 3: HDMI 0 [HDMI 0]
>>   Subdevices: 1/1
>>   Subdevice #0: subdevice #0
>> card 0: PCH [HDA Intel PCH], device 7: HDMI 1 [HDMI 1]
>>   Subdevices: 1/1
>>   Subdevice #0: subdevice #0
>> card 0: PCH [HDA Intel PCH], device 8: HDMI 2 [HDMI 2]
>>   Subdevices: 1/1
>>   Subdevice #0: subdevice #0
>> card 0: PCH [HDA Intel PCH], device 9: HDMI 3 [HDMI 3]
>>   Subdevices: 1/1
>>   Subdevice #0: subdevice #0
>> card 0: PCH [HDA Intel PCH], device 10: HDMI 4 [HDMI 4]
>>   Subdevices: 1/1
>>   Subdevice #0: subdevice #0
>>
>> In dmesg, I did not find anything interesting, except for this. Should
>> there be front headphone and speakers or just front headphone?
>>
>> $ sudo dmesg | rg HDA
>> [    3.190288] input: HDA Intel PCH Front Headphone as
>> /devices/pci0000:00/0000:00:1f.3/sound/card0/input18
>> [    3.190322] input: HDA Intel PCH HDMI/DP,pcm=3D3 as
>> /devices/pci0000:00/0000:00:1f.3/sound/card0/input19
>> [    3.190355] input: HDA Intel PCH HDMI/DP,pcm=3D7 as
>> /devices/pci0000:00/0000:00:1f.3/sound/card0/input20
>> [    3.190413] input: HDA Intel PCH HDMI/DP,pcm=3D8 as
>> /devices/pci0000:00/0000:00:1f.3/sound/card0/input21
>> [    3.190472] input: HDA Intel PCH HDMI/DP,pcm=3D9 as
>> /devices/pci0000:00/0000:00:1f.3/sound/card0/input22
>> [    3.190501] input: HDA Intel PCH HDMI/DP,pcm=3D10 as
>> /devices/pci0000:00/0000:00:1f.3/sound/card0/input23
>>
>>
>>
>
> I have an Intel laptop with integrated ALC233 for example. Im my dmesg I
> see the following log:
>
> [19.955428] snd_hda_codec_realtek hdaudioC0D0: speaker_outs=3D0
> (0x0/0x0/0x0/0x0/0x0)
>
> I believe you should see something similar. Please check dmesg of both
> good working kernel and bad non-working kernel.
>
> Thanks,
> Geraldo Nascimento
>
> 02.09.2021, 23:06, "Geraldo Nascimento" <geraldogabriel@gmail.com>:
>>
>> Hi, Pavel,
>>
>> Standard advice is to try aplay ALSA command while suspending
>> PulseAudio/PipeWire.
>>
>> Also please check your dmesg log for anything strange.
>>
>> Thank you,
>> Geraldo Nascimento
>>
>> Em Qui, 2 de set de 2021 12:23, =D0=A1=D1=83=D1=80=D0=BA=D0=BE=D0=B2 =D0=
=9F=D0=B0=D0=B2=D0=B5=D0=BB <surpaul@yandex.ru>
>> escreveu:
>>
>>    Hello!
>>
>>    =C3=82
>>
>>    I lost sound from laptop speakers after updating the kernel. Sound vi=
a
>>    HDMI, AUX or Bluetooth works. Details on the links:
>>    [1]https://bbs.archlinux.org/viewtopic.php?id=3D269301
>>    [2]
>> https://ask.fedoraproject.org/t/no-sound-after-kernel-5-8-15-301/164
>>    41
>>    =C3=82
>>    Help me please.
>>
>>    --=C3=82
>>
>>    Pavel Surkov
>>
>>    =C3=82
>>
>> References
>>
>>    1. https://bbs.archlinux.org/viewtopic.php?id=3D269301
>>    2.
>> https://ask.fedoraproject.org/t/no-sound-after-kernel-5-8-15-301/16441
>>
>>
>>
>> --
>> Pavel Surkov
>>
>>
>
