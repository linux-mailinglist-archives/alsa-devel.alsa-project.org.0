Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BD0183EEA
	for <lists+alsa-devel@lfdr.de>; Fri, 13 Mar 2020 03:00:07 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 5F3461784;
	Fri, 13 Mar 2020 02:59:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 5F3461784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1584064807;
	bh=5irsfwlruPbKmdZnzhZqyi4BrUKa/yhmCWkmJZOBJy8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PQ053mFQtPwQgLMoLzFOdD0Gxt+FVWyfTVicr76SQhTo1GGF5rVg8oKLNFzxDQDYI
	 7L3rNVVRUy0iq+R0r9pwykGA31Rl8Ep3v+pVQMKrlzCGLUfJMztbaQ51Oa/VHUr/bu
	 9W1weoHligxM5lA6Ba4xoUiJHBmWYC0VABt99UaI=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 77EB5F80086;
	Fri, 13 Mar 2020 02:58:26 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1807AF8020C; Fri, 13 Mar 2020 02:58:24 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,SURBL_BLOCKED,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id F0963F8013E
 for <alsa-devel@alsa-project.org>; Fri, 13 Mar 2020 02:58:17 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz F0963F8013E
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="pjSAOZwt"
Received: by mail-qt1-x843.google.com with SMTP id l21so6252729qtr.8
 for <alsa-devel@alsa-project.org>; Thu, 12 Mar 2020 18:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=88CKdz/NKjVak04/lN/5uD3uM5mQKrmtijz9vSkeFgg=;
 b=pjSAOZwt9ryPLjEr9Hn+KApbAgGbTkRLnUUH65gnKwCdCkYwq6qZSG+nWJ2u4BqHK0
 tY7/ToQXdluH6nYEh0LlaNONnotFWYeWQs7ksBcJwWZSMbZAKiWOCD/mpDmNLmNx73Zs
 gCrn6ASGGxo23xeiOF+49pKCeuxy0UG9CtM2APILEqad5ipMKu2R/gDgkETqpzZY0S9l
 KsgrTyJW49G/BOUCKMgudmmuBywylqv8Xu4EXoXh0YXqE5BxR3lmju3MMUSBinST6SAC
 uYWe7YaaLMmgtI9jRzkTANe0kcvacI7UN5ylAZgsiCvqfGuyG00pqVMrO+S0hdF49UYM
 RSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=88CKdz/NKjVak04/lN/5uD3uM5mQKrmtijz9vSkeFgg=;
 b=AIgDXQY5TC7dshXJfOLTvCxcYN9+n+VK6dZrRlveZuCa3N9bMvaE9x6c+wZzzQwIbn
 e34zpDQ8PSeP1mUWNMH/sPPrXOzxjSUUy2iliDPAyoJ1WV/IaMpbO0RSMQL++MRryAsJ
 OZAjfdaFzbcyOVTYsCYKl0HWbAzdQbm8aLQ3cz/HG3q4petoPLN2gilCKeW6lP2eLyRF
 QDoLcKnb/EkuWLX9HsWZ288/XkQlRtlUQwVYJxxz+W+2udqgiZU/Rpib4kvAWkHSYzWp
 iXWmAuXHDtsWV3uiqczXsIS8mDFxkf6LUuKchbZfu9oSnRQcrkt0a/VlJ0yu4pWnqDD+
 0CSA==
X-Gm-Message-State: ANhLgQ2rrNY108s0nBKMTmymW2Zs1X/KLVJTY1iUpEIMF8rgqVQSS83H
 VUvJ2dF+CT+5H8dmKq7R00qE1InheckQ9xnQkFA=
X-Google-Smtp-Source: ADFU+vvK5+cSY2SJjGHWhKW0xQKWTvae4atVpKpb9h+cuGuLEZkISiyaRiiGVQ5/eNNFTISVK0wd8Lq7pxHaHGITVPM=
X-Received: by 2002:ac8:5298:: with SMTP id s24mr10110299qtn.54.1584064696061; 
 Thu, 12 Mar 2020 18:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <24f69c50925b93afd7a706bd888ee25d27247c78.1583725533.git.shengjiu.wang@nxp.com>
 <20200309211943.GB11333@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20200309211943.GB11333@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 13 Mar 2020 09:58:05 +0800
Message-ID: <CAA+D8ANwQ_orAxtVCxsAOJ8b2bRxM9myD+N8Ce7okNZK7q9g9w@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: fsl_asrc: Add new property fsl,
 asrc-format
To: Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>
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

Hi Rob

On Tue, Mar 10, 2020 at 5:20 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Mar 09, 2020 at 11:58:28AM +0800, Shengjiu Wang wrote:
> > In order to support new EASRC and simplify the code structure,
> > We decide to share the common structure between them. This bring
> > a problem that EASRC accept format directly from devicetree, but
> > ASRC accept width from devicetree.
> >
> > In order to align with new ESARC, we add new property fsl,asrc-format.
> > The fsl,asrc-format can replace the fsl,asrc-width, then driver
> > can accept format from devicetree, don't need to convert it to
> > format through width.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > index cb9a25165503..780455cf7f71 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > @@ -51,6 +51,11 @@ Optional properties:
> >                         will be in use as default. Otherwise, the big endian
> >                         mode will be in use for all the device registers.
> >
> > +   - fsl,asrc-format : Defines a mutual sample format used by DPCM Back
> > +                       Ends, which can replace the fsl,asrc-width.
> > +                       The value is SNDRV_PCM_FORMAT_S16_LE, or
> > +                       SNDRV_PCM_FORMAT_S24_LE
>
> I am still holding the concern at the DT binding of this format,
> as it uses values from ASoC header file instead of a dt-binding
> header file -- not sure if we can do this. Let's wait for Rob's
> comments.

Could you please share your comments or proposal about
Nicolin's concern?

best regards
wang shengjiu
