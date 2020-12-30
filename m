Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6882E76EB
	for <lists+alsa-devel@lfdr.de>; Wed, 30 Dec 2020 08:59:37 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B64571816;
	Wed, 30 Dec 2020 08:58:41 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B64571816
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1609315171;
	bh=mByqkhOakjDk5jMnujnWz09tRCAv5Ku1Jiz6cNbY+BY=;
	h=Subject:To:References:From:Date:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=n+F94qBzn/bO9gRopWsp50dzT4ypbNMru5PLbVzquxd0HWpae/JFGih9AkGwu9Fkd
	 Aou8U1qqN7E8MAkDctJiEcHghhZYrd3hkhJaVwC/D1aAquEcydM9XHllHWr87cE7cZ
	 Eggh+jPsYC1QIh1SZJpiiDFfQSZO6fjfLfB/czOM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 60A05F801F9;
	Wed, 30 Dec 2020 08:57:58 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C4472F801F5; Wed, 30 Dec 2020 08:57:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,NICE_REPLY_A,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from cable.insite.cz (cable.insite.cz [84.242.75.189])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 04D05F80132
 for <alsa-devel@alsa-project.org>; Wed, 30 Dec 2020 08:57:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 04D05F80132
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="mlsO69+M"; 
 dkim=pass (1024-bit key) header.d=ivitera.com header.i=@ivitera.com
 header.b="j5W6G564"
Received: from localhost (localhost [127.0.0.1])
 by cable.insite.cz (Postfix) with ESMTP id 35B5EAA42B30E;
 Wed, 30 Dec 2020 08:57:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1609315070; bh=mByqkhOakjDk5jMnujnWz09tRCAv5Ku1Jiz6cNbY+BY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=mlsO69+Mc+PMV9/E6AAC3r6fM/IsIT1G5gsjAq7FUvACWe3ZKDBOSR4F3QbOOFG6M
 GY8qYQR3nWeI5zaQZdeuKHjK8OtjvrP9+bPjMdGhNtvjNHgnlbvyvYToesOHoqOMVK
 4zxKCe5Ia1ijPAU0XyngyFzz4ctiiy+bDGmMYrL0=
Received: from cable.insite.cz ([84.242.75.189])
 by localhost (server.insite.cz [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X8CnFMps-jSJ; Wed, 30 Dec 2020 08:57:44 +0100 (CET)
Received: from [192.168.105.22] (ip28.insite.cz [81.0.237.28])
 (Authenticated sender: pavel)
 by cable.insite.cz (Postfix) with ESMTPSA id 881DCAA4280FE;
 Wed, 30 Dec 2020 08:57:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=ivitera.com; s=mail;
 t=1609315064; bh=mByqkhOakjDk5jMnujnWz09tRCAv5Ku1Jiz6cNbY+BY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=j5W6G564Dz678Ng+oQM+f3uRrehUqGtPpnernD7OUCsKEVs3zzddcUUj7g9rM1WEz
 zxUecFPC0uB38r2pfw2wUgKoy2nmpFxiAYnzp0h6dnmjSGOOCDtoofLGfKSpT/xVGR
 /TVSf1O6qs+MhvTnrK6tJ5SOGUPXmwdJN23CEhUc=
Subject: Re: configuring usb 2.0 audio gadget correctly via configfs?
To: Bert Schiettecatte <bert@bertschiettecatte.com>,
 alsa-devel@alsa-project.org
References: <CALd3UbR-1WHwpw=y-OMM6w6wTpKQ9mkY6J1F3KwLMQKrwWL_Lw@mail.gmail.com>
From: Pavel Hofman <pavel.hofman@ivitera.com>
Message-ID: <642f66c0-8c10-a245-5f51-5e033cd33500@ivitera.com>
Date: Wed, 30 Dec 2020 08:57:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CALd3UbR-1WHwpw=y-OMM6w6wTpKQ9mkY6J1F3KwLMQKrwWL_Lw@mail.gmail.com>
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

Dne 29. 12. 20 v 16:22 Bert Schiettecatte napsal(a):
> Hi all
> 
> 
> Anyway, just wanted to know what the current state of things is
> regarding the gadget driver and alsa.

Hi Bert,

I would recommend to search linux-usb@vger.kernel.org mailing list, that
is where the gadget development mostly takes place. There were a number
of patches recently, most of them not included upstream yet.The
f_uac2/g_audio gadget is receiving attention and development effort.

Best regards,

Pavel.
