Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8761B27450E
	for <lists+alsa-devel@lfdr.de>; Tue, 22 Sep 2020 17:15:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 116471728;
	Tue, 22 Sep 2020 17:14:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 116471728
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600787709;
	bh=VOni7kqcFyiyxhmaD5FiHsq83ZqCoOUjSYL28JOcapo=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ixdwDre3dciz7zG+bokGkDGUoCgHGgzVlmtNR2jhCPuJlEIbyIGSO9h/hSMBa6pt/
	 VhIHFVFmpBNSrcHh9MCWN2ZGR++pOWtxc4DjIRQNaPGWaey18YrrXYbVsAvBg4JTa/
	 xlc21S7g5wD8JZ201Y3wxTstDuGJ6OsH9bZORC4Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 269C6F80234;
	Tue, 22 Sep 2020 17:13:28 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 92D5CF8010A; Tue, 22 Sep 2020 17:13:25 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 7C71EF8010A
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 17:13:14 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 7C71EF8010A
Received: from mail-pj1-f72.google.com ([209.85.216.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1kKjyh-0002cG-HM
 for alsa-devel@alsa-project.org; Tue, 22 Sep 2020 15:13:11 +0000
Received: by mail-pj1-f72.google.com with SMTP id i23so2351280pju.7
 for <alsa-devel@alsa-project.org>; Tue, 22 Sep 2020 08:13:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=BSQ4bIjbcJDcJHLvA5qILAa+y6sr+Z4P/Y/Y2pdWQ/g=;
 b=kPJVVQCPboXLj2QspxXe5Ph6FHC9H8yLNQrLtP9On9ETRJZm/OZyiqNSqBp+7wPTJn
 HGHprKPBvyNeuAtgLyDFgxiWNkMDN0c2RNusicl3/8J+dbiZEiWRLzNxyohE7XdnncS8
 u2RSiYMOx43z7O8m0yd6uxCaVvTEocRJka3E+wgywnbt48XmPECDh7sHaMTvjmqx9Kpn
 p1zu9p9A+SMS8Ycw/2kh0CJUVMXFz4apNiyFUFFL+M8M3Pqfq730JcpB1IWIHE1HLJlU
 ZhqAQioa2WwN4VbgXma3GMjCVAENf6pch+jMMcLDe/3xMGgKFS8JSsABjC7PfVNCGyTt
 5nZg==
X-Gm-Message-State: AOAM533EUbgw/CMyXdWwYXLCdOuu8QIi73R3sQY+D6fhYI37bGo30mdj
 NZdx5PIkzfadV+4IGCKotzyRmpH04n5PbS9KC5AOd+tfMSobS13mQG7SgXnlcu6mlJkopfEid0K
 CIoyIt6nw41ONjV4KyKK8uO7Np/b6Lh3MzeN7DPY7
X-Received: by 2002:a17:90b:33cb:: with SMTP id
 lk11mr4158372pjb.98.1600787589325; 
 Tue, 22 Sep 2020 08:13:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy06QZEsty6qUF/pd/barVDXCqGXHP/EBpcUfPdxZyoSpkJZtz7BMniX0+B563RJE9cSkl23Q==
X-Received: by 2002:a17:90b:33cb:: with SMTP id
 lk11mr4158339pjb.98.1600787588975; 
 Tue, 22 Sep 2020 08:13:08 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id g192sm15431457pfb.168.2020.09.22.08.13.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 08:13:08 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] Revert "ALSA: usb-audio: Disable Lenovo P620 Rear line-in
 volume control"
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <s5hsgbbplok.wl-tiwai@suse.de>
Date: Tue, 22 Sep 2020 23:13:05 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <A3819F83-2574-4BE4-824B-7464776D865E@canonical.com>
References: <20200915103925.12777-1-kai.heng.feng@canonical.com>
 <s5hsgbbplok.wl-tiwai@suse.de>
To: Takashi Iwai <tiwai@suse.de>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Andrew Oakley <andrew@adoakley.name>, open list <linux-kernel@vger.kernel.org>,
 Chris Boyle <chris@boyle.name>, tiwai@suse.com,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>
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


> On Sep 21, 2020, at 16:40, Takashi Iwai <tiwai@suse.de> wrote:
>=20
> On Tue, 15 Sep 2020 12:39:23 +0200,
> Kai-Heng Feng wrote:
>>=20
>> This reverts commit 34dedd2a83b241ba6aeb290260313c65dc58660e.
>>=20
>> According to Realtek, volume FU works for line-in.
>>=20
>> I can confirm volume control works after device firmware is updated.
>=20
> A slight concern is what happens if you apply this change to the
> device before the firmware update.

The desktop that equips with the USB audio device hasn't released to the =
market yet, so I am not really worried about this.

>=20
> Also, after this revert, does the mixer control appear properly?

Yes it does.

Kai-Heng

>=20
>=20
> thanks,
>=20
> Takashi
>=20
>>=20
>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>> ---
>> sound/usb/mixer_maps.c | 1 -
>> 1 file changed, 1 deletion(-)
>>=20
>> diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
>> index 5b43e9e40e49..c369c81e74c4 100644
>> --- a/sound/usb/mixer_maps.c
>> +++ b/sound/usb/mixer_maps.c
>> @@ -371,7 +371,6 @@ static const struct usbmix_name_map =
asus_rog_map[] =3D {
>> };
>>=20
>> static const struct usbmix_name_map lenovo_p620_rear_map[] =3D {
>> -	{ 19, NULL, 2 }, /* FU, Volume */
>> 	{ 19, NULL, 12 }, /* FU, Input Gain Pad */
>> 	{}
>> };
>> --=20
>> 2.17.1
>>=20

