Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C9F65C3AE
	for <lists+alsa-devel@lfdr.de>; Tue,  3 Jan 2023 17:17:11 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 064162CB5;
	Tue,  3 Jan 2023 17:16:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 064162CB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1672762631;
	bh=fRnV6HJZy0l413BAw85MVar89rZtdB7QolzvCeFzCGk=;
	h=Date:From:To:Subject:References:In-Reply-To:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EHjfq+cW8iT6CNWQQHmZLjMhniHLu/1AeF5uqxj6yyMbbidvDpVhg6wTOzFdh9GYW
	 MDTc0xQRvCKpQUr5dwFuFMtysmGJ9JoWj+m7U/LQA3zCFU3yT4cqfpad8o8DCNIJLJ
	 Vy+HW7WxVAF3P07BEgi6xWckZc1+iJF1vJm4thz4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id A6B30F803DC;
	Tue,  3 Jan 2023 17:16:11 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1F02EF803DC; Tue,  3 Jan 2023 17:16:09 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,
 SPF_HELO_PASS,SPF_PASS,URIBL_BLOCKED shortcircuit=no autolearn=ham
 autolearn_force=no version=3.4.6
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 82BABF804AD
 for <alsa-devel@alsa-project.org>; Tue,  3 Jan 2023 17:16:00 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 82BABF804AD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key, unprotected) header.d=cerno.tech header.i=@cerno.tech
 header.a=rsa-sha256 header.s=fm3 header.b=pjCYKo7g; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=j531BDLW
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 2C3583200902;
 Tue,  3 Jan 2023 11:15:55 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 03 Jan 2023 11:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1672762554; x=1672848954; bh=wNHGYeVYFI
 zxBf24jgwJU2T/wl2hD0aiCUszvE1r6qc=; b=pjCYKo7gkCK5f2pIymt6QPnLBC
 1DAk7msGDlygQAQNqEVyCIpFaOyMgaHSi40KVwP+w+L6RrW2p5XYYI1VqB3rG7dx
 KEjGnr8HJwsjwZoQRvabZE5YxL8qXbJz8wRykSz3ERcPZx7n7E/OG+hl11/vLkbg
 a06mvms0SGOqlyX0iMJ83oydOETkNwpTTu7grzSiLToon31tLFhkz4o7eh5iBou4
 MxVnC/ZDnvM9P94hvHrcDURJq58ZYxwA3SlT3lGqJlK0eSF0GPHMddpVHO2ldnjB
 uhG30YyVqwEtr/cCfgAAU1RUwWaiMmfwyBP76iCkiVBIeOBs/K8Nobgq0IpQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1672762554; x=1672848954; bh=wNHGYeVYFIzxBf24jgwJU2T/wl2h
 D0aiCUszvE1r6qc=; b=j531BDLWxm/ohYQJ7nDDhf9HZ38aqVzvC/s9TGxSWFOF
 iiYyCfot5ViuJBPsApS5/UR9lIF4taTuAL4+nbDvqMjQkZGhHU9h03T8aaJaQjHJ
 KTOMF2W1onoAb/5nUCjwe3LJeMQJeuG9q89F1Y0ozgV/zdROkYA9crYI+U05Jvmt
 nCvLmp92lk26OKxFnXrgHeSFA3iVvwxkR69pcDKumWR3J0EWWdDUkd0mLpuBi97M
 l/88gmqhLrZQCuPWRLEuc553zwBBHOTY2e+B+OrNT8lgoICwo/vmtj+9+DkWcXSd
 NotMN9hkOPXxvXxGe/ixjYNbxBvbmJ+YFvUJxxpuLg==
X-ME-Sender: <xms:uVS0YzB0JXSRVIAi_tGC1otQM2RzPjHpcflhIgdzCVRZrzgRfROJDQ>
 <xme:uVS0Y5i0ix6UjpUCqv-WU3J8FLgiHnuLKXZKjl9oCftIjeoxe8ZhAZLuUMwa_4PBv
 ytZfM0HWcvHe6enzsA>
X-ME-Received: <xmr:uVS0Y-nMPMm_4ZZv6rRdHATK2kWWJIZJ8TVVp4gOFFT1RGkmP6Q_UDvLqCmbfQ35RACyLiq4fB9tjz0QGBKP9nEVd7kPF1FHT_4s6tSM4oeIJA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeeggdekiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnheptdelkeejiedufedvhfeiffetlefhiedvleeigfeiuefghfdvleeiffejieeg
 teejnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:uVS0Y1wBrIhxHWXikal4guApjH66SvtY4OcZSpj9b1-KrvPGX-uI8g>
 <xmx:uVS0Y4QAif-qqBka94NRhYpDVTtWsMhf5sxJwNSqoyhZC3swXYhcog>
 <xmx:uVS0Y4ZsYlbpnrqbDSwACwmC-fzNNOsr_D788yWirfW-kANxEbry5g>
 <xmx:ulS0Y7YS89FzmTs6M_WxvTPd4EyTSa5Y4NKV3wydY-ZSTc8dmhi46g>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Jan 2023 11:15:53 -0500 (EST)
Date: Tue, 3 Jan 2023 17:15:50 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v2 2/3] iommu/sound: Use component_match_add_of helper
Message-ID: <20230103161550.4tui3ihl65olvkd7@houat>
References: <20221222233759.1934852-1-sean.anderson@seco.com>
 <20221222233759.1934852-3-sean.anderson@seco.com>
 <7897d4a6-bf43-becd-3437-7a254f38f6be@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7v4zidzdfmuud6o5"
Content-Disposition: inline
In-Reply-To: <7897d4a6-bf43-becd-3437-7a254f38f6be@arm.com>
X-BeenThere: alsa-devel@alsa-project.org
X-Mailman-Version: 2.1.29
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
Cc: alsa-devel@alsa-project.org, Daniel Vetter <daniel@ffwll.ch>,
 Liam Girdwood <lgirdwood@gmail.com>, Sean Anderson <sean.anderson@seco.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Takashi Iwai <tiwai@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux.dev, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, David Airlie <airlied@gmail.com>,
 Yong Wu <yong.wu@mediatek.com>
Errors-To: alsa-devel-bounces@alsa-project.org
Sender: "Alsa-devel" <alsa-devel-bounces@alsa-project.org>


--7v4zidzdfmuud6o5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Robin,

On Tue, Jan 03, 2023 at 01:01:07PM +0000, Robin Murphy wrote:
> Hi Sean,
>=20
> On 22/12/2022 11:37 pm, Sean Anderson wrote:
> > Convert users of component_match_add_release with component_release_of
> > and component_compare_of to component_match_add_of.
> >=20
> > Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> > Acked-by: Mark Brown <broonie@kernel.org>
> > ---
> >=20
> > Changes in v2:
> > - Split off from helper addition
> >=20
> >   drivers/iommu/mtk_iommu.c    | 3 +--
> >   drivers/iommu/mtk_iommu_v1.c | 3 +--
> >   sound/soc/codecs/wcd938x.c   | 6 ++----
> >   3 files changed, 4 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> > index 2ab2ecfe01f8..483b7a9e4410 100644
> > --- a/drivers/iommu/mtk_iommu.c
> > +++ b/drivers/iommu/mtk_iommu.c
> > @@ -1079,8 +1079,7 @@ static int mtk_iommu_mm_dts_parse(struct device *=
dev, struct component_match **m
> >   		}
> >   		data->larb_imu[id].dev =3D &plarbdev->dev;
> > -		component_match_add_release(dev, match, component_release_of,
> > -					    component_compare_of, larbnode);
> > +		component_match_add_of(dev, match, larbnode);
>=20
> I've long since given up trying to make sense of how the DRM tree works, =
but
> the conflicting change is definitely already in mainline:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
?id=3Db5765a1b44bea9dfcae69c53ffeb4c689d0922a7

As far as I can see, that patch doesn't affect DRM at all, and the
commit you pointed to doesn't either, nor has it been merged through the
DRM tree.

Can you expand a bit on how we're involved in this, what we should
clarify or help with?

Maxime

--7v4zidzdfmuud6o5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY7RUtgAKCRDj7w1vZxhR
xdWgAQCl2SxPgHcEj92AdlH7Y2VvK6G5Bczcu2wrB4ZrHXVpawEAsJlD4MKrpINP
IZalK2KlJTqUilPQudOtqmCeQzWQqAo=
=cdeC
-----END PGP SIGNATURE-----

--7v4zidzdfmuud6o5--
