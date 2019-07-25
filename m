Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C4277753
	for <lists+alsa-devel@lfdr.de>; Sat, 27 Jul 2019 08:46:57 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id D133D204B;
	Sat, 27 Jul 2019 08:46:06 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz D133D204B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1564210016;
	bh=x7oOuzsqFcj5xK7YCYio5+fonaQ7kK04+nluo0FcX+4=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FjIqv7Q/cfvdUR442Fw4uYNokBrAj/zyD0HmApFVSTfbao9Zq76p77ecII2ej3QKA
	 Y3Hz/Widnc7YD6QdReHJUBDH9RkZNt4z7QXeB51VgIDqERjhlMkTrorQ4S04xbZoZN
	 1NDNxMTYCok7DhbEnrUGMVTTPar7eaVsbJtd/AaM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A529F8048E;
	Sat, 27 Jul 2019 08:43:47 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id BFD13F803D0; Thu, 25 Jul 2019 11:59:48 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 14CDFF8015A
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 11:59:45 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 14CDFF8015A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="n+xo2kCu"
Received: by mail-oi1-x22f.google.com with SMTP id l12so37270212oil.1
 for <alsa-devel@alsa-project.org>; Thu, 25 Jul 2019 02:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=zKHSrZAAO7WAtdbTd66Jts+kTpPB9amD5fXKdyR1cwI=;
 b=n+xo2kCuD0PbjBBZyZYd1tGldyZCq2CGvjGgT4zyB2/Y4MXwgSin55/d2QP9/Zleup
 cySrnrp+wpCcXKyEUITezPeU5X2gkd9sFsBXZ8x5ClEwUh0p3bPGd8cOzK5yXJU/CAg+
 9DoumkZFUCALi1pUnHj8+n2zVANHe1EiizSTHiUMyWKMacsoJ++OgtgG2AFcgml0ip9m
 9VB8++iVZPxs4zJf2B6a4399zrqJe40yhpAAsCFKojVuDepuYldBt38CYOgJ55FnGID4
 7fkrFi/8hjDtorsoXyNb7GY7qvQjqBru0FtPS4+25GotkwEevpy7QDSTrjYZvfVNrtHM
 pErA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zKHSrZAAO7WAtdbTd66Jts+kTpPB9amD5fXKdyR1cwI=;
 b=QuX+BDL4letqYyFPLOzTWyRo66qgEeurlv9N6spJsNp42hLzqzMVh90/pS18vR6ZY7
 zKP0tEQRIzjEL7O5ExJhSU60jYyqkWYI5IeFb6BPvMPtVQ4vasOk7BhJ3xe/ZWec6oGk
 nOb9olaa1x10T8d+G5EYm/zsRLDChqMjilLSYjO/suHJbaHzqX6XJyjinUO3o09hW7qx
 jItoyZeIwZFut6SBuYo7J6R4VdCNJOKw9C/FQFVMcO5nRSLdOestlOR4wg9y7H+3h5Je
 2LF3KKRe1NuF/V3JjppaiDGkJNvSUIyM/lJV/FPAbHhTffNLlm1usaHfzySUawxBWh1R
 wUJA==
X-Gm-Message-State: APjAAAUT35LWiDIfHZg3tKjvD7yK3lxei+/HBEmYB4uJ2Aa5wISMMpfy
 QCaDiHq8MvCD0Kev/2kzl+55DTB7X5BnBoO3ww4EOvhd
X-Google-Smtp-Source: APXvYqzijDFDAsH89NM4H+Ft8FBO4U0TVD7HgV6uTWm8MixEN9EoxVrJh9TNkQHF7tnKxqUiwaqS/fnRCAsF8uMuGwc=
X-Received: by 2002:aca:2303:: with SMTP id e3mr38350830oie.112.1564048783762; 
 Thu, 25 Jul 2019 02:59:43 -0700 (PDT)
MIME-Version: 1.0
From: eleven xiang <eleven.xiang@gmail.com>
Date: Thu, 25 Jul 2019 17:59:42 +0800
Message-ID: <CAC0dki4GtTUbEBEuVVo0AynfRW13CdAFzc_m6Ss1POq2E3Q7bQ@mail.gmail.com>
To: alsa-devel@alsa-project.org
X-Mailman-Approved-At: Sat, 27 Jul 2019 08:43:35 +0200
X-Content-Filtered-By: Mailman/MimeDel 2.1.15
Subject: [alsa-devel] [alsa-lib][v1.1.19][pcm][multi plug] multi plug stuck
 in busy loop which caused high cpu loading.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

Dear,

Currently, for Audio Echo Cancellation process, we combined both mic signal
and reference signal into one pcm with the multi plug.
And both the mic and ref signal are hw pcm devices, and they lived in the
same sound card in driver.

Here is the issue:

1. the master slave pcm device is already for read;
2. the second salve pcm is not ready for read, which means no data;
3. under this situation, snd_pcm_read_areas function will be stuck in busy
loop as below:

        avail = snd_pcm_avail_update(pcm); * // here always return avail=0,
due to the second salve pcm device wasn't ready*
        if (avail < 0) {
            err = avail;
            goto _end;
        }
        if (avail == 0) {
            if (state == SND_PCM_STATE_DRAINING)
                goto _end;
            if (pcm->mode & SND_PCM_NONBLOCK) {
                err = -EAGAIN;
                goto _end;
            }

            err = snd_pcm_wait(pcm, -1); * // return immediately, due to
the master slave pcm was ready for read.*
            if (err < 0)
                break;
            goto _again; *// stuck in busy loop !! again and again until
the second pcm data was ready !!!*

        }

it seemed that the root cause is that the two devices have obvious
interrupt period gap , and we also found that this issue can be easily
reproduced on our device under low memory case.

Currently we monitor this gap and return error to up layer to
close-and-reopen device to fix this issue.
So I wonder if there is any good solution ?

Thanks
-- 
BR,

eleven_xiang
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
