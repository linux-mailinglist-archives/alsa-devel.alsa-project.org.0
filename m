Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E511B7979
	for <lists+alsa-devel@lfdr.de>; Fri, 24 Apr 2020 17:23:49 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id AB95B16B4;
	Fri, 24 Apr 2020 17:22:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz AB95B16B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1587741828;
	bh=aLWv3eaknaTlsHMOsfr9P75/q0ksYi/EFOGMHSB+6Wg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=uTgTMsm8tfoEohHsW4eCEXWS+PjioflxN0GRSetjxWpWLjwiKR4s2jOE4/wRAZ2gh
	 1TKJmb/2NXy25sfMQT57BVytm5l410hq9GDGmQq0O64YatyAMv6rl3fH18T8pmdNHV
	 9Vr8PetIB9nypyej2dGJ7HK1UAJ87PdB9oIBODNs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 8801DF80142;
	Fri, 24 Apr 2020 17:22:07 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 80828F80142; Fri, 24 Apr 2020 17:22:05 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [IPv6:2a00:1450:4864:20::241])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 79C15F80116
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 17:22:01 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 79C15F80116
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="DJYepYnP"
Received: by mail-lj1-x241.google.com with SMTP id n6so10308252ljg.12
 for <alsa-devel@alsa-project.org>; Fri, 24 Apr 2020 08:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aLWv3eaknaTlsHMOsfr9P75/q0ksYi/EFOGMHSB+6Wg=;
 b=DJYepYnPRTIzVP9SKTevWcRZ+d5xf7ByvyA4Nl6uTjAz82fzkQ69VuNHCxoypstTER
 BFnNt0GXXeHzr4uERz/3Gg0sMapkNju8ROk1IEhjTgd3MHVbFUq4Cp5mB4g9Hv3zQV/7
 k826z2TzRXXooo7kT4quu6hSmEYc1uuJUAx3xhD9v6odAGgLE1vxLbqpwARLeI+08WqX
 ZSqQeBfWLILrdlk1JF/MX8Qbo4+z3Aw18/HY+ZiltLmw4FdiY2NTGZQgtSma+suAoz2j
 G5HJ/WBlt6+GQ9vrs4iyiNESjSG9yFggv5EtYUABml0ZnFGmxYHNP+BOQvtF7vX5ojZf
 /YDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aLWv3eaknaTlsHMOsfr9P75/q0ksYi/EFOGMHSB+6Wg=;
 b=TW7Oyku2GnSd3iF3kgOR048p1jm/wjHhwuJyberMwQsu6iLnWtQtsD1teJBiNHpYR1
 oSu9hwVs4Euo5VHC/bMAidbghAdxH/gQ+IxN55hGByGYAYJ8sMINoFwwDeNusvOw/elt
 yYsVj8R1l7zfOOPpgtOyjRLT9qx1hgq4IpSiYJOsKY0JIlWtn23FVsRwF+848IbrdT3l
 xRaOAVa3Pmlo6eGqfsuqOrXqMPCeoryMzkJBerEcl7xyzZ4zEWbumv8qJajHbFiDUjrE
 gn56tUpxN9Q3xKm40qxjZ5SpYDFkfJ4NIcFGCejF+jV6z8BZ+wKX4uSmpk7Ox+qoGLHT
 2LtQ==
X-Gm-Message-State: AGi0PubnyzCR/KuN4Mw8EHIURmFK0sNyYGxetQRWScQggTLyxHEOoksD
 oFhiUqZFeQMMBL0HSGjnrKKkXosDPafoHsC2LMJzWV4k2e9MbQ==
X-Google-Smtp-Source: APiQypJn40GjeiS3BU3IkJfbeUl/ZwEOtPhT1mHus9Q0KlCF8g4AZvGpqFCNc9S2ETib0eAbO22LMmphp7k3bWvIH3w=
X-Received: by 2002:a2e:b88b:: with SMTP id r11mr6250238ljp.116.1587741717593; 
 Fri, 24 Apr 2020 08:21:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200424022449.14972-1-alexander@tsoy.me>
 <20200424022449.14972-2-alexander@tsoy.me>
In-Reply-To: <20200424022449.14972-2-alexander@tsoy.me>
From: Gregor Pintar <grpintar@gmail.com>
Date: Fri, 24 Apr 2020 17:21:46 +0200
Message-ID: <CAOPXC2nE+q7XbSBAT+mufMfQdsC=KCBm2hnHUXFU=_ThBoe=Dw@mail.gmail.com>
Subject: Re: [PATCH 2/2] ALSA: usb-audio: Remove async workaround for Scarlett
 2nd gen
To: Alexander Tsoy <alexander@tsoy.me>
Content-Type: text/plain; charset="UTF-8"
Cc: Takashi Iwai <tiwai@suse.de>, alsa-devel@alsa-project.org,
 Roope Salmi <rpsalmi@gmail.com>
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

On Fri, Apr 24, 2020 at 4:24 AM Alexander Tsoy <alexander@tsoy.me> wrote:
>
> Frame size computation has been fixed and the workaround is no longer
> needed.
>

It seems async is preferred and usually more reliable.

Would it be possible to check, if there is feedback endpoint and use async,
even if interface is reporting synchronous?

Maybe make it configurable so it doesn't break devices with broken feedback
endpoints.
