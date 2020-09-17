Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB1B26DD4A
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 15:57:50 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 517A91681;
	Thu, 17 Sep 2020 15:57:00 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 517A91681
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600351070;
	bh=2jrBKqKQYC6+vUb3ebXkO1vJePh1ZuqzCyAnBTQWz08=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=LIpzUA6S7bfRz/lkUhmO6w528BUjhKvL8QUttCrWAH38WGY35xBTG3zYMa2jnNFaZ
	 Hk7YkjfKVmYUFCNqi0Y6NWW88r+t7xrhFD9jRYBpwpCxeGLocqrtmmqJIQL6bnniX0
	 JjZXeI3niKpO5E6Fh8kvR1txJ3kX6g9XumU8eGz0=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 55BA6F8025E;
	Thu, 17 Sep 2020 15:56:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id D6025F80212; Thu, 17 Sep 2020 15:56:06 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,PRX_BODY_76,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
 autolearn=disabled version=3.4.0
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 1EC93F80134
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 15:55:58 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1EC93F80134
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.b="bPyMVM6N"
Received: by mail-io1-xd44.google.com with SMTP id z25so2230948iol.10
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2jrBKqKQYC6+vUb3ebXkO1vJePh1ZuqzCyAnBTQWz08=;
 b=bPyMVM6NEQR7Qz2I3gkQq4PfWQkY4ABpxZkCX364BqmAgtMi3KZ0pLxHIuPiKB8kVz
 LBf0pQhZcPaJJ/FY2KYphDrKPh3vHE1dGBICHj0CP3JvDw5EpF8zpb7HEFjRgrGrmBEr
 45x2kaUN8dtZl+IcF0csmcG08cMruUza9vV5LlVKvCOGPH9mYqKz1veGOa9tusBefxsx
 y5RP0Z3xCABg3Cpf9F27onzefISiQzqOXJAj6vSKLSipFwJNK8vAXUSTVZg2Bq0IWVxF
 Wovdj4MNnaLZ6+LP388lBagSDtz4/3n8QmCvI23AP7FUMHhUdv+MwZFmhTolt+SLPCvP
 PiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2jrBKqKQYC6+vUb3ebXkO1vJePh1ZuqzCyAnBTQWz08=;
 b=j6mwz6dOmkOo15d57gqaPywitl5bgz0tbUC4TDwJ42KUTMLM5HXdxr/NRlM4L7klgh
 8T49raWUer6zY1vY/kAF3537MsGgQ34wBmLWt5xTTsM//u9BXDvRK9ON36lzaR0RulAq
 Ys6RUc/ZzBPYhOyTx7KKD/Yr2yOK7CGXpMhTmDZvy1UTVusmZ27cGkCDTGUCDTRxZXAi
 coe18YGQ4CIdlSoAFNms5loLRVoJnKLXp9ljGqEjF1xZWrKYq8HxgllPFPQcZGpc3gMs
 BNOG66k8PKi9i5cvVMx4U2YuO6hi1SFpO1X9I6DVqqFek7PL+nEfxzrZBM6+eOnYqiZ1
 vJbg==
X-Gm-Message-State: AOAM5313ej3EsCzaHEKXZq+YtLfqcvBDDApaR5OfkUuyit5xdO0rO4jU
 rkqUJz2ngigX6Vu2tQhF1Nzh8XAF5UoacQF3YEY=
X-Google-Smtp-Source: ABdhPJw38P4GTdYIQhTX2C1j1TDaFP7ucC25qrcwBgz9aXTHrGXpHgn8N9b40QJ1hCeE5yPvuPYIiKqxNafH8lnCiDw=
X-Received: by 2002:a02:734f:: with SMTP id a15mr27150294jae.120.1600350956955; 
 Thu, 17 Sep 2020 06:55:56 -0700 (PDT)
MIME-Version: 1.0
References: <CAJiuCcf_LHrJ6QdZgH8HyN6TRiT+GiD+t4UggFCrz-VwVHXV6w@mail.gmail.com>
 <20200504120942.lnrxnnmykqnvw3fb@gilmour.lan>
 <CAJiuCceF340FiLvyeXNZtvqftQMAmk=MtFDLT_9696ix+eH1Yw@mail.gmail.com>
 <20200729143927.47f5tbuaob4ph3lp@gilmour.lan>
 <20200729151548.GB5612@sirena.org.uk>
 <CAJiuCcdf=TNLPTUPzHP9NzPHqdxG06TRDkQfONY+ScK0DV_v5w@mail.gmail.com>
 <20200903205851.gdnpthserywsxrbs@gilmour.lan>
 <80b5a4e3-c8bc-9521-4ff1-12bb6424516f@sholland.org>
 <20200910143314.qku7po6htiiq5lzf@gilmour.lan>
 <57f8bdeb-14dc-583e-ffa8-43d7a9f1bb24@sholland.org>
 <20200917132128.e6z4gwoluipbzigm@gilmour.lan>
In-Reply-To: <20200917132128.e6z4gwoluipbzigm@gilmour.lan>
From: =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>
Date: Thu, 17 Sep 2020 15:55:45 +0200
Message-ID: <CAJiuCcdWQRVMeTLvxibZ37CF9BMiC_L2bWBDiin2Uz0CWq2FuQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/7] ASoC: sun4i-i2s: Add support for H6 I2S
To: Maxime Ripard <maxime@cerno.tech>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
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

Hi Maxime and Samuel,

On Thu, 17 Sep 2020 at 15:21, Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi,
>
> On Sat, Sep 12, 2020 at 03:29:55PM -0500, Samuel Holland wrote:
> > On 9/10/20 9:33 AM, Maxime Ripard wrote:
> > > On Thu, Sep 03, 2020 at 09:54:39PM -0500, Samuel Holland wrote:
> > >> On 9/3/20 3:58 PM, Maxime Ripard wrote:
> > >>> On Thu, Sep 03, 2020 at 10:02:31PM +0200, Cl=C3=A9ment P=C3=A9ron w=
rote:
> > >>>> Hi Maxime,
> > >>>>
> > >>>> On Wed, 29 Jul 2020 at 17:16, Mark Brown <broonie@kernel.org> wrot=
e:
> > >>>>>
> > >>>>> On Wed, Jul 29, 2020 at 04:39:27PM +0200, Maxime Ripard wrote:
> > >>>>>
> > >>>>>> It really looks like the polarity of LRCK is fine though. The fi=
rst word
> > >>>>>> is sent with LRCK low, and then high, so we have channel 0 and t=
hen
> > >>>>>> channel 1 which seems to be the proper ordering?
> > >>
> > >> Which image file is this in reference to?
> > >>
> > >>>>> Yes, that's normal.
> > >>>>
> > >>>> Thank you very much for this test.
> > >>>>
> > >>>> So I will revert the following commit:
> > >>>>
> > >>>> ASoC: sun4i-i2s: Fix the LRCK polarity
> > >>>>
> > >>>> https://github.com/clementperon/linux/commit/dd657eae8164f7e4bafe8=
b875031a7c6c50646a9
> > >>>
> > >>> Like I said, the current code is working as expected with regard to=
 the
> > >>> LRCK polarity. The issue is that the samples are delayed and start =
to be
> > >>> transmitted on the wrong phase of the signal.
> > >>
> > >> Since an I2S LRCK frame is radially symmetric, "wrong phase" and "in=
verted
> > >> polarity" look the same. The only way to definitively distinguish th=
em is by
> > >> looking at the sample data.
> > >>
> > >> In "i2s-h6.png", the samples are all zeroes, so you're assuming that=
 the first
> > >> sample transmitted (that is, when the bit clock starts transitioning=
) was a
> > >> "left" sample.
> > >>
> > >> However, in "h6-i2s-start-data.png", there are pairs of samples we c=
an look at.
> > >> I'm still assuming that similar samples are a left/right pair, but t=
hat's
> > >> probably a safe assumption. Here we see the first sample in each pai=
r is
> > >> transmitted with LRCK *high*, and the second sample in the pair is t=
ransmitted
> > >> with LRCK *low*. This is the opposite of your claim above.
> > >>
> > >> An ideal test would put left/right markers and frame numbers in the =
data
> > >> channel. The Python script below can generate such a file. Then you =
would know
> > >> how much startup delay there is, which channel the "first sample" ca=
me from, and
> > >> how each channel maps to the LRCK level.
> > >>
> > >> It would also be helpful to test DSP_A mode, where the LRCK signal i=
s
> > >> asymmetric and an inversion would be obvious.
> > >
> > > I had no idea that there was a wave module in Python, that's a great
> > > suggestion, thanks!
> > >
> > > You'll find attached the screenshots for both the I2S and DSP_A forma=
ts.
> > > I zoomed out a bit to be able to have the first valid samples, but it
> > > should be readable.
> > >
> > > The code I used is there:
> > > https://github.com/mripard/linux/tree/sunxi/h6-i2s-test
> > >
> > > It's basically the v3, plus the DT bits.
> > >
> > > As you can see, in the i2s case, LRCK starts low and then goes up, wi=
th
> > > the first channel (0x2*** samples) transmitted first, so everything
> > > looks right here.
> > >
> > > On the DSP_A screenshot, LRCK will be low with small bursts high, and
> > > once again with the first channel being transmitted first, so it look=
s
> > > right to me too.
> >
> > Indeed, for H6 i2s0 with LRCK inversion in software, everything looks c=
orrect on
> > the wire.
> >
> > It's still concerning to me that the BSP has no evidence of this invers=
ion,
> > either for i2s0 or i2s1[1]. And the inversion seems not to be required =
for HDMI
> > audio on mainline either (but there could be an inversion on the HDMI s=
ide or on
> > the interconnect).
>
> One can only guess here, but it's also quite easy to fix it at the card
> level (or maybe there's a similar inversion in the codecs, or whatever).

Thanks for the test and the explanation.

Quite disturbing that there is no evidence of the LRCK inversion in
kernel vendor indeed...
Could it be an issue with the mainline code?

But still regarding the kernel vendor, it seems logical to have a
frame-inversion in the device-tree for the HDMI I2S node.
I will drop the revert patch and re-add the frame inversion in the next ser=
ies.

Regards,
Clement

>
> > Even so, your research is sufficient justification for me that the code=
 is
> > correct as-is (with the inversion). Thank you very much for collecting =
the data!
>
> You're welcome, thanks for that script :)
>
> maxime
