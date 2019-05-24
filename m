Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0449C2A011
	for <lists+alsa-devel@lfdr.de>; Fri, 24 May 2019 22:49:16 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 65BAB1720;
	Fri, 24 May 2019 22:48:25 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 65BAB1720
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1558730955;
	bh=oHJoMwP01cjYLuhQhDmt7Y3l/VeBiJFnlKVOxIBLGEo=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=k+UrSYGYuuw2AIz/lOqAIwAlK9fSAKFrdnMb6pvkcxeWrCiJLaEX3E9tXTUn9ymwc
	 NSZIsnpwzvRXKQ4PQM/bJbEUH9cGuj5MpyQabElXZiCGL7ID6H2fw1n5L/DUNY5qb4
	 pzk/WbzdbUpdjp8kZngDvWCWmo1EjbWMQYh8lcNQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id DB54DF8962F;
	Fri, 24 May 2019 22:47:30 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 21535F80C0F; Fri, 24 May 2019 22:47:28 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_26,SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2D4A5F806F7
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 22:47:24 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2D4A5F806F7
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="KE1BLQu8"
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
 [209.85.222.176])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A082F2186A
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 20:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558729726;
 bh=JjLuxZd15YS8ce7/3JtjMDPYXP1vrOBgwkAGODXovT4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=KE1BLQu8Cu1pCpNeczUH4dYXqrtrrzfNqKBdd6wr2r/z7xUN4GGfWvy2knIZqfcxq
 RiundfM2719VjQMzI99idOdhy2rri7wCHPJR9EfzvBT+qBWmlM4XQu7KkMudQQtAEO
 dV4jXEL8R5ayOCVMOJs5Rl/bmIthFWfLp04LJIqM=
Received: by mail-qk1-f176.google.com with SMTP id p26so6836140qkj.5
 for <alsa-devel@alsa-project.org>; Fri, 24 May 2019 13:28:46 -0700 (PDT)
X-Gm-Message-State: APjAAAUm9uvk7z9LEVqVpTPd+PCU4DuYhnMyh01a0T6HpysN1kWRroVR
 N4wy3f/QHl+W2sp+zKNGC14t0dPlcVtBP9inCQ==
X-Google-Smtp-Source: APXvYqxT5HWriyhnIaLdL0b/p0ngf0zs/2jWKzDWRP9XaMqr1OulKXi1LfCoHWUvOZ/tnkBIYrecedFFkoN9Xet7zIg=
X-Received: by 2002:ac8:7688:: with SMTP id g8mr59899359qtr.224.1558729725948; 
 Fri, 24 May 2019 13:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <5f8095fbd5c2c34478792b9715059675251a30e6.1558702660.git-series.maxime.ripard@bootlin.com>
 <9b280f9ce894e4e2ea7259db505cbe1a3e00120e.1558702660.git-series.maxime.ripard@bootlin.com>
In-Reply-To: <9b280f9ce894e4e2ea7259db505cbe1a3e00120e.1558702660.git-series.maxime.ripard@bootlin.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 24 May 2019 15:28:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKhP0DvZSAEHA47d4UY6LQYKobZdfAxSk_9FWuBS9UJgQ@mail.gmail.com>
Message-ID: <CAL_JsqKhP0DvZSAEHA47d4UY6LQYKobZdfAxSk_9FWuBS9UJgQ@mail.gmail.com>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH 2/2] dt-bindings: sound: sun4i-i2s:
 Document that the RX channel can be missing
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

On Fri, May 24, 2019 at 7:58 AM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> The A83t and compatibles controllers don't have any reception capabilities
> on some instances of the controllers, even though it was never documented
> as such in the binding before.
>
> Therefore, on those controllers, we don't have the option to set an RX DMA
> channel.
>
> This was already done in the DTSI, but the binding itself was never
> updated. Let's add a special case in the schemas.
>
> Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
> ---
>  Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-i2s.yaml | 52 ++++++++++++++++++++++++++++++++++++++++++----------
>  1 file changed, 42 insertions(+), 10 deletions(-)

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
