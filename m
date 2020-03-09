Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D5E17E12A
	for <lists+alsa-devel@lfdr.de>; Mon,  9 Mar 2020 14:28:38 +0100 (CET)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 11C981669;
	Mon,  9 Mar 2020 14:27:48 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 11C981669
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1583760518;
	bh=XwOj/Fq7pJa3hdSOHycHp5sHElq2J4GoqKSBoBad8Qk=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=O9HwU2EeQ2com7wM4lHcz0aTR9Nr62Dq+NAR0enYWxLB1T6vFGeC8GD7yW/O/d2Lb
	 /kwgt+egQQLJOJy1fKeS7PdsbYRSoHWkjPt79SczXxZve7R0wwWJC24VXlnBvsEp9Q
	 mKJsosOwVmrA7JD/uIfnGFkj1DcrF0+Dske25DFE=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id 19BA6F800DA;
	Mon,  9 Mar 2020 14:26:57 +0100 (CET)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id C3496F801EB; Mon,  9 Mar 2020 14:26:55 +0100 (CET)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by alsa1.perex.cz (Postfix) with ESMTP id 4B7BBF800DA
 for <alsa-devel@alsa-project.org>; Mon,  9 Mar 2020 14:26:52 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 4B7BBF800DA
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A36DD30E;
 Mon,  9 Mar 2020 06:26:50 -0700 (PDT)
Received: from localhost (unknown [10.37.6.21])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 26E5A3F67D;
 Mon,  9 Mar 2020 06:26:50 -0700 (PDT)
Date: Mon, 9 Mar 2020 13:26:48 +0000
From: Mark Brown <broonie@kernel.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/6] dt-bindings: sound: Convert jz4740-i2s doc to YAML
Message-ID: <20200309132648.GG4101@sirena.org.uk>
References: <20200306222931.39664-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Y+xroYBkGM9OatJL"
Content-Disposition: inline
In-Reply-To: <20200306222931.39664-1-paul@crapouillou.net>
X-Cookie: Above all things, reverence yourself.
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, od@zcrc.me,
 Zhou Yanjie <zhouyanjie@wanyeetech.com>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>
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


--Y+xroYBkGM9OatJL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 06, 2020 at 11:29:26PM +0100, Paul Cercueil wrote:
> Convert the textual binding documentation for the AIC (AC97/I2S
> Controller) of Ingenic SoCs to a YAML schema, and add the new compatible
> strings in the process.

Cleanup and new development patches like this should always come after
any fixes to ensure that there are no dependencies which would prevent
fixes being merged as such.

--Y+xroYBkGM9OatJL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl5mRBcACgkQJNaLcl1U
h9BiJwf+Pe/BdGSq2c2anqasfwrrUL4Abk4Cu+i1KO6pNmEVWD+KFE9ZvRA3YPSb
lEPhE+2LfrkoEBPPx6mWVpvl28egf0kwTsX6tynIJsQi+eL1qlRr2fLfvKCEQzVL
/OAnAMJVXJgSg+wF+p1/Fjv69bkPJUBPX+OK6ooyQNUraG//rSygcKSBtrdvzZOE
vg02RvfhG9cp1JnhfW6uP7xwG+ISdzyQyDePpgHO1fFPhqUTlM95xRNTUzGGJo/L
E+5Smb+rEKN3QRWa+J9Nynvrb+zdHtYMrmr/Hi1THgSsUiqfvNlfraITOiiUDCbj
Rkbg8Bq3JOOSyC9jcOUzTQw3EJhK6g==
=40Z2
-----END PGP SIGNATURE-----

--Y+xroYBkGM9OatJL--
