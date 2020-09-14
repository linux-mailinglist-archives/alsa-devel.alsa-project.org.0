Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0722686E3
	for <lists+alsa-devel@lfdr.de>; Mon, 14 Sep 2020 10:11:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 30C951676;
	Mon, 14 Sep 2020 10:10:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 30C951676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600071104;
	bh=8YZbv0hHSYzZFJPeL8EMOOT+DqyMjDaIQGx8CAGT1gQ=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uOciFp+ZCEW46R48TOUyZdPYxkP5qkc//4eFDBSK3x1/FECNad1I4YvNdfMcpaoj/
	 RB0ezzmZyaBEaElU/7QRPqJBUMW1HXCkvNvTf3sQ+fhmxD8sPe0Q0K4oFgq6lWWptP
	 /Yh4LCxDc3QkCodFDzdx6e3qZbMLdMNv8Y/5R++Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0F348F800AA;
	Mon, 14 Sep 2020 10:07:37 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DC25F80304; Mon, 14 Sep 2020 10:07:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=1.0 required=5.0 tests=PRX_BODY_30, RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F342F802FF
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 10:07:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F342F802FF
Received: from mail-pg1-f200.google.com ([209.85.215.200])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kHjWJ-0002uK-Ot
 for alsa-devel@alsa-project.org; Mon, 14 Sep 2020 08:07:27 +0000
Received: by mail-pg1-f200.google.com with SMTP id l14so9017676pgm.6
 for <alsa-devel@alsa-project.org>; Mon, 14 Sep 2020 01:07:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=zo3pdzsKIkzlbj1WG0EnGKhILut8FQ3dpUKvkK6/2FM=;
 b=kVS7eP8qfEzlB3grFPSnAFVnHSEB7j30shKgQfe1H/dTm3NuXZM8gLqrts8vfUh0SW
 UyNE6xZ1dP669QjfPxsup3hRuLW2woXG5DxGPGfgd5EWzSOJfXCiq0sVQqEHGbOMrK61
 r2crYYavsE0W5jLox3cbriH2QG8A7WUfX5B/hnihNICPPiofuz3170TV8S/2Y3sfc9Tz
 G9Hb6DG1bv2GNwrxTYHjsMV2O8jPeapKueeFatn0ZukT/Oe5chMRjwgh6sk51/26gFf9
 IZH55vbYhLCxNa6ZHGlYEFfL5oLtIrbIt3du+pKDzlh6ccPMjx8+G7ZeLA4TCHHTDIGt
 sCDQ==
X-Gm-Message-State: AOAM5333hlwQVmU4m0rPI7mfOv0C9VA4IkHW/5DcaMeGJgKlWlxmcg2e
 fT4e4fHjZj67vjHfJ3yJuSuwERiP+VIf9aM/+awEW8DeKHc34ryA4U/5MK1N9K+euhH01Cp3xdL
 6mfMpeu8CV8KaIkrgwHM7sW+x3tpZJp1gk7cqin+v
X-Received: by 2002:aa7:9a41:: with SMTP id x1mr12261877pfj.138.1600070846345; 
 Mon, 14 Sep 2020 01:07:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeeibKrL/0ryrp1aCikm5u5wDocL8VqaZztsbEb5RFmxLASgOic7X43Z+dg7pTcx0XiOx9Kw==
X-Received: by 2002:aa7:9a41:: with SMTP id x1mr12261858pfj.138.1600070845958; 
 Mon, 14 Sep 2020 01:07:25 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id d8sm8169517pjs.47.2020.09.14.01.07.16
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 14 Sep 2020 01:07:18 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] ALSA: hda/realtek: Enable front panel headset LED on
 Lenovo ThinkStation P520
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <c4a9ed79-1c9d-8fbc-8c3b-eab191bd56bd@canonical.com>
Date: Mon, 14 Sep 2020 16:07:15 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <07CC762F-BA94-43C0-A8C8-5B3C43291F3E@canonical.com>
References: <20200914070231.13192-1-kai.heng.feng@canonical.com>
 <c4a9ed79-1c9d-8fbc-8c3b-eab191bd56bd@canonical.com>
To: Hui Wang <hui.wang@canonical.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, tiwai@suse.com,
 open list <linux-kernel@vger.kernel.org>, Thomas Hebb <tommyhebb@gmail.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>, Huacai Chen <chenhc@lemote.com>,
 =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
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

Hi Hui,

> On Sep 14, 2020, at 16:04, Hui Wang <hui.wang@canonical.com> wrote:
>=20
> Thanks Kaiheng, and we just had one P520 in the Beijing office and I =
also worked on this issue happenly. Does the led change according to =
jack plugging in or plugging out with your patch?

No, the LED won't reflect the jack plugging status.

The LED is always on under Windows, so we are doing the same here.

Kai-Heng

> I also prepared a patchset but my patchset has more code than yours, =
please take a look. :-)
>=20
> Thanks.
>=20
> Hui.
>=20
> On 2020/9/14 =E4=B8=8B=E5=8D=883:02, Kai-Heng Feng wrote:
>> On Lenovo P520, the front panel headset LED isn't lit up right now.
>>=20
>> Realtek states that the LED needs to be enabled by ALC233's GPIO2, so
>> let's do it accordingly to light the LED up.
>>=20
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>>  sound/pci/hda/patch_realtek.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>=20
>> diff --git a/sound/pci/hda/patch_realtek.c =
b/sound/pci/hda/patch_realtek.c
>> index c521a1f17096..ba941bd0b792 100644
>> --- a/sound/pci/hda/patch_realtek.c
>> +++ b/sound/pci/hda/patch_realtek.c
>> @@ -6017,6 +6017,7 @@ static void alc_fixup_thinkpad_acpi(struct =
hda_codec *codec,
>>  #include "hp_x360_helper.c"
>>    enum {
>> +	ALC269_FIXUP_GPIO2,
>>  	ALC269_FIXUP_SONY_VAIO,
>>  	ALC275_FIXUP_SONY_VAIO_GPIO2,
>>  	ALC269_FIXUP_DELL_M101Z,
>> @@ -6194,6 +6195,10 @@ enum {
>>  };
>>    static const struct hda_fixup alc269_fixups[] =3D {
>> +	[ALC269_FIXUP_GPIO2] =3D {
>> +		.type =3D HDA_FIXUP_FUNC,
>> +		.v.func =3D alc_fixup_gpio2,
>> +	},
>>  	[ALC269_FIXUP_SONY_VAIO] =3D {
>>  		.type =3D HDA_FIXUP_PINCTLS,
>>  		.v.pins =3D (const struct hda_pintbl[]) {
>> @@ -7013,6 +7018,8 @@ static const struct hda_fixup alc269_fixups[] =3D=
 {
>>  	[ALC233_FIXUP_LENOVO_MULTI_CODECS] =3D {
>>  		.type =3D HDA_FIXUP_FUNC,
>>  		.v.func =3D alc233_alc662_fixup_lenovo_dual_codecs,
>> +		.chained =3D true,
>> +		.chain_id =3D ALC269_FIXUP_GPIO2
>>  	},
>>  	[ALC233_FIXUP_ACER_HEADSET_MIC] =3D {
>>  		.type =3D HDA_FIXUP_VERBS,

