Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 261B22A3E08
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Nov 2020 08:51:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0675178A;
	Tue,  3 Nov 2020 08:50:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0675178A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1604389908;
	bh=T7pAXRTWrNkZzZOxk4+j+rXfOhA1DNTWcksQFxpsxZc=;
	h=Subject:From:In-Reply-To:Date:References:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Ia0ggUyeS3uHUc+9L70tCZRGRgZ84v0dLvPbBHCDG64U+EqjqlTludQPeSGImNWI/
	 1rhi6Aw/38AGe4Q/xuF/AwuaGcZjquFyOpf8JYdLzE7yBd74pXPQuon6k93LbtiQwd
	 Q9ca6lNoRMNMbVnzBf/U1xlARXe9eeq3IdFHNNqU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E757CF8051B;
	Tue,  3 Nov 2020 08:45:42 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B4419F80232; Mon,  2 Nov 2020 22:16:02 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU, FREEMAIL_ENVFROM_END_DIGIT, FREEMAIL_FROM, SPF_HELO_NONE,
 SPF_PASS, URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4FF99F80083
 for <alsa-devel@alsa-project.org>; Mon,  2 Nov 2020 22:15:55 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4FF99F80083
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pstbj7ke"
Received: by mail-pg1-x532.google.com with SMTP id w4so1637542pgg.13
 for <alsa-devel@alsa-project.org>; Mon, 02 Nov 2020 13:15:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=T7pAXRTWrNkZzZOxk4+j+rXfOhA1DNTWcksQFxpsxZc=;
 b=pstbj7keOE/AfkVZxo9jl/ASVmNChfeXJZvMYU7/bA5rxeqW2h7oz4K1QGdee1ap8h
 qfDTMOZLbOGzSwUsB1k+j+qdtH+E0JPFaouadWTZcUrcZ6/NpeR84/e+g5KMiWGL0Mv8
 0lzvvQ7e0sDO3ny7Tmm4sQlbnfohJPik/sKy45dFk86yO6H7sCfmMIshbecK27vWuskx
 KvEofqXkjx++54uIJSGY49FZytDN4/GV5oEnuki41Ai9/nuMExFLymtbpRk0/PDBmv1P
 dXYJQmE5FLx3Y1gwfOm7H7GCkMRc7TPIF/MR+uEWjXSshMxjHJbZNxWe7OP6LPHyi5r4
 ciog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=T7pAXRTWrNkZzZOxk4+j+rXfOhA1DNTWcksQFxpsxZc=;
 b=YlwIscNb0cbry6QlAbOEONXmqbbQOur4anLsmYyytOEX/stUPZy8RRxEoIXv98RM0k
 6P/Mj4UIueuxwfBXeJ8YZI/JxhfBVAVwC5FF1rWthtDhVZYaF7PkPSjDfyTf0bJjh8mn
 rPGDnWaM6EK3hUvNlK/L3BHOYp1ccwE/4Tg8WmkfJfst/XI8of2/QtLE8pnlmT3nWA7F
 CG9h2jBkkSGWwnri0tj24mu72hiAkFITlbOHsbWQRc00y9u8eo/yrY3l64q99xDqnCdi
 OAlyvHePYi/RNa1vye56u6rZDyk42d60wozrFqd5N3gwNIwBX3f3nLywU3M/8ZrPkla2
 nIag==
X-Gm-Message-State: AOAM532KfW4hiHLbh+f/6jNCIViQXNKqZZtMJLW6VYng4DHqndcpZRt6
 rMI9FE4QJo2gWFQpn0Kd2LZoEmVbLpIxIg==
X-Google-Smtp-Source: ABdhPJzpglJzUhmaRLlIlX0ZNNffUIUU+bduqyAI4kQF0MD2rk/W3vHOS2fwnljdadGAXGKeXRxqhg==
X-Received: by 2002:a62:2e47:0:b029:155:853a:80d5 with SMTP id
 u68-20020a622e470000b0290155853a80d5mr22856896pfu.29.1604351753069; 
 Mon, 02 Nov 2020 13:15:53 -0800 (PST)
Received: from [192.168.1.140] ([14.189.119.19])
 by smtp.gmail.com with ESMTPSA id g16sm414119pju.5.2020.11.02.13.15.52
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Nov 2020 13:15:52 -0800 (PST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (1.0)
Subject: Re: sound: PCM/I2S Digital Mic & SPDIF
From: linux lover <caprianking2002@gmail.com>
X-Mailer: iPhone Mail (15D60)
In-Reply-To: <CAHhAz+jd3h6YdBvv5+4zEr0546qRUuCgHfKJtoF=EQ=+4tQoGg@mail.gmail.com>
Date: Mon, 2 Nov 2020 13:15:50 -0800
Content-Transfer-Encoding: quoted-printable
Message-Id: <0CFC798D-3F52-4D41-B122-3BAA4E72C5B8@gmail.com>
References: <CAHhAz+jd3h6YdBvv5+4zEr0546qRUuCgHfKJtoF=EQ=+4tQoGg@mail.gmail.com>
To: Muni Sekhar <munisekharrms@gmail.com>
X-Mailman-Approved-At: Tue, 03 Nov 2020 08:45:21 +0100
Cc: alsa-devel <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org,
 kernelnewbies <kernelnewbies@kernelnewbies.org>
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

I=E2=80=99m grateful for having you as a friend!

Sent from my iPhone

> On Nov 1, 2020, at 7:19 AM, Muni Sekhar <munisekharrms@gmail.com> wrote:
>=20
> Hello all,
>=20
> I=E2=80=99m having a Linux X86 machine and interfacing with Xilinx FPGA
> endpoint over PCIe. FPGA endpoint supports various audio engines like
> PCM/I2S ,Digital Mic & SPDIF.
>=20
> I=E2=80=99m looking for any existing linux device driver to port it for my=
 hardware.
>=20
> Does the Linux kernel tree have any reference examples for these audio
> engines which I can use for porting it to my hardware? If so can
> someone please share your inputs on this.
>=20
> --=20
> Thanks,
> Sekhar
>=20
> _______________________________________________
> Kernelnewbies mailing list
> Kernelnewbies@kernelnewbies.org
> https://lists.kernelnewbies.org/mailman/listinfo/kernelnewbies
