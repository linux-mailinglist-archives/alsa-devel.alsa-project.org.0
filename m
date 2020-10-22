Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D3E295FF6
	for <lists+alsa-devel@lfdr.de>; Thu, 22 Oct 2020 15:25:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 2A8B217DB;
	Thu, 22 Oct 2020 15:25:04 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 2A8B217DB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1603373154;
	bh=1zrJLUZGihno7MsasjqL6qZB/GBG0CJ6ykiSEy7DrHQ=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=cHA35YAQRYX+HAc9I24RyHPr/iBYIz8AgSItnSCpfUbPqPbmuUVdbWYp933WnB9UA
	 2+qbEmN1XwPcOu/QAdcDL9XlD+X0Xdyh6NJpGGnLiFucTynh8X04a8fyH9zDlDYVIZ
	 WTxLzFcnjRSVQKfl6OEswwk8dCn8GrfqD8vPRIAs=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BF8C8F804AA;
	Thu, 22 Oct 2020 15:24:21 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1E5D4F804A9; Thu, 22 Oct 2020 15:24:19 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 36B21F800CE
 for <alsa-devel@alsa-project.org>; Thu, 22 Oct 2020 15:24:15 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 36B21F800CE
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="HtZWIK/f"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="Gm57Q85H"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id CD7C85C008D;
 Thu, 22 Oct 2020 09:24:14 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 22 Oct 2020 09:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=WpxzM5T2oXZM9uNlrwwMMJYM97B
 01sisUMLV0IHjh+4=; b=HtZWIK/fLwEU3KnyBhFBfIhUhQ4LHqKu5DWhaZwuXHl
 +9XGi6p9jxOTbkz6BvsuCH1oiu8BdCKAl0aLc7aRmLgcfZTb28KbC4vZ0MpstX+Q
 9pmC4QUHFpNvcsjINx0s1R0GwCIEOAZlEgNneyunX+rjCc+BhSnbaGohSqU/+MVD
 ookqZ7AaAYTxZuEpKXHAaeg/tcXH7l5grhKxdeWQfnOyNNI3HITpnI8DBByloWv5
 v/sVYjy+2Qs/G5b/Ig7Y3Oino/NO4r3C8D7Bl9oWn/E+dSrZUiudch7Y//FPM7Bm
 +OjBUPDeC6deak9oVI3l4ed0E9WVpXo+QRNRCzvAPew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=WpxzM5
 T2oXZM9uNlrwwMMJYM97B01sisUMLV0IHjh+4=; b=Gm57Q85Hwi4xddGi9Qavhj
 CT/IfjHXHVayE5b+BdSwv3OaI8Xl1QNVUouXZb50qiNbMkD62CUFU1iguDqcejqz
 kBi60h+B+qjb7GMW2+IGRvsiaVUAe6Tt1Zvlci2bestIoZE/4wGA4dj2KVtr8ZJE
 lpb6B9AyyVABSdDE8VexUiE1U0VviuivCWzlWoAKDk2sdwSQRmwCklKvCpS9//GI
 L6yCIE1bCTjuyV58NgF74/LaCXL5gsdPXXmvHjV8beU0j2rxJJJ/WPlrGbeeciCL
 WFz9MEQNSAOAu3A8vKWkFfFXyrVl3wE6FJXnGw6O6FlhPAaYsLlE7FbbjOE9YaAg
 ==
X-ME-Sender: <xms:_YeRXy6ZMaXfp82xdOLIZwt4-d8FV_bWXd7IOsNiLPyMsM_2r3viKw>
 <xme:_YeRX76oG0gcXVW68kXo4JfWFspgUOo3ctRttg5l9lf2v1kAU4Q6oqQGJgcHtSkDV
 f4WvEQpfh-7v7BvcQs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrjeejgdeivdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_YeRXxfl6dfPi6dF8Gk0iK9K_dTuK8DdPDCr_XnSRBiL68JqgacKlw>
 <xmx:_YeRX_KggHoq606HXTB_6IdLDqaLw31dFfE_ufzcbCZDfWIFrlSjQg>
 <xmx:_YeRX2K3uTAUg8ENlwirn7SR-yD3xsQ7heaZIe771OHyvnESYgnRBw>
 <xmx:_oeRX3re2C6qpImTePz1qNECntzKXWXMvLv29TatVriOn8L0hgIlxA>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7C1C23280060;
 Thu, 22 Oct 2020 09:24:13 -0400 (EDT)
Date: Thu, 22 Oct 2020 15:24:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Takashi Iwai <tiwai@suse.de>
Subject: Re: Context expectations in ALSA
Message-ID: <20201022132412.vntap4kfb2aj24qy@gilmour.lan>
References: <20201022095041.44jytaelnlako54w@gilmour.lan>
 <30226f94-72e9-34d2-17d0-11d2501053f0@perex.cz>
 <20201022125741.xxibhwgcr2mhxehe@gilmour.lan>
 <s5ha6webdn2.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="rwqqljnlxayusdb4"
Content-Disposition: inline
In-Reply-To: <s5ha6webdn2.wl-tiwai@suse.de>
Cc: alsa-devel@alsa-project.org, Dom Cobley <dom@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
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


--rwqqljnlxayusdb4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Takashi,

On Thu, Oct 22, 2020 at 03:20:49PM +0200, Takashi Iwai wrote:
> On Thu, 22 Oct 2020 14:57:41 +0200,
> Maxime Ripard wrote:
> >=20
> > On Thu, Oct 22, 2020 at 12:03:19PM +0200, Jaroslav Kysela wrote:
> > > Dne 22. 10. 20 v 11:50 Maxime Ripard napsal(a):
> > >=20
> > > > So, I'm not really sure what I'm supposed to do here. The drivers
> > > > involved don't appear to be doing anything extraordinary, but the i=
ssues
> > > > lockdep report are definitely valid too. What are the expectations =
in
> > > > terms of context from ALSA when running the callbacks, and how can =
we
> > > > fix it?
> > >=20
> > > I think that you should set the non-atomic flag and wake up the workq=
ueue or
> > > so from interrupt handler in this case. Call snd_pcm_period_elapsed()=
 from the
> > > workqueue not the interrupt handler context.
> >=20
> > Yeah, that was my first guess too. However, the DMA driver uses some
> > kind of generic helpers using a tasklet, so getting rid of it would take
> > some work and would very likely not be eligible for stable.
>=20
> Who sets the nonatomic flag for vc4?  I couldn't find the relevant
> code in the latest upstream.

Sorry if this wasn't clear enough, it's not there at the moment, ALSA
takes a spinlock and lockdep complains that we're sleeping in an atomic
context.

I tried to add the nonatomic flag in my tree to see if it was fixing the
issue, but ran into another lockdep complain now with ALSA taking a
mutex in a tasklet.

> Ideally dmaengine PCM helper should support the nonatomic mode, but
> until then, the other side needs to drop the nonatomic flag, I
> suppose.

In this case, I'm not sure the blame is in the PCM helper but if there's
any blame, I guess it's the virt-chan layer inside dmaengine (so for
providers) that use a tasklet instead of something that allows sleeping

Maxime

--rwqqljnlxayusdb4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX5GH/AAKCRDj7w1vZxhR
xepDAP96aJ4MTdcE8LJZ10+kDyzH1UtQlV//DYZWfptlugY+vgEA2+KK5p2ApO4B
kDALlv1Yd5PHZH7QHStcrelNXI69ygs=
=e2G2
-----END PGP SIGNATURE-----

--rwqqljnlxayusdb4--
