Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 132AB166777
	for <lists+alsa-devel@lfdr.de>; Thu, 20 Feb 2020 20:48:12 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id B0316169F;
	Thu, 20 Feb 2020 20:47:21 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz B0316169F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1582228091;
	bh=UmTOehUYik3GEC/kCFIcKCrKniVLy5goVYP5EfoTz5c=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=l3ZpjpjTYMzh6kDzr6WW1POJgGBzZJCa9laUrMX1+f7ifXwlqxh+pZ4MiqQo6soZM
	 HTow0iAWGcHac8OV7Jqb85OqlRHqCG0Wzg44R3RTqo55++9Ijfts3YYXePXM0GmN7v
	 pYRagpIvW8efn/Oaznh7peR7hWWmLkxXi1f7IhOU=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id BB768F8011D;
	Thu, 20 Feb 2020 20:46:30 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 9224EF80148; Thu, 20 Feb 2020 20:46:27 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 1C25CF80101
 for <alsa-devel@alsa-project.org>; Thu, 20 Feb 2020 20:46:24 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 1C25CF80101
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 22FF830E;
 Thu, 20 Feb 2020 11:46:23 -0800 (PST)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E3C23F68F;
 Thu, 20 Feb 2020 11:46:22 -0800 (PST)
Date: Thu, 20 Feb 2020 19:46:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] ASoC: dt-bindings: renesas,rsnd: switch to yaml base
 Documentation
Message-ID: <20200220194620.GK3926@sirena.org.uk>
References: <87d0ahzr9d.wl-kuninori.morimoto.gx@renesas.com>
 <20200219161732.GB25095@bogus>
 <874kvmt355.wl-kuninori.morimoto.gx@renesas.com>
 <CAL_Jsq+VEQj9Nkyo_85RM3Ku1-D73_ot5BTAjidnJzJv7r1_Sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YZQs1kEQY307C4ut"
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+VEQj9Nkyo_85RM3Ku1-D73_ot5BTAjidnJzJv7r1_Sw@mail.gmail.com>
X-Cookie: You are number 6!  Who is number one?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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


--YZQs1kEQY307C4ut
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Feb 20, 2020 at 01:33:56PM -0600, Rob Herring wrote:
> On Wed, Feb 19, 2020 at 8:16 PM Kuninori Morimoto

> > > > +  clock-frequency:
> > > > +    description: for audio_clkout0/1/2/3
> > > > +    $ref: /schemas/types.yaml#/definitions/uint32-array

> > > This already has a common definition and this conflicts with that.
> > > 'clock-frequency' is a single uint32 or uint64.

> > This needs clock array. Like this

> >         clock-frequency = <12288000 11289600>;

> Sorry, but the type is already defined in the spec. You'll still get
> warnings from the common schema and you can't override that here.

> Not sure what to suggest. Leave it with a fixme or move to
> assigned-clocks-rates instead?

Given that this is an existing schema we should really try to keep
compatibility :/

--YZQs1kEQY307C4ut
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5O4gwACgkQJNaLcl1U
h9DpNgf/T3NsUyExFf1KBDaf9LwB98JuIJZnPVN3szC+niqpV7pWTCL40vzSBGiV
SSlCDGxnMV1mmFT1H6Mv+NWj/E9qf5ech4MVE/LdO6oeRfJ6vlJOhtRVGw9gZz9l
0Jr+r4FrM/F4s+SiCJRpB9bpdBra89Rqy6hMftuOTYORGm4+F+gLM2wMiO0qS7Ro
zVUinC0Toc+WXk2AVK8G2UrErAI9FdZRMXZYXyAYrWk/5cDQXVkWaifVwelDTyy8
INeT1Y0DBOZ1t1In/sJAiw2OL/C+PDxoUE4znyjw53rNB48C0NSVt1XQOyjcXX0o
d5yXeMAnmkXID2NzRS4q3H3OmyN3/w==
=dMJr
-----END PGP SIGNATURE-----

--YZQs1kEQY307C4ut--
