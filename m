Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E6D39038C
	for <lists+alsa-devel@lfdr.de>; Tue, 25 May 2021 16:10:29 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 15E691730;
	Tue, 25 May 2021 16:09:39 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 15E691730
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1621951829;
	bh=fG9+bjskHyzIdnVKRMMi+9/BdHYkAi1Ve+UfTIwjIVA=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rnL/i9COHHfsLY4ZV4AkiIFSjQ4wcjiAxMiCPKYhF4nGLx7P0BrlDNMY490DDWq6Y
	 0KC5C05slfjf6ZoVdVb9P8n+VugH5U/cdCYE++GZT0vKx8NZZAyC/+MEIcnlxQWTw0
	 /fvkbMh4o4iDoccnDlXNpejV+lRadMHeSEy9+ZyM=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 88545F800F7;
	Tue, 25 May 2021 16:09:00 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id 1341DF800CB; Tue, 25 May 2021 16:08:59 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,PRX_BODY_30,SPF_HELO_NONE,SPF_NONE,
 URIBL_BLOCKED autolearn=disabled version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 4ACE0F800AC
 for <alsa-devel@alsa-project.org>; Tue, 25 May 2021 16:08:52 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4ACE0F800AC
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="jmeaga3+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pJL83TGl0mX04nFFBoTwiq0XD/0RboBicSXs5ma3mwg=; b=jmeaga3+cisqWvTamaQfrtT5sJ
 0BZ+PSNAZSnPIDtUOnJugy8lNJeV+TO/j6RYV/Lk1ULVlsxbyLvtdwy0yaIpVcOoUTHHerNvaxoQl
 ILJ9r6bJ6qAXkm/EmMbfL+HvCgRQFHaYXm3lZnNcj55CnESVYK1ExxjtMJwY9PoqBCqI=;
Received: from 94.196.90.140.threembb.co.uk ([94.196.90.140]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1llXjm-005l4l-ML; Tue, 25 May 2021 14:08:51 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 8195DD00386; Tue, 25 May 2021 15:09:24 +0100 (BST)
Date: Tue, 25 May 2021 15:09:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Richard Fitzgerald <rf@opensource.cirrus.com>
Subject: Re: [PATCH 1/4] ASoC: cs42l42: Fix 1536000 Bit Clock instability
Message-ID: <YK0FFJOOalQZKl1q@sirena.org.uk>
References: <20210525090822.64577-1-tanureal@opensource.cirrus.com>
 <d71d321f-1467-f8d6-4d1b-529723404d3c@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ED9N/z5atBV0RZe6"
Content-Disposition: inline
In-Reply-To: <d71d321f-1467-f8d6-4d1b-529723404d3c@opensource.cirrus.com>
X-Cookie: The wages of sin are unreported.
Cc: alsa-devel@alsa-project.org, Lucas Tanure <tanureal@opensource.cirrus.com>,
 Liam Girdwood <lgirdwood@gmail.com>, patches@opensource.cirrus.com,
 Takashi Iwai <tiwai@suse.com>, James Schulman <james.schulman@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>, linux-kernel@vger.kernel.org
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


--ED9N/z5atBV0RZe6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 25, 2021 at 10:12:39AM +0100, Richard Fitzgerald wrote:
> Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
>=20
> On 25/05/2021 10:08, Lucas Tanure wrote:
> > The 16 Bits, 2 channels, 48K sample rate use case needs
> > to configure a safer pll_divout during the start of PLL

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--ED9N/z5atBV0RZe6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmCtBRMACgkQJNaLcl1U
h9BkRAf8DQK0EW13T9xELk3PoeaZqHPbZt7haB9ejlDgKLlMXqpQ6vC3509HUk/O
voRWJA7yr4Yt+jXhDXyU5t8pjfb0ImEpRw2+NHOBduU2DQa8E6tWG1i/pX3mnryj
KJEFPnkltiioD6htW6IfJDa48Sg8QQchInpp8buEK70563OSa17FDw01qRNwFfkl
w+gdE4EG31pVd6rvM45R0mwzYwLBKLGiIyx7YeD/NjR/NkqWW31g5WXMEBvXfrdi
jI9ZnVMBWG+oMQ8SBmU5vmxyjDVaTb6kVQBDiUJ73+hjHVS/imJFMPl9Krn7dDYm
JOaBbZqSv896Y+l7GUkS7IXlcCQwiA==
=Jd8O
-----END PGP SIGNATURE-----

--ED9N/z5atBV0RZe6--
