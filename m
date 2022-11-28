Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0471063A6E8
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Nov 2022 12:16:01 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 7E54E167B;
	Mon, 28 Nov 2022 12:15:10 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 7E54E167B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1669634160;
	bh=7GWy/HZURP7kMNKMNx5mxkRaTewkp7+VeIcL5aODmfI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EmzRAkKqBWkFwCuh/OuBAVmjINE7QXmUBG/U4yjPPOrvDLUiQC7VbsWHRaWasnLmu
	 jlQ808Fqwi9uifBigIAMi4tZopT4zqtq22kmgPCUiEW0LvS2op6VvT3rXeYu85Zbj/
	 qJ3B/yIZQ3b0mdhcogV20h0GAQA890G1k5lnVwRQ=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id E253EF800B6;
	Mon, 28 Nov 2022 12:15:04 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 5A6D4F8020D; Mon, 28 Nov 2022 12:15:03 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-4.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_76,RCVD_IN_DNSWL_HI,
 RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com
 [IPv6:2607:f8b0:4864:20::1130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 18300F80166
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 12:14:56 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 18300F80166
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="T/Mhjgcw"
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-3c21d6e2f3aso41492187b3.10
 for <alsa-devel@alsa-project.org>; Mon, 28 Nov 2022 03:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WOjBP/a3tIfO/JuYbG6N9UwdTZiM5SS4BwherX0QzWg=;
 b=T/MhjgcwIgu3mLxG3naRtnBkvr/vmkN4Rnv0Z3LDKgmKFB9uXCO0XqAV3a7Ig0HWfF
 rmzLQTL78ffj0rT0F6pgKffsqR43UCBxVTJ3jcYzqoxpfj4FjLw+UIU5hsVqI0WVorTF
 Ldri2+KKn061eMX5AAfca1g4KEGhDYFEcRsqtovZTJ8HhBLvcGuYgoX40T5kjkLgFmlu
 xOKlTSRRkCkOtZxDd6/t2LU7jzLjW0+DEY7FFUgQ8mQB4V64TVv1M5cPyvlepDs9/Bwe
 4Y2h3YmBrhquUT7iAA1UQRbpVrEniNkM2NpM846W9yglUnNzPehzmSeF+93IbEW1p0iG
 +h7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WOjBP/a3tIfO/JuYbG6N9UwdTZiM5SS4BwherX0QzWg=;
 b=eGSNxjCqYzcecgCoR10+ewT9NkRE0Jb0KaChFeoeyAulJ8VjR0tnNkxMAIonhWNSev
 kl3VQAf6O3YllGBWrkXxN+hYMs/el6fb5MhDXPjVa6RYpqxwvqxzOHAnLhONkj5ubwJN
 1+mHiW4Fsx1fwcD6xU4suSBjQ+kbhJ9UtMiYmiPjbMhEc8xEwGUSzCxYOLa6xrFW8nrt
 aUYbz4H0izD71Rfaz+Yvp0pE7TUJd0jW4D0hQG7hX8ISo7hFJivNb61QRiWJdXHw22nC
 UzaHCXsCqJoHg+mR2GHSrIP8Q4fA609uoLwuSH4jMrOPlnYaSWyrqmg+8vDWKzi0y3nT
 rFJw==
X-Gm-Message-State: ANoB5pliarYznh2FkeJqgVra3FKk1/PJt+Gy66rbQq15a2egIzEg1wms
 riMZpOv85v0WZzavWE3zInknj8Naz06eVPaVXak=
X-Google-Smtp-Source: AA0mqf5Nf/GNUDk7nPuo0hMGqx4AAGxuFJY2dsu/B/Rd4MDVR8tULlurXgag+5Rh0H3yTvm0mbJy7VwwjmnNi2A6kuQ=
X-Received: by 2002:a81:4a09:0:b0:38e:b5bc:e996 with SMTP id
 x9-20020a814a09000000b0038eb5bce996mr48998865ywa.493.1669634094886; Mon, 28
 Nov 2022 03:14:54 -0800 (PST)
MIME-Version: 1.0
References: <20221125163748.1288942-1-ckeepax@opensource.cirrus.com>
 <20221125163748.1288942-2-ckeepax@opensource.cirrus.com>
 <CABDcavbtBBU7ySPK32104nZB5RHf2=LFuOOYOF-Ze1EDoM+etw@mail.gmail.com>
 <20221128094829.GH105268@ediswmail.ad.cirrus.com>
In-Reply-To: <20221128094829.GH105268@ediswmail.ad.cirrus.com>
From: Guillermo Rodriguez Garcia <guille.rodriguez@gmail.com>
Date: Mon, 28 Nov 2022 12:14:43 +0100
Message-ID: <CABDcavZy0xki9BRr350aV3Mv1NGe3hDTSGi2NY30T3brTmnzQg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: cs42l51: Correct PGA Volume minimum value
To: Charles Keepax <ckeepax@opensource.cirrus.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 lgirdwood@gmail.com, david.rhodes@cirrus.com, broonie@kernel.org,
 james.schulman@cirrus.com, linux-kernel@vger.kernel.org
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

El lun, 28 nov 2022 a las 10:48, Charles Keepax
(<ckeepax@opensource.cirrus.com>) escribi=C3=B3:
>
> On Sat, Nov 26, 2022 at 12:15:10PM +0100, Guillermo Rodriguez Garcia wrot=
e:
> > El vie, 25 nov 2022 a las 17:37, Charles Keepax
> > (<ckeepax@opensource.cirrus.com>) escribi=C3=B3:
> > >
> > > The table in the datasheet actually shows the volume values in the wr=
ong
> > > order, with the two -3dB values being reversed. This appears to have
> > > caused the lower of the two values to be used in the driver when the
> > > higher should have been, correct this mixup.
> > >
> > > Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> > > ---
> > >
> > > No changes since v1.
> > >
> > >  sound/soc/codecs/cs42l51.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/sound/soc/codecs/cs42l51.c b/sound/soc/codecs/cs42l51.c
> > > index 51721edd8f53c..e88d9ff95cdfc 100644
> > > --- a/sound/soc/codecs/cs42l51.c
> > > +++ b/sound/soc/codecs/cs42l51.c
> > > @@ -143,7 +143,7 @@ static const struct snd_kcontrol_new cs42l51_snd_=
controls[] =3D {
> > >                         0, 0xA0, 96, adc_att_tlv),
> > >         SOC_DOUBLE_R_SX_TLV("PGA Volume",
> > >                         CS42L51_ALC_PGA_CTL, CS42L51_ALC_PGB_CTL,
> > > -                       0, 0x19, 30, pga_tlv),
> > > +                       0, 0x1A, 30, pga_tlv),
> >
> > The original patch where this control was added [1] already used 0x1A,
> > however this was later changed to 0x19 in [2]. Your patch now reverts
> > that change. Does this mean [2] was incorrect? If that is the case,
> > shouldn't the commit message for this patch mention that it fixes [2]
> > ?
> >
> >  [1]: https://lore.kernel.org/all/20200918134317.22574-1-guille.rodrigu=
ez@gmail.com/
> >  [2]: https://lore.kernel.org/all/20220602162119.3393857-7-ckeepax@open=
source.cirrus.com/
> >
>
> Hmm... good digging, I didn't realise it was me who broke that.
> Apologies in that chain I went around and checked a bunch of SX
> controls to make sure they matched the datasheets, but it seems
> I got a bit confused by the weird ordering of the values in the
> datasheet. Since you have hardware would you be able to check,
> before we merge this revert? A simple check that writing 0 to the
> control sets the register value to 0x1A and writing 30 sets the
> register to 0x18 would suffice.

Just checked. The values are correct after applying the patch:

$ amixer cset name=3D'PGA Volume' '0','0'
$ i2cget -y -f  2 0x4A 0x0A
0x1a
$ i2cget -y -f  2 0x4A 0x0B
0x1a
$ amixer cset name=3D'PGA Volume' '30','30'
$ i2cget -y -f  2 0x4A 0x0A
0x18
$ i2cget -y -f  2 0x4A 0x0B
0x18

BR,

Guillermo Rodriguez Garcia
guille.rodriguez@gmail.com
