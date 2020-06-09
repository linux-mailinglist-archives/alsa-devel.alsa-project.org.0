Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4090C1F3655
	for <lists+alsa-devel@lfdr.de>; Tue,  9 Jun 2020 10:49:06 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id CF81C167D;
	Tue,  9 Jun 2020 10:48:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz CF81C167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1591692545;
	bh=p9NdsQwuuqm4JYEzcebI7ce+1u0J+19lgndur3qrAJk=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=I2dlFbCLALa/bQQ8GIF6jJm7fbuzExu38+hIXS9uWPhFbPuhk32jsWMsNfLIf2TlX
	 Yw1dOLR2QCXibc7D/KYHRnQP7nq0K1bVfV19Ea703UUF2HbqVRvej+X1REpVQ/FxBj
	 Vk6p5iBiOw4t6TlfdbKHCuwNuFA0hYn8eOXnSx/M=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 6C9A3F80278;
	Tue,  9 Jun 2020 10:47:43 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id E24ECF80291; Tue,  9 Jun 2020 10:47:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DCAC9F80278
 for <alsa-devel@alsa-project.org>; Tue,  9 Jun 2020 10:47:34 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 90D0EA0040;
 Tue,  9 Jun 2020 10:47:33 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 90D0EA0040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1591692453; bh=k+ZVmPxEVYWRMAV/dpT+Wskt+q2PgEwMo5c1ouGbYAk=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=JBnzBn8zN9hLcM0czn4AOPTG2hS72DAm7NSTaEAi0jFC7OJkvMB55xqOgUVxGVLob
 X6z7mFUPzGfVdROKiUWMy4lotTSGUFugVjXi3+GYpIsnUjtWv5ANw42waWd4alhbqJ
 SmAc+iLGUcTSwxGg/8xg7DJJ5aH42nsPFifYkfiY=
Received: from p50.perex-int.cz (unknown [192.168.100.94])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Tue,  9 Jun 2020 10:47:31 +0200 (CEST)
Subject: Re: [PATCH alsa-lib] conf: USB-Audio: Add HP Thunderbolt Dock in the
 IEC958 blacklist
To: Kai-Heng Feng <kai.heng.feng@canonical.com>, alsa-devel@alsa-project.org
References: <20200608070923.11614-1-kai.heng.feng@canonical.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <daf0223e-6ec0-c59e-daa6-99341ffaf68d@perex.cz>
Date: Tue, 9 Jun 2020 10:47:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200608070923.11614-1-kai.heng.feng@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Dne 08. 06. 20 v 9:09 Kai-Heng Feng napsal(a):
> Both headset and speaker on HP Thunderbolt Dock don't support IEC958
> interface.
> 
> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> ---
>   src/conf/cards/USB-Audio.conf | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/src/conf/cards/USB-Audio.conf b/src/conf/cards/USB-Audio.conf
> index 735079e3..01664abf 100644
> --- a/src/conf/cards/USB-Audio.conf
> +++ b/src/conf/cards/USB-Audio.conf
> @@ -62,6 +62,8 @@ USB-Audio.pcm.iec958_device {
>   	"Scarlett 2i4 USB" 999
>   	"Sennheiser USB headset" 999
>   	"SWTOR Gaming Headset by Razer" 999
> +	"Thunderbolt Dock Audio Headset" 999
> +	"Thunderbolt Dock Audio Module" 999
>   	"USB Device 0x46d_0x821" 999
>   	"USB Device 0x46d_0x992" 999
>   	"WD15 Dock" 999
> 

Applied to the alsa-lib's repo. Thank you.

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
