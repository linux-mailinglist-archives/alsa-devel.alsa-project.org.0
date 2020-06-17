Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7E81FD0E4
	for <lists+alsa-devel@lfdr.de>; Wed, 17 Jun 2020 17:27:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 9BCEC166E;
	Wed, 17 Jun 2020 17:26:26 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 9BCEC166E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1592407636;
	bh=yQkK2NFQfNI0NJPeFv5hrqH6HhPyg6J6dLg8Whg1m4M=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=HUU9Tf6tx5tu4IIt76f2y6AhFdRGdHPPRWQHaWNjydjQCbQ0CWFuojfrnUnxEUXOA
	 d6I/XWFqRHx/QXe3RDm9hs8BgRU+ZTky5ePlRjyr34zIPRdgXp07b8EBYyCsXRGHJX
	 ocHAFl4TiHvXQnfZptwan6DF9qIEe37cln9RdPHk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id D687DF8028F;
	Wed, 17 Jun 2020 17:25:24 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9C16EF802A2; Wed, 17 Jun 2020 17:25:22 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 50F21F8028F
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 17:25:16 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 50F21F8028F
Received: from mail-pg1-f197.google.com ([209.85.215.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1jlZwB-0001eK-Cr
 for alsa-devel@alsa-project.org; Wed, 17 Jun 2020 15:25:15 +0000
Received: by mail-pg1-f197.google.com with SMTP id f15so1902333pgg.5
 for <alsa-devel@alsa-project.org>; Wed, 17 Jun 2020 08:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=qyyiMmv9qYUSuKaCbblPmkDJA2AJx3BvYMLY89xY8b4=;
 b=gc43d/a+Qw3+r0t8ZTKC+m7w3iOSVh2gTjAfF3FDCGgX7slx9adn3u3d2UdKYIuBCk
 IsxWskQYjZj3OedKHE2a64pc1MY1t6r9mLXIwKpKNCnGnfn8evMxWT4wlP0km756Jqnk
 n4/6U1yqpWjLYG2iZH8Xx5GtXP+dn2S3hQV21QKFgweWicAMPDeTnF4RmDCAmaK2PPiS
 06hDNfTMizfQPtzUXZmp/BwMlB9+h46fZfwQvdaHHTKSkyFTzDnNuPPdxVZQpSXpv2Kr
 6ucMXfvSZB1GhGZHSDkw731/kBXSbZZMOe67XSdelwJpczy1oQMXJwikmp+v2CGVdWnN
 PQRQ==
X-Gm-Message-State: AOAM532zzbIeCkswTjKsEBGNRgrLwIcH6ev838CfS8KWMgWsuOkIlxoi
 IrJX8XPvmmMchSCQ/86wJUpMWWgX9NxC7i5kHptbsjptlKAlNJ56nJkr4n2lxsSwK2pRMmbNaTy
 OohHK+bSFWw2+dINqq99q6VpkI8Z/1bYqoxAYSyWX
X-Received: by 2002:a65:594b:: with SMTP id g11mr365402pgu.168.1592407514026; 
 Wed, 17 Jun 2020 08:25:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyAnJqzykyq6Qh4y8k+2SiK49GevfzYs41NQ2z60sL/wWRIIaLoTPE/TH4irNzfB/JqLYESQ==
X-Received: by 2002:a65:594b:: with SMTP id g11mr365379pgu.168.1592407513540; 
 Wed, 17 Jun 2020 08:25:13 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id l3sm203953pgm.59.2020.06.17.08.25.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Jun 2020 08:25:13 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: [PATCH v3 2/2] ALSA: hda/realtek: Add mute LED and micmute LED
 support for HP systems
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hbllhzz2m.wl-tiwai@suse.de>
Date: Wed, 17 Jun 2020 23:25:10 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <486196C0-891B-47BA-8A5A-A9B65D27E7E5@canonical.com>
References: <20200617102906.16156-1-kai.heng.feng@canonical.com>
 <20200617102906.16156-2-kai.heng.feng@canonical.com>
 <s5hbllhzz2m.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Kailang Yang <kailang@realtek.com>, Tomas Espeleta <tomas.espeleta@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, tiwai@suse.com,
 Hui Wang <hui.wang@canonical.com>, Thomas Hebb <tommyhebb@gmail.com>,
 Jian-Hong Pan <jian-hong@endlessm.com>,
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



> On Jun 17, 2020, at 19:55, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Wed, 17 Jun 2020 12:29:02 +0200,
> Kai-Heng Feng wrote:
>>=20
>> There are two more HP systems control mute LED from HDA codec and =
need
>> to expose micmute led class so SoF can control micmute LED.
>>=20
>> Add quirks to support them.
>>=20
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>=20
> I guess this can be applied independently from the patch#1?
> If so, I'll queue this for for-linus branch.

Yes please. Thanks!

Kai-Heng

>=20
>=20
> thanks,
>=20
> Takashi
>=20
>=20
>> ---
>> v3:
>> - No change.
>> v2:
>> - Wording.
>>=20
>> sound/pci/hda/patch_realtek.c | 2 ++
>> 1 file changed, 2 insertions(+)
>>=20
>> diff --git a/sound/pci/hda/patch_realtek.c =
b/sound/pci/hda/patch_realtek.c
>> index 0587d1e96b19..cd1a3619806a 100644
>> --- a/sound/pci/hda/patch_realtek.c
>> +++ b/sound/pci/hda/patch_realtek.c
>> @@ -7473,6 +7473,8 @@ static const struct snd_pci_quirk =
alc269_fixup_tbl[] =3D {
>> 	SND_PCI_QUIRK(0x103c, 0x83b9, "HP Spectre x360", =
ALC269_FIXUP_HP_MUTE_LED_MIC3),
>> 	SND_PCI_QUIRK(0x103c, 0x8497, "HP Envy x360", =
ALC269_FIXUP_HP_MUTE_LED_MIC3),
>> 	SND_PCI_QUIRK(0x103c, 0x84e7, "HP Pavilion 15", =
ALC269_FIXUP_HP_MUTE_LED_MIC3),
>> +	SND_PCI_QUIRK(0x103c, 0x869d, "HP", ALC236_FIXUP_HP_MUTE_LED),
>> +	SND_PCI_QUIRK(0x103c, 0x8729, "HP", ALC285_FIXUP_HP_GPIO_LED),
>> 	SND_PCI_QUIRK(0x103c, 0x8736, "HP", ALC285_FIXUP_HP_GPIO_LED),
>> 	SND_PCI_QUIRK(0x103c, 0x877a, "HP", ALC285_FIXUP_HP_MUTE_LED),
>> 	SND_PCI_QUIRK(0x103c, 0x877d, "HP", ALC236_FIXUP_HP_MUTE_LED),
>> --=20
>> 2.17.1
>>=20

