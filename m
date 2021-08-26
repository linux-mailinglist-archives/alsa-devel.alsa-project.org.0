Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 557CA3F8B6D
	for <lists+alsa-devel@lfdr.de>; Thu, 26 Aug 2021 18:00:54 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id EB6DF16C8;
	Thu, 26 Aug 2021 18:00:03 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz EB6DF16C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1629993654;
	bh=5YWA4OfG8tuW7o1qbDSk+JhOTMQXuWG/jOgz29qp418=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=FC/yMevgENattRedg7IdlCB0bo9aeSvZx5GQjhcyU1aaNjNlhOxXvpkpXO+f3DK1E
	 Z+7Ced6b4KKahZN1ux6qjSwziMlERqHVfQIT8oPiQpedlfBLrJcQErwQKgamPgTBpd
	 nL0GYXNvdf1wRaj0eS7ebGVkua+VYPbwKv/XJKCY=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 52155F80224;
	Thu, 26 Aug 2021 17:59:36 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id B3C92F801D8; Thu, 26 Aug 2021 17:59:34 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,SPF_NONE autolearn=disabled
 version=3.4.0
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [172.104.155.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 504A0F800FD
 for <alsa-devel@alsa-project.org>; Thu, 26 Aug 2021 17:59:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 504A0F800FD
Authentication-Results: alsa1.perex.cz;
 dkim=pass (1024-bit key) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="F9ngiYuF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uL5vfEwr2WigDObDrhULFOFtOV6tp1kXQN1wFhcEZS8=; b=F9ngiYuFosmnUoQseSs+POC1wl
 7/p4Z+ARUpFaN38TNLdW/PSlg6NIK7QgJdij8xumYvUdqtAaYf1iJ48psnbI5ECmDDeBA8afnMNP+
 iDH6HCzhfGy5+uiaeXLBhLtx7MxxJT+VJqKN+rmQ42RIyRxtue8sgaOOMi1fHCzGC4p0=;
Received: from 94.196.67.80.threembb.co.uk ([94.196.67.80]
 helo=fitzroy.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <broonie@sirena.org.uk>)
 id 1mJHmq-00FUer-5h; Thu, 26 Aug 2021 15:59:28 +0000
Received: by fitzroy.sirena.org.uk (Postfix, from userid 1000)
 id 25A79D01AC2; Thu, 26 Aug 2021 16:48:53 +0100 (BST)
Date: Thu, 26 Aug 2021 16:48:53 +0100
From: Mark Brown <broonie@kernel.org>
To: Tzung-Bi Shih <tzungbi@google.com>
Subject: Re: [PATCH] ASoC: dt-bindings: mediatek: mt8192: re-add audio afe
 document
Message-ID: <YSe35dOicFFDiXAy@sirena.org.uk>
References: <20210826141314.3720975-1-tzungbi@google.com>
 <YSevGntb3mmYlZGE@sirena.org.uk>
 <CA+Px+wWr99PxEz6qROhj7H8LXFiRZ1sxrn-BcB7ZODJA1Suh+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="YzpHw64aXvjaQKnF"
Content-Disposition: inline
In-Reply-To: <CA+Px+wWr99PxEz6qROhj7H8LXFiRZ1sxrn-BcB7ZODJA1Suh+A@mail.gmail.com>
X-Cookie: I can relate to that.
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, robh+dt@kernel.org,
 Jiaxin.Yu@mediatek.com
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


--YzpHw64aXvjaQKnF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Aug 26, 2021 at 11:28:15PM +0800, Tzung-Bi Shih wrote:
> On Thu, Aug 26, 2021 at 11:19 PM Mark Brown <broonie@kernel.org> wrote:

> > > The dependency has merged.  Re-adds back the document.

> > What is the dependency and where wsa it merged?

> The context is in the original email after "---".  Do you think it
> needs to be part of the commit message?

I was looking for a description of what these things are and
where things are in words - I'm on a train with spotty network
access which makes them not as useful as they might be.

Please include human readable descriptions of things like commits and
issues being discussed in e-mail in your mails, this makes them much
easier for humans to read especially when they have no internet access.
I do frequently catch up on my mail on flights or while otherwise
travelling so this is even more pressing for me than just being about
making things a bit easier to read.

--YzpHw64aXvjaQKnF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmEnt+QACgkQJNaLcl1U
h9CBVwf5AXb06SsToU0IxExtwACFaktJrMHHAkc+VOtxnyEJqt5jGgQvpG6THAUA
NJDsJ0NpxR119GPqMA3sOwxC/tbpIR6nUXl4c+UQHlp2+IfQVUzXPWMnR8fhX3Kt
y5VFZsz2muIbSRvRoBHH6iIlzJVceVwOrJGTd5BvMB2O4rErcjTWiUruGp6Yf8AX
v9wcffXQB6Ofgvew+3TXlma7dK3C5CQHl2Dd0BfsI/fPGYq4j/oqnWCUqVTDKnN9
U40OpstBsZ2xUxoxQ/XgxdyOdtp8Xe1CmbJquYGO8o8nf0Sl3YVMcC3U9hcG9YUW
QYl9jn3BDEAnKY0uBHKimmdQUUJ7Uw==
=91jm
-----END PGP SIGNATURE-----

--YzpHw64aXvjaQKnF--
