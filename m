Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D38E65C180
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 15:10:21 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 3F9C4E027;
	Tue,  3 Jan 2023 15:09:30 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 3F9C4E027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672755020;
	bh=wpUdWNyPhWU5w8o3Zwx5VFBr6NeDV2N4F/Qnpa1vL6I=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=IS/i2EZj8J2rr3ZaIG9PfAzZ9ajbQ9/JwpUC/hUKJYD5HcGrUsLLP0KSG3wkFvdag
	 JnlXpduYc0YtHVquJJ5iz0jnzQ0YTdZsUckSQhEUZnD0PJSgQQO9ZIByu86O6lqkXQ
	 H2xdWQVZxNpX1+cJKQ5xW469Qw8TzX9ERkwp67iI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 09ED8F80539;
	Tue,  3 Jan 2023 15:09:10 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7DC4DF8023A; Mon,  2 Jan 2023 18:44:13 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS,
 URIBL_BLOCKED shortcircuit=no autolearn=ham autolearn_force=no
 version=3.4.6
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com
 [IPv6:2001:4860:4864:20::2f])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 06B6AF800C0
 for <alsa-devel@alsa-project.org>; Mon,  2 Jan 2023 18:44:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 06B6AF800C0
Authentication-Results: alsa1.perex.cz; dkim=pass (1024-bit key,
 unprotected) header.d=ralston.id.au header.i=@ralston.id.au
 header.a=rsa-sha256 header.s=google header.b=m6MfbMmf
Received: by mail-oa1-x2f.google.com with SMTP id
 586e51a60fabf-12c8312131fso34328947fac.4
 for <alsa-devel@alsa-project.org>; Mon, 02 Jan 2023 09:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ralston.id.au; s=google;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wpUdWNyPhWU5w8o3Zwx5VFBr6NeDV2N4F/Qnpa1vL6I=;
 b=m6MfbMmfrvFMSUgheX+b1ukF1/bEA3TEehvz5R5uFzBKT/TyBoKBSLtWV+njwJqx8v
 tspcNCE91UZXack1P2u1PQvk1cXE+2YnYZHlKYOb5AC1nlfaVGG0yK6X797LnQg2TtTy
 H3iwEfDsHqXGhUBEoKw+B8vG5Zosq/HWi/kQo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wpUdWNyPhWU5w8o3Zwx5VFBr6NeDV2N4F/Qnpa1vL6I=;
 b=hTFu3p1rNrEl9aXNrYD4XEqM40JNfUvCz52cHNp/UGtMd8aaNJ6XC9SXdnAvJwyNgA
 smVbHCdKUI5XfEcX+HqGLsuUjIgF03FymJ9NpZrxuR0OLuorh1FlLOZonrnXsMP4kooF
 Km7rc+F0gq/WG2ASg+6NeJZUxz/yJcb2OtwcW3rt/s90yP9NOdFWfJfDkYFE4pojlL+D
 Q5ZXQvV+CAp4yo69BAFAOZfAKzpAYW+YRr5EogUbfP4wvubffpm9VXF0WBe35JE2MizK
 L6XtVnoiBV5rdFRQjSm8sauS2g3y0LZWIOxb940NKqxiD0/2eQ2CSYLI14tTN/Ui4JpT
 kFpQ==
X-Gm-Message-State: AFqh2kqNMOeehlJrKXEeec8TBLYo0C5t7x3GMAI8FglgS1noXBcYJvEt
 YXXPsslXKaV95JXn7LvIzmcSHo7st7sKqMv6KSJo/YdqknRR9GBLAMQ=
X-Google-Smtp-Source: AMrXdXt300OkGf3B2NgvxWo1oA2JPnVGjbbRXY38U1mSSmMdpmnqxV4oDKEOoFyumXSsZZDh0jag4jDM2UvUsf2wacQ=
X-Received: by 2002:a05:687c:189:b0:14f:a2ed:988f with SMTP id
 yo9-20020a05687c018900b0014fa2ed988fmr1910155oab.220.1672681448813; Mon, 02
 Jan 2023 09:44:08 -0800 (PST)
MIME-Version: 1.0
References: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
In-Reply-To: <CAC2975JXkS1A5Tj9b02G_sy25ZWN-ys+tc9wmkoS=qPgKCogSg@mail.gmail.com>
From: Michael Ralston <michael@ralston.id.au>
Date: Tue, 3 Jan 2023 04:43:32 +1100
Message-ID: <CAC2975KFpfPXb06Mfx9oEawbvV_bAoV=YOCCh7g1vfgfLrJWyg@mail.gmail.com>
Subject: Re: USB-Audio regression on behringer UMC404HD
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

For comparison, on a working kernel version, my audio devices are
listed in a different order:
http://alsa-project.org/db/?f=3Deff15e3b674b313f12121c95d4cf330f9d48897c

--
Michael

On Tue, 3 Jan 2023 at 04:29, Michael Ralston <michael@ralston.id.au> wrote:
>
> I'm currently experiencing a regression with the audio on my Behringer
> U-Phoria UMC404HD.
>
> Alsa info is at:
> http://alsa-project.org/db/?f=3Df453b8cd0248fb5fdfa38e1b770e774102f66135
>
> I get no audio in or out for this device with kernel versions 6.1.1 and 6=
.1.2.
>
> The versions I have tried that work correctly include 5.15.86 LTS,
> 5.19.12, and 6.0.13=E2=80=9316.
>
> When I run this on 6.1.1, it will just hang until I ctrl+c:
> aplay -D plughw:1,0 /usr/share/sounds/alsa/Front_Center.wav
>
> I've run strace on that command, and its output is at:
> https://pastebin.com/WaxJpTMe
>
> Nothing out of the ordinary occurs when aplay is run, according to the
> kernel logs.
>
> Please let me know how I can provide additional debugging information
> if necessary.
>
> Thanks
> Michael
