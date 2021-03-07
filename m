Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 36BA43304AC
	for <lists+alsa-devel@lfdr.de>; Sun,  7 Mar 2021 21:54:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 945581900;
	Sun,  7 Mar 2021 21:53:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 945581900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615150440;
	bh=V1XkNS90BTP9erqE8hcNnHUihdi4VEKtjl32Z56+okQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Zuthg1XaiHBAg0Yqd1mHhGR2RpMVGoG1/hnRqqhxLCYL0ikrgMwb3x/hTLqv7M545
	 XxFFq7BWh1BENMNAyLF9C/vl3J8UKLCd4aNh6Thw1jMh3ygRhA7fE0w9sMhR2UlS8G
	 jz4n+lnmHubuIDTsPD+ze/VKeW5+mWJjd3raGQmQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 0DF8EF80139;
	Sun,  7 Mar 2021 21:52:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DF8B5F80227; Sun,  7 Mar 2021 21:52:26 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B4FD3F80139
 for <alsa-devel@alsa-project.org>; Sun,  7 Mar 2021 21:52:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B4FD3F80139
Received: from mail-oi1-f181.google.com ([209.85.167.181]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MZTa2-1lE4PD1oZy-00WSbR for <alsa-devel@alsa-project.org>; Sun, 07 Mar 2021
 21:52:13 +0100
Received: by mail-oi1-f181.google.com with SMTP id a13so8947001oid.0
 for <alsa-devel@alsa-project.org>; Sun, 07 Mar 2021 12:52:13 -0800 (PST)
X-Gm-Message-State: AOAM533nZREQJVcGIidPlL5mZSduYPCSOGt7xzEjSUTjtIGjrZ8OM8nI
 s0FANR4ri7P96nbZ6PYigKyrlZpHn7yzYGjVbYs=
X-Google-Smtp-Source: ABdhPJwDgMKTa6tkbka/HzdC5hxJWI5nKBQjM0Nap50/Ud/0tkMIEz6DDtQOaYPKhrwm8T0xnl+kRBK0xRT0XqekgzY=
X-Received: by 2002:aca:5e85:: with SMTP id s127mr14243593oib.67.1615150332143; 
 Sun, 07 Mar 2021 12:52:12 -0800 (PST)
MIME-Version: 1.0
References: <20210307162338.1160604-1-pbrobinson@gmail.com>
In-Reply-To: <20210307162338.1160604-1-pbrobinson@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 7 Mar 2021 21:51:56 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0AEAcGUVtRqBXL0j62fUUMaxq3ijK10UC8z81BbVQc-A@mail.gmail.com>
Message-ID: <CAK8P3a0AEAcGUVtRqBXL0j62fUUMaxq3ijK10UC8z81BbVQc-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: remove remnants of sirf prima/atlas audio codec
To: Peter Robinson <pbrobinson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:NNBJQjWNyBRKrDTXZDfYZmulu4SzQojRaP/yg08VyI999F6ij74
 7Tn2SmUr5A3F2jJiX5pJ5PZPIa4Wrrbh/SMDQjzrE2o0lUnnExhvG5VaGoyb/TsL/uHlG1T
 EYz83u9cbr1wVkc6V+YPsd69SgPlbaqrbHC0EPXxSk4jZoJNa9OsdCvZD6MDi1C/oHIgw1H
 3Al2CCt2syQ3iRShF+dUg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zkmhl0/3g98=:7aN6uvfikNtkD5BeI0G4Ch
 lNQwaCLXf6BGLoJaiXVrzPqSDe++SuvodT/9uLMfHK5Cje16wImXuMVDNU2Ri7rCwuryjLrmv
 4K+pjM8h7TNvV4Tv/BircxZbQrC55gJsExbCd3477MlZz935PWfG/D/l14KU8a1z8VjGQbdVR
 HZ7uMJN7n0XiAuvwJ7o8SXJ/v2cIgKHocHn/9EBHewY+4PzZ3Fizs2n1wAb+UE4CfUgdaBgGM
 4kHMN/XcPHvx0f4vUOaBli0udTw6nmW0zw//tFxNvcyUH4FSRqb0GtPmLKoKhvmkpwCScAdHH
 2xhN/Awm74LQtXtf+9wnmOzBVuqlxiiQVGOi0ejXiIsR2myNbyjXPY4o4+Byzij43SnANDR+J
 jeeLLm/46oWz5WMUX04PNCTOU5m3RL7V0NqG0M+vVNU5qyh8R0KONyyOwQOQP
Cc: Barry Song <baohua@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jun Nie <jun.nie@linaro.org>,
 Shawn Guo <shawnguo@kernel.org>
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

On Sun, Mar 7, 2021 at 5:23 PM Peter Robinson <pbrobinson@gmail.com> wrote:
>
> In 61fbeb5 the sirf prima/atlas drivers were removed. This cleans
> up a stray header and some Kconfig entries for the codec that
> were missed in the process.
>
> Fixes: 61fbeb5dcb3d (ASoC: remove sirf prima/atlas drivers)
> Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Mark Brown <broonie@kernel.org>

Good catch!

Acked-by: Arnd Bergmann <arnd@arndb.de>

I noticed I also left two DT binding files:

Documentation/devicetree/bindings/sound/sirf-audio.txt
Documentation/devicetree/bindings/sound/sirf-audio-port.txt

Mark, I'll send you a separate patch for those, but feel free to just
include the binding removal in Peter's patch and ignore my patch.

        Arnd
