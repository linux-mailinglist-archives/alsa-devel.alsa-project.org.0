Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D98424A5AC
	for <lists+alsa-devel@lfdr.de>; Wed, 19 Aug 2020 20:12:25 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 6283F1735;
	Wed, 19 Aug 2020 20:11:34 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 6283F1735
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597860744;
	bh=a57lloWNztA4ITO8aMnY32hVGEx/sLlNINzW9Sd4WmY=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dx0jwyF5UbQXFp9w/kHMmHdKIsjsIzs8YlMo9JtnZCuUJZVnM9cuUn8HlY2DyFsAP
	 +g3eI+f9rP2RyDvw/znaEt0aNJFm2leTM11tTjigwgJ+Ng9iGYYiE7ufcNb+oTfnsB
	 wVTtucUvOgkFc/IDZw0XZIfuScMuvueSl2MkVQ9g=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 83DB7F80114;
	Wed, 19 Aug 2020 20:10:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id AC09CF80218; Wed, 19 Aug 2020 20:10:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 375CBF80114
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 20:10:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 375CBF80114
Received: from mail-pl1-f199.google.com ([209.85.214.199])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1k8SXg-0001oh-7g
 for alsa-devel@alsa-project.org; Wed, 19 Aug 2020 18:10:32 +0000
Received: by mail-pl1-f199.google.com with SMTP id h6so14775948plt.0
 for <alsa-devel@alsa-project.org>; Wed, 19 Aug 2020 11:10:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Je8zHXL3E4yI3+Q3331hn6P+qZfrANUnxzzTV6g5u4c=;
 b=B/TrHeiJ3fstiruBI5QxBUnEK3oeUUgNgpBtxpUAUMHIdGeRbPNePi5O6zmoaqRWux
 tkoW76xjNweMtfwxT+Aq3OxOHQmfCQTpENAsjaEFlvcYSZoIyT4pGlf7p8U36K1lKmyD
 lCak0fEG3IPlWRb8v26nJwjY1+oNolmDzwUzGdx0A5lh049/W8YOHgcmF34M7kjUBdFb
 wUjHZHf1kkA9VV741fot6jPb4u4LlURKMod8bRzWD9EDlck+iSLlBgU18g0Pee5HyWN6
 yrat/vuge/20BknSMjT5t+n5I6MuBgkW/ZfqNygFhTaGiPCpi9n/CmIhDWk8LegazrMQ
 DEWg==
X-Gm-Message-State: AOAM530SN8ZsNB9AiZqxzkDZIv6vPqb/maGRYlbWn1HebIBfVPGyZaaG
 Voms/QPz1BllttNlmWd0MSWs3sjI6fpS3wdWJHRIPYP093tcDr5sELqEgBFXqEPbexi0Nful3VS
 wQztdAYjFLEHidDh9XJhBYgiqlSJdwnv1UoExlYsd
X-Received: by 2002:a63:488:: with SMTP id 130mr10710388pge.92.1597860630872; 
 Wed, 19 Aug 2020 11:10:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzNb0fJeDpP/4/q3CDkMRjmU/MuofXu2/pplo0TwUEaQDklB48zes+bU2n69VEPG+Or0isYQ==
X-Received: by 2002:a63:488:: with SMTP id 130mr10710353pge.92.1597860630372; 
 Wed, 19 Aug 2020 11:10:30 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id m4sm28353445pfh.129.2020.08.19.11.10.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Aug 2020 11:10:29 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] ALSA: usb-audio: Add prevent wakeup from s3 state trig by
 Lenovo ThinkCentre TI024Gen3 USB-audio
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5h364ih7vd.wl-tiwai@suse.de>
Date: Thu, 20 Aug 2020 02:10:25 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <74B3A9AD-8B49-4E5F-BE9F-BF88865304B7@canonical.com>
References: <20200819115757.23168-1-penghao@uniontech.com>
 <s5h364ih7vd.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 penghao <penghao@uniontech.com>, linux-kernel@vger.kernel.org,
 crwulff@gmail.com, gustavoars@kernel.org, Hui Wang <hui.wang@canonical.com>,
 alexander@tsoy.me, Mark Pearson <mpearson@lenovo.com>,
 dan.carpenter@oracle.com
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



> On Aug 20, 2020, at 01:18, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> [ Adding a few more relevant people to Cc. ]
>=20
> On Wed, 19 Aug 2020 13:57:57 +0200,
> penghao wrote:
>>=20
>> TI024Gen3 USB-audio is controlled by TI024Gen3,when TI024Gens
>> enter sleep mode, USB-audio will disconnect from USB bus port,
>> wakup form s3 state
>>=20
>> Signed-off-by: penghao <penghao@uniontech.com>
>> ---
>> sound/usb/card.c | 6 ++++++
>> 1 file changed, 6 insertions(+)
>>=20
>> diff --git a/sound/usb/card.c b/sound/usb/card.c
>> index 696e788c5d31..6bdbb34009b3 100644
>> --- a/sound/usb/card.c
>> +++ b/sound/usb/card.c
>> @@ -658,6 +658,12 @@ static int usb_audio_probe(struct usb_interface =
*intf,
>> 	}
>>=20
>> 	dev_set_drvdata(&dev->dev, chip);
>> +	/*
>> +	 *ALSA: usb-audio: Add prevent wakeup from s3 state trig by =
Lenovo
>> +	 *ThinkCentre TI024Gen3 usb-audio
>> +	 */
>> +	if ((usb_id->idVendor =3D=3D 0x17ef) && (usb_id->idProduct =3D=3D =
0xa012))
>> +		device_set_wakeup_enable(=EF=BC=86dev->dev, 0);
>=20
> Here it's no proper ASCII letter, and this must be broken.
> Please check the actual patch before submitting.
>=20
> In anyway, before going further, I'd like to hear from other people
> whether this is really mandatory and appropriate.  And whether it's
> specific to that device, too (not other Lenovo devices?)

If USB remote wakeup on this device is broken then we need to fix it in =
USB core instead of USB audio.
We need USB and xHCI logs to understand the real problem here, the =
commit message doesn't contain enough information.

Kai-Heng

>=20
>=20
> thanks,
>=20
> Takashi

