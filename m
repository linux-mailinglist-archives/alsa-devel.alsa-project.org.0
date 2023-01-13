Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id F23D266AFCA
	for <lists+alsa-devel@lfdr.de>; Sun, 15 Jan 2023 08:53:03 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D111456E;
	Sun, 15 Jan 2023 08:52:13 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D111456E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1673769183;
	bh=B62ZsrbRf3xRyaqZCCewmgctkdafk3kp0mApcmsVRi0=;
	h=Date:Subject:To:References:From:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=avCRJ3ChqxN4z/VaIzLmxbmGvmlkN3iAtTeQWjIgK8mFuEWdTOOAhhHxO5ETsqEBK
	 wRmchmoyUKecFYVNLCJyy92F17suP3edHpFKQb3g++iMEXx5b6RUolXa9SQnPPGRqh
	 9pJwU72lxbp8nvfErChpv8dC2YofZ6S8i554CkYY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E8FEFF805B0;
	Sun, 15 Jan 2023 08:48:39 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 53F93F80424; Fri, 13 Jan 2023 19:59:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 NICE_REPLY_A,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
 shortcircuit=no autolearn=ham autolearn_force=no version=3.4.6
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com
 [IPv6:2607:f8b0:4864:20::c31])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 3183DF8016D
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 19:59:51 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 3183DF8016D
Authentication-Results: alsa1.perex.cz; dkim=pass (2048-bit key,
 unprotected) header.d=landley-net.20210112.gappssmtp.com
 header.i=@landley-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=PS9bts8W
Received: by mail-oo1-xc31.google.com with SMTP id
 d16-20020a4a5210000000b004f23d1aea58so2004714oob.3
 for <alsa-devel@alsa-project.org>; Fri, 13 Jan 2023 10:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bTIDomgS8mXkDJCvxm5Zm+LjWmMOagP4MCI8VhlfZ4M=;
 b=PS9bts8WEYUdHc2dq03MseWIdo5SmkGasWJ1IHK/82VNd2x1nauvFpnIRKJHReewV4
 qHgmemCtG+n4JzEug1j/TkXXGr7XuvlNF4IBzbNfnN6lagwFrOKhEymKlD3N/LDBaGvv
 sKYDqBaLKXsSv5VTvSWrpB1Ro6mV2B1zSTvwS3WrXPPhGJgdWKpIwnEsYL1x49CphPxG
 SL4YOgYdR5jGUY39ZZius3Ig7i4WfTYOC67k8Vh1lto4GbCgV9uKa97KEalM5EmLMGPn
 3yGQHE93+pmLVFjd1TlIZLJrfjBmFeNgyn5vD6/2wKe8LZIYKJC7joRnrftdzonfyS0K
 +t4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bTIDomgS8mXkDJCvxm5Zm+LjWmMOagP4MCI8VhlfZ4M=;
 b=Z/G/p6E2uXskjLoQVLPeYxW1Qbs+v89TxJTxws1lMCNDnWO/dvnHUm/0fxngSnmKO0
 fJJ4KOqsdHHBJUaIE9XEUBMO3BMPPLpx2NZpmZCPiUVEeMf8RMeg2vbCGTGeML3M/g+T
 GDmEnRY3kDskAoFSf+X/QQIWvw7bRVPzsnuMCHKrz3LwpsDDqKAuPPa1wgALDmzNoBlx
 Z5rdSbJXngqJZs49Vl7oX+cR9zFa8NVSNdhKelFqVZouMTArV+q05+t3v1LJTyYq2ivb
 dHA2VDvsdcrAcnTzdn+aAxf1aRk7I7c89v5rpVCbwvyLa1ZB+iL6yx73xPME5QnPKYLN
 BOdw==
X-Gm-Message-State: AFqh2kru/m39KpPX51VPSaXnQiNNizWsLabqs24hsPIFmDcfXirWfHhC
 cSIJIifQnh/rlxODuXrCsSo3cw==
X-Google-Smtp-Source: AMrXdXvaOiO0G10Az4EGLc64Vx6N+KrZr3PuLGXv0M+M3iF7lrA3WUc8R2fIq6AYtp8ZC6Mk4E9lCQ==
X-Received: by 2002:a4a:c594:0:b0:4e7:5d43:a654 with SMTP id
 x20-20020a4ac594000000b004e75d43a654mr22358114oop.0.1673636389556; 
 Fri, 13 Jan 2023 10:59:49 -0800 (PST)
Received: from [192.168.86.224] ([136.62.38.22])
 by smtp.gmail.com with ESMTPSA id
 bc31-20020a056820169f00b0049f8b4b2095sm10111163oob.44.2023.01.13.10.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jan 2023 10:59:48 -0800 (PST)
Message-ID: <6891afb6-4190-6a52-0319-745b3f138d97@landley.net>
Date: Fri, 13 Jan 2023 13:11:56 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: remove arch/sh
Content-Language: en-US
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230113062339.1909087-1-hch@lst.de>
 <11e2e0a8-eabe-2d8c-d612-9cdd4bcc3648@physik.fu-berlin.de>
 <CAMuHMdUcnP6a9Ch5=_CMPq-io-YWK5pshkOT2nZmP1hvNcwBAg@mail.gmail.com>
 <142532fb-5997-bdc1-0811-a80ae33f4ba4@physik.fu-berlin.de>
From: Rob Landley <rob@landley.net>
In-Reply-To: <142532fb-5997-bdc1-0811-a80ae33f4ba4@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Sun, 15 Jan 2023 08:48:19 +0100
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: linux-fbdev@vger.kernel.org, Rich Felker <dalias@libc.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-sh@vger.kernel.org,
 linux-rtc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-serial@vger.kernel.org,
 linux-input@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org, alsa-devel@alsa-project.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

On 1/13/23 02:52, John Paul Adrian Glaubitz wrote:
> Hi Geert!
> 
> On 1/13/23 09:26, Geert Uytterhoeven wrote:
>> Indeed.  The main issue is not the lack of people sending patches and
>> fixes, but those patches never being applied by the maintainers.
>> Perhaps someone is willing to stand up to take over maintainership?
> 
> I actually would be willing to do it but I'm a bit hesitant as I'm not 100%
> sure my skills are sufficient. Maybe if someone can assist me?

My skills aren't sufficient and I dunno how much time I have, but I can
certainly assist. I test sh4 regularlyish and it's in the list of architectures
I ship binaries and tiny VM images for, just refreshed tuesday:

https://landley.net/toybox/downloads/binaries/0.8.9/
https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/

(The sh2eb isn't a VM, it's a physical board I have here...)

There is definitely interest in this architecture. I'm aware Rich hasn't been
the most responsive maintainer. (I'm told he's on vacation with his family at
the moment, according to the text I got about this issue from the J-core
hardware guys in Japan.)

The main reason we haven't converted everything to device tree is we only have
access to test hardware for a subset of the boards. Pruning the list of
supported boards and converting the rest to device tree might make sense. We can
always add/convert boards back later...

Rob
