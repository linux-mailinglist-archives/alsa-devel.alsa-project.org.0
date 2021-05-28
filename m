Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FAA0394867
	for <lists+alsa-devel@lfdr.de>; Fri, 28 May 2021 23:37:09 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 26E5D16D0;
	Fri, 28 May 2021 23:36:19 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 26E5D16D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1622237829;
	bh=A0JR53Zb85kAZGyRCdJqSKNiNvF5Xh5fiz/EPT/GRVQ=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=dBNdqV/2zJ34ubMuqC88hYDaXVHxNy9r2Td0ckXw4OWH4vFgylSVgIUHyMbZnq32o
	 8BcMJFxRTQNeGl+6C/2bGaPotSmTOl1M5Te6SCXJTgegP35ayOzGJlwPe8QlRmf9os
	 N8qQ02xPvm/4vazXbWv5xoxkdZVvkg6GM/bOE5Ek=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 9C167F804AD;
	Fri, 28 May 2021 23:35:40 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1BC07F804AC; Fri, 28 May 2021 23:35:39 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 6E999F804A9
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 23:35:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 6E999F804A9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="fZ5yqn2Y"
Received: by mail-pl1-x631.google.com with SMTP id t21so2240492plo.2
 for <alsa-devel@alsa-project.org>; Fri, 28 May 2021 14:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=2YkA7fLjY3cLNTZrZoMg+tz6Rk4BTUp/rSUL7Ndl/8s=;
 b=fZ5yqn2YhKrxVZktVwhVm0J1eY/RutLmr7wBj7aQ+WLu0GNTcgZi94m/tKFvgaLPup
 xGBksKBYc8IgV2iafrtsYU1Png3g1KLVnL+TKNJlbzVmH2Ud9UEvydaODRIFsz8bndm3
 VumFD7z47Hfiz5jBCAvniFoXL9zMzdvq56kgMdWI4hVS5huw21FXAbyT8tTkoz0QBNtZ
 3QRYZryFrrzv4qcJI8NM8bNrXb4ypllYsp0VWA16BkhFMuAY1SFbZF8vk9nhVGIEuu4J
 R/azOdylHKyCzwhCxVfLEvVYSJFeLZLmggOFdDuAi+DzTm4RHUi4mbqJ8prNohwiaew5
 26Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=2YkA7fLjY3cLNTZrZoMg+tz6Rk4BTUp/rSUL7Ndl/8s=;
 b=ATrNeyYsm+MNhDtIq1w+soMYs8AwnoahAnW1f5YmUG4+8gBAcgkM2XMMfOfoQj96dl
 YOk3gw+ZCVAPM8y2kAqOZJQdAxfH5WsGmYOUQpZWsCxPFM/AWBlgyb8EcAoa7sMYP/Y0
 Mn4xlAMiRGxaUgD0msg7oeHdhCybLgLox7cQmrehztOxSl3FvXUoaJIMCob50iDtjk+u
 Q2jyWqgbTr2oAFwYhoiT+RPQhupknmf6ty4n4Wh3otmzZS6rAcigtGNHzkyN1SKtgl+t
 g8CQEtFFF8Vik2QE8o1xBa/JxEKWTWCpmjEIQ1bzpo/jDvZdX6A4JiXdEsRS3CqAJ5gN
 CSVA==
X-Gm-Message-State: AOAM532wjqwU5Ae6SwbpfSxlhBX5cBtFILgY1k+FwEiYUKFAwqWggzQt
 zA2DihONy4cPoceyuDrpW/k=
X-Google-Smtp-Source: ABdhPJx1JXNdx4eBQJojKAiwmIPPtf9dYPZUez0myjwFx2+hnfyV0FBdy4Ojy3QmyeKt0PaZL6K+oA==
X-Received: by 2002:a17:90b:4a4a:: with SMTP id
 lb10mr6488583pjb.21.1622237726872; 
 Fri, 28 May 2021 14:35:26 -0700 (PDT)
Received: from [127.0.0.1] ([103.152.221.225])
 by smtp.gmail.com with ESMTPSA id e23sm5036020pfl.84.2021.05.28.14.35.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 May 2021 14:35:26 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] ALSA: control led: fix memory leak in snd_ctl_led_register
From: =?utf-8?B?5oWV5Yas5Lqu?= <mudongliangabcd@gmail.com>
In-Reply-To: <20210528140500.GS24442@kadam>
Date: Sat, 29 May 2021 05:35:22 +0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <A622EB84-DC4A-47A4-A828-CE6D25DC92EB@gmail.com>
References: <20210528131757.2269989-1-mudongliangabcd@gmail.com>
 <20210528133309.GR24442@kadam>
 <CAD-N9QVWcEJjoziA6HVoQiUueVaKqAJS5Et60zvCvuUE7e6=gg@mail.gmail.com>
 <20210528140500.GS24442@kadam>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Cc: syzbot+08a7d8b51ea048a74ffb@syzkaller.appspotmail.com,
 linux-kernel <linux-kernel@vger.kernel.org>, alsa-devel@alsa-project.org,
 tiwai@suse.com
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



> On May 28, 2021, at 10:05 PM, Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
>=20
> On Fri, May 28, 2021 at 09:50:49PM +0800, Dongliang Mu wrote:
>>=20
>> Can you please give some advise on how to fix this WARN issue?
>=20
> But it feels like it spoils the fun if I write the commit...  Anyway:

It=E2=80=99s fine. I am still in the learning process. It=E2=80=99s also =
good to learn experience by comparing your patch and my patch.

>=20
> regards,
> dan carpenter
>=20
> diff --git a/sound/core/control_led.c b/sound/core/control_led.c
> index 25f57c14f294..dd357abc1b58 100644
> --- a/sound/core/control_led.c
> +++ b/sound/core/control_led.c
> @@ -740,6 +740,7 @@ static int __init snd_ctl_led_init(void)
> 			for (; group > 0; group--) {
> 				led =3D &snd_ctl_leds[group - 1];
> 				device_del(&led->dev);
> +				device_put(&led->dev);
> 			}
> 			device_del(&snd_ctl_led_dev);
> 			return -ENOMEM;
> @@ -768,6 +769,7 @@ static void __exit snd_ctl_led_exit(void)
> 	for (group =3D 0; group < MAX_LED; group++) {
> 		led =3D &snd_ctl_leds[group];
> 		device_del(&led->dev);
> +		device_put(&led->dev);
> 	}
> 	device_del(&snd_ctl_led_dev);
> 	snd_ctl_led_clean(NULL);

Does this patch mean I should add device_put in the init and exit =
function other than snd_ctl_led_sysfs_remove? This will cause =
device_release bypass the release method checking?

