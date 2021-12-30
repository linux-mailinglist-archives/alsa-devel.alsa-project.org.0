Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE8C481ABD
	for <lists+alsa-devel@lfdr.de>; Thu, 30 Dec 2021 09:29:29 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D33641754;
	Thu, 30 Dec 2021 09:28:38 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D33641754
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1640852968;
	bh=H6HeILvrUuZ+OXT2S9/oIod5ZSSfv+aK6EM6mba1B8s=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=t6UIr4GEln+1rfl9k1jWRZMLqIB6XaohIPcBnSwZc7U6uqhaJycPpjfc7OadZPqwb
	 GlwqjwhWOypXehhq4/+UEokYlRF+a2AQpsjD3ef6fMcEoxV7MDRAL+6RA3pc7p2Fn/
	 5439BFEQvj9mFL8VpllREL+CTod+eujFIQhfeA+E=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 3076CF80149;
	Thu, 30 Dec 2021 09:28:22 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 35C13F8012A; Thu, 30 Dec 2021 09:28:16 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF0BCF800EB
 for <alsa-devel@alsa-project.org>; Thu, 30 Dec 2021 09:28:07 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF0BCF800EB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="UYD1GfnW"
Received: by mail-ed1-x534.google.com with SMTP id z9so25430328edm.10
 for <alsa-devel@alsa-project.org>; Thu, 30 Dec 2021 00:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=5yvQhuYvXnvEeI7WZkUwrQY3AKPGSjoK0ne8pwJj6HY=;
 b=UYD1GfnWLkjCvwmL+tnTGmQj5QOSul2KartH/iRcaET8vhLQW6W8+EN2KCzmIKQsM9
 zidXGD7JQ3efyH9MuFGXZQt4tfyib+S0TINAkm2mtVbNVT9ZIrUKlQTS6oH4tYyqHz2i
 kdImc+VdV7c4E1Lutx1hHhV8WOzuRYjJ+M7FmjXw++7j+CaQsrkuR57kJe9D7qEyUxIv
 MUlIwcVHJFnHcmfL/weucff0A4P9nJfm0KVr9uUQcwAsPCjYULacDGGEbv8wVOOCJMTs
 QEwljsOjbAmPaqE4+fir+aukATd4Sn29TwMduPymeGo/D53OPp6lsPyDGI1Ubh5tWacR
 pDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=5yvQhuYvXnvEeI7WZkUwrQY3AKPGSjoK0ne8pwJj6HY=;
 b=WY1KZDX0pYFKfWIj5yx3CDBXdBfcqZ0C4F7DKWYMt1/hYKYYE1uXsDzQMP39LFlQOa
 ICBFS1nZGXchJI5kyNQim5a9qoypcUmrXzFO7Vf7SZQFt1aABz++bw4onvuOiOO7ongg
 cO7VzEeaSxgR7HdYQGfbfykef2cWvH51BWFti0NgPOCoz+PXFMuZSYnlQLlZciseDiTg
 iCCz3vfIurarrANGkWARkn5G9fv/W1CuOkSGY6XlAKDMf0yAwSTWyTQVVadNw56cJySL
 GPzYQEQ2zNhT9nHsSU5auMMyqg/YqVIqxRFSiVL0IZdWxRWh5G6m0DlgYksR5ufsYNTA
 CVGg==
X-Gm-Message-State: AOAM531racDJ8ylGo5RJIXX7OFvylTcENjABnziXERl59pNDpoZ8qYer
 pLWHOO1fsin6CglMzX3Ro2k=
X-Google-Smtp-Source: ABdhPJzBcx1zb3V8UlpY4BmblRlGHidVLyNI+mgCtzsRjsJ2AheSV34OyZSZLQhNExpX2n2bko8jyg==
X-Received: by 2002:a17:907:a089:: with SMTP id
 hu9mr24864474ejc.448.1640852885746; 
 Thu, 30 Dec 2021 00:28:05 -0800 (PST)
Received: from [172.16.30.20] ([91.135.9.67])
 by smtp.gmail.com with ESMTPSA id r3sm7484756ejr.79.2021.12.30.00.28.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 30 Dec 2021 00:28:05 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.7\))
Subject: Re: [RESEND] Amlogic DPCM audio card(s) speaker placement issue
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <3cd96113-3272-1efe-aa81-39de952d1e68@perex.cz>
Date: Thu, 30 Dec 2021 08:28:04 +0000
Content-Transfer-Encoding: quoted-printable
Message-Id: <FF1307EB-5133-441A-B221-D5361B6F0AB2@gmail.com>
References: <ECC56215-1E02-4735-82F3-B68E73F56CB4@gmail.com>
 <3cd96113-3272-1efe-aa81-39de952d1e68@perex.cz>
To: Jaroslav Kysela <perex@perex.cz>
X-Mailer: Apple Mail (2.3608.120.23.2.7)
Cc: Matthias Reichl <hias@horus.com>, alsa-devel@alsa-project.org,
 Jerome Brunet <jbrunet@baylibre.com>, linux-amlogic@lists.infradead.org
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


> On 26 Dec 2021, at 5:30 pm, Jaroslav Kysela <perex@perex.cz> wrote:
>=20
> On 26. 12. 21 12:43, Christian Hewitt wrote:
>=20
>> **** List of PLAYBACK Hardware Devices ****
>> card 0: LIBRETECHCC [LIBRETECH-CC], device 0: fe.dai-link-0 (*) []
>>  Subdevices: 1/1
>>  Subdevice #0: subdevice #0
>=20
>> numid=3D12,iface=3DPCM,name=3D'ELD',device=3D2
>> numid=3D11,iface=3DPCM,name=3D'IEC958 Playback Default',device=3D2
>> numid=3D10,iface=3DPCM,name=3D'IEC958 Playback Mask',device=3D2
>> numid=3D9,iface=3DPCM,name=3D'Playback Channel Map',device=3D2
>> =
https://github.com/torvalds/linux/blob/master/arch/arm64/boot/dts/amlogic/=
meson-gxl-s905x-libretech-cc.dts#L136-L188
>=20
> Have you tried to reorder the dai-link-# sections in DT? It appears to =
me that sound/soc/codecs/hdmi-codec.c / hdmi_codec_pcm_new() gets the =
internal PCM
> device rather than the exported PCM device for the user space.

I did a test reordering the nodes on the WP2 box like this:

        dai-link-0 {
                sound-dai =3D <&aiu AIU_HDMI CTRL_OUT>;

                codec-0 {
                        sound-dai =3D <&hdmi_tx>;
                };
        };

        dai-link-1 {
                sound-dai =3D <&aiu AIU_CPU CPU_I2S_FIFO>;
        };

        dai-link-2 {
                sound-dai =3D <&aiu AIU_CPU CPU_SPDIF_FIFO>;
        };

        dai-link-3 {
                sound-dai =3D <&aiu AIU_CPU CPU_I2S_ENCODER>;
                dai-format =3D "i2s";
                mclk-fs =3D <256>;

                codec-0 {
                        sound-dai =3D <&aiu AIU_HDMI CTRL_I2S>;
                };
        };

        dai-link-4 {
                sound-dai =3D <&aiu AIU_CPU CPU_SPDIF_ENCODER>;

                codec-0 {
                        sound-dai =3D <&spdif_dit>;
                };
        };

This gives output like:

WP2:~ # amixer controls
numid=3D5,iface=3DMIXER,name=3D'AIU HDMI CTRL SRC'
numid=3D6,iface=3DMIXER,name=3D'AIU SPDIF SRC SEL'
numid=3D4,iface=3DPCM,name=3D'ELD'
numid=3D3,iface=3DPCM,name=3D'IEC958 Playback Default'
numid=3D2,iface=3DPCM,name=3D'IEC958 Playback Mask'
numid=3D1,iface=3DPCM,name=3D'Playback Channel Map=E2=80=99

The =E2=80=9Cdevice=3D4=E2=80=9D is gone, but also gone is the default =
PCM device:

WP2:~ # aplay -L
null
    Discard all samples (playback) or generate zero samples (capture)
iec958:CARD=3DWETEKPLAY2,DEV=3D0
    WETEK-PLAY2,=20
    IEC958 (S/PDIF) Digital Audio Output

Assuming I did the changes above correctly? it looks like DAI order
matters and cannot be changed.

> If the DAI routing cannot be changed, then the hdmi-codec.c should be =
modified to export the correct device number for the user space:
>=20
> =
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/so=
und/soc/codecs/hdmi-codec.c?h=3Dv5.16-rc6#n805


That=E2=80=99s some way beyond my limited kernel skills, so I will need =
to
phone friends and ask the audience for assistance :)

Christian

