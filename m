Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 0326E3AB76D
	for <lists+alsa-devel@lfdr.de>; Thu, 17 Jun 2021 17:27:33 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 469F9176D;
	Thu, 17 Jun 2021 17:26:42 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 469F9176D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1623943652;
	bh=Sj38CVBwD/q4Tn6QawviFV8yZQrOlwmiLUOLqpXxNx8=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=sw8u4AsTJlOvDpPLboznBWnVx+2V4puIPa2bE1EOvXJpsw6WtVDeTjYwUnEDWbpDE
	 4EgB/7HDkmgp5S+8GXV2qlrEU0p/7A3531Duv3J3nPgMCTzBSpKzDf8QeOWPjj04Q6
	 YPULH8OzVFDla3C1fg53P3Y8vLBiojQB+Qq/OqH0=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id F0519F80171;
	Thu, 17 Jun 2021 17:26:04 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52E40F8025A; Thu, 17 Jun 2021 17:25:58 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id C8249F8016D
 for <alsa-devel@alsa-project.org>; Thu, 17 Jun 2021 17:25:51 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz C8249F8016D
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="4GAqFDoM"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="cQUtMz6+"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 0AB605C015C;
 Thu, 17 Jun 2021 11:25:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 17 Jun 2021 11:25:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=Sj38CVBwD/q4Tn6QawviFV8yZQr
 OlwmiLUOLqpXxNx8=; b=4GAqFDoMKYI+3xdwI9qgL3LhOOnO/ZNUTHETJSyyfjy
 CWhlZ1YWKogjvp/NWS8fZ1Vl2Oqynicahj7bElyS9dn7EHf3IUGmVUpSVrbP7ieg
 J1iq36SnNhrfTauW5DhYybpY6pP4CYLVfk8ssBAzCTen+M+agbHaX2GeuaVfeIM9
 MnPK1mjpXt8YeDqaM3QR01ss+Rmn/7v8Lr/cijIWWi06a96f/6u4qeA9fRQbOjrJ
 89KDRHa/DOeGRXpenAz12PI33B8iDYd4g1ZJq6b8jCCQrsRu796S9Y2ZgF9SuQnG
 nHXNZqg93NttaAGpgsFpeOrzL79HeQ61WC6FBmMu51w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Sj38CV
 BwD/q4Tn6QawviFV8yZQrOlwmiLUOLqpXxNx8=; b=cQUtMz6+ZX0c9I3OjL/d06
 9Lh8+i9IkyAqQXFg73POinDg283dPWm+20Yt5zP7LQEBPraF/++D1sAO98RzhYsd
 MoeTR/KjOi+6O8uzkQkmkwzsYHRVvdnadYDMcYpX9Nai2/DBg1TiiO1NilAx2ArL
 SVtbr27Eoqek9cDhGWAeloNQFYTF3HfZo/Gjuhf6vb7BzobwnMAkWlN/vy5Un9xF
 fcO6fP48+UBrwol+gt8mJyAYTmb2Tj9ilYl/+cCGW9RzHx1SYHearNhGfnnlVddV
 N7rlB9Oi+tEo3vhAoz7QT7AaDab0dkVMrcgWjdx2LulEkwfHHDx4QrTnLPJJpsDA
 ==
X-ME-Sender: <xms:fWnLYLaIS9600yDgK-9QdpIs5WJmXT_F9YlCkqATDbYG7qkL75v4UQ>
 <xme:fWnLYKbVuqZ2boRHpUb9i_NiAD84cL2T44K0KUNAUDagP9I5reurRTbgFSIBCb2Xs
 3EclAZZ2_pnORwEJwQ>
X-ME-Received: <xmr:fWnLYN9z6LnOBiRi1DfFvuJNgqlh-DbDWHo7URKMbMBgTTTOpMDFSl9-pxXSrsPxW8DTvhawY7_90DjYKEY7eXqN5aqzg38szUjo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeefuddgkeeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepfeehuddulefgteekfeetfefhueeuteeigedvudekleeikeelhedtteetleek
 ueeunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfhhrvggvuggvshhkthhophdroh
 hrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehm
 rgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:fWnLYBoci3jDebyoWWxtF-AzjkrHRXhOw2zTvPyE52IO66kjvLmylA>
 <xmx:fWnLYGoXtv7WIafqYxwJInYfRcL-nFlQobEkV1p6ecD2VbvPEjwmbg>
 <xmx:fWnLYHTQLw8JIfMxKr1sxluc4Dgj0o-u1sMLMsHrK6ozz7qB71y3GA>
 <xmx:fmnLYN3nIOMM0x86zlv1FLAmacf9tCz4FAJ7b9D5EfNGiF4LTgjN4g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 17 Jun 2021 11:25:48 -0400 (EDT)
Date: Thu, 17 Jun 2021 17:25:45 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: vc4: hdmi: audio: ASoC: error at snd_soc_dai_startup on
 fef00700.hdmi
Message-ID: <20210617152545.slgm5r7y2pur7mv3@gilmour>
References: <612b134c-d356-f027-46d7-322bdaff37a4@i2se.com>
 <20210604090215.cpvoryvwrfzj5ikx@gilmour>
 <c5290159-89a3-3128-c54f-e1174212a893@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="q3o6ybqjwppil4m4"
Content-Disposition: inline
In-Reply-To: <c5290159-89a3-3128-c54f-e1174212a893@i2se.com>
Cc: alsa-devel@alsa-project.org,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Emma Anholt <emma@anholt.net>
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


--q3o6ybqjwppil4m4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Sat, Jun 12, 2021 at 12:04:08PM +0200, Stefan Wahren wrote:
> Hi Maxime,
>=20
> Am 04.06.21 um 11:02 schrieb Maxime Ripard:
> > Hi Stefan,
> >
> > I would assume it's due to this:
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree=
/drivers/gpu/drm/vc4/vc4_hdmi.c#n1083
> >
> > It pre-dates my time working on the vc4 driver so I'm not really sure
> > what this is supposed to prevent, but my guess is that it's there to
> > avoid someone using the audio card before we have a display detected and
> > connected, and its capabilities known (the first and more obvious one
> > being does it support audio in the first place).
> >
> > It's nothing new though, maybe it's the error printing itself that is?
>=20
> i'm sorry, i forgot about this discussion here:
>=20
> https://lists.freedesktop.org/archives/dri-devel/2020-December/292701.html

It looks like there's no discussion on that link, is it the link you wanted=
 to paste?

Maxime

--q3o6ybqjwppil4m4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYMtpeQAKCRDj7w1vZxhR
xXb8APkBObTYDL60D0JYHFhpQEOmcZQK72m+0bKLB15fsvHiPQEAroCeReJ1LM5D
O15ZFpwR7XKy/zq0BXMQnohkX2TJQwI=
=b4vV
-----END PGP SIGNATURE-----

--q3o6ybqjwppil4m4--
