Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4BC24195E
	for <lists+alsa-devel@lfdr.de>; Tue, 11 Aug 2020 12:04:28 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C78D91612;
	Tue, 11 Aug 2020 12:03:37 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C78D91612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1597140267;
	bh=qpqyUHTL0kr+HFfJq8n69fkOpV9CzBMNKPMj8I9Sj04=;
	h=From:Subject:Date:References:To:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BJ+SOTLzSqmcIlIy6H7J0Il9eEEKoeCa5QdkKdlSjTlO0qf9RY8PXwwRPKrlZkrqT
	 dAgFuUuLwOubRH5umsqjKH0bXFgWtSZSy7tvvi/+9xPRqKa5nCVCGM0tNgVJ6/lCEL
	 TRHYrff9b51GHXhKNA3ATFV+OOn9ZEnxk41bl91Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A7587F802EA;
	Tue, 11 Aug 2020 12:01:11 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 27635F802E0; Tue, 11 Aug 2020 12:01:07 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_MSPIKE_H3,
 RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id AF860F800D3
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 12:01:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz AF860F800D3
Received: from mail-pg1-f197.google.com ([209.85.215.197])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <kai.heng.feng@canonical.com>) id 1k5R5X-0007a8-Jo
 for alsa-devel@alsa-project.org; Tue, 11 Aug 2020 10:00:59 +0000
Received: by mail-pg1-f197.google.com with SMTP id y10so5238408pgo.6
 for <alsa-devel@alsa-project.org>; Tue, 11 Aug 2020 03:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:date:references:to:in-reply-to:message-id;
 bh=EmSvbdkhL2SXG90NBvXjBvnK9sPo7tdZdBbcvlgSxGg=;
 b=nMXxbJbXn2J+1SbM+FY9DJ9YMvKLVeME/Ybo0VE5p6LeNeq7aHWuGd4b9X9p3gCIAq
 o0f1nx7+AkrK/f3j/qBmYpRKKY7yY1/7oUnJBmOt0uzyoXdUqhKdHx/ifEnIpM3bDLqF
 k9R1nqhHUGIncRXFXZ42vv+K51Gy4I+1QSmpLfY5Y6nfyPGPyK07IRN4znl6B/+a2jG1
 advcUNojlDCLxsy+miQrCqb2gqQnSFxBr5vq5k/1sgHvRUtAtIR0bjqpbjTDG+zUArYa
 5gdKRwtrpGSZhYora6+9+g1/B5ng83KdzAa8DCEPCu8zY1SUV9/KbNA/7oJ0eXJTwMdq
 MkxQ==
X-Gm-Message-State: AOAM533SmxZ/Cja2rxoYfnJPUV5giW0gEdb2lZ4l8imZml3faXY9XJJC
 l+WQfhUjIqEOCGOMDLBIshV25KklM3G6ACrh5XlsJCuB+fHOXM1pmI24lAdwE3LLTozBCyXgSTm
 GJqsgw++9vXOsNStjZA44lme9zNSnVmjNAHyQE7B8
X-Received: by 2002:a17:902:8a93:: with SMTP id
 p19mr196511plo.101.1597140058064; 
 Tue, 11 Aug 2020 03:00:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxU8UAj9Qu7J8a4PdyTpzcb14b3ui/nRec56M96xgongD6KEaKzri0c0DvYTvwgEkdQmXfgZQ==
X-Received: by 2002:a17:902:8a93:: with SMTP id
 p19mr196462plo.101.1597140057379; 
 Tue, 11 Aug 2020 03:00:57 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net.
 [220.133.187.190])
 by smtp.gmail.com with ESMTPSA id s185sm23434014pgc.18.2020.08.11.03.00.55
 for <alsa-devel@alsa-project.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 11 Aug 2020 03:00:56 -0700 (PDT)
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.1\))
Subject: Re: [PATCH] conf: USB-Audio: Disable IEC958 on Lenovo ThinkStation
 P620
Date: Tue, 11 Aug 2020 18:00:54 +0800
References: <20200803155745.18082-1-kai.heng.feng@canonical.com>
To: "moderated list:SOUND" <alsa-devel@alsa-project.org>
In-Reply-To: <20200803155745.18082-1-kai.heng.feng@canonical.com>
Message-Id: <7626CA68-F198-4654-BEDE-59E4DB0D9B48@canonical.com>
X-Mailer: Apple Mail (2.3608.120.23.2.1)
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

Hi,

> On Aug 3, 2020, at 23:57, Kai-Heng Feng <kai.heng.feng@canonical.com> =
wrote:
>=20
> Both USB audio cards on Lenovo ThinkStation P620 don't support IEC958,
> so disable IEC958 accordingly.
>=20
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>

Should I use GitHub instead of mailing list for any future alia-lib =
patch?

Kai-Heng

> ---
> src/conf/cards/USB-Audio.conf | 2 ++
> 1 file changed, 2 insertions(+)
>=20
> diff --git a/src/conf/cards/USB-Audio.conf =
b/src/conf/cards/USB-Audio.conf
> index 297629f3..9b64af3c 100644
> --- a/src/conf/cards/USB-Audio.conf
> +++ b/src/conf/cards/USB-Audio.conf
> @@ -63,6 +63,8 @@ USB-Audio.pcm.iec958_device {
> 	"Scarlett 2i4 USB" 999
> 	"Sennheiser USB headset" 999
> 	"SWTOR Gaming Headset by Razer" 999
> +	"ThinkStation P620 Main" 999
> +	"ThinkStation P620 Rear" 999
> 	"Thunderbolt Dock Audio Headset" 999
> 	"Thunderbolt Dock Audio Module" 999
> 	"USB Device 0x46d_0x821" 999
> --=20
> 2.17.1
>=20

