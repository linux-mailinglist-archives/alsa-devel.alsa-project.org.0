Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id B84555ACF53
	for <lists+alsa-devel@lfdr.de>; Mon,  5 Sep 2022 11:56:23 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7124EE0F;
	Mon,  5 Sep 2022 11:55:32 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7124EE0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1662371782;
	bh=kZwowG+rRON5KFSUE0R9YJYWgBrkd2+kJINr3ZwEXZo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gQJxizJMLW7TkyY+Ws/h8a5mhTllTjOnKDoN1WdKYgctSC5FAzM37R/5mVNZrl/FD
	 jvCc1nzwl6cl2VOYXB7pbNfkd4Nqddq0J05wdVzk4oEmQ2NMJ6Z0PIyz16JDQKhgKh
	 HUAHB8i+qd3I9B9uU81L5kzl2MHWTtmOjOSOTD7Y=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 4A772F8032D;
	Mon,  5 Sep 2022 11:55:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9AF5F80238; Mon,  5 Sep 2022 11:55:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id BDECFF800E9
 for <alsa-devel@alsa-project.org>; Mon,  5 Sep 2022 11:55:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz BDECFF800E9
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="Vl1e3lhr"
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-3321c2a8d4cso65530317b3.5
 for <alsa-devel@alsa-project.org>; Mon, 05 Sep 2022 02:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=kZwowG+rRON5KFSUE0R9YJYWgBrkd2+kJINr3ZwEXZo=;
 b=Vl1e3lhr4VBYOH0566THbq5E7P+PDrFu12F8dop24wzAOHlXYdtoS44xu2rgMicuvp
 tA7YB486fFdpf8kVtFpNecJH1s4DXPlxHiW6LQkPh/LWtoRWVE5AHVHmq0SZwgAi87o9
 wEXwyzgeEiMe9khhpJkOsw2zjnF+351IkAyQj1AQodm19bxNYQTuw2r3ZRJi19DQ8Rtx
 3Om79/0Ta7Gr6MSxgSucqk93FAlG0v0w89dq18ngW9nbBb1AX7Z+BV6kOoLnB8YYNiK3
 nKw+MnTtefiAlqU/F83VERFQTnah38RoRnpml3JJpVMCKDt8aMbdYtZDFbs1AYhOw90P
 JVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=kZwowG+rRON5KFSUE0R9YJYWgBrkd2+kJINr3ZwEXZo=;
 b=h7Z0dGg/CC4CSTpTagTHYMF0YeaesGLMZIHP/B6yQCAvvN6kAS+3bN36vjGaP1ahEB
 NDAIugMwoL4j9rQf1B70pZ7E+WK9Bfd4vEXNz0B1RlfsEug4UXaCR5m/WYadkwVtbvbd
 xfSv2EuN1J/ZuTJaGLnswqcDtiQndlpKPEDX+MaJ051i5mmPsfH1ows3Y8bAq7g3uVN2
 OKQGNU4ufQQu9m0v2WVg+iw6oB05FPICdJu7ShYj86QFLZ3eLfGPiBkjXMf3hlOZwTdc
 CjauBVCnTY8ub6FNGmqJQv+y5013SYXA/Ri725Gxp8HrF0p2szWjHMeFRwa2YFAxW/C9
 WunQ==
X-Gm-Message-State: ACgBeo0YOJQzDKz69hakCTGvQvItumzO5q5RN60wWIF1jrooEPrab7b4
 rWzStH2poUFmF5Jp2QpIRBZSRKRlNFytCVYkiIA=
X-Google-Smtp-Source: AA6agR5VnQe4agp3+bventbZ7vQ9gI0u6eIpSo3fWiJh/oMJA6ijI89J9YKmciXOJw3L4bSRSWRikz9lWxdlZfz3zGk=
X-Received: by 2002:a0d:f701:0:b0:32a:17d3:d189 with SMTP id
 h1-20020a0df701000000b0032a17d3d189mr38205702ywf.401.1662371711515; Mon, 05
 Sep 2022 02:55:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220905093546.19735-1-lukas.bulwahn@gmail.com>
 <4DB82E66-0BB9-4B43-917B-55E115994876@cutebit.org>
In-Reply-To: <4DB82E66-0BB9-4B43-917B-55E115994876@cutebit.org>
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date: Mon, 5 Sep 2022 11:55:00 +0200
Message-ID: <CAKXUXMzGJv=Xvbv8VRqFfa=n-0D84Hk2FALqtyqmxD9ovDKCMw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: rectify entry in ARM/APPLE MACHINE SOUND
 DRIVERS
To: =?UTF-8?Q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 kernel-janitors <kernel-janitors@vger.kernel.org>, asahi@lists.linux.dev,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

On Mon, Sep 5, 2022 at 11:44 AM Martin Povi=C5=A1er <povik+lin@cutebit.org>=
 wrote:
>
>
> > On 5. 9. 2022, at 11:35, Lukas Bulwahn <lukas.bulwahn@gmail.com> wrote:
> >
> > Commit 3df5d0d97289 ("ASoC: apple: mca: Start new platform driver") add=
s
> > a new sound driver at the location "sound/soc/apple/", but it adds a fi=
le
> > entry referring to the non-existing location "drivers/sound/apple/*".
> >
> > Hence, ./scripts/get_maintainer.pl --self-test=3Dpatterns complains abo=
ut a
> > broken reference.
> >
> > Repair this file reference in ARM/APPLE MACHINE SOUND DRIVERS.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > Martin, please ack.
> > Mark, please pick this patch on top of the commit above.
>
> Hi Lukas, fixed here already:
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/=
?id=3D55e2bd9c41e800638676dce3f19dcfd16b309a08
>

Great, thanks! Then, there is nothing more to do. Please ignore this patch =
then.

Lukas
