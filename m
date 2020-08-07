Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8292323E879
	for <lists+alsa-devel@lfdr.de>; Fri,  7 Aug 2020 10:03:17 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 328FD1612;
	Fri,  7 Aug 2020 10:02:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 328FD1612
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1596787397;
	bh=2L3bqAn+AiIL0BwAgVndUCBmp5K3agmXf/LNRECHzuM=;
	h=To:Subject:From:Date:Cc:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=rQ+/olK4erg79laeG7dM8OLYyC7Ij5FqWk09zfmlMd75SqiamxzC3DX3ZAOyShsib
	 hXJL48XgH3rpQgyHyVx/6mY5n+p+vDCcDQqLpNysvHirOUMrRaqC+WcC/y+32SLVpp
	 8gkeS+p/NmcxVme2qsgkDjrnBm2AeqVDs1EkKgAU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 16A75F800AB;
	Fri,  7 Aug 2020 10:01:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C8124F800AB; Fri,  7 Aug 2020 10:01:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_MSPIKE_H3, RCVD_IN_MSPIKE_WL,
 SPF_HELO_NONE, SPF_PASS autolearn=disabled version=3.4.0
Received: from mout.web.de (mout.web.de [212.227.17.11])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9F5B0F800AB
 for <alsa-devel@alsa-project.org>; Fri,  7 Aug 2020 10:01:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9F5B0F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=web.de header.i=@web.de header.b="aZzq7Olb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1596787277;
 bh=2L3bqAn+AiIL0BwAgVndUCBmp5K3agmXf/LNRECHzuM=;
 h=X-UI-Sender-Class:To:Cc:Subject:From:Date;
 b=aZzq7Olbi8Tqki4nutE1QPEOi7LFhVNq7eD0np6gyln+Lx5uYrU5zlm0EQLnToSHg
 yUpYxk4kwB6e5shgDyoh9J4fjzqbbsGYDI1TGhla9bNi0RxEduym6Qsk+/VsjgX0+W
 z6p07dN/bjq71Va2/I5zzvCauMEvYlKYyCpBLMNM=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([78.49.50.216]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0LwYwF-1kna3n3S6p-018LCk; Fri, 07
 Aug 2020 10:01:16 +0200
To: Dinghao Liu <dinghao.liu@zju.edu.cn>, alsa-devel@alsa-project.org
Subject: Re: [PATCH] ALSA: usb-audio: Fix memory leak in
 scarlett2_add_new_ctl()
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <43ed8c7b-b58d-34b8-aa55-f1a4d3b7d6e5@web.de>
Date: Fri, 7 Aug 2020 10:01:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:D34gxxJsAmHVrTvrBOGVw6hQ8AlTGTIc2qUYbDFB1CQVXjQH7tJ
 BOrWNz5ouas1Lwz5AWeFRGZrLVFLiJr+UeozIrfNZH33OFmE+B7Ys0VrdQXvqDUbNCO1xpn
 Xb91uVEiUW3rnUtarBkmtkNArfsQ5Sg+PQ7Tbl+OvWEFkdawAwaixFms1HWNuIOcdiiU2lM
 5+2ETTm8nqBBmkOz9WkGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4vOimggklIs=:RYv9hzoU9rQaQ6mrrD8DAH
 EQJJfMesbNeQVcFDsfSLckFvab4TI1U4f0XNTI3X7XoLA1RHNCWiDS75ezfJyK5AOdmDygupW
 oKl6E1g+tyfRlSs1LAMBuP1qn56IYP6BJ2JiU73woIPgk+THjjEzfbkYSypLn381FHuAkuj59
 iHLW6HsYLAG5sAjsk3EAl1TjM4vL/zUbG/N+mrq0SfSqxq9ZYhG5gXxv1eCBI1DVLxRE+XDK9
 mPmLkzgiGSUo5GxqUVXm6PuHBiyStCBeuGuUKl7ZjioN63GPLeDorbJiUwxRbQCwIX4QNFiI7
 wDMb/7lJJJBuQOZlz8Kk7JdP+L0WCtI5iAeJIcYOzTMYu+wJM7P1czW5vTghOYx0eMQUHCcf+
 BEvJOBLIxpsqiHd5cinO35XALQQxmsSRvFRBOZturpuuOZ5YyFon5dBa2KBg2m6QS+ZINCpvM
 21PACyAhd5sAb0d8aYQdctZlFRowpoU2m0GBm3iSQB2QobD96ixdNdwpSUHimqDLioXjVGRhC
 vl14DnjTgUcOgK+X7O5hB5VUq2jL+5Iz86AL9cSgtE5O5GIx/KiIkRrC0txf5lOQcpUH1jw8F
 ZvHpWLvaE5Fugq57/07qlfyNrLQtslg1H0/DQWIGelx5hjusjFh7DJVbfSr7WMtIArLmE+fHV
 qPu6OhYZn2pQMtND1zuErg5f670kdx2mZahjEH7J5QQ3/tw7gy3MHLEByuTI8FUtonnzRiA4K
 jQ5JnwXe0Cw7Civ2kpgn5mwEkSK50WszHX7bZ99tdZezvIvfR9cmQj/5IPUvREVnujQYTGk7O
 RnUfahqCSc1rYs/7GzizGtD6EuSYFlNRB85EMW47UWGK5J3JoA+VIhDc9TU6sNFtUsckV/snE
 aTHFAXM145lbRVuZ1vSvuknTcC0bdhLlPy2oND8bG2O6y+WnfgpEc3syUaIGKffPO+GnTb5Jt
 RJ76QknlX/SPymN1D5QiImHHbvXoTFbv/pikoBOij1qb/652smXBm80TwISjyVHsNJ0GGewCB
 IAifqil6Z9gPcnbCapHNeuVKwaIzIOfSOfG1qmGRtcZu822jp2vY0Zny0y/tb0EIuiF1Zu3fV
 JOOM+ScZh/3PeHFM1BFEH+6BUps4jUo8vWmAV5ChQt7Nav71rOjT2OSsP9utIE4uSmMIQzXLW
 W4i6DcxQFwN4Cb1zHJXdJbf5317vFJ+3jE5Y1XIr2Usdf7v0x8vHa1DcQUukDG2SFdtkRjQMl
 46wUhFk2tuugB+fo8QCx0Mz5nL5BJid90+6sH4w==
Cc: Kangjie Lu <kjlu@umn.edu>, "Geoffrey D. Bennett" <g@b4.vu>,
 kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>
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

> When snd_usb_mixer_add_control() fails, elem needs to be
> freed just like when snd_ctl_new1() fails. However, current
> code is returning directly and ends up leaking memory.

Can an imperative wording be preferred for the change description?


=E2=80=A6
> +++ b/sound/usb/mixer_scarlett_gen2.c
> @@ -964,8 +964,10 @@  static int scarlett2_add_new_ctl(struct usb_mixer_=
interface *mixer,
>  	strlcpy(kctl->id.name, name, sizeof(kctl->id.name));
>
>  	err =3D snd_usb_mixer_add_control(&elem->head, kctl);
> -	if (err < 0)
> +	if (err < 0) {
> +		kfree(elem);
>  		return err;
> +	}
=E2=80=A6

I propose to add a jump target so that a bit of common exception handling =
code
can be better reused in this function implementation.

Regards,
Markus
