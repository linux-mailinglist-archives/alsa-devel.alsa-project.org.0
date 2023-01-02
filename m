Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 406F665C17E
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 15:10:02 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id C996FE020;
	Tue,  3 Jan 2023 15:09:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz C996FE020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672755000;
	bh=MO3PF6p+afXm5zn13bWM83e/wB85pg2FekVhsPuYcGs=;
	h=From:Date:Subject:To:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=KMJnhKmfr2YRMbLZ9mHAlZlFeJsfbjPv7Mr2LThFiCvfhzOW8Ml1D+Q5+ckBpfTFc
	 cLFPxGx6J64n6Ft0dH+iotv2Wr066HxYjvkXEUj/Rl5q+M1VVay7AX6/nH9KA7R6WI
	 WWafdmkD/M9B5/qtO06scciz8RgaTPj3YqiXVt+8=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 7E0E7F804CB;
	Tue,  3 Jan 2023 15:09:09 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B04F7F8023A; Mon,  2 Jan 2023 18:29:56 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [IPv6:2001:4860:4864:20::29])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id E021AF800D0
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 18:29:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz E021AF800D0
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=pkJ6DHVo
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-15027746720so19202399fac.13
 for <alsa-devel@alsa-project.org>; Mon, 02 Jan 2023 09:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=MO3PF6p+afXm5zn13bWM83e/wB85pg2FekVhsPuYcGs=;
 b=pkJ6DHVo7HHwKQEtGFFNvfZ9sHymqGr4Bj+Gz8KCtTeq280xzPfMNzP0OevL3ZUcJ/
 pJePiusWU12+zVf8ThBOP8EyZcrB5A6kryr+iE1DHm53vL5jZ8cRvOcCB0QaZWrySe91
 DX0C2/NkNieipZxOw0AfWPZHuCLqAFxT9oK5w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MO3PF6p+afXm5zn13bWM83e/wB85pg2FekVhsPuYcGs=;
 b=qblCRgTuWu2mZO1CVAQ+nSdNkE0v++gOiyWiTpKVgJRd1x9M6CRSJvJMhx7AOo/DGI
 ppj3RtR8SO1sztrW0hCNpkwZYHagxMfI7SAJSGEyqex6o9ShK6RDFjGY8Ufk0jIj7Bay
 ATUMlqVDBImWpggMkjlb9WX2pUJA/Wunfbt3YAzwdxqq5kS5fAdUBhPVvztTscvJuX+5
 s4qA0f2oGsRE9OegWa0gWBuRj24uY5vwvlvSo7gvNLgWlyjA8dWuF0/4sTGfsIgv1xYW
 643Ian0lNIrxEpFOXayBguW+9VxM/QNqW7//Thyafwo4QRZZoyJEjzYJgQZc8BkAtJsk
 p/tQ==
X-Gm-Message-State: AFqh2kq8DCIW4sEr2xPcZXDqxJ1ZwAqviPRl8mPIkBceYSDxYKGPGB9Y
 BZ0FMj7W9g6FY6WGy1RwAUJy4nXqWmBUDhPqkkNv2jD9Oi6mYyxp/nU=
X-Google-Smtp-Source: AMrXdXvyO8uVbMPjy4iw+DDTHcdUfmkOnyofYofSpArK6026+iSlt2535pEyIlkwhrLzSC/0boyvrHeOm2rfLYU88QY=
X-Received: by 2002:a05:6870:8dcf:b0:150:a904:9f9a with SMTP id
 lq15-20020a0568708dcf00b00150a9049f9amr414910oab.235.1672680589778; Mon, 02
 Jan 2023 09:29:49 -0800 (PST)
MIME-Version: 1.0
From: Michael Ralston <michael@ralston.id.au>
Date: Tue, 3 Jan 2023 04:29:13 +1100
Message-ID: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
Subject: USB-Audio regression on behringer UMC404HD
To: alsa-devel@alsa-project.org, regressions@lists.linux.dev, 
 stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 03 Jan 2023 15:09:07 +0100
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
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>

I'm currently experiencing a regression with the audio on my Behringer
U-Phoria UMC404HD.

Alsa info is at:
http://alsa-project.org/db/?f=3Df453b8cd0248fb5fdfa38e1b770e774102f66135

I get no audio in or out for this device with kernel versions 6.1.1 and 6.1=
.2.

The versions I have tried that work correctly include 5.15.86 LTS,
5.19.12, and 6.0.13=E2=80=9316.

When I run this on 6.1.1, it will just hang until I ctrl+c:
aplay -D plughw:1,0 /usr/share/sounds/alsa/Front_Center.wav

I've run strace on that command, and its output is at:
https://pastebin.com/WaxJpTMe

Nothing out of the ordinary occurs when aplay is run, according to the
kernel logs.

Please let me know how I can provide additional debugging information
if necessary.

Thanks
Michael
