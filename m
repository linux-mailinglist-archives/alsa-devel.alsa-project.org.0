Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BEA6D8AE5
	for <lists+alsa-devel@lfdr.de>; Wed, 16 Oct 2019 10:27:32 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id F324F15E2;
	Wed, 16 Oct 2019 10:26:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz F324F15E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1571214452;
	bh=cFCAcjtvC7yIHoa64mxhNy1cntbESG0anWcWX1JV5JY=;
	h=References:In-Reply-To:From:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kHKU1/Ji3pHHuBcoURqm0dx3+B3Z+mCCP5uiK4neI1zOXVi6KBDgi9fQpO3+mSFXm
	 0hNesx3u5Oz4BNYBBvcB5VBpVQ0xeTAIUwgZlqzdB9omfDMfIesd7QMk140TByAUff
	 mtB8bGxEN9TLJTSNhmLzQeYkgZIBxI2EZJoHRCXk=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 73613F80362;
	Wed, 16 Oct 2019 10:25:48 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C9E23F80362; Wed, 16 Oct 2019 10:25:44 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 42045F8011F
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 10:25:41 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 42045F8011F
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="eFXeazm0"
Received: by mail-lf1-x143.google.com with SMTP id c195so16694742lfg.9
 for <alsa-devel@alsa-project.org>; Wed, 16 Oct 2019 01:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Xo35Bg7+wZLq9WAYiOuUcTZRMp2CbtvKNgMqelyARTU=;
 b=eFXeazm0o1tL5yIT8cIoz4Wk8anNWAsBOAqZuTJLrcmF2+ZuFXcPF5UVUCWL7aIqil
 IPv3kOP6K1GOt7SHle1XCTL3se7HLV7MPcGNg3WcrI60YQPfUEAm9aUokJNKOpR2EbAA
 e78DxjS58Ht4pQMlOpK4jhBzKtIqSy4nCyWtSESafH71SkFiMrXk5gnX5z+kGwZe4s+D
 y2VQBtcVTbKENFN9vL8/vc6TXOxscGJmF/Jq1j1cum1G2Fb3HvotNml0i/JH6jiGyldY
 NROzHm86nPDDviCEMqX2kExhGpQbdpmN4YLu0WJPUUraOjC0mX+NYkDkyo+WQAtLFgIE
 8RcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xo35Bg7+wZLq9WAYiOuUcTZRMp2CbtvKNgMqelyARTU=;
 b=Zto4hCZawtWiDToNdJTuuikOFJR/9qLrRohwp9lYgNKVVSPVL+9BQ9E1dTg6k7rbpp
 MjVh515JtuXdj8RANeb8o342neT5QrqbcUkXpllFf/0mAHCJNMtuwEI/LondOxtW12Fb
 O2A4F24vC4pSmYvWpdOw18l9LoQAof10JstTkYP/+cOnPNeFZBdogq1uDv7qO6oN8Q7G
 a902oG01nrMVdn3CpJotLUkpPXlAW8FrBMBHGg06CgUM94RsZHXeqkuFLjpk2DxNMVKv
 h785X0PH9UNtg8BGJ0dipjoZqDBwmMXA6BNmo0x3B4V8QshFs2ryQYK5BpFPQIfx+JBJ
 XUpg==
X-Gm-Message-State: APjAAAVPPBlhH5SSeeaHLtxZDWsPV/oE+SdV6zcmQ5dg6M+q2PyUIHDc
 U/EnHX4fNTJGPq9aR1ltSgmTAu0TOpP4BQjvhMM=
X-Google-Smtp-Source: APXvYqztWV5plJBF/+oigJru3O+68vfnDX1Uj5DGkapsvD7/tG4QkaKTaiMATHeFnEyKvPu9+4MV2xK2aaXCm/MiANI=
X-Received: by 2002:a19:6f0e:: with SMTP id k14mr24108061lfc.34.1571214340972; 
 Wed, 16 Oct 2019 01:25:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191016070740.121435-1-codekipper@gmail.com>
 <20191016070740.121435-3-codekipper@gmail.com>
 <20191016080653.3seixioa2xiaobd7@gilmour>
In-Reply-To: <20191016080653.3seixioa2xiaobd7@gilmour>
From: Code Kipper <codekipper@gmail.com>
Date: Wed, 16 Oct 2019 10:25:29 +0200
Message-ID: <CAEKpxBmuYe-kHpa4cvo6iabTM_qNro2hXVAkjioBZFt9N4pHdA@mail.gmail.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "Andrea Venturi \(pers\)" <be17068@iperbole.bo.it>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [alsa-devel] [PATCH v6 2/7] ASoC: sun4i-i2s: Add functions for
 RX and TX channel offsets
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

On Wed, 16 Oct 2019 at 10:06, Maxime Ripard <mripard@kernel.org> wrote:
>
> Hi,
>
> On Wed, Oct 16, 2019 at 09:07:35AM +0200, codekipper@gmail.com wrote:
> > From: Marcus Cooper <codekipper@gmail.com>
> >
> > Newer SoCs like the H6 have the channel offset bits in a different
> > position to what is on the H3. As we will eventually add multi-
> > channel support then create function calls as opposed to regmap
> > fields to add support for different devices.
> >
> > Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> > ---
> >  sound/soc/sunxi/sun4i-i2s.c | 31 +++++++++++++++++++++++++------
> >  1 file changed, 25 insertions(+), 6 deletions(-)
> >
> > diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
> > index f1a80973c450..875567881f30 100644
> > --- a/sound/soc/sunxi/sun4i-i2s.c
> > +++ b/sound/soc/sunxi/sun4i-i2s.c
> > @@ -157,6 +157,8 @@ struct sun4i_i2s_quirks {
> >       int     (*set_chan_cfg)(const struct sun4i_i2s *,
> >                               const struct snd_pcm_hw_params *);
> >       int     (*set_fmt)(struct sun4i_i2s *, unsigned int);
> > +     void    (*set_txchanoffset)(const struct sun4i_i2s *, int);
> > +     void    (*set_rxchanoffset)(const struct sun4i_i2s *);
>
> The point of removing the regmap_field was that because having a
> one-size-fits-all function with regmap_field sort of making the
> abstraction was becoming more and more of a burden to maintain.
>
> Having functions for each and every register access is exactly the
> same as using regmap_field here, and the issue we adressed is not with
> regmap_fields in itself.
>
> If the H6 has a different register layout, then so be it, create a new
> set_chan_cfg or set_fmt function for the H6.
The H3 and the H6 have a similar register layout but the issue here is
that sooner
rather than later we would want to be supporting multi-channel audio
which requires the
offset to be applied to each TX channel channel select register(8chan
PCM for HDMI
requires 4 Tx channels). Currently we're only using one.
BR,
CK
>
> Maxime
_______________________________________________
Alsa-devel mailing list
Alsa-devel@alsa-project.org
https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
