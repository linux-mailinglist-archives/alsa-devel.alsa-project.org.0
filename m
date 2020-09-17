Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DE226DCB8
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Sep 2020 15:23:35 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id E6A141665;
	Thu, 17 Sep 2020 15:22:44 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz E6A141665
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1600349015;
	bh=FCFpxRl+TpfAF97lnfZg4FGlQVJhgvr3MRsWWhP+MLE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=mKs68AwBCboN4fUhSx0NqguaNs4KmcMw95uRQT9FlOZSiauJZvYSrKrrlkFaxoWeh
	 KaUaJoYu0UM3TNP2XOGI+cg3nkkoVzVlF5lCUK73Qaoo3HIYdoreQvbkY+GvOeNM54
	 ih/b9lN6gJI2o6TJWaNo35qHkqolFFlQKiul+VYc=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 03883F8025E;
	Thu, 17 Sep 2020 15:21:54 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE0C2F80212; Thu, 17 Sep 2020 15:21:46 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,PRX_BODY_76,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.0
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com
 [64.147.123.17])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id DBAD8F800E8
 for <alsa-devel@alsa-project.org>; Thu, 17 Sep 2020 15:21:35 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz DBAD8F800E8
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="o2rjWGbb"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="mZLQVPsj"
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailnew.west.internal (Postfix) with ESMTP id E753C3AA;
 Thu, 17 Sep 2020 09:21:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 17 Sep 2020 09:21:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=FCFpxRl+TpfAF97lnfZg4FGlQVJ
 hgvr3MRsWWhP+MLE=; b=o2rjWGbbC8f6RrteOgIG0VAHk8Xjm94lXVF4UpGCvTn
 JSmdon+LRGALXVMNevTbBKc1viZnmNct66v1VpvnVUv3BsRIFYHDJrQztSUieI1s
 mLHa4KgbNftF7VRLzBemg1+nENnDXoUo87LVI7rVCdRdUCvwgSZLPr0sTKYtp0Ou
 6XlHw0muDczEg52ugKC+3l+e0N7Pi1LWJ1EhG37PwGvU/MIBIuEMcJeQ3VWh/M+N
 gqYu556ppD+b4FQ0ErH4m4yrOLOh9IIMCvkqDwZ5ezmtLb43sORc87E/BruFoLNu
 a+EvQ+aLa+ShHBybuGh0IxSOF597Owz6L2fcvH4hroQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=FCFpxR
 l+TpfAF97lnfZg4FGlQVJhgvr3MRsWWhP+MLE=; b=mZLQVPsjUDHzQmKY7A7M4o
 sj6U3ElU03xrXmP+mOlQ3IaU63ZdQJvHMpQP05kCAlvps99TCOn6humM8jnUWESj
 zj4BpFtw70eEJ8SYnevs2QHUWiVCy1gT5ytixVwvBJqGjU+Kd6lQVNvd6RVGLOY6
 TNXaVBzqFTl8lw2xmyjYJN6LQXayrii5avGfEOiF1wQr/9ojIG9IxReMwuD4+fSi
 /37+VgihLZi0JwbY+pMiORl5yF21EWbPjPyKKg32KWyNOeQJJWoT26XxH5sOHJVq
 rSsUi3mvNvh+3dR8fUiWM8/9ug7/diZ14pGd8PfMid3JuQx/mLmPUNE8Sm4UQJ2g
 ==
X-ME-Sender: <xms:2WJjX0qTOGzPOYQ7arCvfM2MqpGyW65zpk5Y81HXSwpm11n73zhZ6A>
 <xme:2WJjX6pOmSTnU95NXg8o6WjiC8OmPTtftFQNeuKadJFYcDgvSd6DYeXHq_feTV_Nv
 3REhBLF2-n4YQjwTDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrtdeggdeihecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeetgfejtdelgeffffeitdfhtddvfeeijeffteelkefhledvvefggfdujeegieeg
 hfenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeeltddrkeelrdeikedrje
 einecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgr
 gihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:2WJjX5OSCzqWvVOn3hkTmWVyV9cfoAtduwdmWQ2K1NKfyfPR5RfOKQ>
 <xmx:2WJjX77mBPuog4gCj8GmOSpqjp-O1pyaYnp504vABtxSOTxAPFykMQ>
 <xmx:2WJjXz630P-hsgNkWexIfWQfwS5l2uVhpKq4t8qkuydDIfqIBJCvsA>
 <xmx:22JjX3hGxXg2_UvirKaz7Rs-yWZMIKtTTHJFqw0aE0vKOofrC56QOkuioSs>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id A72293064674;
 Thu, 17 Sep 2020 09:21:29 -0400 (EDT)
Date: Thu, 17 Sep 2020 15:21:28 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v3 3/7] ASoC: sun4i-i2s: Add support for H6 I2S
Message-ID: <20200917132128.e6z4gwoluipbzigm@gilmour.lan>
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
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="g5lgblp7ammz5zgk"
Content-Disposition: inline
In-Reply-To: <57f8bdeb-14dc-583e-ffa8-43d7a9f1bb24@sholland.org>
Cc: devicetree <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Marcus Cooper <codekipper@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>, Mark Brown <broonie@kernel.org>,
 =?utf-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
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


--g5lgblp7ammz5zgk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 12, 2020 at 03:29:55PM -0500, Samuel Holland wrote:
> On 9/10/20 9:33 AM, Maxime Ripard wrote:
> > On Thu, Sep 03, 2020 at 09:54:39PM -0500, Samuel Holland wrote:
> >> On 9/3/20 3:58 PM, Maxime Ripard wrote:
> >>> On Thu, Sep 03, 2020 at 10:02:31PM +0200, Cl=E9ment P=E9ron wrote:
> >>>> Hi Maxime,
> >>>>
> >>>> On Wed, 29 Jul 2020 at 17:16, Mark Brown <broonie@kernel.org> wrote:
> >>>>>
> >>>>> On Wed, Jul 29, 2020 at 04:39:27PM +0200, Maxime Ripard wrote:
> >>>>>
> >>>>>> It really looks like the polarity of LRCK is fine though. The firs=
t word
> >>>>>> is sent with LRCK low, and then high, so we have channel 0 and then
> >>>>>> channel 1 which seems to be the proper ordering?
> >>
> >> Which image file is this in reference to?
> >>
> >>>>> Yes, that's normal.
> >>>>
> >>>> Thank you very much for this test.
> >>>>
> >>>> So I will revert the following commit:
> >>>>
> >>>> ASoC: sun4i-i2s: Fix the LRCK polarity
> >>>>
> >>>> https://github.com/clementperon/linux/commit/dd657eae8164f7e4bafe8b8=
75031a7c6c50646a9
> >>>
> >>> Like I said, the current code is working as expected with regard to t=
he
> >>> LRCK polarity. The issue is that the samples are delayed and start to=
 be
> >>> transmitted on the wrong phase of the signal.
> >>
> >> Since an I2S LRCK frame is radially symmetric, "wrong phase" and "inve=
rted
> >> polarity" look the same. The only way to definitively distinguish them=
 is by
> >> looking at the sample data.
> >>
> >> In "i2s-h6.png", the samples are all zeroes, so you're assuming that t=
he first
> >> sample transmitted (that is, when the bit clock starts transitioning) =
was a
> >> "left" sample.
> >>
> >> However, in "h6-i2s-start-data.png", there are pairs of samples we can=
 look at.
> >> I'm still assuming that similar samples are a left/right pair, but tha=
t's
> >> probably a safe assumption. Here we see the first sample in each pair =
is
> >> transmitted with LRCK *high*, and the second sample in the pair is tra=
nsmitted
> >> with LRCK *low*. This is the opposite of your claim above.
> >>
> >> An ideal test would put left/right markers and frame numbers in the da=
ta
> >> channel. The Python script below can generate such a file. Then you wo=
uld know
> >> how much startup delay there is, which channel the "first sample" came=
 from, and
> >> how each channel maps to the LRCK level.
> >>
> >> It would also be helpful to test DSP_A mode, where the LRCK signal is
> >> asymmetric and an inversion would be obvious.
> >=20
> > I had no idea that there was a wave module in Python, that's a great
> > suggestion, thanks!
> >=20
> > You'll find attached the screenshots for both the I2S and DSP_A formats.
> > I zoomed out a bit to be able to have the first valid samples, but it
> > should be readable.
> >=20
> > The code I used is there:
> > https://github.com/mripard/linux/tree/sunxi/h6-i2s-test
> >=20
> > It's basically the v3, plus the DT bits.
> >=20
> > As you can see, in the i2s case, LRCK starts low and then goes up, with
> > the first channel (0x2*** samples) transmitted first, so everything
> > looks right here.
> >=20
> > On the DSP_A screenshot, LRCK will be low with small bursts high, and
> > once again with the first channel being transmitted first, so it looks
> > right to me too.
>=20
> Indeed, for H6 i2s0 with LRCK inversion in software, everything looks cor=
rect on
> the wire.
>=20
> It's still concerning to me that the BSP has no evidence of this inversio=
n,
> either for i2s0 or i2s1[1]. And the inversion seems not to be required fo=
r HDMI
> audio on mainline either (but there could be an inversion on the HDMI sid=
e or on
> the interconnect).

One can only guess here, but it's also quite easy to fix it at the card
level (or maybe there's a similar inversion in the codecs, or whatever).

> Even so, your research is sufficient justification for me that the code is
> correct as-is (with the inversion). Thank you very much for collecting th=
e data!

You're welcome, thanks for that script :)

maxime

--g5lgblp7ammz5zgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX2Ni2AAKCRDj7w1vZxhR
xZmxAQD7LzQw0dqow218wrv2eoIFHwL+zK66hEeo26ch4WCnrwEA32DthF+KSe6e
A+J30e1noRJXGztaLsaFPAGzPvzbKgk=
=AqGp
-----END PGP SIGNATURE-----

--g5lgblp7ammz5zgk--
