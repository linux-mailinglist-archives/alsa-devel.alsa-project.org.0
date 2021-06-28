Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF6C3B5DFE
	for <lists+alsa-devel@lfdr.de>; Mon, 28 Jun 2021 14:30:38 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 479BD167D;
	Mon, 28 Jun 2021 14:29:48 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 479BD167D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1624883438;
	bh=85l5wyrKT7thqq8um5ZxxJC1O9KGWQen9qitnDrdMUE=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KGU8pM41j1FBTkc1zftLXn21caEvUXWWWfVL+KHWRH72CejC6eDvyGZWuBo8NaQbT
	 XR2Z8PqKcSq5MThq8KHs0rN9rDGQ0E8siTQOufhEVmNP6bI84oTjqfdXCwnCJ65EMk
	 DhbaFkRafzE62559cP5cPR2a1tJPxJeokji7TZn4=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 54CA5F80257;
	Mon, 28 Jun 2021 14:29:09 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 7D6DDF80229; Mon, 28 Jun 2021 14:28:54 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=disabled
 version=3.4.0
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 9D31FF8012A
 for <alsa-devel@alsa-project.org>; Mon, 28 Jun 2021 14:28:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 9D31FF8012A
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=cerno.tech header.i=@cerno.tech
 header.b="SrdZLVw0"; 
 dkim=pass (2048-bit key) header.d=messagingengine.com
 header.i=@messagingengine.com header.b="TNBcQBgS"
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 968F05C0160;
 Mon, 28 Jun 2021 08:28:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 28 Jun 2021 08:28:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=85l5wyrKT7thqq8um5ZxxJC1O9K
 GWQen9qitnDrdMUE=; b=SrdZLVw0sbHy38Gs4HG9zHRxEAQQVqyhls84fV42gJe
 RYiFrbbHVbrp9cS+s2WCwSVyCqUDzJy1WXMScOVU+ap/TmSz+qqTAE284eeVaiZ2
 8v9bsvKFUQGG+2pS1ntzbCNXfvWG2cOhLYu6eTCrp2eKUIJDeUvkydIRUWEDHLK2
 +6R2pb8vAI6DGqnRmyAQQCH2N5DoEoUeYEkPt5pHOxRCJ2TpUHI13djEfiZ0hJq5
 BmC74CyuCLzvv0NjJDK6RaYBgyFuhjxKkw7fzRuigJGyfPzz1aAVeZ8PyLIVs4F3
 f4Hp6/2KQw4F1fiAMPMQuBkb0m8p7LYMbvqnfbytsag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=85l5wy
 rKT7thqq8um5ZxxJC1O9KGWQen9qitnDrdMUE=; b=TNBcQBgSapO1QLA1i4f13H
 19V2o9s1OXVL4nB4LdR2yyw6leNjxGxfQVSLEqm73ECt7hBN+PXZnWcrCr0bKxHT
 x2Qmcc9i8zFGVt20v/fjloLm2VSL3gnRVzYJnaUlOV40oUgetJ+27xqcmsphs4E7
 uxQynicN9vpChRrY4UPv+SY0qVS69Min5c2+zQsEefTYyIY2bKhJkiZCTB4pyap4
 dkkESYgXHzVqDa9ZPR+lGGcUR+XPIl5JhxojRO1FPQiZwiPGdpd2vgTSxRE775DR
 nVyOzjkx4RFTVO+ZMF5fRlajnDkpIWGhSFSvYfYlYYa3PS5KKWRqGa0BRrfmyQ9Q
 ==
X-ME-Sender: <xms:dsDZYAszrChy3YByhmGFilWAPbqkejF94pcdSLRiJTtaCGnFIR8LMw>
 <xme:dsDZYNe5R-fP6qxh6_xJ213-k9zF9M2AU-jQ08tiOlYYsn39JOkroe0A42telywTE
 SsYP_BkZWjDx6S-w2E>
X-ME-Received: <xmr:dsDZYLyiFabnG_jG71tFZAgwVJ79S62nmECgLyyIc0l6jnFcDCxRJoCIAO9HHxW_Hwkbkx38P43fpOwOn3aLgvs5Q1GXw5G-ylVW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeehgedgheduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
 htvghrnhepueevtdetjeevkedtledtheffvdektdeljeeffeefudeikefhudelueekjeff
 ueeknecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpfhhrvggvuggvshhkthhophdroh
 hrghdpshhpihhnihgtshdrnhgvthenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:dsDZYDOennnrMAruRpXZ7wSUgnONn7wAY5MKezWndoZG2Sh74C46kQ>
 <xmx:dsDZYA_y8pecE2Y9ax_ieCgYE3AKDQ-OnpaX9qxvy8s7nmEj9l8pCA>
 <xmx:dsDZYLUmpaAkTkWysRjMFr2hE79dCDAaDgTvYrGxWaQeUfRZFoIMnw>
 <xmx:d8DZYCKSnoTWavQcdfo-JxOPjSQyQC8bCcwP5Vf8LxrVMd3rXc-Jfg>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Jun 2021 08:28:38 -0400 (EDT)
Date: Mon, 28 Jun 2021 14:28:36 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: vc4: hdmi: audio: ASoC: error at snd_soc_dai_startup on
 fef00700.hdmi
Message-ID: <20210628122836.opxopzf7wtvurzhd@gilmour>
References: <612b134c-d356-f027-46d7-322bdaff37a4@i2se.com>
 <20210604090215.cpvoryvwrfzj5ikx@gilmour>
 <c5290159-89a3-3128-c54f-e1174212a893@i2se.com>
 <20210617152545.slgm5r7y2pur7mv3@gilmour>
 <45e55e16-6bb7-5d82-1031-db5deaee68ab@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="6bkz65ocgd2olssr"
Content-Disposition: inline
In-Reply-To: <45e55e16-6bb7-5d82-1031-db5deaee68ab@i2se.com>
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


--6bkz65ocgd2olssr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 17, 2021 at 07:41:09PM +0200, Stefan Wahren wrote:
> Hi Maxime,
>=20
> Am 17.06.21 um 17:25 schrieb Maxime Ripard:
> > Hi Stefan,
> >
> > On Sat, Jun 12, 2021 at 12:04:08PM +0200, Stefan Wahren wrote:
> >> Hi Maxime,
> >>
> >> Am 04.06.21 um 11:02 schrieb Maxime Ripard:
> >>> Hi Stefan,
> >>>
> >>> I would assume it's due to this:
> >>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tr=
ee/drivers/gpu/drm/vc4/vc4_hdmi.c#n1083
> >>>
> >>> It pre-dates my time working on the vc4 driver so I'm not really sure
> >>> what this is supposed to prevent, but my guess is that it's there to
> >>> avoid someone using the audio card before we have a display detected =
and
> >>> connected, and its capabilities known (the first and more obvious one
> >>> being does it support audio in the first place).
> >>>
> >>> It's nothing new though, maybe it's the error printing itself that is?
> >> i'm sorry, i forgot about this discussion here:
> >>
> >> https://lists.freedesktop.org/archives/dri-devel/2020-December/292701.=
html
> > It looks like there's no discussion on that link, is it the link you wa=
nted to paste?
>=20
> it was the right patch, but the discussion get lost because of turn of
> the year. Next try:
>=20
> https://www.spinics.net/lists/dri-devel/msg284535.html

It looks like Mark wasn't particularly on-board with that change though :/

I'm not really sure what to do with it, really. The only issue I'm
seeing is that there's some logging that doesn't look too nice. Is there
anything else?

Maxime

--6bkz65ocgd2olssr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYNnAdAAKCRDj7w1vZxhR
xSt0AQDwlBfQs+NVVCbsSsCtAkc/UA+EeBR2cqs+Jd7mF9x68wEAuTvFlfADMxHO
fhxC5a9pqRPXf0MFBR9x5bAN2EbEwAU=
=wrZD
-----END PGP SIGNATURE-----

--6bkz65ocgd2olssr--
