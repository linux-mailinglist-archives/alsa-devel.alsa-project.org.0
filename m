Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BC8227A6B8
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Sep 2020 07:04:19 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 59B441B13;
	Mon, 28 Sep 2020 07:03:28 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 59B441B13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1601269458;
	bh=iH4BCtKHYZco8jOSQGiNPWj56rYDuIQ1wb3Pt3Sr0IY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=XgZzBWTcJjPJSw5CGVPF3Mt2BHqKZlZPSvvCqlYjX5+c1eCbr/zl/C2+8eBHS0gtG
	 eyJOFYW2U+MvO5hpPAMAcoR+2FdNc0qHJyQqsqG4rchWuBGDpkamQUQ6uiFxNNjSAP
	 DJPZ2izD6nvTItmbsdQMhEo0CTNrgl2OfycIrMBM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id AD90FF80228;
	Mon, 28 Sep 2020 07:03:27 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 2BCC7F8023F; Mon, 28 Sep 2020 07:03:24 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
 FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
 RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id B0E05F800FD
 for <alsa-devel@alsa-project.org>; Mon, 28 Sep 2020 07:03:13 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz B0E05F800FD
Received: by mail-lj1-f195.google.com with SMTP id a22so7169405ljp.13
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 22:03:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iH4BCtKHYZco8jOSQGiNPWj56rYDuIQ1wb3Pt3Sr0IY=;
 b=aLkOif/Aq6DdhEz2DWvH7Mn9RX6LHxJgBreCxi8reHHfgl+kvYzP1qXfi6Rylh6so+
 WUKeRDVI2bb0UAAIhBChVk4X3Z16PE9V4FsIgTHYVvPjRUD1CFzuRuu0VREKZpnrG9ed
 qS9cQsyMNE9h1bn6R9VuMe8idx8TPpX0Pf4XgQiN+ElD3G529Y4aT1D8qsLH45JoVkQk
 tApoPq9l5hPaZbtgvFAugIu1A9lphtKeX30j4A8CF6wsIf6MraOVdDvSaUGyZQW0OGrd
 kScZRdHPHgFtU8UlhfrjzTMdEUdSoLoBLDwKc0vS0nyOZE/GQfTIyJD5m5on0noYSYM0
 mNUA==
X-Gm-Message-State: AOAM531+Fck3AtuKWUuCSGzhc/QKcpLt1uRH3COZxDLZ029OtdEVf1eo
 1n6Utmx/GsRGIVRNc1U4jPj0Ppx2Va58MQ==
X-Google-Smtp-Source: ABdhPJykN4UOldrTpoFrilx6nkgd+J56EsTyyQc4JzXmW0j4t3LU1/uTpd5I85uOizls2/ehttpGOw==
X-Received: by 2002:a05:651c:141:: with SMTP id
 c1mr4649555ljd.182.1601269392581; 
 Sun, 27 Sep 2020 22:03:12 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id j20sm2693256lfe.252.2020.09.27.22.03.12
 for <alsa-devel@alsa-project.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Sep 2020 22:03:12 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id b22so9524670lfs.13
 for <alsa-devel@alsa-project.org>; Sun, 27 Sep 2020 22:03:12 -0700 (PDT)
X-Received: by 2002:ac2:5f63:: with SMTP id c3mr3034221lfc.283.1601269392234; 
 Sun, 27 Sep 2020 22:03:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200927192912.46323-1-peron.clem@gmail.com>
 <20200927192912.46323-5-peron.clem@gmail.com>
In-Reply-To: <20200927192912.46323-5-peron.clem@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 28 Sep 2020 13:03:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v65noEYaHa=d4s1E+1+bcUFjtojvjK_DmEAyJkGU_T9cTw@mail.gmail.com>
Message-ID: <CAGb2v65noEYaHa=d4s1E+1+bcUFjtojvjK_DmEAyJkGU_T9cTw@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH v5 04/20] dt-bindings: ASoC: sun4i-i2s: Add
 H6 compatible
To: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Rob Herring <robh@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Marcus Cooper <codekipper@gmail.com>,
 linux-sunxi <linux-sunxi@googlegroups.com>, Mark Brown <broonie@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
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

On Mon, Sep 28, 2020 at 3:29 AM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.c=
om> wrote:
>
> From: Jernej Skrabec <jernej.skrabec@siol.net>
>
> H6 I2S is very similar to H3, except that it supports up to 16 channels
> and thus few registers have fields on different position.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Acked-by: Rob Herring <robh@kernel.org>

Acked-by: Chen-Yu Tsai <wens@csie.org>
