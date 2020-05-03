Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A8DE1C2BE5
	for <lists+alsa-devel@lfdr.de>; Sun,  3 May 2020 13:44:44 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 99B2D16B9;
	Sun,  3 May 2020 13:43:53 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 99B2D16B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1588506283;
	bh=7gprFFWdremyo0aHzQswjzxgcmi9q4ecbEzPJ1IXjgE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rChPAF8yf6Sy1j6FhAPVmwTuam1oT1U8HJiGjDWd5oscfd75+7iABQJNMkysKvywJ
	 i5GSKDDqiaurOSP6RZG+4lUtwR32GzK0wMIM9hLRNQn/fnnejRUAFbQxWR2YMQo8vk
	 UqDFWX72hBCTBwNCxG5UZC7ZR95vnbVlmRwUcm+c=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id ACAA5F800DA;
	Sun,  3 May 2020 13:43:02 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D7839F8015F; Sun,  3 May 2020 13:42:53 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 2A567F800DA
 for <alsa-devel@alsa-project.org>; Sun,  3 May 2020 13:42:46 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 2A567F800DA
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="B/VeyKDZ"
Received: by mail-io1-xd44.google.com with SMTP id i19so9360124ioh.12
 for <alsa-devel@alsa-project.org>; Sun, 03 May 2020 04:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=CswbDbzRoY7hOaMpKGQ7lTgkmEKRA2Ia8858GzcpRyQ=;
 b=B/VeyKDZ4SLuIY7xHuxpXOzOskfvZKU+A5FK81ESN3wNpQDFeg5YMMn10lN8K1HlzU
 ucNQI44nZ0RuaN9V467tsqNfMHZxbuNPptiUAsaVg3KYYzH75VV4unRSTt+NsACNb4lc
 dmcvbKyaOxB31ly2JwulyTgFbdifyHm56KvXnfOHErfj5UVE7YK2+skEdePVFu+BR44B
 uhVpDPvmnRDtBvfnAqrbUU5KLt9w1767QhJPPXsDn7tZknjhE++fAPu4TrDilwXBU/d1
 P2CRaRavJOqCiQE5DwlZs5i9VhlFSnNBdt72/1BGc2EAlaYKKm0a8lAz8UeYwOT07Ide
 HpOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=CswbDbzRoY7hOaMpKGQ7lTgkmEKRA2Ia8858GzcpRyQ=;
 b=cdedwV0bUxLd+qdAkz7sNb+tnzYX44IvVJY+GHzNy7JvbH+met4ajsiDMNJ0mSbexq
 D4n3v6PcZucTi6JQyiOWWMakLPOryAFiE4ojpK0xPZ615iqnjoi7hlkYqK7xK46XDyXt
 9uIQl1IAS5XNBxRctIb/n4YH5iFKdygGSXRSs3Suka9+MKlyQN0ujdLeD3WxoUDxTE6U
 Eu1xDSvnOfACw0HmILtoGLEs1zF10EKc5r+kirC7EEvgoE2iYBvCvDOc0js/mca+29fN
 FfYab8DT5l7n4tyuceHsi1ZrISvGnF06THofYv5aAZEh2K0NcDP7mUDEzpE/kYDKPmY6
 sSRg==
X-Gm-Message-State: AGi0PubMXLdOHxdMTfExulpr3i7wd5p/7xgHhkixVexkLaTOzH13PTza
 rYpiFn5QOwoLp4niEq/rONJn4gt7L2DwF+X3G5U=
X-Google-Smtp-Source: APiQypK7bQYFFm90yVaM++6A1mWUH1dHV3MQb0qbIp+ohH4OaxgHO6pX+nd1tdial7Rn5XJUxQbfqsSdn1DrT9htlVU=
X-Received: by 2002:a02:3f44:: with SMTP id c4mr10593844jaf.144.1588506164909; 
 Sun, 03 May 2020 04:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200426104115.22630-1-peron.clem@gmail.com>
 <20200426104115.22630-7-peron.clem@gmail.com>
 <CAGb2v66TFzpEmzdqxmjqGvVONkPEhaDMHNA4tRUvrX_Mg8w=tA@mail.gmail.com>
In-Reply-To: <CAGb2v66TFzpEmzdqxmjqGvVONkPEhaDMHNA4tRUvrX_Mg8w=tA@mail.gmail.com>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Sun, 3 May 2020 13:42:33 +0200
Message-ID: <CAJiuCcfpk=9E2dQnE+QeZrDHG7EqCBWqbEbnpBvhn-uvWuRV2w@mail.gmail.com>
Subject: Re: [PATCH v3 6/7] ASoC: sun4i-i2s: Adjust regmap settings
To: Chen-Yu Tsai <wens@csie.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Marcus Cooper <codekipper@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Maxime Ripard <mripard@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
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

Hi,

On Mon, 27 Apr 2020 at 13:03, Chen-Yu Tsai <wens@csie.org> wrote:
>
> On Sun, Apr 26, 2020 at 6:41 PM Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail=
.com> wrote:
> >
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > Bypass the regmap cache when flushing or reading the i2s FIFOs.
> >
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > Signed-off-by: Cl=C3=A9ment P=C3=A9ron <peron.clem@gmail.com>
>
> Acked-by: Chen-Yu Tsai <wens@csie.org>

The  SUN4I_I2S_FIFO_CTRL_REG is also missing.
As some bits can self-clear by themselves.

I will fix this in v4.

Regards,
Clement
