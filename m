Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 973263E91D9
	for <lists+alsa-devel@lfdr.de>; Wed, 11 Aug 2021 14:48:10 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 20EED176B;
	Wed, 11 Aug 2021 14:47:20 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 20EED176B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1628686090;
	bh=f0bheo+w4LasykpFe1iqw5lNxqRbAvQs1P7j2mPHe6k=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ols9J2C3FyVuPChTNETwTqe3W6080IWSc8cBW6usv6YJXih3U+8sq2JSFHegtHPES
	 ks27SoLbcp0mfy4bvEGA8ZMEtLFqIs9tUWI+I9wzDov9QDx3/WM8Mj5A2ULjaaRr9s
	 DiGHDD4LgSDgzqVGi3c/cXVpptkJUTh3sV+EEho8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7A3A6F8032D;
	Wed, 11 Aug 2021 14:46:42 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 51A3DF802D2; Wed, 11 Aug 2021 14:46:40 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail1.perex.cz (mail1.perex.cz [77.48.224.245])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E470FF800F4
 for <alsa-devel@alsa-project.org>; Wed, 11 Aug 2021 14:46:27 +0200 (CEST)
Received: from mail1.perex.cz (localhost [127.0.0.1])
 by smtp1.perex.cz (Perex's E-mail Delivery System) with ESMTP id 0C0D7A003F;
 Wed, 11 Aug 2021 14:46:27 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.perex.cz 0C0D7A003F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=perex.cz; s=default;
 t=1628685987; bh=QXZXgljJCtdu7MBw+Qb9Nfz9/Rx2MXlzqn/ktvGvLiQ=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=wjTLgYX6bmNoLoLnZf78Uz9yjiBaMYm7mn4usY8QEGYxtqfHZNaWk5xXcyX5XRgo0
 dQTTdVOrsLxxg60JGtUjYKMUphIZfLCafF7id8r++9NC00OclJAFndtgkPj8AhsW61
 Jz2D8EvntPO9Q/2upjFAufkBxFb31YCUi+mf3CDA=
Received: from p1gen2.localdomain (unknown [192.168.100.98])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: perex)
 by mail1.perex.cz (Perex's E-mail Delivery System) with ESMTPSA;
 Wed, 11 Aug 2021 14:46:20 +0200 (CEST)
Subject: Re: USB-Audio: Device or resource busy (strace log)
To: Muni Sekhar <munisekharrms@gmail.com>,
 alsa-devel <alsa-devel@alsa-project.org>, linux-usb@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernelnewbies <kernelnewbies@kernelnewbies.org>
References: <CAHhAz+hQBnUVWBnoQO6y44C-G5CnZdFLJ7v738_Y5Rt6AZSkrA@mail.gmail.com>
From: Jaroslav Kysela <perex@perex.cz>
Message-ID: <41bebccc-7940-8379-0108-047bd1cc92f9@perex.cz>
Date: Wed, 11 Aug 2021 14:46:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHhAz+hQBnUVWBnoQO6y44C-G5CnZdFLJ7v738_Y5Rt6AZSkrA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
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

On 11. 08. 21 14:36, Muni Sekhar wrote:
> Hi All,
> 
> $ cat /proc/asound/cards
>  0 [USB            ]: USB-Audio - Plantronics .Audio 628 USB
>                       Plantronics Plantronics .Audio 628 USB at
> usb-0000:00:14.0-2, full speed
> 
> I am using a Plantronics USB Audio headset.
> 
> $ arecord --device hw:0,0 --channels 2 --format S16_LE --rate 44100Hz x.wav
> arecord: main:722: audio open error: Device or resource busy
> 
> 
> 'arecord' command always fails the first time after system boot in my
> system. But subsequent execution of the 'arecord' command runs fine.
> 
> 
> I've attached the strace log for the "audio open error: Device or
> resource busy" failure. Is there any fix available for this issue?

You may check which other task blocks the PCM device:

  lsof /dev/snd/pcmC0D0c

I guess that it will be pulseaudio (device enumeration).

					Jaroslav

-- 
Jaroslav Kysela <perex@perex.cz>
Linux Sound Maintainer; ALSA Project; Red Hat, Inc.
