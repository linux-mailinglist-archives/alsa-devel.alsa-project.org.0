Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A593338C24
	for <lists+alsa-devel@lfdr.de>; Fri, 12 Mar 2021 13:00:49 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 8D1C416FE;
	Fri, 12 Mar 2021 12:59:58 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 8D1C416FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1615550448;
	bh=IBDqJoDaZNbdtN7kKbweSS8qcSuhdTfquftSiElde+A=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=BEm+zXCDT05GJPoJ8XVXy+UqX0h8E/zTx5jx3gNOJ5i7t2rF1XCDwRfFqQM1sumiM
	 1BObedk7ZWFMCGP0fCheNYTKcq6SSWEL5TRyx+6WhG2dMpmGTGO3EPYu/rTwuxIo6v
	 9qR8/k6RsYPisTW1joAKRnsKtiq00EmzKhCKxL+I=
Received: from vmi242170.contaboserver.net (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id C9A4FF800AB;
	Fri, 12 Mar 2021 12:59:17 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 52CB2F801D8; Fri, 12 Mar 2021 12:59:11 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id A5F36F800AB
 for <alsa-devel@alsa-project.org>; Fri, 12 Mar 2021 12:59:03 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz A5F36F800AB
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="u6n+XCDb"
Received: by mail.kernel.org (Postfix) with ESMTPSA id 25FA864F8E;
 Fri, 12 Mar 2021 11:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615550341;
 bh=IBDqJoDaZNbdtN7kKbweSS8qcSuhdTfquftSiElde+A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=u6n+XCDbYLNLeYGMmRYHLTbBSm6rGBN2hxCrMt8xsFNTIkESm+PK7Km5qeiET27/b
 G3n0ab2FeGl837QnaaKEmoZxXzJIcX3K01tD9afHx3X1XgYjk8nn8nom4KycNOwTr5
 /ncCfv2GrQGoug6kLO6fZ6EUFvQqsxA7k3qcdnsAIhIQHxfZGrJ1UJH8oEQ8n9wNkV
 jD+Rzbm5/gD3jgNm9p5REut5gHb48pF27PS5jSo+bAqa6R/jgpDP0nIeeAGJrPi9IR
 1CJD/O4LPRI0vX4fc0uYwrg6nsGlMZSaLhxS0AQ6GNDddqjsTdLEbcVgxaXz9tJFGv
 PS+fmlWjcG1fw==
Date: Fri, 12 Mar 2021 11:57:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Subject: Re: [PATCH] ASoC: core: Don't set platform name when of_node is set
Message-ID: <20210312115748.GC5348@sirena.org.uk>
References: <20210309082328.38388-1-daniel.baluta@oss.nxp.com>
 <20210309153455.GB4878@sirena.org.uk>
 <CAEnQRZB_VgsEPYgxtWQWUgs2+noRt1AMMHf2crJ_9Hg7s7NJ0Q@mail.gmail.com>
 <20210312104931.GA5348@sirena.org.uk>
 <CAEnQRZDe_Q-N7L_7z7aVz1o3guKd6R+WFrOfT9KPbggJP8SPZw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="32u276st3Jlj2kUU"
Content-Disposition: inline
In-Reply-To: <CAEnQRZDe_Q-N7L_7z7aVz1o3guKd6R+WFrOfT9KPbggJP8SPZw@mail.gmail.com>
X-Cookie: Lake Erie died for your sins.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, dl-linux-imx <linux-imx@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
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


--32u276st3Jlj2kUU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 12, 2021 at 12:59:29PM +0200, Daniel Baluta wrote:
> On Fri, Mar 12, 2021 at 12:50 PM Mark Brown <broonie@kernel.org> wrote:

> > If an explicit name has been provided why would we override it with an
> > autogenerated one?

> Wait, are you asking why the initial code:

>   dai_link->platforms->name = component->name;

> is there in the initial code?

No, just the opposite!  If there's an explict name configured why do you
want to ignore it?

--32u276st3Jlj2kUU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmBLVzsACgkQJNaLcl1U
h9A8Gwf/RHWQwo8AjQuTNGA5yI1bywJOF8ecu7LHu7DhZ/ZApBvED6dbYKVaxcRH
UCZqf6UA6hGB+RvdAcf/Y9/RT4aJ8eSfILl3P6PV1SdY2YkoRL3PU1Q84fUeYLIa
JSM580kmhRnsLp7/riyh+WCS/EPHcrjXGJ57wdLhGSvKk2yjjsQ1sIvbkxWBAyuW
+OBBu1a0V0gOoMlrZtzkYAu8k0VJZfWFwYCCfxD9+CPF9Bbghu670m2rZgmNQZ9y
cXSeQvWL53LFCjSV0ZX1ydQ5VBgdFovl7TCOqRQaX7C+6584yaO3jqVP6joLTQBK
8X7mF0a189/KhC99B3RDNNs6Qkw/hA==
=d5xv
-----END PGP SIGNATURE-----

--32u276st3Jlj2kUU--
