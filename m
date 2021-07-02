Return-Path: <alsa-devel-bounces@alsa-project.org>
X-Original-To: lists+alsa-devel@lfdr.de
Delivered-To: lists+alsa-devel@lfdr.de
Received: from alsa0.perex.cz (alsa0.perex.cz [77.48.224.243])
	by mail.lfdr.de (Postfix) with ESMTPS id D26F03BA037
	for <lists+alsa-devel@lfdr.de>; Fri,  2 Jul 2021 14:10:21 +0200 (CEST)
Received: from alsa1.perex.cz (alsa1.perex.cz [207.180.221.201])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by alsa0.perex.cz (Postfix) with ESMTPS id 50C29167A;
	Fri,  2 Jul 2021 14:09:31 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa0.perex.cz 50C29167A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=alsa-project.org;
	s=default; t=1625227821;
	bh=tn35gL3nzkU8srsc5/dwE9DL/VYFJJK7rHv1yi9kEYY=;
	h=Date:From:To:Subject:References:In-Reply-To:Cc:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=in5Bc/UjUQ9P07btV+4Fo1GtXgbSJlBEAVtBaWTHE8lBX+Ch0M57noUEd3r1NvLlN
	 TSTVQoEO7vTIuI757EMp9O0eVT8VtCqs3gtF38QLD9AN7IgES/Fc+HTp7Do1AsdBV/
	 4lXP87vgSOfQDFGUNBF06i7zPw167ldwsBaLoFOA=
Received: from alsa1.perex.cz (localhost.localdomain [127.0.0.1])
	by alsa1.perex.cz (Postfix) with ESMTP id CF340F80240;
	Fri,  2 Jul 2021 14:08:52 +0200 (CEST)
X-Original-To: alsa-devel@alsa-project.org
Delivered-To: alsa-devel@alsa-project.org
Received: by alsa1.perex.cz (Postfix, from userid 50401)
 id DE409F80229; Fri,  2 Jul 2021 14:08:49 +0200 (CEST)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on alsa1.perex.cz
X-Spam-Level: 
X-Spam-Status: No, score=-0.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_NONE autolearn=disabled version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by alsa1.perex.cz (Postfix) with ESMTPS id 0F483F80165
 for <alsa-devel@alsa-project.org>; Fri,  2 Jul 2021 14:08:43 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 alsa1.perex.cz 0F483F80165
Authentication-Results: alsa1.perex.cz;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.b="uW/bzytT"
Received: by mail.kernel.org (Postfix) with ESMTPSA id C651361425;
 Fri,  2 Jul 2021 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625227720;
 bh=tn35gL3nzkU8srsc5/dwE9DL/VYFJJK7rHv1yi9kEYY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uW/bzytTgtVhAc0zBr0SpxD9EdNu7mW0ZSPMy+JU9dWSwMz207jM58VIaz7VOfg7X
 x3cBsqADz1X33nRW4Y7DfPH/GMXf1QUqn4CInMsttLGTYA3NY3CxCAeGUsH61IJFmd
 lz9N8R6BUze9zRe4yNIl+XFcSEbgOdpXtMmAnwMMn29Uiz2GJ9lW7vGdU/oR0pXx4D
 iOW7Yl0Y+8odfJz8oLHkT3+UK6+zGyEoPyOMv32h6DNlGBlEiyYaPxz/NEtDvVQ4V9
 6NiWhONdi1ApOmQjkw6UAKxoNFZ5zeK6V8LLNBUIJa6eAPfTse6fxppRcv+uLzhqIG
 J3bda77diKxng==
Date: Fri, 2 Jul 2021 13:08:10 +0100
From: Mark Brown <broonie@kernel.org>
To: David Rhodes <drhodes@opensource.cirrus.com>
Subject: Re: [PATCH v2 1/2] ASoC: cs35l41: CS35L41 Boosted Smart Amplifier
Message-ID: <20210702120810.GA4416@sirena.org.uk>
References: <20210629222719.1391653-1-drhodes@opensource.cirrus.com>
 <20210629222719.1391653-2-drhodes@opensource.cirrus.com>
 <b14da5ca-2b5a-43fc-11bb-7f87c873d3c4@linux.intel.com>
 <4d1a88a1-a61b-a14a-a9f1-66101277e8c2@opensource.cirrus.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="PNTmBPCT7hxwcZjr"
Content-Disposition: inline
In-Reply-To: <4d1a88a1-a61b-a14a-a9f1-66101277e8c2@opensource.cirrus.com>
X-Cookie: What!?  Me worry?
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: robh@kernel.org, brian.austin@cirrus.com, ckeepax@opensource.cirrus.com,
 alsa-devel@alsa-project.org, patches@opensource.cirrus.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 david.rhodes@cirrus.com
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


--PNTmBPCT7hxwcZjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 01, 2021 at 03:22:53PM -0500, David Rhodes wrote:
> On 6/29/21 6:51 PM, Pierre-Louis Bossart wrote:
> > > +static irqreturn_t cs35l41_irq(int irq, void *data)
> > > +{
> > > +	struct cs35l41_private *cs35l41 = data;
> > > +	unsigned int status[4] = {0, 0, 0, 0};
> > > +	unsigned int masks[4] = {0, 0, 0, 0};

> > are those inits necessary, you override them below with the regmap reads?

> This one gets flagged by static analyzers so I'd like to keep the inits

That sounds like you have an actual issue and you're just shutting up
the static analysers, not fixing whatever they were telling you.

--PNTmBPCT7hxwcZjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmDfAakACgkQJNaLcl1U
h9Cbtwf9HrqVE23nT70GYcN0ws4CwMZ9A7DyKiOF7h2YsZkUV0EDzkTFKcTLkYFW
H4dZJGNAXAt0+CKiXTMJfFxcVPjUZK8eN9mYs9NKRhgQVLD9DBFSPrnyAUKQ+8b9
CSFMPXa09qQIMJPBta5Iv44jd5Rc0r0UhkamV/h8NuzBXVeENzv4W+rfL2gLKlEw
8DsSyC+tC6p7WTyxxHB9Iox4QASXEt6QKjcGuA+gYyanKoLCBL7SnYGKG0Ccg3JZ
JY4LxTA641pskfl8MQCgKtcXRxxhgp++FU8M7UY+A/kbYhbwuYAkr6gKfjSJHEAQ
BnkvYRRE4VdJ1H7qm/DnbG3gNZ524g==
=w4KA
-----END PGP SIGNATURE-----

--PNTmBPCT7hxwcZjr--
